Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793082987;
	b=x9NkUzKIksXKYo9J3REUQQ846iwsnR+GED5TR95cvYbu9OEuyyoQHczLMByUQxje2kJg
	 qQcGOmPdCSBSXnDlYe9zit+Hk4EKqhIktCkWPRHGMAwPyLUje+xteffEDK7+Ho5xyL1qJ
	 CqGRqW9wPE9mBt2yaRHips2ipccH78FWL8pjcWJ9At4hSvSiAUBUJ/wvRxL0kd3l6xPxd
	 TVNzB3JOrpNqb3YBAlGdaZVwAa+CfKLkiK6lAfO/0jIVLSYIuIV7Fv2zIrvPYK1yZORSZ
	 wWS2fv0Txpl/QignOwz+WjivQEPGOrZkqk4bDO5y9rlWG1Uk2qLL5YWz7yQLOXPZQwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793082987;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:User-Agent;
	bh=jw0B9wUqj1NgmgC61ADFFOy+zq/xWh/Ds6uCN7rNkRA=;
	b=ZaRW0kiKJtRdnxW872H2dv+6qNnJCTjau9AculI6RwWzKqC7ZaGzsRRTqAooPwThUv7v
	 Y6WlvV4CtvYLSbZHElV2r4iCIP2JYkoj/9lcB+5XMYzUQ7S0pCy2Uf3jfSXfNaZAoHvI5
	 9pp8SoiMtLRSzWDqvB6IMHPaJUTlXzIRcbukONlMfpdRdPAMWTWs0zZuWiAxS4WJ+/J1l
	 upsLavicFFhWEwWE/GRpghMWIDvkdTZRpm/OXlhg6ANQiCNgG/jIIOWd3i7a8ezIsbyOy
	 gzUHhmp4+lk1P2NPAxzN/Isf/pagrx0RxieKLZaWR9vxg8adIYAOlyNwQlz/BXRQMwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=A18XSYRR;
	arc=none smtp.remote-ip=209.85.214.177
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73295606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 06:36:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73295606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=A18XSYRR
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2e98798cbddso15021735ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 23:36:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1793082987; x=1793687787; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=jw0B9wUqj1NgmgC61ADFFOy+zq/xWh/Ds6uCN7rNkRA=;
        b=A18XSYRRAxSuAWoSFewKd3fToOwP31OZQcX8t96ooeQ0af1YK4YGm0a0Mh+VR4Ds3o
         KKXgJL7g9xHxAyYHn75yn3/px3xvE1TgYAHBlEqBP5CKh3xWxNqIP6X9Lo4mtgJNKz2j
         ka1lAlUYD/xQECFuOO9WSinqPf3RjRE1sqS5o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793082987; x=1793687787;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jw0B9wUqj1NgmgC61ADFFOy+zq/xWh/Ds6uCN7rNkRA=;
        b=TDhR2kN/IxS1KjaDQbZNfM/q9ykCVbJ5vJiwpcJUWF1vi1yuNlkQkSuTS8acaDMZiz
         P01zN+FSv6RnZGkep9zVSDe7j9LIK8GnOS8L7ambQxTgeN3KqjqbvIdVH2/f9q6viyyl
         kXAErVMe8177cOlMJ8N3Cl8snAFSet1gMc0UFE0zThH2amojKyckSBxPQOOymTobp7U0
         qnB3yYv/U6gwheSKcGu9JJthZZ3jnsAXXaJduWnW3U1dcYbbwnbvD0bgZHMpsRMk9Hvk
         knO6vWZ5k3vUr1/SlHC1jVZRX4oX8FO09QfR3UVt0dlJF/UQIU2sZt5lUtUtC+8Zlmc/
         W5Xw==
X-Forwarded-Encrypted: i=1; AKwUvBzbZL3MbndbmXTAw3gnZw4y8bJz4qzoxTkGF8tCj85izn5KaOiQTsODSvc+Fjd7911S8+OdXVMaiJDaHHo=@vger.kernel.org
X-Gm-Message-State: AFq9FYIZB+PJymPHonzR35Q+iojoIKAWhauQcmjXivsDJCV3vg9OMXKy
	LFu/JLn90ALJEm5/JBUmtGuIW2Gf7Ufr5sku/VxUyPFSnTY7UHSJ3BoYHUbu1uZ7ed8=
