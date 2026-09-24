Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F9373BCD2B
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 16:33:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790267597; cv=none; b=CcSIZSBU5595/nAjMstSHP1PF8ag033v/5f//Rxx64q2xw67JkuvpqmlEeYUiaZBmoTcC56fsKd2UPwkKX2AZ13SGa6ugL8AIQv6EtElgGNGUMTYA8YZ9em3XUzsRcdYavQKyNaQGf7PEAJ9ky927EAKWfJ5dkbeUyGyGYWbgIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790267597; c=relaxed/simple;
	bh=bk/pwohSD+XlLIdtsWhkL7PmmNRffoPG+IN9aMx4vpg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Z0ktrCSVYCUIBEywNu016I2nWy+ebdP9/EySLB1uIptPXaz2ZMTTPJzSe2MEZEaKoODE5LqdwX85BLUvv911+HDASopZOzN8SYu8qpifQoKKa6JmiAGQExMHbmr9Tl3JcMgzkRO59W/RxLvr7sFPYDeLi3Lz1bZa881hk0KN44s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=STJ3ZqZx; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="STJ3ZqZx"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49febbce9afso181355e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 09:33:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790267593; x=1790872393; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TFd+aLon6EXtZ1MLjZlKV+LwhSqx6c6KeIId0bykqXY=;
        b=STJ3ZqZxCra4seqe8JtUxsyfs428eSdRtC0QJhxtt8SJKyDXe2DfPAzk/MKaN9xmBE
         5Tu+TprLoMqFGLCwG6uybdI5p5fgEUgJf4BFqprKbw4YEC1XrFNwUE1WNZhzVQLxknCQ
         JJgmifter9HSfjSmIJSSBM20ISfAwDI2Xrzuji4O/WaDv1YROu/NtwK92prJYJ/hbZPC
         KcoWtM+ynZwSd/maaMByY1qNBS+4TJD7QSb+mlBBX5Lj4fz2QE65Tmlaxn+gJ1sgFJ+M
         QAVOfRWDtjj5K/wL5RYorTq+QcWtf0Tu0kQCW77Go3O5wwx9zOHGUHthz78M4QngiyVf
         6PXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790267593; x=1790872393;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TFd+aLon6EXtZ1MLjZlKV+LwhSqx6c6KeIId0bykqXY=;
        b=eppPh363i4O+Sg1OUEVb3mb4rL+4FwnzU4/rPEj4Po/id2DDbD1x+64jSeBmykFVho
         BtbbCJSZjRhYGOpA18+bJFeS20k7dtXtAj6zX7Upd9tNjQwJSh2+nhNTnnqo94xh8ST3
         IoJ3jmzdDmSLsmcJN0A9xt3sBywK61Kl/+bbAdCiF1xSmitYO9m9/mRX0PH+5J5HB+Uu
         Cx4G7D/8JYL05HwOo34ONpRqK3YHXRVda0gq7w67MNF5R+cyRgR8EZKiNbRP9mawqAER
         MQrvhmHQoYngFf99vFIrQ50arSZLxoRSIn5bsxh9sS9gN9s8/52wfQoy98nDXH+KwjxJ
         fzlQ==
X-Forwarded-Encrypted: i=1; AKwUvBx0KFAUp30BO5Fs49e4IiW0hndcvv8nuT3LHQM0Oj96PWiPLZq4XLFFaQBDYbU8Ei9PG9173AfSA3sxl2U=@vger.kernel.org
X-Gm-Message-State: AFuF++lxol0254AUuTMUXGCt5B3uvEi/edDqkzx2nmq7NEvAIogtYaKI
	AIbGmp4NoFdBdA/O/a4GsN9DfEwg5BM28iEbRYD/jI9r4Y9ezOFLhYo=
