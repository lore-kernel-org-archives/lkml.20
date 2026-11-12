Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794509725;
	b=U60Lw++sEQ4NxII1aJRkb1W2SQ/eSIvY9xBzbd/b1JsTWTKARG2XH8kWd2346iEuQLzj
	 XCsRJ4AV9F6g6nUSakWf+kbAc7sbhl7ZJJbQ54LBhIAIj/U9OG2jQHyiOnnYnmJtW+FEF
	 L9HZC7kGn1c+ITzjOa8PMThygbvK4OHaSW4rlKeTes/DwCrbZAn0HqQQyYGwc9o3W5sjq
	 1W8c+DhkXQLfYwwcFbK7jt7vA0toCzoUscy3k7j+Tgwx6HurVYQMb8sDWmacnqHjTB8RH
	 Mg8QpwohhKAJYuPHQ8/oTbqMg4/V5Q9C6njD2PoS4hCSfL9U2giiUPbXz6VB11HgbOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794509725;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=a4iEaD8NWzFH56Fd6ulOFSIYM+4Rcg1gxrmby4HTmHM=;
	b=SoRNzmT76Kuv0Fhj36T2GXdBKnXbOtXPF5uPTD0cLhkr9HTAhi4PpIqv6nr7oGicf0hT
	 FsslIEWcC8iRjqoKbozQEsNa+CDon0olmo0t3O7SXFwTMzw4X4r8KXRWpDsQvi+KrUtrC
	 c9M+50pZOnGnDl6I9XHVuLj+wDB52jW86HOPjevQL6vB60/OxcS4bWHqWHyWRvr7aufDH
	 1XLuoZ0pBvynhF2oPMPQbrmD1nw+XUsV9Vn6QOxyQCno60/kTmYy7/N7pFuntu0N0Rioj
	 O1NFmZ87iEAe4DqPPHFb6FPIO6osAuAx8nbI3AY37P3Oh/AcWcY0O5DWNDAROlwV7VQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BUHItoli;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B79EE606A8B7
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 18:55:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B79EE606A8B7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BUHItoli
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4bb55cda775so23985e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 10:55:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794509723; x=1795114523; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a4iEaD8NWzFH56Fd6ulOFSIYM+4Rcg1gxrmby4HTmHM=;
        b=BUHItoliVUunVb9q2HMInjMIXURcpWmo5x+MDSgCzfux//hOv/v5JERePi5sTf7VlI
         uZYPx7bV5nfQO+B9zmxLJm4SluP/6bouRVHKeS0QMqvVDMzgmPevS3z7i1SA29LskJ/l
         2QEvPPNoj6WYEW63NKHKhafxyvAHlPLAEn6rGSERA5DNO6dfYsFyV2vumbodThP5F422
         7yxwBF5vksWrwpSFnAQGY0jMLiK2KlyMp2gstPObglydsnxnwHFCpQKMwGKIxdugOBet
         B4cDa5rr/MiYuFjlv7eRSZ7kGBO8O7lxuhNVcRSccqBehQ0CO+sjAHdVnbnZiOxiS7Jt
         1T5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794509723; x=1795114523;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a4iEaD8NWzFH56Fd6ulOFSIYM+4Rcg1gxrmby4HTmHM=;
        b=GyIKYHktCNOIvwmMWUIrEW6pS1IqU2BHejY2CECgGgY8Ml4UdovQBTHhSQoKbmIp/r
         3XF4yOSxgmkCnYfDeGmlzND7cBxlfaUR1CfemLGNq5Nj+lA0t562bYldepKia/vIzEvd
         XqRvhmfNMdQSi1A1HAsGrcD8xbc2eggNW1P1+fbCAuaD/8V1nFgwYbJ1Ac/x++uhB8fn
         PS4icJj4rkRa1FPoklcb5TUcRArXFZZPHR966XaEJA+ShwuUOGu8GH5JxiD31+xjv0bO
         Xll7ZZQ7Q6rxPO10L8xiUPZ2jh61hWlM7NTuacAf3X5YSjJoSIX8grRxce76/JfrScAW
         LjLw==
X-Forwarded-Encrypted: i=1; AL+hErErBEhgrv0fi+2gmgVZYgUBQcm+Eb4fz5qrq5tg7yYtVb/xP0IOQgoqWmcr5VPLiTZi5Ld0tvGSR68JhZg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+vaeZA8w0dfR9nFLBf1synI+ZBvUbOW0NQBN4ChqJRsI8so7wQ
	pmOixxaGyGBqm2TSSTpnAG/7tLnHYi910RMxhMRZ2M7JK5I7aTBZ8TLkI83GCq34+5VIFg==
