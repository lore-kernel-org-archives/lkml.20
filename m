Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E3633E7159
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 22:20:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789942849; cv=none; b=UiMFU08VL7dUpXNg3ppkE86GyOE+FN3TeGhjLjQJbVlWJVruqUVdcMTwS/EM2/giBU0UCqFCH1dS/5r+CfgCpS5U95zeeyhYlKFryRJWrHipX0qtqqiL9/I4KihDxAb/oEJ8KAH9TYWVrVKxk0JIW8b1bMJBI7fnunH1xubDFto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789942849; c=relaxed/simple;
	bh=jJ3QwRlnW9Vwxdw/1S6Y7JDhcY1bvzYCsw4DmV5r+oA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oRqem970kkBHPpCDC65FKV99H0LhjfH/GUteP3ZmYxgKHIXYcJs3D/2PVo2Zr0cpyytwKXV30JRkCzrd3dP9YbE3lMPolj7pu3w+JvMRcWg70h4B+Rm5UOFK3Ihx/hnnOy9fyRNRHVsufEohqEglcoYrZrnhKhW0QPothqareN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la; spf=pass smtp.mailfrom=lex.la; dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b=eON9T0uw; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lex.la
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b="eON9T0uw"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49d1ca5b0d6so17436665e9.0
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 15:20:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lex.la; s=google; t=1789942846; x=1790547646; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rGgXUYgvHQ8Fg6J9+hUTqNq3sfh9W+ZtLaGrZCtz8oM=;
        b=eON9T0uw58DwSzmxG8iYTVsCs5oP2u0/q/xiJN9o5v6B7YBGjHPMVkpD9CHJH6Bxkr
         gItjSqG/CgYzouWv8jJYHSZ07x4M6Lq2q7y0ANRvQbRlHewrHmXTQR14EYa+6TLZhhy9
         WxBHkEz2R5n7/SihMwqmG83bW/t9luT92kaByzicKUxmHWbNK5bqzRKlnuOlOn7wHnZw
         g+DJZJjdoY+vxB62KNcx1+McwlPUmjGb7KvoGNO2Uju7yUkDKygKRBoa0gH7wrUTRfsw
         sC6Zg4ViB1lLzgCXYruZ9RXTzebBKyXGYiXuwmM/wENtki8giFFT4FtfUlO1dIFyddfn
         UeCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789942846; x=1790547646;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rGgXUYgvHQ8Fg6J9+hUTqNq3sfh9W+ZtLaGrZCtz8oM=;
        b=dZAymoF99FbS8OiZf4+2x7VsupJQ5h237kKlQZEHVODvpDJqp8x24rfJGJYQI3mA0W
         v/X+UDGW9LUHUxQYq9nEsTq2P5kw/P4/QwO70Zz8ir+YvwmqmmRfZvciE3suJwJyIQT/
         LJvrgMw9LqPpcnT3HcfP6m7RPZK+EBCM+3d35ap6YiFx2n3sErWE86EVlLALg8a/DQXF
         NBm045UwI2+zFbl0CZLSP63ylfNmbo3nPYnPcQFviKY5mTmtIaZ6TMjmGmAYA4XqJpJF
         ypJnGBaPVt47rBBj47LwEUdYYFqTWTyke2VETSjpp0c1ZBI1tWoBnpr6zXa+QHsIYenC
         TJjQ==
X-Forwarded-Encrypted: i=1; AKwUvBziw60/ev9gtb5YyDAEE+aHOga/CaXC4YTHXyhfRz+T77QwVfA83dd2YU71fVrgb834FK96edb5Cl2l8SA=@vger.kernel.org
X-Gm-Message-State: AFuF++kXkrEiyAiCVF4DptbEDrPzLtDkkrPgkqE5QQvEF8duVj6Whv67
	kRE83t78tBj79+EKbgi2Ix6Zu9gB++zsTEdwMv23k9L3bEpDFylQY/Iy0Ho59RhmbT4=
X-Gm-Gg: AYBFou1ZPxmr1EbU6dqRoUCbs7izdZnnMehrQlcoWwUjqlMbB48vStx3jY3gBX+yeJU
	ZdSqOWbjbRaSnoU9iOqJJWbdSaIKelXxQhYpe6Lh3geWaOPM7pByD8kos41BxzOCyOzEfFWJGux
	jsp1cNTpTc5oDVx1KNqqimdoAxsPQpn4I36DAGwLR24GCRMQeoHiAl3j9rbQt9lBP641QL5cosl
	1quOmt9uh1aRU9Gt+2XN8ZPunfFiRsgkN9eVHGEhdBMw7AQzZa4zQlYdcKPV97tIReK/w3GpQ1/
	dYtqWhlIvCvldJqbD986G6zb0QS63bAVpl5u8BmbM5Z+McE5fo2TZsoSr9KkS4o2FNmkdI4JtEg
	wlmZ1LnN2/XNJViiQMYwz7OajX1HWXgsJ5FEJR4bwnd9qoHN8xkZchA98BqqnBBKBTK/S4f3BhM
	u0wtIZwBsWm7XpCUK2f0PWnjNLVXJTqDRbMC9TQ02QXfO6JOYMKQ==
