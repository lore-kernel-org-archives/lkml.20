Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D56844266B8
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 12:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791290872; cv=none; b=FqFwcJe3m1g4Sqk1xWD/NAkpqXKfoQ1YO4cxzdjzEPc9Ul0UzPWtoFp9LgyEVG/ezQ9pUMc2fTsB8Xn2ALOPMZcgEfXUgEc7NGwtPGeWxQKq0VeAN8wmRgCxftYEDDrwweD+SosGjb0or/ulY2/hfT5tn1jnlHNJMLkONH0Q6fc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791290872; c=relaxed/simple;
	bh=8BEd9pOmcZGMI9o1dv26yM8HUC5GCtUJRwGdm5AKk/A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZWo6ZxkcpW0EfSgaNREL1DGNu9QB0P6KAXjqDowYjT1CDkpAprzP7ptvVelbMqRgaMQYvjkZ2dXQG2rBzaotFRapEjhspx3yRSLOWERufvu7aWS708c+F3k3VOhBUQ7eJCtjbz/Z2OfBfZWU2qwT7mPE/+UgMXB0mPagYV5OcQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la; spf=pass smtp.mailfrom=lex.la; dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b=Q6T8ZaDG; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lex.la
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b="Q6T8ZaDG"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48afe75f055so2472417f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 05:47:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lex.la; s=google; t=1791290863; x=1791895663; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OC5mtqfzbzgIq1/X/NhSCNyVOEfRnsAKjvbmtawFpSk=;
        b=Q6T8ZaDGBQalq5djdVaWXQdktxralCcEzEHUyls7DfUmEQW2Ra8vNLQ3s2eX5N23p6
         Z4dBz4/HE8GeAH86foTJ2eYONGtasg7k/6Y/Yh3GV+8vzdbSK1eBReE93iKQvjzfDUf8
         FHBVG4YjcyQuUOlQb+E/pUMC44QDRbbu4hNHvmMXq0O9bsFubTg4hzXREPsdpEVjysXp
         BVfjT4wKNhFTWCqmCgGPLa+yEMNLrU9nLH3tmJQFKKwpGPwcTc3+BbfEppAi25b/N0em
         g884yTzW3QJczyUoM+o8Hf7DotaILrkNsikGHJuV/mrSPV/bpOdFZ+R2521ZXIcr1Wqa
         hqBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791290863; x=1791895663;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OC5mtqfzbzgIq1/X/NhSCNyVOEfRnsAKjvbmtawFpSk=;
        b=uBy3quGC4BKRnuJ47iz9R0geYvZVjyei+NotW4dZctYKCE/QN74yYebosGA5U1uTbM
         Zzop9WV0MeXHTxW+lf8i1iEQsazT3QeTU7gdB4qXkKgt3piNZPKOQWu8OuAG0qpoOi3K
         Dt4PGzZhzPUg9v4upyXHPXVKT9TSrARQ2Kpm3wuOUT4EWUWjEGwJ50lGD+WuYRPsp31f
         ZC7LWN4l00N6A3Vn9ierl64lSGmeOwMV9K9gHT6YpYpDiQw1XAuNGFgJykoD/L7qtIO+
         03R/RlQeRKLEPoVCCYCSyr93rc267qF9edPdAZ13fuxZRgChm6Sw6TGvLs17IkpeGXr9
         SukA==
X-Forwarded-Encrypted: i=1; AKwUvByc6EHWrsk3ftxCjQNgKRjdiBodv3W66mbJF6NNqhE2xklVN2lQmJIJI1Nrex8IGUHfge8NFUnoMgs2l8g=@vger.kernel.org
X-Gm-Message-State: AFq9FYIQKuF93FZDa+CXQXNRLJTq3UHZPVg5Yp7xBVA71R3fP1G06KmF
	mg+hYTIsdl4EslVjOMpghbxW9Gh2FAL/FIH0CrRaJUymeFXhHs3U4PsGacWqqcqDyRs=
X-Gm-Gg: AYBFou3/+46ku5/qNLtBBVPgg5xJE3VHggDLxcD5GUIkVAhSWrzLB4UbrQjT33EonfR
	5b0H2SNTMqnuYmZVgYYv1KL/e82gRyc8hs2AMRPyE8Eh/+jjXuZEfjKnIDiHxNStHDZrCtgEddS
	MuQZvW5TS5X68b22a9UthOiQND0uFof6YegsRAZ4silFyYFdSKPQuwJcQl7g+BWOPHv9p9r72fQ
	mJPcg5qzAx0PxBC+jhX7Ks2bHpSNtLKsME7y4RgZJHxadcsDDVRg8mhYRT8PYBeiuzQ99fnS9rT
	3YwF5rU+fDkig0gM8yItwPcQcSXYmZ5cMqnKNnVCF1Li/F04kXltyGWO/8dlwTxdZ+ozPWN9jj8
	MF/3YfIHr+O/Gzls50bH3WA+kXci4ZQX6h6xB3vP2d/Yb7UyHdRGIW9nBx/EN5IGG3qpmr361B1
	exesKsZbN55XeTGmwsV5G9XGBYUmKGhb5w4ievffkMV9b/gW2giA==
X-Received: by 2002:a05:6000:2510:b0:48b:2a1:dfc1 with SMTP id ffacd0b85a97d-48c6d17d529mr2163808f8f.22.1791290862711;
        Tue, 06 Oct 2026 05:47:42 -0700 (PDT)
Received: from remote-01 ([84.17.55.224])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c622b4685sm9722003f8f.41.2026.10.06.05.47.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 05:47:42 -0700 (PDT)
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
Subject: [PATCH net-next v6 3/3] net: dsa: let user ports wait for a PHY that probes late
Date: Tue,  6 Oct 2026 15:47:31 +0300
Message-ID: <20261006124731.1528963-4-f@lex.la>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261006124731.1528963-1-f@lex.la>
References: <20261006124731.1528963-1-f@lex.la>
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
Changes in v6: the dsa.h comment says .port_enable must not use its
phy argument, rather than cope with a NULL one.

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
index 5d12191b6f6f..04b151cd52ce 100644
--- a/include/net/dsa.h
+++ b/include/net/dsa.h
@@ -455,6 +455,11 @@ struct dsa_switch {
 	 */
 	u32			dscp_prio_mapping_is_global:1;
 
+	/* Drivers whose .port_enable does not use its phy argument may set
+	 * this to let user ports wait for a PHY that needs host firmware.
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

