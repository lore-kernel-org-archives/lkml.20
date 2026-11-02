Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793662114;
	b=EREtBOYFGyUtKmyInU9BbriHuzm3rygWRCxKfkgN87WDeCR+TjXPjsxOBAvNL0Z8+7hF
	 TlLQHV25cK1H05JbV8haZa7qYLHdmuzb2WJvHIb3QKcjTiaD/hBn+Wzt687aunHJDNKy7
	 +o3bA+JQLdbd5UUBoAv84bMF4ucmhB+1fP40CaQ7mpMMS+BDuSxSbc4pBzUbsK1/ufil6
	 enuTHFhMK1x7EIC/8X7l4WC3XVaGqnRQn4g8dvFsSeZg9JwCrZf5sVwvgT4ZRCCcFMLNx
	 dWmml4bC+Ud+Qzu40a0oFOPzy66nl0TH6FsaDodlnYiIBAFisIhYPF/T7DBdGPHB6xg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793662114;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=NFDgu4DExLhs20v6oy1q4m4dO2KHvAHANtMtfp55qcc=;
	b=1Q2gjVs0bHavD1UlRocfElfIkhHiwJq2/+QmHWlo9FBCt7h+GVb8M6lYAnxJTocLZhzo
	 sVlOZhzafrp8yrwk1kqiVVea/gItKfcgrujXCvvIZbqv0ygwCb6AoUS19tbZ5PGZ2jomb
	 tuvtiaITFTnvDSl+zn6V02bgCnava6UH6ZTSNQBtzUiRDRGMAO7GO4NcI30qKfPb7q1vW
	 UOOCvjYQjfRTANpwL6Lu2h3b4GbcoBRm3Pmn9S5BL2S2xwnkJpyftDM8mz9B9GV4cFxCb
	 3hb05hP4OjnYT/m1MrGSXyFaB5tI35wdIvSXjQF/y4EEgQrlkIn0uwHYc/LXbcZPY8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=n6hyg2cM;
	arc=none smtp.remote-ip=209.85.210.41
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAB02606A326
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 23:28:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EAB02606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=n6hyg2cM
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-847ac7ccd85so2375202a34.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 15:28:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793662113; x=1794266913; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=NFDgu4DExLhs20v6oy1q4m4dO2KHvAHANtMtfp55qcc=;
        b=n6hyg2cM6dE/+Mwu5MpNWIa/MBf/+n2pTEYL8KGmfMWaIlKHV/KwP32yA9F60IKxRH
         HUzdpLpOmROUUt2pZ7XH6EuMWYENp6X5NePYGVSIIxRURZeBgXn+wA7j3wR/HhYLUVq0
         sLX4f9svAKoUB/sT/gDKoBVTmDdsuVsgtjvunbr0hTobE1M9jPy3NgJyiitSPjC1DL4s
         aYfYj2oV1NRir27X+X365Hp+lB23Efc3ZnYq5OG08dIiCW1x787FW3lHok67Uyu5c57r
         NcThPMSlLnn6YrHJx4dASmW6sS6Dgvn0GeRIbi9zSZwsF66JoKAYXlld17Sy0pYAWcqf
         sGuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793662113; x=1794266913;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=NFDgu4DExLhs20v6oy1q4m4dO2KHvAHANtMtfp55qcc=;
        b=cMnTNQv1t5FA6aEkckCqQ5jnsSkbnchwsg12r3d3qTLW+9h6Gq7Dk+X/UQyA3i+5Av
         Jq4meU6Tkxs1Lpcf/7qtsIF6vaQBl56CncSioUO158M6n8wO2ve5EvdRa/KE9qShuYNZ
         GSpJjtJ2cSoegnf/l/Va5lEfo5MGlP8rk1s8MOGVlqW1y5z4rBoZMWXvHfGb0dZ9Wbc0
         2N2IQOZWcfVsmfZZ8HggId2Ic7NsHvRQcU8E0uaqBxq7Q0U0Pqu+X4AKuJxRkWaA3IjD
         38p4VLYhKnQQWm+Oil7kNlgXtAHyk5WongXFy+EuF9yOSlE6S4kPB1fRMwrjdUaWX1AC
         7SiA==
