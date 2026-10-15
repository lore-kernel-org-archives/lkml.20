Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A14654CF6C;
	Thu, 15 Oct 2026 15:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792078700; cv=none; b=ZdafR1f2VHsoOqnqNyqSPX0pSVDpGuApxmMkuEjOvv0rpe1xBHhVUGHKjw2949CKY4ai8TZPX4TA3ITCj9xuypB5NBHo20G9asqjiJbGO7HQB9lWuf/ehFeJwZjMPo8mnnzRRJB4Y3USqkhlMehTXI0mhaAo/nxpTZkVj2DDpEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792078700; c=relaxed/simple;
	bh=LTLU5uKqiAPtlWM86sDQPwXvk3lTBG+SR65IEjTlG3U=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=iZ5vmEwWi2mRO6UOTDTMHY6j/zhHumCyWylHDMsz7BT6pecIAg44+KAXTMF8SyKleol9UDbERnvJgJ3QIdiQyDXTITbXKZLXKf0X/NOgwGUNwak1o4V5cJMSGkfFb4YtkxhGu6kBUwk2YRLszF/sro6ui0IuglohLHStpZwazdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=W4IgB+6z; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=WeIk9HNf; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="W4IgB+6z";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="WeIk9HNf"
Date: Thu, 15 Oct 2026 15:37:52 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1792078673;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=s7fPN63/iS3hVj55FMdSHn0WxriPf5r0TCcotSQ/vhw=;
	b=W4IgB+6z+UKZo3QL+ttqlCFdefQMJmFpoO8DV+HO57sWJkkc5ih2BMluqIamdlVKphnO10
	u6fNRF0zZjzgbl1zzXd7iYETSoC2IqAx+dGVLaeF0WAmqvTBtj/3S6AIMwiNfE2LzZ2IpY
	ZDK3+8GTySZGV/LXRBF8bbmJjB7PhQr4HgUrkPLfJJp9xga8AgmksejCW+Y8D2/O82opa+
	r8EPW2I3LkhATK26G/SN3c9oEBoEbqzu08BkeB8iJkrTwHh9ssPOs8d+RkkP802dFD5E+O
	70kb6heQ4/sBctyE94KVWlHdK0wf3g6Ap3+MSwzuEbadlzEiSOfTbqCb6TkooQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1792078673;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=s7fPN63/iS3hVj55FMdSHn0WxriPf5r0TCcotSQ/vhw=;
	b=WeIk9HNfsqwy3qzzxT10p9d9ZuBYgRBEG39HwJpaWo4npSFW+tx73Le0V/TM4wVZO+4Er2
	iA7SHDPZhMdgENCw==
From: tip-bot2 for Thomas =?utf-8?q?Wei=C3=9Fschuh?= <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: timers/vdso] vdso/getrandom: Define fallback
 __arch_get_vdso_u_rng_data() in getrandom.c
Cc: thomas.weissschuh@linutronix.de, Thomas Gleixner <tglx@kernel.org>,
 x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To:
 <20260909-vdso-asm-generic-vsyscall-h-v1-3-63ae856cc659@linutronix.de>
References:
 <20260909-vdso-asm-generic-vsyscall-h-v1-3-63ae856cc659@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <179207867209.2666988.3970474075745936339.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the timers/vdso branch of tip:

Commit-ID:     ca0da001d3cfe536ec2cacccd36ce70364cff8c8
Gitweb:        https://git.kernel.org/tip/ca0da001d3cfe536ec2cacccd36ce70364c=
ff8c8
Author:        Thomas Wei=C3=9Fschuh <thomas.weissschuh@linutronix.de>
AuthorDate:    Wed, 09 Sep 2026 10:51:16 +02:00
Committer:     Thomas Gleixner <tglx@kernel.org>
CommitterDate: Thu, 15 Oct 2026 17:33:19 +02:00

vdso/getrandom: Define fallback __arch_get_vdso_u_rng_data() in getrandom.c

__arch_get_vdso_u_rng_data() is only used in getrandom.c. vsyscall.h
has become a dumping ground for different kinds of fallbacks.

Move the fallback function definition into getrandom.c,
similar to other fallbacks.

Signed-off-by: Thomas Wei=C3=9Fschuh <thomas.weissschuh@linutronix.de>
Signed-off-by: Thomas Gleixner <tglx@kernel.org>
Link: https://patch.msgid.link/20260909-vdso-asm-generic-vsyscall-h-v1-3-63ae=
856cc659@linutronix.de
---
 include/asm-generic/vdso/vsyscall.h | 7 -------
 lib/vdso/getrandom.c                | 7 +++++++
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/include/asm-generic/vdso/vsyscall.h b/include/asm-generic/vdso/v=
syscall.h
index fe12fb1..cdf7b39 100644
--- a/include/asm-generic/vdso/vsyscall.h
+++ b/include/asm-generic/vdso/vsyscall.h
@@ -4,13 +4,6 @@
=20
 #ifndef __ASSEMBLER__
=20
-#ifndef __arch_get_vdso_u_rng_data
-static __always_inline const struct vdso_rng_data *__arch_get_vdso_u_rng_dat=
a(void)
-{
-	return &vdso_u_rng_data;
-}
-#endif
-
 #ifndef __arch_update_vdso_clock
 static __always_inline void __arch_update_vdso_clock(struct vdso_clock *vc)
 {
diff --git a/lib/vdso/getrandom.c b/lib/vdso/getrandom.c
index 2851afa..6ff4654 100644
--- a/lib/vdso/getrandom.c
+++ b/lib/vdso/getrandom.c
@@ -19,6 +19,13 @@
 /* Bring in default accessors */
 #include <vdso/vsyscall.h>
=20
+#ifndef __arch_get_vdso_u_rng_data
+static __always_inline const struct vdso_rng_data *__arch_get_vdso_u_rng_dat=
a(void)
+{
+	return &vdso_u_rng_data;
+}
+#endif
+
 #define MEMCPY_AND_ZERO_SRC(type, dst, src, len) do {				\
 	while (len >=3D sizeof(type)) {						\
 		__put_unaligned_t(type, __get_unaligned_t(type, src), dst);	\
