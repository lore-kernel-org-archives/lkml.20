Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8419935295C;
	Tue, 29 Sep 2026 20:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790712356; cv=none; b=WlH7YAYcD74dAtFicH3nkOJDlwmmFD8irBOrv9j9WGGZ6jLVRpyQfkJ8vkXWBJbT1PZM3S8tMe8/ipR9qF6jbctWVDq2NRQJezI7mY8vlxmlQXghYNU9vc9p+/EA5rMnHa6HHAaFNtNEl3St34xjJ/d8hTHx7PZvBgnSn+KsFaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790712356; c=relaxed/simple;
	bh=F948w9zrSmh3pZj6S7IiQw0mph55BrJtWFgAvIfGt74=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=UncOHfIPn99c/I3ICn9pdlOP4Sk5NHkVtFzMRho1WtQE7zN9WV0V6YDDCC0Uzwc6mnypR9+vPGz5M+uj2ZqPWQY9wTXIEx3zHi4NGRzBRKRQDmBw33seillvGJaHUHtBgSKCMLbJ47rYpjMjModYD64943wo2TDTSMG4ti4Ekbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=ilukzoV8; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=M3yuBq5s; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="ilukzoV8";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="M3yuBq5s"
Date: Tue, 29 Sep 2026 20:05:49 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1790712353;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9NFLbFitPUpXdrGzwPBnd0AU12sGG17q2H/iSrlrgwg=;
	b=ilukzoV8FmqXNyvqiJO0XWS+w/PSWav6ViHtxLxF0BfTsHPgewBckW6erC7yxGj9WSRH7f
	YZQg9fHcsYBtAl2oFbfxwUexUHiCIl5vPGCFYs2SB4/ErYyba6igMw19fXzouD7d+EobrD
	3M0/FtQg8R5i5D3Aka39nrgXiP3FkKGgXoADYIfy1p0B5TFC3CCxaBIweh1AcZQDKhUX1m
	McIUv+HA2IeRgris3ILZXMprGaQLvzbjPBcwXSfr1ogsqq4gKfwOlhlErUxe7PaDGZ591o
	dqjuE/ZwiuSee7jBEK9wu2IfgZHOiLZ+DxmGbPOuEQpR71YHp0NWWxzFA48vQg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1790712353;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9NFLbFitPUpXdrGzwPBnd0AU12sGG17q2H/iSrlrgwg=;
	b=M3yuBq5s9MsC8I2CXszZ5A6xZwVzYkpcv0hFNc88MRMQAQeCBe+T72V8QnOcC78O7caCb8
	7eH2TDMs14MAkHDg==
From: "tip-bot2 for Eva Kurchatova" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: timers/core] selftests: timers: Measure the CPU timers on the
 clock they count
Cc: Eva Kurchatova <eva.kurchatova@virtuozzo.com>,
 Thomas Gleixner <tglx@kernel.org>, John Stultz <jstultz@google.com>,
 x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260917015237.2462954-2-eva.kurchatova@virtuozzo.com>
References: <20260917015237.2462954-2-eva.kurchatova@virtuozzo.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <179071234992.3910103.2731078353172024952.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the timers/core branch of tip:

Commit-ID:     b03638013add0609d35aaa8291548dea92cb9484
Gitweb:        https://git.kernel.org/tip/b03638013add0609d35aaa8291548dea92c=
b9484
Author:        Eva Kurchatova <eva.kurchatova@virtuozzo.com>
AuthorDate:    Thu, 17 Sep 2026 04:52:32 +03:00
Committer:     Thomas Gleixner <tglx@kernel.org>
CommitterDate: Tue, 29 Sep 2026 22:03:31 +02:00

selftests: timers: Measure the CPU timers on the clock they count

Commit b00385b8d081 ("selftests/posix_timers: Use CLOCK_THREAD_CPUTIME_ID
for ITIMER_PROF measurements") gave ITIMER_PROF the clock it counts, as
measuring a CPU timer against the wall says nothing on a machine where
the task does not have a CPU to itself. The other CPU timers are still
measured against CLOCK_REALTIME and fail the same way. With four busy
loops on the two CPUs of a test machine:

  not ok 2 ITIMER_VIRTUAL
  not ok 5 timer_create() per CLOCK_THREAD_CPUTIME_ID
  not ok 6 timer_create() per CLOCK_PROCESS_CPUTIME_ID

ITIMER_VIRTUAL counts the time the task spends in userspace, so take
CLOCK_THREAD_CPUTIME_ID for it as well; the loop it runs stays in
userspace, so what that clock adds for system time is far inside the
half a second the check allows. check_timer_create() arms its timer on
the clock it is given, so measure on that one.

The test then passes whole on that machine, 19 of 19, busy or idle.

Signed-off-by: Eva Kurchatova <eva.kurchatova@virtuozzo.com>
Signed-off-by: Thomas Gleixner <tglx@kernel.org>
Acked-by: John Stultz <jstultz@google.com>
Link: https://patch.msgid.link/20260917015237.2462954-2-eva.kurchatova@virtuo=
zzo.com
---
 tools/testing/selftests/timers/posix_timers.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/timers/posix_timers.c b/tools/testing/se=
lftests/timers/posix_timers.c
index a92d4b9..52b7289 100644
--- a/tools/testing/selftests/timers/posix_timers.c
+++ b/tools/testing/selftests/timers/posix_timers.c
@@ -113,9 +113,10 @@ static void check_itimer(int which, const char *name)
=20
 	done =3D 0;
=20
-	if (which =3D=3D ITIMER_VIRTUAL)
+	if (which =3D=3D ITIMER_VIRTUAL) {
+		clock_id =3D CLOCK_THREAD_CPUTIME_ID;
 		signal(SIGVTALRM, sig_handler);
-	else if (which =3D=3D ITIMER_PROF) {
+	} else if (which =3D=3D ITIMER_PROF) {
 		clock_id =3D CLOCK_THREAD_CPUTIME_ID;
 		signal(SIGPROF, sig_handler);
 	}
@@ -148,7 +149,7 @@ static void check_timer_create(int which)
 	struct itimerspec val =3D {
 		.it_value.tv_sec =3D DELAY,
 	};
-	int clock_id =3D CLOCK_REALTIME;
+	int clock_id =3D which;
 	timer_t id;
=20
 	done =3D 0;
