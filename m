Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792964842;
	b=lpjWsuU4g8k+E/dBpheoeeNu79IZFg4M/JkSqP2GZNZ4//GvA7EwRqvF9Doz56KTjwvD
	 WgaIn5IBMnq45Vzrc0EzB3JbbVlunBLDgXvcciguvX/ru/9blAzNS2zO8SPmu0yL34ENl
	 RXWap82mPK1bMYTQx2A/qY8cKA6pntsn58jgPUv/F4OIb5CyEpazbSSFj+Vcdh4tnaQDx
	 wqQwUuzCRpCZVwAp7wFygpBntxcGjp9021vSst9QA6ATNC3WrYu8vvbLaBkS+PHDufolA
	 wPUBt299zCTxnumnuw72IRfpz8kPmuTVOEyMBnbSg17LEfp4YRWF6aSz0oBzezHeInA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792964842;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:Sender:Reply-to:
	 To:Subject:Cc:In-Reply-To:References:MIME-Version:Message-ID:Robot-ID:
	 Robot-Unsubscribe:Precedence:Content-Type:Content-Transfer-Encoding;
	bh=263iaRyuYraUwZMOzYbSsFVl7ncT3DXb5BDpa29FTEs=;
	b=Y6yWy09S1EQWsFHqlsiU28b/WYFZ1hWY6SmK9qu7mHdNJVSO9wYdgLfmnt5oUnLeo3KH
	 O1O+q+iOm0KhkeAG1yEJIqjor2kx5rfAhQYUd98bnPCfx4U/kXpoJr/omDih+hOZRw+I8
	 yCkLinjcTHyTKZlA0QnpaG+oie0P9oXziivfCDvhu+pGdivjxpPGckylCs9W9oyqYnkKV
	 EhNUC35THbdw3DCwtYlRzEKTXiNMLscUj6QJFUMAVKwIy2lbeApelwqqSy+C2mQmdElrd
	 o/tukOqfKjaDtjHo4pUBq3tjHl4mquLFjtrR8ncHY1HXvwcxSJBnTEsveZ1IWqMUT+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=z5G+2BoX;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=GVkpQXOc;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 889F6606A31D;
	Sun, 25 Oct 2026 21:47:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 889F6606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=z5G+2BoX;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=GVkpQXOc
Date: Sun, 25 Oct 2026 21:47:12 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1792964834;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=263iaRyuYraUwZMOzYbSsFVl7ncT3DXb5BDpa29FTEs=;
	b=z5G+2BoX/eY4vluv8v/vlmSKsVYW9yg0mQ7Cseren6DnIrz9y9ZgsAnLCm8toM1Lp7k24Y
	yHIlKhSV02xcummlCYWV1O8QYU08ASyXY1POPmkd+Az9DgB6ReSQhmNq11cY9gDq+0jWte
	J/es1MgTwHebi08MLh+JLJ0IMgCDEdutjLNSH3l9FVMRdRox/THqfuyPsQEO5c/Pe7m2BC
	S3ZTe/Ia+rpQx3Up7ncX6IFz+ricfS/YGK2E0HfCpqIepAP6ox0oZqxVj8cljQUgRUUo8q
	2+y74DC9p/S5CBpTtf5ZK/08cGmZpBKBRU0YdyG6Wu3PgCR2PsDuk5HX+AXlQQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1792964834;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=263iaRyuYraUwZMOzYbSsFVl7ncT3DXb5BDpa29FTEs=;
	b=GVkpQXOcIDRthJePESsK0nF5bZZCJmgI4UZ1RlpAbPrg8GOv+k6gvYTBvUW5dTzGmaKuBt
	7b/Nk/TGq+a3X8Dg==
From: "tip-bot2 for Hung-Jui Lin" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: timers/urgent] selftests: timers: Add a test for disarmed
 SIGEV_NONE timers
Cc: "Hung-Jui Lin" <alex.lin.programmer@gmail.com>,
 Thomas Gleixner <tglx@kernel.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20261023151411.28685-2-alex.lin.programmer@gmail.com>
References: <20261023151411.28685-2-alex.lin.programmer@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Message-ID: <179296483217.4109677.11268753318546306317.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the timers/urgent branch of tip:

