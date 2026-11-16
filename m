Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794819609;
	b=sSm5ragjs2wNTbUL9i+03WsD7jsBQoHrJEFsJ/C5sxsJutiElMZfP7ZKxPY0KGNSRWjv
	 7SMQ5Yoqn3r0wTQXQxKkCZ8tt2IUK7UENB0uIdlZYtXbXXRNARlPKvOBQC+iVAlZ1NssA
	 sxZ7h++S2wgAnQubcqXs4dFteyBCzUV+uRSXzDgu66YTd3mZTc6k5ollaC+o5isjdb7I1
	 OcsNqJiPO5DbSFkDboVrMHZCq1VH41XWJacGjWIKh3PVW+fIlvMpFs0vlbu+l2TsVm6xm
	 hfm6oH0TKq97se4J9pVzNFKdqZhA3zpDzbJRpCKQKpMpgNUCWQR54dvhbB7QDVj3Yeg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794819609;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=1HiJZr7PWBhg7c3NtSNfrad3eJhRA2sFgk4i49zzVgw=;
	b=UgM7BSVYg3pZbEOCEwo4pMPG44uGtsBEgeUFJRijYoJIbUTTjjhC/nE02BnClsvh+5GB
	 iTxaXrdD+UP1plGT+ErO/nLXAGfW1uuk5Kv9X+W4v3lD1/4CxiWhipN6OyCIUmfR0qx/X
	 bavS/cbv8pd23Yl14m+6LhXqdH8e8e7jCTYdaJUIYjOz4bUDNXINFJVx5XvwSrJtX7Txt
	 X89cDTp1jADwOcpc6dKxD+/zukMQj3PELs0/cEztT+I3aGJpUNvlY5jCJVhLEDFtDJ9yt
	 QGs9pAJGvfIkVtRzCXpStb3/HGFcvHVXyRERXPimCWF8n1i9efGG28u4Vq7sd1xh6mQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EEnC7r1b;
	arc=none smtp.remote-ip=209.85.167.171
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AD16606A8A0
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 09:00:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9AD16606A8A0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EEnC7r1b
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-4ed6d69bdfaso2729262b6e.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 01:00:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794819607; x=1795424407; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1HiJZr7PWBhg7c3NtSNfrad3eJhRA2sFgk4i49zzVgw=;
        b=EEnC7r1bPWpSVWkos9N5ngz4fzBEqtsTv4/xjUH72N+Jgi2TEA4X4ARYOnMMxFRzQy
         e4nHEDxV3eyhz/7TZ+ia5tny1PPSY1eRziGONjvslojjcD7x53KW+RXgyJ+CoPvBML17
         hApGC4UZzyAh07W3jUNIXGtpRYUxmsQRDiHUDbKZA5lR/0v8mtlkiPgZ3EBqzCMJLurY
         eqj/SbBfekA0A2VmmJOj1y2tv/3E0xVVSw2wxWjPev9HHbLU/zEghbJbbYYz7MP8Q8VM
         RYo20Ygz6hnWpra8KJRrtJqad/45gC/EvP7m22u2SNSZtyJqWdLVlh4c8l7+tG12U69K
         zLYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794819607; x=1795424407;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1HiJZr7PWBhg7c3NtSNfrad3eJhRA2sFgk4i49zzVgw=;
        b=Bm+e9Mig47K5AprqJOOn0+orpmXRPu6fxN+zcan8y1C+H8B6TL/RILVZZCvMB7Wntk
         z15vc2qCak8RjB/m2HUfdKJWHhXih+a7+cxJoyepiQynsIrupMBiLnDLGedxiTpxehwT
         /HiUK5Uy2zMTwGvOq9/h7DwU/ihieOG2uy5UwFLGnpRkHi6ZJ8GQT0II7/zFfdWHN8H7
         bgmASQcdqHjf8OZeokcQFsyV/1hZVIHspP/ty4WUVFBWmWXsJLrLoP+4/uwKpv4RYxuZ
         bzamDDIvco9HW6ZWH19PZgIwb9mAH5jc/jqNrWLLB8OIpZct85Z7ES574fH/zDRA6KFW
         0kKg==
