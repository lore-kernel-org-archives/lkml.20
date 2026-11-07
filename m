Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794016642;
	b=oFOXD+ulG3TYcKo5WMbPWN+EHCsHe0RemmrRtK7XiZROedTin8PjojBPHScSNd+ZVAED
	 AEsy38mh3WyL2M7cusyb+luTdJaF7I+mFqIcdHTzk9upT1Bpvor5c/JNyigJDwYYZz+1T
	 491O33oM150OSg1HecHx7mtH4hB7k+l4Pj3M4PHlNU1y7YWTC8VRERwQMEXAaaVPk3U5c
	 MdHZlZRVg6tRSB7i0h5vySf5edil7/Jx8/pd2fg65i4qng40sjx7m2la9QDmjyNxDjtG9
	 ZYnzhEVaZj/kYpxt7CfQwAtCYtsjlVVzSCYYbl8Wj3lbBVJQs+xjd5LrvxxxRGD7xQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794016642;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=aM/9AZLMcSzxD1aLNpLwoPEXj32FUtJsoBh4AdJyC94=;
	b=RyEBPFAb63f8ZNykTs/srJPvxdHUq8gmhBLRGOC7hxNybBgG5EyTPX2CjPLsols3uPwf
	 qUBdusONdkDfCE9VKO5Kx0KNHXn/1CUC7tHNHt3iqCVXFpY3dpxbBXaUIqdfoJRYHoS0F
	 BHhTAt/GGadmbwDPD5lfmrQX8oYBeZogwVexhtcNmXTOfApSK4yJS0+mEhW5BATy4pr9H
	 l8hbphVSrUvK57p6WH7vIkCjxsn9II9Qp3t+ybyP5gOc0aFbaVOMH0IPzZopLLi9yAxFr
	 C6n4RGxIVaMhLmjF5xI1ro7z7YH6Ta17J/3IHxrh5P8z/8WJldk4/1z+McmjlfWWwaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qUAoLwXw;
	arc=none smtp.remote-ip=209.85.214.170
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4414D606A32D
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 01:57:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4414D606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qUAoLwXw
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2ed2bfe3252so4473665ad.3
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 17:57:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794016641; x=1794621441; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=aM/9AZLMcSzxD1aLNpLwoPEXj32FUtJsoBh4AdJyC94=;
        b=qUAoLwXwIxfgjdR23kmwtRBqlsKmAu8lPo3c2Q2d29iAPhHgmr7tDbVexsjLva5bMO
         LrsS3Wq0jzVO71eV/eD/FT74p8hfXrrx1SfvxQN4mnPPndgyEGgLfsv6B5lSj054yu3U
         ba7nK5voZUB//e0N4TyfUhZ914S9k/CgV7INVx7ai77+xE4qgMJVb1NFJG1DFSNe9+uX
         8OVAifeKViipSY4LKnS5XGh6OOJOBo0kD26C67PYY6dc27C/A1BI5JZ7WqQgA7qB1kHZ
         /Yq4j6+zntY0nbTvP9ebeVANxWFN84VLzJwfrVkl3X1yJz9JtgTh+SD5VqiRpauZ5Wdr
         jDQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794016641; x=1794621441;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aM/9AZLMcSzxD1aLNpLwoPEXj32FUtJsoBh4AdJyC94=;
        b=rNO/JkMFHTb4cYtBUwGHB3XtTwLOQP4WEVOYcrWYD8ih6zuYwXv5Uvl71GY3fjZ1xa
         D0mJtJOD/mLJY3QQo8X1lJ6Au1XN9+n3twGwM3XxIEw4XdxxG+o2Q6dmISf5Regq4rnC
         EBxA929Kb6m1XnNPhxJz0xvc2qooYPk/EaqUUF9PJ7Q2odGRDmwz/jLP6K7gmsEbkvym
         jzcdu2RB8DI1qCNaGv1FNisg+sPedosENvtJl5K+FamsjSJMmWbFJwciZl1CEQNRHZP6
         e18vSiT+b5MGf+rfO9yxh4gKWg0veTMlmHCQcl1XlhGrqwr/t2ARupDy2hnoaKa5fPXp
         b0uw==
