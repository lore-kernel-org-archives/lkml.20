Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B709850255B
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 15:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789744711; cv=none; b=Htjz32n/IhILYtm9WrbPAOmsN2HF+DGw1MAovwxSRUwSMKs1EvVJvLgUSrw4RJknlI9evS/cfTNT1Rb9gU8IsheCQcPPtZ8VWP+LpND7BYDN+LLp5OhlD83UF7UEhWfyQi4m5vkWnl0OKFNdmFtWxVLfvXc0czIfN6ve5Mj5fGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789744711; c=relaxed/simple;
	bh=IlfBuCHxkGRgxvDrVhOCpJZopeRRynSQdATXV3b4O+0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AojkfE/D70DTpGS+htdIfKV2bADH3UiFy0Dn9swjGAyKEIH4KnnFloriMk3uaJ5+2FhHd3eHAeVMKLb0DF7Mnw9zpGjG0AH1yTiaDA6A3WbnYf2GrZy+kM5eH14hx2cxKSfc20xCqt3zxlWALSFuLuCdJOfT+JMaAArMUoU+bEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KS/Wr/88; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KS/Wr/88"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA1B31F00898;
	Fri, 18 Sep 2026 15:18:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789744704;
	bh=P0I1AhUNKzG51+TWGohbwBR1dV+eHiubIuZUP0T9QuA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KS/Wr/88cMvOPFT/dQw7sQ4fvLO3WOqyoE5aRm88waNxe1Q12I2/Y7sB8Bl6YY2na
	 XfGTPdRbiJTgxU65CBNXcJnAzMptTdfhZRhi+uZMj6yd96v32nKqF8nj57fy4GfBOY
	 bsbosqFSKsGQyW5nO6NtSs8MM+lRFZd+QdvdJrNpSG6eGawH1GVoG+YsJRgdFKkgVR
	 TJ5ce+kgi/LvQRYBHTqYO+wDhXTa8YX9k75y5Ox7/Rm3mzi/E8mFqXd1Wxu8CcxWZz
	 Ct+nNq0vcPG5qyw5fIz/JQAqC9p/cq5KUlQsF9FsLATvm0GBFHfpsO2Q7h4P5TjnKg
	 8cJJBgC+Pq9Bw==
Date: Fri, 18 Sep 2026 16:18:19 +0100
From: Will Deacon <will@kernel.org>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Thomas Gleixner <tglx@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Borislav Petkov <bp@alien8.de>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	David Woodhouse <dwmw@amazon.co.uk>,
	Peter Zijlstra <peterz@infradead.org>,
	Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH 18/19] arm64: smp: Use generic HOTPLUG_PARALLEL machinery
 for CPU onlining
Message-ID: <aq1WO-t5T6NGUUjY@willie-the-truck>
References: <20260907164024.17164-1-will@kernel.org>
 <20260907164024.17164-19-will@kernel.org>
 <23be2187-4618-400d-b817-023e6bc8f4bc@huawei.com>
 <aqP6kv9ZfNRWmngj@willie-the-truck>
 <18e3c3d9-562d-42c6-80f6-7744adfad79d@huawei.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <18e3c3d9-562d-42c6-80f6-7744adfad79d@huawei.com>

On Wed, Sep 16, 2026 at 10:34:10AM +0800, Jinjie Ruan wrote:
> 在 2026/9/11 20:56, Will Deacon 写道:
> >>> +	pr_crit_once("CPUs may be stuck in kernel\n");
> >>
> >> Need we print the "cpu"
> > 
> > You should already get something like:
> > 
> >   CPUn: will not boot
> 
> "will not boot" is only for "cpu_died_early_mask" case, I meant the
> "unknown state" case in the original default branch of the switch.

Oh, in that case the core code should now print:

	"CPU%u failed to report alive state\n"

Will
