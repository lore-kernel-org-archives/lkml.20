Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C31AC3C4565
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 07:20:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788938449; cv=none; b=YfHiNIRcrOyo33SfvCqRpWtw7MWWJ6iMeOZI9jlorXxr/3cvdOUjyrmZeda6CRYZw0UkwjWpEL2nnZ/s2EnGsAGBxP1fWmblitgC62G6mmFzaIaMRTMHVwFgoH39C8cFpj1V3+QkN0P/IRiHEMvMKpfdo772/JNTZG3r1iw5O1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788938449; c=relaxed/simple;
	bh=HYah3uA+r1kGGwUj3wqj+G+RHCOLv0YNwo6nuTVfIPU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eitDYwsdcxXac41/SobaDq0BIJfk81q3le5b6Zx23e/TnMwY2UAr0PowBbckvBaIMZBFPwQnFV6Vkh+ccj0l357LML0vkuA2itFmxSW698Y6nymwlJB1TRTKA2tJ9bTj2sqK7PxIsst0F8g/MW+O+e0ypC1JqwneX04LSGabfqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=dQDQUeoy; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="dQDQUeoy"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 883F61576;
	Wed,  9 Sep 2026 00:20:36 -0700 (PDT)
Received: from [10.57.73.177] (unknown [10.57.73.177])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 23F153F7D8;
	Wed,  9 Sep 2026 00:20:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788938440; bh=HYah3uA+r1kGGwUj3wqj+G+RHCOLv0YNwo6nuTVfIPU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=dQDQUeoyd7rs5J3jJ2hcytzoFlCrUnuzWP/nB2QjLK0BzOhs9FoYIWjtpl4cvn6qQ
	 V6997eLToNmC4iplPw1+KazMVhObpi6NE1jR/Shmi2nrP7e8aR5/i1v3oAvusylahm
	 NVcSza6cWx3MNd86cbw8I3q7WzjD7IqJNeTmEkBc=
Message-ID: <c92baaa9-1c1a-4f1e-903e-7b98ec9f694c@arm.com>
Date: Wed, 9 Sep 2026 09:20:35 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/2] sched: Enable preferred SMT siblings on NVIDIA
 Olympus
To: Andrea Righi <arighi@nvidia.com>, Ingo Molnar <mingo@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>,
 Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>,
 K Prateek Nayak <kprateek.nayak@amd.com>, Mark Rutland
 <mark.rutland@arm.com>, Christian Loehle <christian.loehle@arm.com>,
 Shrikanth Hegde <sshegde@linux.ibm.com>, Phil Auld <pauld@redhat.com>,
 Breno Leitao <leitao@debian.org>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260908082345.103087-1-arighi@nvidia.com>
Content-Language: en-GB
From: Dietmar Eggemann <dietmar.eggemann@arm.com>
In-Reply-To: <20260908082345.103087-1-arighi@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08.09.26 10:23, Andrea Righi wrote:

[...]

> The series was tested on a two-node Vera system using an 88-thread
> single-precision GEMM on the 88 physical cores of NUMA node 0.

Can we use 'OpenBLAS benchmark/sgemm.goto' as an open alternative for
your NVIDIA internal single-precision GEMM benchmark?

IIUC, you used it for the 'Prefer fully idle cores for NOHZ balancing'
work: https://lore.kernel.org/r/anIq6pU5KXTTFCDN@gpd4

If yes, I assume you would run something like:

export OMP_NUM_THREADS=88
numactl -C XXX --membind=0 ./benchmark/sgemm.goto 16384 16384 16384

Essentially you want to show that those 88 compute intensive tasks each
runs on his own core alone and so you get a higher TFLOPS value.

[...]
