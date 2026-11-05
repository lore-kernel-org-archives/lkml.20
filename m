Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793866731;
	b=4K+oF4PdsFOEdMufU3NJ+9UUn1U4AT/OJsKcl5cE0O83GPg+ub5VdwkzeB2H0ZyFRDCm
	 K+Pxx7cQfN7+3B7AV2k87JRhletkFGJXkhskQLgMvH75NHRbR3t3yCg3gbKjV+pG42PeO
	 JM5DXjRybCvDH8BwwvUqnuwzDWUGUVJ0kfKpQfxwbZzmGqQd2DMfSNGJMhkyeioveGvmL
	 ZRR6NAguUmsTdsefbuN2NGzzPly+MXNzmwnKtnf7h94L+Y6kpgSBC2Z51vrb961MKz/rW
	 H9LLg3eP9MktXMPx5bike0MrVcyPRp1sjgk99sAmMyp0anWuLO64ecoNn6EPcB/V+9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793866731;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=QSh3FZ61lDmn3YnE+4HHyt0kXFsbYoPQ+T2xj8w5o54=;
	b=SXbBohHqb34Qv21UCi82h+zCJjLuQthdLCK9qIrWF/JmN6B24FHgGBRQwt1qYXRHehsF
	 2+/QwHVThxMOTC6gXrFXfwJPG89zQLM7SE9KZxCf6TFucl7Z87B7piZLRvT08Wqoc4OHU
	 D/4bMSjfdSRhEo94ORNcxXRCVRgFXLX8ita1rX62he4dfrZann09lx2kR8cPrTfKr3aTt
	 vs6eJR4vn8dybEuxOaQNgolTO0Gi8EkX36l73qYv6EYR9ahmdSNUT8HCiIT0gynwWugEr
	 Mugo1h6WlVnrKyCS5xu4wjELIKDcJzhTRW9SWP7T/Th2zDTQQDtp0UWwGOCpmmw8oiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b="E1D/lyFI";
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=bFLF3i84;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40854606A332
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 08:18:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 40854606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=E1D/lyFI;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=bFLF3i84
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793866730;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QSh3FZ61lDmn3YnE+4HHyt0kXFsbYoPQ+T2xj8w5o54=;
	b=E1D/lyFI2qzK8p9L4FBtIvrm6uZt98sJS5KGNZ/sP3mlaOvgSy5HYf8tfr/rwctWeiXan2
	FDYageHJOxrpfYnj8LiVPcnSa8xW2ggqu1NDFRbSXqRsICB/aTgsvqQPlEKUddAdt/4LBw
	hTMkBVnJAymEaS7Y69ppRuc2tje+Dls=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-103-WWhO2VOLMkqER8qvPzy9ag-1; Thu, 05 Nov 2026 03:18:47 -0500
X-MC-Unique: WWhO2VOLMkqER8qvPzy9ag-1
X-Mimecast-MFC-AGG-ID: WWhO2VOLMkqER8qvPzy9ag_1793866726
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-48df3f5be1fso211707f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 00:18:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793866726; x=1794471526; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QSh3FZ61lDmn3YnE+4HHyt0kXFsbYoPQ+T2xj8w5o54=;
        b=bFLF3i84yw4zNTxMjbn+zuxfBHmkTkMGOH6dnbG9Ovxitg1OCVDVBidnZwN1+tR3ft
         GtU5pKJjwuBT4+22XxR1r+Wn1nnxWRdR6hIHOLfD94LjddWmUFcxa0kr51XYBYSI6x9/
         wEnDkb/y6K55w54quqn3RZNGnJTMYBEjacqb5pPlyb8YjQgllm9nXTBgR0oQ67ORWYD6
         Xitf2YPN74U4CWMPK+zVppauRYUzYLTriU8YLp0xeYxN/rcR049ekpJFrzgBgTrcwZxc
         GZ8ToI7G4bN31d6gUiHb/K+bE6tLRMfCRkzF5FFj82vcxNKwvI4br+vZBBMTfWLMh2Yb
         6vRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793866726; x=1794471526;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QSh3FZ61lDmn3YnE+4HHyt0kXFsbYoPQ+T2xj8w5o54=;
        b=pz4WTMUjLrVh1tpfoL2/sPFTyfT+B35SuUpt9sRVSqJiY3MwM6CHTm6Y+yrwWah43w
         c0spMFFmS08KcIIM8gcZmC2aFx4oFh2KagK2ZLaTBsfxjBXTnGumy7tuEir7IC3Nhh26
         Xf0JG/Y29ECkqHIPG/lZPBA8C8KA9Nx/eXqITf521VRvfMOk5wHm3hDTki+3Y4aB/i+E
         EUqTUzk9Vt/MBLmx4GCXEPZ0wkZRQJpfRAic77kC6Yjw/OjJZcMcfawRxvTZwUnuLM6g
         XH0DrJ0uSTZUqxf7CLrFpXJZUhX97yh3IaMu1LEqECX51m3tZzzTCrLSBZFbPhdr4a7q
         5hJQ==
