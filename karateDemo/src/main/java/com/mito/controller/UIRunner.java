package com.mito.controller;

import org.junit.Test;

import com.intuit.karate.ui.App;

public class UIRunner {

    @Test
    public void testApp() {
        App.run("src/test/java/Header/Headers.feature", "mock");
    }    
}
