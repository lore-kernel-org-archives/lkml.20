Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EA934457B8
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 07:40:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788248410; cv=none; b=fgStQU1hQu/szd01eGxxK2iLNV6ePZmipBWK81yi+HrE4CIDxS7IV3/8kqshc77gtFIcsFbsringWRS6fRnsg1pcI+JLxE3K6LdZxVbOf1dq8cJG36QE4RAyg7yiESlXcYLXdTn5x4ulEBogeBJ4+mEIXFHXMSAdLbSgkOZft0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788248410; c=relaxed/simple;
	bh=fNXgbUH4YwoCUckMTjuilOc6um4z0aw79/1hpJaeGjM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lICbn+N05v/KsFzIAPF2dqVVavn+tDq7fLbQh9GMA5XhdtZ46fEGnyXtdNMB6w5lZclkRSu6EcHujiu8VsFjG7FbDSOQuCVjlD96UslEBLr+OWkcFlKCfHAo0nNRZ/RyLZ/CBwwnMIfiCSyfWT0U7XnIuaHzXqQ1uzSrwP+xU5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BGuLuA+K; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BGuLuA+K"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2d560775ca2so32255035ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 00:40:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788248408; x=1788853208; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lVGuGBruvV53X0XkgR5c4IAW5uh3SaQmvTN/K44C1Qw=;
        b=BGuLuA+K1dgYX97zPKCAbOfGkyvLNA/Kqu3MBn+mr/ChKsHHooUoxdv4Xfh8xvvHuv
         OoZv1oJR2DYIJphulDjLfbG9FMR4iXr/tDSvjrizoBXCTqA+u9b52I6JvnoUcouWluBu
         W6l8jrX8bVe5Q+1C0sFsSwxAxn0yQ+K0r6rHgU759FjWZWoW76WRWOwxHcfwgx0fQDXZ
         Sd/7D//nb/19ib1pvzZx/hyKt26UaH0utUI3QF3dNPU+5ZeSGRi9DMA2a98Mb9pYLJa8
         qe7ag5+5/azlN7eLcBQyVQdCnh86qwvRGRUuKZuaRCO+3UYieTW5NjjQjnTogTP8OKze
         2z5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788248408; x=1788853208;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lVGuGBruvV53X0XkgR5c4IAW5uh3SaQmvTN/K44C1Qw=;
        b=X1ZND3wrZbvr4BXU6x4C0QdN5da9EfztH5BO8rsKHAQvdzSzWVBqg8V6diYCYWmR2O
         Nh6NelKmUOvhqQjlNnkxLJDXMBa5EqDQYqBDBcYrORdmww/4kErz1MwXoF6EhzCP67iy
         HKYYxui+DGt1u/DIJfIwSzioT6UZjv1yEn4lvixQpI5bglZNocy7bcANPHkcNexDRdtB
         nqlrq8SPIMLZctwaORuzqOj2x+yYaukIRLROP90YVDH5R+1F6+iv3KDCH/YLlr/YsXnJ
         E+vOSbXw+rYd9WrBg121Ye9miw1BZZCEUFVt6CbAAhzr2Oz0ojOt6zf/Hc5u0Rhy1ZZt
         b0qA==
X-Forwarded-Encrypted: i=1; AKwUvByEXYF6niFibmZALk2hTRATc4GRArKdCGKLM3A9ncOIIPZQGoIMFvm6s8yr5rvG0mD+SkInc/+m9QtvpMI=@vger.kernel.org
X-Gm-Message-State: AFuF++l3pgFfd/hOsTYuWHq8754AV91iZdIkwQC7uD2HPthsYYrvAG/0
	0mO4fJ7IRgksQ1e29bnUWzgDpajZEQlZFdYMCrfVj5CNXCcNSX49SYkL4ZQdSCaguzk=