Commit-ID:     45aeb7b3039355cfaf01ee1f7e104a55a8d61d0b
Gitweb:        https://git.kernel.org/tip/45aeb7b3039355cfaf01ee1f7e104a55a8d=
61d0b
Author:        Hung-Jui Lin <alex.lin.programmer@gmail.com>
AuthorDate:    Fri, 23 Oct 2026 23:14:11 +08:00
Committer:     Thomas Gleixner <tglx@kernel.org>
CommitterDate: Sun, 25 Oct 2026 22:43:19 +01:00

selftests: timers: Add a test for disarmed SIGEV_NONE timers

timer_gettime() must report a zero it_value for a disarmed timer. For
SIGEV_NONE timers, common_timer_get() reported the remaining time of the
previous arming instead.

Add check_sigev_none_disarm(). It arms a SIGEV_NONE oneshot timer, checks
that a remaining time is reported, disarms the timer and checks that
it_value is zero. Run it for CLOCK_MONOTONIC and CLOCK_PROCESS_CPUTIME_ID,
as CPU timers use a separate implementation.

Without the preceding fix, the CLOCK_MONOTONIC case fails.

Signed-off-by: Hung-Jui Lin <alex.lin.programmer@gmail.com>
Signed-off-by: Thomas Gleixner <tglx@kernel.org>
Link: https://patch.msgid.link/20261023151411.28685-2-alex.lin.programmer@gma=
il.com
---
 tools/testing/selftests/timers/posix_timers.c | 43 +++++++++++++++++-
 1 file changed, 42 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/timers/posix_timers.c b/tools/testing/se=
lftests/timers/posix_timers.c
index a92d4b9..1cf6444 100644
--- a/tools/testing/selftests/timers/posix_timers.c
+++ b/tools/testing/selftests/timers/posix_timers.c
@@ -495,6 +495,45 @@ static void check_sigev_none(int which)
 			 "check_sigev_none %s\n", name);
 }
=20
+static void check_sigev_none_disarm(int which)
+{
+	const char *name =3D clock_name(which);
+	struct itimerspec its;
+	struct sigevent sev;
+	timer_t timerid;
+	bool armed;
+
+	memset(&sev, 0, sizeof(sev));
+	sev.sigev_notify =3D SIGEV_NONE;
+
+	if (timer_create(which, &sev, &timerid))
+		fatal_error(name, "timer_create()");
+
+	/* Start a oneshot timer which does not expire during the test */
+	memset(&its, 0, sizeof(its));
+	its.it_value.tv_sec =3D 100;
+	if (timer_settime(timerid, 0, &its, NULL))
+		fatal_error(name, "timer_settime()");
+
+	if (timer_gettime(timerid, &its))
+		fatal_error(name, "timer_gettime()");
+	armed =3D its.it_value.tv_sec || its.it_value.tv_nsec;
+
+	/* Disarm it. The remaining time must be reported as 0 */
+	memset(&its, 0, sizeof(its));
+	if (timer_settime(timerid, 0, &its, NULL))
+		fatal_error(name, "timer_settime()");
+
+	if (timer_gettime(timerid, &its))
+		fatal_error(name, "timer_gettime()");
+
+	if (timer_delete(timerid))
+		fatal_error(name, "timer_delete()");
+
+	ksft_test_result(armed && !its.it_value.tv_sec && !its.it_value.tv_nsec,
+			 "%s %s\n", __func__, name);
+}
+
 static void check_gettime(int which)
 {
 	const char *name =3D clock_name(which);
@@ -680,7 +719,7 @@ int main(int argc, char **argv)
=20
 	ksft_print_header();
 	if (run_sig_ign_tests) {
-		ksft_set_plan(19);
+		ksft_set_plan(21);
 	} else {
 		ksft_set_plan(10);
 	}
@@ -714,6 +753,8 @@ int main(int argc, char **argv)
 		check_delete();
 		check_sigev_none(CLOCK_MONOTONIC);
 		check_sigev_none(CLOCK_PROCESS_CPUTIME_ID);
+		check_sigev_none_disarm(CLOCK_MONOTONIC);
+		check_sigev_none_disarm(CLOCK_PROCESS_CPUTIME_ID);
 		check_gettime(CLOCK_MONOTONIC);
 		check_gettime(CLOCK_PROCESS_CPUTIME_ID);
 		check_gettime(CLOCK_THREAD_CPUTIME_ID);
