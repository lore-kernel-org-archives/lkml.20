Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794223700;
	b=Z/kIALz+0rg5hq/oeivDJ2IZ4rsR3eeYxDy0ClQ+whdjFJQjlGcn3iXWHQk8GpVk1O22
	 g+FlIU9Pplnn1cFvor1XxbX/fVTS08YpzYMoLCDdMLAC+1Cp1gTuH1fiQVksfCvKdblOw
	 MQNgwBNAWQzdsrd4fpF+w4Fv3Eo4hom5i1ZlzmgWFeBcbvCCnkOvIcqZ4FY5zXl/l4PUJ
	 NzucTgThr504JjxCaKD3gO4uPAHy3X0UQDbhbZLQUI8lJAtasyo1KYAAajF9Blc5MhRX9
	 epCGMIRKo+yyP9xienvkRkL9L9PkbVIpnmj2VIC+K09gVcJ2pvDD5hDM17sI/mn1zyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794223700;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References;
	bh=d2XBagXEdpZbghW75U/zD4ABf0i+nSr0MMC8JRvmJxI=;
	b=SIzQPNpCN4Kc7llKBGkMOfnhT8OA/P7Wco0vTx8cCmkOWFvaY9I7yY07yRYi6LeVri/d
	 fTm3ag6AiVaK6UzN5R5kenYvz8CkhMGrMfpIn4916pRQgyAqX9OUqUaLsYWkYCw1r3bZT
	 aZ2bOt953FC0TySEmUUWgazAFPWk3r4CUq+kzIfwWYDqounEh5yWk0gE4LeboAodiLSYb
	 8q+zhAHE+Ux1ze6Qgy/7XBCsBhR8Jas/oKDtNHMEq/SJAiWiO4cvvK+LIv1HVyhe7mluu
	 9e9draKY46hLzB7Mrp8XIC51YD+oAz/6F9rl+St0p4KUphu/9Y+nqXGi93D4v+Hn+Lg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sGkxStkx;
	arc=none smtp.remote-ip=209.85.167.53
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54340606D80B
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 11:28:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 54340606D80B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sGkxStkx
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5bccb867d6fso901992e87.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 03:28:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794223698; x=1794828498; darn=vger.kernel.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=d2XBagXEdpZbghW75U/zD4ABf0i+nSr0MMC8JRvmJxI=;
        b=sGkxStkx6JWJZp5B291j4Lrn6MmlgeDMWvD/gpzVXyQ3pNdsvNV+PavRnkot/QsN6D
         J9d+kJkxT0kmE/6MbB0M63d1c2FxnvByHlUtBOZfdChto4Y7G0XIskrX5Pn5xTnfLHX5
         cS9qROai64pxzSxOl4j/XeNsE43w7t3dcstsRpb9YpIl24S+N/20C+I31u9E8xfeio9T
         3zNQNHe6hC5rl7T5eUGcAhojri/QCf1k0MfKE6FUfdvjXkhD7unM27uA7zk3TTy8CdfY
         CS4Mcyjd1eFVmzA6gKBExRanMs8Dp3x817QO7FeZ6+DCJwLKEAVXpTZWia3ZYRRrVcsi
         /hYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794223698; x=1794828498;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d2XBagXEdpZbghW75U/zD4ABf0i+nSr0MMC8JRvmJxI=;
        b=mj0srncZMAvuxVmBqbHwUtVwv35V5Ek0GzRB0rxGVCFuPX9bHZ0FfElzgrnRkKWlYV
         txkp4mVTj7oRmrXpdWpDnDmCKDsenaKOfoU+ZTf8nIyKQjh8ex8msGvcXW2ZO7BkprwR
         5Mwe5lhds57fFcs/QFySnl1gTE8b5nKpDo5xhBtAaleE7IM0TyVvkEKP30sT7LLLdBMM
         KOROlSxT1WE9rCwc8zTCm4PMs2Di8sZuVPKMONkL8nhPi6bhEAbWAQAwnxy3KI+mEY1k
         MEXAD8pn8LfWTAGp1gV9+x+2EaVqNV21FNHhCnBH7Vtb8tGbpAU8P+GCaPzyOcb45EU1
         RWZg==
X-Forwarded-Encrypted: i=1; AL+hErHr+HwPXe5LslplBj1HsWTCEWDchDNvwBhmhmGLFII5ORxiUwBemFeXxWR9KEd9hFkABtlB1io4nKLJbZ0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8sLe15ZSZ6iystcAKir5dh74uhjcc9CVi1QXPW2IIzPASN089F
	m2EG9qS8Vknm112J4QUQHnUyIs+bko5YVWUBGOjtBYOnWdFWD8tbKFuv0yXuoA==
