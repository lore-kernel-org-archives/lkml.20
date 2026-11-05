Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793896313;
	b=OaIS5nwrahR41rau+E6XC74bBP3NKjWk6uPqEzVbKIpXEL44YNAgKvOzSKvhNU4RPOEw
	 haCMZko5Z9uk4oyumWOSU9TURFVFZiziEHGMH7dk2rt0fBs7rWcv8vyS/kSEGSsKfK1+y
	 jXCq/mhbNxkAZcuLC73rgiGJtkn/87VnJaIz4JwAnLDB8EZYF3h/LuiqJOV7IYJawKOuA
	 9l9li1EBJ4kQ2oxIreZtCdOOK7USQeg1PChLWAKAub5vdAYnbOpZIhG1X0TjWxxT23A5m
	 lrrPs2zLFkXcnHDn3gKAHtB486XmygNlwTIq8lyG1Gwf+nXoMmaWaQFn9NgpFpdFfjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793896313;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=4+NW3nMeNCUAJhkcVb/8LN072d4w6qe9vnBLqZWEFro=;
	b=xb6zCJ8Q38aBCFCLAO5a6vb2eQrMbFpN0UPmGFUCHtkR4KaPcLCDXdgPPQDxo/JZHtTT
	 eKYDBMtuZ414pUtk5IKuja1KUbzOXd1J9UnLzZKD5YSKtIwdaYCfldISjA1YMtQV0Zgw5
	 /BwyAF076j28JctDktCm2OYc3FAVNmER6Mp0tKz+rEMXqToswMBZYG/s3VDeJ1KA6W80a
	 mjUUdG1m7wruFzKWateix0ND4EJ0XhetrQIETYau5unpr0AiOjAwe8uHqeLzXBnvoWaTk
	 Ax0mveT04omFokEs4oS+2RNagB0pzD7dopVe9lyb5iDUbmtiVaXnL0AktUNJUoeU9AQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=I+ErrgoL;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B604C6082BDB
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 16:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=I+ErrgoL
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 696EE1F000C1;
	Thu,  5 Nov 2026 16:31:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793896312;
	bh=4+NW3nMeNCUAJhkcVb/8LN072d4w6qe9vnBLqZWEFro=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=I+ErrgoLMd4ovlhdAxe6ZQe0tms0lyRTwp9LGbNteZtZrNFNxuDP+yCPoSiJ7CGQ3
	 xdlgHkCU5xlPM+O5uyu9vQU8UVLwMtdg9ZAmdiS0/+2d4I/KiuTkLurVZGIbl4ZqJG
	 5wwFSM+K4h2FHMBBy1p9BYpWH1t5ikSvXN7JShxs25uZzmN+mMOXgWkV5SJQxGR78o
	 GBWuzNkHm4QrT7YEkkupEE7JBAGxtz3B+4NUF1476+izqCuh9+qj48wpUrN0FIrAh8
	 5IfD/SdQC7hAmUGFYBcP2E4iQ0r3xXxfpiTPa6pFkQDMzz0NtIZSdJ6fWgHd0Irwoh
	 5eUt94W96Ehwg==
From: Frederic Weisbecker <frederic@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Frederic Weisbecker <frederic@kernel.org>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Phil Auld <pauld@redhat.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Waiman Long <longman@redhat.com>,
	"Paul E. McKenney" <paulmck@kernel.org>
Subject: [PATCH 18/47] cpu: Move [CPUHP_AP_PERF_ARM_ACPI_STARTING..CPUHP_AP_ARM64_DEBUG_MONITORS_STARTING] range post stop_machine()
Date: Thu,  5 Nov 2026 17:30:16 +0100
Message-ID: <20261105163045.38862-19-frederic@kernel.org>
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

None of the states here have a teardown callback.

Move them to post stop_machine() accordingly.

Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
---
 kernel/cpu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/cpu.c b/kernel/cpu.c
index 4952a53e028b..37cca370794a 100644
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

