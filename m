Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26ECA4B1D19
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 11:08:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791544097; cv=none; b=N8e3U4mH8NhMvX/VzjuXrIwWCGAzl4+YCQcFNCpmnciMhtZFYES/smFG0mexp+fzZuChU4JQG2mt/oBliS+nROuDn2TwcxJzjNS7Pz0g7BG4XweIELMcAXV9UFZmR52kwpXhCgu4tV3mB8RIbkjQ4fzLZmXClcIATvbGRMYJh3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791544097; c=relaxed/simple;
	bh=vADSZInCheDH2Ke/WJ88Ke9c/GF4rApoJmSK5t0kNqQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r4TIiVq790+OTdws7UTGnbsGf5qOBvnzjgAG/MlVUN0nBx004PKQE8Ex8DtzN4zP9kmYrbu+COD7dOS4BXmzm1vkoC43cALUKuBZOjQ/Xv2Zt0/1w6Gn8JFIjUKr4EOXhlPOBzu29Y6sblV6CJ4Pg0mRdSBa4vtHnghFiAbpWKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gnHl4JOv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gnHl4JOv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFCA91F000FF;
	Fri,  9 Oct 2026 11:08:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791544088;
	bh=ukoVZjY0lvw3hm20tfFUvWrL+mgXmpOnILuDl7cduF0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gnHl4JOvJAXtk3S6QyE3Al6kWqeQtYzr/yY0lXUxNOckZuZQ4C5QHPVjbhaakdDlg
	 6BNxymAcTTjlqMKP2XCe9e53Nrftczxx3rScVwuvzktnf9Lz91aAO5wGopvoq1lgxP
	 2dlcgZboZN6LJpIwOqIyt8C8TbMIfiJk/oHlksCST9YWtlkjDrNOp3/FMrInmLdqvY
	 eGZPYrO2dlZewSlpfBguQjip4cvf6RaG85lMFUiXWQN/fAuoOc0ThL7rfVhYIE8hrE
	 4Nza0wKCBHv2RLr6BICC27hQfymjZ5iXl1ehxXQG97niWoaGGvIoDsg96zf/a0Oo0a
	 BQDrYMtBlwbew==
Date: Fri, 9 Oct 2026 12:08:03 +0100
From: Will Deacon <will@kernel.org>
To: David Woodhouse <dwmw2@infradead.org>
Cc: linux-arm-kernel@lists.infradead.org,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Luka Absandze <absandze@amazon.de>, linux-kernel@vger.kernel.org,
	Thomas Gleixner <tglx@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Borislav Petkov <bp@alien8.de>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Jinjie Ruan <ruanjinjie@huawei.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH 00/19] arm64: Implement parallel CPU onlining with PSCI
 v0.2+
Message-ID: <asjLE0VkeVJKA554@willie-the-truck>
References: <20260907164024.17164-1-will@kernel.org>
 <f1ab0c03257d5055ada02877ac92a06f370c72b9.camel@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f1ab0c03257d5055ada02877ac92a06f370c72b9.camel@infradead.org>

Hi David,

Thanks for replying with so much data! It looks like I sent my v2 out
at the same time.

On Fri, Oct 09, 2026 at 11:00:08AM +0100, David Woodhouse wrote:
> Thanks both of you for working on this. It was always on my list to
> come back and do it for arm64, but that list is long. Also on my list
> FWIW is parallelising the *later* stages of CPU hotplug¹, not just the
> early path into start_secondary()/secondary_start_kernel(). IIRC there
> was more win to be had, but we had to prove that a lot of once-
> serialized code could safely run concurrently. Ideally without just
> naïvely adding locking and serializing it all again.

That gets _really_ hard because you need RCU up and running pretty early.

> I gave your series a quick spin across a range of EC2 systems, and it
> gives a ~40% win on systems with 192 cores — at least, as a
> microbenchmark of the CPU onlining. For these systems, PSCI is fairly
> fast to bring the CPUs online and it isn't a huge proportion of the
> *overall* kexec time.
> 
> However, your code in serial mode (cpuhp.parallel=0) is up to 40%
> *slower* than before. A/B testing results, all values in milliseconds:

