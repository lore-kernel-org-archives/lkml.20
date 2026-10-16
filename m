Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D40B471422
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 11:16:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792149398; cv=none; b=eX1sABDeCf3dU7pqJ2f3cNGVGFLmmO75j7Pm5J1m1DI207TmJUTMdDloy5gZBUlKZTmneRw6Mue8NS/0NPYe2jDyGYEuKLKZhI05NXlYTleH+wPGhD1/kIEk6Sgvr13dnylOXmLw4C7mDlMMt2DmIo713AOwLzUHe1oZ6eV+8d4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792149398; c=relaxed/simple;
	bh=ZAYhk6PMtKBOMMp3ORqbpccItA1ZSa7BhG7T6KgZAc4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fltK5MMdUfYM7UXWzlrSrQ5yKcdmoF0jov7TICOns9zFKUsdWivkmiyyU2EsDuSeFQ/Wod+wtQ/tExf4RQZnnvZR7J63UWqWMpK9BoK6/Oa6MKd7DhnJQm3o9meRJ/9Y9fmYmsYFu1/wsxaVcR+1KN0dEEJ/s9X+gFA3NvZ7Bzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Aa6E7wxp; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Aa6E7wxp"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a1d484b4a9so540085e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 04:16:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792149394; x=1792754194; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=q91Kq2uD425J9aokyBJE7F3MzPbeOxtiMjGUu3KOuYA=;
        b=Aa6E7wxp2zDK7iTgQTMJ0v3ZOO/OOOZ0CXsHgDEkQdYScSHsk6FaePjng4izs5jyWO
         Y5fFtGoVvlNLy91sa5Pb8f+gLiIQpzmoEe580778ehRsNTFxjBftCjMTanTalH3glmUn
         GEdx9LZQEUcAUgLKkP3kMceiYPyauTtXerx836oBxrouM1lTiykY2G5FOqu5s9N20GC4
         qDA5+J/yznOe0j1RDjWQlkPHOQe0BEQLDqdw6833SUIwrEZ6FXfgGylmqaiAIKz7m5IA
         +4og/hDJDZhrHspq8rCZVEWoNSSjcwPSb5wZPodv+PWAxOYJCXxAfpfIDNsZJvBlpX1s
         Vn9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792149394; x=1792754194;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q91Kq2uD425J9aokyBJE7F3MzPbeOxtiMjGUu3KOuYA=;
        b=MLV4i/y2xGSXrw1VDmT6E/9G6G+VP/zH6wFlvoE2NP4tz7EPrhf8S+VgXY+JddueNM
         8mgH3A0pVsRJrOO72+v2dcJx0g42bjRcGJAx4khJaqShbYaTf6tcdqvPYL4YN8S6bQZU
         jsPptGFByWEuGf3ovFU4tqINTkbLH0CUHxRSLCLvUXXS/AUKY4yrxDO7EsTa2Rn6Urv7
         hwynCUcmafl1GYslUCpMejjmEZ1Ieq3AOITsaRLVw+YgDQPvVmKsSywRxIM3Q0k++bxq
         ldb/SpSXgjejLELs0DY04QFE2V00P1Er3ZY3UEWiNBb22UeMf9+1LaHA6iLdxCd2fm/f
         s2HA==
X-Forwarded-Encrypted: i=1; AKwUvBywHP/YVjPOJqUWiiXSv5diWDKxexoYU231PTKKvGwKehIOXqkaAsdSlXbqmEK5ry/TzfacVf9eFY4QbjM=@vger.kernel.org
X-Gm-Message-State: AFq9FYL83YPVkZKyioC96hTXCkTVY5mVGpjifsNjMeAj1DhLYfF38PbL
	B+jfFadlgsVjYTZ7M7D3ZozsYxS82eJQBYQ43uCumsb53PlPXOM6bl3v
X-Gm-Gg: AYBFou1QlgwM5f/XPBjOn++wLoI6kYZUHRWrHsJtGdtBoxHa8wdtAVz/fGZ/jgfHk80
	JpeYLXq0Mtn7l9m+C0fnZ4IkPBnTYlH8A9yZw/UqngKsl2vibRtTqSRoO9YQNfJ8TeEI4nkR8gO
	4EeYO4tlhscclt/tTcycUIfwK3Py7NnRGdln6Oo7dwHwsW3rr2GnIhvVHfbUcWWiSSS984Ce73v
	8ERVPergi1lFWzMzTDSP3g8DI2aNPIQ3CqtC6GPrZXCwdxMF1Tpx/H+0l18YKLeKfJgw/wfGZhs
	z3Oawo5/c1DoKQdXfJa/s5aifG7qR6VA0J/sDdfub8UzBF1s8d6Pnlrmp6bk6G/zvsIzocpLAXw
	zV31dNMBBgUWXqvbkz7T9L8xPjxha7jqlZijtxphw/B+V++ikzr5AzDVPgEEQxLTGgrjXAuyZnL
	5nq8MGGA+B+/urlXhaLSkWa7rqo6M247irRTloxIztfFL9nVENZ9HQ/RMGGWkaRqYG2e8Qq5m0L
	iQ6l4+oDoJLjOHO89dJy5oB2smnKBVUvfVFriqBwJHlmCBSxlBTPD2rlABBvJPOvYEz6Ob7/sIu
	bfoaxU9yqHZkoaeZm/1CDhtbEXv4DP3M0V9pXKhYho5yynbyKIib/tP5qDxyav+0NXPDq612x1M
	=
X-Received: by 2002:a05:600c:4e4f:b0:4a1:ad27:e797 with SMTP id 5b1f17b1804b1-4a1ad27e79cmr243682495e9.6.1792149394233;
        Fri, 16 Oct 2026 04:16:34 -0700 (PDT)
Received: from unknown748F3CBA5068 (dynamic-2a02-3100-a951-9501-1471-d90c-a21f-9dd7.310.pool.telefonica.de. [2a02:3100:a951:9501:1471:d90c:a21f:9dd7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1cf05009csm34075975e9.10.2026.10.16.04.16.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 04:16:33 -0700 (PDT)
Date: Fri, 16 Oct 2026 13:16:32 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, netdev@vger.kernel.org
Cc: "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Wei Fang <wei.fang@nxp.com>, Clark Wang <xiaoning.wang@nxp.com>, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v2] net: phy: realtek: restore RTL8211F RGMII delays
 on resume
Message-ID: <atIHEinHKXsD-0z8@gmail.com>
References: <20261015045001.83986-1-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261015045001.83986-1-kmehltretter@gmail.com>

On Thu, Oct 15, 2026 at 06:50:01AM +0100, Karl Mehltretter wrote:
> Reapply the RGMII delay configuration after the existing resume delay.
> 
> Tested on a BeagleV Ahead with an RTL8211F-VD at 100 and 1000 Mbit/s,
> including close/open without a link partner.
> 
> Fixes: bb726b753f75 ("net: phy: realtek: add support for RTL8211F(D)(I)-VD-CG")
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
> Assisted-by: LLM
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
> ---
> v2:
> - Move the shared RTL8211F/RTL8211F-VD resume-path explanation earlier.
> - Add Andrew's Reviewed-by.
> 
> v1: https://lore.kernel.org/netdev/20261014033659.95196-1-kmehltretter@gmail.com/
> 

Now Sashiko found a possible clock reference leak in the resume error
path:

https://sashiko.dev/#/patchset/20261015045001.83986-1-kmehltretter@gmail.com

I'll take a look.

Karl
