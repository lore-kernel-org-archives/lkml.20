Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794559046;
	b=mWbZgWbnq9RVG2F5c5KuxaU2l4WqbhkEAYdHNRrkk23Fym7c/9adqEwRZDYY7XMiDN3c
	 5w5ZMPT23JrR3m+syhJpD+upCrWyq+TLxQm8BKuj4AN81LTgCtFNnZSdQZfqWgyqsb+nY
	 8JMlydXJNxmPm0mUiFzy0IzCPty09zQMbyYBE9qrf8jX8zYJx62zrgucar0zz7P5kYKMz
	 9ngDX3NtckeT6+M8TAtWcqHj4JuxAuo2QXCgDqv0MED+VSgUwJBopD1Ocd/gN+5tuJApk
	 l+YfAkmsWTIjyErT2ck5/+yRitCmNLlZt7UtDfFw/cbvfzaQfo5apALMB1afjsshOdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794559046;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Message-ID:In-Reply-To:References:From:Subject:To:Cc:
	 MIME-Version:Content-Type:Content-Disposition:User-Agent;
	bh=gEzmF9s3oRqFQx1peFT0I39gTTaUDMkIiUegklzJqx8=;
	b=Z/dPgCYvpjVgW+4b1oRbHgRs4o5U41IKUeHErxqHAH5tvf3O+hfFlqu2iA44Ankdps0A
	 +SQ1HLEgoznzN0ycoNmKTa7A2Iw3rwk/O5brD42QUSbqJ/2z0dLbNKDgGaQ4RpjvSGIOX
	 dVoYkw9HK3AY+s4sfeQNdnDVx/YRsJ3fx64nEMhCf5shu/+Ax6FgqqHy1Atcvyaa9XQsg
	 Nt6WkzuxTGd7gFJfihtugCqpWOOPYYdQT9JUaNpmnd39v12X9CrzStI34HPuSQWG0kONJ
	 llK7VvFJYfbyql5p7iLxItoHLir3CB9/Zcz4af0rOK/XSffCj1lG7pCP0vN/V0QZZsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=gJQ3Lj2p;
	arc=none smtp.remote-ip=209.85.216.43
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BED2360A380C
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 08:37:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BED2360A380C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=gJQ3Lj2p
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3b09a83d12aso1045199a91.2
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 00:37:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1794559045; x=1795163845; darn=vger.kernel.org;
        h=user-agent:content-disposition:content-type:mime-version:cc:to
         :subject:from:references:in-reply-to:message-id:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=gEzmF9s3oRqFQx1peFT0I39gTTaUDMkIiUegklzJqx8=;
        b=gJQ3Lj2pJkf6fs6vXad059bYGTkbJD9HJFhX71S0XIKPeqJoam0O+rViwVVtsZaaiS
         qHGJnzL2VEDJe6j2JGNYg5NhIepzQ6zcxpn8mm5jaCQTQTPnfqOfewa98DOIUlIKZ0y0
         XcM7lJe0W/ZRyFQmLWh3VyttnxS6N+34dX0vo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794559045; x=1795163845;
        h=user-agent:content-disposition:content-type:mime-version:cc:to
         :subject:from:references:in-reply-to:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gEzmF9s3oRqFQx1peFT0I39gTTaUDMkIiUegklzJqx8=;
        b=c6PPqzyHzva2NVvdVKXfQY5pq3qTegeO9XAjefMQZ95SpYVxHOh3qjVDNQfE0mXFep
         vKjBn/BAEjEW0bmdKv3JjN3WozMVILTgAR+hM05uKUTo6eBeEYdC9ca9f+Cv+33d9XOE
         KHW0zwuxMpSVKQGvmpYQBZtsQbRMDWYvTMHrx4KFW6yms5And3K6Sw97r1kFsmZJ9Gdt
         IEz7IiqM6ZpiV5jO3iFL4y9hDkpCEWJotx9ia//jT1y+6ycNbAPPNBpxfBs1g/GPS3EH
         ZepOfmcNwNmAtNZs+4hyZ2Efkj3fy/OfpsvBNy4pxQ2b0xFmP6e2R44jhLXUFnH6B9C+
         IC9w==