X-Forwarded-Encrypted: i=1; AL+hErEdx7ju5pl91NedtwX0Cs7AAx/8bwcg11hNdSn87IOTqMDMyS1j66G8SHzjqFgNGsv7vbY4mPdXQgUuGvQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+4QYwwPUgNRegMxN7w+d/hJyzP/izAG+ALXerulj+c3bGRKckR
	ZFVSay6iByM8uecf7Qwb57PDmsUXNa4VTCR6oKcl2SlnceavmTSiGUPl
X-Gm-Gg: AYBFou3Sey815AYm6YDDxNOxYbcAhTabBiDYNANW56be9ohXXaQUDEBG2fiWz8W+agw
	og17SNKAZay0dFrZPAWImc8wmtq96s9eFjQk0u88lx9+CNFDDkvVlFroQrEVSl4aJuvM+Sml6wL
	Dy7qIzh/Xo78EnVorL59EKpiLC/2nmUlndGF4bMBLlISoZ/gj15reDNme5qDnr9hungOk6+4QIn
	/SMBnOlenlXGoD4P3wHkCvMX2F2I1T8vwLBKwQnm8fZeuPVTu513V8P71etEQTKwaOp1t/P3rmX
	IxwL87fRSNOvJY5K3qzy3oKPjcNdOmy/Lf8LeG9hk9jZ9zDI7mMt9TcxZOP8VBfDL2pRkj6oVGw
	oVvhOghoU22at+Qm+gqc+GIdu4JsXSOVadJ8is+KcOJcQD3xEOzdBaheGfPW2AlsuGJ3rrivH0X
	yxOSWyNm1wopNzcsdz+R1+Vnxi1/cJEfd3YpEd/IA7VMjA/UM+hfJoQOjypXTsvkGlS53BNdO9R
	xrTx3rIQzVaHi+RQIBzqT1dDtdrkKLoWrtuDMs5uzovdMEEydias/kuukSjq7vVg9qEJcnZOkti
	2HaZndIWhSsJbj2rQhMed+Ihh0YlBfVIY3mtxXW3UXurxJ8Xgfu6igdDwnOit0FClEZND+QySTW
	CFgw0/starbL5Je03NvuYLvohqamzBD0NbH+yA4a2+1fTcWu9Z13Fmhv1Er7ayWQA7wvEfSvvTJ
	JWv+TSF4EuC/xKTma2eB23IbEhuGbmiCDQgbT6cPhlBHrZGyBDibc=
X-Received: by 2002:a05:6808:3089:b0:573:8745:a99c with SMTP id 5614622812f47-5738745ad73mr3144377b6e.62.1794819607303;
        Mon, 16 Nov 2026 01:00:07 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5750329397bsm719177b6e.6.2026.11.16.01.00.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 01:00:06 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 16 Nov 2026 01:59:59 -0700
Subject: [PATCH net-next v6 3/3] net: phy: acx00: report receive statistics
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
Message-Id: <20261116-submit-acx00-phy-stats-v1-v6-3-8feef8e76cd5@gmail.com>
References: <20261116-submit-acx00-phy-stats-v1-v6-0-8feef8e76cd5@gmail.com>
In-Reply-To: <20261116-submit-acx00-phy-stats-v1-v6-0-8feef8e76cd5@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: Oleksij Rempel <o.rempel@pengutronix.de>, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.17-dev

AC200 and AC300 count received frames including those with CRC errors.
Subtract the CRC-error count to report successful frames through the
existing PHY rx_packets statistic, and report CRC errors through
rx_errors. Report the hardware byte total through rx_bytes, including
bytes in frames with CRC errors.

The free-running packet and CRC-error counters both wrap at 2^32.
Read each counter high/low/high to detect a carry, and bracket the packet
read with an unchanged CRC count before subtracting. Their difference
also wraps at 2^32. Accumulate its wrap-adjusted deltas in a 64-bit total.

Hardware measurements on AC200 and AC300 established a receive-byte
modulus of 4,000,000,000. The byte counts include Ethernet headers, padding
and FCS, but exclude preamble and SFD. Apply that modulus to byte deltas
and skip byte samples at or above it without changing their baseline.

