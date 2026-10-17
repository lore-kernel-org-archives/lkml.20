Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A42B0344DAE
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 15:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792252528; cv=none; b=nHBUEcUIKhlg7OFxp4nTqxdl49xu5pNKSMIXLkTiDfLbNiM9yTxASLGznWK+d0OBJXEAZFhBHA+FCVjPHBEOU8Tj9VPUL5W1sETmOPm+RsuulwghTu7AmLjMZ9ErJy1yofNyhT1M/yAZfe8wGk+JWQe0L8cEwvAcsoYFHO+qtHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792252528; c=relaxed/simple;
	bh=fwQoOeDTQlTNDSNEsy/uQhba2KTo2Yu1gAYTjfEPrE0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YOjv5ZzZMoEyUw+JQrW8SF8lVceCMr7X/dZ4rON66AVZYT9u4Y1LVsq3UjcI3t3MsbH8uS7ws1gOgaJUaXjgCvKGANpgjZljuvU4TKSQbeZ9gJAqN5CXoKke0k8utnrKG1jHlHPWM65h9xdj6jfaz8dfhGQh3K0tjzEdvBNqrpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BngkCo81; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BngkCo81"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a061a13884so6095705e9.3
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 08:55:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792252523; x=1792857323; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QXeG/wl5F/jg0l6Xe/HSiMbiwMms1qM0ittRrXdiaCY=;
        b=BngkCo81hR9LoUynARC5DzL0MOm3z/89+iVt8NG8aKmUSvb5xx/3t12mJjgj/4hjgt
         vdTgRRnKOhEkXGQO8KBRCF0i1qaYt6yeYdYcF78O8mg5HhxiYl7wUsAUv3yWqbpyEzX2
         vrrKdMU9HPYMHbSDNn7w8APkHXvfbpfZenNzFK50RzzDxQPh9fvJymhvvchMMsJ1Asyf
         CHQrE9FDYOwRZrN0rcTFs0+05lyfhj0CETu0TlpTj1oSqD3rJRUS4o6uFsNDLoP/OeCk
         NuETrKYNXRKU4kGVDboR4HK7GYm+AFvJBaxHT3FY6eZDaBu9juTlM9XHHY4Vs5wbuA+F
         7fHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792252523; x=1792857323;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QXeG/wl5F/jg0l6Xe/HSiMbiwMms1qM0ittRrXdiaCY=;
        b=C1Io+7xrDWHxUYuRpARzjk8oLmiU6U/3cleSkrKQ4IqayPEPgUIPJgOWsKs9sL4BWu
         1iAuay2/gESiEzrVlg1kSZXW34lXfGueOYoe5iHnQyXALUJdZ9m1pQr8+cyB32YDlqrw
         CwqHdYPzMWZs9z0VPki2e+zKpDzKjYF7OZ82n4v+K4oLQt3iHPzfB8vc5EoW5BYMt4qJ
         a6C6B5p/lmMbTWtHE7+UaqSUVjmdB1RcAEJSN5HII5UmTPDbv58PJMCzpF72u8Tu6VPo
         1oujuuZgsHXlp33CLSQMFx3imILy0Cj7vt0zPh0KvLchElxUa+SXkJ/rEYWeClMQg2FQ
         PAZw==
X-Forwarded-Encrypted: i=1; AKwUvBwBvWs/IpHOJIXj0NnXJg8kCCTEaaodjN0otqjkNDFbvc6fCSq1NxxV4n9bXogABqLwbwP2/w/WLlngWio=@vger.kernel.org
X-Gm-Message-State: AFq9FYKaHNFgT8qQ0X64ywXF8fAObDdzuabcfT9Uv6M1yItF7QarN1R0
	jCXJx1uqbbapDD1ssNe67t3gNb0PrHRpfrxDObGVapq/fX7F+ROhOTBtd2a0LQ==
