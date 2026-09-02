Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E93184A8FF6;
	Wed,  2 Sep 2026 21:27:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788384445; cv=none; b=pvQKfDOm4l2Jb2DKYmjA4pf3l9UgsWORsw0KgXZEWXatYJHBOYnr+7XITjf2AsFMHTKXhV0/2hs4FY7oYranJlJTySq6kPw6ITawjjUIls8eJp9kx8QsBoG5qZK3N+K7S9zhOb97sq+AXutBJ9wrqZTCX/aJ7PRpTkQZ+uVgSO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788384445; c=relaxed/simple;
	bh=lu7iWlR1etnFGExefpFcPx2Vo5m3XfX2i7mAPIeqe8Y=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=OytDj2+Fb3QPmDe33TYG3EBIH9p8npUvLtFYn9HbdfJv5j/25tWrbm95+jMhmSvt8gUZ98/cq5vocgyjDrb1Rc4XkKig+1TreZFOa3N//dSOKSjruTYJ6/7me4SaAbLK3yjEFVz8TMLmpdvTYJVuwJdtT19oT5NMer6vpATEbHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=vYBAxk2F; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=nQ7KgJDH; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="vYBAxk2F";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="nQ7KgJDH"
Date: Wed, 02 Sep 2026 21:27:16 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788384438;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PjNcOF/cgiGeDQDNXViOSJQXT3WVWuCZVApBGiP+Wr4=;
	b=vYBAxk2FU0fGrOSlQmD+YwgQ5j8bDOT1Ml8fILJuNaU6mQwvb09ntiHh3WpRchTVZ5BppB
	2l0SO7cQI5oeXLBGD9dt9Vm5O01XQ06uriTRhCJcDcVuhQmP6TXwC1OT8Vb1uShiKXHrc7
	MgBZlFYkFPqx+II8NzgBPtZdzCegdQjG3JFz5pf944NqudcJ/pUabHFVuY6Oz/NMjWmgFg
	HnvrycnaumGs7Q0mzWSDium1xZFZ164EJ13puh3voAxu9hpvo/hDFmKlpXyxkcpx7zjmJC
	NVUXkGYiwFTh2obi7R9v4KMy0OpctnQHu6ej7uBFidNVM8+gEVT8yWNxXLCnSg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788384438;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PjNcOF/cgiGeDQDNXViOSJQXT3WVWuCZVApBGiP+Wr4=;
	b=nQ7KgJDHvSYwSsw4U1Ui8ERn3+wkmLL2DxdniLie30yzBbJ6/Dl/ECd7ncmfHfg5ANh9HR
	SnTnqJhrQRsrRnBQ==
From: "tip-bot2 for Ionut Nechita" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: x86/kdump] crash: Update stale NR_CPUS_DEFAULT references in
 elfcorehdr sizing docs
Cc: Jinjie Ruan <ruanjinjie@huawei.com>, Bradley Morgan <brads@mainlining.org>,
 Ionut Nechita <ionut.nechita@windriver.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Bradley Morgan <include@grrlz.net>,
 x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260901071041.16311-3-ionut.nechita@windriver.com>
References: <20260901071041.16311-3-ionut.nechita@windriver.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <178838443692.3717435.2326087014220873467.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the x86/kdump branch of tip:

Commit-ID:     d949fa7b1ec54c626b656f873b95d76b8ab0d143
Gitweb:        https://git.kernel.org/tip/d949fa7b1ec54c626b656f873b95d76b8ab=
0d143
Author:        Ionut Nechita <ionut.nechita@windriver.com>
AuthorDate:    Tue, 01 Sep 2026 10:10:41 +03:00
Committer:     Dave Hansen <dave.hansen@linux.intel.com>
CommitterDate: Wed, 02 Sep 2026 14:25:16 -07:00

crash: Update stale NR_CPUS_DEFAULT references in elfcorehdr sizing docs

The elfcorehdr reservation is now sized with NR_CPUS, but two comments
still name NR_CPUS_DEFAULT: the one above crash_handle_hotplug_event()
and the CRASH_MAX_MEMORY_RANGES help text.

Update both.  Documentation only, no functional change.

Suggested-by: Jinjie Ruan <ruanjinjie@huawei.com>
Suggested-by: Bradley Morgan <brads@mainlining.org>
Signed-off-by: Ionut Nechita <ionut.nechita@windriver.com>
Signed-off-by: Dave Hansen <dave.hansen@linux.intel.com>
Reviewed-by: Bradley Morgan <brads@mainlining.org>
Reviewed-by: Bradley Morgan <include@grrlz.net>
Link: https://patch.msgid.link/20260901071041.16311-3-ionut.nechita@windriver=
.com
---
 kernel/Kconfig.kexec | 2 +-
 kernel/crash_core.c  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/Kconfig.kexec b/kernel/Kconfig.kexec
index 1563235..a97ed96 100644
--- a/kernel/Kconfig.kexec
+++ b/kernel/Kconfig.kexec
@@ -167,7 +167,7 @@ config CRASH_MAX_MEMORY_RANGES
 	  memory regions that the elfcorehdr buffer/segment can accommodate.
 	  These regions are obtained via walk_system_ram_res(); eg. the
 	  'System RAM' entries in /proc/iomem.
-	  This value is combined with NR_CPUS_DEFAULT and multiplied by
+	  This value is combined with NR_CPUS and multiplied by
 	  sizeof(Elf64_Phdr) to determine the final elfcorehdr memory buffer/
 	  segment size.
 	  The value 8192, for example, covers a (sparsely populated) 1TiB system
diff --git a/kernel/crash_core.c b/kernel/crash_core.c
index 2b36aa9..d0bd2d0 100644
--- a/kernel/crash_core.c
+++ b/kernel/crash_core.c
@@ -648,7 +648,7 @@ int crash_check_hotplug_support(void)
  * new list of CPUs and memory. To make changes to the elfcorehdr, it
  * should be large enough to permit a growing number of CPU and Memory
  * resources. One can estimate the elfcorehdr memory size based on
- * NR_CPUS_DEFAULT and CRASH_MAX_MEMORY_RANGES. The elfcorehdr is
+ * NR_CPUS and CRASH_MAX_MEMORY_RANGES. The elfcorehdr is
  * excluded from SHA verification by default if the architecture
  * supports crash hotplug.
  */
