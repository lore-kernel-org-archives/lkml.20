Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E75FF13E02A;
	Wed,  2 Sep 2026 20:54:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788382456; cv=none; b=VF0naD/b+LhRCIbr2fZeKhAx+BNhgAxkQetHmCVNO2tWtx3suK/XMwTDsnKi4gueVfpT7gaUv97SvFD9tq1Yb2mjIWvNU1CYozYECJ+ImbDU6S/7VowlH4Wfb3vcbJGsk3iqjlS8gU19X+QGOX0JJTCjc/SiMHpxHJtt2XHdaak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788382456; c=relaxed/simple;
	bh=DiaO3sKQDwbEcY7wgTykD2z2H6p+BzoiIkc+y28+2hE=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=iuGz2FzzmTmv3R1CAIW0XdO6eCDDkQZFDu1GNiR7Af8LM/VsM8DE4I1ueuaONWZ4Trd/omvtTfpCms71hxLa6bIhlWNvGUldCs+0NhSwyo9OGLclFflfS/cOaFPQZefF3WIoWHPxH113SHjoVIGge0dRBB4AVsaZOulx3xuWQPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=VEL7jLfI; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=wnWUyyQH; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="VEL7jLfI";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="wnWUyyQH"
Date: Wed, 02 Sep 2026 20:54:06 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788382448;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YA3vmUUuMSNvIsyIoKfGoM2BdqEXxaWchuU++smEJB4=;
	b=VEL7jLfI+Drb6fHGx+jrj5rPpOaKe5bCx0UcDRKuBqGdbakoHKebGEwxRVbsNwvV9Y2vNh
	UOfLSZWB9/jm+dlpuMRBxkwppwpwta97gqfXZen0NvBICM6PZneN7/XXR72G/zv//Y+mbN
	GIXPNj0DoNErJebA9EKDNQo3SEQANHMCHkJWBEEJwGLbZV+K6fOtZK2Rb5ELVAK9hHmGAI
	somvqw9z/AJvcz4024THqt3QRZAmpG6uqyiJnSbrhgiHucsGumR4u1IO0FpOUzHn/4wsIE
	yf5roEAkmYGNzlQ0Afe5wvK0SRHeFv48TH0d3/ijfEfFz4//Bi0iJr4W4/yeQw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788382448;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YA3vmUUuMSNvIsyIoKfGoM2BdqEXxaWchuU++smEJB4=;
	b=wnWUyyQHhKCpGnRLF2IYCY+PMB7yAFMiIOGP4sw+l8Z79XyxWRHDmRJdH01LKxP4ue7Bx+
	8iPkyOZST8jIMJBQ==
From: "tip-bot2 for Jun Miao" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: x86/sgx] x86/sgx: Report RCU-Tasks quiescent state in EPC
 sanitization loop
Cc: Kai Huang <kai.huang@intel.com>, Fan Du <fan.du@intel.com>,
 Jun Miao <jun.miao@intel.com>, Dave Hansen <dave.hansen@linux.intel.com>,
 Jarkko Sakkinen <jarkko@kernel.org>, Challvy Tee <challvy.tee@gmail.com>,
 x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260902013653.690506-1-jun.miao@intel.com>
References: <20260902013653.690506-1-jun.miao@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <178838244658.3717435.4281468135223095765.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the x86/sgx branch of tip:

Commit-ID:     993b65a2fc6f3b2d61428ed2f2d10f94e94e6f3c
Gitweb:        https://git.kernel.org/tip/993b65a2fc6f3b2d61428ed2f2d10f94e94=
e6f3c
Author:        Jun Miao <jun.miao@intel.com>
AuthorDate:    Wed, 02 Sep 2026 09:36:53 +08:00
Committer:     Dave Hansen <dave.hansen@linux.intel.com>
CommitterDate: Wed, 02 Sep 2026 13:52:59 -07:00

