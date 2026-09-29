Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A12E2ECD32;
	Tue, 29 Sep 2026 19:16:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790709412; cv=none; b=ssjl9cFb/OBRSrgGujiQh63DIMraKc+FOO6D7GkbZEuRSROwDAD0H68uLygDQBtYd9zRdisGDzj8+fYmrTUFzYoJ0WyiQlNf8tHI4SFtvEhNLy0TBtXCvkSkRZ+vV4Kb4bcfNoZS2V3z2YlBlTgcFAkrsFlky2U9e6KxKs2qwUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790709412; c=relaxed/simple;
	bh=9x4QkvDA9RUOHApROQ3+nJmNbFpTckZDBVT9Srq9lHU=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=BF0lbllXA+Z7VOFrhPUzlO99qoNB2lbqqljQSCpDAW8xpaHxQsljIC/MDYRme1I6WlC+6gx18FHgXNiOdTdsxs6vXj+xSSGVI4jNyNd59VtJUEFCqqLHmcegTaD0ppU0xUBqpiLrchXEcNzZ/1TIbfiZfhqiYIg9tOahAsO15kE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=LrHs3dNb; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=wZru9dzQ; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="LrHs3dNb";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="wZru9dzQ"
Date: Tue, 29 Sep 2026 19:16:46 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1790709407;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PcBM0nXgHg9E31+vamTS3D4T/qM4JWT3rSTYYPaYVD8=;
	b=LrHs3dNbzTnbrHodxB3H3Bhwsa4z9RSIAZKRUoIB9qD1QUCutAnT8TeADrTGqMlZIHmeId
	GGEPXwekmrq6nuTZ6pZrOH/IjMOk3A4lw8wiiKBy+V5bdXmfYUu/t1Ean8s8mh6Ngx9sQk
	OkCFQxZb7rmDOd3RiAE1LH0PDxh0sUBhpFtHyTlYX1qyFZfqcBR/p6lWwAj6Az225WOoRr
	h4YYRaSr8s5cEtHMn+UlFZ/BTWixLocc/u0TUzEuNxHA/19b/2JJmZCpgtKQiXDbNzSVpM
	eUGoCsVTe8zrqjpYW0hWJhkTrlCBrilMJ5zxgf6rKZzxaDFoQXj5np1oEXAZiw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1790709407;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PcBM0nXgHg9E31+vamTS3D4T/qM4JWT3rSTYYPaYVD8=;
	b=wZru9dzQr0KGVgH2CKInwaHVyTJcwRpKQ6m2Y8x+5Rq1pR1VwbAdEuXEGnlZfOzllFdfao
	VdIdptt1k8OzYPAw==
From: tip-bot2 for Thomas =?utf-8?q?Wei=C3=9Fschuh?= <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: timers/core] timekeeping: Use READ_ONCE/WRITE_ONCE() for
 ktime_sec to prevent tearing
Cc: thomas.weissschuh@linutronix.de, Thomas Gleixner <tglx@kernel.org>,
 John Stultz <jstultz@google.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20260903-timekeeping-ktime_sec-v1-1-b33017536aa9@linutronix.de>
References: <20260903-timekeeping-ktime_sec-v1-1-b33017536aa9@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <179070940608.3910103.1078374896040856655.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the timers/core branch of tip:

Commit-ID:     bc5b66c300b87544e6861b8dff8c45958603cba5
Gitweb:        https://git.kernel.org/tip/bc5b66c300b87544e6861b8dff8c4595860=
3cba5
Author:        Thomas Wei=C3=9Fschuh <thomas.weissschuh@linutronix.de>
AuthorDate:    Thu, 03 Sep 2026 09:11:47 +02:00
Committer:     Thomas Gleixner <tglx@kernel.org>
CommitterDate: Tue, 29 Sep 2026 21:13:26 +02:00

timekeeping: Use READ_ONCE/WRITE_ONCE() for ktime_sec to prevent tearing

The timekeeper update path uses a bulk memcpy() to synchronize the
timekeeper structure, which is not guaranteed to be atomic. This allows for
torn reads in ktime_get_seconds() which bypasses the sequence counter
protection for performance.

To prevent reading a torn ktime_sec value, enforce atomic-like
access by using WRITE_ONCE() for the critical field before the bulk
memcpy() in timekeeping_update_from_shadow(). Correspondingly, use
READ_ONCE() in ktime_get_seconds() to ensure a fresh, consistent load
from memory.

The same was done for xtime_sec and ktime_get_real_seconds() in commit
d7fc133bf91f ("timekeeping: Use READ_ONCE/WRITE_ONCE() for xtime_sec to
prevent tearing").

Signed-off-by: Thomas Wei=C3=9Fschuh (Schneider Electric) <thomas.weissschuh@=
linutronix.de>
Signed-off-by: Thomas Gleixner <tglx@kernel.org>
Acked-by: John Stultz <jstultz@google.com>
Link: https://patch.msgid.link/20260903-timekeeping-ktime_sec-v1-1-b33017536a=
a9@linutronix.de
---
 kernel/time/timekeeping.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/kernel/time/timekeeping.c b/kernel/time/timekeeping.c
index ea2e6e5..d54c4d3 100644
--- a/kernel/time/timekeeping.c
+++ b/kernel/time/timekeeping.c
@@ -861,8 +861,10 @@ static void timekeeping_update_from_shadow(struct tk_dat=
a *tkd, unsigned int act
 	 *
 	 * Write xtime_sec first so that even if the memcpy() tears the store
 	 * data integrity is provided for ktime_get_real_seconds().
+	 * The same goes for ktime_sec and ktime_get_seconds().
 	 */
 	WRITE_ONCE(tkd->timekeeper.xtime_sec, tk->xtime_sec);
+	WRITE_ONCE(tkd->timekeeper.ktime_sec, tk->ktime_sec);
 	memcpy(&tkd->timekeeper, tk, sizeof(*tk));
 	write_seqcount_end(&tkd->seq);
 }
@@ -1169,7 +1171,7 @@ time64_t ktime_get_seconds(void)
 	struct timekeeper *tk =3D &tk_core.timekeeper;
=20
 	WARN_ON(timekeeping_suspended);
-	return tk->ktime_sec;
+	return READ_ONCE(tk->ktime_sec);
 }
 EXPORT_SYMBOL_GPL(ktime_get_seconds);
=20
