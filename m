Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ADB637882B
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 08:05:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788336322; cv=none; b=PBgE/v1iAYFNcDOnRe2KEtV9OO5bTBWC7rcgbtvUpZsbZy4wynXwZkcwxpLtrUi4IuqGQLAlP79i7ty62wLfCeKMvHUR/+uzkkwVYqF60E/Gz4wJ0moXIUkpMJZa85jt6QgS57jcBm/QtHOfz209ZOcAifxvDJJc51ctDRsm34g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788336322; c=relaxed/simple;
	bh=pUZFzZt2uT4rZt+BibmZ5+dYY7JEFXJ02fYx4ES1Wsg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EN6b32BZqp5XgC52aarm6gXVKRxQz98f5TF8K7vGIWpc2xds3XCInXtH0Ps5D8HX1mOxyM9m84zmdwp+hEvfIJA2lRwv7NtkXM8uOCG1ePt7rjQzu0W/J5fGgTKR1gJt7z4E8/k9ew+sbKeV+bm9yoYLv78XgV3dZOsl5zibR1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la; spf=pass smtp.mailfrom=lex.la; dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b=elezhoy9; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lex.la
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b="elezhoy9"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-49b392ccaacso10357435e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 01:05:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lex.la; s=google; t=1788336318; x=1788941118; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YsSeTjwDd30HnlbbrgFBLaTr0AjBlsC72GIeoJNNrpQ=;
        b=elezhoy9f6ED+F8fAWuPm+rv2O3qIwbDxwQ8I+vI06D8oLPoUXf4npvQ7lhXcMnap/
         2VbsBMOxHQqjK5jsiIQwKg+STgoW1vDD+InNjXxdIPdaowlP2nW7BBcZjI7H9TP+2H4a
         N4WVp2witNNIkVvds+iLdldnOLfXBFyPTZC6nAfiBDjuK1VvaaLLyUAVylFz3ys7SxqW
         saPK8nuxWoD/djcvJ6z7xoP3aeapaA8T2evJphjF0p2k34zXDUX8xUmPJAcr2QivNrwP
         eja6liUKMYAyvprCO28x5HameFcd9e0QSH9rk3Gz/gzDK4QCNio2RRFEuYTJw769EOXq
         ZtZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788336318; x=1788941118;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YsSeTjwDd30HnlbbrgFBLaTr0AjBlsC72GIeoJNNrpQ=;
        b=Q6g/wxO+x+LwxBTDcj8vNV/VPPtTpVYE309gRd6yqzDmL3xjo9Dh3PEZUu0HRo9swV
         QTw9j6DKZkmFeIfF5iXVdWBRH4fmWSi0mN6/JfWhG8NyREABvFY+wg8cJZDkRlYKZ3Ys
         mCHAQdF/p+7C6WPm7U/6nW4KxXDKVgZuIScP3aKPyK7yvukLC9J3ggVoQgwdNBWMQhJN
         YCxtO1kqjsak6xzKEyd1qvMds/G4xSyH48a6HRGs74ESCPBPBD9N5WVRjqVJBdHl6rdP
         VlsZ5zPHQhWhjFqvLdqB5BvX5T2zJr77ae+x8gODW0l54ihVBZlOu9RhkGt+kAGy7fOB
         DP6Q==
X-Forwarded-Encrypted: i=1; AHgh+RpL9hgIfOrYXTTj8Tv0OeGA2+4ImX/6DkqibKssf1GkRNrUhdKSijb+wlBPdTCKlC2KPWUUyPStMipgo8Y=@vger.kernel.org
X-Gm-Message-State: AFuF++kb7uyHI7YcFaofIWqQ3f8e0uiwxLxvGF/r5znToLGXC5vWeMuW
	po4Gif/NSx5iL5telEboub/pNMOUFWJ5Gwy8VS2v6EmXYR/B+fFv+H/XWMW5l38EgeE=
X-Gm-Gg: AR+sD13lJuts/4pFckB+mfCdxx9iRSUWWvt9Ble3EPzFCpYIPN9+lw3rAKb4nfTpEqC
	bBxbDjtukTdo+1q7OklA6Ma1s8zmkj9Fu4L6WD6Qu+ueRIGBp4Q0iD4WX0C/8EWzWnwRCYv0Ums
	612IzUJ7xhF8/JxbGIFLPlgc5YPSesXiFCu2yFv9kK0t/Gj9BPotDiOQZN7haZkD3fW5YirV1OO
	663ykFRoP2FDF7OPRw3VXc8qj9gkp37hx2m+PAjhqSl2vfNwVIbVD+j2GlgFk7geK7L7JhcMZii
	lsYWGQIqZsP4DpeaCDmbsBD70WUTRKcsBhSqdodpYSicnNiMr17tmQuEI4ebBoa73x0WbJTm4PR
	3zE/Oy6nh3JrTuM+eHFFKRIpA3DTT2PJJvUCCfYnNku8m/eoGKq6pUlTmw6g0NZOqm/uvsVGoBx
	tJQl76+pCcoPryBR61qlIHCz6b53ZZzpPiJthocBbdKnQg6M8Cpw==
