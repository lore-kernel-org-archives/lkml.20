Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794218522;
	b=bIJirSM1xPYfor8lIAuf1DYh3qJ5TN206avOXgcwUYJS6+bSd+plLfTIkWyk8T+DGYo9
	 hAx/7xYXuLCWPLAN0NoKWf+684qqbiFRdXkQtgILxFZ4gZT/fKpmNtodaSp82I261kcwb
	 Kh+7cJoWm0ERupO0jA3BxXLY0iNK7Il3kh/T8gOv3B7GbczpZWb5lFxVNQCbpEtdWue4t
	 +zCw6qjNmSm4uFLp8kqo93I20ZmWuEaSfx8OnrNJDFtl0xlRFpIX1Q2uj3n6UozwG3FA4
	 LKdtUpzm+g4+rmae0p55NXzXMA4EYOmD3OQ42DoBND2DtItZutXpWi1q5pUH7HSpXeA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794218522;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:Sender:Reply-to:
	 To:Subject:Cc:In-Reply-To:References:MIME-Version:Message-ID:Robot-ID:
	 Robot-Unsubscribe:Precedence:Content-Type:Content-Transfer-Encoding;
	bh=A9MgUTR69neALAfm1vBjtSrmBbSK5ZtK12Oq1rbXM0Q=;
	b=nDF39lU+HzBAb/TAbMrNo4UZt5NaHP4yW1hVHfX468uuOAMbxAj5znzHrK/HUg4lQVjc
	 /2UhQJFgqMtuwUI3aAMdH0rovymWUgVQw+srdEthhLO+5wWcHZs/2zlFcsn7vCPiibDev
	 2O14BIqzh95GwDi31YGTf/zoW7HS8iMmjCA/poII5w8mqm9sQRzP/ftJtPgPXqFDxfYE2
	 7WKvPxLfKrtz0gNO7VzYoTp4mSgpZgdbJWxDeDYrW7Vmx0sGYmyTEB353om+f7oR2kyN8
	 plMKQQUPbLj2AeBcGc07EjT9HIsTphhPA1umq0xs56NvID4mOgShtZimHL1oVekU6qw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=1WI+8i3+;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b="UMl/9cSq";
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65DED606A334;
	Mon,  9 Nov 2026 10:02:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 65DED606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=1WI+8i3+;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=UMl/9cSq
Date: Mon, 09 Nov 2026 10:01:57 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1794218519;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=A9MgUTR69neALAfm1vBjtSrmBbSK5ZtK12Oq1rbXM0Q=;
	b=1WI+8i3+Eo5srdkpVAkVPfoE9FCzCCTwqfxJva66ldRhQRQCV7cl/M9VLVn7iYipu/3rHg
	6jax0NCQsOlblOr2hj9Mcqkiw6qS0kM8TQbleUW53xNV1dnMauNuZZPm3F1wcR37KBD6kg
	wHPCHIu544FdsFaMIyEqEg0lttHCy0IkI/n0Amot8yJpxiZyxwtovSOp9ElgDuQKYdG3WS
	VvzFYCdgZQBU/6Up95fCME/z9MbjMVd9V61s8xBm9ZCg/j3BPzo6/ouMulUM3yQQHeyhzA
	+MQH6PEG3xWKWpbSvZP6srkhvGmND1s2UBy7BhOJdhtrWebH/ELcFFfLpVxP+g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1794218519;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=A9MgUTR69neALAfm1vBjtSrmBbSK5ZtK12Oq1rbXM0Q=;
	b=UMl/9cSqjbor4VHtCNK5n5vi/saxwXr//iwFAgrP8V84FVg8URywUfXyg/uLvPKZ/GZ+TH
	WHkWlX42wJeGlxCQ==
From: "tip-bot2 for Mete Durlu" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: sched/core] sched/config: Decouple PREFERRED_CPU from PARAVIRT
Cc: Peter Zijlstra <peterz@infradead.org>, Mete Durlu <meted@linux.ibm.com>,
 Ingo Molnar <mingo@kernel.org>, Yury Norov <ynorov@nvidia.com>,
 Shrikanth Hegde <sshegde@linux.ibm.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20261106-preferredcpu-v1-1-3f0ca4944f8b@linux.ibm.com>
References: <20261106-preferredcpu-v1-1-3f0ca4944f8b@linux.ibm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Message-ID: <179421851735.2093942.8439774144280940809.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the sched/core branch of tip:

Commit-ID:     08503034111a68383774e3f0a47eabb59e21aac7
Gitweb:        https://git.kernel.org/tip/08503034111a68383774e3f0a47eabb59e2=
1aac7
Author:        Mete Durlu <meted@linux.ibm.com>
AuthorDate:    Fri, 06 Nov 2026 13:35:12 +01:00
Committer:     Ingo Molnar <mingo@kernel.org>
CommitterDate: Mon, 09 Nov 2026 10:58:14 +01:00

sched/config: Decouple PREFERRED_CPU from PARAVIRT