X-Forwarded-Encrypted: i=1; AL+hErGx8znYh1/YwedP9mI5oA0dJ/b1W8HjlL0qn9G5/Wj+imkaZXzlCyuSXmiE82E6iyWeJqPpMzqFGpGFOPY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/ilm2/Vs/YjmV/M0JPs+3gSwy0o4hORnNmPJslE7FCVgvIOvWq
	9V2xQ6pZHg7FP+19K0GyYdd70Q8O5Uf7TI7j2pXFLUuzYihmRm7PDzj9
X-Gm-Gg: AYBFou3tYxBcc/Fs+lN4XtzcIePtwl6OaSojWmIuVfSw3UmeOLK774mo14/kbHFcJCo
	vTZHaBudlM5r8B9ZtsIlLo/oY/o8n2nDCkb9/A06FFwE/Im7nn5eFUWGfvFfBnyfahpC6mBxDNT
	A6JvddYRCKjslVxiBYa0fks/MkBBfgzKEE5PQPkhSVKS3uFbe2jTggVUfz7RRiIaF8KvD3LC6vZ
	MwMAt9db+6OTwFabmpbVi8tSoQftYOsxUU/HCeGJcDHGhdqXKO7FGMqItfIRFkaNf85XyM2atSl
	XjzZKIyohgQIX8rnWGDRzODSsFubWuD40IlzTrw7TZP662zE3s6y3jparohVPH2b28LggOb8uRL
	DFRSdjjYCQp8ARP2i9yBmUCLH7uTZMhh+pOGn85Jo5Nmgts75eQPwwAs9M7DCXPjVn+CmBuA5hN
	IxG9p24CXI5M3AXjMCedeFqmQzB5z0SX91zPKZGzLiG2UyoqRVwR5xlh4RWfOLzYlAHs8pbdiXB
	YT8nXojo8zOv3sVSjU+3t+joJEaW9SUhcw1We+QnR1dFm95l2RP2u0GvF4szuUifBlagTW8ck7+
	vWCNw+AoYLOY4RhCXTgT5BuM9hdMQZK4DCno3QLGdJ3ILYqSYrmW
X-Received: by 2002:a17:902:ebc6:b0:2e8:3d48:4d92 with SMTP id d9443c01a7336-2ed41aa1529mr47429105ad.33.1794016641247;
        Fri, 06 Nov 2026 17:57:21 -0800 (PST)
Received: from d.home.yangfl.dn42 ([2a09:bac1:7680:28::4:396])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed47d8949fsm10217915ad.62.2026.11.06.17.57.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 17:57:20 -0800 (PST)
From: David Yang <mmyangfl@gmail.com>
To: netdev@vger.kernel.org
Cc: David Yang <mmyangfl@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH net v3] net: dsa: motorcomm: Prevent rx_bytes/tx_bytes underflow
Date: Sat,  7 Nov 2026 09:54:43 +0800
Message-ID: <20261107015447.335056-1-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There is no direct rx_bytes/tx_bytes counter excluding the FCS; both
have to be derived as good_bytes - ETH_FCS_LEN * frames. Three hazards
can pair a frame count with a mismatched byte count and make the
subtraction underflow, reporting rx_bytes or tx_bytes as about 2^64:

- a register read fails midway and the half-refreshed buffer is
  published as is, pairing fresh frame counters with stale byte
  counters;
- get_stats64() on 64-bit kernels reads the published counters without
  any sequencing across fields (u64_stats_sync is a no-op there), so a
  writer update can slip between the frame and byte reads;
- the MIB bank cannot be read as a whole; counters keep counting while
  the read loop walks the table.

Handle this in the writer: do not publish a half-read buffer, keep the
last complete sample on read failure, do the arithmetic on the complete
sample under priv->reg_lock, and publish the derived byte counters only
when check_sub_overflow() succeeds, so that get_stats64() copies plain
published values.

Found by LLM.

Fixes: 186623f4aa72 ("net: dsa: yt921x: Add support for Motorcomm YT921x")
Signed-off-by: David Yang <mmyangfl@gmail.com>
---
v3:
 - prevent underflow anyway
v2: https://lore.kernel.org/r/20261103134705.867613-1-mmyangfl@gmail.com
 - more issues found by sashiko
