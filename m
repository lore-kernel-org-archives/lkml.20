Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793430325;
	b=YvkShIun2pko6emyAw3bxJ9IftxWv5gjTK9o7w4NNXuYunUT/FuAPPYMdF40LohxTeZL
	 0mvccTdTzM5LQkCupKZ0SEMYRz0l5XZyyU38MWmRz/FAt26M1P84uluAm/yzYPcDX4iw2
	 dwWlWMbiwqvhUJJrEivgjlpn81MDmFKDTh8LV6vctjRlo35CtY1QdIkeqDoYIM1Ii2uqh
	 znmUNR7Pgn8h6kV1sAwLVSK390kZao7AECxlSjArdCgqxVcB5+1aY2IPcVGUKIGWser55
	 4Hwag/KL3+ShQrQQ7FyCVIe7/rq/Z2r5EvOBomdAtjc6hbVBkT2+UlgpQzvObVDFeXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793430325;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Iufanw/5KFAPDTTrdzVdPmEyBabAy2noz2vvQUjeASc=;
	b=0PCPWTav0TCHyJVyEuO4wBKSeFSQtpM/QkzTZz5AdYc9lhhf82FxlZLqT4hbdaEeFmAF
	 cFaiwu7C+PIa2WKKjVHRyMrWNB+UqugWltIgdkBy5SNGLGQxj4r//nLO4Ee34zVoeMAAO
	 CuFTgwSDJSnBlh+EE4MJVSov9m+S00GoVHKYBzmtEJS/VSkDUZugtrR6qgnrI3l4G2szQ
	 BHXG7Awq7M/YVfYgREXeW+HFqnedFjKMuIhhGzSybqb5OE67vzoN+TBAf6FC/OBJ4sfIe
	 Vnx7CqEAuseXnahUsePnSZvOND9m6vFhw6x8XDNd/a00LMN+bXFpzvsDRZemNEQKRnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FV31nvDo;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ACCE606A31C
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 07:05:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8ACCE606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FV31nvDo
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a2d6cf958bso6716295e9.1
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 00:05:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793430324; x=1794035124; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Iufanw/5KFAPDTTrdzVdPmEyBabAy2noz2vvQUjeASc=;
        b=FV31nvDoIjKAJUOaMuSEBDeDz0AWHffKOUNNU8NqBCX6rFZ28ZcYyiCXaHNPPJ+Js+
         Ud10cpoZ45oiBbYZHefVj9T4VJg9kmFObiLnjJ06T+5Ikdqwz2Zrd4+Aev7vBJlL45+E
         pEdnBavwUcxwiNAnpFH4K7ZsNR0VCh3HSuBx0MTp5lLYoDMcmMg8CsXSB9ncQU5G2g1A
         Uv/BYr1oMz6UpX/mdL90eXr83s+0m8pHdf4EC9Ifqy0JpU6JxiU2KVX1hy6vDoEx3nhN
         6EKDX3QTWDsriGnjK0OmhsC7fXNKo4yn/Ebjk/caMvEoX+t7a6RKTrAbQwKw9YqKoUEv
         yRbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793430324; x=1794035124;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Iufanw/5KFAPDTTrdzVdPmEyBabAy2noz2vvQUjeASc=;
        b=KpUJwfQQGh17k8rsVoW+Ifgwuds7bqIm2KOBj5E2cEIv0OowThcXAjyC43RcdOx9/I
         HPjBIsyMZaPsCnwlhEdDt5gKONBQS3gl7tQE1DrXNEP68fjfW/FCe9GTmJxQT+9nvy05
         XjcGCoMDgU8DuxLPuafb0k+a31lqBv/LqgWHtC5euI9UgpIVrQRGr1joinxgIDeqNCVd
         7KneTybY73IuNdUEk9DiFmRCTigvbsg0hwsmf7NzRDsawr/RZlMKkdIrrFWYxD/HMcF7
         qXekYoAhICb82+mpiY/jie2qJfGByuFwkhV5fx3oxphC6LPzX39YEPGwfxvudt05YxGV
         GlBw==
X-Forwarded-Encrypted: i=1; AKwUvBzad1zDbmaVe/1BNLxlGiarYWfFPjZkS9osu1WHxXOx4rnDWIehFyvll7z0l5Mw10WHGJ7dIELkyJO6C8I=@vger.kernel.org
X-Gm-Message-State: AFq9FYKzUvD7dKEvOd3xIU4Z40Y7IL9J8ciJNMxGVDrG1MsX+4ybKp/z
	XM/xBiunAUa4AvuMS+CqXisKvbe72uVERSlf44u/LoppR/elbhHOvaMp
