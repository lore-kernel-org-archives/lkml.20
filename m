Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.102
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793711275;
	b=NjZ8vs2uRoHMR0NnDK/DQVdEkO0rna8mRyEdLIBFoiQF/qvpPiRrGyd1khvlC5iTpF4/
	 Haw/UM4NM+DBgbLR4bveyAX/vCtE6qPGHxoF0228N622P98dD+b17B+shNE85DB7oDwMo
	 aYs4gWYYeeTDBQdqJ/JOZZtWfHCRUVMUQQGTnRqTt3u5U0B8diDgqt+UPMyPm7Z8upoHi
	 E3XgZdeysC/pu5nag8Wif97TnnF05EOTAsV5VueeTYcRDSRHNg4USg03wOyAHXTEPBmNO
	 itYvlIc14lF26SpiP1Wt06T4OScqIlt38JO15reN633LHubIkrKGXlt5aLxNPZK7CBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793711275;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 Feedback-ID:X-Pm-Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=zW6mfRDfJlJujbvw1IGU4dhItJDWWt4lFHg3ixIXfNc=;
	b=oN58fH5sb+KzKQNgU8/cJyK1tAPrIyTmCCqKNcIEDhoolBiauUpGNOWsXy6Hl7oarYPe
	 E4hUmrdDxpDV84qfHJuRqoanYykrdSK5eIYwjOTH/9EeGPUdp7y1VzHQ0FU069Ii8zU1a
	 Te6LLz/VisxRw8wuYubpkNtoV3hMNzvtpilI3iBCU1EOo7Ew/914TCsyNLDTRpL0j3xG1
	 LkSPoqeNkQ36nC86kcdYL7ac/r2OnECXJNBYwekaVCTYZz9FhYU9hX+fAwIy+wfBXB+oI
	 RmlT4Irjq8O8mHYGjp3eyCmuHV+FmOR1Wi5Lfvkt+T1bIJQZfn34T0O3tIFCyH3DH+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=proton.me;
	spf=pass smtp.mailfrom=proton.me;
	dkim=pass header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=iqCzK0sc;
	arc=none smtp.remote-ip=185.70.43.102
Received: from mail-43102.protonmail.ch (mail-43102.protonmail.ch [185.70.43.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1756C606D805
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 13:07:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1756C606D805
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=iqCzK0sc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail2; t=1793711271; x=1793970471;
	bh=zW6mfRDfJlJujbvw1IGU4dhItJDWWt4lFHg3ixIXfNc=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=iqCzK0sc7cecORzDmY3YWfT5hLlIEjoJA6u80pAONmYNHB6PUjlxR4C2E/mV4SFs1
	 uGCKeFcrBFBXgC1TzTk+VbkD+jBjepV9clKS8SsfZXsZdAxqgR8WDVzvpzA6lb+FRd
	 lPy/fD63GhNciaLjtIqflt+L5mOgzG6eGdBBb3NY+hFrmfbg9XeDPjURob9scBI1e6
	 hiDfXXLcSYDu9Tij7TaJZztU4h+0ck5rfWRIJ7J71xcam9fjxpkqnwj1t5zwNtlMzX
	 pid9Kj1LeyhzARMLaM2YazATJN4fa2WPd2evwiU2QDZQTXUlZEKvsx9ElsujCTllj8
	 40H3fIPmMkD6g==
Date: Tue, 03 Nov 2026 13:07:42 +0000
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>
From: Paolo Bertinetti <paolobertinetti200f4@proton.me>
Cc: Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, Kan Liang <kan.liang@linux.intel.com>, Leo Yan <leo.yan@arm.com>, Francesco Nigro <nigro.fra@gmail.com>, Sumanth Korikkar <sumanthk@linux.ibm.com>, linux-perf-users@vger.kernel.org, linux-trace-kernel@vger.kernel.org, linux-kernel@vger.kernel.org, regressions@lists.linux.dev
Subject: [PATCH 0/2] perf: Fix PERF_EVENT_IOC_REFRESH for tracepoints and breakpoints
Message-ID: <20261103130732.764081-1-paolobertinetti200f4@proton.me>
Feedback-ID: 117280896:user:proton
X-Pm-Message-ID: 2045d11603ba2f0177be2f8a7bfbb574cb29152f
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Since commit 18dbcbfabfff ("perf: Fix the POLL_HUP delivery breakage"),
an event that reaches its PERF_EVENT_IOC_REFRESH limit is stopped with
pmu->stop() and disabled. Re-arming it adds it back with PERF_EF_START,
but perf_trace_add() and hw_breakpoint_add() never clear
PERF_HES_STOPPED. Tracepoint, kprobe, uprobe and breakpoint events
re-armed this way deliver only their first overflow. Francesco reported
it with the "Event re-armed with PERF_EVENT_IOC_REFRESH" perf test,
found through an async-profiler bug.

These patches make both PMUs set the state from PERF_EF_START on every
add, as perf_swevent_add() does. The pmu->stop() call stays, so the
POLL_HUP fix of 18dbcbfabfff is kept.

Leo's series [1] removes that pmu->stop() call instead, which also
avoids this, and is still pending. Either way, add() with PERF_EF_START
should start the event.

Tested in QEMU/KVM, x86_64, 4 vCPUs, v7.4-rc1 with PROVE_LOCKING:

- perf test "Event re-armed with PERF_EVENT_IOC_REFRESH": the tracepoint
  case goes from FAILED (count 1, 1 overflow) to Ok (count 1000, 1000
  POLL_HUP signals).

- A small test that re-arms each event from its signal handler and
  triggers it 200 times, overflows delivered:

                 v7.4-rc1   + patch 1   + patch 2
    tracepoint       1         200         200
    kprobe           1         200         200
    uprobe           1         200         200
    breakpoint       1           1         200

- The full perf test suite and tools/testing/selftests/perf_events give
  the same results before and after, apart from the REFRESH test. Many
  perf tests fail in my VM on both kernels, for setup reasons.

- No lockdep or other warnings in dmesg.

I can add kprobe, uprobe and breakpoint cases to the perf test if that
helps.

[1] https://lore.kernel.org/r/20260514-arm_cs_clean_perf_handle-v2-0-cbb29c=
3b3661@arm.com/

Paolo Bertinetti (2):
  tracing/perf: Clear stop state in perf_trace_add()
  perf/hw_breakpoint: Clear stop state in hw_breakpoint_add()

 kernel/events/hw_breakpoint.c   | 3 +--
 kernel/trace/trace_event_perf.c | 3 +--
 2 files changed, 2 insertions(+), 4 deletions(-)


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
--=20
2.53.0


