Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793896279;
	b=5QWa5bjmrzbgcP81G0x4PWRJk7eZhcNaTn7bDMa5oFlHxKs0Eu2JdDta4CamhSY/U6qN
	 nwM+KBYp58H3D84B9pKCNf96rU8Fev0YPqflMlV4IQnMvXPA/AgEYcAYD4WnRG18+5qGb
	 PSwpULH+HOr0bDXwHUaM8nLUGuExoSaDEPlmgzXNOvs9suFAwloKlLk7aUMpkK+BMc7R7
	 0ABgVi/Z8nh2Fsh5228qDtrW/hMM5Ll6gmuQ3SRw1OzyH0qsINwSqtqKImS9jx5Texbpk
	 nwRoi2R1VQ+/vvfe4/YAB+kTJc4sGMJECDzsgi2mifOsOkvfxKCPFsgZ1SphjFWxWDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793896279;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=XG2bD8xKa5tEFlZQADIZsQYpUjCTx+lKZ/Xbled234U=;
	b=OZPaKkw8W7BdQf5KD63aCzyfSeYFSSyvY+iesnOex3wfNSRool9KReK0qJN6uSPn0VST
	 D6pl5YbvkegMMbeIGLjVbjyY6Eb6LdUZEMy2H6dpI0b83M773w9/4rp7IbAAC03gbrxlG
	 xOVARegn+45gPgY3aoK9/gVdMVNYzGOV+klYSXyEUqyICNqp7MHjanN+vvHKC2KwXpTRI
	 eIdIRp/Y1sxOH/lpVhb35zKIsSS6SRQdlnZztBma0q523O+Jt7SADuImuuxmC8sstt817
	 X872yC/I/x6h8BY5TWxJnS+65+J39wGJXCmvRGs7p0oglsd5URiozZJF7VmBjeL5gaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=foWkJbrw;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80C5B60A3810
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 16:31:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=foWkJbrw
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48DCE1F00A18;
	Thu,  5 Nov 2026 16:31:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793896278;
	bh=XG2bD8xKa5tEFlZQADIZsQYpUjCTx+lKZ/Xbled234U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=foWkJbrw5nzh1b5TLlrS7DD7hYKjbOS796KHJeEyMScxQGwMRvzUKxf3xbLbUBA9U
	 z5c5pLzTykJyLW4jZ9SrQ9cQY/F3/BEcwIbGdNJO0wrVLVdCD/qPIHxFs9q/dWIFlj
	 nfMPpf/tRUdqcpr1outXF2oUSM/JaUqS3qYPy3PhIhbNzBM1BL7Hxc8LbQS4LKUPid
	 oEVArv/aGBIGbPD2JaXavAhGC0Vw9CF72lZHQf61n2A5ys8ZkahryJzo8tfvt/c28+
	 3eO6W76+yDnfBfa5a99xJPmIwDLUmWZh1mdh/DdlWKwzciBS2Qo5aAuLAbZVwA4Ro2
	 FwZOurUQ22JRQ==
From: Frederic Weisbecker <frederic@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Frederic Weisbecker <frederic@kernel.org>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Phil Auld <pauld@redhat.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Waiman Long <longman@redhat.com>,
	"Paul E. McKenney" <paulmck@kernel.org>
Subject: [PATCH 08/47] cpu: Move [CPUHP_AP_IRQ_EIOINTC_STARTING..CPUHP_AP_IRQ_MIPS_GIC_STARTING] range post stop_machine()
Date: Thu,  5 Nov 2026 17:30:06 +0100
Message-ID: <20261105163045.38862-9-frederic@kernel.org>
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

None of these states have teardown callback.

Move them to post stop_machine() accordingly.

Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
---
 kernel/cpu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/cpu.c b/kernel/cpu.c
index 2e162425bfc7..ac87ce01d77a 100644
--- a/kernel/cpu.c
+++ b/kernel/cpu.c
@@ -1275,7 +1275,7 @@ void clear_tasks_mm_cpumask(int cpu)
 static int take_cpu_down(void *_param)
 {
 	struct cpuhp_cpu_state *st = this_cpu_ptr(&cpuhp_state);
-	enum cpuhp_state target = max((int)st->target, CPUHP_AP_IRQ_BCM2836_STARTING);
+	enum cpuhp_state target = max((int)st->target, CPUHP_AP_IRQ_EIOINTC_STARTING);
 	int err, cpu = smp_processor_id();
 
 	/* Ensure this CPU doesn't handle any more interrupts. */
@@ -1303,7 +1303,7 @@ static int take_cpu_down_post(void *_param)
 	enum cpuhp_state target = max((int)st->target, CPUHP_AP_OFFLINE);
 	int cpu = smp_processor_id();
 
-	WARN_ON(st->state != CPUHP_AP_IRQ_BCM2836_STARTING);
+	WARN_ON(st->state != CPUHP_AP_IRQ_EIOINTC_STARTING);
 	/*
 	 * Invoke the former CPU_DYING callbacks. DYING must not fail!
 	 */
-- 
2.53.0