X-Gm-Gg: AYBFou1bklozctdbPU5gzZvoBzt+m+XFRL+IQNRXtvPfJAAgEqefahAGWkWkZ03oswN
	sKxoPNGR/vNtE7N0z0OFmS3COoB9o/IrRz41SXxvkiC3EkALTEaeAQoT7W+Q+bXYJhuheQykWKM
	gvYEdZ15HvJR/dJ28wMdzp1jAxlyxUF6hOlsDv4UnlE00SN3IAlnwC+GlncdqM56tBpUaKE821h
	En4m+d+hXtTwIoVJNGLX2wo5tm5aE6Iu/tQlERUlzdfkK1BOzB1y8D23Tq7gIy3zPJwfB6xAbqh
	RibAv302DdGOE80BtzgOZVJiggXYj/7RAWilUhj8m/uVNsWmQ6s095I01Ixc+cf3KDi6wkp9QwR
	wklbwwocB8pxSDXaWEUSBnuTbTe9Y9HfMVl0awag0IJAIzf2ovxgJfGQm+EqBt93yqtLv5apUba
	OvGez6+VgkPlhxWo+48j0arpH4rOIzcVb1TYqw51fBlTMtRf6Pqg87emuZZC3B76Y/AH0kNKxQQ
	qIn92pPLteSiPnXdOAx3VwitlZ1n5sFQjKEH6RQEchyXYpBuGeazWEP2Scbl4YNRzPkZLn8arGz
	l8s+Kb9RF787BwlydAmcZzdrRbJH0h5GTKDCPDEYHjtA
X-Received: by 2002:a05:600c:8b0a:b0:4a2:e0c:2b0a with SMTP id 5b1f17b1804b1-4ac1709a200mr101686865e9.16.1793430323735;
        Sat, 31 Oct 2026 00:05:23 -0700 (PDT)
Received: from localhost.localdomain ([2a06:c701:4773:6f00:c8d4:ec29:293e:f39])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ac09cc3e9asm46827155e9.3.2026.10.31.00.05.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 00:05:23 -0700 (PDT)
From: Avi Weiss <thnkslprpt@gmail.com>
To: Matthew Wilcox <willy@infradead.org>,
	Jan Kara <jack@suse.cz>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Joanne Koong <joannelkoong@gmail.com>,
	linux-mm@kvack.org,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Avi Weiss <thnkslprpt@gmail.com>
Subject: [PATCH] mm/page-writeback: avoid unnecessary strictlimit background wakeups
Date: Sat, 31 Oct 2026 09:05:15 +0200
Message-ID: <20261031070515.3042848-2-thnkslprpt@gmail.com>
X-Mailer: git-send-email 2.43.0
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

balance_dirty_pages() includes pages under writeback in
gdtc->wb_dirty when checking the per-wb background threshold for
strictlimit BDIs. However, wb_over_bg_thresh() only considers
reclaimable dirty pages when deciding whether to start more
background writeback.

This can repeatedly wake the background worker even when there are
too few dirty pages to write. In a 15-second FUSE writeback test,
background wakeup requests dropped from 2657 to 682 (74% drop),
while writeback_start events remained nearly unchanged at 99 and 98.

Check wb_over_bg_thresh() before starting background writeback through
the strictlimit condition. Leave the global background threshold
check and the wakeup required for dirty throttling unchanged.

Fixes: 0437906841d0 ("mm: start background writeback based on per-wb threshold for strictlimit BDIs")
Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>
---
 mm/page-writeback.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/mm/page-writeback.c b/mm/page-writeback.c
index 499a35473e4f..cb0c58715b93 100644
--- a/mm/page-writeback.c
+++ b/mm/page-writeback.c
@@ -1826,7 +1826,8 @@ static int balance_dirty_pages(struct bdi_writeback *wb,
 
 		if (!writeback_in_progress(wb) &&
 		    (nr_dirty > gdtc->bg_thresh ||
-		     (strictlimit && gdtc->wb_dirty > gdtc->wb_bg_thresh)))
+		     (strictlimit && gdtc->wb_dirty > gdtc->wb_bg_thresh &&
+		      wb_over_bg_thresh(wb))))
 			wb_start_background_writeback(wb);
 
 		/*

base-commit: 36aad21d50d1af3f6954bb0c988257a908202477
-- 
2.43.0

