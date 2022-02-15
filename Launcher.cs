using Godot;
using System;

public class Launcher : MeshInstance2D
{
    private const int FORCE = 1700;
    private const float TORQUE = 200.0f;

    var PackedScene marble = ResourceLoader.Load("res://Marble.tscn") as PackedScene;

    public override void _Process(float _delta)
    {
        if (Input.IsActionJustPressed("ui_accept"))
        {
            var RigidBody2D _marble = marble.Instance() as RigidBody2D;
            AddChild(_marble);
            private var float _launchforce = FORCE + RandRange(0,200);
            _marble.ApplyCentralImpulse(Vector2(0, _launchforce));
        }
    }

}