X-Forwarded-Encrypted: i=1; AKwUvBzEJvFqU3HAEdboV1aAiK7UaAAEYpgMhYypJu7uYdVoHrajiquLKmN8e2IzBSRENMgB1npYSSIeJofTNGY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJJWlDIv8yQ71RpitqzYLnPp3u9t2QWMXHW91Op1kwz+hrqNndQ
	u+sXwa7KJHSbatYcmWB0+xdgZXmw3fvDivqLfQErvSU97z0RqOZT2NTAk5VFu6mX
X-Gm-Gg: AYBFou305iIlE47Zr3b9k6B0jPHzf0qnBlptPBXuJx8dTzmxdtXeugObq9Iy3CVO33K
	6yriSaalxKqppvQ2bJaruky8DbrJITvdaI0fohGYfCrC4cpBAFnZhIRZ7LH/gWB4sm+DBqBbQlp
	BPCKjQBjxJNUjlHIoX51zzQgqq+p677cXBVqGXbxNvYnvOz9JZpS1t5cg1XqLPs+O/36kSCSmzX
	JRH76CjYhtZl68xTdBYbcvwt/8I0nk8vXj5Vkr0VPKKJ2OSwoe56erUNCuqJsb3dyyzlKJhT/0K
	z0kegZTtqAbinhFG9UJYqCd53fYQIVFh3XO/sZU3Z96GTKeXE29bCc+PFpbuEHYXT49PXY3LGUA
	ezBO2VRYapwNCXke01Ft/sS6bZ7fk2bvsWR+Jl/W5OeUUew2YZJrp5g4/j40aA0mbkO4uM/CqOM
	+iQTZwZTj29EfgY0XbwATEm9g5cmFEftM7JccQG/izf6ahCO+n/9kTDywa59D6DN+0OTIve/Mcd
	+fnooFBw7jUkwCJ8nN4p+tMnzQMXs21wvPSttiohTDvAxUwwnurq8qW2x9lGxCIN4d6aYdMmLRd
	UZofi//ulOPQNVd10koKMEM4Lkwpc7ul40C1CVMO7gc+3JI09mnfmMbg8hJv8zXDyAXQiXE+6oc
	OfhI1KWYPvJL82EuKX1by25sNCyIf3haAA1Jkh66wwFh8pfh8KL2wu6wdBvrunPiEV6yWnn9u6V
	EjDMUPG5jZoRFnss+bGH4LZ+rpa7hANx4p0TCviBYWExCjTIEtKS22
X-Received: by 2002:a05:6830:43a9:b0:834:b015:ae9e with SMTP id 46e09a7af769-85d363be996mr9041682a34.12.1793662112803;
        Mon, 02 Nov 2026 15:28:32 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85d355295fbsm10550383a34.25.2026.11.02.15.28.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 15:28:32 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 02 Nov 2026 16:28:28 -0700
Subject: [PATCH net-next v2] net: phy: acx00: report receive statistics
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261102-submit-acx00-phy-stats-v1-v2-1-3c8a664407c1@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/32OQQ6CMBBFr0Jm7WiBCsSV9zAs2jLSGimkrQRCu
 LsFdWsym5n/5+Ut4MkZ8nBJFnA0Gm96G5fskIDSwraEpok7ZCwrUpZx9C/ZmYBCTYzhoGf0QQS
 PY4pNlVf3suScUwXxf3B0N9POvoGlgJamAPUniZgHqbCht64UnlA6YZXeTr/2qRPGbrk2PvRu3
 jXHdCd+jc5/jOJErbzhRUq8aCS7thH4PKq+g3pd1zciM+CV/gAAAA==
