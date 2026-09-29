Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88F801A38F9;
	Tue, 29 Sep 2026 19:05:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790708735; cv=none; b=G0HyxeW0izEB1PP50WdyvOxFhEn7KUJi+prFwYHOglO2K33mVZPPCLxITSiRoZV8AY288bNRvP1sZR/JoYA4tkWUzzaaeVxL+q5fof0Ya50DPP+gYe4gC6kLMn2xO84re79dA++HqBwylXS/6asKOEMN7sBGAFKIkNB2YiszlCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790708735; c=relaxed/simple;
	bh=xv3THKMY8V2nzHM1193XszbsJfLNErs/LpaFGmt+ch4=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=o9MDRPgK+gV7DvunVOcibXb74NcVS7z4xBdx7Glov17VOPDnyT0TQZI6Z/e2iOXKijqfHr5i9G/ZnCpe0+b+xxf3Wi1HP/7taHCLq7riUXw4bGgASu0TlD4YMymq4RSncbUhj3KfkM38VCT2j5hamGkmjqlR00OqW3CjxcHpuPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=tUHzvr0I; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Ys3QCEeu; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="tUHzvr0I";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Ys3QCEeu"
Date: Tue, 29 Sep 2026 19:05:30 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1790708731;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=byARfjLW++cP7ljvg4qYoKX0wqo1GQz9/DwToMVH9bk=;
	b=tUHzvr0I/NR19CHTLONi7iDlrOiyRFUVCG0sfgXoT+70cW1dHNKMPtIXlc1+JMil/eYXFE
	yxG5Tt6Py866eBso/VgHXMA731chOvwlhQNQtV58k9gmref0/SrxsNzUuhN6irANozZaYp
	QpiBBp8zust0L0B967q1u9E7IciEx+L1KcqCdJ/jvoa2x9h0IeAi3CZF9lTQpFjMsUQQOx
	cCOdhwZ4dqX1qLHPcMF2uBT8Ddd7KOQuGn5mmJGjjgf8jp/+iRgaybWFvv+cuLbXK/bV+q
	yXZE8wH98voGHENL8YKoEUwDF0fC6r19mK5+OPi3383KpazEre46fMMxaa88dQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1790708731;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=byARfjLW++cP7ljvg4qYoKX0wqo1GQz9/DwToMVH9bk=;
	b=Ys3QCEeuVALNr0TSMk62AVDpyEloQN6Nbmb8USZ1TU4ioH4Yi8KGWYQLmDQr+0mhSSWP4X
	5hkGYx6hJ+PAPuBA==
From: "tip-bot2 for Paul E. McKenney" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject:
 [tip: timers/core] hrtimer: Update hrtimer_resolution only if value changes
Cc: "Paul E. McKenney" <paulmck@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
 x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260919001428.3133388-10-paulmck@kernel.org>
References: <20260919001428.3133388-10-paulmck@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <179070873027.3910103.17076313954097191310.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the timers/core branch of tip:

Commit-ID:     15f84398330ce1c0aa3e1e3edd0c915324bed26b
Gitweb:        https://git.kernel.org/tip/15f84398330ce1c0aa3e1e3edd0c915324b=
ed26b
Author:        Paul E. McKenney <paulmck@kernel.org>
AuthorDate:    Fri, 18 Sep 2026 17:14:26 -07:00
Committer:     Thomas Gleixner <tglx@kernel.org>
CommitterDate: Tue, 29 Sep 2026 21:02:52 +02:00

hrtimer: Update hrtimer_resolution only if value changes

Currently, the hrtimer_switch_to_hres() function unconditionally updates
hrtimer_resolution to HIGH_RES_NSEC.  This causes KCSAN false positives
in kernels built with CONFIG_KCSAN_STRICT=3Dy.  It also causes unnecessary
cache-line traffic on the many code paths that load hrtimer_resolution,
which is especially regrettable because the value of hrtimer_resolution
normally changes only once during the lifetime of a given kernel.

Therefore, update the value of hrtimer_resolution to HIGH_RES_NSEC only
if it does not already have that value.

Signed-off-by: Paul E. McKenney <paulmck@kernel.org>
Signed-off-by: Thomas Gleixner <tglx@kernel.org>
Link: https://patch.msgid.link/20260919001428.3133388-10-paulmck@kernel.org
---
 kernel/time/hrtimer.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/kernel/time/hrtimer.c b/kernel/time/hrtimer.c
index 7b44a35..2054064 100644
--- a/kernel/time/hrtimer.c
+++ b/kernel/time/hrtimer.c
@@ -780,7 +780,8 @@ static void hrtimer_switch_to_hres(void)
 		return;
 	}
 	base->hres_active =3D true;
-	hrtimer_resolution =3D HIGH_RES_NSEC;
+	if (hrtimer_resolution !=3D HIGH_RES_NSEC)
+		hrtimer_resolution =3D HIGH_RES_NSEC;
=20
 	tick_setup_sched_timer(true);
 	/* "Retrigger" the interrupt to get things going */
