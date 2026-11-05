Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793895472;
	b=j4qarYu5WpaAMK60ZxrpBglW9m3qB61ygTr87Tvn9OqCReJV6ryL4gqJGlV+qJ3IN2Ye
	 DH44ir2SPtmWSpeTBUwthKhmYwFZYBCiMy7ivDiUy+wiLrPXBhIWHa5R41oNVTDlSMB0b
	 L7glKqUmpJzqHAbkiJLFtN/zB7LyrQRiNOgXr8G1POOJQy6IurcMOIcGMVXPVKgK+ODtS
	 kkaoW+6nWwVIVuxoONIZlGold6GsWA0xv85Kl5FBqPJd5FIIRCV/YS4bkV3D2tNDEQxiv
	 SMBa14dpgBu6fseLqV8VGEuVMHEARIy/HvtRIqCxfChmTtkZeVRfYWMjvbsHmc/XITw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793895472;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=1d0Bz7grZ5N14ov6UkXjfbPvCgrK/lOG24d5Ad8AHHw=;
	b=j5ImmvXpVUtYxTFuemnBnBkemADY2dJH3ISBuOGjWhRNCp+RqkOP7AvyrT3Y777bNV8M
	 xxSRStkwrWpnIXF8ZqIVa02HXZhnUqhVpDSLK4kXQ4iwnlGBKWXX+PfqutP9FZ8MH0zIB
	 EaNuXL6Ox4jpiQFkJsz6yjj/xOmQOk5vsERUNcXcfOhOEeY+QS3KljP/So88wIQDoAs+9
	 X+AtommE7Dy1Ogokd1BFN6kp5g2xNPXnog+BL6gtz9RoL9FC7x3nMkdN8ekasJU0fn1zZ
	 56AhCjP8O5GU15pMW9y0bYVqp4NIeaqdqW4gDQw8UZK4Hj3wSpXN3k+T3kNAPrgt56w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KyameIs4;
	arc=none smtp.remote-ip=209.85.216.49
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCADE606A32F
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 16:17:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CCADE606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KyameIs4
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3adc4590de4so1791754a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 08:17:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793895471; x=1794500271; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1d0Bz7grZ5N14ov6UkXjfbPvCgrK/lOG24d5Ad8AHHw=;
        b=KyameIs4d6692Zl4Q7oTjzrkTyTNDOCl5H0oHyVVtFMfTcvrv9au14n6xkD9Bo8yOD
         ECSwI4xvebLUYNhtgiE+TewxRxDB08ApjBKD8TaWb3Hm+zbKVsRs23XJlTLgTae3tUq6
         zzi45jJoAC1BTnnaUqQpZvdzZ2JDIk3nFRNTBQSSInspnaEt3lhQ/YNX23hSQIen5J2U
         w7UXxB3QSutdNtozEMC1J+lwQ+O6K38SLx/au+ZtM9EDs82k7JdHXm40SCmSTHHhtweu
         yKCsu5WBjfG2BkDpDEgCIBk3Fa+oVuqRrhV2qMV30EJswxEZjOXLpqNdPE/2AtSSd+Pb
         KpnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793895471; x=1794500271;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1d0Bz7grZ5N14ov6UkXjfbPvCgrK/lOG24d5Ad8AHHw=;
        b=Fnhz/ojGqafKATfp5rZDUK3KBpsL0rSTfpdLeKUHhGoJdlwNKUGBRqqEd0ydtJfHCj
         RHRkFYB1WWbJxJg6WVKUzVadgE8ExtR614t3odKJ+K0h/QQuA4qoecHKgKJ7ODjVjrHq
         QxjJC0wPLDeR2vwAEHkkEuLLCzaSqjj9Se34s6AdIsFo1QXi2UKPfzvUEZLuJ4pCzjdL
         KWRo9jRumZPG7Dnl2SHbhWqwRpSutDIJ332ggmm9GWJGxGSnfOQdcT2eICcaXCWzlys6
         WBIB0JfFgyWKfhUahLc/lwkj/NkgJAWm2VFjwHRH49CIXsdDNtZ7lwseve3ls+11gbUE
         /fbw==
X-Forwarded-Encrypted: i=1; AKwUvBznv1Vg/nULiotGB5HUCpu+b/TDqpJssTnvSTKFJNNDhUscuGVud2BON9rPKQNAK3PRG6D6GUqfGAU3FS4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+NjshAbn0hZWyOZa2Oh3HIyYc3gzfNBeeA/SeUWSMz/qKSYgH4
	c+DkClF44ay6S99d13kYUv+mFvU9+YAXU8AqlFzUnS7/TtiQVjhcd3sW
