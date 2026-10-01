Received: from mail-wr2-f34.google.com (mail-wr2-f34.google.com [74.125.225.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC7534F5E03
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 13:02:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790859744; cv=none; b=uQhPmhGOfeIXjsVaYq+Xj8T0WPpZ/3v+cD1kyiVJlh3zm7dnr5RfFJS6gj7dKFaM/bdstvRvTzCRz6JpV5kiKR5TAi0sgW+hNjAZNlJmuhKoXU0Fg5DF383qkG6IGmo3TRVtsyOPblM1j+3QFDkwzGy/7xwp4/rNVT8/nBjDaOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790859744; c=relaxed/simple;
	bh=uB3M5jhLStvKxEixDqmeyTwelK0qIeNwNu47lsyjOSU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=N3sl3R1N3ogwNFR3lGfOFSC84zrl3FXEZooSZz/oVtDQuqdH2FOBr+I/z9fgW9PL1QGmwnLE4K7CP5nrx9/lgvunTIX4VtrRnzkbdBZie3rd6U0u+VfCuNGTjI0FNOuWeHrxppnfLkEu3wuV67YaavTdndXrAqoGtMKtqw4cE8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la; spf=pass smtp.mailfrom=lex.la; dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b=RmHAS6eQ; arc=none smtp.client-ip=74.125.225.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lex.la
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b="RmHAS6eQ"
Received: by mail-wr2-f34.google.com with SMTP id ffacd0b85a97d-48affb828f1so1834617f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 06:02:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lex.la; s=google; t=1790859739; x=1791464539; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BuBDExO74epIRwSfRIAR1akFv1FLKuzGN3ASIp3+PmI=;
        b=RmHAS6eQcyoANScauS3xH2fbpnoY+GueCutTXiM7G0knhyQZNR+BjSzej9QuU1h1h4
         yhcvlHSTGjg4eNgs7gIWX+ppGtemkpIU8OnokNmc311ZKwlgDkNwZLIUJ3KYH6J5DGf+
         xeBpsmRlY5NKdok6Xs19iVcIyoO5I8SBJCTYo2aPbNGEbzcN3Ym3O7bHW3oCWpfNlEGe
         BDo9e3Wv4S02npyTWXvcEoBYDadArTKiiEytDo3oPTBIKPxErUki2xXCvvVyitsAUCpR
         YwHo0tLicfPkN2E5PIBSsJyDElwBA+yJYsySAxWxUXOhtcIjW6BCoVnhkafbzXl2N4U/
         hdyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790859739; x=1791464539;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BuBDExO74epIRwSfRIAR1akFv1FLKuzGN3ASIp3+PmI=;
        b=tIq53gCqkRsAD0RhHq4xlFHE+2yMgFxKPzFMIDunRigSTscxChOOKsNH9jr3Mdcie9
         y6lSqOXxfpXzBPDlBTgcAPB10JOqjjh0f0LCZ8P7/mo91tfd/DnN5CqNwxO9Tb7Y1Th5
         rKxL8enw+1PJnokF+aNNRadJxhbhfstMwYnl+h36/nulQ9/wZ6TQD6bksF+MlDZQ1aEU
         Mw43f9Medj6S4nesFkBbFrctymPuBCNcmFV/dbqFSqxnxiNcyy6pf1ODCbgsTxsgDDyT
         oqUhrP8q9Bx+QiYmI4fZUrIsmZAszv1QzETjb3Y1RXPYFCGrHBqhNsrogCdEEcFmNX+v
         f7mQ==
X-Forwarded-Encrypted: i=1; AKwUvBy/GGrSax+KbivpHzSacvZ39cfDjHbjGUlImUgiIzV1jZvy0zsoVxUTaYoewLRcwCVDxNZuObUS8/4jksc=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ3wiAf++t0V+NUgho071ekDBMdXvnZ914i/uosq+wZJRdKElF+
	OgYc3ZS8SxTrkzwHCWXLtXQl2gBmGVy0rYdYNsQpvz1mYg4I6YKTHn7IwMHTrOtZ45E=
X-Gm-Gg: AYBFou3GT95sRkWLYgGhyGcJVJFDMsqI3eemzrLrJU/mJKZWpW9Lu28uHhxfmZVWWx0
	VvW77bKjbz74hY2BBO+3eJ3fiLFUD8e/PoYBTC4qSdGE6T7Y//ffDtL9X7wLkrh2yYfn47xTZ9y
	otq3Mq+Bt89bruQeE8tKSzEd1wpmPrHcLFfOMhOWFPfEH+P+nVNwCdmU5YSHN0mtuBvEOrvE/sE
	h44VdsTupi1mAbmENL70F19S6UortJ0OupNHFDICTVmD5FxDls9MJbGsZQGwUmAec7kxe/fu9br
	Y/aW2kMqEHC3p7z+hadVzQckMwWbfOWxYmVXn8/bOHftn21sg0ezUpVQrGZskpS+4t0/T+l6kw8
	kzoDIsItfbU0gHQFfiu9aL1ra+7XrRJMp7a6gv8UX44d6+RMKDa/UzsRVXZan3tJv8WwRO75KPi
	ZtPBMotqy4P4tsLss5ArSnjEW/sGOkOFm98Jum+WxQ7u6vpJhWPg==
X-Received: by 2002:a05:6000:29c3:b0:48b:10af:f85a with SMTP id ffacd0b85a97d-48b10b000e3mr1098553f8f.42.1790859738771;
        Thu, 01 Oct 2026 06:02:18 -0700 (PDT)
Received: from remote-01 ([84.17.55.224])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b06a2cd0fsm5568155f8f.30.2026.10.01.06.02.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 06:02:18 -0700 (PDT)
From: Aleksei Sviridkin <f@lex.la>
To: Russell King <linux@armlinux.org.uk>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	netdev@vger.kernel.org
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Conor Dooley <conor@kernel.org>,
	Florian Fainelli <f.fainelli@gmail.com>,
	"Chester A. Unal" <chester.a.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH net-next v5 3/3] net: dsa: let user ports wait for a PHY that probes late
Date: Thu,  1 Oct 2026 16:02:08 +0300
Message-ID: <20261001130208.105558-4-f@lex.la>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261001130208.105558-1-f@lex.la>
References: <20261001130208.105558-1-f@lex.la>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A user port connects its PHY once, when the switch sets up its ports.
If that PHY needs firmware from the host and its driver is a module not
loaded yet, the port gets no working PHY for the rest of the uptime.

Let a switch driver opt its user ports in to phylink waiting for such a
PHY, and opt in mt7530. Until the PHY attaches, .port_enable sees a NULL
phy, so the opt-in is per driver: qca8k dereferences that argument, and
gswip programs the PHY address from it at open, so a late attach leaves
it wrong until the next open. mt7530 does not use it. Shared ports are
left out.

Found on a Keenetic KN-1012 (MT7981B with an MT7531 switch), where the
EN8811H behind lan4 has its driver on the root filesystem and lan4 was
lost for the uptime.

Assisted-by: LLM
Signed-off-by: Aleksei Sviridkin <f@lex.la>
---
New in v5.

 drivers/net/dsa/mt7530.c | 1 +
 include/net/dsa.h        | 5 +++++
 net/dsa/user.c           | 1 +
 3 files changed, 7 insertions(+)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index 7781a63b4e6f..e4c155605e27 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -3548,6 +3548,7 @@ mt7530_probe_common(struct mt7530_priv *priv)
 	priv->ds->priv = priv;
 	priv->ds->ops = &mt7530_switch_ops;
 	priv->ds->phylink_mac_ops = &mt753x_phylink_mac_ops;
+	priv->ds->phy_may_probe_late = true;
 	mutex_init(&priv->reg_mutex);
 	spin_lock_init(&priv->stats_lock);
 	INIT_DELAYED_WORK(&priv->stats_work, mt7530_stats_poll);
diff --git a/include/net/dsa.h b/include/net/dsa.h
index 5d12191b6f6f..f7e78c3a123d 100644
--- a/include/net/dsa.h
+++ b/include/net/dsa.h
@@ -455,6 +455,11 @@ struct dsa_switch {
 	 */
 	u32			dscp_prio_mapping_is_global:1;
 
+	/* Drivers whose .port_enable copes with a NULL phy may set this to
+	 * let user ports wait for a PHY that needs host firmware.
+	 */
+	u32			phy_may_probe_late:1;
+
 	/* Listener for switch fabric events */
 	struct notifier_block	nb;
 
diff --git a/net/dsa/user.c b/net/dsa/user.c
index 041f9060c8ef..41075bb74193 100644
--- a/net/dsa/user.c
+++ b/net/dsa/user.c
@@ -2661,6 +2661,7 @@ static int dsa_user_phy_setup(struct net_device *user_dev)
 
 	dp->pl_config.dev = &user_dev->dev;
 	dp->pl_config.type = PHYLINK_NETDEV;
+	dp->pl_config.phy_may_probe_late = ds->phy_may_probe_late;
 
 	/* The get_fixed_state callback takes precedence over polling the
 	 * link GPIO in PHYLINK (see phylink_get_fixed_state).  Only set
-- 
2.53.0

