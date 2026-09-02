Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43BD5411FB1;
	Wed,  2 Sep 2026 21:27:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788384445; cv=none; b=mUVN1ZF0E7KTiYqpKCzWMjkqfyQDHw5RhWgHVdKsXS4kr6Z8oDxc7wwG1ctNf1lhvjV9H4RgYj6qALBdeP44BS1TRsZFXI/ssjBh4QvZ/htJpHAvrlFbr16g+t6OlL2LQ097TUtnvDnXRGC7zBno0jBGbaA0O3vAByGWwzEN1lc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788384445; c=relaxed/simple;
	bh=X9QpMakBovPjRo4C5FimND6xujDs5KBx/SQV+0Ud2fc=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=R5poNHjvpIy9yJ252FOJ3WOs9XnyLzGFA0RtDzP/IchrhbUeYW18WW3CKyFk52Ue4un2GNqxqnVI07XbXMwR+wGObEsfigehiZQWp603lHHmmGP5xSvUSm4B6m22Y70livGlbMtN/xZXjW2STG+gzOAvp1A8FX/FrVNWnrLrMGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=GiMlYIGw; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=mkONqZnd; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="GiMlYIGw";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="mkONqZnd"
Date: Wed, 02 Sep 2026 21:27:18 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788384440;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JxXrymQNzGUSpnCdAQ4y8XUpPYLxg+xZVrRyDyOv9fw=;
	b=GiMlYIGwwlDcBbmRc27teNFCBpXw6h/DvD09npjmr1KAJ1mW8vJb3x4nLpH2SHcZnQUqFU
	4ENJ5hDAjLCjRltpmsNsqxU/hAg7ADpi2k4Bs4AuH3G7aY+Ak6/PRjs7o0OIrD0iwSOY0b
	4RvUECdJjWw5xuRlm5tW/Kw3LTbK6xYF7NpPe5fkjlbP5QoCNNnk7medH76b+Xhuxd9dZd
	yK5YGWt2CH9+nbRvwRGCVOohkOtory0WNJ6i54JH6pbXBt0V1F5aSZdDEHacLsKBEnzgcG
	KPh9mFaf7Csey1+OZ/BFvPmVhBTnoZKfrZtFExeQA8WmRJLXDADehPuS+W1YXw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788384440;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JxXrymQNzGUSpnCdAQ4y8XUpPYLxg+xZVrRyDyOv9fw=;
	b=mkONqZndpAYi0l8I09Er70lBGrTgNDDimXKTiCUEWIzvqXVA8nibtG6gew19hdqOEoqXDp
	hfJmi3Hq8ygZynDQ==
From: "tip-bot2 for Ionut Nechita" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: x86/kdump] x86/crash: Reserve elfcorehdr for CONFIG_NR_CPUS,
 not CONFIG_NR_CPUS_DEFAULT
Cc: Ionut Nechita <ionut.nechita@windriver.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Jinjie Ruan <ruanjinjie@huawei.com>, Bradley Morgan <brads@mainlining.org>,
 Sourabh Jain <sourabhjain@linux.ibm.com>, Baoquan He <baoquan.he@linux.dev>,
 x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260901071041.16311-2-ionut.nechita@windriver.com>
References: <20260901071041.16311-2-ionut.nechita@windriver.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <178838443830.3717435.3959490897676364319.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the x86/kdump branch of tip:

Commit-ID:     6664ad1026b558563702f9a1ce637df33e7c001e
Gitweb:        https://git.kernel.org/tip/6664ad1026b558563702f9a1ce637df33e7=
c001e
Author:        Ionut Nechita <ionut.nechita@windriver.com>
AuthorDate:    Tue, 01 Sep 2026 10:10:40 +03:00
Committer:     Dave Hansen <dave.hansen@linux.intel.com>
CommitterDate: Wed, 02 Sep 2026 14:25:06 -07:00

x86/crash: Reserve elfcorehdr for CONFIG_NR_CPUS, not CONFIG_NR_CPUS_DEFAULT

NR_CPUS_DEFAULT is purely a Kconfig thing.  Its entire purpose in life is
to start NR_CPUS at a sane value.  There is precisely one (buggy)
reference to it outside of Kconfig in the whole kernel: the x86 crash
code.

That code undersizes the elfcorehdr reservation whenever NR_CPUS exceeds
NR_CPUS_DEFAULT, because the header carries one phdr per possible CPU and
num_possible_cpus() is bounded by NR_CPUS.  kexec_file_load(2) then fails
with -EINVAL from sanity_check_segment_list(), and kexec_load(2) silently
truncates the elfcorehdr, which surfaces later as a bad or unusable dump.

Size the elfcorehdr reservation with NR_CPUS instead.

Fixes: ea53ad9cf73b ("x86/crash: add x86 crash hotplug support")
Signed-off-by: Ionut Nechita <ionut.nechita@windriver.com>
Signed-off-by: Dave Hansen <dave.hansen@linux.intel.com>
Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>
Reviewed-by: Bradley Morgan <brads@mainlining.org>
Reviewed-by: Sourabh Jain <sourabhjain@linux.ibm.com>
Acked-by: Baoquan He <baoquan.he@linux.dev>
Link: https://patch.msgid.link/20260901071041.16311-2-ionut.nechita@windriver=
.com
---
 arch/x86/kernel/crash.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/x86/kernel/crash.c b/arch/x86/kernel/crash.c
index e681ec9..e6f2393 100644
--- a/arch/x86/kernel/crash.c
+++ b/arch/x86/kernel/crash.c
@@ -369,9 +369,9 @@ int crash_load_segments(struct kimage *image)
 	 * maximum CPUs and maximum memory ranges.
 	 */
 	if (IS_ENABLED(CONFIG_MEMORY_HOTPLUG))
-		pnum =3D 2 + CONFIG_NR_CPUS_DEFAULT + CONFIG_CRASH_MAX_MEMORY_RANGES;
+		pnum =3D 2 + CONFIG_NR_CPUS + CONFIG_CRASH_MAX_MEMORY_RANGES;
 	else
-		pnum +=3D 2 + CONFIG_NR_CPUS_DEFAULT;
+		pnum +=3D 2 + CONFIG_NR_CPUS;
=20
 	if (pnum < (unsigned long)PN_XNUM) {
 		kbuf.memsz =3D pnum * sizeof(Elf64_Phdr);
@@ -430,7 +430,7 @@ unsigned int arch_crash_get_elfcorehdr_size(void)
 	unsigned int sz;
=20
 	/* kernel_map, VMCOREINFO and maximum CPUs */
-	sz =3D 2 + CONFIG_NR_CPUS_DEFAULT;
+	sz =3D 2 + CONFIG_NR_CPUS;
 	if (IS_ENABLED(CONFIG_MEMORY_HOTPLUG))
 		sz +=3D CONFIG_CRASH_MAX_MEMORY_RANGES;
 	sz *=3D sizeof(Elf64_Phdr);
