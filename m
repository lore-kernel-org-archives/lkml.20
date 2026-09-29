Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7FB43D47AB;
	Tue, 29 Sep 2026 20:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790712357; cv=none; b=N3hZXSZWZ8X9Ft92xbq7ceDwZQ1G+RuGQKqtpl3pGMzCfGnqrWBtb3wpe4psXl5/0kYjcaKL8VNCQfRx5WczTstDKXuz/lx9LjXke55vwlPQp2spwC2jGsOlUk8mvefvTDzE719HhnQU/7t4YzuP521leSPV/FReHe/p+6rsEGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790712357; c=relaxed/simple;
	bh=76txiT7gsgLYN5PIjraS0aMXJEihHo4qp4GkikuEwvk=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=pwP7TK2/YS7tyFYTyz0cmf+Amhbt9MVtUfRrN31WMXPheUN43J8BP849Qs42T0vZjOs2FyHwJ2NJV6FDO8I7TMbKu6bmdr0F0kfZkcSFK1Ui2e8kOwYz6IVR0ThxsmkBZNmtsjiiWkrdMLauFl9l3JYSEfzetfmOI83MdDOUMfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=ICqfT9NP; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=xSob7U5V; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="ICqfT9NP";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="xSob7U5V"
Date: Tue, 29 Sep 2026 20:05:52 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1790712354;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=n9mxfwVdKW8OPa/3O5GNF/piZ/Y75+hQHymfSj9D4A8=;
	b=ICqfT9NPk0U6+aWNZHbblyIhVJXfmYjVe2LGQNtuNCvHNjvXQJ2Ru1HL+B1BY8I44ViQDF
	u9GC5wDPoKEiYH9iwCeJjC9O2CiCL0swy8uLgMnh/KRpLRYjuj516k6cMc3ffsiYHFYum3
	m8uhwy0LFXgxwOa9VdttbOf+yDroRqMYz+W+248+TBjT0KGOxjnt+DgammeB07OAziF6wA
	vfIwxvxedHtarElF4xqJuWZp3wcY90nxP2kVsvA/2IkiHk1Y+aqFjsGCLsQ2es4idziOOz
	1HSVuyuCZq5mu0FXpMnJK/RLc3gN9p2DbtG/XVmyMCjeLoVirKa38p4gXhZjJA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1790712354;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=n9mxfwVdKW8OPa/3O5GNF/piZ/Y75+hQHymfSj9D4A8=;
	b=xSob7U5ViGVyLhO9XvrZX+i0bBuDuuGKWHFWup56wHy24ixiXhsRZZaiWwKRbeHxrxLDY1
	v8BJmo71OkJ5TKCg==
From: "tip-bot2 for Eva Kurchatova" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: timers/core] selftests: timers: Count what tick is worth in the
 drift estimate
Cc: Eva Kurchatova <eva.kurchatova@virtuozzo.com>,
 Thomas Gleixner <tglx@kernel.org>, John Stultz <jstultz@google.com>,
 x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260917015237.2462954-1-eva.kurchatova@virtuozzo.com>
References: <20260917015237.2462954-1-eva.kurchatova@virtuozzo.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <179071235258.3910103.16630277251941771649.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the timers/core branch of tip:

Commit-ID:     a252cb93e1568d9f0754b9b2ac4829d896daa14e
Gitweb:        https://git.kernel.org/tip/a252cb93e1568d9f0754b9b2ac4829d896d=
aa14e
Author:        Eva Kurchatova <eva.kurchatova@virtuozzo.com>
AuthorDate:    Thu, 17 Sep 2026 04:52:31 +03:00
Committer:     Thomas Gleixner <tglx@kernel.org>
CommitterDate: Tue, 29 Sep 2026 22:03:31 +02:00

selftests: timers: Count what tick is worth in the drift estimate

raw_skew measures the drift between CLOCK_MONOTONIC and
CLOCK_MONOTONIC_RAW and compares it against the adjustment adjtimex()
reports, but for the latter it reads only tx.freq. The kernel takes
the tick value into the adjustment as well, worth a microsecond of the
tick length per unit, a hundred ppm each, and a time synchronisation
daemon does put the coarse part of its correction there.  Where it
does, the two numbers cannot meet:

  # Estimating clock drift: -51.724(est) 48.277(act)	[FAILED]

On the machine measured, chronyd held freq at 48.278 ppm with tick at
9999, so the correction really applied is -51.722 ppm, which is what
the clocks show. The skip for an externally adjusted clock does not
catch this: the clock is steady, the offset is zero, and neither freq
nor tick moves during the run.

Count what tick is worth alongside freq. On the same machine:

  # Estimating clock drift: -51.724(est) -51.723(act)	[OK]

Signed-off-by: Eva Kurchatova <eva.kurchatova@virtuozzo.com>
Signed-off-by: Thomas Gleixner <tglx@kernel.org>
Acked-by: John Stultz <jstultz@google.com>
Link: https://patch.msgid.link/20260917015237.2462954-1-eva.kurchatova@virtuo=
zzo.com
---
 tools/testing/selftests/timers/raw_skew.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/tools/testing/selftests/timers/raw_skew.c b/tools/testing/selfte=
sts/timers/raw_skew.c
index 0c87a8f..dfca3e2 100644
--- a/tools/testing/selftests/timers/raw_skew.c
+++ b/tools/testing/selftests/timers/raw_skew.c
@@ -91,6 +91,7 @@ int main(int argc, char **argv)
 {
 	struct timespec mon, raw, start, end;
 	long long delta1, delta2, interval, eppm, ppm;
+	long tick_nom;
 	struct timex tx1, tx2;
=20
 	setbuf(stdout, NULL);
@@ -129,6 +130,17 @@ int main(int argc, char **argv)
 	/* Avg the two actual freq samples adjtimex gave us */
 	ppm =3D (long long)(tx1.freq + tx2.freq) * 1000 / 2;
 	ppm =3D shift_right(ppm, 16);
+
+	/*
+	 * The tick value holds the coarse part of the adjustment, a
+	 * microsecond of the tick length per unit, and time sync daemons
+	 * do put part of their correction there. What it is worth has to
+	 * be counted in as well, or a clock disciplined through it looks
+	 * off by a hundred ppm a unit against what the two clocks show.
+	 */
+	tick_nom =3D USEC_PER_SEC / sysconf(_SC_CLK_TCK);
+	ppm +=3D (long long)(tx1.tick + tx2.tick - 2 * tick_nom) *
+	       (USEC_PER_SEC / tick_nom) * 1000 / 2;
 	printf(" %lld.%i(act)", ppm/1000, abs((int)(ppm%1000)));
=20
 	if (llabs(eppm - ppm) > 1000) {