X-Forwarded-Encrypted: i=1; AL+hErHiQQ4qtIHiW1Axn+CM4LGIPKMZVmK6gA2gFDEsKbt1g0nM/PPdJp4ar2u1U9+CuvDToo7b4/JbNm/YBXo=@vger.kernel.org
X-Gm-Message-State: APuU4Z85cLQTxGmjnQ2jOz3VmZg6NrctPzv3M1R1gtL6YaoBBD/kdExQ
	196GCrPReCjR22bJQ3w9X8uOB6gOgNIh0VLrsld9M6PwCV7U5QLKxxrZG16QsnKGoEQ=
X-Gm-Gg: AYBFou10OB/PqnP+V+SKCLy3HyAV3XNdR3x/o6Lk9yb50p5k9b0PXPkArlZcBmhggh+
	JYvfORtFTZkBKZlKs0Wj9XORNSuvTAR6sJ8MycSORpeC3j0NIqsN6OD1m2yz9tpZ53X10MO99eJ
	E6ln56oSxLtfh6ojkdqdKKXTwFpqmr6thEOKj9GYOymnja9P7olLpeKcGeFI5iM1ifcU2FnbZ+3
	Wg+69lX5FUuDTwF5D02oLnRuOaaMY8Rb9PU5NMN15yn2UsvsuBMZ9ehFQBBEMpk+wTM4AVq6Auv
	3+z4fNjtYihnWzvSGS09QEVcvrCHPbw947AgZc9oHRDKkSvJOQGek2/xy0POnQdj/RNCFC45vLt
	Blks39a8BVBreivbag8qhW5257cjMEv4HaSw9r6nIfab2XCfYUQXpQ5cxiZ5Z/vVMP7LhVDQiH1
	8U/a0JLTWL+boHlqIRPU7Yzq5kfhf/pTPEue0g0DqzVow4MHsZUx8fVKv5JtbH9vjLzF9zl0j9Q
	M7UE1V4TPN42361+KEjM1qL9OxyilTp+0UpAqs4H2O8Bn3S7zb9ftXZ0bbb57Nr6po5mm7QAS7s
	1UBkc/2a0hcmcao/6yBSTgu1fd1dDlrTBK4tfP/2gAiCjm6IgW2rbcoKcAsGtovVAWGWtI3mYFj
	EB/iiPSjxEblagcK6JZK7HeO1csRw7GBecrewvja7mfgPz+KmOJ4/Lm1k2h/lSVRyCPSquxmsFB
	BybbXZGhWV9BmJVquvzy2cml+4ILpuOm+zmuFKJB0BW+f2s4SHHXsyu4KTOKY=
X-Received: by 2002:a17:90b:4d0b:b0:3b0:b03b:699f with SMTP id 98e67ed59e1d1-3b1b089e039mr1673991a91.1.1794559044956;
        Fri, 13 Nov 2026 00:37:24 -0800 (PST)