X-Received: by 2002:a05:600c:5653:b0:49c:eb17:cf3b with SMTP id 5b1f17b1804b1-49ceb17cff4mr1786385e9.8.1788336318073;
        Wed, 02 Sep 2026 01:05:18 -0700 (PDT)
Received: from remote-01 ([84.17.55.226])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448e72df2sm5089494f8f.1.2026.09.02.01.05.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 01:05:17 -0700 (PDT)
From: Aleksei Sviridkin <f@lex.la>
To: andrew@lunn.ch,
	hkallweit1@gmail.com,
	linux@armlinux.org.uk
Cc: olteanv@gmail.com,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net v4 1/2] net: phylink: unwind the PHY binding when bringup fails late
Date: Wed,  2 Sep 2026 08:05:10 +0000
Message-ID: <20260902080511.2211261-2-f@lex.la>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260902080511.2211261-1-f@lex.la>
References: <20260902080511.2211261-1-f@lex.la>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

phylink_bringup_phy() records the PHY in pl->phydev before its last
fallible step: on a MAC whose phylink ops implement LPI,
phy_eee_rx_clock_stop() can fail with a real MDIO error. The callers
unwind with phy_detach(), which knows nothing about pl->phydev, so a
pointer to a PHY that is no longer attached outlives the failed
connect.

What that costs depends on how the caller got here.
phylink_connect_phy() and the SFP path go through
phylink_attach_phy(), which refuses to attach while pl->phydev is set
and turns a transient MDIO error into a permanent -EBUSY.
phylink_fwnode_phy_connect() has no such check, so a later connect
overwrites the stale pointer and hides the problem. A disconnect does
not: phylink_disconnect_phy() hands that pointer to phy_disconnect(),
and the second phy_detach() on the same PHY drops references the first
one already released.

Clear the binding on the failure path. This is the same operation
phylink_disconnect_phy() performs, so both now share a helper. The
PHY-side fields are left to phy_detach(), which every caller already
runs on this path.

Fixes: 03abf2a7c654 ("net: phylink: add EEE management")
Signed-off-by: Aleksei Sviridkin <f@lex.la>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
---
 drivers/net/phy/phylink.c | 29 ++++++++++++++++++++---------
 1 file changed, 20 insertions(+), 9 deletions(-)

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index 5b8e956902fb..a55e4a64028f 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -2083,6 +2083,18 @@ static int phylink_validate_phy(struct phylink *pl, struct phy_device *phy,
 	return phylink_validate(pl, supported, state);
 }
 
+/* Disassociate @phy from @pl. Caller must hold pl->phydev_mutex. */
+static void phylink_clear_phydev(struct phylink *pl, struct phy_device *phy)
+{
+	mutex_lock(&phy->lock);
+	mutex_lock(&pl->state_mutex);
+	pl->phydev = NULL;
+	pl->phy_enable_tx_lpi = false;
+	pl->mac_tx_clk_stop = false;
+	mutex_unlock(&pl->state_mutex);
+	mutex_unlock(&phy->lock);
+}
+
 static int phylink_bringup_phy(struct phylink *pl, struct phy_device *phy,
 			       phy_interface_t interface)
 {
@@ -2197,6 +2209,12 @@ static int phylink_bringup_phy(struct phylink *pl, struct phy_device *phy,
 	if (ret == 0 && phy_interrupt_is_valid(phy))
 		phy_request_interrupt(phy);
 
+	if (ret) {
+		mutex_lock(&pl->phydev_mutex);
+		phylink_clear_phydev(pl, phy);
+		mutex_unlock(&pl->phydev_mutex);
+	}
+
 	return ret;
 }
 
@@ -2347,15 +2365,8 @@ void phylink_disconnect_phy(struct phylink *pl)
 
 	mutex_lock(&pl->phydev_mutex);
 	phy = pl->phydev;
-	if (phy) {
-		mutex_lock(&phy->lock);
-		mutex_lock(&pl->state_mutex);
-		pl->phydev = NULL;
-		pl->phy_enable_tx_lpi = false;
-		pl->mac_tx_clk_stop = false;
-		mutex_unlock(&pl->state_mutex);
-		mutex_unlock(&phy->lock);
-	}
+	if (phy)
+		phylink_clear_phydev(pl, phy);
 	mutex_unlock(&pl->phydev_mutex);
 
 	if (phy) {
-- 
2.53.0

