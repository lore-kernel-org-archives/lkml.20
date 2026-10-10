Received: from sender6-pp-o94.zoho.com (sender6-pp-o94.zoho.com [165.173.180.94])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D53A45DF47
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 12:58:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=165.173.180.94
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791637093; cv=pass; b=FMyuKAA7z8LI4FHnvbSV8IQPltOzYyWViY6H+rdQP2qcHyNYicOuWgPkp6z7p4k8chdBAZiC5eDxhOGQ1VmC/MHB2wOs1/bC3drS3dpsMA6u/m6EBAAjaUPPMgmrNutzzYAt6LqBj7dYA1hR1YgYfCKJQhnkXg6800RMhD1MnYo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791637093; c=relaxed/simple;
	bh=wrZhGUsiiNXQ4Gchr0k7BiEOVJ+TlRZFa4sBS+Eepa8=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=YHzVtHoTzsZxVxvsP4wuvspF7hMibXasiwSoONbzsFwKFrco7xdNR6pJJ594EVfMLKhTNxsytsfC0nbEa6xXySkAsVj6J2KEk0XU+Jzezhm8tk04tenzPSKoCqDGKSskal1zKZo1qeUrFedHBmZnU3MAJLPstbYtcl+oCK2o8eo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zohomail.com; spf=pass smtp.mailfrom=zohomail.com; dkim=pass (1024-bit key) header.d=zohomail.com header.i=kingxukai@zohomail.com header.b=ABn7qr+E; arc=pass smtp.client-ip=165.173.180.94
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zohomail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zohomail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=zohomail.com header.i=kingxukai@zohomail.com header.b="ABn7qr+E"
ARC-Seal: i=1; a=rsa-sha256; t=1791637065; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Jb6sd5qHme/lI/8iCoG0AQbQ98TeUFmUPQAA1bg0+BKomXO4b05CXX66HuhjsJ3wqMEg1vDGXk9m1HrFT+abUxDp7ZzxWFJRTmxV0l5wXbm2c3wJRoLoWRhB4gTgyn61zTKTf+f0+d3OngtD3lIEQ2Yr2uTNwtX2PtMtmaViVXQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1791637065; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=w8X3j8YkiU5UbqKNTiwAj+5Bv7i4u7iPRErRQP5qoz4=; 
	b=iT6FYAjd7jd+CQKpcDrUL+UBJEhWfuc56Tbk3bpusXlYsrbpjlO1Jnt3LE/RR5on2QqrfPdxHTPSHvZ4nmaDF87G78n9uWB8bJ9YiQyFkv0FfhJx+IRIuqyIUsNSqYoiGYbWD0W1CcM8aZReI3RSrK/eNJMPw8oT1bEIhHbNDZk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=zohomail.com;
	spf=pass  smtp.mailfrom=kingxukai@zohomail.com;
	dmarc=pass header.from=<kingxukai@zohomail.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1791637065;
	s=zm2022; d=zohomail.com; i=kingxukai@zohomail.com;
	h=Message-ID:Date:Date:MIME-Version:From:From:Subject:Subject:To:To:Cc:Cc:In-Reply-To:Content-Type:Content-Transfer-Encoding:Feedback-ID:Message-Id:Reply-To;
	bh=w8X3j8YkiU5UbqKNTiwAj+5Bv7i4u7iPRErRQP5qoz4=;
	b=ABn7qr+ECpc3BP7u8RBrlyK49bGk5k1m7H001F8ZNHcMaZN0R1p9ZEXNY7HtfNX7
	c+MlwPtsG4DN+WYOv01QxACKL/+ft8q7aBkmsr6p9gJK2r6xjLA2GKTFmdqB9hg1N7Z
	Y+B5NJA6HfcWvdH6S9LgMnM6lX4hPyb48lN9Uq98=
Received: by smtp.zohomail.com with SMTPS id 1791637062640939.5974684213551;
	Sat, 10 Oct 2026 05:57:42 -0700 (PDT)
