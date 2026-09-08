Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 744A637F01A
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 06:17:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788848263; cv=none; b=DramB+Nc+/7IFRXzOcWZWDpW/s0YIfS5+KFiDSgfbMTTlrHXTriibVIK2aWGgUd/MLmdh4RCtRN9rlBkOSMpStkG1FnooXYLk2jjSyhn8ETEL4QwlZeGZXpt0H+3Q6HANZmtol8vmgR6UhtmmZaKBwaJLXc6DW47QmrpyvzYh+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788848263; c=relaxed/simple;
	bh=dzGDbhhGi+3uNCM/afFVfLO4nDm3ep+Nmd9v2t11Drs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VZK2S40DWHDv6J0ChGv2QGtyTXgEjNAXTjtKDjtVtjyh4QjKx/iE06MS3laBYy35oXy/oYXXlMDBeyqE92fRB5L+tsYEztMLkXEkzKZhTxshvydtGEpjfPEzT/OL0SQVMFTTVQowLzIeXbOvf/CjFD7Y3O4zxVNLa4BUNAenv3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=LqOD+332; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=rKwtusWX; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="LqOD+332";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="rKwtusWX"
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh_=28Schneider_Electric=29?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788848260;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=e1NDuFDOTkBJEA7mk1+wwH7al0YDr8s3damloONjuog=;
	b=LqOD+332larawqDNbeIqoVedQ6Dt7DbP5eib8fWeRX/ak67eVXst7PvX2SAfB/xlttiBhv
	w1qbdiNLtkoZRDbzaRBcuZ5EKAcAW2V69xysfJxEbLzSsBvtOXqwniHe+VFIzxKSHSA+0g
	CjcjGGMciN12Uis4Tl4uM2ndvZmjFCbN9KcPfRMR2E0gZAg1/PFvHn5I1ZTnmp8Wbxyx4/
	SK2Znu0fP6WIV1s83vclvqh0p9C+Ec/py3lfLG50SdYt7sudK6mAlgGGpUqQ6Z8eU+q74T
	QFmwAmTB/eoJx16OXz3Q5/js6yZFZzUZTJJDTYhooei4flGTauN23GWt73pRhQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788848260;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=e1NDuFDOTkBJEA7mk1+wwH7al0YDr8s3damloONjuog=;
	b=rKwtusWXbOZ66dxTQCQO++towjv0dzHrDMffsqhR3Si9M0aVeo4zmgG/uJ+49jCNsUhUwQ
	crX8fMOkUlaJ6MBQ==
Date: Tue, 08 Sep 2026 08:17:34 +0200
Subject: [PATCH v2 4/4] timekeeping: Introduce and use
 timekeeper_is_clock_valid()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260908-timekeeping-conditionals-v2-4-5ebc3e7e1da0@linutronix.de>
References: <20260908-timekeeping-conditionals-v2-0-5ebc3e7e1da0@linutronix.de>
In-Reply-To: <20260908-timekeeping-conditionals-v2-0-5ebc3e7e1da0@linutronix.de>
To: John Stultz <jstultz@google.com>, Thomas Gleixner <tglx@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Miroslav Lichvar <mlichvar@redhat.com>
Cc: linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh_=28Schneider_Electric=29?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788848252; l=2859;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=dzGDbhhGi+3uNCM/afFVfLO4nDm3ep+Nmd9v2t11Drs=;
 b=eEy5iAXi4yBgReCO9UYLgmJfKNGHIFscGgfiUiMgWRKJulD4qjhuPz/3DtXmZQzkIFF85ILiZ
 tmjYqXvCstuDoQJW8DUeynISl/rFXcgdhlBQPFGD/Zr3gmCTS8HhnCC
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

If CONFIG_POSIX_AUX_CLOCKS is disabled only the core timekeeper exists
which is always valid.

Introduce and use a helper function to avoid the runtime conditional
in this case.

Signed-off-by: Thomas Weißschuh (Schneider Electric) <thomas.weissschuh@linutronix.de>
---
 kernel/time/timekeeping.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/kernel/time/timekeeping.c b/kernel/time/timekeeping.c
index 5cdf6795c5a6..8a8cb9f9f333 100644
--- a/kernel/time/timekeeping.c
+++ b/kernel/time/timekeeping.c
@@ -85,6 +85,11 @@ static inline bool timekeeper_is_core_tk(struct timekeeper *tk)
 	return !IS_ENABLED(CONFIG_POSIX_AUX_CLOCKS) || tk->id == TIMEKEEPER_CORE;
 }
 
+static inline bool timekeeper_is_clock_valid(const struct timekeeper *tk)
+{
+	return !IS_ENABLED(CONFIG_POSIX_AUX_CLOCKS) || tk->clock_valid;
+}
+
 /* flag for if timekeeping is suspended */
 int __read_mostly timekeeping_suspended;
 
@@ -1292,7 +1297,7 @@ void ktime_get_snapshot_id(clockid_t clock_id, struct system_time_snapshot *syst
 		seq = read_seqcount_begin(&tkd->seq);
 
 		/* Aux clocks can be invalid */
-		if (!tk->clock_valid)
+		if (!timekeeper_is_clock_valid(tk))
 			return;
 
 		now = tk_clock_read_snapshot(&tk->tkr_mono, &chs);
@@ -2993,7 +2998,7 @@ static int __do_adjtimex(struct tk_data *tkd, struct __kernel_timex *txc,
 
 	guard(raw_spinlock_irqsave)(&tkd->lock);
 
-	if (!tks->clock_valid)
+	if (!timekeeper_is_clock_valid(tks))
 		return -ENODEV;
 
 	if (txc->modes & ADJ_SETOFFSET) {
@@ -3108,7 +3113,7 @@ static void tk_aux_update_clocksource(void)
 		struct timekeeper *tks = &tkd->shadow_timekeeper;
 
 		guard(raw_spinlock_irqsave)(&tkd->lock);
-		if (!tks->clock_valid)
+		if (!timekeeper_is_clock_valid(tks))
 			continue;
 
 		timekeeping_forward_now(tks);
@@ -3127,7 +3132,7 @@ static void tk_aux_advance(void)
 		struct tk_data *aux_tkd = &timekeeper_data[id + TIMEKEEPER_AUX_FIRST];
 
 		guard(raw_spinlock)(&aux_tkd->lock);
-		if (aux_tkd->shadow_timekeeper.clock_valid)
+		if (timekeeper_is_clock_valid(&aux_tkd->shadow_timekeeper))
 			__timekeeping_advance(aux_tkd, TK_ADV_TICK);
 	}
 }
@@ -3155,7 +3160,7 @@ bool ktime_get_aux(clockid_t id, ktime_t *kt)
 	aux_tk = &aux_tkd->timekeeper;
 	do {
 		seq = read_seqcount_begin(&aux_tkd->seq);
-		if (!aux_tk->clock_valid)
+		if (!timekeeper_is_clock_valid(aux_tk))
 			return false;
 
 		base = ktime_add(aux_tk->tkr_mono.base, aux_tk->offs_aux);
@@ -3214,7 +3219,7 @@ static int aux_clock_set(const clockid_t id, const struct timespec64 *tnew)
 	aux_tks = &aux_tkd->shadow_timekeeper;
 
 	guard(raw_spinlock_irq)(&aux_tkd->lock);
-	if (!aux_tks->clock_valid)
+	if (!timekeeper_is_clock_valid(aux_tks))
 		return -ENODEV;
 
 	/* Forward the timekeeper base time */

-- 
2.55.0