Bound sampling retries to avoid retaining the PHY and MDIO locks
indefinitely. When CRC errors keep arriving, update rx_errors from the
latest stable error read without advancing the successful-frame baseline.
A later coherent pair accounts for the intervening successful frames.
Collect bytes independently of that pair. An unstable sample is not an
MDIO error: returning a synthetic error from update_stats would make
phylib take the link down. Real MDIO errors, including page-restoration
failures, still propagate.

Serialize sampling, reporting and power transitions with the package
mutex. Commit samples only after page restoration succeeds, and return
cached totals from get_phy_stats without further MDIO access.

Invalidate baselines before soft_reset or power-off, since phylib may
already have reset the counters. Take a best-effort snapshot before
suspend and start new intervals on resume, including when WoL retained
power while polling stopped. Keep a separate sampling time for each
counter and discard deltas after gaps of at least 320 seconds, including
system sleep and register-read time. At 100 Mb/s, that bounds the byte
counter and conservatively bounds the frame counters even at one frame
per received byte. Retain accumulated totals across these gaps and power
transitions, without inventing an unobservable number of counter cycles.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/net/phy/xpowers/acx00.c | 223 +++++++++++++++++++++++++++++++++++++++-
 1 file changed, 220 insertions(+), 3 deletions(-)

diff --git a/drivers/net/phy/xpowers/acx00.c b/drivers/net/phy/xpowers/acx00.c
index cee6c7ff0278..0015816fad07 100644
--- a/drivers/net/phy/xpowers/acx00.c
+++ b/drivers/net/phy/xpowers/acx00.c
@@ -8,12 +8,14 @@
 
 #include <linux/bitfield.h>
 #include <linux/device.h>
+#include <linux/ethtool.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
 #include <linux/nvmem-consumer.h>
 #include <linux/of.h>
 #include <linux/phy.h>
 #include <linux/slab.h>
+#include <linux/timekeeping.h>
 
 #include "../phylib.h"
 #include "acx00.h"
@@ -31,6 +33,7 @@
 #define ACX00_PAGE_2				2
 #define ACX00_PAGE_6				6
 #define ACX00_PAGE_8				8
+#define ACX00_PAGE_9				9
 
 #define ACX00_PAGE0_GLOBAL_CONFIG_REG		0x13
 #define ACX00_PAGE0_XMII_RX_CLOCK_INVERT	BIT(12)
@@ -76,6 +79,26 @@
 	(ACX00_PAGE8_AUTO_CAL_TX_LEVEL_ADJUST_BYPASS | \
 	 ACX00_PAGE8_AUTO_CAL_LOW_CAL_OPAQUE_BITS)
 
