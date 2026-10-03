Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1B6E456E0B
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 21:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791062686; cv=none; b=O2O4pv5Aa3WUm3dmKLpyQ+dw2nmQYx4ce7Q91SJw0MsgsvHg2oQ0ow0t35KJTeSYXsmoJc+82i2//d7CHd92Tz/I5p7dhz8vDk1gNJBuprgN7RbNHgNqBj6fjQZuirRK6KLfn5Eb5aKOR3OFwqzk7GsqUYABPbTbcJs8r5Pi/VE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791062686; c=relaxed/simple;
	bh=YaPKReLrTXlWf/5tp0jCfblVUgP9lddtvgHXRG6iY1M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IB2KySkZCv+qi+MKyaFmpWDxi3HOebS2wRh6aQ9t2RPU+5rkVTDvGRqe/aicbEChBUj2t+d5/4ejpbdWJBX0Otx79q4zLO0RvHH9S2fUDqv4iFZGbP+ZyLTpcqdBoZdtl0sDLTNUinauKJfxfdCmGYoukX6mJx6KQeGBF3YSois=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M7wZO4Jq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M7wZO4Jq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 754101F00A01;
	Sat,  3 Oct 2026 21:24:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791062685;
	bh=YaPKReLrTXlWf/5tp0jCfblVUgP9lddtvgHXRG6iY1M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=M7wZO4Jq1Q6NCadYJ/W9RnPkHRNnPLE2JiqvTr3hBBRvko0oZUs4e8m2CJZomVhKE
	 +M7bHJBZeAjRfPYm3mtF2tFXGhki2srOKeYVQTYbjYFGVJDuq29cQam/evbTmDPwy8
	 2ehH1XZpNTs5BnjJBcvTjVG24W5zVWmut7wRhZOfIenvS3UJksjZBg3Ur12WwpG0L8
	 AqJPrhdA0z6OZ8YcD1aUaZ15p3MG23Qqu/XkKXj2CuAArPCeGf8J/lEeloye0wP195
	 bzxh//CfR+Id2Lxr/1PBsIwpy4wKdHBSVGBuAIm40KBJAnAfAvHZtyk2o8iLAQ+Z0X
	 1PMl9TuUP53XQ==
Date: Sat, 3 Oct 2026 22:24:40 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Borislav Petkov <bp@kernel.org>
Cc: X86 <x86@kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	"Borislav Petkov (AMD)" <bp@alien8.de>, stable@kernel.org, Rik van Riel <riel@surriel.com>
Subject: Re: [PATCH] x86/CPU/AMD: Fix AMD TLBI Erratum #1718
Message-ID: <asFqr9OEdRqCJKWj@gremlin>
References: <20261002211617.1001617-1-bp@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261002211617.1001617-1-bp@kernel.org>

+cc Rik FYI!

On Fri, Oct 02, 2026 at 02:16:17PM -0700, Borislav Petkov wrote:
> From: "Borislav Petkov (AMD)" <bp@alien8.de>
>
> The processor may fail to invalidate a TLB entry while executing an
> INVLPGB/TLBSYNC instruction pair.

Hi,

I've repro'd the issue on a threadripper - a Ryzen Threadripper 9980X
(family 0x1a model 0x08 stepping 1) on microcode 0x0b008121 (the latest I
believe).

It failed Matt's repro in seconds on 7.2.7 (round 3 on the first run, round
1 on the second, same stale-offset signature Rik described).

It doesn't seem there's a microcode fix for the threadripper yet.

I confirmed tlbi=ipi fixed it, 20 rounds with no failures.

And I built and ran a kernel with this patch applied (and tlbi=ipi removed
from the kernel command line) and this patch fixes it it too - 40 rounds
with no failures.

So:

Acked-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
Tested-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

Hopefully some useful datapoints also - + I hope there'll be a firmware fix
for the threadripper too :)

--
Cheers, Lorenzo
