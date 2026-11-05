Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793901986;
	b=Eo/AuNlAdJ3ZPhZ67iu4INqG2P+FfWIaRyZL8ohdSKQT2qy2Z0g0KxXA38EzXa6XAnui
	 V3jLX0jHl4pJ9qhvwliDWOH3kUwmegjIBZcM74fi+Tn9ydH5mLa7tQkuEDVG1JNTM9PMc
	 2caBeLClR3yUhqBuO/JZDVGeLPg5o2gRMJk8hxNJA8b/1o9tZwqqAXCfh8/2QXaHkngso
	 Dfv7Pc9iE7ly143gg3EAYcCFdGheuZK2thXvGhsQa1KnD2AXTcKAeSiHt8+s/XqqRrpyw
	 2kiz9RBgKmxXhvZfRMGIuso8YpVjD8I97akcVxo/jXgcV630FHuswzeTmdSWiWjUQwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793901986;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Message-ID:Subject:
	 From:To:Cc:Date:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=/6J+frI1Yk2BTzBcb0VYBHi1ahJRHRxPwXnBmKId1V8=;
	b=XxvEYSfLSPyuNGKCepyf7jOedNWVg9bA4qqSmttX72IdIc2jztp8+e9L2XrpMOA7M4BK
	 jU50EaBWrv9RmyBCq/jigvtXk/1aSDVBDAhfr+kj5CDvvpFs/UrVZpVw/k1+xRO3E/xrP
	 V6B5VuIYiNVaqP+hoZ3cpEC3ic8XRL94wR3XEY0ZvBTCZDbNQhiTN5y/x47UFGKRMmuk5
	 rcIX7WFTVpdylvsMt1gtz3BOuReB9IuX2il8pBj/U4bSOiEQ/dXFrhtnMXHgLoLuSc8mB
	 6xiyN8iv/c1HHXBkCcSEXzxJqYc2QvMQMf1OxCakSBRAzZWY+OwKG7M0eQXEqA2Wv4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="fK//3Fwr";
	arc=none smtp.remote-ip=192.198.163.16
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45144606A326
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 18:06:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 45144606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fK//3Fwr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793901986; x=1825437986;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=sgSWHNvz3KFGzPu/3vty6BTvMhB+j0/bl/igUaNMMps=;
  b=fK//3FwrdV1i/FTWcscWuHw8XxZCZQqqYa2xZXJv8QuentbZIGQCNPr4
   ZW9oXNLdJlMuII6T3PNOL/dwUJ8NNpGiMlbpvXr8nZz0Vz+6AcpV8zfoF
   KifN+swAuHQPWZuQ45Yzj8Ym3/CE7VgXWj5gWRR2EOFbBl1kS7+YEcay+
   lln5ZTmfRh9dCul4gj8O1XMeGyJdw5/LV3xN6wUxKobJio60IGN/sM4eW
   ZhGa9CvNslZZhJayjC0Wxv9OzcFj7IMQfSS7L9U+8NEaeethjVfjGYzJp
   I3lWBr4OAmMNCVqfvSE8PXVJM+qpCOxd5kwAsQoG+pquNHLuz3gOLu6Vr
   Q==;
X-CSE-ConnectionGUID: AtyfwHkxR7mf0Nv2TsPrBw==
X-CSE-MsgGUID: o4XQBl7/Sha8dixJfhXS6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2725588"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2725588"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 10:06:25 -0800
X-CSE-ConnectionGUID: Qyg3bpGaTtmXnyQY4FQ5Tg==
X-CSE-MsgGUID: nFKbrIKPQaCKSr9x/RF7ww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="8831179"
Received: from unknown (HELO [10.241.242.209]) ([10.241.242.209])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 10:06:25 -0800
Message-ID: <804c415ed6c1111674577cd24431706a742f5825.camel@linux.intel.com>
Subject: Re: [PATCH v4] sched/fair: Replace random newidle_balance with
 Bresenham accumulator
From: Tim Chen <tim.c.chen@linux.intel.com>
To: Qing Wang <wangqing7171@gmail.com>, Ingo Molnar <mingo@redhat.com>, 
 Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>,
 Vincent Guittot	 <vincent.guittot@linaro.org>, Dietmar Eggemann
 <dietmar.eggemann@arm.com>,  Steven Rostedt <rostedt@goodmis.org>, Ben
 Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, Valentin
 Schneider <vschneid@redhat.com>, K Prateek Nayak <kprateek.nayak@amd.com>
Cc: Chen Yu <yu.c.chen@intel.com>, Davi Chaves Azevedo
 <davichazbh@gmail.com>, 	linux-kernel@vger.kernel.org
Date: Thu, 05 Nov 2026 10:06:24 -0800
In-Reply-To: <20261030091946.2498870-1-wangqing7171@gmail.com>
References: <20261030091946.2498870-1-wangqing7171@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.1 (3.58.1-1.fc43) 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Fri, 2026-10-30 at 17:19 +0800, Qing Wang wrote:
> The current NI_RANDOM implementation uses a random dice roll to allow
> newidle_balance attempts according to the success rate. This can be
> replaced with a Bresenham accumulator.
>=20
> Replace the random dice with a Bresenham accumulator. Each step does
> the following:
>   - Accumulate (1 + newidle_ratio) into newidle_window_pos(accumulator).
>   - If the accumulator reaches 1024, allow the balance attempt and
>     subtract 1024.
>=20
> Why Bresenham:
> 1. It is deterministic and reproducible. For a given ratio, the
>    balance frequency is exact and not subject to random variance,
>    which makes the behavior predictable when debugging or tracing.
> 2. Bresenham spaces the attempts evenly; the random dice can go for
>    a long stretch without balancing or fire several times in a row,
>    especially at low ratios.
>=20

Hi Qing,

I think the deterministic behavior is problematic:

newidle_ratio is not a fixed setting. It is learned from the balance
attempts we actually make: if those attempts pull tasks, the ratio
goes up and we try more often; if they fail, it goes down and we try
less often.

For that to work, the attempts must be a fair sample of all the
newidle calls. In other words, the call we pick must not be biased
towards the call that tend to fail. Random picks
guarantee this. Picking every Nth call does not, because workloads
often repeat in a regular pattern, and a fixed stride can line up
with that pattern.

A simple example. Say a task is available to pull on every 4th
newidle call, so the real success rate is 1/4. If the ratio drops to
0, Bresenham attempts exactly once every 1024 calls. 1024 is a
multiple of 4, so every attempt lands on the same position in the
pattern. If that position is one of the empty calls, every attempt
fails, the ratio stays at 0, and this domain stops balancing for
good, even though 1 in 4 calls could have pulled a task. With the
random dice, about 1 in 4 attempts hits a good call, and the ratio
climbs back to the right level.

The same thing happens between CPUs. Every CPU starts its accumulator
at the same value with the same ratio, so CPUs that go idle at the
same time will all balance together or all skip together. Random
picks keep the CPUs independent, so their balancing does not end up
synchronized.

So the variance of the random dice is the price we pay for an
unbiased estimate, and I think it is worth paying. Unless there is
benchmark data showing a clear benefit (so far Kayra's tbench numbers
are roughly neutral), I think it is better to keep NI_RANDOM as it is.

Thanks,
Tim
