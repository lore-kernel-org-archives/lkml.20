Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 147AD478865
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 09:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791452315; cv=none; b=Hl1eMoM4o8pclvH/W2ZfdBIdS+Cn3DqlXS6ZCMIo3gvAZ3tGxR8/qX361lyMhyhAD1TU/CQEG+URljfIV4jht8ZdgRn7eG0NAtrqioqniNRb5NcjGkMWjD009m570bOGQVbrG6Cz/yM3Lg3I987VsfJimN4KXPsCaLKrg2uVSqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791452315; c=relaxed/simple;
	bh=8GqpdePbJjPReA6UVI8QTTW4ehYo0UnnBtMBa51Y5nw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BCvlA/bO/IwuaHXdJ3LBqfQi+nmEp/8IxuclsNidlvgj1gVKGMX6TIsGaq+CEfkcTIXJsxCR90xlytZ1+1L6EPsT4ff+zwtJ1Y1nz3w6cOonk8JNpLJkrYL3o/yk6WavFabKmqJX1CnzoOyeWUSYM7MRLAzYqDRq0zJfY1bE9pU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oCW3V0Kp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oCW3V0Kp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 467581F000FF;
	Thu,  8 Oct 2026 09:38:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791452311;
	bh=RKtEOQHPigAoAwo8CF9T0jDnPNUFJucXM8EW3aRhA50=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=oCW3V0Kp5hNle2v72y2LEevLzHCpdOqLK/fpTYlnoTB/LQcXo579B1SmOK0hU+ygc
	 d675R8yy1aR3N2aXDitLuVqAvAn7+XbesNNfsltkPeX8mWG/kbMVtr+cr0bgQH85XT
	 zNm1mWl+cNM8vWgYAM+zK5vIIQ9HE0GfQgqJxN8UOOI0b80oWDlqGUxI+RUMhcSe8N
	 /KH4wgCVhSuZP9PGYva4A9B6UFAwB5N/RT9jlL4qW4rWPqDFEqtt0iz3FfYsFGF0Gi
	 gTTtBiXNpXnRidLvgnpMQ+Cj8RbT/qaNiDA6uzXyXtGAokBPtCdQ9s+GlCFW8un1OG
	 hzurksoo9zvjg==
Date: Thu, 8 Oct 2026 10:38:25 +0100
From: Will Deacon <will@kernel.org>
To: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Thomas Gleixner <tglx@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Borislav Petkov <bp@alien8.de>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Jinjie Ruan <ruanjinjie@huawei.com>,
	Mark Rutland <mark.rutland@arm.com>,
	David Woodhouse <dwmw@amazon.co.uk>,
	Peter Zijlstra <peterz@infradead.org>,
	Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH 00/19] arm64: Implement parallel CPU onlining with PSCI
 v0.2+
Message-ID: <asdkkXWg_M3TwMrN@willie-the-truck>
References: <20260907164024.17164-1-will@kernel.org>
 <3b97d843-c4ba-4384-afab-51067b1b8414@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3b97d843-c4ba-4384-afab-51067b1b8414@oss.qualcomm.com>

On Tue, Sep 29, 2026 at 02:26:03PM +0530, Pankaj Patil wrote:
> On 9/7/2026 10:10 PM, Will Deacon wrote:
> > Hi folks,
> > 
> > This series implements CONFIG_HOTPLUG_PARALLEL for arm64 by utilising
> > the argument to CPU_ON introduced in PSCI v0.2. This supersedes the
> > previous series from Jinjie [1], and I'm grateful to him for his support
> > getting this alternative version in shape for posting.
> > 
> > I previously spoke at KVM forum about this work last year:
> > 
> >   https://www.youtube.com/watch?v=Q6kOshnnQuE
> > 
> > There are three major benefits realised by these changes:
> > 
> > 1. We ditch our home-brew secondary CPU synchronisation in favour of
> >    constructs in the core code.
> > 
> > 2. They offer a performance advantage on some platforms, where getting a
> >    CPU into the kernel can take time. I'm hoping Jinjie can provide
> >    numbers in this case.
> > 
> 
> Tested on Glymur-CRD - 18 core qcom,oryon-2-2 CPU, saw ~6% improvement
> in smp bringup and ~12% improvement in cpu hotplug kselftest
> 
> Tested-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>

Nice, thanks for giving this a go, Pankaj! I'll post a v2 soon, so it
would be great if you can try that as well.

Cheers,

Will
