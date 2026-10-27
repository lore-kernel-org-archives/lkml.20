Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793117055;
	b=bphkL+10oPgFx9eBYO6KjbIFGflHJO2o0GenW9SNFhG4KiGCEqTmqLVv3uA9zxJ29eve
	 DmvL4sI9zdQRprn6xEIvDmJYdbNgrGE88d97Gw/RYbaNILljdtDWOMyTvKkcNjBblg/u8
	 4yNQzok6vI9zUsNzkxNUyVZJwkTp60+6ZR7I41jeB/m+klYj7EKVDhxR3Vi9rLk67YxWS
	 y8Hl1zHkeV3xYWeA3FdbcQwNU+SvlY1sjC9VfoxbZhMx97qGzoxzye1mLGVqSwQKP8jjq
	 H6CnQqtKotNkaxEVszbKF34dMgg1AIG2pD73vD2RqAnpJ448PVsbs20QJ18r0IZuI5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793117055;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=5d5oBiDNym+XgxzH0b6C3qDhntNhLNghMGNMGMVJJaQ=;
	b=iG6QFZEAoE0HudlNZj3NSHTppO6dTszbzhqtBJ+GbK5AvRjB1gzcWJmHzViWTG/YpYep
	 qDxn6rcu8HujsDEtp+/pFtF5nJD3HWwi1KWLaNWNDCDFKk2ayRRE5o4bm8WOw1KsPx7/g
	 6NJJ6ZG8sbbUA7OcRJl7axIfx8/xo8QAJymApQBSm9RNqVICJwmgh8rByY2Z61000OR6m
	 K23xz7HXiXN5F9sv9TGGYQ7UOmpvueOu7iRWSq/9FJkY/jf+gvTo/ijMpCy+FSF4aSfGB
	 AWlIgI3zXFXzMjPJ3iYgEtJLhvwh14k6kOlKFY0xopLO7DN31qpeDs2XYFRnpOjqEkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=garMCfw5;
	arc=none smtp.remote-ip=209.85.216.46
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE970606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 16:04:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DE970606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=garMCfw5
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3ac78f4c10bso42567a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 09:04:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793117054; x=1793721854; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5d5oBiDNym+XgxzH0b6C3qDhntNhLNghMGNMGMVJJaQ=;
        b=garMCfw5pnI4iP8KIN59/ZxLf51UboH/1T4Stm+yj7le2DTh6DAsrzwhHPWrHa4sDY
         3bVHg86ty1uBiv1gXgW0sTS6maWRt3Tv9N446cCye4NeKcK8prb09govAUiHng6ogVZ9
         TA/hFebIbSn8HEae4L0SCJUn2EqPHlQkc99UTQsQz7c9VTqMyVl4IWGYvgp6uhjVEGYJ
         fbPwzC4gPGIo9w++1ljsoIkkZsU6VpBkFkDoT9jU5t99J6ubNfPn1OsX5yuoTmc4Onu2
         Gg+G9QE46RZMGqJCPE+g9p9Qk88Ol/fTcQG5xmWPW/XPOCzGsb9dJWbD6tkZSy3hCUGe
         dQKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793117054; x=1793721854;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5d5oBiDNym+XgxzH0b6C3qDhntNhLNghMGNMGMVJJaQ=;
        b=vw+w+MIMCuCnX395ZvKpo1oXA5JqNpI6z6O5H6iaPqRDO4R/Ns/6UVTSSeVddfWlgF
         s77E3ZsUWwQJk0HhSzhGJXNy0Gf7Z4JYL+Tnhz4qv13c/rTPpRKGU3WPPpf8gt3M68L0
         rw9P5ddl0KUxk09jpNG9k5owbkRatvRT9SfwGBrZyQl6Aiusg9UEJqNR3845HeNgACvl
         cvE5ijpeZYMmGD5Pc1FngokutHDkwHcR4jdhtKGWQqVr1x90YHpq+Vp4uZvAdQ3Dd94B
         Fd2lgfR4caNT4ICLrgsEuB2TqH04Aws+aTrARp9jgtuACIaqBP2q/Bq6bs3zyPdix7Yg
         rtDg==
X-Gm-Message-State: AFq9FYLnMq+8x7aIHpzM+JZ8WFufQO8UP40VQZBfQxBVrEsQoYa2bV0W
	qrKvHEOz1/114tk+k7Vo7XUYgC/02wm+2PxZHvBPnFXQtaZxsW0/BGR0
X-Gm-Gg: AYBFou3qfFUwrCVVDwePi5WR7NzT8E+759NcpnQvc+tsVlSge854gPEniqEWPf1Hjb5
	sc/jwf9J6F6lQUQ7uljItEclAwIRzwbyZwTrO0smG+YZ1rjpLAMCSgWgihClupitWk7JBX6bzhx
	UFMmyT+WMTvoyvk5NtGdJTPuks28RwQ88bBDj2TXhSbQ6hCpY+2/YYog0sLRBdkjpOjLJrlUoUM
	k/l5i6+2lBPtCoOftBbpJAJ3QbHTtGBCgSo4eBGuUXDqg2/4iyqrwFHWLZMCiVJeKB254SdM+XK
	yH//znifkwE5MzGG/t64uceX/sNraCHzNp15SkrqA2kCT1ACfkVdu2zrTr1pCfmDaKKwYIvayq1
	sl0u1LUv7qLsupiuu5T6+zxKvM4dSoiYmUSxlU4IND/66dalfmSJ3S0t5AsXeTiZLgzdtNaHyHo
	b3SU02SDQfZlxb7xwbceKAy38+yVglO+b+4uXlWZWwujI4h/0U3mwXiUR2rnT2NQBTu6Cylfoc3
	K75hw9jBZ0g/6rJqxTvh/8Nffk91xrzx86DGBENA2RxComZEbrJcB/lv1aTCnboe6gZmUHBxkMp
	0l7cV0W5eTpeD4WfiWQ=
