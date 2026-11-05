Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793866732;
	b=oGsqBV87gccwVMAutQ20yC+fx1o9025nkU/Lg1AtR6JEjNt5d72sWjHRvTnJ/nVWVCsT
	 uvZpdee3Fa8PWyGZu5uOFJ5kiPQkrRVVThZM0n2LJuT49wzuXUowndEHcGU/Z7Dl95JVP
	 KbnaTNjtnqnlrbKHEUbh536lBkqmRm/cywojJC3aJZMugSuMcuKinhhCNfA8f44b+2X2I
	 8WK0mheIh/DrBWYOp6ZY+9gvAKiBUMjarRJzJdo1yEvorkwfcVpUerDqB/oogs41EZbXg
	 gW9mYy2SoGCXzboKpMIfu4ogznNt6PSAcL7E/sOyuAzJuZZkK0vqmn/1GJqjpZSJ3fw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793866732;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=YnYl0grphqtCTW16mbqB5OZ7Ar0uK9ejWodFsFluXmA=;
	b=1iKElM4dNbYJYudyDzRR40eM9AY274dql/LRsgZcyiiJ4qzg7XFS6xyPgAYGirJldFGT
	 Gh6HiR4EFdp6zxA2K7gAIrdirrBh+eQJvHE5ACl6G2fakGGb9f7LkqgmUMhWihbJvQusI
	 ue+wFK3+elf9QLx/R5rz8hdSMayjB1Rnmtmx1uLx8t5OBOpZFQBzfr1GMqHb0VEylOXQ0
	 RGnaIqB6IVyBj2Q7vfkH8X1diDTwlDKxBSu1YE4cqXYvVrfDjTFaWcnUcHgC0XZo2616o
	 v9YVSsSAM4YqE1P4NXsp7hKTEbOVpLSvYaiRtumpdbi2yBPHo6DMBxbRAQ1yGBRmi+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b="cOs2Z/H3";
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=VXUc3kFo;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93982606A328
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 08:18:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 93982606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=cOs2Z/H3;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=VXUc3kFo
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793866730;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YnYl0grphqtCTW16mbqB5OZ7Ar0uK9ejWodFsFluXmA=;
	b=cOs2Z/H3fyglf48BU0THLdP2KnSdCqAFRgw/QMUR2e/5k5FXZ2YJAKG3F6lRcVbviNFW/O
	CSTFlBRkODuDbbwX2wfgUk4CzBC5OZ08fxypB8FCgI+09azSiPKx0vUw1oyDpxDVIOLD07
	iFt31ptmICj9BCexWB1sMOl6PXvn9ag=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-250-qWuSJoecOTSBTxQl6SCScA-1; Thu, 05 Nov 2026 03:18:49 -0500
X-MC-Unique: qWuSJoecOTSBTxQl6SCScA-1
X-Mimecast-MFC-AGG-ID: qWuSJoecOTSBTxQl6SCScA_1793866728
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-49b8bd66a51so2177435e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 00:18:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793866728; x=1794471528; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YnYl0grphqtCTW16mbqB5OZ7Ar0uK9ejWodFsFluXmA=;
        b=VXUc3kFoMMeDYPETcfw19wRE+EWWz8eBSRt+/1At2n2kYjlAnIcuW2KoBloTbNx4bW
         no1b0wK8jaF1vhMt7wTXnWECw0VrTCmwc46AC4CJiVFV6SBiWcRdYTdFBP2kOWs8/Pe3
         0JHy4hMRKGrVnhDCkJZjP71VLYoK8+KheV4TydAwUguHpq4DBNyIzZe3m5k9ZdHd6yxC
         l9oaCBeUVFshJCmMq905F4797DBql1+OJsvHoqwQQk9gSQuLH40D3LWY6ZKzw8yWC3vL
         pVwXN6c1463YriA6C5ht40mbZbf4vUU/aNnvm28Kn/vhHW5Xbr+FXemRtDB4boW2RVQB
         ofvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793866728; x=1794471528;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YnYl0grphqtCTW16mbqB5OZ7Ar0uK9ejWodFsFluXmA=;
        b=DTF/dY99lSbTKITEcraoQMnX+1EiQWUXuaq0xSVvLlUxZvsLGgxOB7jphiY78NCdO9
         Qfs/18HtzHJYTlwBhvg40fdbB5cEAu6hN0nA6XK8x+jjLIdABxE8blBcUIwGqQkeHdfb
         OppNJGK4ktlxDPfaQfUnwW74SGnj+WR9z0zSGX5hC/leLcITDAkwFaMmMTGNediQJ20D
         53pIsY3jkWgpFqxc9EwVaJe1bT1hb7U7vhhdAYQHYhQhVXRb8D44Af8GrbzGY9HBItk5
         qVyiZJ2L/pBblvbHcHvuoOnPWXuxZ1+PPYbkgsDLAPOJnGOuNqN6iOJ4APLJA8c7WG+Y
         dULw==
