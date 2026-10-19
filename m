Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CC7E4FB9C8
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 13:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792415400; cv=none; b=mJO5Dz7grPpPo0ijqN+DiJHiuy2598mrSFf8OAJw1x+D/V0DsSdWUnNYDDy0rlZ4+LJTR2vMCuqS2Sb139E7Fegon9KRhAdOlkklDhC1C/Xavx5wvRHZQlKMaM9S4OpS6puG2RvlpyqMbh9styARck9nuqRnsJMgRRcjPQVqZVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792415400; c=relaxed/simple;
	bh=NGvtKHhXMdz2484lXHMzA9flYAwb5tjYBJqjVgpkkcs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Dfi7FvEP3WELY0PsxRkkR8va3P4BlqdrbqwJJ3uoVKf9SwpYJUTmp9SGnjwaVgtUXbj3x3OM1T4tRyhVPKzPM2mL0T9TMseePYkIe8D+zvElnQSaDE8bmaUQ7Ie6PpyU5J6iccn7Sj4jKmTYtgffK5dt3y1Fm7dHVAUmixGr6Qo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=im7vxNUw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="im7vxNUw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E84441F000C4;
	Mon, 19 Oct 2026 13:09:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792415398;
	bh=80019jhaFL1VnCBkI7efAX76oZGfNZ9/rOF9sP+sXx8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=im7vxNUwDKjSIDnMUKzgPeXGD0zJAS4/vCyaDQb6dBi+5sRYxYqG1VMC5j7TecGPE
	 uWTDlPMZHuLyNlaY7istJNPrPW2OyfyXY8hTN4l2/zdSGRYvVJNo3N9BCq9GAcTKNN
	 v2clJUoyuSH9jIBUbxVnzcJUPJXAxzIKml06C1+HIkSS7qryapWAROUz8OXJq3uaIk
	 noevpmbl5xFnOs9dbKvlImEdOTmWqmEEeKzrpIKtMulgzUqfcAn1DE90Jy3yGaf4Ii
	 Jgyy+tnJ5au5oFo+Oa78MxEstU9/r2gY4tlOR9IjKHH1HJ9RKscYxrCOn2KY6x6WKl
	 kz2lEkjIap+yw==
From: Frederic Weisbecker <frederic@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Frederic Weisbecker <frederic@kernel.org>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Phil Auld <pauld@redhat.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Waiman Long <longman@redhat.com>
Subject: [RFC PATCH 18/49] cpu: Move [CPUHP_AP_PERF_ARM_ACPI_STARTING..CPUHP_AP_ARM64_DEBUG_MONITORS_STARTING] range post stop_machine()
Date: Mon, 19 Oct 2026 15:08:25 +0200
Message-ID: <20261019130856.49711-19-frederic@kernel.org>
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

None of the states here have a teardown callback.

Move them to post stop_machine() accordingly.

Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
---
 kernel/cpu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/cpu.c b/kernel/cpu.c
index b7f5d0683ff7..7d7e2d1eda9b 100644
--- a/kernel/cpu.c
+++ b/kernel/cpu.c
@@ -1275,7 +1275,7 @@ void clear_tasks_mm_cpumask(int cpu)
 static int take_cpu_down(void *_param)
 {
 	struct cpuhp_cpu_state *st = this_cpu_ptr(&cpuhp_state);
-	enum cpuhp_state target = max((int)st->target, CPUHP_AP_ARM_VFP_STARTING);
+	enum cpuhp_state target = max((int)st->target, CPUHP_AP_PERF_ARM_ACPI_STARTING);
 	int err, cpu = smp_processor_id();
 
 	/* Ensure this CPU doesn't handle any more interrupts. */
@@ -1303,7 +1303,7 @@ static int take_cpu_down_post(void *_param)
 	enum cpuhp_state target = max((int)st->target, CPUHP_AP_OFFLINE);
 	int cpu = smp_processor_id();
 
-	WARN_ON(st->state != CPUHP_AP_ARM_VFP_STARTING);
+	WARN_ON(st->state != CPUHP_AP_PERF_ARM_ACPI_STARTING);
 	/*
 	 * Invoke the former CPU_DYING callbacks. DYING must not fail!
 	 */
-- 
2.53.0

