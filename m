Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B73BE4C2265
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 10:29:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789640987; cv=none; b=eBn9pZ3wJVap+LwWy93dG2OnNKcQOhIf3MgP9MtQ+DDYn2+ZJWJTizgpx3CyeHVBegjMvunsmjpWYSbw8nlQrvckzosPmycF13QQkesA3u37wbkiwzQKpnKp8dqonU2JlvsWWJjRh6utzfCIsY2v3ZFnBmEN6Z+YXIh4fY+P14I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789640987; c=relaxed/simple;
	bh=A2fdU7ZCV46uVFIhqaM+LkYuD7fWh0388vMbNgqTAGM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gtn5YnmIsVJcSuIKElgODdwgnzebWb7TyaOcoZj1+O03l0SGsX019EqQH/eLPHiAk6xMORMYQYM+3nidivQF18j+h3Dx+8tm4jeF5pUxeTbv6OwXYDtqyBXnFCAPR+KClu8BejbUZPzj0QhFYjmnqTqrKiI9jvFN28VeoiFiP+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jV3I3UmV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jV3I3UmV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAD9D1F00899;
	Thu, 17 Sep 2026 10:29:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789640981;
	bh=A2fdU7ZCV46uVFIhqaM+LkYuD7fWh0388vMbNgqTAGM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jV3I3UmViUB2+jLzp3yKXMQ3n1CJKdYKHEv8AM79KRyQbDlgrg57uHLfrDvo3ZURK
	 QlRG+rWr4lSjeEVHGGtGmN6RDlZhH9aFZE7dfZBJ3rX8+8EfY9hzuvd2gzlHidvCyG
	 eX+SPWfveocWla2CfbtdQSme2Cn3k3qYacGYuGrVUK9tXoVOApqS7opKUlSicdpi2f
	 UcmPiRkpbscmIcGUAprpKkwJdOp5HEptgQ4p4rLIdVrJMp07vWPZbrO6LIiuG8V2AQ
	 vkBQ7UUQ+U+rQNMEYVx6d76andzLuLTjhTLRXMB3W2C3hhpaEpcFybAXP0bjTAsJ2u
	 kCPQDrqx3fq4Q==
Date: Thu, 17 Sep 2026 11:29:35 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Bo Zhang <zhangbo0325@gmail.com>
Cc: akpm@linux-foundation.org, hannes@cmpxchg.org, baohua@kernel.org, 
	kasong@tencent.com, qi.zheng@linux.dev, shakeel.butt@linux.dev, david@kernel.org, 
	mhocko@kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	Bo Zhang <zhangbo56@xiaomi.com>
Subject: Re: [PATCH v2] mm: vmscan: avoid anon scanning for GFP_NOIO with low
 swapcache
Message-ID: <aqvA_tm8vSLyUWqe@gremlin>
References: <20260903040131.4016290-1-zhangbo56@xiaomi.com>
 <20260906011820.382381-1-zhangbo56@xiaomi.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260906011820.382381-1-zhangbo56@xiaomi.com>


This is the friendly patch-bot of Lorenzo Stoakes.

You have sent him a patch that has triggered this response.

He used to manually respond to these common problems, but in order to save
his sanity (he kept writing the same thing over and over, yet to different
people), I was created.

Hopefully you will not take offence and will fix the problem in your patch
and resubmit it so that it can be accepted into the Linux kernel tree.

When sending emails to mm:

New revisions sent in-reply-to mail

Please always send new revisions of series individually, not in-reply-to
any other email.

The easiest way of accomplishing this is to use b4 [0] (the recommended
way of sending patches to mm), otherwise format patches like this:

For a patch series, e.g. at v2:

$ git format-patch -v2 --cover-letter --thread ...

For an individual patch, e.g. at v2:

$ git format-patch -v2 HEAD~1

[0]: https://b4.docs.kernel.org/en/latest/contributor/send.html

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Lorenzo will reply once he has dug out from the pending patches received
from other developers.

thanks,

Lorenzo's patch email bot

[ Idea shamelessly stolen from greg-kh ]

--
Cheers, Lorenzo