X-Gm-Message-State: APuU4Z/mPYkair7oRR1gF6T3PFYm+GPUy6NT80ZAaDAo0XfQ46oCKSJ9
	pUcmHioWi7O+BWUIiy7SehiuCPYN8IDbD1je6r+7qN8f0roh+epuxLo/5JEuW5nvdwR71o9PN7m
	OUAXy1PrHFo+UM4RFBZw856NXBENuSDo3IUOrQSpWiJScrzyvbLg5QxwXUt9RzxLG/g==
X-Gm-Gg: AYBFou1OFx90PbiPLpeWw1zTXfRGerzRgVPF016GrwyjXMJFbrCMaDRnDWKn4eNecXE
	v8ohSPgjXpBOIJo8Mw3jvIdFWemwXT72sLWJMmHTuDjQaQIbGh+UBv61tEO5emG/kHSJkkds+WE
	y7f3e9h7A+mZ5A8TOaaStaPPoRuA0r6kha7O/cpvAwFm2Zqt5m2uxuCaDgwbvgFcO75Vrj8kiB+
	ytk2GC7N2S4Tv98gTjA8FX3UfAtjPaSMIKard+rImQZRXKUMbxxxoel+RNzhn/0C54C6ofAfSIt
	CRh0lwIhmUrldIU/M2nf/TMUMzvAqQESJ87tmWdCDO5MM19VFIy0wqupspKTCc7p04zrAuafWib
	ipPSHkSz90dCFZmsFAxX9Z+3fT4oRJsCqnAasMSa/d6tDmi/cOlFLpk7/QJ6IVeP7vyV5SBwjEP
	+l4OX2LplWsNLogQ==
X-Received: by 2002:a05:600c:1798:b0:4a0:1f9e:5f78 with SMTP id 5b1f17b1804b1-4ac1228a41emr256212935e9.0.1793866725984;
        Thu, 05 Nov 2026 00:18:45 -0800 (PST)
X-Received: by 2002:a05:600c:1798:b0:4a0:1f9e:5f78 with SMTP id 5b1f17b1804b1-4ac1228a41emr256212735e9.0.1793866725536;
        Thu, 05 Nov 2026 00:18:45 -0800 (PST)
Received: from localhost (119.red-83-42-172.dynamicip.rima-tde.net. [83.42.172.119])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b572bba0f3sm44809715e9.9.2026.11.05.00.18.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 00:18:44 -0800 (PST)
From: Enric Balletbo i Serra <eballetb@redhat.com>
Date: Thu, 05 Nov 2026 09:18:33 +0100
Subject: [PATCH v3 2/3] clocksource/drivers/nxp-stm: Fix overshoot
 detection in set_next_event
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
Message-Id: <20261105-nxp-stm-fixes-v3-2-8129b912e74b@redhat.com>
References: <20261105-nxp-stm-fixes-v3-0-8129b912e74b@redhat.com>
In-Reply-To: <20261105-nxp-stm-fixes-v3-0-8129b912e74b@redhat.com>
To: Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rt-devel@lists.linux.dev, 
 Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>, 
 NXP S32 Linux Team <s32@nxp.com>, stable@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 Enric Balletbo i Serra <eballetb@redhat.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793866718; l=4750;
 i=eballetb@redhat.com; s=20261026; h=from:subject:message-id;
 bh=SfBQfG5mlmibe1DcTKzD+JsL6HElJN8/ugHv0KDBhSM=;
 b=hhPQnLcN4q07hzTusiQDClj/QCvvst7v1mFKYKmIvqGnjjFcMs+XXcftGeKP7p3kegMMr1oWu
 I2BB1+q+URHCJ1Fy/H1MOdHbH13htNKxeLY5Sdops2YsB8BLWxAfOiS
X-Developer-Key: i=eballetb@redhat.com; a=ed25519;
 pk=5zh6xuAxTiQwglL2NXQFqWuyRPmCE8T5KPXLbNXhnKI=

The existing overshoot check effectively compares two counter readings
and only triggers on a counter wraparound between reads; the normal
case where the counter advances past the programmed value during the
read/write sequence is not detected.

Replace it with the approach of hpet_clkevt_set_next_event(): read the
counter after the comparator write and return -ETIME when less than
STM_MIN_CYCLES remain until the match. Derive the minimum programming
delta from that margin. See the cover letter for the measurement
procedure and constant derivation.