v1: https://lore.kernel.org/r/20261102101334.3525485-1-mmyangfl@gmail.com
 drivers/net/dsa/motorcomm/mib.c | 25 +++++++++++++++++--------
 drivers/net/dsa/motorcomm/mib.h |  2 ++
 2 files changed, 19 insertions(+), 8 deletions(-)

diff --git a/drivers/net/dsa/motorcomm/mib.c b/drivers/net/dsa/motorcomm/mib.c
index 6b170fc6e187..09b3e6b98bdd 100644
--- a/drivers/net/dsa/motorcomm/mib.c
+++ b/drivers/net/dsa/motorcomm/mib.c
@@ -95,6 +95,8 @@ static int yt921x_mib_read(struct yt921x_priv *priv, int port)
 	unsigned long flags;
 	u64 rx_frames;
 	u64 tx_frames;
+	u64 rx_bytes;
+	u64 tx_bytes;
 	int res = 0;
 
 	mib = &pm->stats;
@@ -127,6 +129,12 @@ static int yt921x_mib_read(struct yt921x_priv *priv, int port)
 		buf[i] = val;
 	}
 
+	if (res) {
+		dev_err(dev, "Failed to %s port %d: %i\n", "read stats for",
+			port, res);
+		return res;
+	}
+
 	flags = u64_stats_update_begin_irqsave(&pm->syncp);
 	for (size_t i = 0; i < ARRAY_SIZE(yt921x_mib_descs); i++)
 		u64_stats_set(&((u64_stats_t *)mib)[i], buf[i]);
@@ -146,12 +154,15 @@ static int yt921x_mib_read(struct yt921x_priv *priv, int port)
 		    u64_stats_read(&mib->tx_jumbo);
 	u64_stats_set(&pm->rx_frames, rx_frames);
 	u64_stats_set(&pm->tx_frames, tx_frames);
+	if (!check_sub_overflow(u64_stats_read(&mib->rx_good_bytes),
+				ETH_FCS_LEN * rx_frames, &rx_bytes))
+		u64_stats_set(&pm->rx_bytes, rx_bytes);
+	if (!check_sub_overflow(u64_stats_read(&mib->tx_good_bytes),
+				ETH_FCS_LEN * tx_frames, &tx_bytes))
+		u64_stats_set(&pm->tx_bytes, tx_bytes);
 	u64_stats_update_end_irqrestore(&pm->syncp, flags);
 
-	if (res)
-		dev_err(dev, "Failed to %s port %d: %i\n", "read stats for",
-			port, res);
-	return res;
+	return 0;
 }
 
 void yt921x_mib_poll(struct work_struct *work)
@@ -391,10 +402,8 @@ yt921x_dsa_get_stats64(struct dsa_switch *ds, int port,
 
 		stats->rx_packets = u64_stats_read(&pm->rx_frames);
 		stats->tx_packets = u64_stats_read(&pm->tx_frames);
-		stats->rx_bytes = u64_stats_read(&mib->rx_good_bytes) -
-				  ETH_FCS_LEN * stats->rx_packets;
-		stats->tx_bytes = u64_stats_read(&mib->tx_good_bytes) -
-				  ETH_FCS_LEN * stats->tx_packets;
+		stats->rx_bytes = u64_stats_read(&pm->rx_bytes);
+		stats->tx_bytes = u64_stats_read(&pm->tx_bytes);
 		stats->rx_dropped = u64_stats_read(&mib->rx_dropped);
 		/* stats->tx_dropped */
 		stats->multicast = u64_stats_read(&mib->rx_multicast);
diff --git a/drivers/net/dsa/motorcomm/mib.h b/drivers/net/dsa/motorcomm/mib.h
index 9c24a52d46cc..2e2b832cb245 100644
--- a/drivers/net/dsa/motorcomm/mib.h
+++ b/drivers/net/dsa/motorcomm/mib.h
@@ -136,6 +136,8 @@ struct yt921x_mib {
 	struct yt921x_mib_stats stats;
 	u64_stats_t rx_frames;
 	u64_stats_t tx_frames;
+	u64_stats_t rx_bytes;
+	u64_stats_t tx_bytes;
 	/* protected by priv->reg_lock */
 	u64 data[YT921X_MIB_STAT_NUM];
 };
-- 
2.53.0

