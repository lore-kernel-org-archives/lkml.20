Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 408F9415B6E
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 16:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792341882; cv=none; b=luklIdk5jyK2qTreMTjbdmnMMZrBdi8V7yfbOmPY7hSa89XJkpHTAWjQxvAS4Evdl/mfKZmxHWR3hY2Br5ZydYWbBBVXanyFoLV2cKaeDVGFO4xxsF5nhZXVR2qmgZZlEu1NZk5hB1lr9YfrSzz7m2Mo8OTAeim/MmIHqFbrfVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792341882; c=relaxed/simple;
	bh=i+j5gi6hbhWHWTwayXv06deV6m3oJ9OZrjzPHkKH2ho=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kJqVVPt0wcWgHnJW7zxZatGIaFACl+DHs2KRW2GQJcXZ3DOrwmxvADs3zbcGXiRnQqE3cvgxhW0sEaoy0RtFNJLGi2DPJRgfPLsiAD64fvuu8LThZ34XbeZyx5Zhn5q4LYYYAl/TQrC2TMChJwfJXO6gg/uXQO1rZ5ci58fY4jk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=agOclKCl; arc=none smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="agOclKCl"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-35aa0cf7c40so2801755eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 09:44:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792341876; x=1792946676; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Gjzmg7eae/uR0QuhBKnPSRHZ8ca7zvPy7TlEZod/kQw=;
        b=agOclKClUgSJ5pirjcIgLwtkvFS/R8AFbFWWN71rR4TlKP1Azqr07VolDqtmA7407i
         FNkDvI51KbtJMn7lFmseYRCp1/te1NeLLZXc3PrWGg/mztRj8CakEaJJOnJUTP07cDdh
         XxdrvogEuDmIrb9Q5lp099H+l0FB4773Unr/AGNYRK0/pZSaGXKM/mRkyMb00DogOEnI
         SNpM1KjcoUIjUj0Zv44Q+7tpeVTgJd/zgiz1T7LWIBr/1N2M229u/olt1p48FHwclOFj
         2QiAFc3oEf4taL/HOVxvKdbAkP6RBMnysttwCK3GwucqWFGzAUbbMVImqW65CNCpuczx
         N7Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792341876; x=1792946676;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Gjzmg7eae/uR0QuhBKnPSRHZ8ca7zvPy7TlEZod/kQw=;
        b=ZM1hzsB/ugQy8p8pZ3WpEyyWysBbhNz5L5vTr6vAlcTIK3MR1yrZa2yMsVH3n8O69G
         k8lY3lnXRftEe0kmraB0wKEgKUfNvTRRQNm/1Bmu7eiikdufTmOe4+EPdFJZkxMGnwZM
         x/nA9U6JPzHKPts4sK3PFZlzDlx0QWnS+IDfZhpq0FuaX7L5Adh3Ejizo9xM6VoB3m9d
         sAQ8eEmthhPmXmLDAxCF5dKFa3678Lgg/O4+LYnyJwt7rxkq2rVHgPUMeOCtLX/t7rb/
         y2ZX43uxf9AgDovzSbMTnW0Q4VDAWYD4gDHaS0oXJ4dMMcXsN9ORSHhRFk5cuAHO8XGR
         tFrw==
X-Forwarded-Encrypted: i=1; AKwUvBybqhYIUwO75rqTBw++r+O6cxK9DDqpf2c5FETzm0/PvJPTKG2+jFx959afehPOAcbI8M24OJXUkk44Llo=@vger.kernel.org
X-Gm-Message-State: AFq9FYKJgnTs5dqK9jv5Snhzo4Yg55JBAR82wrrxmb4Wl1zpgVteHPc6
	QS72qAMlg3g/wPoTlBkAHHfynq2xp9n7+voxftum7cCghZb+CXAscukx0BA+8/28
X-Gm-Gg: AYBFou0OmMhAJSZoY1tEAqed7eDNwOsGJnJ5Kq2iq5PS5c1vb5didNctep1Hx1bLN5X
	86RjBkIFuGNePFocgy96fUufkIVT0bIYaQFS60QvRZjQ1BbQxP1Etr+AeCT3U9AlDQStstp0EwW
	xoKdt8zyMrlKMZJFuwDjwrXkh6Y5UhnIY5tyM2prI+m8LeU50kUSFRphqcJifJ77pymJBya2HYU
	AYinB6RPXcP7T8x0PePCQnMiipPORkNeGEj/sQL1iqxyxH27cH4wUsK3m2ZBPClLadh3EwKtTdF
	A+fKcqSXOOWmczlEDx4buekKgQR8zUshqWH8QLhNnt9gk2usaPoTFlfPQEH6gkbZLvsXEGhU9X1
	zgXOYk3KRx3KvTiSrJV+rGZP4iIvOuHj/40JCoaPoDQlkiX2BlpZEXmTO7x0rb4b85wXjhRtNc+
	koPXiMRk5IrA42RVlEKqLmKRHinoBPXYVmbmSn9dQ9CQGas7qJuDrk5R03He6z+hGaeqCm/QiwD
	41PCydgErW8NC9/NA==
X-Received: by 2002:a05:693c:87c2:10b0:351:202c:c7a5 with SMTP id 5a478bee46e88-3619b7f866fmr8293667eec.0.1792341875922;
        Sun, 18 Oct 2026 09:44:35 -0700 (PDT)