X-Gm-Gg: AYBFou0bejaWFrQb4S1F7EbKh2ufhuJ9T+4MgEpeYCCyx8VPjfEuhyAW5A5zs5zDrvH
	Ibj6Tq5KEQ+xOWK83kTv5Zn24I1So2YDfpais+1Lr9Zn7DpedFLCrbjk//w7dHA/0c31C+d5fqC
	gLRuXqMVkKE56u5C9hZDTkbigbSkOGRBeq0YN7yty2vGo1ioAosqkChIfxsF4wTiuGzeSxXGyqL
	lZjoT49owA4WOlOMSq6k4bukTYLRe96lpavYchAju4Xq0fO2Ja1UYideyHllwwCYCDr081FO7Sv
	r94w7cCFm/lUybvzG9Rfp7g54vr5MfUD03qLi4QLSYfJCo8GBu8YU3nBkdHVoGU2/OWw14Vrvk5
	XO8/kUUeGc6/OhRWB2TajPS3lP3MBOM6rb3Q3b1HVkkRb93mnzuBOwQ3Uu3Klfg3PoMsd4JAxyq
	jeyrXYo+qMOxhEF+TFpvFjRfWoxAPKYkWTV7Z/3YVtfWIrERfKN8Oj0/o6kg89IuM6g0yaLxW8a
	qKb+yy5
X-Received: by 2002:a05:600c:3b91:b0:4a1:e0b7:ff09 with SMTP id 5b1f17b1804b1-4a1e0b80060mr7487875e9.33.1792252522454;
        Sat, 17 Oct 2026 08:55:22 -0700 (PDT)
Received: from potato ([31.176.162.244])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1dea678cdsm42335505e9.1.2026.10.17.08.55.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 08:55:22 -0700 (PDT)
From: Omer El Idrissi <omer.e.idrissi@gmail.com>
To: johannes@sipsolutions.net
Cc: linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Omer El Idrissi <omer.e.idrissi@gmail.com>
Subject: [PATCH 1/2] mac80211: move static function from header to referenced file
Date: Sat, 17 Oct 2026 17:55:08 +0200
Message-ID: <20261017155509.128114-2-omer.e.idrissi@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261017155509.128114-1-omer.e.idrissi@gmail.com>
References: <20261017155509.128114-1-omer.e.idrissi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move static function from header file to only c file it's used in.

Signed-off-by: Omer El Idrissi <omer.e.idrissi@gmail.com>
---
 net/mac80211/debugfs.c    | 15 +++++++++++++++
 net/mac80211/driver-ops.h | 15 ---------------
 2 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/net/mac80211/debugfs.c b/net/mac80211/debugfs.c
index e38631d7cfb4..cce8aab1dfa6 100644
--- a/net/mac80211/debugfs.c
+++ b/net/mac80211/debugfs.c
@@ -589,6 +589,21 @@ DEBUGFS_READONLY_FILE_OPS(misc);
 
 /* statistics stuff */
 
+static inline int drv_get_stats(struct ieee80211_local *local,
+				struct ieee80211_low_level_stats *stats)
+{
+	int ret = -EOPNOTSUPP;
+
+	might_sleep();
+	lockdep_assert_wiphy(local->hw.wiphy);
+
+	if (local->ops->get_stats)
+		ret = local->ops->get_stats(&local->hw, stats);
+	trace_drv_get_stats(local, stats, ret);
+
+	return ret;
+}
+
 static ssize_t format_devstat_counter(struct ieee80211_local *local,
 	char __user *userbuf,
 	size_t count, loff_t *ppos,
diff --git a/net/mac80211/driver-ops.h b/net/mac80211/driver-ops.h
index f1c0b87fddd5..49654958531d 100644
--- a/net/mac80211/driver-ops.h
+++ b/net/mac80211/driver-ops.h
@@ -364,21 +364,6 @@ static inline void drv_sw_scan_complete(struct ieee80211_local *local,
 	trace_drv_return_void(local);
 }
 
-static inline int drv_get_stats(struct ieee80211_local *local,
-				struct ieee80211_low_level_stats *stats)
-{
-	int ret = -EOPNOTSUPP;
-
-	might_sleep();
-	lockdep_assert_wiphy(local->hw.wiphy);
-
-	if (local->ops->get_stats)
-		ret = local->ops->get_stats(&local->hw, stats);
-	trace_drv_get_stats(local, stats, ret);
-
-	return ret;
-}
-
 static inline void drv_get_key_seq(struct ieee80211_local *local,
 				   struct ieee80211_key *key,
 				   struct ieee80211_key_seq *seq)
-- 
2.53.0