X-Gm-Gg: AYBFou1vw90mhlmlDvQMu4D4sJtmGQJk47Yn3orb7w3lfdgWlZqbWNyAUFx0N6mONai
	nybcbVi+XUye7RAuE8v+8SZtuvbcEzHJ4x3C/tZDWYjZu/i0R0yQbVU6req/9aKQCxQFrTAESzS
	3PBlzhxxQIIn9c+YxBdZZbu0BgsLxclaZIo9XlF3SgGUaEYr8hfVZRUUZCxenWiN3aI1WVdSh3g
	3vMTxgCcyrGAA5jjDOlQkZ/x44jWyWBSDBhMoVL66d9s6kW+3Gl6ERSrrH0KhLu+E56K/icAjru
	CuU2cfxgu/zHsAFFoDgiqhTMdOTEhI7bJfK03ScXFHg0Q4YlZkjrFHQyqlzIeiuov2xiKNaJzf3
	QFE05uEvwwiN5pNyE8WH5GxUIJnxkB+lStuwJpfYxrZcOHyrLVOXXuOmfJv8m8qKEJGC7EB6rC1
	47RhF5Ocem29lji9aMHOMYr1S0J/nv+7rvuP4QK30xvxnvhAV8cRbrwAYN2z1AS9yOdi0Ke9qT3
	5FraQAmfAsbjzw/8g==
X-Received: by 2002:a17:90b:4c0b:b0:398:9c0c:7c72 with SMTP id 98e67ed59e1d1-3989c0c7ffemr32652283a91.25.1788248408489;
        Tue, 01 Sep 2026 00:40:08 -0700 (PDT)
Received: from v4bel ([58.123.110.97])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3990d4f1bb8sm5341572a91.14.2026.09.01.00.40.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 00:40:07 -0700 (PDT)
Date: Tue, 1 Sep 2026 16:40:01 +0900
From: Hyunwoo Kim <imv4bel@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: edumazet@google.com, kuniyu@google.com, davem@davemloft.net,
	pabeni@redhat.com, ncardwell@google.com, dsahern@kernel.org,
	idosch@nvidia.com, horms@kernel.org, willemb@google.com,
	andrew+netdev@lunn.ch, kees@kernel.org, jiayuan.chen@linux.dev,
	kerneljasonxing@gmail.com, ij@kernel.org, martin.lau@kernel.org,
	shakeel.butt@linux.dev, matttbe@kernel.org, martineau@kernel.org,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	imv4bel@gmail.com
Subject: Re: [PATCH net v2 0/8] net: fixes for requests completing on a
 socket that no longer listens
Message-ID: <apaBUYXZlemOU1y0@v4bel>
References: <20260824033331.1084971-1-imv4bel@gmail.com>
 <20260831163556.54f89805@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260831163556.54f89805@kernel.org>

On Mon, Aug 31, 2026 at 04:35:56PM -0700, Jakub Kicinski wrote:
> On Mon, 24 Aug 2026 12:32:44 +0900 Hyunwoo Kim wrote:
> > connect(AF_UNSPEC) and listen() move a socket back and forth between
> > listener and active session. IPV6_ADDRFORM on top of that turns an
> > AF_INET6 socket into an AF_INET one.
> > 
> > Two things follow. One is that what the socket had before the change is
> > left behind: requests still in the ehash, and parent fields a child
> > inherits. The other is that the socket is used while it is changing.
> > tcp_check_req() does not hold the listener lock, and tcp_v{4,6}_rcv()
> > reads sk_state twice without it on the listener path.
> > 
> > Patch 2 is neither. After a reuseport migration the listener that counted
> > a request and the listener the count is decremented on are not the same.
> > It goes with patch 3 because patch 3 needs it. Nothing ever resets that
> > count, so patch 3 on its own has a check that can be bypassed.
> 
> No reviews? Are people getting tired of the disconnect bugs?
> 
> Hyunwoo Kim, can any of the fixes be simplified if we move more
> cleanup / responsibility to the disconnect path? Patch 6 perhaps?

Fixing it like this [1] lets the disconnect path handle it, and also
closes the trigger path for patches 4, 5 and 8.

What do you think?

[1]: https://lore.kernel.org/all/apaAskNL-IvdcR7h@v4bel/


Best regards,
Hyuwnoo Kim