Received: from Vicious.localdomain ([117.99.24.166])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3608258aa66sm31431363eec.20.2026.10.18.09.44.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 09:44:35 -0700 (PDT)
From: Ashmit Kumar <work.ashmitkumar@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ashmit Kumar <work.ashmitkumar@gmail.com>
Subject: [PATCH 3/3] staging: rtl8723bs: replace SIZE_PTR with uintptr_t and remove definition
Date: Sun, 18 Oct 2026 16:44:02 +0000
Message-ID: <20261018164403.14921-4-work.ashmitkumar@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261018164403.14921-1-work.ashmitkumar@gmail.com>
References: <20261018164403.14921-1-work.ashmitkumar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The driver defines a custom macro SIZE_PTR as __kernel_size_t, which is
used when casting pointer values to integers to calculate alignment
offsets.

Replace the remaining casts of pointers to integers in rtl8723bs_recv.c
and sdio_ops.c with uintptr_t, use size_t for the alignment variable,
and remove the SIZE_PTR macro definition from basic_types.h.

Signed-off-by: Ashmit Kumar <work.ashmitkumar@gmail.com>
---
 drivers/staging/rtl8723bs/hal/rtl8723bs_recv.c  | 11 ++++++-----
 drivers/staging/rtl8723bs/hal/sdio_ops.c        |  6 +++---
 drivers/staging/rtl8723bs/include/basic_types.h |  2 --
 3 files changed, 9 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723bs_recv.c b/drivers/staging/rtl8723bs/hal/rtl8723bs_recv.c
index a62b845c69f9..f3f9c2699c68 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723bs_recv.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723bs_recv.c
@@ -295,7 +295,8 @@ static void rtl8723bs_recv_tasklet(struct tasklet_struct *t)
 
 				pkt_copy->dev = padapter->pnetdev;
 				precvframe->u.hdr.pkt = pkt_copy;
-				skb_reserve(pkt_copy, 8 - ((SIZE_PTR)(pkt_copy->data) & 7));/* force pkt_copy->data at 8-byte alignment address */
+				/* force pkt_copy->data at 8-byte alignment address */
+				skb_reserve(pkt_copy, 8 - ((uintptr_t)(pkt_copy->data) & 7));
 				skb_reserve(pkt_copy, shift_sz);/* force ip_hdr at 8-byte alignment address according to shift_sz. */
 				memcpy(pkt_copy->data, (ptr + rx_report_sz + pattrib->shift_sz), skb_len);
 				precvframe->u.hdr.rx_head = pkt_copy->head;
@@ -390,15 +391,15 @@ s32 rtl8723bs_init_recv_priv(struct adapter *padapter)
 		initrecvbuf(precvbuf, padapter);
 
 		if (!precvbuf->pskb) {
-			SIZE_PTR tmpaddr = 0;
-			SIZE_PTR alignment = 0;
+			uintptr_t tmpaddr = 0;
+			size_t alignment = 0;
 
 			precvbuf->pskb = __dev_alloc_skb(MAX_RECVBUF_SZ + RECVBUFF_ALIGN_SZ, GFP_ATOMIC);
 			if (precvbuf->pskb) {
 				precvbuf->pskb->dev = padapter->pnetdev;
 
-				tmpaddr = (SIZE_PTR)precvbuf->pskb->data;
-				alignment = tmpaddr & (RECVBUFF_ALIGN_SZ-1);
+				tmpaddr = (uintptr_t)precvbuf->pskb->data;
+				alignment = tmpaddr & (RECVBUFF_ALIGN_SZ - 1);
 				skb_reserve(precvbuf->pskb, (RECVBUFF_ALIGN_SZ - alignment));
 			}
 		}
diff --git a/drivers/staging/rtl8723bs/hal/sdio_ops.c b/drivers/staging/rtl8723bs/hal/sdio_ops.c
index c12f670922d5..9cc5c651f35a 100644
--- a/drivers/staging/rtl8723bs/hal/sdio_ops.c
+++ b/drivers/staging/rtl8723bs/hal/sdio_ops.c
@@ -653,8 +653,8 @@ static struct recv_buf *sd_recv_rxfifo(struct adapter *adapter, u32 size)
 
 	/* 3 2. alloc skb */
 	if (!recvbuf->pskb) {
-		SIZE_PTR tmpaddr = 0;
-		SIZE_PTR alignment = 0;
+		uintptr_t tmpaddr = 0;
+		size_t alignment = 0;
 
 		recvbuf->pskb = __dev_alloc_skb(MAX_RECVBUF_SZ + RECVBUFF_ALIGN_SZ, GFP_ATOMIC);
 		if (!recvbuf->pskb)
@@ -662,7 +662,7 @@ static struct recv_buf *sd_recv_rxfifo(struct adapter *adapter, u32 size)
 
 		recvbuf->pskb->dev = adapter->pnetdev;
 
-		tmpaddr = (SIZE_PTR)recvbuf->pskb->data;
+		tmpaddr = (uintptr_t)recvbuf->pskb->data;
 		alignment = tmpaddr & (RECVBUFF_ALIGN_SZ - 1);
 		skb_reserve(recvbuf->pskb, (RECVBUFF_ALIGN_SZ - alignment));
 	}
diff --git a/drivers/staging/rtl8723bs/include/basic_types.h b/drivers/staging/rtl8723bs/include/basic_types.h
index d2436459cff6..c3947e61ec22 100644
--- a/drivers/staging/rtl8723bs/include/basic_types.h
+++ b/drivers/staging/rtl8723bs/include/basic_types.h
@@ -13,8 +13,6 @@
 #include <linux/types.h>
 #include <linux/stddef.h>
 
-#define SIZE_PTR __kernel_size_t
-
 /* port from fw by thomas */
 /*  TODO: Belows are Sync from SD7-Driver. It is necessary to check correctness */
 
-- 
2.43.0

