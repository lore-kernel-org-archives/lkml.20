Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBA898834
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 23:32:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791156727; cv=none; b=REZ0L7LriGuMgl/nnL/D1VC7SwabD9JkMOtfqrASsqQ1g/94+mnbCyVwSfhKz2LUUMJj4vu1I2EEL537UAxpY1FZEU9aa5cuLMZkS9pl3+HUGqyjXTfmzPBwP/S3AHBiV1Dwox1a19tJSM+9T0NpZhbK0g+vPpbGKltC49LClyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791156727; c=relaxed/simple;
	bh=8h8UANv37KzFpofppxhEqsiroLhNIDui11BuU6ZCYI8=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=e1zK5z5M3QrcmzI1vSXLfOXkEMclMROsQ1BjGl4Ay7+7PX2bDgyWFNmIiWAl1ezI28Tvcsh/swKdSz7XonX8vkOFEpGTojVQwFI6AvReA0uD/zQnjwXr+40wUP+3kRZ/OuChRfbUSJtdnwel+Yiui60hX1EwVOeEQiL9Az2yQ0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CALEh03M; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CALEh03M"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BF051F000FF;
	Sun,  4 Oct 2026 23:32:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791156726;
	bh=yxK1/IDpFhO7SOYOWAMdIAxMN7TKC89pAYbNpadasvE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=CALEh03MJiZUJBevNqMDG+nWZzVZVOWpsU01PMlqcpbZLnZBf+ExMGY75IHMCd5+n
	 PyQ6xzXObFxzHdIWe4co1InTcMMpiGw8wU+4zPJzpcngsLN9AtdD3bE7jKksY3oPCi
	 AkGurZz6s2b/OeCRm0Dn4ZAFc1GBYoOEaM4J93DX28B1qrcKsIqmTepnJ/OY4/yaUA
	 R7bU+UkEwU9jQI3OyuoNP1cbrqw8jftcjLxTrRC3HFiD5j8AKMj+hR22ZwyVFRaUOk
	 Urs4Mlyo64UrS6W1TBgS/xWXqB+vDjj+iPqLcJO3rwL1mxvy+wpzKHzHTKQ1Idtiqu
	 GjfrpIxdgYHKg==
Date: Sun, 4 Oct 2026 17:32:02 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Paul Sherman <shermanpauldylan@gmail.com>
cc: Samuel Holland <samuel.holland@sifive.com>, palmer@dabbelt.com, 
    pjw@kernel.org, alex@ghiti.fr, linux-riscv@lists.infradead.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: smp: fix non-SPINWAIT secondary hart rendezvous
 for fw_dynamic platforms
In-Reply-To: <amqsOI7Pdg5uH-bO@got-milk>
Message-ID: <56e594a6-83fa-d8d3-b7be-547ee9778326@kernel.org>
References: <20260729083414.39339-1-shermanpauldylan@gmail.com> <51f32966-86a2-456e-9e45-c9bf8add0676@sifive.com> <amqsOI7Pdg5uH-bO@got-milk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 29 Jul 2026, Paul Sherman wrote:

> On Wed, Jul 29, 2026 at 05:13:56PM -0500, Samuel Holland wrote:
> 
> > Why doesn't your firmware do that? Can you fix your firmware?
> 
> Is your expectation that platforms exhibiting this behavior should
> be corrected to satisfy the ordered booting contract, rather than
> Linux handling SBI_ERR_ALREADY_STARTED defensively?

For folks running mainline kernels, I think it's reasonable to expect that 
they would update OpenSBI to fix a bug in OpenSBI, rather than patching 
the upstream kernel to hack around it.  Hopefully there's nothing 
preventing them from doing that on this platform.


- Paul