X-Gm-Gg: AYBFou3X4A8SEjCiEoT9Bk6ujNeOdDvDTlpJ5Q9r+2b2N2THHCvBS2Yah3id9VYJqBu
	zvMBPXzKEyA0Ciwn3T9fb27DE5pJeK4LOA+1SnmBMyiGs5TIh+pmO4kBttbzvDy2dw1jQOYfxnq
	13V16Mmc0kquyj5n7mrYC2a798+pO+IxIzTci+JiOoVO5xpT6T4i/wTIvDJ3QuaAJQEfokiD3Ev
	TBQ29tPNecZZ3qzSH48z9oPo6m3HE1w0KMaacyGEyb7m5OVhKOEnopuFyLOKvBEOhPwGuPxurTD
	O3p2Coemx6nkEiT0gbXrkXdssFAGBftS1zhtc8AJSeOZFVW2xpdV3AdGxtYo/9zLTu69nwhfWCr
	TRQOfW2V0tKJntCHe4PXVZCowii0eA941nba+kJDbG0NWtFIau1WAYC7CcLmL/jS6967ZWxVGOO
	5wkyyhc1c1OHBdxGTnITNZdScU3y4eQ0Wa/vf2tGi8nkyDl4PgsTxHLA9mgaNZvY8cEVt5qGbgW
	2EzGC847iK2hc5gZLyJxvM4zIyz38z8VfBTQmqi+Y1nj10N/zyHXrBPt/1YchIwwzxQtzq+meae
	/7UyeHG9aym90rNffNJnxGHv1VqfykDgL3M1zlPhzIiTxk9tyWys4MlN9YFf5Q+O/koWKaVGm1P
	BndFDlcM=
X-Received: by 2002:a05:600c:354a:b0:49e:65f2:db64 with SMTP id 5b1f17b1804b1-4bb55a61152mr3023845e9.5.1794509722810;
        Thu, 12 Nov 2026 10:55:22 -0800 (PST)
