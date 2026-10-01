Received: from mail-oo2-f42.google.com (mail-oo2-f42.google.com [74.125.231.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6932F495ACA
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 07:25:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790839513; cv=none; b=D6uOe3BhIS+sz50NdvspMnBkLaENqq1b2HbIo1/ViBXaHBzYq08xIlorvGs41OyjvOsZQYcLNsXgAJH/nMVYXA2P4H2zvQXqzHiCUtU/EuLGJbUlKOZmyn7Xyb7Fb1U/SgPEQs34hTFXmZDmXqWR9wbFP6LJziVvFgyCaW38BoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790839513; c=relaxed/simple;
	bh=JfBkkHgZiIkkSz4rA7SyKB1ygthlO/1JZwHYjPy8It0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=bkD4V3gNjji+Nti0cW4OdidqijJ0QUDP7trFDXlH/gWw4Ehbuckg189FEj6q5Ke9P0aglSqOozvcnROx76Gn6eGJBgipJZ4/OyryS06HqEZG6Ats5DLxLz4xdeSbdS3RcWdNbcoPtSIWDCiJr2w+DgR6UaJEbObvii3Ip1Z3uuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IA9zIMur; arc=none smtp.client-ip=74.125.231.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IA9zIMur"
Received: by mail-oo2-f42.google.com with SMTP id 46e09a7af769-81adacb0f81so1099437a34.1
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 00:25:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790839504; x=1791444304; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=kaT9y/FLNptdflfoU99H0BfFB3r6Sc/0PbsEzk52HW8=;
        b=IA9zIMurPQEqUp8O44T+Vbu/3yliKz9Ck6Egl/Y1aJY8/L4kiPfwytiySBd2seFmS3
         g5YNjN6y9XZhs2AHBY/ExJHdJrkj6CzoPjaVnj4JVSp+8u3j8ePfj7ApB3Y44IxyoMYV
         iLkDWR6SqkLEEY1umpnyRZnATgcQGgc5971ZQpfjkSjLcJkG0NH8dciG8n/ji3LET+v8
         jvjEDG3+RQcm5pOv81SrVCi0Aq9kX6EeXaVR//OA3Ia0WGkbzJqWhZoWcX6Jm7UpvoYS
         c2GemxEmA8DWLm3WKyK/+ClcEQkVpGFQHZkWXPgQoNKGm+4Qmh/jAG3AwHk31daN83rj
         Z8vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790839504; x=1791444304;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=kaT9y/FLNptdflfoU99H0BfFB3r6Sc/0PbsEzk52HW8=;
        b=CJyjGMw2mjipDynAGR3XqrjDHj5Pt22m/mFTBJzAptWmzEL76GcXnsF8hy73CbBHXx
         sNJVaJy4sdWj0Ro/23T6m89nJGioKq2Uoqax7mO6nn/Ozm/PY+d4yvswMFQB0ipdjfPI
         w/7Qb306+vmqYA5xaTnnWw6hlSO+IK+m6HgVZM3FXmvGzIkC6QhSn88TZUQbren25omf
         wgtKSW2uhM1bjoerYlIsneHPOi3HFpU9qHdZ9kCekjbUZgR1bVqwF7Znv27nZ8oD+gIo
         zl6ZurEftm9Qmgz1LvbcjojlhELzn+NwDE/e3dG+9B9Y3MfvFR8W0noNNGfv/4hCyGoY
         UZ3A==
X-Gm-Message-State: AFuF++m5DHUGTjIjegKY1oqJNQMd8+Iit2qS1lgv3qzmfyOBwK2FV8A4
	yEgYDF16uG+5a5fDywOsyyP5+ATdBLtXMbT/xK597rWPJ6c5eNabpZm/
X-Gm-Gg: AYBFou2ieIg1KdHsA214lZBesPuZKJdRos0DutDKY/1XpOLpL+SScCpcg9XqB7FbjOK
	2jRfnqm1ct2h+UNBlQdEsFqtQVbHT+lDTdnyo4egsq1JcsTfYgH0oktXgmLbXIZBMkYvtw3dOXU
	ri57pPOhO9icMvP2USzFCq4OYgNuBYnNDt6nykVtLotoR08wK1wSpMRa0dQsbJhdF8HuDKLqe1Q
	FzS2u6JScVViJQh45C4Ddj9gYFF/IFojd7w/+xKNoliETpw0+Acqu9derOm0haevUdrztbmKksV
	LYqbWGf/whUTbzyQx7Oj45RYwcOvkXaQlATkmxIM7fbdmZzoz5YktYtJi7QgGN+yaaA/bzRT6dW
	NdrlM3L2Pm/HiIDQH4pmGJI47xhSDlMbzGexNBeFIySssbOnQ3gm++M8QZu8U2pcWNZpxWL8Ww4
	oyeKfHuaoELXmbpzc7WQIOKNDb7kutn5HLUsM5uECbcht4jDfwM+NPytSGFc7WxTnur8I91ZDX4
	0wHIOHP0dAAO9O7ziQGRn4YuCY71pbm5HYUPCry1+Nc7Mdm8dqQhCJQacKgy7IneaHvomvcv2zZ
	X8g9X+Bs1G5M1LdpGumeGMadMHdT6bG81NI0tBYWvGlWtpZoMW+0ckLbIkJ+7k3782iTi+oTFuO
	UJZXzF9zJAdRkt4iX5PRiaw==
X-Received: by 2002:a05:6830:4388:b0:804:e0e8:1a86 with SMTP id 46e09a7af769-82120255097mr2048474a34.1.1790839503856;
        Thu, 01 Oct 2026 00:25:03 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8212af3bd3fsm1966448a34.20.2026.10.01.00.25.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 00:25:02 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 01 Oct 2026 01:24:53 -0600
Subject: [PATCH net] net: phylink: allow stopping a suspended instance
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-submit-phylink-suspended-stop-v1-v1-1-0669fdb4a93b@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/y2Oyw6CMBBFf4XM2iaUYnn8imHRx1SqUmpbiIbw7
 1ZleSYn584GEYPFCH2xQcDVRju7DPRUgBqFuyKxOjNUZcVpWVISFznZRPz4flh3zxg9Oo2axDR
 7slJSdqaTnCE3NYOc8QGNff0mLuAwwfA/5tANVfrGDy3gc8kPpMOVIiJR85Tn+qJhzVmzlvFad
 EJwbiSjDeVSoUHDWoFK6Gy0MOz7B2Q0BsbVAAAA
X-Change-ID: 20261001-submit-phylink-suspended-stop-v1-09f9b63e6f43
To: netdev@vger.kernel.org, Russell King <linux@armlinux.org.uk>, 
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

After a failed MAC resume, a driver must be able to stop phylink without
resuming it and reconfiguring the failed MAC.

For MAC WoL, finish the deferred link-down and clear the WoL disable bit.
Otherwise, avoid repeating PHY, SFP and PCS shutdown, but suspend a PHY
that prepare_resume() powered up for the MAC reset clock.

Retain the saved link state if MAC WoL is suspended again after a failed
resume. For example, fbnic can fail to allocate IRQs on resume and call
phylink_suspend() again on the next system suspend. The carrier is already
off, so taking another snapshot loses the deferred mac_link_down(). Keep
the original snapshot until resume or stop completes, allowing the next
suspend cycle to capture the new link state.

Restore any PHY advertisement reduced by suspend. Track that reduction
separately from explicit driver speed-down requests, so stopping a
suspended instance does not undo a driver's close-time power saving.

Fixes: f97493657c63 ("net: phylink: add suspend/resume support")
Fixes: 4c8925cb9db1 ("net: phylink: fix suspend/resume with WoL enabled and link down")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/net/phy/phylink.c | 56 +++++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 52 insertions(+), 4 deletions(-)

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index 1bbcf46c8356..08f06ae5213f 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -78,6 +78,7 @@ struct phylink {
 
 	bool link_failed;
 	bool suspend_link_up;
+	bool suspend_speed_down;
 	bool force_major_config;
 	bool major_config_failed;
 	bool mac_supports_eee_ops;
@@ -2498,6 +2499,14 @@ void phylink_start(struct phylink *pl)
 }
 EXPORT_SYMBOL_GPL(phylink_start);
 
+static void phylink_restore_suspend_speed(struct phylink *pl)
+{
+	if (pl->suspend_speed_down) {
+		phylink_speed_up(pl);
+		pl->suspend_speed_down = false;
+	}
+}
+
 /**
  * phylink_stop() - stop a phylink instance
  * @pl: a pointer to a &struct phylink returned from phylink_create()
@@ -2509,11 +2518,30 @@ EXPORT_SYMBOL_GPL(phylink_start);
  *
  * This will synchronously bring down the link if the link is not already
  * down (in other words, it will trigger a mac_link_down() method call.)
+ * A suspended instance may be stopped without first calling phylink_resume().
+ * In particular, closing a device after a failed resume must not restart the
+ * link or reconfigure the MAC just to finish shutting it down.
+ * Any PHY advertisement reduced by phylink_suspend() is restored as part
+ * of this transition.
+ * If phylink_prepare_resume() powered up an already stopped PHY, suspend
+ * it again when Wake-on-LAN permits.
  */
 void phylink_stop(struct phylink *pl)
 {
 	ASSERT_RTNL();
 
+	/* Also undo PHY speed control when terminating a suspended instance. */
+	phylink_restore_suspend_speed(pl);
+
+	if (test_bit(PHYLINK_DISABLE_STOPPED, &pl->phylink_disable_state)) {
+		/* A failed MAC resume may have called phylink_prepare_resume()
+		 * and powered the stopped PHY back up to supply its RX clock.
+		 */
+		if (pl->phydev)
+			phy_suspend(pl->phydev);
+		return;
+	}
+
 	if (pl->sfp_bus)
 		sfp_upstream_stop(pl->sfp_bus);
 	if (pl->phydev)
@@ -2526,6 +2554,16 @@ void phylink_stop(struct phylink *pl)
 
 	phylink_run_resolve_and_disable(pl, PHYLINK_DISABLE_STOPPED);
 
+	if (test_bit(PHYLINK_DISABLE_MAC_WOL, &pl->phylink_disable_state)) {
+		/* Finish the link-down deferred by MAC WoL, without restarting. */
+		flush_work(&pl->resolve);
+		mutex_lock(&pl->state_mutex);
+		if (pl->suspend_link_up)
+			phylink_link_down(pl);
+		__clear_bit(PHYLINK_DISABLE_MAC_WOL, &pl->phylink_disable_state);
+		mutex_unlock(&pl->state_mutex);
+	}
+
 	pl->pcs_state = PCS_STATE_DOWN;
 
 	phylink_pcs_disable(pl->pcs);
@@ -2635,10 +2673,13 @@ void phylink_suspend(struct phylink *pl, bool mac_wol)
 		/* Wake-on-Lan enabled, MAC handling */
 		mutex_lock(&pl->state_mutex);
 
+		/* Preserve the pending link-down if a previous resume failed. */
+		if (!test_bit(PHYLINK_DISABLE_MAC_WOL, &pl->phylink_disable_state))
+			pl->suspend_link_up = phylink_link_is_up(pl);
+
 		/* Stop the resolver bringing the link up */
 		__set_bit(PHYLINK_DISABLE_MAC_WOL, &pl->phylink_disable_state);
 
-		pl->suspend_link_up = phylink_link_is_up(pl);
 		if (pl->suspend_link_up) {
 			/* Disable the carrier, to prevent transmit timeouts,
 			 * but one would hope all packets have been sent. This
@@ -2657,8 +2698,10 @@ void phylink_suspend(struct phylink *pl, bool mac_wol)
 		phylink_stop(pl);
 	}
 
-	if (phylink_phy_pm_speed_ctrl(pl))
+	if (phylink_phy_pm_speed_ctrl(pl)) {
 		phylink_speed_down(pl, false);
+		pl->suspend_speed_down = true;
+	}
 }
 EXPORT_SYMBOL_GPL(phylink_suspend);
 
@@ -2698,8 +2741,7 @@ void phylink_resume(struct phylink *pl)
 {
 	ASSERT_RTNL();
 
-	if (phylink_phy_pm_speed_ctrl(pl))
-		phylink_speed_up(pl);
+	phylink_restore_suspend_speed(pl);
 
 	if (test_bit(PHYLINK_DISABLE_MAC_WOL, &pl->phylink_disable_state)) {
 		/* Wake-on-Lan enabled, MAC handling */
@@ -3616,6 +3658,12 @@ int phylink_speed_down(struct phylink *pl, bool sync)
 
 	ASSERT_RTNL();
 
+	/* An explicit request takes over from suspend-time speed control.
+	 * Restore the original advertisement before saving it again, so a
+	 * repeated speed-down cannot replace it with the reduced advertisement.
+	 */
+	phylink_restore_suspend_speed(pl);
+
 	if (!pl->sfp_bus && pl->phydev)
 		ret = phy_speed_down(pl->phydev, sync);
 

---
base-commit: 7375d38364a9aa66fb31716bcefef38aecad75d8
change-id: 20261001-submit-phylink-suspended-stop-v1-09f9b63e6f43

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>