+#define ACX00_PAGE9_RX_BYTES_HIGH_REG		0x19
+#define ACX00_PAGE9_RX_PACKETS_HIGH_REG		0x1b
+#define ACX00_PAGE9_RX_CRC_ERRORS_HIGH_REG	0x1d
+
+/*
+ * AC200 and AC300 hardware testing confirmed that the receive byte counter
+ * wraps at 4,000,000,000 rather than 2^32.
+ */
+#define ACX00_RX_BYTES_WRAP			4000000000ULL
+/* At 100 Mb/s, a full byte-counter cycle takes at least 320 seconds. */
+#define ACX00_STATS_MAX_INTERVAL_MS		(ACX00_RX_BYTES_WRAP * 8 / (SPEED_100 * 1000))
+#define ACX00_COUNTER_READ_ATTEMPTS		3
+
+enum acx00_ephy_stat {
+	ACX00_STAT_RX_PACKETS,
+	ACX00_STAT_RX_CRC_ERRORS,
+	ACX00_STAT_RX_BYTES,
+	ACX00_NUM_STATS,
+};
+
 /*
  * Another integration of this exact-ID PHY documents its digital vendor
  * register map, which also matches the observed ACx00 reset values. The ACx00
@@ -86,11 +109,16 @@
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
+	u8 stats_valid;
+	ktime_t stats_start[ACX00_NUM_STATS];
+	u32 stats_last[ACX00_NUM_STATS];
+	u64 stats[ACX00_NUM_STATS];
 };
 
 static int acx00_ephy_read_page(struct phy_device *phydev)
@@ -110,6 +138,169 @@ static int acx00_ephy_write_page(struct phy_device *phydev, int page)
 			   FIELD_PREP(ACX00_PAGE_SELECT_MASK, page));
 }
 
+/* Return 0 on success, 1 for an unstable sample, or a negative MDIO error. */
+static int acx00_ephy_read_counter(struct phy_device *phydev, u8 reg, u32 *count)
+{
+	int high, low, check;
+	int i;
+
+	/* The free-running counter can carry while its two halves are read. */
+	for (i = 0; i < ACX00_COUNTER_READ_ATTEMPTS; i++) {
+		high = __phy_read(phydev, reg);
+		if (high < 0)
+			return high;
+		low = __phy_read(phydev, reg + 1);
+		if (low < 0)
+			return low;
+		check = __phy_read(phydev, reg);
+		if (check < 0)
+			return check;
+		if (high != check)
+			continue;
+
+		*count = (u32)high << 16 | low;
+		return 0;
+	}
+
+	return 1;
+}
+
+/* Return a mask of usable counters, or a negative MDIO error. */
+static int acx00_ephy_read_counts(struct phy_device *phydev, u32 *counts)
+{
+	u32 packets, errors;
+	int ret;
+	int i;
+
+	ret = acx00_ephy_read_counter(phydev, ACX00_PAGE9_RX_CRC_ERRORS_HIGH_REG,
+				      &counts[ACX00_STAT_RX_CRC_ERRORS]);
+	if (ret)
+		return ret < 0 ? ret : 0;
+
+	/* Bracket the packet counter with an unchanged CRC count. */
+	for (i = 0; i < ACX00_COUNTER_READ_ATTEMPTS; i++) {
+		ret = acx00_ephy_read_counter(phydev, ACX00_PAGE9_RX_PACKETS_HIGH_REG,
+					      &packets);
+		if (ret < 0)
+			return ret;
+		if (ret)
+			break;
+		ret = acx00_ephy_read_counter(phydev, ACX00_PAGE9_RX_CRC_ERRORS_HIGH_REG,
+					      &errors);
+		if (ret < 0)
+			return ret;
+		if (ret)
+			break;
+		if (errors == counts[ACX00_STAT_RX_CRC_ERRORS]) {
+			/* Both hardware counters and their difference wrap at 2^32. */
+			counts[ACX00_STAT_RX_PACKETS] = packets - errors;
+			return BIT(ACX00_STAT_RX_PACKETS) | BIT(ACX00_STAT_RX_CRC_ERRORS);
+		}
+		counts[ACX00_STAT_RX_CRC_ERRORS] = errors;
+	}
+
+	/* Keep reporting errors even when no coherent packet sample is possible. */
+	return BIT(ACX00_STAT_RX_CRC_ERRORS);
+}
+
+static int __acx00_ephy_update_stats(struct phy_device *phydev)
+{
+	struct acx00_ephy_priv *priv = phydev->priv;
+	u32 counts[ACX00_NUM_STATS];
+	ktime_t start;
+	int oldpage;
+	int valid;
+	int ret;
+	int i;
+
+	lockdep_assert_held(&priv->state_lock);
+
+	if (!priv->stats_active)
+		return 0;
+
+	start = ktime_get_boottime();
+	oldpage = phy_select_page(phydev, ACX00_PAGE_9);
+	if (oldpage < 0)
+		return phy_restore_page(phydev, oldpage, oldpage);
+
+	valid = acx00_ephy_read_counts(phydev, counts);
+	if (valid < 0) {
+		ret = valid;
+		goto out_restore_page;
+	}
+
+	ret = acx00_ephy_read_counter(phydev, ACX00_PAGE9_RX_BYTES_HIGH_REG,
+				      &counts[ACX00_STAT_RX_BYTES]);
+	if (ret < 0)
+		goto out_restore_page;
+	if (!ret && counts[ACX00_STAT_RX_BYTES] < ACX00_RX_BYTES_WRAP)
+		valid |= BIT(ACX00_STAT_RX_BYTES);
+	ret = valid;
+
+out_restore_page:
+	ret = phy_restore_page(phydev, oldpage, ret);
+	if (ret < 0)
+		return ret;
+
+	for (i = 0; i < ACX00_NUM_STATS; i++) {
+		u64 count;
+
+		if (!(ret & BIT(i)))
+			continue;
+		count = counts[i];
+
+		/* Include sleep and read time; unseen cycles cannot be recovered. */
+		if ((priv->stats_valid & BIT(i)) &&
+		    ktime_ms_delta(ktime_get_boottime(), priv->stats_start[i]) <
+		    (s64)ACX00_STATS_MAX_INTERVAL_MS) {
+			if (count < priv->stats_last[i])
+				count += i == ACX00_STAT_RX_BYTES ?
+					ACX00_RX_BYTES_WRAP : BIT_ULL(32);
+			priv->stats[i] += count - priv->stats_last[i];
+		}
+		priv->stats_last[i] = counts[i];
+		priv->stats_start[i] = start;
+		priv->stats_valid |= BIT(i);
+	}
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
+	stats->rx_errors = priv->stats[ACX00_STAT_RX_CRC_ERRORS];
+	stats->rx_bytes = priv->stats[ACX00_STAT_RX_BYTES];
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
@@ -122,6 +313,10 @@ static int acx00_ephy_control_power_off(struct acx00_ephy_priv *priv)
 {
 	lockdep_assert_held(&priv->state_lock);
 
+	/* Even a failed power-off can have reset the hardware counter. */
+	priv->stats_active = false;
+	priv->stats_valid = 0;
+
 	return priv->control->power_off(priv->control);
 }
 
@@ -350,6 +545,10 @@ static int acx00_ephy_soft_reset(struct phy_device *phydev)
 
 	mutex_lock(&priv->state_lock);
 
+	/* phylib may already have reset the counters before calling us. */
+	priv->stats_active = false;
+	priv->stats_valid = 0;
+
 	ret = acx00_ephy_set_interface(phydev);
 	if (ret)
 		goto out_power_off;
@@ -475,10 +674,21 @@ static int __acx00_ephy_config_init(struct phy_device *phydev)
 
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
+
+	if (!priv->stats_active) {
+		/* Establish a new baseline after reset, retaining the software total. */
+		priv->stats_active = true;
+		acx00_ephy_snapshot_stats(phydev);
+	}
 
-	return genphy_restart_aneg(phydev);
+	return 0;
 }
 
 static int acx00_ephy_config_init(struct phy_device *phydev)