X-Received: by 2002:a05:600c:19d1:b0:49c:fed6:cd3f with SMTP id 5b1f17b1804b1-49fc5743bc4mr129978595e9.23.1789942846247;
        Sun, 20 Sep 2026 15:20:46 -0700 (PDT)
Received: from remote-01 ([84.17.55.230])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fcd07411fsm188321175e9.7.2026.09.20.15.20.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 15:20:45 -0700 (PDT)
From: Aleksei Sviridkin <f@lex.la>
To: netdev@vger.kernel.org
Cc: andrew@lunn.ch,
	linux@armlinux.org.uk,
	andrew+netdev@lunn.ch,
	hkallweit1@gmail.com,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	linux-kernel@vger.kernel.org,
	Aleksei Sviridkin <f@lex.la>
Subject: [PATCH net v3] net: phylink: record the PHY only once bringup cannot fail
Date: Mon, 21 Sep 2026 01:20:44 +0300
Message-ID: <20260920222044.1752860-1-f@lex.la>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260919015338.499611-1-f@lex.la>
References: <20260919015338.499611-1-f@lex.la>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

phylink_bringup_phy() stores the PHY in pl->phydev before its last
fallible step: on a MAC whose phylink ops implement LPI,
phy_eee_rx_clock_stop() can fail with a real MDIO error. The callers
unwind with phy_detach(), which knows nothing about pl->phydev, so a
pointer to a PHY that is no longer attached outlives the failed
connect.

What that costs depends on how the caller got here.
phylink_connect_phy() goes through phylink_attach_phy(), which refuses
to attach while pl->phydev is set, turning a transient MDIO error into
a permanent -EBUSY. The SFP path is worse than that: sfp_sm_probe_phy()
answers the failure with phy_device_remove() and phy_device_free(), and
it assigns sfp->mod_phy only past that error return, so nothing clears
pl->phydev and it is left pointing at a freed phy_device that
phylink_resolve() and the ethtool helpers go on reading.
phylink_fwnode_phy_connect() has no such check, so a later connect
overwrites the stale pointer and hides the problem. A disconnect does
not: phylink_disconnect_phy() hands that pointer to phy_disconnect(),
and the second phy_detach() on the same PHY drops references the first
one already released.

Found while making a DSA port survive a PHY whose driver arrives after
the switch probes: keeping the port across a failed connect and
retrying is what makes this window reachable.

Publish the pointer after the last call that can fail instead of
unwinding it afterwards. Nothing between the two points reads
pl->phydev, and the registration that follows cannot fail:
phy_request_interrupt() falls back to polling on its own. The PHY-side
state keeps the order it had, so no MDIO operation moves relative to
another.

Fixes: 03abf2a7c654 ("net: phylink: add EEE management")
Assisted-by: LLM
Signed-off-by: Aleksei Sviridkin <f@lex.la>
---
Changes since v2:
- Record the PHY after the last call that can fail, as Andrew suggested,
  which removes the unwind and the helper it shared with
  phylink_disconnect_phy(). The fallible call keeps its place so no MDIO
  operation moves.
- Hardware evidence for the failure this prevents is in the reply to v2.
---
 drivers/net/phy/phylink.c | 20 +++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index a1458da8111b..1bbcf46c8356 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -2129,7 +2129,6 @@ static int phylink_bringup_phy(struct phylink *pl, struct phy_device *phy,
 	mutex_lock(&pl->phydev_mutex);
 	mutex_lock(&phy->lock);
 	mutex_lock(&pl->state_mutex);
-	pl->phydev = phy;
 	pl->phy_state.interface = interface;
 	pl->phy_state.pause = MLO_PAUSE_NONE;
 	pl->phy_state.speed = SPEED_UNKNOWN;
@@ -2196,10 +2195,25 @@ static int phylink_bringup_phy(struct phylink *pl, struct phy_device *phy,
 			ret = 0;
 	}
 
-	if (ret == 0 && phy_interrupt_is_valid(phy))
+	if (ret)
+		return ret;
+
+	/* Nothing below can fail, so the PHY can be recorded now. Doing it
+	 * here rather than above keeps a failed bringup from leaving
+	 * pl->phydev pointing at a PHY the caller is about to detach.
+	 */
+	mutex_lock(&pl->phydev_mutex);
+	mutex_lock(&phy->lock);
+	mutex_lock(&pl->state_mutex);
+	pl->phydev = phy;
+	mutex_unlock(&pl->state_mutex);
+	mutex_unlock(&phy->lock);
+	mutex_unlock(&pl->phydev_mutex);
+
+	if (phy_interrupt_is_valid(phy))
 		phy_request_interrupt(phy);
 
-	return ret;
+	return 0;
 }
 
 static int phylink_attach_phy(struct phylink *pl, struct phy_device *phy,
-- 
2.53.0

