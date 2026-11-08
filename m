Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794128103;
	b=KctXRsi9cBjq5tGgALjymVJrPYSwYeKheQpxbX7nDwcv/e7YkjYKLXJroBPA3TssI0FI
	 pkwWcLaFNfAh7Y/JQnb/64WT5vMPNDBzN+vqdThXdCRQiADY/x6dPc7Q4Uml3gSImUcVM
	 snSSZ+AzHPhO167k5BIG6u/IDMobHUgogiFDvxMlWTUmyCEUsAVfYkWpOW+4u2rUyTf3M
	 i8BdZyXFWWAd55HxKbqi4UvrSYMR5aUES5PquxWJzp2Zg9m1YGHTqubOJSA1yT+MaLF3I
	 vpqslenzyP0n28vD3JquvD1DOra1YcGWn3EW8haW6wp1OHHHWGAF4hpubKcDrUyRXjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794128103;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=V6FT4KAZBmJIi4It1KRfQsBThfynsYK7WB3H1EWORGY=;
	b=VWvEav1RWd3j2gb2q89G8g1SYWl2TbKTCEZzImhUrWoSRIKn8qXZ3y7YdkV4RbZ1WUdK
	 WFRJ0UZ6bpBJPqQEDCZ8CbXj7y3F5VuAqff5oiMY+YH7GY1bo9v9f9i5IUQef1J6lju/I
	 MKrASGF2fQirNtGAZyAaVwB8pXuMvvNEqelVl70rGNubKUTP2OtTTDIkxf5//YVCSrGqz
	 n8HpNU97jjudKCxHswNX5mqKAZX3WwaGJ+bOAN2Oxn4qORYrBf0Y36oBllXAWsDN9MddM
	 4cU+gtec/ZYpNhWYffje4zSZ3XTR4SuoamyxlPYrASl5xdGavRCT7TkJfDK2rm8OkMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iGxefxpe;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0867606A320
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 08:55:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0867606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iGxefxpe
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so410185e9.1
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 00:55:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794128101; x=1794732901; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=V6FT4KAZBmJIi4It1KRfQsBThfynsYK7WB3H1EWORGY=;
        b=iGxefxpeWce+3+/L5xQxAOe9XHTUrTRccukwyIuf9W3zkFLhxQqPAQnER/eTnywxkx
         GBd6+id7tYtbEFdtnx37i6RIN2YRJlfGW/0ephEz5wONi1Umg5z5+5s3jfhEThPqu1zQ
         jJydZA//88B7Iz3K/bLwqeOYsMRiN8JuEyuECTWcazPurL4YBCtvx4Fwmu4JA71KYLxE
         rVA30uMooXgVIwYwcnP4OVlgO5hiEb2/F4OsBREy1x79eqH8lcmA2Npq20ZHneKH3GqR
         63rE3io5iFrmqDYqKzyHMdWt1q2PTQtqAm2/rNTLp0tZP/VlFWKebNqh4i6WeWER1SVs
         UEiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794128101; x=1794732901;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V6FT4KAZBmJIi4It1KRfQsBThfynsYK7WB3H1EWORGY=;
        b=e88Xt5WxnxrhBdBf8DHg+CaxSRCNLnJUjg9b1we5nYWxq8857HmI6WYQMIDsnyU8TL
         S5s0f9EcvHNBcC4wVmuCqXag8U9R+S+724QXc5XVtQbSQwek8wayUh2sq1moQovb3YpS
         d1REJOjr703qmnPkmqV2FHjkfQjr5/DsoIJOUJvyh5HEsdt7WZmuvd4ZIO08hr31LH8d
         Ned+Zvf/wKNvZQVklWwZVS2gMuQTpNKkM2VQdVjnMQ25vHMfdquECrbzRUNv04tXCfGe
         r3e6qPZYFFXSbpjOVpFk0WUBc3ZebREl/lx1XolHsk71LTkbTqySGA5FQW/ZFJH+YUSq
         7GGA==