X-Change-ID: 20261024-submit-acx00-phy-stats-v1-d838f77444e8
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

Expose receive frame and byte totals through the generic PHY statistics
interface as rx_packets and rx_bytes, alongside CRC errors in rx_errors.
Report the hardware totals directly: the packet and byte counters include
errored frames as well as successfully received traffic.

Collect the free-running 32-bit counters through phylib's
update_stats callback and accumulate wrap-safe deltas in 64-bit totals.
Read the high half on either side of the low half and retry until both
high-half reads agree.

Hardware testing confirmed that the receive-byte counter wraps at
4,000,000,000, while the receive-packet and CRC-error counters wrap at
2^32. Use the corresponding modulus for each counter so rollover does
not inflate the software totals.

Serialize collection and reporting with the package-state mutex so reads
cannot race reset or power-off, and the totals are safe on 32-bit systems.
Commit a sample only after all counter reads and page restoration succeed.
The reporting callback returns cached totals without accessing MDIO.

Take a best-effort final snapshot before soft reset and suspend. Invalidate
the hardware baseline before reset or power-off, including failed power-off
attempts, and establish a fresh baseline after configuration. Preserve the
software totals across these transitions and retain the live baseline when
resume reconfigures an already active PHY. A failed initial snapshot can be
retried by the periodic collector without preventing initialization.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes in v2:
- Rebase onto current net-next and repost after the merge window.
- No functional changes.
- Link to v1: https://patch.msgid.link/20261025-submit-acx00-phy-stats-v1-v1-1-d3d461e46db0@gmail.com

To: Andrew Lunn <andrew@lunn.ch>
To: Heiner Kallweit <hkallweit1@gmail.com>
To: Russell King <linux@armlinux.org.uk>
To: "David S. Miller" <davem@davemloft.net>
To: Eric Dumazet <edumazet@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>
To: Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/net/phy/xpowers/acx00.c | 157 +++++++++++++++++++++++++++++++++++++++-
 1 file changed, 154 insertions(+), 3 deletions(-)

diff --git a/drivers/net/phy/xpowers/acx00.c b/drivers/net/phy/xpowers/acx00.c
index d19ba6d8069a..1375784d2837 100644
--- a/drivers/net/phy/xpowers/acx00.c
+++ b/drivers/net/phy/xpowers/acx00.c
@@ -8,6 +8,7 @@
 
 #include <linux/bitfield.h>
 #include <linux/device.h>
+#include <linux/ethtool.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
 #include <linux/nvmem-consumer.h>
@@ -31,6 +32,7 @@
 #define ACX00_PAGE_2				2
 #define ACX00_PAGE_6				6
 #define ACX00_PAGE_8				8
+#define ACX00_PAGE_9				9
 
 #define ACX00_PAGE0_GLOBAL_CONFIG_REG		0x13
 #define ACX00_PAGE0_XMII_RX_CLOCK_INVERT	BIT(12)
@@ -76,6 +78,29 @@
 	(ACX00_PAGE8_AUTO_CAL_TX_LEVEL_ADJUST_BYPASS | \
 	 ACX00_PAGE8_AUTO_CAL_LOW_CAL_OPAQUE_BITS)
 