X-Gm-Message-State: APuU4Z8gYQYy8bQitmq179nym27Z5VwMYlC0v2calP/ZJjHouhJiFEnm
	vibnIl0OpyAsA9Lg0Tq8RHh8Y3viFTm2vLS8wA/aKxwC2k4msFVj05jdyW7DuPFg0hy+08YZl0x
	fw7OUPoVUGIqwEzBKoJ44IsOx/2i/W5IECTfTsnLWpD5uyVg21AY9SRKqYfxbLo4Slw==
X-Gm-Gg: AYBFou17Y16AxtchwYrtDkvLw80PSWJHht2gThKI/c/kmfn8ci/DIhvilsu7UWd9bhY
	shj7U4Cg1jLv3vRbJoypOQiAsjWx1AaRbAm1+gfIFe0M96krH5e8YyRMlqHKTd+qjgeB7CGrKZJ
	901oPVO/+7ZPHP80l5O6is2w89GOv9cAf+JsLu8dxR97JQMLtIpCJ0N/bxjb4OimHh9Da7OdCg/
	PhTumA/Rnbg1Plkts1H7tS2y0VTwK3hDuH+htMCujry77wlBu2VhL2GgfRvKgufrRxgFGGnut5l
	N98eGKzXSsX6n4kNcv1kCDskitPUpsLclLKp3n/IrKa0GHQzCyRZdNJYI8Osu4UUn9mvwEV840C
	7eCKy/EXmqVy+KtpPlGFsiwIcrZEt+MqxEHACmbUqXLlXebneIpjYjxNQhgBLkXGTgWs7hqHdhV
	WS0rryVsvNgh5XnA==
X-Received: by 2002:a05:6000:2587:b0:48e:5ad1:5e77 with SMTP id ffacd0b85a97d-48e6e261607mr37451517f8f.0.1793866727923;
        Thu, 05 Nov 2026 00:18:47 -0800 (PST)
X-Received: by 2002:a05:6000:2587:b0:48e:5ad1:5e77 with SMTP id ffacd0b85a97d-48e6e261607mr37451467f8f.0.1793866727444;
        Thu, 05 Nov 2026 00:18:47 -0800 (PST)