X-Gm-Gg: AYBFou1nXm+vXc2EIVBtZHWdHJnkhML8nF+7w+mQVIP0p59C/35/xgxHsCEv02tTnmJ
	FH/ziasehoiTh/4bOTtHzAnK2fmvEASqmyLnmyTzvEFa30yRxd2hps2tvu7kud9SfufwjvyNHsZ
	VEUwQEcL6JHe6YGmt/yh45ycpiGBeVCiVsyvgwWmqC0KmaWkDp3vlsvg9DbafV0LqGPLUJ6gbsM
	GUqjTJbyRO5unBdgwtsoVyi5iPs+1t42W5Qfy2NPYYvM7Z43a2C9pFKm4lMgZbV0yzCarAFgSNI
	Uf8/u7KgzN7OL1IB2WTREYtrdHmISJLZYCKVHmNvIKXmtTjDHuqqbPnoh+imZWxilRMJJ1DdxWj
	Syqsnq5OHEL5Wb1oiKKSuYjyX7N58QsU1bcFfCGYP1ZhdYGfwlHsVRLXtuWSSA2lwmYwvaIy1Ds
	2oWbx1cZdU/+El89105qe2K7RkpY2s634mzQ9VpwUQrOQW5n8bqBxkNyddlbkKCDTSJAZt0QL0o
	6LvP0Ur/WwC8hFqnsJM40dlmu+8cCsjY2D69xTJxQjH083RdPBQPqdMj67pxQbBrbFjsLLKPhRe
	Ja4o45zRh53TNYKVp5zu8waVEsUnyTpYHV90Fj6BktdCAkyJjz5YaDax
X-Received: by 2002:a05:6512:3e04:b0:5bf:b93e:8854 with SMTP id 2adb3069b0e04-5c14c01e19bmr944163e87.57.1794223698531;
        Mon, 09 Nov 2026 03:28:18 -0800 (PST)
Received: from localhost (c-85-228-45-68.bbcust.telenor.se. [85.228.45.68])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c14b823866sm789856e87.75.2026.11.09.03.28.17
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Nov 2026 03:28:18 -0800 (PST)
From: Eli Billauer <eli.billauer@gmail.com>
To: gregkh@linuxfoundation.org
Cc: arnd@arndb.de,
	linux-kernel@vger.kernel.org,
	Eli Billauer <eli.billauer@gmail.com>
Subject: [PATCH 1/8] char: xillybus: Use unsigned int literal
Date: Mon,  9 Nov 2026 12:27:53 +0100
Message-Id: <20261109112800.48663-2-eli.billauer@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20261109112800.48663-1-eli.billauer@gmail.com>
References: <20261109112800.48663-1-eli.billauer@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

Use "1U" rather than "1" left-shift operations in order to avoid signed
integer arithmetic, which has an undefined result if it wraps.

Assisted-by: Sashiko-0.2.5:gemini-3.1-pro-preview
Link: https://sashiko.dev/#/patchset/20260805093436.59740-1-eli.billauer%40gmail.com
Signed-off-by: Eli Billauer <eli.billauer@gmail.com>
---
 drivers/char/xillybus/xillyusb.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/char/xillybus/xillyusb.c b/drivers/char/xillybus/xillyusb.c
index bd3babd39f35..56afb0a577af 100644
--- a/drivers/char/xillybus/xillyusb.c
+++ b/drivers/char/xillybus/xillyusb.c
@@ -381,13 +381,13 @@ static int fifo_init(struct xillyfifo *fifo,
 
 	if (log2_size > log2_fifo_buf_size) {
 		log2_bufnum = log2_size - log2_fifo_buf_size;
-		fifo->bufsize = 1 << log2_fifo_buf_size;
+		fifo->bufsize = 1U << log2_fifo_buf_size;
 	} else {
 		log2_bufnum = 0;
-		fifo->bufsize = 1 << log2_size;
+		fifo->bufsize = 1U << log2_size;
 	}
 
-	fifo->bufnum = 1 << log2_bufnum;
+	fifo->bufnum = 1U << log2_bufnum;
 	fifo->size = fifo->bufnum * fifo->bufsize;
 
 	if (!fifo->size || /* Unsigned integer overflow */
@@ -516,7 +516,7 @@ static struct xillyusb_endpoint
 	init_usb_anchor(&ep->anchor);
 	INIT_WORK(&ep->workitem, work);
 
-	ep->buffer_size = 1 << (PAGE_SHIFT + order);
+	ep->buffer_size = 1U << (PAGE_SHIFT + order);
 	ep->outstanding_urbs = 0;
 	ep->drained = true;
 	ep->wake_on_drain = false;
@@ -1320,7 +1320,7 @@ static int xillyusb_open(struct inode *inode, struct file *filp)
 		if (rc)
 			goto late_unopen;
 
-		out_ep->fill_mask = -(1 << chan->out_log2_element_size);
+		out_ep->fill_mask = -(1U << chan->out_log2_element_size);
 		chan->out_bytes = 0;
 		chan->flushed = 0;
 
-- 
2.17.1