+#define ACX00_PAGE9_RX_BYTES_HIGH_REG		0x19
+#define ACX00_PAGE9_RX_PACKETS_HIGH_REG		0x1b
+#define ACX00_PAGE9_RX_CRC_ERRORS_HIGH_REG	0x1d
+
+/*
+ * Hardware testing confirmed that the receive byte counter wraps at
+ * 4,000,000,000 rather than 2^32.
+ */
+#define ACX00_RX_BYTES_WRAP			4000000000ULL
+
+enum acx00_ephy_stat {
+	ACX00_STAT_RX_BYTES,
+	ACX00_STAT_RX_PACKETS,
+	ACX00_STAT_RX_CRC_ERRORS,
+	ACX00_NUM_STATS,
+};
+
+static const u8 acx00_ephy_stat_regs[ACX00_NUM_STATS] = {
+	[ACX00_STAT_RX_BYTES] = ACX00_PAGE9_RX_BYTES_HIGH_REG,
+	[ACX00_STAT_RX_PACKETS] = ACX00_PAGE9_RX_PACKETS_HIGH_REG,
+	[ACX00_STAT_RX_CRC_ERRORS] = ACX00_PAGE9_RX_CRC_ERRORS_HIGH_REG,
+};
+
 /*
  * Another integration of this exact-ID PHY documents its digital vendor
  * register map, which also matches the observed ACx00 reset values. The ACx00
@@ -86,11 +111,15 @@
 struct acx00_ephy_priv {
 	struct phy_device *phydev;
 	struct acx00_ephy_control *control;
-	/* Serializes package state and multi-register power sequences. */
+	/* Serializes package state, power sequences and statistics. */
 	struct mutex state_lock;
 	bool is_ac300;
 	bool use_low_calibration_tuning;
 	bool xmii_rx_clock_inverted;
+	bool stats_active;
+	bool stats_valid;
+	u32 stats_last[ACX00_NUM_STATS];
+	u64 stats[ACX00_NUM_STATS];
 };
 
 static int acx00_ephy_read_page(struct phy_device *phydev)
@@ -110,6 +139,105 @@ static int acx00_ephy_write_page(struct phy_device *phydev, int page)
 			   FIELD_PREP(ACX00_PAGE_SELECT_MASK, page));
 }
 
