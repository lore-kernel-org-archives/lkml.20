Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 966CC4F96D9
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 13:55:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789739704; cv=none; b=ueqvZzJqvYOHBYooD6bW3rwJdaISxctUlp65fnW8W36VsEi9IqMgJT0s8abmnKkziCPy7e+n4j76HtM2IHO2OFp03apBOfACUnPO9VHgyuIh2E+ZMbPXF6ITPjZjENX9ppTNqQnZ5thP4uAyr1rCl1YgI1CEb20bDtV+HBMHPx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789739704; c=relaxed/simple;
	bh=lNyQgcG7CXt+b0W6T7Ks2i0IR+1eGcoSOmHYXXjXsNQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XUdndt7H0OzZ9jSh6A0vot3AeMtpXsT731WOIrPARCMNLCz9mHQqICZAbmOztNIBLS+JCdanXgKCyeOlpeGVWyznIfrFPdMKTfM6DGZGIEg3533/M/seeZGYGFlWDZMDllsZx5jjTYtK6NGHpoOSRgo3dfvvPuEnPcuQJbrE/ws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E/n+9Ysn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E/n+9Ysn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 596EA1F000FF;
	Fri, 18 Sep 2026 13:54:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789739699;
	bh=SuewnJ4cX6K+cdzYuqWn1gEacAxYr+xkLgLUiMzhGVY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=E/n+9YsnFPCJNQYhI2oLS7/TbIxEkc0E9Ejf8j1jZFairtOUrDRIoAuGEEfpmjC25
	 bxYiJwGFBakQUFKjH0nriCu5ra1qurr6rpigZhwxxL3E9JTlAe1lNFeWvxvsNI2HBY
	 f7hRz+GKI/lZAl5ILSkLdoZakD+E0eZ83ZE3TX474Bk+p/6EYYviON/NhiIIx4dYVn
	 P3fOidp+4rJ397iYsXHX5npRSI0E7xsqee9ELH7sf/p1xYJU9BurR9NhH58gw5266L
	 c76NIBAoOau40lvcTHPw4zWzuO+HuRcGUqOYDc05QBigaZFqDp+/bF+rDUAvLT1UM8
	 MbrIIGo3sr2HA==
Date: Fri, 18 Sep 2026 14:54:52 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Yuan-Hao Hsu <aa9736195201@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@kernel.org>, liam@infradead.org, Vlastimil Babka <vbabka@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
	Michal Hocko <mhocko@suse.com>, Barry Song <baohua@kernel.org>, 
	Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm/memory: reuse the whole exclusive large folio on a
 write fault
Message-ID: <aq1CjdaPUg_Fos0t@gremlin>
References: <20260918064238.868-1-aa9736195201@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260918064238.868-1-aa9736195201@gmail.com>


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

Thank you for using the Assisted-by tag to acknowledge this.

However, please do note the policy at
https://docs.kernel.org/process/generated-content.html most notably:

        If tools permit you to generate a contribution automatically, expect
        additional scrutiny in proportion to how much of it was generated.

        As with the output of any tooling, the result may be incorrect or
        inappropriate. You are expected to understand and to be able to
        defend everything you submit. If you are unable to do so, then do
        not submit the resulting changes.

        If you do so anyway, maintainers are entitled to reject your series
        without detailed review.

This change is significant, and you are a relative newcomer to mm. As a
result, I must ask that you provide some details as to how you solved this
problem and your overall understanding of these changes and mm as a whole.

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
