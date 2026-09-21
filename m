Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48E8049E127
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 14:52:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790002377; cv=none; b=TYzjC5CM5APl0BLj1SGgJsV0J0xkk1ZzxvvMCj+IeEjnquaPvpPAeA9eDtf3yabvcKCtq0AnAe7pyBSL1HUBhuQ41w1036xq8mP2KrfiUn4B6EqSsycob/EyivUXT50/GI4L26/Bjj9rST0XyOd8mGbVnbj4T3St6iIxL38djN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790002377; c=relaxed/simple;
	bh=g+1M4HqjEzjilBm0PxJObiEwb0aU1IwrI5Gz76d/G8Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JMfcMCIocVemYJS/k0psCyEQHtg+WvmnjPTUE1zn9JRiVtqreXEXjJeo5iqlcbdtjU/ip1Kyfd6txvkZEFPZL/LK0buJfTI0svdp4xpdXT9huSJhdxLv2QFinc5t+8dI/OCPaPHG04+mdxgO9xTkEQAV5/TbqZpmQ0qLnROmYqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FcN9mZ9E; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=dduVtyj1; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FcN9mZ9E";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="dduVtyj1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790002375;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dte/ClAGy6eKCFKXrlyXY7UwAZkdvgemrmCIbNf+44s=;
	b=FcN9mZ9EptznOrpAT1s8BuRTzRSz9LOzs2GbwaD3Ghm0xk4BVLORBo84zoW7sDBtFw4EG7
	d40t7nVP+d6Q0shN5I/QO1kBHounZRiJJfhZVRQhUr7fXz51CBjpm4QxkvZnPWE6fJ5PU4
	rS0G2LiPOzA7c0L1y/hNIqFapBMLf9Q=
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com
 [209.85.217.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-455-5AHNQ3MrMtebysH7mR_JOw-1; Mon, 21 Sep 2026 10:52:52 -0400
X-MC-Unique: 5AHNQ3MrMtebysH7mR_JOw-1
X-Mimecast-MFC-AGG-ID: 5AHNQ3MrMtebysH7mR_JOw_1790002372
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7961a79fcd8so945115137.3
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 07:52:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790002372; x=1790607172; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=dte/ClAGy6eKCFKXrlyXY7UwAZkdvgemrmCIbNf+44s=;
        b=dduVtyj1zqWEiWMCwj2fHNNL/xygHFc6MZkhiDoLxNLAzVGRbappJBnX1DfitQuOUo
         fWnGB2nbBN8DiORc6/hZLFxSNKoLBmsZ4wo6fzjkYKq5nmhfNA/tFIuvPvBTZwrb0tCl
         ya7QBcfgvmybgnfhoJZPyuaChDZYR8lLUGw3ephlzYCXRM+izFuOSKUnqEC6VPF7yoVJ
         KC3MgRYiKUYORNpZcICnfAfwmvnqRSRHkrG3zDGJuKnQkxMRh6OXftZCiyYwCsXk53uB
         cF/sAmvU5sZQtCjHb1wVwBE8z2G9NETzpAOA0EMMy/nsKhfQx90Im7f/0G11JUQWeKU/
         jgCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790002372; x=1790607172;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dte/ClAGy6eKCFKXrlyXY7UwAZkdvgemrmCIbNf+44s=;
        b=dviF1Xfkj5BsOMT6vZiM6e+LdRCQ+gWx2Eo/qy8YUlWWBXxVCBx7+dZC+Ure0ElefE
         iGdGzpQkejJdzM+EGQYlcz4kHIWTm15ohZiKcBua0oqaBJzN/AtEb+xkv26IVnAtniqK
         eGnyeJP7CYUlLWCRlEby9gYGuxL33Mvq7KllGnFyk1Im8uuR89fMyqtee3F8qz8L4qQS
         8LSoadx5Q0lVfNfAPTtc5b4P1/WqG1qB39h4Xm+pDLoOWbPchcfgb63TE+UfKMtTUQuU
         ekDAG7KYicWGri6B6P1LF5POh3M7OeB0Yv82h37S/+iv4JCpww3yy0rwTS0R1AC4Tt2f
         WVZg==
X-Forwarded-Encrypted: i=1; AKwUvByk9aHrOv7IzZvk3IXr3M3/twcuDPO4TzXfeaBdLKkDWoKjsyo1DdFTsFXVyQHJxV8KTBONgu5XErhFYo8=@vger.kernel.org
X-Gm-Message-State: AFuF++nyJ3Zo8yZ3uOVh+HhHXHZ4wV7AssEPAuffNvtjfjaWuApEL9Cx
	uBpXUZaEZV1G8TnNlf6yOnkygjpSJlkvDc+jDlTqHuEVkkLoxtqQLT4RNkK5oR7oOsp4LBl62jH
	rHD+6j7A1Flj5fo/9AnoO7RQCrEzhqutzUnm0mOrz0pWzrCYQ0zSsGLIC1rOKqZeAHw==
X-Gm-Gg: AYBFou1G7z1nPkiyEmO3OaE7Ep2KxJ2C1zkTkukU2YO/ziy3tw2A0u0PMNFhntQsQSp
	DT/JCL/5RHhoFVNjCdI8qhYWjlQ7kdeyiq+07fbxYutErvSBg3ErJWUgQZu98oNELy3Sph+hIoS
	GrOQCmRfW+R6Pst2FcnLwuZA0WDkzTaagSh6PzrKB7MNtW01oT2Fx6ZDssp5C/nsS6t+hnr0kk9
	Ytg9Af07l9n8KKcaGKRIYpLyzwn8tMn6NmLY3xVQk2GqQ7HiOeA47lIQT01j/tpPt4AELwdq1No
	tqyKTfYikOppCDyE142ey+9b9xPMRYWNkk/vAnUKF73vB17AF6KnGsatUyrzwnvBkgYVIep9vlV
	KLido6J15eS49bXLJSb15MM0XRzPWnfGuc78=
X-Received: by 2002:a05:6102:e09:b0:7a1:f7d2:e807 with SMTP id ada2fe7eead31-7a55c0748b9mr4687568137.15.1790002372214;
        Mon, 21 Sep 2026 07:52:52 -0700 (PDT)
X-Received: by 2002:a05:6102:e09:b0:7a1:f7d2:e807 with SMTP id ada2fe7eead31-7a55c0748b9mr4687509137.15.1790002371483;
        Mon, 21 Sep 2026 07:52:51 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91260a3097dsm69888436d6.8.2026.09.21.07.52.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 07:52:50 -0700 (PDT)
Date: Mon, 21 Sep 2026 10:52:49 -0400
From: Brian Masney <bmasney@redhat.com>
To: "Ng, Adrian Ho Yin" <adrian.ho.yin.ng@altera.com>
Cc: Dinh Nguyen <dinguyen@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH 1/3] clk: socfpga: agilex: convert to CLK_OF_DECLARE()
Message-ID: <arFEwdu6EucK1G9x@redhat.com>
References: <cover.1789096458.git.adrian.ho.yin.ng@altera.com>
 <c7006ac0c353640f52902580564a85d6d23c57e5.1789096458.git.adrian.ho.yin.ng@altera.com>
 <aq2-Ysy2wbLeBWd1@redhat.com>
 <1abffb74-3b9d-494d-a414-ea21d537ed74@altera.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1abffb74-3b9d-494d-a414-ea21d537ed74@altera.com>
