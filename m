Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F8BB4E4C4A
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 13:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790774999; cv=none; b=RNMLFMEb0G8GYgiJbP8l2uIZnCEMch2UlQIU8uMmTXPfhN5stVpuhyYG7bF3X8WYB2kEbX6JRMM/wqByVf0n8cI7t4rWcYqNrUIA9PwL6WpZfYoLZBtCJVMY7zWF1K3UKWvh3Qm146cniYdrPx+DpBy3jXbc0iApQmTfRdasxOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790774999; c=relaxed/simple;
	bh=vr9Et9RfGdFeTi1/qzmBHJNWC/XcKihqC0Ft84ARbqg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BvUNeyCF2kil7ENKHczXpS1RSip10KcDYtqFrYRBb56RQD3ElXPK+yNG5psnihnatiLuip2UFh7GUWVQeKTC47CotuvgNzry+4Um44l2aF7y2spI/W5OqKow7YUmk3ZHROp/st0UIidr8fTZz+sGhHn+c3R87oKB0ehmd7zCdw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BImizp0p; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BImizp0p"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A35061F000FF;
	Wed, 30 Sep 2026 13:29:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790774991;
	bh=nvaGfG5po310924tWdFlbGKV3vnFi2Daw5X+Y5l+SdE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BImizp0pcOo86qSBUaEKZtafbOxXv4ougbDwjERwnQ6CKlE/QwoMHh4eItftccdfP
	 pHXj+IRllK8sWCWTmM9Hsrx7ZWITsOBfDCvBe0ArJGVR+8/VdYoYxXVljSS4v6HfTp
	 RqU6zJwI7EJhiPZZD3qDdlbUqkuAIDVR67kNnkhceDYvdRSnVY5rbuLsfNm3j1BloA
	 nc+WvnMpPlu+d3R00bvlMKqcQ5QkVFXY54hHWF8COxldFwQBj3HbVlLFeWhQiKGY/e
	 2qi1HHOt7mxYT111BgykY6aHThWeIk9VfCUwfnLYgzE/ebSuWoteMpuMXK4Eh9Yt2b
	 zJT3n4h1v/TMw==
Date: Wed, 30 Sep 2026 14:29:46 +0100
From: Will Deacon <will@kernel.org>
To: =?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@igalia.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Billy Laws <blaws05@gmail.com>, Mark Rutland <mark.rutland@arm.com>,
	Mark Brown <broonie@kernel.org>,
	Ryan Houdek <sonicadvance1@gmail.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel-dev@igalia.com
Subject: Re: [RFC PATCH v3 1/1] arch: arm64: Implement unaligned atomic
 emulation
Message-ID: <ar0OyoPqGfmrkdH5@willie-the-truck>
References: <20260930020138.2377090-1-andrealmeid@igalia.com>
 <20260930020138.2377090-2-andrealmeid@igalia.com>
 <ary-2rOs_b2IY6M1@willie-the-truck>
 <00227dc1-e01c-4de8-b3e3-3cd8de74cba9@igalia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <00227dc1-e01c-4de8-b3e3-3cd8de74cba9@igalia.com>

On Wed, Sep 30, 2026 at 07:29:22AM -0300, André Almeida wrote:
> Em 30/09/2026 04:48, Will Deacon escreveu:
> > On Tue, Sep 29, 2026 at 11:01:38PM -0300, André Almeida wrote:
> > > Implement support for emulating unaligned atomic operations on arm64.
> > > User applications that wish to enable support for this should use the
> > > pctrl() flag `PR_ARM64_UNALIGN_ATOMIC_EMULATE`.
> > > 
> > > Signed-off-by: André Almeida <andrealmeid@igalia.com>
> > > ---
> > >   arch/arm64/Kconfig                   |   6 +
> > >   arch/arm64/include/asm/exception.h   |   1 +
> > >   arch/arm64/include/asm/processor.h   |   5 +
> > >   arch/arm64/include/asm/rwonce.h      |  14 +-
> > >   arch/arm64/include/asm/thread_info.h |   1 +
> > >   arch/arm64/kernel/Makefile           |   3 +-
> > >   arch/arm64/kernel/process.c          |  15 +
> > >   arch/arm64/kernel/unaligned_atomic.c | 521 +++++++++++++++++++++++++++
> > >   arch/arm64/mm/fault.c                |  10 +
> > >   include/uapi/linux/prctl.h           |   5 +
> > >   kernel/sys.c                         |   7 +-
> > >   11 files changed, 579 insertions(+), 9 deletions(-)
> > >   create mode 100644 arch/arm64/kernel/unaligned_atomic.c
> > 
> > No.
> > 
> > I already explained to you why this doesn't work:
> > 
> > https://lore.kernel.org/r/aV1YnOetDHhKe4hz@willie-the-truck
> 
> Indeed, last time you raised some points, and then Ryan replied them. Is
> there any specific point that doesn't work? I couldn't find a reply for
> Ryan's answers:
> 
> https://lore.kernel.org/all/CABnRqDf5EQUoXu=pJ6mj4-JfwAzEfcAE2cYrNzJANFycx7cMUA@mail.gmail.com/

So rather than get involved in the discussion, you did nothing for almost
a year and then resent the exact same patch? Why?

I don't think the implementation is correct and I don't think we should
be emulating this either. I hope I made that clear last year. Ryan
thinks it's "fine" due to the locking, but I don't see how that helps
with the example I gave.

You are apparently the author of this code, so you need to get involved
in the discussion if you want to move the needle.

Will
