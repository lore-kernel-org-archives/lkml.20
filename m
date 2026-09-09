Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E575A58B6A3
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 20:43:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788986611; cv=none; b=UvkZZGD2uzfVTcfyVW4WNACuamhSyq5vPIzP3r1nqRBMPWKrkAoNMXGK2kZYCjKaRcjNWcuK8kL4DYhU9UVnx/7QGoJsX6FoGvkbJIUMpvEr1KEY280ZF1eKvxNRQkd/dU/21DlFEk4/tk9K3X7piPQjsARwf05Yzp9fuQl1neY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788986611; c=relaxed/simple;
	bh=QLj6uunsHhqrnqb4W1X3o/tolvu2AXeojwPQZ4VHJ30=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PdOAj4XOiPQGvUv467a6x3/IoELPRuSp8/VxF5GDfWrPJ4omIY+H/jFLnNbY5C7/rI5wDqikqgyqd/R0F8WVaKqyd15zhKcowgCCw6SU7M38nKzd1ESdigdV4nr9EsZPb2D7gD6ugeMjv8FU2nRinsZm34dWrHtnUkMRVN8k1QI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la; spf=pass smtp.mailfrom=lex.la; dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b=buQZp8QK; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lex.la
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b="buQZp8QK"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48584dc164fso5767654f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 13:43:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lex.la; s=google; t=1788986594; x=1789591394; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8grsZT6wiO1Q660+0ec29fANgzXjMngSvEn31FO65nQ=;
        b=buQZp8QKGQOsLAX3qV6RsuiBBaW4rS5CWHhxiieTjrbCoF0cwSKDpUcS2bf7nim/GP
         GO5QCIdMpmXrwF9eXwAwn9++wsmR6O/tVkYFKrIJwfd+H0O6AMglSgbj6AwXXC32ogZT
         YYXHqw0NnfiL2kGEpcpW0a3D1wh90CtxEmyVOx2OY1OvGvh6KyofR9E96Y5xUTzWbaqG
         CxSRlzalOzrKrD1cSQAZJy2QsJWonHIE581Zey4pORvTK///eZPpRFe3m/8XvmWyw6v2
         jcYckcz9+eX5eXEv51FfkCMQqlLSRY5J7dSSjO7Mh51FRM9lcwNPXsxxIU9KbmYa0PsP
         ZGHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788986594; x=1789591394;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8grsZT6wiO1Q660+0ec29fANgzXjMngSvEn31FO65nQ=;
        b=CMJBeAyGO67ZrzPxP1fxxDdcY4sHzpPvamOatTsFBJza5R8/cNyFdAqT51W2Zdy6qI
         Qd6yT5F+ZNo2KLY7vvU8Ma5A7wjI9vP0247gXvhOBjY3z////7fSXzQxXmZ3LWsLvrhI
         9Bhn+1ivzil+AOHQEsk7120chB8mMgk1q4tGn//u6jrypxM2EfJEKOKgbSlFXDdHEgiE
         FDqebopFTJ/hy7MpaWU4I1z4oEHoPbPFTAhH7LBuXtGubIZf1PTd9cY8CwY2j1r9mEPo
         OVEPv8kL4BJZ/rWiPj2UproL9gcZDtiXtX65Pm8Szp+3EhsjaPqCAbxPQElO3UArHF7B
         9KMQ==
X-Forwarded-Encrypted: i=1; AKwUvBy6sPIniOvqs1RAch0glfbGfd8MkBJphTE2RJcZM+qo2Kt60mmmBtU1zp2K3hNaZjOHvXbUuRQPFdQyFLE=@vger.kernel.org
X-Gm-Message-State: AFuF++lKUwxnJKS65FONslDyAAud+F18wKYa+aoTTzlXvxr5O5AIWyXd
	YisjmN0qBrrfxpptMeBul3mcPnPn67NS1+dxnAQKkzBnGz5U5qArQ3H2Pie9A0DRYTM=
X-Gm-Gg: AYBFou24zyrTQpNsDD7cGls7Ro8RVq50zONeU3MEAEhb+MKYM0YvLeeT/R6v62FufHm
	CwhC9kCw5AtjqRfIT9c2/E6zZYtWdD6S/FQYXir6sZzH2sH6+Pi9+5TwOhXvlOjme5HVnPYmF2k
	rRoBI2m8SqcBaU8Za2wmOnalIh55eZy39tJpupKP6QbvYlquy6IUjm4jDVGAufaJtDqI1a/2whQ
	Q6d0h61IDB/ADXVa8qYyUv8aMYR0DLZpckPreVkLOdEYTQhKhiwjinPeO+xUOxe4TqzLEbFAFPR
	gnmhbmXhnhcYY/enMi2E8inkZ1uPaJAN6oij/KHXoPx1kHOhjyWtwWw8oXXyVa6qFurXi0gr8S3
	a4W5rtu0tKF/YF/4Z8WDsxIZkHpuIdmpaH/r+/UpxLjiekFG+kLmOne/+eUcFab7msuTq3zjxOM
	h2fpQGf39Y+ktH5TztJH6hqYtKkxxxpVr3W2HjW3VOcqjPsJveMg==
X-Received: by 2002:a05:6000:4304:b0:484:3311:3702 with SMTP id ffacd0b85a97d-485872db94cmr41018597f8f.25.1788986593260;
        Wed, 09 Sep 2026 13:43:13 -0700 (PDT)
Received: from remote-01 ([84.17.55.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4858e239862sm40693606f8f.9.2026.09.09.13.43.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 13:43:13 -0700 (PDT)
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
	linux-kernel@vger.kernel.org,
	Aleksei Sviridkin <f@lex.la>
Subject: [PATCH net v7 1/2] net: phylink: unwind the PHY binding when bringup fails late
Date: Wed,  9 Sep 2026 20:43:05 +0000
Message-ID: <20260909204306.2374562-2-f@lex.la>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260909204306.2374562-1-f@lex.la>
References: <20260909204306.2374562-1-f@lex.la>
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

Clear the binding on the failure path. This is the same operation
phylink_disconnect_phy() performs, so both now share a helper. The
PHY-side fields are left to phy_detach(), which every caller already
runs on this path.

Fixes: 03abf2a7c654 ("net: phylink: add EEE management")
Assisted-by: LLM
Signed-off-by: Aleksei Sviridkin <f@lex.la>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
---
 drivers/net/phy/phylink.c | 29 ++++++++++++++++++++---------
 1 file changed, 20 insertions(+), 9 deletions(-)

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index 3ec3bb439109..6a92fac58f25 100644
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