User-Agent: Mutt/2.4.0 (2026-06-19)

+ Bartosz

Hi Adrian,

On Mon, Sep 21, 2026 at 11:17:13AM +0800, Ng, Adrian Ho Yin wrote:
> subsys_initcall() / subsys_platform_driver() would not fix the failure we
> are hitting. Both still run after time_init(), while the DW APB timer is
> registered via TIMER_OF_DECLARE from timer_probe().
> 
> So moving from core_initcall() to subsys_initcall() changes nothing for
> this consumer: the timer cannot defer, clk_get() still fails, and the timer
> is never brought up. That is why these patches use CLK_OF_DECLARE(): the
> provider must be registered from of_clk_init() so clocks exist before
> TIMER_OF_DECLARE runs.
> 
> On the broader point about CLK_OF_DECLARE abuse: I agree it should not be
> used merely to beat platform device probe. If the preferred approach is to
> keep the clkmgr as a platform driver (subsys_platform_driver()) and give the
> DW APB timer nodes a fixed clock-frequency instead of a clocks phandle, I
> can respin that way. Please let me know which you prefer.

I wanted confirmation that you wanted to use CLK_OF_DECLARE() for the
system timers.

Will you by chance be at Linux Plumbers Conference in two weeks? Bartosz
is leading a discussion about the future of CLK_OF_DECLARE() and
friends.

https://lpc.events/event/20/contributions/2503/

We want to minimize the use of CLK_OF_DECLARE(), so the preference is
to keep this as a platform driver if possible. If you are able to get
around using CLK_OF_DECLARE() by initially running the system timers
with a fixed frequency then I think that would be preferable.

Brian

