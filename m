Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF6DD566C56;
	Tue, 29 Sep 2026 19:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790708750; cv=none; b=s7CxEErz/GhQSNv289AhUWMHhliy5qVHurYZoe1RBA5pqE0zeDJTmQHsswRN9D7nkTiVF5ho9J/J6ZvbI+6AfbkP+qDTFTARthfmL+9dtSFWGFxYE30fxF+7AGxm/VDl5mYEoHwcSFxsOoxFxo5clakguNfdGNtQQU/FUPLHwsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790708750; c=relaxed/simple;
	bh=jpN3CnFApfjI7ibw1i1P305ZqYE6bRsj5QsN5yUbI4s=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=LrCVgUSpovEMfZcCPNx0mNmD/z0HcdWq482x7X1xn7xUtzDsFSPOCOdrL+hMqO4sOsQ9vnyvie88TQb9WiA473zUTU5celNavhRgu1gDz7mkCEGTmvaBJ7vvrmIz6GYf7YAnQGLl2LhPOfri5QCJSG6NliEAjTmGgvYdJWcFSCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=qEoTstns; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=DjiaTmZh; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="qEoTstns";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="DjiaTmZh"
Date: Tue, 29 Sep 2026 19:05:45 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1790708747;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DpV2m7ccTbL6wnJQO/UrvVOxyo8NqPYLEFD6biRnbFY=;
	b=qEoTstnscxEOexUWXGUDCexCxZ2cMDdAFukUYMpgEV6XjmPzKm2qMSeV7DiQiy8sVGQq7F
	n99YR/fPd1Z5UyvufA2qf7DvMXCk4anCPSxR/lYN4PQncfHmpLMkvmIQIcEqVgrCDFp4tS
	J5tSoj8m87IsL93VsVX+P5NccftEiQ4u9BgpVFTat0aYdBt2uhBWQu7dJZcO2h8ybrwHv3
	HAGmWC+EDKKRdiQdIo/ZeP+AcU2Lp+0OFOUsHM2o+Kog+1Y+yr2f2mXGbWAf9pameryyik
	MwqvYoWPKRVjz43kplf2V1D0Zv7I67rIBto2PgfWMBpbqYsVLBT4swRIR9GYFQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1790708747;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DpV2m7ccTbL6wnJQO/UrvVOxyo8NqPYLEFD6biRnbFY=;
	b=DjiaTmZh8HcV6aMfCecjlPn9sf8X9kBwbn2JxZ8ZO1b9HZ3EL47HTDhluajrsPn9XWkT/X
	X8DkTGAWI2GEHQBQ==
From: "tip-bot2 for Usama Arif" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject:
 [tip: timers/nohz] tick/nohz: Avoid unused timekeeping_max_deferment() calls
Cc: Usama Arif <usama.arif@linux.dev>, Thomas Gleixner <tglx@kernel.org>,
 Rik van Riel <riel@surriel.com>, x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260918133408.2834751-1-usama.arif@linux.dev>
References: <20260918133408.2834751-1-usama.arif@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <179070874570.3910103.6575259096390096554.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the timers/nohz branch of tip:

Commit-ID:     d305927765cf6025bc11db9d96c06ea663230ddd
Gitweb:        https://git.kernel.org/tip/d305927765cf6025bc11db9d96c06ea6632=
30ddd
Author:        Usama Arif <usama.arif@linux.dev>
AuthorDate:    Fri, 18 Sep 2026 06:34:08 -07:00
Committer:     Thomas Gleixner <tglx@kernel.org>
CommitterDate: Tue, 29 Sep 2026 21:00:08 +02:00

tick/nohz: Avoid unused timekeeping_max_deferment() calls

tick_nohz_next_event() limits a CPU's sleep interval to the maximum
deferment supported by the current clocksource when that CPU owns the
do_timer() duty. If the duty is unassigned, the limit also applies when
the CPU's TS_FLAG_DO_TIMER_LAST flag is set.

After the early timer checks, the function currently reads the maximum
deferment unconditionally. It then replaces the result with KTIME_MAX
unless one of the two conditions above applies.

timekeeping_max_deferment() performs a seqcount-protected read of the
shared timekeeper and follows its clocksource pointer. Check the do_timer
state first and avoid this work when the result would be discarded. This
leaves the resulting expiry unchanged and reduces accesses to timekeeper
data that is modified regularly.

On x86-64 this removes 18-20 dynamically executed instructions, including
the call, from the common non-owner path when the seqcount does not retry.

Signed-off-by: Usama Arif <usama.arif@linux.dev>
Signed-off-by: Thomas Gleixner <tglx@kernel.org>
Reviewed-by: Rik van Riel <riel@surriel.com>
Link: https://patch.msgid.link/20260918133408.2834751-1-usama.arif@linux.dev
---
 kernel/time/tick-sched.c | 23 ++++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/kernel/time/tick-sched.c b/kernel/time/tick-sched.c
index c8f2c4a..a7893a0 100644
--- a/kernel/time/tick-sched.c
+++ b/kernel/time/tick-sched.c
@@ -816,7 +816,7 @@ u64 get_jiffies_update(unsigned long *basej)
  */
 static ktime_t tick_nohz_next_event(struct tick_sched *ts, int cpu)
 {
-	u64 basemono, next_tick, delta, expires;
+	u64 basemono, next_tick, expires;
 	unsigned long basejiff;
 	int tick_cpu;
=20
@@ -856,8 +856,7 @@ static ktime_t tick_nohz_next_event(struct tick_sched *ts=
, int cpu)
 	 * If the tick is due in the next period, keep it ticking or
 	 * force prod the timer.
 	 */
-	delta =3D next_tick - basemono;
-	if (delta <=3D (u64)TICK_NSEC) {
+	if (next_tick - basemono <=3D (u64)TICK_NSEC) {
 		/*
 		 * We've not stopped the tick yet, and there's a timer in the
 		 * next period, so no point in stopping it either, bail.
@@ -873,17 +872,19 @@ static ktime_t tick_nohz_next_event(struct tick_sched *=
ts, int cpu)
 	 * the sleep time to the timekeeping 'max_deferment' value.
 	 * Otherwise we can sleep as long as we want.
 	 */
-	delta =3D timekeeping_max_deferment();
 	tick_cpu =3D READ_ONCE(tick_do_timer_cpu);
 	if (tick_cpu !=3D cpu &&
-	    (tick_cpu !=3D TICK_DO_TIMER_NONE || !tick_sched_flag_test(ts, TS_FLAG_=
DO_TIMER_LAST)))
-		delta =3D KTIME_MAX;
-
-	/* Calculate the next expiry time */
-	if (delta < (KTIME_MAX - basemono))
-		expires =3D basemono + delta;
-	else
+	    (tick_cpu !=3D TICK_DO_TIMER_NONE || !tick_sched_flag_test(ts, TS_FLAG_=
DO_TIMER_LAST))) {
 		expires =3D KTIME_MAX;
+	} else {
+		expires =3D timekeeping_max_deferment();
+
+		/* Calculate the next expiry time */
+		if (expires < (KTIME_MAX - basemono))
+			expires +=3D basemono;
+		else
+			expires =3D KTIME_MAX;
+	}
=20
 	ts->timer_expires =3D min_t(u64, expires, next_tick);
=20