Fixes: cec32ac75827 ("clocksource/drivers/nxp-timer: Add the System Timer Module for the s32gx platforms")
Assisted-by: Claude:claude-opus-4-6
Signed-off-by: Enric Balletbo i Serra <eballetb@redhat.com>
---
 drivers/clocksource/timer-nxp-stm.c | 53 ++++++++++++++++++++++++-------------
 1 file changed, 35 insertions(+), 18 deletions(-)

diff --git a/drivers/clocksource/timer-nxp-stm.c b/drivers/clocksource/timer-nxp-stm.c
index ee249fed1b91..81527745b7e2 100644
--- a/drivers/clocksource/timer-nxp-stm.c
+++ b/drivers/clocksource/timer-nxp-stm.c
@@ -20,7 +20,6 @@
 #include <linux/of_irq.h>
 #include <linux/platform_device.h>
 #include <linux/sched_clock.h>
-#include <linux/units.h>
 
 #define STM_CR(__base)		(__base)
 
@@ -52,6 +51,17 @@
 
 #define STM_ENABLE_MASK	(STM_CR_FRZ | STM_CR_TEN)
 
+/*
+ * The comparator fires only on an exact match with the counter.
+ * STM_MIN_CYCLES is the post-write overshoot margin used by
+ * nxp_stm_clockevent_set_next_event(), following the same approach
+ * as hpet_clkevt_set_next_event(). STM_MIN_PROG_DELTA is the
+ * minimum programming delta derived from it. Both values are
+ * empirically sized from measurements on S32G.
+ */
+#define STM_MIN_CYCLES		512
+#define STM_MIN_PROG_DELTA	(STM_MIN_CYCLES * 3)
+
 struct stm_timer {
 	void __iomem *base;
 	unsigned long rate;
@@ -248,6 +258,7 @@ static int nxp_stm_clockevent_set_next_event(unsigned long delta, struct clock_e
 {
 	struct stm_timer *stm_timer = ced_to_stm(ced);
 	u32 val;
+	s32 res;
 
 	nxp_stm_clockevent_disable(stm_timer);
 
@@ -258,16 +269,26 @@ static int nxp_stm_clockevent_set_next_event(unsigned long delta, struct clock_e
 	writel(val, STM_CMP0(stm_timer->base));
 
 	/*
-	 * The counter is shared across the channels and can not be
-	 * stopped while we are setting the next event. If the delta
-	 * is very small it is possible the counter increases above
-	 * the computed 'val'. The min_delta value specified when
-	 * registering the clockevent will prevent that. The second
-	 * case is if the counter wraps while we compute the 'val' and
-	 * before writing the comparator register. We read the counter,
-	 * check if we are back in time and abort the timer with -ETIME.
+	 * The comparator generates an interrupt only on an exact match
+	 * with the counter. If the counter reaches the programmed value
+	 * before the write to the comparator takes effect, the match is
+	 * missed and the next interrupt only fires after a full 32-bit
+	 * counter wraparound (~32.2s at 133 MHz).
+	 *
+	 * The counter read below targets the same module as the
+	 * comparator write, so it can only complete once the write has
+	 * reached the device, and the signed difference between the
+	 * programmed value and the counter reflects the hardware state at
+	 * that point. If less than STM_MIN_CYCLES remain to the match, the
+	 * write might not have made it into the comparator in time;
+	 * return -ETIME so the clockevents core retries with a larger
+	 * delta.
+	 *
+	 * This is the same approach as hpet_clkevt_set_next_event().
 	 */
-	if (val > nxp_stm_clockevent_read_counter(stm_timer) + delta)
+	res = (s32)(val - nxp_stm_clockevent_read_counter(stm_timer));
+
+	if (res < STM_MIN_CYCLES)
 		return -ETIME;
 
 	nxp_stm_clockevent_enable(stm_timer);
@@ -337,16 +358,12 @@ static int nxp_stm_clockevent_starting_cpu(unsigned int cpu)
 		return ret;
 
 	/*
-	 * The timings measurement show reading the counter register
-	 * and writing to the comparator register takes as a maximum
-	 * value 1100 ns at 133MHz rate frequency. The timer must be
-	 * set above this value and to be secure we set the minimum
-	 * value equal to 2000ns, so 2us.
-	 *
-	 * minimum ticks = (rate / MICRO) * 2
+	 * The minimum programming delta absorbs the measured worst case
+	 * read/write/read round trip and the overshoot margin, see the
+	 * comment on STM_MIN_CYCLES.
 	 */
 	clockevents_config_and_register(&stm_timer->ced, stm_timer->rate,
-					(stm_timer->rate / MICRO) * 2, 0x7FFFFFFFU);
+					STM_MIN_PROG_DELTA, 0x7FFFFFFFU);
 
 	return 0;
 }

-- 
2.56.0

