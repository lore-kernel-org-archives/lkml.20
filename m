Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794216519;
	b=kOV6wHavdZ9KCf4vs45tQBjovWgzh7MS9TEYPlN4vHMaFp1g1wxnooucYwLVfiZb5DUl
	 x24suj9R1GrdzR+BI+kAibZVKZrRbJp36U3QdVS8p2jYbsNtT5BU/6o9Lb/xTH4+WRzj7
	 oSiikw2Xr+4VEO19OlxGWMmVcfBhXGSL5hKuRM4FCF9DjYMr/3BIBiCYUQOaA74JmMR/+
	 nM/AdCv9x+og4HQmMm5W4Lj5fns+kl0BNRI79xBMUoKZonKMy3c7QGL2TZoDCidIe+0QK
	 vxXqMZzLDD4BUASlYFukHOVxYzlD7G5A2HACNv4f3Kclsh1q4MsspcwI1nblP2vEHyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794216519;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:Sender:Reply-to:
	 To:Subject:Cc:In-Reply-To:References:MIME-Version:Message-ID:Robot-ID:
	 Robot-Unsubscribe:Precedence:Content-Type:Content-Transfer-Encoding;
	bh=RN3/+osg9j511+a7BzmnVjx4AneAfNDpXnY4y5fW18M=;
	b=QjkiHf81R+N2tuxDA2KE2sVS8SEuG0qkzBzgkW7XwRWmDuLdKQek+Lm/WYSZKhIQ7QwY
	 qVOLCwYM06uGBmXPQIHQlDO2TJxargfgv97YSGGX+ZSG7GiDgA+ePtWqf5Fm9Aer4yfnD
	 DzR4pXDVNnX3UDNS8Qb0Odvcx194jeecDFz3t33IsNgsbB9HxbTmVUUsE2g66oqDGRivu
	 FkkeYTUwbo7/1vrmpvw7vHJhZcWJy5aLF+jPMIS05H+D7/CskZ13Sh6NrKoXUOPIuqH0S
	 8X+IJ8QnyYTlpcuzN3PLQHSSaAsBcKxbZD5ojKxyuoCGll7g66U2iZPMoYii1Xo4n0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=ZOK6qQi8;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=AvktAp0z;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C032606A321;
	Mon,  9 Nov 2026 09:28:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C032606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=ZOK6qQi8;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=AvktAp0z
Date: Mon, 09 Nov 2026 09:28:34 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1794216516;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RN3/+osg9j511+a7BzmnVjx4AneAfNDpXnY4y5fW18M=;
	b=ZOK6qQi8KkbQUpfjBkf+I48AgfnkG9O822ayhdHKa31RXDlRe12BxB3zabKOxs8hW2dH2O
	ozGHQfjqzfpW+zJOmXVEMCnCWRYWgy5ZphbPhMvPKUvfACeKUxCmp2v+HDp9pYrVQCowAe
	+ERojE5UylhtYH4KnguBjyjIrqoloa627kFHtorccwc+9+OeYXECAe8B8DN6up30sQjU+4
	vlHbTjMBFehp1hKXDWHzlA+FWIltgMHRjX11IEXzHgKBNL5ja0p5MNHSoGTNkn3Hh23Z8h
	U5DoUfK5lXUR1JD89Uv1DScs7K6oKphzDYZqvMoi/lblpmSwYWLHjUPLexsDOQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1794216516;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RN3/+osg9j511+a7BzmnVjx4AneAfNDpXnY4y5fW18M=;
	b=AvktAp0zc0c5yuFVuwqHDml1wREujgqh/W18h/hBwOG5dBwgcHmjrfWL74mrrnJ2wgvDwL
	eCOWhQsl5ycWnlBg==
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
Message-ID: <179421651471.2093942.8651046580521477211.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the sched/core branch of tip:

Commit-ID:     56d3bd3bbc663dc3f8fa09577c76eb0205d65177
Gitweb:        https://git.kernel.org/tip/56d3bd3bbc663dc3f8fa09577c76eb0205d=
65177
Author:        Mete Durlu <meted@linux.ibm.com>
AuthorDate:    Fri, 06 Nov 2026 13:35:12 +01:00
Committer:     Ingo Molnar <mingo@kernel.org>
CommitterDate: Mon, 09 Nov 2026 10:24:06 +01:00

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
