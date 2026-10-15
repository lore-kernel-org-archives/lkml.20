Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 570713F4859
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 20:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792094483; cv=none; b=RxlccXS0c85fijfkn6wbTJbEKDOyrLlh/oLUaWhlOJGDMmlXdygQtDYA7Ita5FQAQ6l62ItSnfewuSugZQpPwdkPY5h9BCnwNJvqUQOK6Am+5FQTdnMNdLpfEEFgXkBCBF1ha9rV1fkS7VllcYeCFEDb3JzMrvPj/sJoWkgT4ns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792094483; c=relaxed/simple;
	bh=TiAkF6Th6sriO/mLW3FmrqJrEtqkcyTaTIZIjX//uFI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oFL0Ri34zWA8L+Px44tY6bsy1QACqNPurw5p9q4J7LxKfmxIX4/qvtVycPVcOA5AMw5BxrlF9Ps2G0g6QDoLyusztrVNgvCspUKeHL4JZ7+uyht2+wJlB9ddluTCVxGqhZ9vI6h3tv2rloznUXcjuObn9hJcRVtug38Q8Zie+iQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=eWtPYFZV; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="eWtPYFZV"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0B7DB14BF;
	Thu, 15 Oct 2026 13:01:17 -0700 (PDT)
Received: from [10.57.84.235] (unknown [10.57.84.235])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A491F3F7B4;
	Thu, 15 Oct 2026 13:01:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792094480; bh=TiAkF6Th6sriO/mLW3FmrqJrEtqkcyTaTIZIjX//uFI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=eWtPYFZVZYJGL/vOUpfEzo52BJo8oYp1RHXKJL80VvNV+sChhVzLtxSq0ad0gxyth
	 Dnfm4DtMI0tXXtoGaoZN10rYw4+By5h7sVJtj8zP6ErBPK9JtlB/gFEJXw+PI+RrYf
	 vhs1EgJYwIRsPrpvjdhkDt+b1hnWLQ3jfbgbpdi0=
Message-ID: <5f98f865-6bae-494b-b08f-662e3325370c@arm.com>
Date: Thu, 15 Oct 2026 21:01:15 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] sched: Rename/clarify
 sched_class::task_tick(.queued) argument
To: Kayra Cizmeci <kayracizmeci@gmail.com>, peterz@infradead.org
Cc: bsegall@google.com, dietmar.eggemann@arm.com, juri.lelli@redhat.com,
 kprateek.nayak@amd.com, linux-kernel@vger.kernel.org, mgorman@suse.de,
 mingo@kernel.org, rostedt@goodmis.org, tj@kernel.org,
 vincent.guittot@linaro.org, vschneid@redhat.com
References: <20260929085319.981147568@infradead.org>
 <20261013171410.58340-1-kayracizmeci@gmail.com>
Content-Language: en-US
From: Christian Loehle <christian.loehle@arm.com>
In-Reply-To: <20261013171410.58340-1-kayracizmeci@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/13/26 18:14, Kayra Cizmeci wrote:
>> For some reason the sched_class::task_tick() argument that indicates it being
>> an hrtick, is called @queued. I'm sure naming is hard and all, but lets fix
>> this.
> 
> "For some reason"...
> 
> I grepped. I think task_tick_stop() is skipped. That's a nit.
> Just sayingggggg........
> 
> Aside from that, or with that IDC.
> 
> Reviewed-by: Kayra Cizmeci <kayracizmeci@gmail.com>
> 
> (How y'all find things to review? I just go to the threads that I see the messages of. I think
> That's why I'm a bit late :<)
> 
> 

Depends what kind of patches you're interested in, most kernel developers
have an elaborate mail filter setup based on linux-kernel@vger.kernel.org
If it's just scheduler patches, you can either start filtering for "sched:"
https://lore.kernel.org/lkml/?q=s%3Asched%3A

or check one of the people in MAINTAINERS (preferably somebody who isn't listed
for a bunch of other stuff) e.g.:
https://lore.kernel.org/lkml/?q=t%3Aeggemann+OR+c%3Aeggemann