X-Received: by 2002:a17:90b:4cd1:b0:3a8:1943:cb7a with SMTP id 98e67ed59e1d1-3adead44808mr7894909a91.18.1793117053971;
        Tue, 27 Oct 2026 09:04:13 -0700 (PDT)
Received: from localhost.localdomain (vmi2317719.contaboserver.net. [84.247.152.64])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebb1e37esm8365129a91.4.2026.10.27.09.04.05
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 27 Oct 2026 09:04:13 -0700 (PDT)
From: Lian Wang <lianux.mm@gmail.com>
To: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	akpm@linux-foundation.org,
	chrisl@kernel.org,
	nphamcs@gmail.com,
	baoquan.he@linux.dev,
	baohua@kernel.org,
	youngjun.park@lge.com,
	shikemeng@huaweicloud.com,
	kasong@tencent.com,
	linjh22s@gmail.com,
	kunwu.chan@linux.dev,
	kees@kernel.org,
	gustavoars@kernel.org,
	tglx@kernel.org,
	linux-hardening@vger.kernel.org
Subject: [RFC PATCH v3 02/18] mm/swap: slightly cleanup the code for hibernation error handling
Date: Wed, 28 Oct 2026 00:03:47 +0800
Message-ID: <098f63eaf6b12c7340d39cbfbff22678cdfbcb92.1793106426.git.lianux.mm@gmail.com>
In-Reply-To: <cover.1793106426.git.lianux.mm@gmail.com>
References: <cover.1793106426.git.lianux.mm@gmail.com>
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

From: Kairui Song <kasong@tencent.com>

Restructure the error paths in pin_hibernation_swap_type() using a
goto out pattern to avoid repeated spin_unlock() calls and simplify
the return flow.  Also simplify unpin_hibernation_swap_type() by
making the si NULL check inline, and clean up find_first_swap() to
avoid an early return inside the loop.

Signed-off-by: Kairui Song <kasong@tencent.com>
Signed-off-by: Lian Wang <lianux.mm@gmail.com>
---
 mm/swapfile.c | 39 +++++++++++++++++----------------------
 1 file changed, 17 insertions(+), 22 deletions(-)

diff --git a/mm/swapfile.c b/mm/swapfile.c
index 7acb33cd8b71..cf8c0999655c 100644
--- a/mm/swapfile.c
+++ b/mm/swapfile.c
@@ -2279,21 +2279,18 @@ static int __find_hibernation_swap_type(dev_t device, sector_t offset)
  */
 int pin_hibernation_swap_type(dev_t device, sector_t offset)
 {
-	int type;
+	int ret;
 	struct swap_info_struct *si;
 
 	spin_lock(&swap_lock);
+	ret = __find_hibernation_swap_type(device, offset);
+	if (ret < 0)
+		goto out;
 
-	type = __find_hibernation_swap_type(device, offset);
-	if (type < 0) {
-		spin_unlock(&swap_lock);
-		return type;
-	}
-
-	si = swap_type_to_info(type);
+	si = swap_type_to_info(ret);
 	if (WARN_ON_ONCE(!si)) {
-		spin_unlock(&swap_lock);
-		return -ENODEV;
+		ret = -ENODEV;
+		goto out;
 	}
 
 	/*
@@ -2302,14 +2299,15 @@ int pin_hibernation_swap_type(dev_t device, sector_t offset)
 	 * the same session.
 	 */
 	if (WARN_ON_ONCE(si->flags & SWP_HIBERNATION)) {
-		spin_unlock(&swap_lock);
-		return -EBUSY;
+		ret = -EBUSY;
+		goto out;
 	}
 
 	si->flags |= SWP_HIBERNATION;
 
+out:
 	spin_unlock(&swap_lock);
-	return type;
+	return ret;
 }
 
 /**
@@ -2389,11 +2387,8 @@ void unpin_hibernation_swap_type(int type)
 
 	spin_lock(&swap_lock);
 	si = swap_type_to_info(type);
-	if (!si) {
-		spin_unlock(&swap_lock);
-		return;
-	}
-	si->flags &= ~SWP_HIBERNATION;
+	if (si)
+		si->flags &= ~SWP_HIBERNATION;
 	spin_unlock(&swap_lock);
 }
 
@@ -2428,7 +2423,7 @@ int find_hibernation_swap_type(dev_t device, sector_t offset)
 
 int find_first_swap(dev_t *device)
 {
-	int type;
+	int type, ret = -ENODEV;
 
 	spin_lock(&swap_lock);
 	for (type = 0; type < nr_swapfiles; type++) {
@@ -2437,11 +2432,11 @@ int find_first_swap(dev_t *device)
 		if (!(sis->flags & SWP_WRITEOK))
 			continue;
 		*device = sis->bdev->bd_dev;
-		spin_unlock(&swap_lock);
-		return type;
+		ret = type;
+		break;
 	}
 	spin_unlock(&swap_lock);
-	return -ENODEV;
+	return ret;
 }
 
 /*
