Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A95EB3E2ABA;
	Thu, 15 Oct 2026 15:37:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792078684; cv=none; b=bD/1j9woVmh38NMam5luH3q+7CS5ugPtfatWXGQOYVRUjnrW5zcVhI8SmweEctjdi3s9U18aMIaXPNovWfCs9+0NHe4LhV6rAw9gWQCYKLQYltw/p6ODx48HTGEWnLEOv9mf/c141DO+txcrthvYqZjWoC2PNfgPQxwYjZJTEPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792078684; c=relaxed/simple;
	bh=RZH+7al5izmKUIp8fnyTQ1WId79ZDM6E7P2iKh3EV3Y=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=TIuElOy7mc/5ATerYrgNRG3rj3OzO5Rn2LY/ioGio4QAoBHrmRYAitRoF5cDHafddydkgi4rah359uKqEK2rXBpYloM3dZukeavuKPhwgHa1MYJfU8MP4HC8dr8Ul4YjC+FjWFFUoSzIGoSa+bzGyFN+kC1QBgd+ukUDC19a3cE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=0Ty2WXcu; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=GMHs2KnN; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="0Ty2WXcu";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="GMHs2KnN"
Date: Thu, 15 Oct 2026 15:37:44 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1792078666;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1zSTud7DQXGS7aCAmZxT+1w8D2qTd8Zi8Rl/zT/HOcU=;
	b=0Ty2WXcuU7T0ttdOEdJ3To2EHc+d9Gh4EYOnlDDf8t122SvOqm2BQYQLotvwyvYgV7Va1X
	wDJkN5esXPB24IlCR1JqLPY7mLNVLC08/YBOEOaigsJlRg5GsOM4M7AaNLp+DnW9SCPeiC
	6NSrLbeHcs+2udWdrkb/eXkrMY3R/Lt0wX5SH4NLlISxJDLo8cuGEdG9ueDZClmZT62YQ/
	EBJE79A5VVZvFaqcNEqU5rT/I2DHoxPJcK+GhLp5ygoPWtCRD7YUbVuH6kxR7P5l+5nzik
	3MHRaYEzuuZnzLMTvwQ4ThABHgT9ozusdRLEH5cMxEbJ1zmTKzy0TS3AfR4KSg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1792078666;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1zSTud7DQXGS7aCAmZxT+1w8D2qTd8Zi8Rl/zT/HOcU=;
	b=GMHs2KnNqbWHTjGLM7ceTOSYfCYZJyEMJZFlMQFeWe6Rf3a0hGLX6cq73XeyOfrcDHEz7d
	9612hmcSkid6HuAw==
From: tip-bot2 for Thomas =?utf-8?q?Wei=C3=9Fschuh?= <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: timers/vdso] s390/vdso: Delete asm/vdso/vsyscall.h inclusions
Cc: thomas.weissschuh@linutronix.de, Thomas Gleixner <tglx@kernel.org>,
 x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To:
 <20260909-vdso-asm-generic-vsyscall-h-v1-8-63ae856cc659@linutronix.de>
References:
 <20260909-vdso-asm-generic-vsyscall-h-v1-8-63ae856cc659@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <179207866459.2666988.7481001982052354898.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the timers/vdso branch of tip:

Commit-ID:     d5b1dadd2ef0d7aa05595401f824104fd8e07899
Gitweb:        https://git.kernel.org/tip/d5b1dadd2ef0d7aa05595401f824104fd8e=
07899
Author:        Thomas Wei=C3=9Fschuh <thomas.weissschuh@linutronix.de>
AuthorDate:    Wed, 09 Sep 2026 10:51:21 +02:00
Committer:     Thomas Gleixner <tglx@kernel.org>
CommitterDate: Thu, 15 Oct 2026 17:33:19 +02:00

s390/vdso: Delete asm/vdso/vsyscall.h inclusions

The inclusions are unnecessary, remove them.

Signed-off-by: Thomas Wei=C3=9Fschuh <thomas.weissschuh@linutronix.de>
Signed-off-by: Thomas Gleixner <tglx@kernel.org>
Link: https://patch.msgid.link/20260909-vdso-asm-generic-vsyscall-h-v1-8-63ae=
856cc659@linutronix.de
---
 arch/s390/include/asm/vdso/getrandom.h | 1 -
 arch/s390/kernel/vdso.c                | 1 -
 arch/s390/kernel/vdso/vdso.lds.S       | 1 -
 3 files changed, 3 deletions(-)

diff --git a/arch/s390/include/asm/vdso/getrandom.h b/arch/s390/include/asm/v=
dso/getrandom.h
index 6741a27..ff5882f 100644
--- a/arch/s390/include/asm/vdso/getrandom.h
+++ b/arch/s390/include/asm/vdso/getrandom.h
@@ -6,7 +6,6 @@
 #ifndef __ASSEMBLER__
=20
 #include <vdso/datapage.h>
-#include <asm/vdso/vsyscall.h>
 #include <asm/syscall.h>
 #include <asm/unistd.h>
 #include <asm/page.h>
diff --git a/arch/s390/kernel/vdso.c b/arch/s390/kernel/vdso.c
index 0fe616c..a905f98 100644
--- a/arch/s390/kernel/vdso.c
+++ b/arch/s390/kernel/vdso.c
@@ -18,7 +18,6 @@
 #include <linux/random.h>
 #include <linux/vdso_datastore.h>
 #include <vdso/datapage.h>
-#include <asm/vdso/vsyscall.h>
 #include <asm/alternative.h>
 #include <asm/vdso.h>
=20
diff --git a/arch/s390/kernel/vdso/vdso.lds.S b/arch/s390/kernel/vdso/vdso.ld=
s.S
index 841daee..6bcdb64 100644
--- a/arch/s390/kernel/vdso/vdso.lds.S
+++ b/arch/s390/kernel/vdso/vdso.lds.S
@@ -4,7 +4,6 @@
  * library
  */
=20
-#include <asm/vdso/vsyscall.h>
 #include <asm/page.h>
 #include <asm/vdso.h>
 #include <asm-generic/vmlinux.lds.h>