@@ -534,6 +744,9 @@ static int acx00_ephy_resume(struct phy_device *phydev)
 	int ret;
 
 	mutex_lock(&priv->state_lock);
+	/* WoL can keep the PHY counting while phylib polling is stopped. */
+	priv->stats_active = false;
+	priv->stats_valid = 0;
 	ret = __acx00_ephy_power_on_and_resume(phydev);
 	mutex_unlock(&priv->state_lock);
 
@@ -550,6 +763,8 @@ static int acx00_ephy_suspend(struct phy_device *phydev)
 	mutex_lock(&phydev->lock);
 	mutex_lock(&priv->state_lock);
 
+	acx00_ephy_snapshot_stats(phydev);
+
 	ret = genphy_suspend(phydev);
 	if (ret)
 		goto out_unlock;
@@ -616,6 +831,8 @@ static struct phy_driver acx00_ephy_driver[] = {
 		.soft_reset = acx00_ephy_soft_reset,
 		.config_init = acx00_ephy_config_init,
 		.disable_autonomous_eee = acx00_ephy_disable_autonomous_eee,
+		.get_phy_stats = acx00_ephy_get_phy_stats,
+		.update_stats = acx00_ephy_update_stats,
 		.suspend = acx00_ephy_suspend,
 		.resume = acx00_ephy_resume,
 	},

-- 
2.53.0

