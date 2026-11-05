Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793896293;
	b=jTycFc1zSNqaeF+MFv9OZm0GHmoVAjxuzHdh5ZQWZ6OJ4qsY3UIJxF3t4JB2oV+kb9jK
	 GOsN0VqbTP02xIdGK8ilBK+MRdjJp4a9NQBeQBOZoN/TFp9ELqVznVjD0sdg1YXa5Z5Wk
	 ZkNDgAEq5VHravqD1Ma+KSffPFz1lmJV7wyGeLeqyFdr9q89fzfjfieiubQDQJcRq7eW3
	 Hm0BkqMqavcXiEOjurY0UeKCk4hLgDJ/i54xkxDVU11HQ+iW487Qsyo0US8KzdbJFcox0
	 60G8I/doXWEMHyMW7hgqOGKjdBD6+tZypOAsRXLigXEHsKXIRKIFx87ORmdXTVBB+iQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793896293;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=lydoqlofgTHvkbsz7ptq5J6gaNLPKqR9QGrM3BqHVhk=;
	b=pBocuCMPrDzT1YTLKpudsVVPguULIyHj3FRdXA40vAZTq2HXhupcVEddnSqj5sizfdon
	 K2tL+5k2fSQkEZsZMBuztFrDZK7kXjuFXAgypEUljp8CCP1qmw4ZrImo/16UuVR82tcsX
	 FcTQ30Ts8oLol3X7Jg5dCzpNnygn0q102pFVYd4d7U0KQYFnbIuBJ/7Bi3kGS+5/Fceg3
	 +S/IF+SfC1qIrgQcE+o+YdEZqh4yehQJ34CyoaePWHMJRqku6YVKJkS1jkr5rTkCp47vg
	 E+qIsRJf5JhfTyE4mcWDhZXXJkwwa0KjcHD8VF3HnjSmBA5kmpT5fmZpuLJW61PHlDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="AIp/Ao2o";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D72A160A5BCF
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 16:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AIp/Ao2o
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA7591F00A16;
	Thu,  5 Nov 2026 16:31:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793896292;
	bh=lydoqlofgTHvkbsz7ptq5J6gaNLPKqR9QGrM3BqHVhk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=AIp/Ao2oco4sNyUs2JwHeussjN7xsaj7e5ueDDNMqXbWhraSHFcNTPjZY4Pu0ZdsS
	 kJnkxge7q2rghiSc1U9HF6Aer2iEMFJsmWSwKoQGMtDyqaW47JMxTYC0Fzj/uQ9cQm
	 KYEPu/Ae42ocL5bxM6JbEu5XyAp0bULyRs82aSmjyj03zPDwenbgUXpOvcB/0oSpJZ
	 5nqHSLLV9u442Ycu6JNLi7/Fk4J7WIJMAYpX1sluhhcZhLrxrj4LqF3KTyPIIr1UGl
	 uJ9GfL6LOu9nSV6HCLfVEQDYJQdR1cwgVVTpNCoNWgizaMqOpmMq9XdP5R4vcv913R
	 u/NVCguMF6SaQ==
From: Frederic Weisbecker <frederic@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Frederic Weisbecker <frederic@kernel.org>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Phil Auld <pauld@redhat.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Waiman Long <longman@redhat.com>,
	"Paul E. McKenney" <paulmck@kernel.org>
Subject: [PATCH 13/47] cpu: Move [CPUHP_AP_PERF_X86_AMD_UNCORE_STARTING..CPUHP_AP_IRQ_RISCV_SBI_IPI_STARTING] range post stop_machine()
Date: Thu,  5 Nov 2026 17:30:11 +0100
Message-ID: <20261105163045.38862-14-frederic@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261105163045.38862-1-frederic@kernel.org>
References: <20261105163045.38862-1-frederic@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Between CPUHP_TEARDOWN_CPU and CPUHP_AP_OFFLINE, stop_machine executes
all the teardown callbacks while stopping all CPUs in the system. This
doesn't mix-up well with running RT or isolated tasks.

In order to transition smoothly from global stop_machine to finer
grained synchronization between teardown callbacks and the other CPUs,
a new stop machine post function has been introduced to be executed
after the main one with IRQs still disabled while other CPUs can exit
stop_machine().

None of the states here have teardown callback.

Move them to post stop_machine() accordingly.

Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
---
 kernel/cpu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/cpu.c b/kernel/cpu.c
index 151e4d9673b9..2dd34a38f878 100644
--- a/kernel/cpu.c
+++ b/kernel/cpu.c
@@ -1275,7 +1275,7 @@ void clear_tasks_mm_cpumask(int cpu)
 static int take_cpu_down(void *_param)
 {
 	struct cpuhp_cpu_state *st = this_cpu_ptr(&cpuhp_state);
-	enum cpuhp_state target = max((int)st->target, CPUHP_AP_IRQ_RISCV_IMSIC_STARTING);
+	enum cpuhp_state target = max((int)st->target, CPUHP_AP_PERF_X86_AMD_UNCORE_STARTING);
 	int err, cpu = smp_processor_id();
 
 	/* Ensure this CPU doesn't handle any more interrupts. */
@@ -1303,7 +1303,7 @@ static int take_cpu_down_post(void *_param)
 	enum cpuhp_state target = max((int)st->target, CPUHP_AP_OFFLINE);
 	int cpu = smp_processor_id();
 
-	WARN_ON(st->state != CPUHP_AP_IRQ_RISCV_IMSIC_STARTING);
+	WARN_ON(st->state != CPUHP_AP_PERF_X86_AMD_UNCORE_STARTING);
 	/*
 	 * Invoke the former CPU_DYING callbacks. DYING must not fail!
 	 */
-- 
2.53.0