X-Forwarded-Encrypted: i=1; AL+hErEtK14oiCLOWtFIuub1B4KkrrvcsHqnIHytmZ6RLdQDmc9cN+0jy6IJ36G3wOMxl9AlZrTWBZNwGTdmwNQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+6hWTmwJwmJnvSD7HO7lKDeZy9cozIv7HRGT2jn5yIMyuML5fo
	ywut1oWED0LH+qbna6pfgbplTdfIoRvycz1Hr/GOxpee9BXOMMLC6pVX
X-Gm-Gg: AYBFou27g5JrKippeDeifKHgPHD/hr8GH2Y/SlvVWqero3T3Az7XumrxnHkkS45ayFf
	QsjHtuOfGqX+3P/nf8dUcMkBmy4fLVxE4oc4zsODmZOpVU6fzEXguADtuev3PELDRHaJ7sKigB/
	KeVhGG+IbXLMaC9yfnu2lGv4RPr3qZJggCxjhzngQ4B0+nNPklHdVxFEgY3OBvm6+KRnlQ2mwZ8
	ZvvztN4kzxMlRygvmpS4W0zhM09S1LA/KkRYntsNeFr0xW2g36tORUZQ85Bj7nJeIc5j56TIPxV
	cj7uGY/JgFSWnvqP2v75M2xH0HFOoExPRbWL1jGd1XwR0Zs8srXMALX76qIKz4h5DhYxGalnLpC
	H0YPexJXtXi72pjgnESoDmNlaVth+o/yvdC09p9af1MtML8nIFSgaZDMt+1vJE2mW5FxQcDjcMp
	/V9rR7WOBXnVnwRef2aRlBzlcbamaACONe4ILrRiCjlkollKvvwQ3IMVRuvjxpY4kEt87eizs6X
	UqyIftYcRJL23PYTYhjcxA1fhWr58ESamzTmaXu8tMStE9qDDdiiQ4rf59ysBu7QhgJg9LwBQEt
	2XalVp9vnIvVO66HUvdWOM93M0ucEpgIanHp+4bWJ4WN6AIWU6AkF2W9CKiWv3uDJis=
X-Received: by 2002:a05:600c:4504:b0:4a2:526b:d40f with SMTP id 5b1f17b1804b1-4b943f76422mr18343555e9.0.1794128100763;
        Sun, 08 Nov 2026 00:55:00 -0800 (PST)
Received: from localhost.localdomain ([2a06:c701:475e:f800:9c3f:1631:3855:dec8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7e32ad610sm322985835e9.3.2026.11.08.00.54.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 00:55:00 -0800 (PST)
From: Avi Weiss <thnkslprpt@gmail.com>
To: willy@infradead.org,
	jack@suse.cz,
	akpm@linux-foundation.org,
	joannelkoong@gmail.com
Cc: linux-mm@kvack.org,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Avi Weiss <thnkslprpt@gmail.com>
Subject: [PATCH v2] mm/page-writeback: avoid unnecessary strictlimit background wakeups
Date: Sun,  8 Nov 2026 10:54:57 +0200
Message-ID: <20261108085456.2093096-2-thnkslprpt@gmail.com>
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
Reviewed-by: Joanne Koong <joannelkoong@gmail.com>
Reviewed-by: Jan Kara <jack@suse.cz>
Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>
---

v2:
- explain the preliminary strictlimit threshold check

v1: https://lore.kernel.org/r/20261031070515.3042848-2-thnkslprpt@gmail.com

 mm/page-writeback.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/mm/page-writeback.c b/mm/page-writeback.c
index 499a35473e4f..0529b4a7e99c 100644
--- a/mm/page-writeback.c
+++ b/mm/page-writeback.c
@@ -1824,9 +1824,15 @@ static int balance_dirty_pages(struct bdi_writeback *wb,
 			balance_domain_limits(mdtc, strictlimit);
 		}
 
+		/*
+		 * gdtc->wb_dirty includes pages under writeback, so use it as
+		 * a cheap preliminary check before wb_over_bg_thresh() decides
+		 * whether background writeback is needed.
+		 */
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