X-Gm-Gg: AYBFou1Z7AN2oPFZpCzdnt2v1pRzLp7UyH7xMqOQlc1YpOBv39rE0He/5eMzgMw7tHe
	lBYKJukkIxl/KOkIk5q1BkO0JtHytRUgYYxgmPAGMHz9M1VEnUUKRT191K0SRlOWdf9eUS0XDbC
	7AhreAGx4tGd29lILRhd1FrlFxlNpe8S5z1wVfFXM1cLrwMBvaiSh0iYEOV8zv4tZeWrwX70vBm
	+ibIeq6Q6u3YgjVO8oTddb7hdKcXh7a3YGUcaDXyeKYk9QnBxD49Zziw5x1QMrMu1eI1m4pwKAV
	6U48FW1+77koTE1JFo70XWMz2WrmafJJW4SGF36DonsWqeVZVg2pqEqpQnrt16IaZbLe0uvSCPK
	Q2gWFZVYDoYucxoEUDDMEnhrfXJI5chqDV9yRvzUcf6QESQXvRGAZeX0QsrkPUlhPN52GPrCSQy
	YFF4NSSS34X5aObpeRULElZHHg8iu0awSzpd9R5igpnTsKf3VUch8ukCZei4vTSIwpmtmRdKxIt
	l9bkjoPnvjVu2c3IFzn0YIzLOztYhAMq2tk4RV1YI3QPnbVf+Zg+QIJHZLC6FkfmbO//oo9bPnv
	8jSgMa4WsY8XHsfBgu+We72SC8fgHmGeOTrmDSVdYLyvdSAblD7LQu7jN/O6umLeIiRgZNO64ag
	nBx3VVZz1zUOmtBPok40RaoUwj++7P+QP+khvFAtjS8YgewN0tkGtXZh54soqXkcFTtnaByqG
X-Received: by 2002:a17:903:3806:b0:2e9:5175:2eb with SMTP id d9443c01a7336-2ea9c0f388fmr74433055ad.1.1793082986640;
        Mon, 26 Oct 2026 23:36:26 -0700 (PDT)
Received: from localhost ([116.86.153.182])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6b768ffsm4180085ad.24.2026.10.26.23.36.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 23:36:25 -0700 (PDT)
Date: Tue, 27 Oct 2026 14:36:21 +0800
From: Chris Down <chris@chrisdown.name>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
	Kees Cook <kees@kernel.org>
Cc: Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Ard Biesheuvel <ardb@kernel.org>, Will Deacon <will@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-team@meta.com
Subject: [PATCH 2/3] sched/core: Add sched_stack_end_check= boot parameter
Message-ID: <3d2bb6a8508b9d801878bb82c88165a1b1ff5f40.1793082868.git.chris@chrisdown.name>
References: <cover.1793082868.git.chris@chrisdown.name>
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
In-Reply-To: <cover.1793082868.git.chris@chrisdown.name>
User-Agent: Mutt/2.3.3 (9073d26d) (2026-06-12)

CONFIG_SCHED_STACK_END_CHECK makes schedule_debug() check the magic at
the end of the outgoing task's stack and panic if it has been
overwritten.

Right now this can only be configured by setting the Kconfig option at
build time. At Meta we have it on for some hosts and off for others,
since it is helpful but adds cost on context switching. That means today
we have to build separate kernels for each, which is less than ideal.

So let's make this configurable at boot time. In benchmarking sched pipe
and sched messaging performance is unaffected.

Signed-off-by: Chris Down <chris@chrisdown.name>
---
 .../admin-guide/kernel-parameters.txt         |  8 +++++
 kernel/sched/core.c                           | 33 +++++++++++++++----
 2 files changed, 35 insertions(+), 6 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index fbee7b544903..95911d33c0fe 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -6811,6 +6811,14 @@ Kernel parameters
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
index fc269fd10192..c1fb86b813bb 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -6143,18 +6143,39 @@ static noinline void __schedule_bug(struct task_struct *prev)
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
+		return 0;
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
 
-	if (scs_is_enabled() && task_scs_end_corrupted(prev))
-		panic("corrupted shadow stack detected inside scheduler\n");
-#endif
+		if (scs_is_enabled() && task_scs_end_corrupted(prev))
+			panic("corrupted shadow stack detected inside scheduler\n");
+	}
 
 #ifdef CONFIG_DEBUG_ATOMIC_SLEEP
 	if (!preempt && READ_ONCE(prev->__state) && prev->non_block_count) {
-- 
2.54.0