X-Gm-Gg: AYBFou2z/2njSQx39ScA8DLm2f0x8QtElImnTKsn67qfywHZBMiIPfpxSrFgYhcuyOR
	LxhUH74HYhJhqb1R9XlyrPfjO0PwwSDGc0tWMsItrhkNp1xlH+Pfx0YVt3uP4vNJs/g73675ml1
	0ymz5v5hPe3Js6pk4a2P9eKQxUekbbBiWyWxq7/AjzhyAC71GeeeGKRSF9ZpRNIUCixt975nMA2
	4w0HRfGUkTctaJUa2Yi2WmVf+r7nFGR+6V7g03wg5eDgQMz1o7pjBECUbzftnb2RIgFIKBulM6H
	Y2xOe5nF+VdtzzsQWu69DLHFWPwQ3uKgB9utmzh/PxdMvDDbNTDQpXJYdkM9BOOT89TYa7blIoy
	JwfuYMnyQCgMM3/9grATLRndr1rlviktG/FKsmt/HLBvO2IfhEg0c59TCqlkq0d3+5O6Ru4rXnJ
	3USxy8NvLzbdgaFiuL2BdrIxxby+oczO5O6i0fovwZ1XAlVXZwdwn8Xi0MveoWwFYs5EdGUdRVa
	UxxaToMntgTsMp0VS9KTCkRmJR/PjuXKV1GD+DWQBJ8dNTtTlTs6cbkYQ==
X-Received: by 2002:a05:600c:314a:b0:49e:6778:c2bd with SMTP id 5b1f17b1804b1-49fe66c86bcmr57831365e9.6.1790267593313;
        Thu, 24 Sep 2026 09:33:13 -0700 (PDT)
