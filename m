Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B464547078
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 00:17:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789777063; cv=none; b=QHQP4wcWfzzCWsW7BS45nTcBdDb7oeEyZzo1PcfJilGMPZ7eKQSO7B3Ay41uT5q2nQ49iRmYabFwZNKoyqfbHn9V0y1iWnNcV4Zb1Tb6II6qvCIuTfV2QZfdroxhg9TQhSLAvsvc9CHoxoK0YVI19QtdM0+O9s5jrnnWuFlVzd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789777063; c=relaxed/simple;
	bh=4vhU9fIfIFQef/kcc2WPuuUigvQpCXn4brIcCvyJOx0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OMcOtFGNsOuXryC3bzVTFfj7C4dOaFnurR4GCKeXqORlo8xGC6kbIR3i0OKBsPGaDEQRBzJN7oXmXiGZS4sdI83VlyBiZAn2W2R244c8haaQNRCgumX1y/3CTfkxX8OxWTctl3Kb95BrL0EY280Wn3YkbklfsjnkDnQG7bp3on0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UJO0PlEo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UJO0PlEo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4C761F000FF;
	Sat, 19 Sep 2026 00:17:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789777061;
	bh=jHu4xu88/hwPT46tOKW11XMIx4gU3z1z3ihxG0qTg3U=;
	h=Date:From:To:Cc:Subject:Reply-To;
	b=UJO0PlEowYH86KfuuOwws40t1Xn9piCi9PtU3FTG8gEGkjsREi/+vkoJyK+tKcZUW
	 5tX9uJlT4fF5uTh9ONJvOfvMSMTlKi4VK+XgrrXCVKX8wguPNSU+PrW9bo7wqKQuGl
	 DMNN3GRu8w2/PR1d0cICAizxZz+mQ5jJDfmsYfQHHRz/PHwu/KRasLCohrHATBA5sQ
	 Hb56YdCuEgDCCE0W3S9loOQy1hFTtKFXNdRHL5CaOnQ8MFYaHyFSbX4EkUXxFPAadp
	 KCKzW9ammkueO1QrJDpKtDt995A8xQTtVQQFvKLT/g2E/ekuj8fzb9Q/WQuLgld3cn
	 S37vS3ske6h/A==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 79205CE1775; Fri, 18 Sep 2026 17:17:41 -0700 (PDT)
Date: Fri, 18 Sep 2026 17:17:41 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, kernel-team@meta.com
Subject: [PATCH] x86/nmi: Enable panic() when NMI handler runs too long
Message-ID: <53ff8d29-b7ce-4b3f-bdcf-9ac1f31f0a9f@paulmck-laptop>
Reply-To: paulmck@kernel.org
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Firmware, device-driver, and configuration issues can result in
long-running NMI handlers, for example, nmi_cpu_backtrace_handler()
running for more than two seconds, and with no console issues.  In this
case, this is not the fault of nmi_cpu_backtrace_handler(), but it is
the first symptom of the underlying problem.  These NMI handlers result
in various other problems, including CSD-lock warnings, clocksource
watchdog false positives, scheduler frequency invariance wobbliness,
systemd excessive-CPU complaints, and even the occasional RCU CPU
stall warning.  Eventually, the automation will take the system out of
service, but with quite a bit of noise obscuring the underlying issue,
and thus confusing both automation and human beings.

Therefore, provide a toolong_nmi_panic __setup() parameter that makes
nmi_check_duration() invoke nmi_panic() if the just-completed NMI handler
ran for more than the specified number of milliseconds.  This parameter
defaults to zero, which disables the nmi_panic().  As in, by default
you get the same behavior that you get today.

[ paulmck: Apply kernel test robot feedback. ]

Signed-off-by: Paul E. McKenney <paulmck@kernel.org>
Cc: Thomas Gleixner <tglx@kernel.org>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Borislav Petkov <bp@alien8.de>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: "H. Peter Anvin" <hpa@zytor.com>
Cc: <x86@kernel.org>

diff --git a/arch/x86/kernel/nmi.c b/arch/x86/kernel/nmi.c
index 3c9f60d6ca5a..aae725477468 100644
--- a/arch/x86/kernel/nmi.c
+++ b/arch/x86/kernel/nmi.c
@@ -85,6 +85,7 @@ static DEFINE_PER_CPU(struct nmi_stats, nmi_stats);
 static int ignore_nmis __read_mostly;
 
 int unknown_nmi_panic;
+static unsigned long toolong_nmi_panic;
 int panic_on_unrecovered_nmi;
 int panic_on_io_nmi;
 
@@ -101,6 +102,20 @@ static int __init setup_unknown_nmi_panic(char *str)
 }
 __setup("unknown_nmi_panic", setup_unknown_nmi_panic);
 
+static int __init setup_toolong_nmi_panic(char *str)
+{
+	int ret;
+
+	ret = kstrtoul(str, 0, &toolong_nmi_panic);
+	if (ret) {
+		pr_alert("%s: %s on '%s', disabling to zero.\n",
+			 __func__, ret == -ERANGE ? "Overflow" : "Parse error", str);
+		toolong_nmi_panic = 0;
+	}
+	return 1;
+}
+__setup("toolong_nmi_panic=", setup_toolong_nmi_panic);
+
 static u64 nmi_longest_ns = 1 * NSEC_PER_MSEC;
 
 static int __init nmi_warning_debugfs(void)
@@ -111,7 +126,7 @@ static int __init nmi_warning_debugfs(void)
 }
 fs_initcall(nmi_warning_debugfs);
 
-static void nmi_check_duration(struct nmiaction *action, u64 duration)
+static void nmi_check_duration(struct nmiaction *action, u64 duration, struct pt_regs *regs)
 {
 	int remainder_ns, decimal_msecs;
 
@@ -126,6 +141,8 @@ static void nmi_check_duration(struct nmiaction *action, u64 duration)
 
 	pr_info_ratelimited("INFO: NMI handler (%ps) took too long to run: %lld.%03d msecs\n",
 			    action->handler, duration, decimal_msecs);
+	if (toolong_nmi_panic && duration >= toolong_nmi_panic)
+		nmi_panic(regs, "Panic per toolong_nmi_panic");
 }
 
 static int nmi_handle(unsigned int type, struct pt_regs *regs)
@@ -165,7 +182,7 @@ static int nmi_handle(unsigned int type, struct pt_regs *regs)
 		delta = sched_clock() - delta;
 		trace_nmi_handler(a->handler, (int)delta, thishandled);
 
-		nmi_check_duration(a, delta);
+		nmi_check_duration(a, delta, regs);
 	}
 
 	rcu_read_unlock();
