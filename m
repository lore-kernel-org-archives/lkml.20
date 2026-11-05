Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793896385;
	b=FuXjRUwP/DvBWYbG9cJni26a8AbrMCgmnod2LVzs+22enDvWJ123aqr0Ke6hbFI1QeLM
	 5bRpDBfY6rop9oIZzy7eYklM8TWZL7C0zTvQIAY4E8PDRAYyQ0ZgGN4KJ0iBpoRyoxy05
	 WdgI6ANdKqyDNejqLomjxj8vcehT7vJov/TN++P92L9/CI7hVt4f6Rz49buRma+v43Kmt
	 pBKJGRBesdWcD8V5ScU3PyrvYZp485CXpmhLeqoXOL61qj3O1AOcsGfc57GDpDT3NViFE
	 TX40zVK53nxtCl4/pSJuHx7Mqvs1Az4QF0PE/X2wDru0jyeDRXMVl4CDQ+JopczXL9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793896385;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=5L6tSYZHmUFQTenkaO9GoVCDVHsxk6J9I2uCdChoQgY=;
	b=wSZL+hFOWfkcmDD9Cn4WNzvCtqaRvG0XZ02tIGsOu+JTc2fUVk5dDgANNLHZOIetnfPo
	 AGfS7XI0qwkIG/a2UmiLX2FhSUJI0GYYZJ/H1Alj4pt8OXpreiHz8MAc19Z93q9Hf/dCg
	 gO8yC8d3Z45+08ynMPqCmMdF2p7OYFR83GmdcEVep6LLFeGhnU/zgsg7iJzagpPhiWSkS
	 8aAfB5nRS+2jsuTje1OLsuz4SNXw1t63qNzftAipFvqSSwIydCsVM+duyuky4MCk5TrFu
	 ueThW1PaC6MO4WYq4JnZYRVVMx6cqFIArTxmcoq4yH/+jFvc/tbOpQAOR5xUsgDnNVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QkGXUetY;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 788F4606F91C
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 16:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QkGXUetY
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 846111F00919;
	Thu,  5 Nov 2026 16:33:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793896385;
	bh=5L6tSYZHmUFQTenkaO9GoVCDVHsxk6J9I2uCdChoQgY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=QkGXUetYvn3oNMk+YsGy05oFMpbhW4VU8oqs1csWAL7u7Rktt+nX94v1b5fHr68X/
	 AJF01YeyYvcJz/BRAbpBFCf23un57aj5BkJkLipGAtwT+k5MmWmXRaqEs1dJVp/mZ3
	 l4nvbxAhsa96z3Tj9kGeOSaBtp/PY73gWUSXAadaawFVJEsOLpVWbJu997eqw5rAX5
	 XiBtea2YCWDDkkomRg+7eTYwp4isuQfjezpS6eNc4/N1O30/hexJJo2cPlziJVmqD+
	 iwSP2XdqobVzSH40cZqkaaCLK/gRqc8fKriMtbVtKfnZUvqFCX9vGzBOgAo1Oy0Ea6
	 uJDLEfCLxznrA==
From: Frederic Weisbecker <frederic@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Frederic Weisbecker <frederic@kernel.org>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Phil Auld <pauld@redhat.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Waiman Long <longman@redhat.com>,
	"Paul E. McKenney" <paulmck@kernel.org>
Subject: [PATCH 43/47] smp: Move CPUHP_AP_SMPCFD_DYING post stop_machine()
Date: Thu,  5 Nov 2026 17:30:41 +0100
Message-ID: <20261105163045.38862-44-frederic@kernel.org>
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

The outgoing CPU is observed as offline by other CPUs so no new IPI
are supposed to be queued at this stage and the remaining callbacks can
be executed while other CPUs are running, just like any online IPI
handling.

Move this teardown callback to post stop_machine() accordingly.

Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
---
 kernel/cpu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/cpu.c b/kernel/cpu.c
index f1672902dd2e..304a88fc7a62 100644
--- a/kernel/cpu.c
+++ b/kernel/cpu.c
@@ -1275,7 +1275,7 @@ void clear_tasks_mm_cpumask(int cpu)
 static int take_cpu_down(void *_param)
 {
 	struct cpuhp_cpu_state *st = this_cpu_ptr(&cpuhp_state);
-	enum cpuhp_state target = max((int)st->target, CPUHP_AP_ARM64_ISNDEP_STARTING);
+	enum cpuhp_state target = max((int)st->target, CPUHP_AP_SMPCFD_DYING);
 	int err, cpu = smp_processor_id();
 
 	/* Ensure this CPU doesn't handle any more interrupts. */
@@ -1303,7 +1303,7 @@ static int take_cpu_down_post(void *_param)
 	enum cpuhp_state target = max((int)st->target, CPUHP_AP_OFFLINE);
 	int cpu = smp_processor_id();
 
-	WARN_ON(st->state != CPUHP_AP_ARM64_ISNDEP_STARTING);
+	WARN_ON(st->state != CPUHP_AP_SMPCFD_DYING);
 	/*
 	 * Invoke the former CPU_DYING callbacks. DYING must not fail!
 	 */
-- 
2.53.0