PREFERRED_CPU mechanism does not rely on any feature introduced by PARAVIRT
but PREFERRED_CPU still gated behind PARAVIRT. Any architecture that
would like to enable PREFERRED_CPU mechanism has to also enable PARAVIRT
and bring additional changes to accommodate PARAVIRT's requirements.

As an example, s390 doesn't enable PARAVIRT config for hardware virtualized
Logical Partitions (LPAR). The steal time is accounted for the LPARs via
architecture's own steal time accounting mechanism instead of the common
steal time infrastructure PARAVIRT supplies.
For s390 to enable PREFERRED_CPU, PRAVIRT and its required stubs are
just unncessary.

Based on the discussion between Yury Norov and Peter Zijlstra over
Yury's original patch [1]:

Introduce a new config flag HAVE_CPUTIME_STEAL to indicate that the
architecture has steal time measurement capabilities already implemented
and to signal that PARAVIRT is not required.
Remove PARAVIRT gating from CPU_PREFERRED and add HAVE_CPUTIME_STEAL
instead.
Select HAVE_CPUTIME_STEAL for s390 and powerpc-pseries configs.

[1] https://lore.kernel.org/all/20261101192203.6979-2-ynorov@nvidia.com/

Suggested-by: Peter Zijlstra <peterz@infradead.org>
Signed-off-by: Mete Durlu <meted@linux.ibm.com>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Signed-off-by: Ingo Molnar <mingo@kernel.org>
Reviewed-by: Yury Norov <ynorov@nvidia.com>
Reviewed-by: Shrikanth Hegde <sshegde@linux.ibm.com>
Link: https://patch.msgid.link/20261106-preferredcpu-v1-1-3f0ca4944f8b@linux.=
ibm.com
---
 arch/Kconfig                           | 8 ++++++++
 arch/powerpc/platforms/pseries/Kconfig | 1 +
 arch/s390/Kconfig                      | 1 +
 drivers/virt/Kconfig                   | 2 +-
 kernel/Kconfig.preempt                 | 2 +-
 5 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/arch/Kconfig b/arch/Kconfig
index 1163736..01b8251 100644
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -1080,6 +1080,14 @@ config HAVE_IRQ_TIME_ACCOUNTING
 config HAVE_PV_STEAL_CLOCK_GEN
 	bool
=20
+config HAVE_CPUTIME_STEAL
+	bool
+	default y if HAVE_PV_STEAL_CLOCK_GEN
+	help
+	  Selected directly by config PARAVIRT through HAVE_PV_STEAL_CLOCK_GEN
+	  or directly by architectures that have their own CPUTIME_STEAL
+	  accounting.
+
 config HAVE_MOVE_PUD
 	bool
 	help
diff --git a/arch/powerpc/platforms/pseries/Kconfig b/arch/powerpc/platforms/=
pseries/Kconfig
index 7d125e2..3c49baf 100644
--- a/arch/powerpc/platforms/pseries/Kconfig
+++ b/arch/powerpc/platforms/pseries/Kconfig
@@ -41,6 +41,7 @@ config PPC_SPLPAR
 	depends on PPC_PSERIES
 	select PARAVIRT_SPINLOCKS if PPC_QUEUED_SPINLOCKS
 	select PARAVIRT_TIME_ACCOUNTING if VIRT_CPU_ACCOUNTING_GEN
+	select HAVE_CPUTIME_STEAL
 	default y
 	help
 	  Enabling this option will make the kernel run more efficiently
diff --git a/arch/s390/Kconfig b/arch/s390/Kconfig
index 7138d92..39379e7 100644
--- a/arch/s390/Kconfig
+++ b/arch/s390/Kconfig
@@ -204,6 +204,7 @@ config S390
 	select HAVE_BUILDTIME_MCOUNT_SORT
 	select HAVE_CMPXCHG_DOUBLE
 	select HAVE_CMPXCHG_LOCAL
+	select HAVE_CPUTIME_STEAL
 	select HAVE_DEBUG_KMEMLEAK
 	select HAVE_DMA_CONTIGUOUS
 	select HAVE_DYNAMIC_FTRACE
diff --git a/drivers/virt/Kconfig b/drivers/virt/Kconfig
index eeb84e5..a3721d3 100644
--- a/drivers/virt/Kconfig
+++ b/drivers/virt/Kconfig
@@ -43,7 +43,7 @@ config FSL_HV_MANAGER
=20
 config STEAL_GOVERNOR
 	tristate "Dynamic vCPU management based on steal time"
-	depends on PARAVIRT && SMP
+	depends on SMP && HAVE_CPUTIME_STEAL
 	select PREFERRED_CPU
 	default m
 	help
diff --git a/kernel/Kconfig.preempt b/kernel/Kconfig.preempt
index edc067a..ffd2cb2 100644
--- a/kernel/Kconfig.preempt
+++ b/kernel/Kconfig.preempt
@@ -197,4 +197,4 @@ config SCHED_CLASS_EXT
=20
 config PREFERRED_CPU
 	bool
-	depends on SMP && PARAVIRT
+	depends on SMP && HAVE_CPUTIME_STEAL
