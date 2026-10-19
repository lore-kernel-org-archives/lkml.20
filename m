Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792442671;
	b=PWgFiXIDtabTktD6O4dBithzlEkY8ucHJ6nIQIF9nAF/1eQQhh7gbHtMJ4PIhV37WthD
	 RUzH3GJJkRDzuQSU+Nph1u7lT/IH1bwIDrYguJABXpGfiruasi+yEzP0MOn/yxoLjZ4Zq
	 f2GCTy4cX07OMUuJWyfFhzLfP9FMEQY5S86bUtM1NSHfYGkdadTxF3EGfnbo9ryq3y/bm
	 dVa75TRN36Wis51CaSZyNtII/2utAZ83ZivqtozfzlT00KICFC64xCdGaINEguTHSVLql
	 GHDpi7Td0jsZpbnbZYt8UtYWHsSKm3GfcLaY26A6C0h6ZBEK6bp9H0wYCgl6F/1+JhA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792442671;
	h=Received:DKIM-Signature:Received:Date:From:To:Cc:Subject:Message-ID:
	 Reply-To:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=OI9lKdgg9N7w+H+FjjD3PMTR1h/HXgOufjguNaO7058=;
	b=vhftBjOZjMSU69UUsong/erJkOipCqSBI8Vz3OkRw8+XecQwIqJZy4rfnWUHn6OkMEPt
	 Jc3SU56HfMcG2Jif81iMmt2y3ZnBHZL+k2YgDOvqTD6dY01BkKIZjpCPHdPrNerAq6OMX
	 7c2aexIDCt2PHc7yHm4I6MqXgtdVOMMBg0CDoXsAcMZOl2xS3Zkv+gtBIebAgwdqCXyJ8
	 VNS2YBgPTiIh6DUy1YPTB3o6pN9YTVi7vDzIPudH0z7X5Z7ZaoVt0QTOYc21J1L+Kyxfa
	 wISMk+erkbsq7nKMPCjXTDJODbaKpf6pQ3XH+D6BbkFsclEtkhYmxeJxT6YGQFGXiZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SbbGkTZp;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48601606A31C
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 20:44:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SbbGkTZp
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1F351F000C4;
	Mon, 19 Oct 2026 20:44:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792442670;
	bh=OI9lKdgg9N7w+H+FjjD3PMTR1h/HXgOufjguNaO7058=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To;
	b=SbbGkTZpKu2y7ByMjeN5eOyf7aOxrAdHimzwU7WnUNopuQNaLeXIUzlJBP+gSSfP4
	 3GgBKyYBVKXiJR2S0AyBTp2PSY6poVYIT5iI6OJ6ciCVr7H47ATBNk+NUU92VHhJ5j
	 hl0g0nso7Ve9UMEnWXoFJGFEHaKDZv/v9wbBtBOkJyt1FJkaA7yziBchTLiNAd41Ho
	 +85YbZlw1iDNGM2EqiVYXwAztu7CnWqlfjxiRyZKBlaUxdLbH10O8OX4xnNv26tLb3
	 dTqD/s6uxd6p4ml2umBxC/hriZEnrmO6/u6WuuvZoRl2sgLO2Bl/ykY6pmhXUITTgg
	 w/RaX9Zo3x7Vw==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 6CB3ECE09FC; Mon, 19 Oct 2026 13:44:30 -0700 (PDT)
Date: Mon, 19 Oct 2026 13:44:30 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, kernel-team@meta.com
Subject: [PATCH v2] x86/nmi: Enable panic() when NMI handler runs too long
Message-ID: <8b14bd35-8f7e-4e41-9aae-e085f9a536f6@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <53ff8d29-b7ce-4b3f-bdcf-9ac1f31f0a9f@paulmck-laptop>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <53ff8d29-b7ce-4b3f-bdcf-9ac1f31f0a9f@paulmck-laptop>

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

[ paulmck: Apply kernel test robot feedback, add documentation. ]

Signed-off-by: Paul E. McKenney <paulmck@kernel.org>
Cc: Thomas Gleixner <tglx@kernel.org>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Borislav Petkov <bp@alien8.de>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: "H. Peter Anvin" <hpa@zytor.com>
Cc: <x86@kernel.org>

---
 Documentation/admin-guide/kernel-parameters.txt |    6 ++++++
 arch/x86/kernel/nmi.c                           |   21 +++++++++++++++++++--
 2 files changed, 25 insertions(+), 2 deletions(-)

Changes since v1:

o	Add documentation of new toolong_nmi_panic kernel boot parameter.

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 68647ff4bdd24..e7dbd5bf48fc9 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -7642,6 +7642,12 @@ Kernel parameters
 			Format: {ipi}
 			ipi: switch to IPI-based TLB flushing
 
+	toolong_nmi_panic= [X86]
+			Cause a panic upon return from an NMI handler
+			that took longer than the specified number
+			of milliseconds.  The default value of zero
+			suppresses these panics.
+
 	topology=	[S390,EARLY]
 			Format: {off | on}
 			Specify if the kernel should make use of the cpu
diff --git a/arch/x86/kernel/nmi.c b/arch/x86/kernel/nmi.c
index 3c9f60d6ca5a7..aae7254774680 100644
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