x86/sgx: Report RCU-Tasks quiescent state in EPC sanitization loop

When the kernel boots from kexec, the EPC pages may have a stale state.
The kernel sanitizes all EPC pages to reset them to a clean state before
their first use in any enclave.  The EPC size could be several GBs and
resetting them could take a significant amount of time.  Because of that,
the kernel performs the reset in a loop through a kernel thread ksgxd() at
early boot, and there's a cond_resched() after resetting each EPC page.

This is fine in most cases, but becomes a problem when there's other kernel
code waiting for an RCU-Tasks grace period but the cond_resched() in
ksgxd() never triggers rescheduling.  Because cond_resched() doesn't report
a quiescent state when it doesn't trigger rescheduling, the thread that is
waiting for an RCU-Tasks grace period will wait until all EPC pages are
reset.

For instance, BPF LSM subsystem can invoke synchronize_rcu_tasks() at
kernel boot time.  A VM with a large EPC assigned and BPF LSM enabled can
take a long time to boot, with a call trace triggered:

    rcu_tasks_wait_gp: rcu_tasks grace period number 1 (since boot) is
	130631 jiffies old.
    INFO: task systemd:1 blocked for more than 122 seconds.
    ...
    task:systemd  state:D stack:0  pid:1  tpid:1  ppid:0  flags:0x00000002
    Call Trace:
    ...
    schedule_timeout+0x157/0x170
    wait_for_completion+0x88/0x150
    __wait_rcu_gp+0x17e/0x190
    synchronize_rcu_tasks_generic+0x64/0x60
    ...
    synchronize_rcu_tasks+0x15/0x20
    register_ftrace_direct+0x31f/0x350
    ...
    bpf_trampoline_link_prog+0x33/0x60
    bpf_tracing_prog_attach+0x3c5/0x5f0

Replace cond_resched() with cond_resched_tasks_rcu_qs() which explicitly
reports quiescent state regardless of whether actual rescheduling is
triggered.  Resetting all EPC pages in ksgxd() isn't performance critical
so the extra cost of cond_resched_tasks_rcu_qs() isn't a problem.

Tests showed this reduced the VM kernel boot time from ~50s to ~700ms.

Co-developed-by: Fan Du <fan.du@intel.com>
Fixes: e7e0545299d8 ("x86/sgx: Initialize metadata for Enclave Page Cache (EP=
C) sections")
Suggested-by: Kai Huang <kai.huang@intel.com>
Signed-off-by: Fan Du <fan.du@intel.com>
Signed-off-by: Jun Miao <jun.miao@intel.com>
Signed-off-by: Dave Hansen <dave.hansen@linux.intel.com>
Reviewed-by: Kai Huang <kai.huang@intel.com>
Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>
Tested-by: Challvy Tee <challvy.tee@gmail.com>
Link: https://github.com/systemd/systemd/issues/40423
Link: https://patch.msgid.link/20260902013653.690506-1-jun.miao@intel.com
---
 arch/x86/kernel/cpu/sgx/main.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/arch/x86/kernel/cpu/sgx/main.c b/arch/x86/kernel/cpu/sgx/main.c
index 4505f80..a5f2aab 100644
--- a/arch/x86/kernel/cpu/sgx/main.c
+++ b/arch/x86/kernel/cpu/sgx/main.c
@@ -106,7 +106,13 @@ static unsigned long __sgx_sanitize_pages(struct list_he=
ad *dirty_page_list)
 			left_dirty++;
 		}
=20
-		cond_resched();
+		/*
+		 * cond_resched() only schedules when TIF_NEED_RESCHED is set.
+		 * During this boot-time loop that condition may not happen for a
+		 * long time, so report an RCU-Tasks quiescent state explicitly.
+		 * Therefore, change cond_resched() to cond_resched_tasks_rcu_qs().
+		 */
+		cond_resched_tasks_rcu_qs();
 	}
=20
 	list_splice(&dirty, dirty_page_list);
