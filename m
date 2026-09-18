Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79EDF23BF91
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 15:06:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789743994; cv=none; b=tbIZP3UgVOD8JZx+MtMTEjYM3ZbJaLDRh2Iy1ZcsuFwnG6gfUosLxBXZb2t6I5jamzbzDZTFOPtHbD+SDyFvEA5NnYJT1HRomOOuVcc+yiGu55pxlKDl3Mt38KRR5ch3R9uR8FceXfMoNFhisN91TIoFRQOcWMM32G44pVI1WRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789743994; c=relaxed/simple;
	bh=x4dGeiMD93IUThNAU2j39XSosjlbSgxivLioRpfb03g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n91HTlQiM1nnLsSJ0YgzQwB2u8A7lg6UBGRkRtDMnloTnGd2wum/RFky+wSjc6Ag3bvlcedghApPkzQsZkOlK8joiX4GsgO4vuVyVQgdY9FtqJhTa3+YHk8sNgFHM6Kd7eVMUPFkjhAgYFZiAF6opfN8hgjRwmWrMXGbIxSejsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d1ZbxweF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d1ZbxweF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 930451F000FF;
	Fri, 18 Sep 2026 15:06:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789743993;
	bh=p9cktvIVfrWuCcGGi89dQHWVm/YZCSacNyQ6KdAlOEA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=d1ZbxweFS+tO6FC/DrHAuY6SY/g1m/h0JdmsPGXjGlJzavJ5MIa+Hl8Rr2b6exhXS
	 CcMWVNtt4f+mNWp9grLhfX+DIAXKkpKMLWcWBZnKL1nEuxCQQw4bqo0HCYtfBLLWKc
	 HVJTybDRthcujELXlekp6wclJQk0x3Avx96fTHbbGHtjExItsWNkkya8XFvehNJgaH
	 ++pSwtcqM9w6z7kbhkITwYkp0MfIcjZxBli2VDySWX7wnA3chJcq2QKsbMUxdwBx/C
	 mi/1LfJMvauGhwbWd/68kb9rTwmsyBPNAKkfirDY6KiWJN/OEY6Jcu6aICL/sS96gn
	 ih3fUCFqwkDtg==
Date: Fri, 18 Sep 2026 16:06:24 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Bo Zhang <zhangbo0325@gmail.com>
Cc: akpm@linux-foundation.org, vbabka@kernel.org, david@kernel.org, 
	surenb@google.com, mhocko@suse.com, brendan.jackman@linux.dev, hannes@cmpxchg.org, 
	ziy@nvidia.com, liam@infradead.org, rppt@kernel.org, qi.zheng@linux.dev, 
	shakeel.butt@linux.dev, kasong@tencent.com, baohua@kernel.org, axelrasmussen@google.com, 
	yuanchu@google.com, weixugc@google.com, zhaonanzhe@xiaomi.com, 
	lipengfei28@xiaomi.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	Bo Zhang <zhangbo56@xiaomi.com>
Subject: Re: [RFC PATCH 0/4] mm: compaction: mTHP-friendly memory compaction
Message-ID: <aq1SrcniIRU-8f2W@gremlin>
References: <20260825043833.2659350-1-zhangbo56@xiaomi.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260825043833.2659350-1-zhangbo56@xiaomi.com>


This is the friendly patch-bot of Lorenzo Stoakes.

You have sent him a patch/series that has triggered this response.

He used to manually respond to these common problems, but in order to save
his sanity (he kept writing the same thing over and over, yet to different
people), I was created.

Hopefully you will not take offence and will fix the problem in your patch
and resubmit it so that it can be accepted into the Linux kernel tree.

When sending emails to mm:

For one of several possible reasons this mail has triggered an AI
detector script.

Note that, while we are fine with AI assistance, it is kernel
policy that you must disclose this with an Assisted-by tag like:

Assisted-by: LLM

See https://docs.kernel.org/process/coding-assistants.html

It is also kernel policy that you must fully understand and take
responsibility for every patch that you send.

See https://docs.kernel.org/process/generated-content.html most
notably:

        If tools permit you to generate a contribution automatically, expect
        additional scrutiny in proportion to how much of it was generated.

        As with the output of any tooling, the result may be incorrect or
        inappropriate. You are expected to understand and to be able to
        defend everything you submit. If you are unable to do so, then do
        not submit the resulting changes.

        If you do so anyway, maintainers are entitled to reject your series
        without detailed review.

In general, if you are a newcomer to mm, we expect you to do smaller work
before moving on to larger changes, so you build understanding of both the
technical aspects of mm and how we do things.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Lorenzo will reply once he has dug out from the pending patches received
from other developers.

thanks,

Lorenzo's patch email bot

[ Idea shamelessly stolen from greg-kh ]

-- 
Cheers, Lorenzo
