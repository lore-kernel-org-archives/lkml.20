Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792964850;
	b=2j6aqZp0asjPrHsV5nmpwaQmHCgWK9l8Qeov0QKpBB1zT8TCwZhG1APufat/lq7FhYG8
	 BzzaGiEcRUPmxerTeThDyqVmIzjap0zSAr0/g2iv46OYHFcWBdcMOVHccFEkoYyjgsLhM
	 hlAloHv3LbVNy1zHPWXLOhPg8YXw0ASeMmDWOFwpcU4OcdvUZrJMPAu4iYBL3/p48oNQE
	 GR/3ipAQcoKTfA7SQGGDxg0Dr/bCWESin0wZs9qQ/zQHtlHYjL+YVb6v8bCiO4hpblKAd
	 RAb4hhC/gRhgWWSGziB+JTtUvZPsR5A6vn6weiYBs6LTxAPKQIem+1jUVFMfB8tk4TA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792964850;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:Sender:Reply-to:
	 To:Subject:Cc:In-Reply-To:References:MIME-Version:Message-ID:Robot-ID:
	 Robot-Unsubscribe:Precedence:Content-Type:Content-Transfer-Encoding;
	bh=08vW3FTZYwDMNtsPfKQESDY4tlbZRGtg0oQTqytRxBw=;
	b=nbdp026JjIwjzco2N4jW2+7KsUYxo6JLsG9WeKtjJ9U8kcjloAs7zSAuVB4fDQs5oPWU
	 83gytU6UjuwmdUJhAxBkCXCm78FtjHtC55NpjMdpKxujCCJ3SeUYCjPuRbGi9u6EzdIlj
	 cOLmX3J2WBfv4ePB0Yc6u3QO1tRYJv1XDGUgvx7zgWOYq2jw8O1ybDvmDEZXxwBteleOk
	 yv9Mn68GK+vK/y/i8QnaUdc7PPxMOYNIESHeHCcli4YJyHvqi4pb0QaAg9dldWUK5d0MF
	 BFWZvPoNEpnhcotKSZSDO/NBEj2Ww7U8uUp+GnqfxaQMzON377cb1cBMu3hOKxhKnLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=Fx5DnOy5;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=5cPaGBGH;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87C63606A32C;
	Sun, 25 Oct 2026 21:47:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87C63606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=Fx5DnOy5;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=5cPaGBGH
Date: Sun, 25 Oct 2026 21:47:21 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1792964842;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=08vW3FTZYwDMNtsPfKQESDY4tlbZRGtg0oQTqytRxBw=;
	b=Fx5DnOy5AM1Nmz8ILObj7FPc7fqUy/Nqqzeh9wJWsXgHYo379GdqXNHxET2gs77KKQkFjO
	LKY5KMFfw3sIU9x3M5+LvokJBV2N2hZcrKetSDgNNPSKiJBeNtoDQEEME2toOHl6L5KALR
	9YpaujLcCIlrS9otZ8dUxpmpqSgLqPorvPtnHe0QFpxxqROZfTjjVpsz3dOFN3PcQ6RSZt
	XEI45+aJEWw3ySsvCY2AouMQpSwTGcKKML0ACxs9YLX07oEVeMMZBe75E6kk8sQUlcZLFQ
	tL/+LJ87+BHc3FJgEbq9rj4lI3u4oJJ2Wau4EIyb+N60YVP3X+rOfQ3C5Lt/6Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1792964842;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=08vW3FTZYwDMNtsPfKQESDY4tlbZRGtg0oQTqytRxBw=;
	b=5cPaGBGHnIDOWM9ucjySw9YaQfw3CmI6eTlX8lH2u4M/MAYVLEMPM7r/iT7teHQCj18K0E
	4tWckxZIqjT5jfCw==
From: "tip-bot2 for Hui Su" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: timers/urgent] hrtimer: Add cleanup class for on-stack timers
Cc: Hui Su <sh_def@163.com>, Thomas Gleixner <tglx@kernel.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To:
 <5f48c32490d19f51035e4209174f9cfe44472c71.1792083743.git.sh_def@163.com>
References:
 <5f48c32490d19f51035e4209174f9cfe44472c71.1792083743.git.sh_def@163.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Message-ID: <179296484122.4109677.11797171675044468355.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the timers/urgent branch of tip:

Commit-ID:     064bcd117e8a1a266bb92b840f63862999b7cb87
Gitweb:        https://git.kernel.org/tip/064bcd117e8a1a266bb92b840f63862999b=
7cb87
Author:        Hui Su <sh_def@163.com>
AuthorDate:    Fri, 16 Oct 2026 10:09:43 +09:00
Committer:     Thomas Gleixner <tglx@kernel.org>
CommitterDate: Sun, 25 Oct 2026 22:43:19 +01:00

hrtimer: Add cleanup class for on-stack timers

hrtimer_setup_on_stack() requires callers to destroy the timer before its
backing stack storage goes out of scope, but the setup interface does not
encode the required teardown pairing.

Add an hrtimer_on_stack cleanup class that pairs on-stack setup with
destroy_hrtimer_on_stack(). Document the existing setup API's lifetime
requirement.

The cleanup class provides debug-object teardown, not timer
cancellation. Callers must ensure that no hrtimer operation can still
access the timer before the scope ends; in particular, the timer must
no longer be queued and any running callback must have completed.

Signed-off-by: Hui Su <sh_def@163.com>
Signed-off-by: Thomas Gleixner <tglx@kernel.org>
Link: https://patch.msgid.link/5f48c32490d19f51035e4209174f9cfe44472c71.17920=
83743.git.sh_def@163.com
---
 include/linux/hrtimer.h | 24 ++++++++++++++++++++++++
 kernel/time/hrtimer.c   |  8 ++++++--
 2 files changed, 30 insertions(+), 2 deletions(-)

diff --git a/include/linux/hrtimer.h b/include/linux/hrtimer.h
index 29072d8..1877beb 100644
--- a/include/linux/hrtimer.h
+++ b/include/linux/hrtimer.h
@@ -12,6 +12,7 @@
 #ifndef _LINUX_HRTIMER_H
 #define _LINUX_HRTIMER_H
=20
+#include <linux/cleanup.h>
 #include <linux/hrtimer_rearm.h>
 #include <linux/hrtimer_types.h>
 #include <linux/init.h>
@@ -201,6 +202,29 @@ extern void destroy_hrtimer_on_stack(struct hrtimer *tim=
er);
 static inline void destroy_hrtimer_on_stack(struct hrtimer *timer) { }
 #endif
=20
+/*
+ * The cleanup class pairs on-stack setup with debug-object teardown. Callers
+ * using it must not call destroy_hrtimer_on_stack() manually.
+ *
+ * This class provides debug-object teardown, not timer cancellation. Callers
+ * must ensure that no hrtimer operation can still access the timer before
+ * leaving the scope. In particular, the timer must no longer be queued and
+ * any running callback must have completed.
+ *
+ * Callers using hrtimer_setup_on_stack() without this class retain
+ * responsibility for destroying the timer before its backing storage leaves
+ * scope.
+ */
+DEFINE_CLASS(hrtimer_on_stack, struct hrtimer *,
+	     destroy_hrtimer_on_stack(_T),
+	     ({
+		hrtimer_setup_on_stack(timer, function, clock_id, mode);
+		timer;
+	     }),
+	     struct hrtimer *timer,
+	     enum hrtimer_restart (*function)(struct hrtimer *),
+	     clockid_t clock_id, enum hrtimer_mode mode)
+
 /* Basic timer operations: */
 extern void hrtimer_start_range_ns(struct hrtimer *timer, ktime_t tim,
 				   u64 range_ns, const enum hrtimer_mode mode);
diff --git a/kernel/time/hrtimer.c b/kernel/time/hrtimer.c
index cbf1693..12e136d 100644
--- a/kernel/time/hrtimer.c
+++ b/kernel/time/hrtimer.c
@@ -1975,8 +1975,12 @@ EXPORT_SYMBOL_GPL(hrtimer_setup);
  * @clock_id:	The clock to be used
  * @mode:       The timer mode
  *
- * Similar to hrtimer_setup(), except that this one must be used if struct h=
rtimer is in stack
- * memory.
+ * Similar to hrtimer_setup(), except that this one must be used if struct
+ * hrtimer is in stack memory.
+ *
+ * Callers that do not use the hrtimer_on_stack cleanup class must call
+ * destroy_hrtimer_on_stack() before the stack storage goes out of scope. The
+ * cleanup class pairs setup and destruction automatically.
  */
 void hrtimer_setup_on_stack(struct hrtimer *timer,
 			    enum hrtimer_restart (*function)(struct hrtimer *),