Oh, that's unexpected.

>   ┌───────────┬──────┬───────────┬────────────────┬─────────────────┐
>   │ platform  │ ncpu │ A 7.3-rc2 │ A' Will-serial │ B Will-parallel │
>   ├───────────┼──────┼───────────┼────────────────┼─────────────────┤
>   │ a1-metal  │   16 │       5.7 │   6.7 (+16.8%) │     5.2 (−8.6%) │
>   ├───────────┼──────┼───────────┼────────────────┼─────────────────┤
>   │ a1-virt   │   16 │      13.6 │  15.7 (+15.4%) │   10.5 (−22.5%) │
>   ├───────────┼──────┼───────────┼────────────────┼─────────────────┤
>   │ m6g-metal │   64 │      21.7 │  29.8 (+37.3%) │   15.5 (−28.8%) │
>   ├───────────┼──────┼───────────┼────────────────┼─────────────────┤
>   │ m6g-virt  │   64 │      27.0 │  30.9 (+14.5%) │   23.0 (−14.6%) │
>   ├───────────┼──────┼───────────┼────────────────┼─────────────────┤
>   │ c7g-metal │   64 │      20.6 │  26.0 (+26.3%) │   11.9 (−41.9%) │
>   ├───────────┼──────┼───────────┼────────────────┼─────────────────┤
>   │ c7g-virt  │   64 │      26.8 │  31.0 (+15.4%) │   21.7 (−19.1%) │
>   ├───────────┼──────┼───────────┼────────────────┼─────────────────┤
>   │ c8g-metal │  192 │      81.7 │ 111.2 (+36.0%) │   53.0 (−35.2%) │
>   ├───────────┼──────┼───────────┼────────────────┼─────────────────┤
>   │ c8g-virt  │  192 │     110.7 │  120.4 (+8.8%) │   96.4 (−12.9%) │
>   ├───────────┼──────┼───────────┼────────────────┼─────────────────┤
>   │ m9g-metal │  192 │      69.0 │  97.2 (+40.9%) │   43.9 (−36.3%) │
>   ├───────────┼──────┼───────────┼────────────────┼─────────────────┤
>   │ m9g-virt  │  192 │     128.6 │  138.9 (+8.0%) │  112.2 (−12.7%) │
>   └───────────┴──────┴───────────┴────────────────┴─────────────────┘

Would it be possible for you to pick one of these platforms and bisect
the serial regression, please? I'm not really sure where to look, but
serial boot should work all the way through the series so if you can
identify the point at which it regresses (and presumably doesn't recover)
then that would hopefully point me in the right direction. One possibility
is that the extra atomics in the new state machine logic are slowing things
down. Another possibility is the timeout logic in
cpuhp_wait_for_sync_state() ends up sleeping in your tests.

Probably worth using my v2 just in case one of the fixes there helps,
but I'm not hopeful.

> We also tried it on another system where the firmware takes about 9ms
> to bring each CPU up (after CPU_ON returns fairly quickly). Fanning out
> the CPU_ON calls didn't make any difference either; the CPUs came
> online, one at a time, about 9ms apart. The parallel onlining saved
> only about 20ms out of 820ms (→800ms) here.

Damn, I guess the firmware has some serialisation in that case?

> The real answer for such platforms (at least for kexec) is *not* to do
> the CPU_OFF/CPU_ON thing at all. Pasha's Caretaker work² still does so
> for the reclaim at hotplug time in the next kernel; I'm experimenting
> with eliding that, which should give the biggest improvement on such
> platforms. So during kexec the APs just spin and wait to be asked to
> come back, instead of going completely offline.

I was talking to Tarun about that at LPC. I was envisaging a form of
CPU_OFF that would leave the MMU enabled so we could make use of the
existing EFI boot logic, but I hadn't thought about it beyond that.

Will