Received: from localhost.localdomain ([31.223.3.6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe0c5c41asm118176785e9.4.2026.09.24.09.33.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 09:33:12 -0700 (PDT)
From: "=?UTF-8?q?Habil=20Eren=20T=C3=BCrker?=" <habilerenturker@gmail.com>
X-Google-Original-From: =?UTF-8?q?Habil=20Eren=20T=C3=BCrker?= <habilerenturker@hotmail.com>
To: tglx@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com
Cc: x86@kernel.org,
	hpa@zytor.com,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Habil=20Eren=20T=C3=BCrker?= <habilerenturker@hotmail.com>
Subject: [PATCH] x86/hpet: Clean up code style and update printk to pr_warn
Date: Thu, 24 Sep 2026 19:28:44 +0300
Message-ID: <20260924163258.8267-1-habilerenturker@hotmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Adjusted the code to meet checkpatch.pl file requirements. 
Also replaced printk_ratelimit() and pr_warn() with pr_warn_ratelimited().
Signed-off-by: Habil Eren Türker <habilerenturker@hotmail.com>
---
 arch/x86/kernel/hpet.c | 33 ++++++++++++++++-----------------
 1 file changed, 16 insertions(+), 17 deletions(-)

diff --git a/arch/x86/kernel/hpet.c b/arch/x86/kernel/hpet.c
index 8dc7b710e..154fe23a1 100644
--- a/arch/x86/kernel/hpet.c
+++ b/arch/x86/kernel/hpet.c
@@ -155,22 +155,22 @@ static void _hpet_print_config(const char *function, int line)
 	pr_info("CFG: 0x%x, STATUS: 0x%x\n", cfg, status);
 
 	l = hpet_readl(HPET_COUNTER);
-	h = hpet_readl(HPET_COUNTER+4);
+	h = hpet_readl(HPET_COUNTER + 4);
 	pr_info("COUNTER_l: 0x%x, COUNTER_h: 0x%x\n", l, h);
 
 	channels = ((id & HPET_ID_NUMBER) >> HPET_ID_NUMBER_SHIFT) + 1;
 
 	for (i = 0; i < channels; i++) {
 		l = hpet_readl(HPET_Tn_CFG(i));
-		h = hpet_readl(HPET_Tn_CFG(i)+4);
+		h = hpet_readl(HPET_Tn_CFG(i) + 4);
 		pr_info("T%d: CFG_l: 0x%x, CFG_h: 0x%x\n", i, l, h);
 
 		l = hpet_readl(HPET_Tn_CMP(i));
-		h = hpet_readl(HPET_Tn_CMP(i)+4);
+		h = hpet_readl(HPET_Tn_CMP(i) + 4);
 		pr_info("T%d: CMP_l: 0x%x, CMP_h: 0x%x\n", i, l, h);
 
 		l = hpet_readl(HPET_Tn_ROUTE(i));
-		h = hpet_readl(HPET_Tn_ROUTE(i)+4);
+		h = hpet_readl(HPET_Tn_ROUTE(i) + 4);
 		pr_info("T%d ROUTE_l: 0x%x, ROUTE_h: 0x%x\n", i, l, h);
 	}
 }
@@ -300,10 +300,10 @@ static int hpet_clkevt_set_state_periodic(struct clock_event_device *evt)
 {
 	unsigned int channel = clockevent_to_channel(evt)->num;
 	unsigned int cfg, cmp, now;
-	uint64_t delta;
+	u64 delta;
 
 	hpet_stop_counter();
-	delta = ((uint64_t)(NSEC_PER_SEC / HZ)) * evt->mult;
+	delta = ((u64)(NSEC_PER_SEC / HZ)) * evt->mult;
 	delta >>= evt->shift;
 	now = hpet_readl(HPET_COUNTER);
 	cmp = now + (unsigned int)delta;
@@ -367,7 +367,7 @@ hpet_clkevt_set_next_event(unsigned long delta, struct clock_event_device *evt)
 	s32 res;
 
 	cnt = hpet_readl(HPET_COUNTER);
-	cnt += (u32) delta;
+	cnt += (u32)delta;
 	hpet_writel(cnt, HPET_Tn_CMP(channel));
 
 	/*
@@ -541,7 +541,7 @@ static struct irq_domain *hpet_create_irq_domain(int hpet_id)
 	struct fwnode_handle *fn;
 	struct irq_fwspec fwspec;
 
-	if (x86_vector_domain == NULL)
+	if (!x86_vector_domain)
 		return NULL;
 
 	domain_info = kzalloc_obj(*domain_info);
@@ -1271,9 +1271,9 @@ int hpet_rtc_timer_init(void)
 
 	if (!hpet_default_delta) {
 		struct clock_event_device *evt = &hpet_base.channels[0].evt;
-		uint64_t clc;
+		u64 clc;
 
-		clc = (uint64_t) evt->mult * NSEC_PER_SEC;
+		clc = (u64)evt->mult * NSEC_PER_SEC;
 		clc >>= evt->shift + DEFAULT_RTC_SHIFT;
 		hpet_default_delta = clc;
 	}
@@ -1360,7 +1360,7 @@ EXPORT_SYMBOL_GPL(hpet_set_alarm_time);
 
 int hpet_set_periodic_freq(unsigned long freq)
 {
-	uint64_t clc;
+	u64 clc;
 
 	if (!is_hpet_enabled())
 		return 0;
@@ -1370,7 +1370,7 @@ int hpet_set_periodic_freq(unsigned long freq)
 	} else {
 		struct clock_event_device *evt = &hpet_base.channels[0].evt;
 
-		clc = (uint64_t) evt->mult * NSEC_PER_SEC;
+		clc = (u64)evt->mult * NSEC_PER_SEC;
 		do_div(clc, freq);
 		clc >>= evt->shift;
 		hpet_pie_delta = clc;
@@ -1407,8 +1407,7 @@ static void hpet_rtc_timer_reinit(void)
 	if (lost_ints) {
 		if (hpet_rtc_flags & RTC_PIE)
 			hpet_pie_count += lost_ints;
-		if (printk_ratelimit())
-			pr_warn("Lost %d RTC interrupts\n", lost_ints);
+		pr_warn_ratelimited("Lost %d RTC interrupts\n", lost_ints);
 	}
 }
 
@@ -1440,9 +1439,9 @@ irqreturn_t hpet_rtc_interrupt(int irq, void *dev_id)
 	}
 
 	if (hpet_rtc_flags & RTC_AIE &&
-	    (curr_time.tm_sec == hpet_alarm_time.tm_sec) &&
-	    (curr_time.tm_min == hpet_alarm_time.tm_min) &&
-	    (curr_time.tm_hour == hpet_alarm_time.tm_hour))
+	    curr_time.tm_sec == hpet_alarm_time.tm_sec &&
+	    curr_time.tm_min == hpet_alarm_time.tm_min &&
+	    curr_time.tm_hour == hpet_alarm_time.tm_hour)
 		rtc_int_flag |= RTC_AF;
 
 	if (rtc_int_flag) {
-- 
2.47.3

