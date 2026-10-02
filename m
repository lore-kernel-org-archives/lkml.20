Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3429847668A
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 16:41:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790959293; cv=none; b=uX3aWFIIkISIxSbGBvWTWc9FldPv6tqHbD8EoqVrVWVV4aNlUvVM+BEXcwlyeRneXeo63y3qBUUI28x6HxDajc+R8HhLy4lRSZYdWSCsxAuCT2O5KWmi2IrguV4Tv7S/wRfeRAgDMSnlXiXyl4x/w3nqheFw1ruiRdPXNRiQNaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790959293; c=relaxed/simple;
	bh=VswTKosr4+CIPNkf4Cim6yES97oV1guMS+tLxqNuPIk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p7XskzCDwAVVMZWZOer5H9GfvqjRF5rFswsFGFHFvZmn/9+9zrgEngCgIxhoxKr4olsQviaXuQHTL2mXLn2/2bmT6yV7YUhw9MDCZBD4GyuiZk8XnltyDLSBUHJp2uTxvqFy8Gi+W1USNDLm8+Tjg0V7X1GIbtEE58KAwUDLmCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=WV6uCLcN; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="WV6uCLcN"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D630C1476;
	Fri,  2 Oct 2026 09:41:27 -0700 (PDT)
Received: from J2N7QTR9R3.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8EC943F86F;
	Fri,  2 Oct 2026 09:41:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790959291; bh=VswTKosr4+CIPNkf4Cim6yES97oV1guMS+tLxqNuPIk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WV6uCLcNITRHBmckvczxE8IpoHmahqcBQSdAXesNVir5OZ8RKGBUqo1A+ctrKjDRW
	 1u8rzLZ6hc9RIv6fbyw/e6gBr4qSOj5O3nhHxt9b4kLhuzTuy/CWBdQFYBKEdqlwro
	 vqGhSJi4NDsSbQSlHpSR6DLWBTUuFiL1yqJZCdNw=
Date: Fri, 2 Oct 2026 17:41:27 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: David Woodhouse <dwmw2@infradead.org>
Cc: Thomas Gleixner <tglx@kernel.org>, John Stultz <jstultz@google.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Miroslav Lichvar <mlichvar@redhat.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Rodolfo Giometti <giometti@enneenne.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] Optimise ktime_get_snapshot_id() for capture latency
Message-ID: <ar_et83fB9sI16Zi@J2N7QTR9R3.cambridge.arm.com>
References: <20261002151938.69857-1-dwmw2@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261002151938.69857-1-dwmw2@infradead.org>

On Fri, Oct 02, 2026 at 04:19:36PM +0100, David Woodhouse wrote:
> Commit 2e27beeb66e4 ("timekeeping: Allow inlining clocksource::read()")
> allows an architecture's primary implementation of clocksource::read()
> to be inlined, apparently because the out-of-line function calls get
> expensive on x86 with certain speculation mitigations. Use the inline
> read in tk_clock_read_snapshot(), and wire it up for arm64 too.
> 
> Also bias the clock_id switch() in ktime_get_snapshot_id() for the
> likely() case of CLOCK_REALTIME.
> 
> Measured on a Cortex-A53 at 1.35GHz (12.5MHz arch counter), with
> inlined clocksource reads enabled: the interval from a raw counter
> read in the caller to the counter read in ktime_get_snapshot_id()
> drops from 49.9ns to 41.2ns with the inline read, and to 38.8ns with
> the dispatch bias, mean of 1M iterations.
> 
> This is unashamedly a microbenchmark but it actually captures a real
> world use case: The time it takes for ktime_get_snapshot_id() to read
> the counter is critical to some users, especially 1PPS signal
> capture. Every nanosecond helps, and for the inline clocksource read,
> the actually *complex* part is already in place; this is just using
> the infrastructure that's already there.

When I mentioned this on IRC, my complaint about complexity wasn't about
the core code, My conern was with the subtle interactions *within* the
timer driver, and between the timer driver and arch code.

I don't think it's fair to say that the core code is the singular
complex part.

Does this show up on any top-level workload, or is the benefit purely
limited to microbenchmarks and timer synchronization?

Mark.
