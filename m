Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F09704C14F3
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 20:20:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792009260; cv=none; b=XtAFgYr54mWAtJdrDNr2iENmLtt7nTYorEZpZgsIrRY2GJ94kgEl1gu1Tu74PTyhUClk6TrPazRg5xRkwHIy6UX9iS/APclXndLcaaZJB34pYfCiglrbeTj8D2ECHjtmy186PP/FV//4YNM9oY/ewGdu2ASg374Sxalj/6k+LZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792009260; c=relaxed/simple;
	bh=GDV34X+HEL+UtUZv9zcOK9d5iFFWdZ/X9e2UyTCpLSg=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=Z2jic7AvLmsDU0vv53HUtLqKXuDuAnvMpL1KeViheEH8nh0YytW4FoyZ3desZB7ureHX+reGLrwheaw9VfGWC+eZB1SV3XKyfcOTRwwVrXsNQduXuemEqhHOROQNwGoeTD2hiWjNl7MRFsDcuH2EQzSGFDanKm4Fbh9ocHGWLgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=BYU/9AWd; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=NsqhX9T5; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="BYU/9AWd";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="NsqhX9T5"
Date: Wed, 14 Oct 2026 20:20:55 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1792009256;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JvSl8OYeOH/4FixAuz3UM07JDxGQVnMUHoxzh73YuJ8=;
	b=BYU/9AWdmeGqYexlrEjgNe1yVq5DgMIhtBPL78IQzQZCB0/fp/xDnVW5fPVpOU6eH1icWn
	XGyMH5+UlkEwOlXni4ccjP+Fqo5rzvRHe3+wpdHCkWzsVyaAf7Y+XMUVzAWfzFb6HyIt85
	x9eSuA3OSH6tZz5Kd0MAYwHSuJS3WwVn8bSJSUeUMavuJggGoIwdNNwYodWTo2QWl0IIBv
	qJpFTLI/OdB8+22tIaR7sFeVe9D0cPTII5qdcHkcug7QRW8Rxf7wM4xUDTgBOiaSS5ykOV
	GMOiV6k68ro7ZNkD/NYTA5kxtSENTO7922q9e1gPTZSyQVV5RYFgkBwvli1bkg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1792009256;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JvSl8OYeOH/4FixAuz3UM07JDxGQVnMUHoxzh73YuJ8=;
	b=NsqhX9T5BLCsM0u62eipz7MqXx4UJK9kPRb6ZXK3l2sK3M1KXskczNb0Y/ePFMbgNwlml4
	FHKNH4GEbBcCRMAA==
From:
 clocksource-bot for =?utf-8?q?Beno=C3=AEt?= Monin <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-kernel@vger.kernel.org
Subject: [clocksource: timers/drivers/next]
 clocksource/drivers/mips-gic-timer: Simplify gic_next_event() for per-cpu
 timer
Cc: benoit.monin@bootlin.com, Daniel Lezcano <daniel.lezcano@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 daniel.lezcano@oss.qualcomm.com
In-Reply-To: <20260929-sync-gic-counters-v4-4-ec70c4b60434@bootlin.com>
References: <20260929-sync-gic-counters-v4-4-ec70c4b60434@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <179200925504.2666337.10617615490975540555.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the timers/drivers/next branch of c=
locksource:

Commit-ID:     a05997891e64b8e32733c0e062a062dcc3617a12
Gitweb:        https://git.kernel.org/pub/scm/linux/kernel/git/daniel.lezcano=
/linux.git//a05997891e64b8e32733c0e062a062dcc3617a12
Author:        Beno=C3=AEt Monin <benoit.monin@bootlin.com>
AuthorDate:    Tue, 29 Sep 2026 14:14:11 +02:00
Committer:     Daniel Lezcano <daniel.lezcano@kernel.org>
CommitterDate: Fri, 02 Oct 2026 12:00:55 +02:00

clocksource/drivers/mips-gic-timer: Simplify gic_next_event() for per-cpu tim=
er

The GIC clock event device is registered per CPU and is flagged with
CLOCK_EVT_FEAT_C3STOP. This guarantees that the set_next_event() callback
is always invoked on the CPU of the event.

Drop the code path configuring the compare register of another CPU as it
is never called and does not correctly handle the case of having multiple
clusters, and document this guarantee by adding the CLOCK_EVT_FEAT_PERCPU
flag to the clock event device features.

Signed-off-by: Beno=C3=AEt Monin <benoit.monin@bootlin.com>
Signed-off-by: Daniel Lezcano <daniel.lezcano@kernel.org>
Reviewed-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Link: https://patch.msgid.link/20260929-sync-gic-counters-v4-4-ec70c4b60434@b=
ootlin.com
---
 drivers/clocksource/mips-gic-timer.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/clocksource/mips-gic-timer.c b/drivers/clocksource/mips-=
gic-timer.c
index 1501c7d..cdaf4ba 100644
--- a/drivers/clocksource/mips-gic-timer.c
+++ b/drivers/clocksource/mips-gic-timer.c
@@ -52,18 +52,13 @@ static u64 notrace gic_read_count(void)
=20
 static int gic_next_event(unsigned long delta, struct clock_event_device *ev=
t)
 {
-	int cpu =3D cpumask_first(evt->cpumask);
 	u64 cnt;
 	int res;
=20
 	cnt =3D gic_read_count();
 	cnt +=3D (u64)delta;
-	if (cpu =3D=3D raw_smp_processor_id()) {
-		write_gic_vl_compare(cnt);
-	} else {
-		write_gic_vl_other(mips_cm_vp_id(cpu));
-		write_gic_vo_compare(cnt);
-	}
+	write_gic_vl_compare(cnt);
+
 	res =3D ((int)(gic_read_count() - cnt) >=3D 0) ? -ETIME : 0;
 	return res;
 }
@@ -82,6 +77,7 @@ static void gic_clockevent_cpu_init(unsigned int cpu,
 {
 	cd->name		=3D "MIPS GIC";
 	cd->features		=3D CLOCK_EVT_FEAT_ONESHOT |
+				  CLOCK_EVT_FEAT_PERCPU |
 				  CLOCK_EVT_FEAT_C3STOP;
=20
 	cd->rating		=3D 350;
