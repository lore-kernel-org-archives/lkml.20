Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C629B3546EE
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 03:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791518049; cv=none; b=WWs3Xx5WUvn2z6tmYcjaKTkhsv70Z+VO2dkUntIoUtpCo5ErQPsAORZOvlsLl8pzxh4+SsuBUsx+eouDsZiqnk8WJQ0YpsvIbUIl00qezIlwIwifQH01FClrM2qk4dMHIgYXmhJJKipWKQShPVNfRSae+JoYtPd+WZqHq6Eqo6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791518049; c=relaxed/simple;
	bh=r7mMgsME8BFvsUaVgt5OCIHtgxiY0A20wt5V5Cag1B4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QwYH7ayrZGhANZNQP4FqYUGwszrEyi+xq3eX3rd7ecm9zp9GaDhdDD6aI6T9dfJ+MFDWV9KF9t5SVcgeqq3KqxBZNT+IfyQSit+4KGRHKSPObIvc1Djj1xVTybp6S8YXZF5JvqQjftNkCQhN7FjfozvyOPlbp8Z7HzeV7rt6zjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m8gm7VOr; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m8gm7VOr"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-8874539bccbso3038311b3a.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 20:54:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791518042; x=1792122842; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=iTv62O+i0V/5mafMWrJRbaNT9UDYAejB8Uyj1t+bCdE=;
        b=m8gm7VOrTBOC49+lDcRYdBaKCbeT5nlC4Y5OlwRFqHAddOQrb++aqClejOu4ISsJ2O
         VtO/VitKEJ0/A2tSA3oCsu6+6b/wSBGbZX6/rC9rbJBGYIfPFv31FisvpF63eDTLG6BS
         JL/RvjqLS3s4qakj2UDIBqNdSZub4Ej/wCfISZ8GucIL9ooi0eEso8CHCrfpmQeMMpIe
         W2Sxv9mQuUzUpbp1dCyOh9y82FRyHRiOZIjtS52aNI8rQBdvybTgam/mDyYbHpbH6+KT
         wIvSGvLJyt6hFqG7zyAgN6qHr3TL0bS7K9ciDnY4TF7HSAPQBR69SAw7NZUcBZ1HI3OG
         VPxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791518042; x=1792122842;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iTv62O+i0V/5mafMWrJRbaNT9UDYAejB8Uyj1t+bCdE=;
        b=xY/chTbRnqicUA977DaXpvUwo0ZGa6H8ky+KhbMQDnyUhcOGrazfETfbsWcaJw4OxW
         V0Q5HwNscLMuf//nfOmsAGFRcu5hAKfHGBvvmpbq7CJn56MPBwfS9odwxq40UjIGiPlp
         aDWiSLyXia5QleLYh92uwdm8rR4cmhRy1NhnzCVpYip7VDatEo/RKP9+YaOWNB54TfGo
         bTYz5hytNDIhsfJAJN36QhANoG2Z0tNEU3ql/QLoRcTJ7hn7V74cVni+QSbzsTwPdbsK
         UdKbYIpXEflFaTOhy04Qh1x3lU4yLl7iksTdKefcB6CxboU7z/IvHS1Kh6/hse+8Nf9a
         K5Vg==
X-Forwarded-Encrypted: i=1; AKwUvBwFJtvFBRhBKqERHCrVu3TIgvfxTdlNQgTA2GVhbVlaVW9tx2vAkuiUzLpiz7t1Rtm5zvvmfgw2VWaXXwg=@vger.kernel.org
X-Gm-Message-State: AFq9FYL6En+9gH1Kxz4SOCfSsFI26/OvLZDyImnKHF5rChmkYwr5lv+z
	u46VNfYcBfHi22s+GSYfWNUj4IimZaY0S+9HkF0POhGRLbuNwkIuZRt5
X-Gm-Gg: AYBFou326VkAqwRFSWL3cuburYH4BFEBzDxWhV1pgKVkNGwjPFUcdMx5QDVodmv4oI3
	6zkWw3F7RBI6ZbRS4Jq97HSJ2lYTbw+baS1klFTYMnYhPMFVv6YBs+MQD/Wbi+s9IKTqVG1qSkq
	xFyzMSJThLhJlxbQaPdE0nSOGfRrevp2FV8EYGSnNFPVshZ+TE8wZRlRzMebZ5M11YHUBwj5IvX
	Kca+pxPGSqn6Z++20+eaqf2tn4JzaLxofkqdrH7q5axqtDdTVm+J+3y6k6r1YymqueoJcI6oolj
	lPugUAltC1Oy2ImJk+pRMH/5gyxeLcuOQlfiHSxMir3NNm+1VH5bIU/O6dDQJSG7UHy5uC/gPEL
	G3+H5oZh4t8UgkBPO+Cvioi9cProlVgdnSANx5AmfNpYrinwHb0v4EeLiJnHc08W7RERTfY2ddH
	En/HjrvyWv6wGVVzJJzFnVYAFaHUMBlqcf8Svlw7sYlKBuspGKyIxAHHcLqGp1gVdYJ3+MDSvZs
	IgMHQ42iLDPD9PsMbjnPCQStkhpguhMvcA=
X-Received: by 2002:a05:6a00:9508:b0:881:a5b6:7954 with SMTP id d2e1a72fcca58-897c7cd4565mr540962b3a.39.1791518042044;
        Thu, 08 Oct 2026 20:54:02 -0700 (PDT)
Received: from qiwenjie-ThinkCentre-M760t.mioffice.cn ([43.224.245.241])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-897ffffd763sm33882b3a.1.2026.10.08.20.53.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 20:54:01 -0700 (PDT)
From: Wenjie Qi <qwjhust@gmail.com>
X-Google-Original-From: Wenjie Qi <qiwenjie@xiaomi.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Cc: linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	qiwenjie@xiaomi.com,
	qwjhust@gmail.com
Subject: [PATCH] f2fs: avoid cache writeback busy loop with zero thresholds
Date: Fri,  9 Oct 2026 11:53:54 +0800
Message-ID: <20261009035354.3330915-1-qiwenjie@xiaomi.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When both cache writeback thresholds are zero,
f2fs_should_wake_up_cache_wb() returns true even with no dirty caches.
This makes wait_event_freezable_timeout() return immediately and the
writeback thread busy-loop instead of waiting for its periodic timeout.

Return false when both thresholds are disabled so periodic writeback
can proceed without busy-looping.

Fixes: d7f084b1ad93 ("f2fs: cache: wake up f2fs_writeback when exceeding threshold")
Signed-off-by: Wenjie Qi <qiwenjie@xiaomi.com>
---
Based on f2fs/dev-test at ce439a2b0690.

 fs/f2fs/cache.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/cache.c b/fs/f2fs/cache.c
index c76c4660606c5..88d4e479c8469 100644
--- a/fs/f2fs/cache.c
+++ b/fs/f2fs/cache.c
@@ -740,7 +740,8 @@ static inline bool f2fs_should_wake_up_cache_wb(struct f2fs_sb_info *sbi)
 	    nr_dirty < cache_thread->cache_wb_dirty_threshold)
 		return false;
 
-	return true;
+	return cache_thread->cache_wb_total_threshold ||
+		cache_thread->cache_wb_dirty_threshold;
 }
 
 static int f2fs_cache_writeback_kthread(void *data)
-- 
2.43.0

