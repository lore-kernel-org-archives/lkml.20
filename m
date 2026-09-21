Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C23F4A0EE2;
	Mon, 21 Sep 2026 14:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790001686; cv=none; b=hCA7JKgL7dxI1iB9PlzOazSy03rfSraXeFKCAZJflCxSOBMDQYtmK9RH+qnHE69WBhHwri4tJfi3+Exg8JCF54T6dKKqkNXIeRqcffMvKXvR3PDd18cR9fuMYNdQ4lqJy5pWm6HjIIf7DIzLNNS+uE+6C0AeUP0pjenIBPkVzxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790001686; c=relaxed/simple;
	bh=6CGx7zVA+L58eCa8NaOb43Ibvn6UrpF9zmAhX5T538k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BYq6QMxSJGqalmroocbxKeviTbE/mfMFOLh/6KXhluhkNjLdUkmwAFGsmtsF1HHNED3On8+P+5pTaciZZmhOL20sx7o7XfzIR7Wp/ZwI6AtAS+SvnewyCkDufzJrxjI8zgoEH7tVaBxqww1aypKxpDfzJMvJ+xjHj726hkes058=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=HdLW9ymA; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="HdLW9ymA"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=vz6ig8BRPBVwJCqjuHXD5UgGHX45kboKMUHzdcfP0c0=; b=HdLW9ymAtaR/QoHJnbc/xctj+X
	vLC6axC88Oof0X6bBC7oI+HtAK4V5+LVJTgJTXgkzns9NFSp+wZEMGj0Dip8AG8Yyv/R6Cx0cZCuu
	jFOqI/lP5w3zqc/QvREMeb1kYunONbrUvEGDXR83GQu3aOgrKcq3HhNtYhf5T1h6KdouCkK1guBAz
	24yzTSGrW74FPLXbpYZE//H913yCahQ043x7YNr73kNqu1ujqSnAENYsqgHnNv6e0tRd2U6OBFNKi
	LtAIPGi8oaLW0EC7Z57crscy6OiwBk0y6xVixaOVhw0Mki4M9ajmlfbqkbjZc0Cmk5ZMbgwqdc9vT
	qz80Jijw==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1x8fCO-002H76-2h;
	Mon, 21 Sep 2026 14:40:53 +0000
Date: Mon, 21 Sep 2026 07:40:46 -0700
From: Breno Leitao <leitao@debian.org>
To: Andrea Righi <arighi@nvidia.com>
Cc: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Will Deacon <will@kernel.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, K Prateek Nayak <kprateek.nayak@amd.com>, 
	Christian Loehle <christian.loehle@arm.com>, Srikar Dronamraju <srikar@linux.ibm.com>, 
	Shrikanth Hegde <sshegde@linux.ibm.com>, Phil Auld <pauld@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Lee Trager <ltrager@nvidia.com>, Vikram Sethi <vsethi@nvidia.com>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] sched/fair: Honor asymmetric SMT priority in idle
 selection
Message-ID: <arFBm0EzMcz1RI-l@gmail.com>
References: <20260917140707.3807229-1-arighi@nvidia.com>
 <20260917140707.3807229-2-arighi@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917140707.3807229-2-arighi@nvidia.com>
X-Debian-User: leitao

On Thu, Sep 17, 2026 at 04:05:20PM +0200, Andrea Righi wrote:
> POWER7 uses SD_ASYM_PACKING at the shared-capacity SMT level to order
> hardware threads, and NVIDIA Olympus benefits from the same policy. Idle
> CPU selection does not consult that order, so a task can wake on an
> arbitrary sibling and remain there until load balancing corrects the
> placement. On these systems, that initial choice can prevent the core
> from entering its preferred lower-thread resource mode and cause a large
> and persistent performance loss.
> 
> When idle selection finds an available CPU in an SMT core, choose the
> highest-priority available sibling. On SMT2 Olympus this only changes
> selection on fully idle cores. A partially idle core has only one
> available CPU. On wider SMT systems such as POWER7, it also fills
> available siblings in priority order while the core is partially busy.
> 
> Apply the preference to idle-core and idle-CPU scans,
> asymmetric-capacity scans, target, previous, recently-used CPU fast
> paths and the slow path. Inspect the lowest scheduling domain directly,
> but require both CPUs to share its span because isolcpus can split
> hardware siblings across scheduling domains.
> 
> Keep physical-core capacity selection independent from SMT sibling
> ordering. SD_ASYM_CPUCAPACITY first selects among cores with different
> maximum capacities, then SD_ASYM_PACKING selects the preferred available
> sibling inside the chosen core, whose siblings continue to share equal
> capacity.
> 
> Reviewed-by: Srikar Dronamraju <srikar@linux.ibm.com>
> Reviewed-by: K Prateek Nayak <kprateek.nayak@amd.com>
> Tested-by: K Prateek Nayak <kprateek.nayak@amd.com>
> Signed-off-by: Andrea Righi <arighi@nvidia.com>

Tested-by: Breno Leitao <leitao@debian.org>

I tested v6 on top of linux-next 20260918 with a KASAN + PROVE_LOCKING
arm64 kernel and etst on my own 2-socket NVIDIA Olympus system (88 cores
per socket, SMT2, 352 CPUs, 36 NUMA nodes).

With sched_smt_asym_packing=on, SD_ASYM_PACKING appears on the SMT
domain only; MC and NUMA are untouched, and the override is reapplied
on every domain rebuild (~400 hotplug operations, including offlining
and re-onlining all 176 second siblings). A task woken on the
higher-numbered sibling is redirected to the lower-numbered one on
800/800 wakeups, against 13/800 without the series. auto, off and an
invalid value behave as documented. No WARN/BUG/KASAN/lockdep under
stress-ng and perf bench sched.

I did not measure throughput.
