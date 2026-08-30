Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16DB419CD0A;
	Sun, 30 Aug 2026 18:31:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788114679; cv=none; b=gL/9h0U4f8054c3QjMhZK8L1FfjppiPBBcYVX9NrCTmhAthP+G9JW0syRjwV3ya6TpusDGdY4HOYvExlHrDQvLqrg0d2f3FMJQQME+vaObOseo4DUIm20QodJD8JTdqgz7vDXMIZ7MMExvQhRDrfhXSf8IR3r1fzUxPEcHWUYVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788114679; c=relaxed/simple;
	bh=o4+VJ9pmZEZo3BJ/Dd2FrUCOh1nUkEzpFpvPUgsy6co=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=IOtoLDGyyGY5QmlXumpXycuaF5hsx8q4RC7REWEVC49+nMA56mm5kc3mcx6XDBgHOF2hWL9LCc3wF6bP1+4jBMXwbRRDCElPf7hOo5HQX7ThCHLrRg8LKjdV2TYa85wK+5Un4x3eJ4A9DOxEgB+W899GDgeS4CjoYEOFSj3S+T8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=IbIRACdP; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=pkHOHHuF; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="IbIRACdP";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="pkHOHHuF"
Date: Sun, 30 Aug 2026 18:31:13 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788114675;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=INGuIDrn3IOrtH1P4qma+tRJp7/4H0ECXmPZ6p0CaHQ=;
	b=IbIRACdP9XZZu9XSOVSBYEtNUdGwq2JEuGltZApYPPOfaVBuxfApiwvDfHN1VcS2ZDziiX
	ryVhsSCPm6B5KRS/ERnMY0Fs/zdfI4GS1/bBVgNFLMAkPlLIORaD6dalM7YV48ZsIJwmXJ
	311kqambvfxNHAoLdDv6PBvxSpgNVC3YlU+6gPdCin6DnR4+wmvWgaXNm5VutLNuDi/bxY
	Y1t75Rz+aT1Np7PuloVVrfkn2YowdfVLFYckFQgelZ1E1eStPjaNyuX40CFaB4tiffFnlh
	iQi2fRiNEcGtMi3UmgDrf7UT4kigiZBlAYf5ESgLmoukanDzUi+tz7rNpy+ZAQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788114675;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=INGuIDrn3IOrtH1P4qma+tRJp7/4H0ECXmPZ6p0CaHQ=;
	b=pkHOHHuF8KIaUhI7MzJjNP1c82c3axpr/lQFQ+/KRKh+l0sytXjJ8rtkB8cY1sJSouHOjX
	KAuDehmWXDBwiuAw==
From: "tip-bot2 for Boqun Feng" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: locking/urgent] preempt: Remove hardirq_disable_count()
Cc: Boqun Feng <boqun@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
 x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260827194835.38968-1-boqun@kernel.org>
References: <20260827194835.38968-1-boqun@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <178811467400.3717435.15043865041996767341.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the locking/urgent branch of tip:

Commit-ID:     2af470916a208b576ac9975d221d9a378cf8ace9
Gitweb:        https://git.kernel.org/tip/2af470916a208b576ac9975d221d9a378cf=
8ace9
Author:        Boqun Feng <boqun@kernel.org>
AuthorDate:    Thu, 27 Aug 2026 12:48:35 -07:00
Committer:     Thomas Gleixner <tglx@kernel.org>
CommitterDate: Sun, 30 Aug 2026 20:25:21 +02:00

preempt: Remove hardirq_disable_count()

It turns out the previous usage of hardirq_disable_count() in
__irq_exit_rcu() would cause softirq pending issues. Without that usage,
hardirq_disable_count() doesn't need to exist, so remove it.

Also move hardirq_disable_enter/exit() into the Rust specific interrupt_rc
header.

[ tglx: Move the helpers over ]

Signed-off-by: Boqun Feng <boqun@kernel.org>
Signed-off-by: Thomas Gleixner <tglx@kernel.org>
Link: https://patch.msgid.link/20260827194835.38968-1-boqun@kernel.org
---
 include/linux/interrupt_rc.h | 3 +++
 include/linux/preempt.h      | 4 ----
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/include/linux/interrupt_rc.h b/include/linux/interrupt_rc.h
index e68e1be..a9ed937 100644
--- a/include/linux/interrupt_rc.h
+++ b/include/linux/interrupt_rc.h
@@ -52,6 +52,9 @@ extern void _local_interrupt_save_state(unsigned long flags=
);
 extern void _local_interrupt_enable(void);
 #endif /* !MODULE */
=20
+#define hardirq_disable_enter()	__preempt_count_add_return(HARDIRQ_DISABLE_O=
FFSET)
+#define hardirq_disable_exit()	__preempt_count_sub_return(HARDIRQ_DISABLE_OF=
FSET)
+
 static inline void local_interrupt_disable(void)
 {
 	int new_count;
diff --git a/include/linux/preempt.h b/include/linux/preempt.h
index 8299657..2e689de 100644
--- a/include/linux/preempt.h
+++ b/include/linux/preempt.h
@@ -168,10 +168,6 @@ static __always_inline unsigned char interrupt_context_l=
evel(void)
 #define in_softirq()		(softirq_count())
 #define in_interrupt()		(irq_count())
=20
-#define hardirq_disable_count()	((preempt_count() & HARDIRQ_DISABLE_MASK) >>=
 HARDIRQ_DISABLE_SHIFT)
-#define hardirq_disable_enter()	__preempt_count_add_return(HARDIRQ_DISABLE_O=
FFSET)
-#define hardirq_disable_exit()	__preempt_count_sub_return(HARDIRQ_DISABLE_OF=
FSET)
-
 /*
  * The preempt_count offset after preempt_disable();
  */