Received: from localhost (119.red-83-42-172.dynamicip.rima-tde.net. [83.42.172.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48feda203b6sm8437363f8f.48.2026.11.05.00.18.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 00:18:46 -0800 (PST)
From: Enric Balletbo i Serra <eballetb@redhat.com>
Date: Thu, 05 Nov 2026 09:18:34 +0100
Subject: [PATCH v3 3/3] clocksource/drivers/nxp-stm: Arm the compare
 channel from the state callbacks
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
Message-Id: <20261105-nxp-stm-fixes-v3-3-8129b912e74b@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793866718; l=4847;
 i=eballetb@redhat.com; s=20261026; h=from:subject:message-id;
 bh=gKd+ISmeFZF91zn4FW3sChMabdau9YNhi9yQ9k+mIyE=;
 b=vyi+xrok9WUJjuZ1aq0y/R2QRzxzfZKBFUfjS/ufrPzTsHkchLnh3UsYDssaTGvwk2ad1KIFl
 fqgaUxkZlyaBuKQMQv+qtIzSGIyZOpwerNeuoyWlgaPGdY7D7wfZzk0
X-Developer-Key: i=eballetb@redhat.com; a=ed25519;
 pk=5zh6xuAxTiQwglL2NXQFqWuyRPmCE8T5KPXLbNXhnKI=

set_next_event() disables the compare channel, programs the comparator
and enables the channel again after the overshoot check. The trailing
channel-enable write is a posted write landing after the check: if the
counter passes the programmed value before the enable takes effect, the
match is missed. No min_delta can close that window.

Keep the channel armed for the whole ONESHOT operation instead, and
manage it from the state callbacks, like the HPET driver does:

  - set_state_oneshot() and set_state_periodic() enable the channel;
    a stale pending interrupt flag is cleared before enabling.
    set_state_oneshot_stopped() and set_state_shutdown() disable it.

  - set_next_event() now only writes the comparator, covered by the
    overshoot check.

  - The interrupt handler reprograms the comparator only in periodic
    mode; in ONESHOT mode the stale value stays armed until the core
    programs a new event or stops the channel.

Fixes: cec32ac75827 ("clocksource/drivers/nxp-timer: Add the System Timer Module for the s32gx platforms")
Assisted-by: Claude:claude-opus-4-6
Signed-off-by: Enric Balletbo i Serra <eballetb@redhat.com>
---
 drivers/clocksource/timer-nxp-stm.c | 52 +++++++++++++++++++++++--------------
 1 file changed, 32 insertions(+), 20 deletions(-)

diff --git a/drivers/clocksource/timer-nxp-stm.c b/drivers/clocksource/timer-nxp-stm.c
index 81527745b7e2..8ad99863bdff 100644
--- a/drivers/clocksource/timer-nxp-stm.c
+++ b/drivers/clocksource/timer-nxp-stm.c
@@ -254,14 +254,27 @@ static int nxp_stm_clockevent_shutdown(struct clock_event_device *ced)
 	return 0;
 }
 
+static int nxp_stm_clockevent_set_oneshot(struct clock_event_device *ced)
+{
+	struct stm_timer *stm_timer = ced_to_stm(ced);
+
+	/*
+	 * Clear a stale interrupt flag so that enabling the channel
+	 * cannot fire an event from a previous match.
+	 */
+	writel(STM_CIR_CIF, STM_CIR0(stm_timer->base));
+
+	nxp_stm_clockevent_enable(stm_timer);
+
+	return 0;
+}
+
 static int nxp_stm_clockevent_set_next_event(unsigned long delta, struct clock_event_device *ced)
 {
 	struct stm_timer *stm_timer = ced_to_stm(ced);
 	u32 val;
 	s32 res;
 
-	nxp_stm_clockevent_disable(stm_timer);
-
 	stm_timer->delta = delta;
 
 	val = nxp_stm_clockevent_read_counter(stm_timer) + delta;
@@ -288,18 +301,16 @@ static int nxp_stm_clockevent_set_next_event(unsigned long delta, struct clock_e
 	 */
 	res = (s32)(val - nxp_stm_clockevent_read_counter(stm_timer));
 
-	if (res < STM_MIN_CYCLES)
-		return -ETIME;
-
-	nxp_stm_clockevent_enable(stm_timer);
-
-	return 0;
+	return res < STM_MIN_CYCLES ? -ETIME : 0;
 }
 
 static int nxp_stm_clockevent_set_periodic(struct clock_event_device *ced)
 {
 	struct stm_timer *stm_timer = ced_to_stm(ced);
 
+	writel(STM_CIR_CIF, STM_CIR0(stm_timer->base));
+	nxp_stm_clockevent_enable(stm_timer);
+
 	return nxp_stm_clockevent_set_next_event(stm_timer->rate, ced);
 }
 
@@ -327,6 +338,8 @@ static int nxp_stm_clockevent_per_cpu_init(struct device *dev, struct stm_timer
 	stm_timer->ced.name = name;
 	stm_timer->ced.features = CLOCK_EVT_FEAT_PERIODIC | CLOCK_EVT_FEAT_ONESHOT;
 	stm_timer->ced.set_state_shutdown = nxp_stm_clockevent_shutdown;
+	stm_timer->ced.set_state_oneshot = nxp_stm_clockevent_set_oneshot;
+	stm_timer->ced.set_state_oneshot_stopped = nxp_stm_clockevent_shutdown;
 	stm_timer->ced.set_state_periodic = nxp_stm_clockevent_set_periodic;
 	stm_timer->ced.set_next_event = nxp_stm_clockevent_set_next_event;
 	stm_timer->ced.suspend = nxp_stm_clockevent_suspend;
@@ -384,19 +397,18 @@ static irqreturn_t nxp_stm_module_interrupt(int irq, void *dev_id)
 	writel(STM_CIR_CIF, STM_CIR0(stm_timer->base));
 
 	/*
-	 * Update STM_CMP value using the counter value
+	 * The STM hardware has no periodic mode: the comparator stays
+	 * armed after a match, so periodic mode is emulated by
+	 * reprogramming the comparator here. In ONESHOT mode the stale
+	 * comparator value stays armed instead; the clockevents core
+	 * either programs a new event or stops the channel long before
+	 * the counter can wrap around to the stale value (~32.2s at
+	 * 133 MHz).
 	 */
-	val = nxp_stm_clockevent_read_counter(stm_timer) + stm_timer->delta;
-
-	writel(val, STM_CMP0(stm_timer->base));
-
-	/*
-	 * stm hardware doesn't support oneshot, it will generate an
-	 * interrupt and start the counter again so software needs to
-	 * disable the timer to stop the counter loop in ONESHOT mode.
-	 */
-	if (likely(clockevent_state_oneshot(ced)))
-		nxp_stm_clockevent_disable(stm_timer);
+	if (clockevent_state_periodic(ced)) {
+		val = nxp_stm_clockevent_read_counter(stm_timer) + stm_timer->delta;
+		writel(val, STM_CMP0(stm_timer->base));
+	}
 
 	ced->event_handler(ced);
 

-- 
2.56.0

