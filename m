Received: from mta0.migadu.com (out-158.mta0.migadu.com [91.218.175.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D3A6422E37
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 06:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789108840; cv=none; b=VlQJv0Jtz7Mb1C+A+vANa7gopNcGAcNHhWR1k621mpxT/ECIa0i77Qxc2fApSb1krSSjrRyqG4V7kaLUyE9IgVCMOwOUb4zF/tGlBgLxZv1fsJjvag3bnJe4rr6UlN/IpgP2EJvJIgWumfdkzqvHa5+lk5aKt+yBldlYkTJgpso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789108840; c=relaxed/simple;
	bh=DRgM2sZR9+U2TYq2r7Swte23UdF70NogfAQ1RXcZ558=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ekak+JgKKVF3iHDVPtejKO+GjZSvdo1A4ENzXkdUYszrYz9yfKXeAUEgXr+oCLjOEI02vuCyScsXqipO1wsF+gnWodua8EnnltRfTK9tf3DOzkgxJ6XN1mXNk3+JSA+4oGZAkmfDmfNUEYjVwzQF9yHq0nmtt2a9dvcouTCmkzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=nZoD4oLc; arc=none smtp.client-ip=91.218.175.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="nZoD4oLc"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=DRgM2sZR9+U2TYq2r7Swte23UdF70NogfAQ1RXcZ558=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789108827; v=1; x=1789713627;
 b=nZoD4oLcvsANqPqNKA/oDA1QlZOL3GFmLal0c+rd8irqEFchn68lqyEizKVH1ux0PVVajtBO
 lnDBw5p8GM0U0MjHawpWRYszBBSX9qRvzFg1IC5YxSxSsLrsk+YrorPzggFpkIQx/moCWxC4mVV
 g7BlGNAZFpW3s2mhSUqk7onk=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 1cdcfac8cafa065e;
	Fri, 11 Sep 2026 06:40:22 +0000
X-Mizu-Trace-ID: 1cdcfac8cafa065e
X-Migadu-Flow: FLOW_OUT
Message-ID: <a9099104-3348-4df5-ade6-25d9503bc74d@linux.dev>
Date: Fri, 11 Sep 2026 14:40:11 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net] net: reject a forward path that loops back to the
 tunnel
To: Farhad Alemi <farhad.alemi@berkeley.edu>
Cc: falemi@asu.edu, Simon Horman <horms@kernel.org>,
 Pablo Neira Ayuso <pablo@netfilter.org>, Florian Westphal <fw@strlen.de>,
 netfilter-devel@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, David Ahern <dsahern@kernel.org>,
 Ido Schimmel <idosch@nvidia.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>
References: <CA+0ovCj+Pd5owGH+51rA8-RDu9YFx5oYUv8bV0zOE72QgVfY0A@mail.gmail.com>
From: Xuanqiang Luo <xuanqiang.luo@linux.dev>
In-Reply-To: <CA+0ovCj+Pd5owGH+51rA8-RDu9YFx5oYUv8bV0zOE72QgVfY0A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

> ipip_fill_forward_path() and ip6_tnl_fill_forward_path() assign the outer
> route's device to ctx->dev without checking that it differs from the tunnel
> device itself.  When a tunnel's outer route resolves back to that same
> tunnel, the walk in dev_fill_forward_path() makes no progress and trips its
> loop check WARN_ON_ONCE(last_dev == ctx->dev). Release the route and
> return -EOPNOTSUPP when the resolved dst device equals ctx->dev, so the
> path walk either advances to a different device or fails cleanly.
>
> Closes: https://lore.kernel.org/all/CA+0ovCgaRvbd0Udj70b2xxG8Cx3CaCpNhnf1V4RWQuDveZYZhA@mail.gmail.com/
> Signed-off-by: Farhad Alemi <farhad.alemi@berkeley.edu>

Please add the missing Fixes tags. These appear to be the relevant
commits:

Fixes: ab427db178858 ("netfilter: flowtable: Add IPIP rx sw acceleration")
Fixes: d98103575dcdd ("netfilter: flowtable: Add IP6IP6 rx sw acceleration")

Thanks,
Xuanqiang