Message-ID: <0fe8a0fe-68f5-467b-be82-cf631e00fd87@zohomail.com>
Date: Sat, 10 Oct 2026 20:57:32 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Xukai Wang <kingxukai@zohomail.com>
Subject: Re: [PATCH RFC v3] sched/proxy: Defer donor commit until after proxy
 resolution
To: Ingo Molnar <mingo@redhat.com>, John Stultz <jstultz@google.com>,
 Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>,
 Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>,
 K Prateek Nayak <kprateek.nayak@amd.com>
Cc: linux-kernel@vger.kernel.org
References: <20260827-sched-proxy-v3-1-1af63ac5ae56@zohomail.com>
Content-Language: en-US
In-Reply-To: <20260827-sched-proxy-v3-1-1af63ac5ae56@zohomail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Feedback-ID: zu08011227d64cbb048e3a95216d9c056c0000cb62a0ce78bd8140efb47b35fd5287a8e14f2044a2e03a3c4e:ZohoMail
X-Zoho-CM-AccountID: 2ee5dd3c83366259b2ba1e9826250ffebed1ef2dd213857d649ad25aba73b429
X-ZohoMailClient: External

Hi Prateek, John, all,

Quick ping on the v3 defer-donor-commit patch. Following up on John's
questions from the v2 review -- specifically what the real impact of this
change is and whether it's measurable -- I've collected targeted
measurements of the put_prev_set_next_task() overhead on the donor commit
path.

1. Test setup

I ran John's priority-inversion-demo workload [1] 3 times per kernel on a
bare-metal x86 system.

I instrumented the two scheduling-class callbacks invoked by
put_prev_set_next_task() on the donor commit path:

/* around put_prev_task() */
t0 = local_clock();
prev->sched_class->put_prev_task(...);
t1 = local_clock();

put_calls++;
put_total_ns += t1 - t0;

/* around set_next_task() */
t0 = local_clock();
next->sched_class->set_next_task(...);
t1 = local_clock();

set_calls++;
set_total_ns += t1 - t0;

I also calibrated the overhead of an empty local_clock() pair (minimum
15ns observed on this machine) and subtracted that per-call from the
measured totals.

t0 = local_clock();
t1 = local_clock();

The adjusted times below subtract that value once per measured callback:

adjusted_total = raw_total - nr_calls * 15 ns

2. Results
2.1 callback invocations

Combined across 3 runs:

                  Baseline    v3 patch
  put_prev_task   49037       8968
  set_next_task   49037       8968

That is an 81.7% reduction in scheduling-class callback invocations
from the donor commit path.


2.2 callback execution time

Adjusted total time spent in these callbacks per workload run:

            Baseline    v3 patch
  Run 1     11.131 ms   2.361 ms
  Run 2     11.157 ms   2.548 ms
  Run 3     11.578 ms   2.642 ms
  Average   ~11.29 ms   ~2.52 ms

For reference, a single idle -> fair transition (the common case in these
runs) costs ~0.69 µs on baseline:
  put_prev_task(idle):  142-154 ns
  set_next_task(fair):  503-557 ns

3.End-to-End latency

I also ran uninstrumented kernels to check full workload end-to-end
impact. I did not observe a consistent stable shift:
  p99  latency: ~5.00 ms on both baseline and v3
  p999 latency: ~9.00 ms on both baseline and v3

The reduction above amounts to about 8.8 ms of scheduling-class callback
time per workload run. This local reduction did not translate into a
stable end-to-end latency shift in this workload.

So the measurable effect is at the donor commit point itself: deferring
the commit reduced the number of put_prev_task()/set_next_task() callback
invocations by 81.7%, with the measured callback time at that point
dropping from about 11.29 ms to 2.52 ms per workload run.

Separately from the measured cost, this also places the scheduling-class
state commit after the donor has survived proxy resolution, rather than
committing state for a candidate that may subsequently be abandoned.

I'd appreciate your thoughts on whether these measurements address the
concern from v2, and whether there are any changes you'd like to see for
v4.

LINK: https://github.com/johnstultz-work/priority-inversion-demo [1]