Received: from alchark-surface.localdomain (bba-86-98-194-229.alshamil.net.ae. [86.98.194.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e28d0b2sm71734755e9.7.2026.11.12.10.55.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 10:55:22 -0800 (PST)
From: Alexey Charkov <alchark@gmail.com>
Date: Thu, 12 Nov 2026 22:55:08 +0400
Subject: [PATCH v6 1/4] clocksource/drivers/timer-vt8500: Add defines for
 magic constants
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
Message-Id: <20261112-vt8500-timer-updates-v6-1-fd1cea645d1f@gmail.com>
References: <20261112-vt8500-timer-updates-v6-0-fd1cea645d1f@gmail.com>
In-Reply-To: <20261112-vt8500-timer-updates-v6-0-fd1cea645d1f@gmail.com>
To: Alexey Charkov <alchark@gmail.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-watchdog@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4597; i=alchark@gmail.com;
 h=from:subject:message-id; bh=EnyVwDXCZhJWH17WUOtGzbF79lP3UqVzlI+QeOXtwgE=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWR94566fN/rX09CX+SE+N1+sltrHncie1l+zM+0u0c3B
 gve23Gkp2MiC4MYF4OlmCLL3G9LbKca8c3a5eHxFWYOKxPIEGmRBgYgYGHgy03MKzXSMdIz1TbU
 MzTSMdYxYuDiFICpvsvI8D923c+Yj1skqsW9U1b5zJ9wOOksR5e1QdGZJdV27QlPtC8wMnQvPrM
 m5HQX640vBQ9Kdz+TeG45xdhw/fmr50XuLGte8osTAA==
X-Developer-Key: i=alchark@gmail.com; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5

Add defines for the timer registers and their bits to make the code more
self-explanatory. While at that, replace _VAL suffixes with more
intuitive _REG suffixes on register offsets.

No functional changes.

Signed-off-by: Alexey Charkov <alchark@gmail.com>
---
 drivers/clocksource/timer-vt8500.c | 62 ++++++++++++++++++++++++--------------
 1 file changed, 39 insertions(+), 23 deletions(-)

diff --git a/drivers/clocksource/timer-vt8500.c b/drivers/clocksource/timer-vt8500.c
index a469b1b5f972..c4694cf8bea6 100644
--- a/drivers/clocksource/timer-vt8500.c
+++ b/drivers/clocksource/timer-vt8500.c
@@ -24,15 +24,28 @@
 
 #define VT8500_TIMER_OFFSET	0x0100
 #define VT8500_TIMER_HZ		3000000
-#define TIMER_MATCH_VAL		0x0000
-#define TIMER_COUNT_VAL		0x0010
-#define TIMER_STATUS_VAL	0x0014
-#define TIMER_IER_VAL		0x001c		/* interrupt enable */
-#define TIMER_CTRL_VAL		0x0020
-#define TIMER_AS_VAL		0x0024		/* access status */
-#define TIMER_COUNT_R_ACTIVE	(1 << 5)	/* not ready for read */
-#define TIMER_COUNT_W_ACTIVE	(1 << 4)	/* not ready for write */
-#define TIMER_MATCH_W_ACTIVE	(1 << 0)	/* not ready for write */
+
+#define TIMER_MATCH_REG(x)	(4 * (x))
+#define TIMER_COUNT_REG		0x0010	 /* clocksource counter */
+
+#define TIMER_STATUS_REG	0x0014
+#define TIMER_STATUS_MATCH(x)	BIT((x))
+#define TIMER_STATUS_CLEARALL	(TIMER_STATUS_MATCH(0) | \
+				 TIMER_STATUS_MATCH(1) | \
+				 TIMER_STATUS_MATCH(2) | \
+				 TIMER_STATUS_MATCH(3))
+
+#define TIMER_INT_EN_REG	0x001c	 /* interrupt enable */
+#define TIMER_INT_EN_MATCH(x)	BIT((x))
+
+#define TIMER_CTRL_REG		0x0020
+#define TIMER_CTRL_ENABLE	BIT(0)	 /* enable clocksource counter */
+#define TIMER_CTRL_RD_REQ	BIT(1)	 /* request counter read */
+
+#define TIMER_ACC_STS_REG	0x0024	 /* access status */
+#define TIMER_ACC_WR_MATCH(x)	BIT((x)) /* writing Match (x) value */
+#define TIMER_ACC_WR_COUNTER	BIT(4)	 /* writing clocksource counter */
+#define TIMER_ACC_RD_COUNTER	BIT(5)	 /* reading clocksource counter */
 
 #define msecs_to_loops(t) (loops_per_jiffy / 1000 * HZ * t)
 
@@ -43,11 +56,12 @@ static void __iomem *regbase;
 static u64 vt8500_timer_read(struct clocksource *cs)
 {
 	int loops = msecs_to_loops(10);
-	writel(3, regbase + TIMER_CTRL_VAL);
-	while ((readl((regbase + TIMER_AS_VAL)) & TIMER_COUNT_R_ACTIVE)
-						&& --loops)
+
+	writel(TIMER_CTRL_ENABLE | TIMER_CTRL_RD_REQ, regbase + TIMER_CTRL_REG);
+	while (readl(regbase + TIMER_ACC_STS_REG) & TIMER_ACC_RD_COUNTER &&
+	       --loops)
 		cpu_relax();
-	return readl(regbase + TIMER_COUNT_VAL);
+	return readl(regbase + TIMER_COUNT_REG);
 }
 
 static struct clocksource clocksource = {
@@ -63,23 +77,25 @@ static int vt8500_timer_set_next_event(unsigned long cycles,
 {
 	int loops = msecs_to_loops(10);
 	u64 alarm = clocksource.read(&clocksource) + cycles;
-	while ((readl(regbase + TIMER_AS_VAL) & TIMER_MATCH_W_ACTIVE)
-						&& --loops)
+
+	while (readl(regbase + TIMER_ACC_STS_REG) & TIMER_ACC_WR_MATCH(0) &&
+	       --loops)
 		cpu_relax();
-	writel((unsigned long)alarm, regbase + TIMER_MATCH_VAL);
+	writel((unsigned long)alarm, regbase + TIMER_MATCH_REG(0));
 
 	if ((signed)(alarm - clocksource.read(&clocksource)) <= MIN_OSCR_DELTA)
 		return -ETIME;
 
-	writel(1, regbase + TIMER_IER_VAL);
+	writel(TIMER_INT_EN_MATCH(0), regbase + TIMER_INT_EN_REG);
 
 	return 0;
 }
 
 static int vt8500_shutdown(struct clock_event_device *evt)
 {
-	writel(readl(regbase + TIMER_CTRL_VAL) | 1, regbase + TIMER_CTRL_VAL);
-	writel(0, regbase + TIMER_IER_VAL);
+	writel(readl(regbase + TIMER_CTRL_REG) | TIMER_CTRL_ENABLE,
+	       regbase + TIMER_CTRL_REG);
+	writel(0, regbase + TIMER_INT_EN_REG);
 	return 0;
 }
 
@@ -95,7 +111,7 @@ static struct clock_event_device clockevent = {
 static irqreturn_t vt8500_timer_interrupt(int irq, void *dev_id)
 {
 	struct clock_event_device *evt = dev_id;
-	writel(0xf, regbase + TIMER_STATUS_VAL);
+	writel(TIMER_STATUS_CLEARALL, regbase + TIMER_STATUS_REG);
 	evt->event_handler(evt);
 
 	return IRQ_HANDLED;
@@ -119,9 +135,9 @@ static int __init vt8500_timer_init(struct device_node *np)
 		return -EINVAL;
 	}
 
-	writel(1, regbase + TIMER_CTRL_VAL);
-	writel(0xf, regbase + TIMER_STATUS_VAL);
-	writel(~0, regbase + TIMER_MATCH_VAL);
+	writel(TIMER_CTRL_ENABLE, regbase + TIMER_CTRL_REG);
+	writel(TIMER_STATUS_CLEARALL, regbase + TIMER_STATUS_REG);
+	writel(~0, regbase + TIMER_MATCH_REG(0));
 
 	ret = clocksource_register_hz(&clocksource, VT8500_TIMER_HZ);
 	if (ret) {

-- 
2.56.0

