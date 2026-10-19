Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D30551120F
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 13:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792415464; cv=none; b=QyYzggxJbV3DgHA+o82L37eNN5/UgYH+asl1c3MW2tp7cgo4jz6x+kj3ek14Yod9peWO/Il6wUdiIMzZeCE2NPu4ygqBahpRdHeoo/OPbcpqyFb6aZ7HKvNTPcZnmulHHL7IPVQggSuMsNZEeRi6Dq/rn9zCAnJm9oibuLXS3Ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792415464; c=relaxed/simple;
	bh=zuuRLtXQRnAriTMnXIszbBuRdBjwjS22i5X7gO80iN8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cWEuVoiD6K9KfiKVyb/JGAsPeFIF2D3b4Bl2oMM2brZGAS4lLNOe0hUukRkFJzDK7s18YiPJcNfZBHZA26aZ+dDg/BikaQe5bl4ykfhl0dzF1QiHzbupbspbDvo2IiG3Ty/QPHANd7LkDvJDD02IGy95McGFoVheZIq97cwhkSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CzHYCm2V; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CzHYCm2V"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC1B71F000C7;
	Mon, 19 Oct 2026 13:11:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792415463;
	bh=00ALhdrYDTfB9shpIDXwNm+/KmCDnWWqyzlUN/XfTUo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=CzHYCm2VzqU+45sKiQDVuaXpHXIKTVratlzfxIC2nKTsJcLBnOtKuPjXOTNimZtnF
	 2TQIqspQnqS58b0i/WggpdYFxjZwJWtQ0pb6xFZSlwfXciaj8Ms4e1PRe9e7uoDavF
	 qAPALqPw9IVWDZAyPNEeyKyK03J1ckz/2wYusuXhjtLtaVMOHVqHzP0cmFpUsyIjaJ
	 GP9eEm/RoEmH018WZOew1GOsfg3iCqu+4nXwKC62TnxNMOZxKbrZw9sqTOGg4FXlfp
	 AtYjoIGSaEkTL+5fyhtWNgALD4deRDfach9Gg8YqxU1RKi1delS/80bVkfG4JA9Y+1
	 LzV88aTux+shA==
From: Frederic Weisbecker <frederic@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Frederic Weisbecker <frederic@kernel.org>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Phil Auld <pauld@redhat.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Waiman Long <longman@redhat.com>
Subject: [RFC PATCH 43/49] smp: Move CPUHP_AP_SMPCFD_DYING post stop_machine()
Date: Mon, 19 Oct 2026 15:08:50 +0200
Message-ID: <20261019130856.49711-44-frederic@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261019130856.49711-1-frederic@kernel.org>
References: <20261019130856.49711-1-frederic@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
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
index c27e4aa109ba..4b3fcab1575c 100644
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