X-Gm-Gg: AYBFou0lU57vld/yYNtsvh/tOYeETM2NyYqyMm4pXJGBrGL/Pf+AfH7ZiAfmKAhhSOP
	6JDWhuGt/CiFTLVewsEIVdmkFLvnF+WFszBlcmHffR2DLec+AXeKpe3bH01Y+cwuWaBcUoYrEw6
	qEs85O1xULaFUvdF3qCvEyxZI9sQtjEe8J189f/lajo4eNC8qtQP5BQs+cGqLQSbHJu3u+BC3fp
	nzgrnIz5Y5ExEeTKhLtDxB4k4il6wxyLmZDO9ZnI6nPeqqWkhor3hOLQiBrI2CGYAZL68UTXeLh
	zW7+rKIoRhBWQGWeOEanQHw0vj2qAsjWeJYMBWofZKzDnUNUn0wXzfICV75WOSA52OYuCSf2lYX
	Igocyf1K6edeb9Lc0wjv4uzTBqcmncel3siDZvmvVikYt+fduEDUnaUd6g2VayUZaDSHKSB5zot
	Ao5G2JONTmj7lZNE+E8MS5DQplU5fAgwUX/K0/coqXzEZHxwxS7FheIPCFy6ZAZ8SX75eo9T+7S
	+8Ax44+INddto/6aAJ9a5RvThk/iNyugfjSwA4q5/DV8F8/e2d182AQosdM6GaqYjXP/v2/XdMX
	X2qAwpLWllKsfVXJvVWiCildOp+Y2D8cSAWnTzkIslsIm4oar7X3XUlZ5CRI+sohhAfJcd0wECB
	m3+5Xj7GrYttBxXGrUPhLemM=
X-Received: by 2002:a17:90b:3844:b0:3ab:36c4:b502 with SMTP id 98e67ed59e1d1-3ae89814e4fmr17090993a91.30.1793895471151;
        Thu, 05 Nov 2026 08:17:51 -0800 (PST)
Received: from visitorckw-work01.c.googlers.com.com (55.11.81.34.bc.googleusercontent.com. [34.81.11.55])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b3287a60sm4981556a91.13.2026.11.05.08.17.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 08:17:50 -0800 (PST)
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: daniel.lezcano@kernel.org,
	tglx@kernel.org
Cc: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	geert@linux-m68k.org,
	laurent@vivier.eu,
	marscheng@google.com,
	eleanor15x@gmail.com,
	jserv@ccns.ncku.edu.tw,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-m68k@lists.linux-m68k.org,
	Kuan-Wei Chiu <visitorckw@gmail.com>
Subject: [PATCH 4/8] clocksource/drivers/timer-goldfish: Set CLOCK_SOURCE_IS_CONTINUOUS flag
Date: Thu,  5 Nov 2026 16:16:58 +0000
Message-ID: <20261105161702.3515900-5-visitorckw@gmail.com>
X-Mailer: git-send-email 2.56.0.398.g882cbad275-goog
In-Reply-To: <20261105161702.3515900-1-visitorckw@gmail.com>
References: <20261105161702.3515900-1-visitorckw@gmail.com>
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

The goldfish timer is a free-running counter, but timerdrv->cs.flags is
set to 0. Without CLOCK_SOURCE_IS_CONTINUOUS, the clocksource core does
not mark it as valid for high-resolution timers, preventing the kernel
from switching to it when oneshot mode is active:

  [    0.751173] clocksource: Override clocksource goldfish_timer is not currently HRT compatible - deferring

Set .flags to CLOCK_SOURCE_IS_CONTINUOUS.

Fixes: c92e7ef16400 ("clocksource/drivers: Add a goldfish-timer clocksource")
Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
 drivers/clocksource/timer-goldfish.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clocksource/timer-goldfish.c b/drivers/clocksource/timer-goldfish.c
index 8c312c3a64a6..88253bd1f569 100644
--- a/drivers/clocksource/timer-goldfish.c
+++ b/drivers/clocksource/timer-goldfish.c
@@ -139,7 +139,7 @@ int __init goldfish_timer_init(int irq, void __iomem *base)
 		.rating		= 400,
 		.read		= goldfish_timer_read,
 		.mask		= CLOCKSOURCE_MASK(64),
-		.flags		= 0,
+		.flags		= CLOCK_SOURCE_IS_CONTINUOUS,
 		.max_idle_ns	= LONG_MAX,
 	};
 
-- 
2.56.0.398.g882cbad275-goog

