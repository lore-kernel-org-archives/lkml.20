Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69F9154B1B1
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 15:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788968169; cv=none; b=OlmZNrNArRD/xMnG3pJovzTuPvQVkx9ODyP1yfi9LDheTzdctHH1+klUcHFqeJinfZ0AACkp0hKGhclO0WjR4bMxdB+zZAZl/NltvQn8I8SROcmiG+sZk/yZQpGFn3jzMFlZYdDlXQXAHzlpqPSrI7AAoJkmiSO0h/z5EuqEXZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788968169; c=relaxed/simple;
	bh=NaFDxOsVDJQfoYPHGh/15yYZWt+ebqi5diJeyyTAPp8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q7RO+0Y2ztNhZA3ptm3BVWy+UXpdht5efmlxoUvsPlCA8Knjt9e/L92GS9jB2madEMxdrGBYtm8jOcccEC/JwYkSdq9xLZwR93KSHGjeurmmU2Av3011KGRKvnjFRfIkxiJb51ewCswDm7EHExK4t8qHNLWoNzkGmAQfsuiVlwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Md1ebTio; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Md1ebTio"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7527A1F00A3A;
	Wed,  9 Sep 2026 15:36:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788968168;
	bh=xL4GWNyZy2EEYdBhSmnDddwtNaFG49DB7p0/uhH7nuA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Md1ebTiocQTMrxL598KX8+yXuKfpi2/4t9URltTQztmgYTDkmpXWohsCheUd6M8n+
	 TCetYdf3jyIRwqDonImBJt7CVh5ix1jItm4hWLEABmfRVyHia67NHfxc3dPm8PzzHZ
	 hoYnMJ2FwHjDldUl1z76houFfC/n+zftd1Uyl1CpBQFdfmDmb+1NtURXUEphvDTQkt
	 7YJzDYM5A2MdQND27l1lUalH+9VMWGz08GLswndGMgSSqOlZXwsb8oI/vnfrrvGJOw
	 yIE86kDbAhAUhhV9YzXvX8nlh1ewMBtNYFg0k+nXikV05lrhFPE0Ydbt7L1GU9w66Y
	 s0Auah+XgnIEg==
Date: Wed, 9 Sep 2026 16:36:01 +0100
From: Will Deacon <will@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Andrea Righi <arighi@nvidia.com>, Ingo Molnar <mingo@redhat.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Christian Loehle <christian.loehle@arm.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Phil Auld <pauld@redhat.com>, Breno Leitao <leitao@debian.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 0/2] sched: Enable preferred SMT siblings on NVIDIA
 Olympus
Message-ID: <aqF84So9WUQCDgsz@willie-the-truck>
References: <20260909062649.469633-1-arighi@nvidia.com>
 <20260909131415.GB4120091@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260909131415.GB4120091@noisy.programming.kicks-ass.net>

On Wed, Sep 09, 2026 at 03:14:15PM +0200, Peter Zijlstra wrote:
> On Wed, Sep 09, 2026 at 08:26:07AM +0200, Andrea Righi wrote:
> 
> > Andrea Righi (2):
> >       arm64: topology: Prefer PE0 on NVIDIA Olympus SMT cores
> >       sched/fair: Honor asymmetric SMT priority in idle selection
> > 
> >  arch/arm64/include/asm/topology.h |  1 +
> >  arch/arm64/kernel/smp.c           |  1 +
> >  arch/arm64/kernel/topology.c      | 51 +++++++++++++++++++++++
> >  kernel/sched/fair.c               | 85 +++++++++++++++++++++++++++++++--------
> >  kernel/sched/sched.h              |  6 +++
> >  kernel/sched/topology.c           | 36 +++++++++++++++++
> >  6 files changed, 163 insertions(+), 17 deletions(-)
> 
> I tentatively picked these up, but I need an arm64 ack before I can
> merge them, and ideally vingu will bless them too :-)

We've had five versions of this in five minutes, but the arch code is
pretty filthy tbh. Detecting topology based on MIDR is a non-starter,
sorry.

Will
