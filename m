Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D291541CB2E;
	Tue, 29 Sep 2026 19:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790709081; cv=none; b=L9wgCrbVcLc9mMsROmwJRG5TWo5/xQMU4b7Cy6tiJKV5lkyyQY1BNlN+hfi2Xas22LZ9yEXUhSTCYzYp+eFd+Uap1gN7MqG4bXmTXzEDm0yNN6qaFY/FHFRmSel7U/BuRH8c+K9tv4oLNMsr9XBDU6DZxePsg0336OWYRXZVVWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790709081; c=relaxed/simple;
	bh=UGknsm8EbueKBBel3cMOdp5NIwhLxZ3xJDzuToUILos=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=qURecyO6ZpDY77pehpa4YmhETPpHSEHotV7uYkC4fpyLVYk7AbERys/M3wXZtBTq9l/pxQd6hS44jAbpkyUmIQrhkfDfYDKQwRx2KUq4fxBHDjxJ5IyA2I4TvwXTCkYiBAMllX1Kc5XgpWQU3md7H8Agjm1P0YEUW0VyfjMTOUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=hx3Fw428; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=AInW3f6J; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="hx3Fw428";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="AInW3f6J"
Date: Tue, 29 Sep 2026 19:11:15 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1790709077;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0vYxjkK4DtzBK/WuHcQYZyUlaHqHP9rHVrUH8OQBeiA=;
	b=hx3Fw42805keSUm7D6KUXMbGhlIjvwNAZNb1bJ9eHJeHI5WPNvCM8MmhJIDSbGS7H7SCEL
	ehW2AcOtl9/fIKiVdX0TiPZlU3bYu7sfqz2zndv8kWcpIgwnXCdTnvU5DKTcaFdp7oCIA9
	0cyjI38u+d67FC5XV5fgs7E19mfLQCWjBRekfRLq3/9NSx53dwA1FqYIVrGDohj0DgflJu
	TwZX062I5xcqDEDKYmtFzasQUWKXXRyXVJ4FrQPNwJ296R0EJhJF22KbmqGcNiVeLRzhIo
	J6uBFxNmiSLOqDpjgDZL4hAXskDVMA1DC/oCZq1GTgkBmVKUf877DmfUCdqyxA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1790709077;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0vYxjkK4DtzBK/WuHcQYZyUlaHqHP9rHVrUH8OQBeiA=;
	b=AInW3f6JbCSNCyRnL8aYPCeJqDcFw/mv8FeEyEH2NZiaLedIO+XKByrjd9S04IayEOd1uf
	glv8iu8Gm7J38NDQ==
From: "tip-bot2 for Paul E. McKenney" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: timers/core] timers/migration: Mark racy updates to
 tmigr_event::ignore field
Cc: "Paul E. McKenney" <paulmck@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
 x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260919002523.3133928-2-paulmck@kernel.org>
References: <20260919002523.3133928-2-paulmck@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <179070907589.3910103.4368752109347029667.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the timers/core branch of tip:

Commit-ID:     bb41ece16463b76b4d73fc47e6648fd823236765
Gitweb:        https://git.kernel.org/tip/bb41ece16463b76b4d73fc47e6648fd8232=
36765
Author:        Paul E. McKenney <paulmck@kernel.org>
AuthorDate:    Fri, 18 Sep 2026 17:25:23 -07:00
Committer:     Thomas Gleixner <tglx@kernel.org>
CommitterDate: Tue, 29 Sep 2026 21:07:15 +02:00

timers/migration: Mark racy updates to tmigr_event::ignore field

The tmigr_event structure's ignore field is sometimes accessed locklessly,
but the __tmigr_cpu_activate(), tmigr_cpu_new_timer(), and
__tmigr_cpu_deactivate() functions do not mark accesses to this field.

Therefore, use READ_ONCE() for the tmigr_cpu_new_timer() function's
lockless load and WRITE_ONCE() for the __tmigr_cpu_activate() and
__tmigr_cpu_deactivate() functions' stores.

KCSAN located this issue.

Signed-off-by: Paul E. McKenney <paulmck@kernel.org>
Signed-off-by: Thomas Gleixner <tglx@kernel.org>
Link: https://patch.msgid.link/20260919002523.3133928-2-paulmck@kernel.org
---
 kernel/time/timer_migration.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/kernel/time/timer_migration.c b/kernel/time/timer_migration.c
index 059d433..f920e73 100644
--- a/kernel/time/timer_migration.c
+++ b/kernel/time/timer_migration.c
@@ -715,7 +715,7 @@ static void __tmigr_cpu_activate(struct tmigr_cpu *tmc)
=20
 	trace_tmigr_cpu_active(tmc);
=20
-	tmc->cpuevt.ignore =3D true;
+	WRITE_ONCE(tmc->cpuevt.ignore, true);
 	WRITE_ONCE(tmc->wakeup, KTIME_MAX);
=20
 	walk_groups(&tmigr_active_up, &data, tmc);
@@ -1258,7 +1258,7 @@ u64 tmigr_cpu_new_timer(u64 nextexp)
 	ret =3D READ_ONCE(tmc->wakeup);
 	if (nextexp !=3D KTIME_MAX) {
 		if (nextexp !=3D tmc->cpuevt.nextevt.expires ||
-		    tmc->cpuevt.ignore) {
+		    READ_ONCE(tmc->cpuevt.ignore)) {
 			ret =3D tmigr_new_timer(tmc, nextexp);
 			/*
 			 * Make sure the reevaluation of timers in idle path
@@ -1362,7 +1362,7 @@ static u64 __tmigr_cpu_deactivate(struct tmigr_cpu *tmc=
, u64 nextexp)
 	 * or CPU goes offline.
 	 */
 	if (nextexp !=3D KTIME_MAX)
-		tmc->cpuevt.ignore =3D false;
+		WRITE_ONCE(tmc->cpuevt.ignore, false);
=20
 	walk_groups(&tmigr_inactive_up, &data, tmc);
 	return data.firstexp;