Received: from [172.22.0.2] ([50.175.87.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1b3b708adsm1085683a91.4.2026.11.13.00.37.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 00:37:23 -0800 (PST)
Date: Fri, 13 Nov 2026 00:37:21 -0800
Message-ID: <95e5cba24df5d646f1baff74016a1a224f92aa13.1794554867.git.chris@chrisdown.name>
In-Reply-To: <cover.1794554867.git.chris@chrisdown.name>
References: <cover.1794554867.git.chris@chrisdown.name>
From: Chris Down <chris@chrisdown.name>
Subject: [PATCH v2 2/3] sched/core: Add sched_stack_end_check= boot parameter
To: Peter Zijlstra <peterz@infradead.org>,
    Ingo Molnar <mingo@redhat.com>,
    Kees Cook <kees@kernel.org>
Cc: Juri Lelli <juri.lelli@redhat.com>,
    Vincent Guittot <vincent.guittot@linaro.org>,
    Dietmar Eggemann <dietmar.eggemann@arm.com>,
    Steven Rostedt <rostedt@goodmis.org>,
    Ben Segall <bsegall@google.com>,
    Mel Gorman <mgorman@suse.de>,
    Valentin Schneider <vschneid@redhat.com>,
    K Prateek Nayak <kprateek.nayak@amd.com>,
    Ard Biesheuvel <ardb@kernel.org>,
    Will Deacon <will@kernel.org>,
    Sami Tolvanen <samitolvanen@google.com>,
    Jonathan Corbet <corbet@lwn.net>,
    Shuah Khan <skhan@linuxfoundation.org>,
    Randy Dunlap <rdunlap@infradead.org>,
    Arnd Bergmann <arnd@arndb.de>,
    Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
    Paul Walmsley <pjw@kernel.org>,
    Palmer Dabbelt <palmer@dabbelt.com>,
    Albert Ou <aou@eecs.berkeley.edu>,
    Alexandre Ghiti <alex@ghiti.fr>,
    linux-arm-kernel@lists.infradead.org,
    linux-riscv@lists.infradead.org,
    linux-doc@vger.kernel.org,
    linux-kselftest@vger.kernel.org,
    linux-kernel@vger.kernel.org,
    kernel-team@meta.com
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
User-Agent: Mutt/2.4.3 (cc9e3943) (2026-10-09)

CONFIG_SCHED_STACK_END_CHECK makes schedule_debug() check the magic at
the end of the outgoing task's stack and panic if it has been
overwritten.

Right now this can only be configured by setting the Kconfig option at
build time. At Meta we have it on for some hosts and off for others,
since it is helpful but adds cost on context switching. That means today
we have to build separate kernels for each, which is less than ideal.

Make this configurable at boot time with sched_stack_end_check=, and
keep the Kconfig option as its default. In benchmarking sched pipe and
sched messaging performance is unaffected.

The other callers of task_stack_end_corrupted() are left as they are.
They have never depended on CONFIG_SCHED_STACK_END_CHECK, and they only
look at the magic once an oops or a might_sleep() report is already
being printed, or when the stack tracer records a new maximum.

Signed-off-by: Chris Down <chris@chrisdown.name>
---
 .../admin-guide/kernel-parameters.txt         |  8 +++++
 kernel/sched/core.c                           | 33 +++++++++++++++----
 2 files changed, 35 insertions(+), 6 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 0b3c140babd9..c106f744b5a4 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -6825,6 +6825,14 @@ Kernel parameters
 			core priority to both SMT siblings, so this option
 			does not favor either sibling.
 
+	sched_stack_end_check= [KNL]
+			Format: <bool>
+			Check the magic value at the end of the outgoing
+			task's stack (and its shadow call stack, if any) on
+			every call to schedule(), and panic if it has been
+			overwritten.
+			Default set by CONFIG_SCHED_STACK_END_CHECK.
+
 	sched_verbose	[KNL,EARLY] Enables verbose scheduler debug messages.
 
 	schedstats=	[KNL,X86] Enable or disable scheduled statistics.
diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 175b52a7ea79..9e5b3c62c697 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -6144,18 +6144,39 @@ static noinline void __schedule_bug(struct task_struct *prev)
 	add_taint(TAINT_WARN, LOCKDEP_STILL_OK);
 }
 
+static DEFINE_STATIC_KEY_MAYBE_RO(CONFIG_SCHED_STACK_END_CHECK, sched_stack_end_check);
+
+static int __init setup_sched_stack_end_check(char *str)
+{
+	bool enable;
+
+	if (kstrtobool(str, &enable)) {
+		pr_warn("Unable to parse sched_stack_end_check=\n");
+		return 1;
+	}
+
+	if (enable)
+		static_branch_enable(&sched_stack_end_check);
+	else
+		static_branch_disable(&sched_stack_end_check);
+
+	return 1;
+}
+__setup("sched_stack_end_check=", setup_sched_stack_end_check);
+
 /*
  * Various schedule()-time debugging checks and statistics:
  */
 static inline void schedule_debug(struct task_struct *prev, bool preempt)
 {
-#ifdef CONFIG_SCHED_STACK_END_CHECK
-	if (task_stack_end_corrupted(prev))
-		panic("corrupted stack end detected inside scheduler\n");
+	if (static_branch_maybe(CONFIG_SCHED_STACK_END_CHECK,
+				&sched_stack_end_check)) {
+		if (task_stack_end_corrupted(prev))
+			panic("corrupted stack end detected inside scheduler\n");
 
-	if (task_scs_end_corrupted(prev))
-		panic("corrupted shadow stack detected inside scheduler\n");
-#endif
+		if (task_scs_end_corrupted(prev))
+			panic("corrupted shadow stack detected inside scheduler\n");
+	}
 
 #ifdef CONFIG_DEBUG_ATOMIC_SLEEP
 	if (!preempt && READ_ONCE(prev->__state) && prev->non_block_count) {
-- 
2.56.1