+static int acx00_ephy_read_counter(struct phy_device *phydev, u8 reg, u32 *count)
+{
+	int high, low, check;
+
+	/* The free-running counter can carry while its two halves are read. */
+	do {
+		high = __phy_read(phydev, reg);
+		if (high < 0)
+			return high;
+		low = __phy_read(phydev, reg + 1);
+		if (low < 0)
+			return low;
+		check = __phy_read(phydev, reg);
+		if (check < 0)
+			return check;
+	} while (high != check);
+
+	*count = (u32)high << 16 | low;
+	return 0;
+}
+
+static int __acx00_ephy_update_stats(struct phy_device *phydev)
+{
+	struct acx00_ephy_priv *priv = phydev->priv;
+	u32 counts[ACX00_NUM_STATS];
+	int oldpage;
+	int ret;
+	int i;
+
+	lockdep_assert_held(&priv->state_lock);
+
+	if (!priv->stats_active)
+		return 0;
+
+	oldpage = phy_select_page(phydev, ACX00_PAGE_9);
+	if (oldpage < 0)
+		return phy_restore_page(phydev, oldpage, oldpage);
+
+	for (i = 0; i < ACX00_NUM_STATS; i++) {
+		ret = acx00_ephy_read_counter(phydev, acx00_ephy_stat_regs[i],
+					      &counts[i]);
+		if (ret)
+			break;
+	}
+	ret = phy_restore_page(phydev, oldpage, ret);
+	if (ret)
+		return ret;
+
+	for (i = 0; i < ACX00_NUM_STATS; i++) {
+		u64 count = counts[i];
+
+		if (priv->stats_valid) {
+			if (count < priv->stats_last[i])
+				count += i == ACX00_STAT_RX_BYTES ?
+					ACX00_RX_BYTES_WRAP : BIT_ULL(32);
+			priv->stats[i] += count - priv->stats_last[i];
+		}
+		priv->stats_last[i] = counts[i];
+	}
+	priv->stats_valid = true;
+
+	return 0;
+}
+
+static int acx00_ephy_update_stats(struct phy_device *phydev)
+{
+	struct acx00_ephy_priv *priv = phydev->priv;
+	int ret;
+
+	mutex_lock(&priv->state_lock);
+	ret = __acx00_ephy_update_stats(phydev);
+	mutex_unlock(&priv->state_lock);
+
+	return ret;
+}
+
+static void acx00_ephy_get_phy_stats(struct phy_device *phydev,
+				     struct ethtool_eth_phy_stats *eth_stats,
+				     struct ethtool_phy_stats *stats)
+{
+	struct acx00_ephy_priv *priv = phydev->priv;
+
+	mutex_lock(&priv->state_lock);
+	stats->rx_packets = priv->stats[ACX00_STAT_RX_PACKETS];
+	stats->rx_bytes = priv->stats[ACX00_STAT_RX_BYTES];
+	stats->rx_errors = priv->stats[ACX00_STAT_RX_CRC_ERRORS];
+	mutex_unlock(&priv->state_lock);
+}
+
+static void acx00_ephy_snapshot_stats(struct phy_device *phydev)
+{
+	int ret;
+
+	/* Statistics collection must not prevent reset or power management. */
+	ret = __acx00_ephy_update_stats(phydev);
+	if (ret)
+		phydev_dbg(phydev, "failed to snapshot statistics: %pe\n", ERR_PTR(ret));
+}
+
 static int acx00_ephy_control_power_on(struct acx00_ephy_priv *priv)
 {
 	lockdep_assert_held(&priv->state_lock);
@@ -122,6 +250,10 @@ static int acx00_ephy_control_power_off(struct acx00_ephy_priv *priv)
 {
 	lockdep_assert_held(&priv->state_lock);
 
+	/* Even a failed power-off can have reset the hardware counter. */
+	priv->stats_active = false;
+	priv->stats_valid = false;
+
 	return priv->control->power_off(priv->control);
 }
 
@@ -350,6 +482,10 @@ static int acx00_ephy_soft_reset(struct phy_device *phydev)
 
 	mutex_lock(&priv->state_lock);
 
+	acx00_ephy_snapshot_stats(phydev);
+	priv->stats_active = false;
+	priv->stats_valid = false;
+
 	ret = acx00_ephy_set_interface(phydev);
 	if (ret)
 		goto out_power_off;
@@ -475,10 +611,21 @@ static int __acx00_ephy_config_init(struct phy_device *phydev)
 
 	/* Restore the standard EEE policy retained by phylib across resets. */
 	ret = genphy_c45_an_config_eee_aneg(phydev);
-	if (ret <= 0)
+	if (ret < 0)
 		return ret;
+	if (ret > 0) {
+		ret = genphy_restart_aneg(phydev);
+		if (ret)
+			return ret;
+	}
 
-	return genphy_restart_aneg(phydev);
+	if (!priv->stats_active) {
+		/* Establish a new baseline after reset, retaining the software total. */
+		priv->stats_active = true;
+		acx00_ephy_snapshot_stats(phydev);
+	}
+
+	return 0;
 }
 
 static int acx00_ephy_config_init(struct phy_device *phydev)
@@ -550,6 +697,8 @@ static int acx00_ephy_suspend(struct phy_device *phydev)
 	mutex_lock(&phydev->lock);
 	mutex_lock(&priv->state_lock);
 
+	acx00_ephy_snapshot_stats(phydev);
+
 	ret = genphy_suspend(phydev);
 	if (ret)
 		goto out_unlock;
@@ -616,6 +765,8 @@ static struct phy_driver acx00_ephy_driver[] = {
 		.soft_reset = acx00_ephy_soft_reset,
 		.config_init = acx00_ephy_config_init,
 		.disable_autonomous_eee = acx00_ephy_disable_autonomous_eee,
+		.get_phy_stats = acx00_ephy_get_phy_stats,
+		.update_stats = acx00_ephy_update_stats,
 		.suspend = acx00_ephy_suspend,
 		.resume = acx00_ephy_resume,
 	},

---
base-commit: 4dd16e31135ea8437a720222df34e8745f385d6d
change-id: 20261024-submit-acx00-phy-stats-v1-d838f77444e8

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>

