Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78EBF3A1696;
	Mon, 12 Oct 2026 13:24:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791811497; cv=none; b=QpKHifugNZJOp2RNpAr+sGEvVoZ9/X4QaXK6viMZUltbdodc8fZOY2pX4B/ZXscLHr80TJPLYt+aMhPQv3aHX/nwxkaA85DhLZk4sbMSAVqDy2HXN5VvKhddYHtc0gpLCr92WMKwhjcFu1w39gLsr4x30ao2qdsNZihQ2LEe510=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791811497; c=relaxed/simple;
	bh=lser88NoPM6u4TML1iGiQPha9Aj8jdCXASY6hTjUe5U=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=hIR0k4mNp2tPWwuHoXTRj0aY868m0PTu27T5MxeXf5tMb3n4c8yX4ZLxr4jEnpX/BNXCSMRLsiJyq3OcqSdVGM4Tdan8tvDOAIfcOQ0tPOeeGOEbWMwvjAwhDRjWhEQ87tAYDTQhVUwgN0i8ohvYPYpBspwKYJgWHDwI+7FnCa8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Ycdruwc+; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=z34MTf2l; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Ycdruwc+";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="z34MTf2l"
Date: Mon, 12 Oct 2026 13:24:53 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1791811494;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WEptDMWKHO1bvGfPyOIb6Wl9EyWxR8b9DQWNNM5cVJk=;
	b=Ycdruwc+pXJBrWoyS22DfvtXnFrczScjsHT1xcejt6wvfv4e6acBv0coxKT/IPWCrzUFF4
	SC4kbPVhGxDTu6+JySYONJ/W2/5I+fkDVh/vpUks6mNtGV2fcX4uSHa6NjN/ghwIvyKXcP
	VTLQXhI2r3ZOZl/AyxYcc982KulxgtjmcNZRNFNmDmnw9VvHCWRY5/TFAQxocvFGfxgN+U
	l0sxy1svjGV6jtBUDfHESyPxzoz9QnnaP8AJmSgIMMJLzGruqN20UfOzCBVA6bM9yZsgxy
	68s75LP7nY5sZbFCt9txOLt33sl0jUieXq5Es/6zvpd7bydhtrdmUtKqHeQLYQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1791811494;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WEptDMWKHO1bvGfPyOIb6Wl9EyWxR8b9DQWNNM5cVJk=;
	b=z34MTf2lX1dSVstIcHr1n84Rs/yYw+my2tpQRGT8L6xjrxrI8RsV/0BIVdYpJ9quJ/vMrs
	OwWPJdNZ7xKrjxDQ==
From: "tip-bot2 for Boqun Feng" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: locking/core] irq: Add {over,under}flow detection for
 local_interrupt_{enable,disable}
Cc: Shrikanth Hegde <sshegde@linux.ibm.com>, Boqun Feng <boqun@kernel.org>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20261001082519.16195-3-boqun@kernel.org>
References: <20261001082519.16195-3-boqun@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <179181149317.1914040.7693380175210885412.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the locking/core branch of tip:

Commit-ID:     9e174422f6f15a1d88994a07067f66c920d2f947
Gitweb:        https://git.kernel.org/tip/9e174422f6f15a1d88994a07067f66c920d=
2f947
Author:        Boqun Feng <boqun@kernel.org>
AuthorDate:    Thu, 01 Oct 2026 10:25:16 +02:00
Committer:     Peter Zijlstra <peterz@infradead.org>
CommitterDate: Fri, 02 Oct 2026 11:47:13 +02:00

irq: Add {over,under}flow detection for local_interrupt_{enable,disable}

Currently there is no way to detect overflow and underflow inside the
HARDIRQ_DISABLE_MASK part of preempt_count. Add these detection guarded
by DEBUG_PREEMPT similar to the detection for PREEMPT_MASK
{over,under}flow.

Suggested-by: Shrikanth Hegde <sshegde@linux.ibm.com>
Signed-off-by: Boqun Feng <boqun@kernel.org>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Reviewed-by: Shrikanth Hegde <sshegde@linux.ibm.com>
Link: https://patch.msgid.link/20261001082519.16195-3-boqun@kernel.org
---
 include/linux/interrupt_rc.h | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/include/linux/interrupt_rc.h b/include/linux/interrupt_rc.h
index a9ed937..d385ab0 100644
--- a/include/linux/interrupt_rc.h
+++ b/include/linux/interrupt_rc.h
@@ -11,6 +11,7 @@
  * make it easier to include without hitting circular header dependencies.
  */
=20
+#include <linux/debug_locks.h>
 #include <linux/irqflags.h>
 #include <linux/preempt.h>
 #include <linux/processor.h>
@@ -65,6 +66,13 @@ static inline void local_interrupt_disable(void)
 	local_irq_save(flags);
 	new_count =3D hardirq_disable_enter();
=20
+	/* Is hardirq disable count overflow soon? */
+	if (IS_ENABLED(CONFIG_DEBUG_PREEMPT) &&
+	    DEBUG_LOCKS_WARN_ON(((new_count & HARDIRQ_DISABLE_MASK) +
+				 (10 << HARDIRQ_DISABLE_SHIFT)) >=3D
+				HARDIRQ_DISABLE_MASK))
+		return;
+
 	if ((new_count & HARDIRQ_DISABLE_MASK) =3D=3D HARDIRQ_DISABLE_OFFSET)
 		_local_interrupt_save_state(flags);
 }
@@ -73,6 +81,11 @@ static inline void local_interrupt_enable(void)
 {
 	int new_count;
=20
+	/* Unpaired local_interrupt_enable()? Warn and abort. */
+	if (IS_ENABLED(CONFIG_DEBUG_PREEMPT) &&
+	    DEBUG_LOCKS_WARN_ON((preempt_count() & HARDIRQ_DISABLE_MASK) =3D=3D 0))
+		return;
+
 	new_count =3D hardirq_disable_exit();
=20
 	if ((new_count & HARDIRQ_DISABLE_MASK) =3D=3D 0)
