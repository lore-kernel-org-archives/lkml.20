Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00797495AE7;
	Wed, 16 Sep 2026 16:48:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789577299; cv=none; b=JwxrH4IqtsP4hYrNOzhc4XvLgrto3sg6dLV4PosfCX/FMJ/QBVc8hRNY/hsfcBzYUFXbhBt1noENxIexTFY+nhxkr5JY65tOgvWvUYLrSrxqVz22sz3In8LylanyWF+2laMkEc/My0Z+uyhdtpY9gMbe06UzA8PR7xsWyH0Vpdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789577299; c=relaxed/simple;
	bh=fbrRcTZbXgmvOjg4UIbmwCRico6R2Hnd3hit4JrIgR0=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=bN6v+N9wffDq7ypII408jrv2XTmkTsUb07Gz/EiU+Ex6KSb5KN47jJU1xYZJRWd4k3NE0FTjXWZVHjBmWVdmIgV5fxpufX5AJelJJ/ocbHJfYBGTsXFhOFAFTv9fekrJ7UjG/VNqLeqXMLTrIqywFhl06TzmW/vG3GkNFCPfqsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=QwMye4hM; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=FHp6BcuQ; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="QwMye4hM";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="FHp6BcuQ"
Date: Wed, 16 Sep 2026 16:48:06 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1789577288;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=o/BLAjeOuENPAnAU6MKhsbUSYukZyIpteBXF7Pn6rfk=;
	b=QwMye4hMe7qnEORQjOmYxwc2jh1drz3bbn4+rx/VZMcVsu19Qz3BSgCdytng96vYilFeJR
	2LZIMtxKUpRWely17FsDtr885CuREcFwUs+7s6MfNyEZrAvIBMGAH05r8w9qVX5/mcro6F
	eiV1QyuO55ltYoO6E5ec0zt4p/jGo8zvamqDIt3ExAVowegyp0E6yDlhzlbUBNLjGqbPdj
	LyKPg0IXzPcguO2PRU5RwR1xr9KFWu9j9t/DOHLwxiIy40lhc21TQGrSUSo4yesaVRZEzj
	+tELu8Pgz9vUmjP3OL3utDQiNK39CYhqHTVdfGC6CE+gfABsft2ls4U7UIw0fg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1789577288;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=o/BLAjeOuENPAnAU6MKhsbUSYukZyIpteBXF7Pn6rfk=;
	b=FHp6BcuQKqsQ2dyN2UqLzjcVQdU77wm+R+nWuK794TDXFlwX/NTl7WLpQqV3H/F97ttRzz
	Ya1dhIcHE20QGtBg==
From: "tip-bot2 for Thomas Gleixner" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject:
 [tip: timers/core] posix-cpu-timers: Move inlines out of public header
Cc: Thomas Gleixner <tglx@kernel.org>, Kijo Park <red993688@gmail.com>,
 Frederic Weisbecker <frederic@kernel.org>, Oleg Nesterov <oleg@redhat.com>,
 x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260911090541.785749315@kernel.org>
References: <20260911090541.785749315@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <178957728685.1720534.13460021517779398454.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the timers/core branch of tip:

Commit-ID:     8e9ed3b66f409e324dade4a07fc08dae43160ec6
Gitweb:        https://git.kernel.org/tip/8e9ed3b66f409e324dade4a07fc08dae431=
60ec6
Author:        Thomas Gleixner <tglx@kernel.org>
AuthorDate:    Fri, 11 Sep 2026 11:09:31 +02:00
Committer:     Thomas Gleixner <tglx@kernel.org>
CommitterDate: Wed, 16 Sep 2026 18:44:03 +02:00

posix-cpu-timers: Move inlines out of public header

They are only used in the POSIX CPU timer code. No point in exposing them
globally and parsing them for nothing.

Signed-off-by: Thomas Gleixner <tglx@kernel.org>
Tested-by: Kijo Park <red993688@gmail.com>
Reviewed-by: Frederic Weisbecker <frederic@kernel.org>
Reviewed-by: Oleg Nesterov <oleg@redhat.com>
Link: https://patch.msgid.link/20260911090541.785749315@kernel.org
---
 include/linux/posix-timers.h   | 32 --------------------------------
 kernel/time/posix-cpu-timers.c | 32 ++++++++++++++++++++++++++++++++
 2 files changed, 32 insertions(+), 32 deletions(-)

diff --git a/include/linux/posix-timers.h b/include/linux/posix-timers.h
index 3050f9e..0033a06 100644
--- a/include/linux/posix-timers.h
+++ b/include/linux/posix-timers.h
@@ -66,38 +66,6 @@ struct cpu_timer {
 	struct task_struct __rcu	*handling;
 };
=20
-static inline bool cpu_timer_enqueue(struct timerqueue_head *head,
-				     struct cpu_timer *ctmr)
-{
-	ctmr->head =3D head;
-	return timerqueue_add(head, &ctmr->node);
-}
-
-static inline bool cpu_timer_queued(struct cpu_timer *ctmr)
-{
-	return !!ctmr->head;
-}
-
-static inline bool cpu_timer_dequeue(struct cpu_timer *ctmr)
-{
-	if (cpu_timer_queued(ctmr)) {
-		timerqueue_del(ctmr->head, &ctmr->node);
-		ctmr->head =3D NULL;
-		return true;
-	}
-	return false;
-}
-
-static inline u64 cpu_timer_getexpires(struct cpu_timer *ctmr)
-{
-	return ctmr->node.expires;
-}
-
-static inline void cpu_timer_setexpires(struct cpu_timer *ctmr, u64 exp)
-{
-	ctmr->node.expires =3D exp;
-}
-
 static inline void posix_cputimers_init(struct posix_cputimers *pct)
 {
 	memset(pct, 0, sizeof(*pct));
diff --git a/kernel/time/posix-cpu-timers.c b/kernel/time/posix-cpu-timers.c
index d73d31c..e635834 100644
--- a/kernel/time/posix-cpu-timers.c
+++ b/kernel/time/posix-cpu-timers.c
@@ -438,6 +438,38 @@ static void trigger_base_recalc_expires(struct k_itimer =
*timer,
 	base->nextevt =3D 0;
 }
=20
+static inline bool cpu_timer_enqueue(struct timerqueue_head *head,
+				     struct cpu_timer *ctmr)
+{
+	ctmr->head =3D head;
+	return timerqueue_add(head, &ctmr->node);
+}
+
+static inline bool cpu_timer_queued(struct cpu_timer *ctmr)
+{
+	return !!ctmr->head;
+}
+
+static inline bool cpu_timer_dequeue(struct cpu_timer *ctmr)
+{
+	if (cpu_timer_queued(ctmr)) {
+		timerqueue_del(ctmr->head, &ctmr->node);
+		ctmr->head =3D NULL;
+		return true;
+	}
+	return false;
+}
+
+static inline u64 cpu_timer_getexpires(struct cpu_timer *ctmr)
+{
+	return ctmr->node.expires;
+}
+
+static inline void cpu_timer_setexpires(struct cpu_timer *ctmr, u64 exp)
+{
+	ctmr->node.expires =3D exp;
+}
+
 /*
  * Dequeue the timer and reset the base if it was its earliest expiration.
  * It makes sure the next tick recalculates the base next expiration so we
