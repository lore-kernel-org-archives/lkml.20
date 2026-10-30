Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793365216;
	b=NBF2HGleUTnc0Ov4GdvG4ihLaklYaEfpA3ininPZLia92Of144CKjLQjIhlmBRAcaO+K
	 UTcbsEefuzoJvph1LoLs5cNFRWKgUe3D2aoHHSm4uoNe/I+QetAFFF9L7pSN0AsExlz/1
	 SAMj8xg9b+iCivqkbk3dhNm0oUoRzVrKCu+3ovFQaZ5gc5qYbtzii8Xyl2yeKyqdEB6tc
	 s+LJB5/nPG4ry8a1ZpSc+ZymLCE8cv1g99h+HqlaYQ8WKRuF4+0QW04kRIzZlExAZnEGI
	 iL/0y8Ft9xy/v2o7X6y4Iqy1vzfLZHEhj6mBJ5A4TUTjWHrHA43+/Lkj4mO9pCCb6yA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793365216;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:Reply-To:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=j+XGS2hwVlkuYOzPsJhAivfW0qw6OY/isoGaMkh2h1w=;
	b=CGjddP289d/SdboMC0gwPpamUtJz9Bln6do24EQEFxZGJ9oL624Lh7MioXcqvghoV22v
	 GeQbMOOcPFeR4NEf5l1q15V+NvuwDEHJje94vbF88WQpzZ/AQWkUdOFIx1ofYBbpt29pl
	 T5AxUWYTAzbmUXglTaIUrMo/bGh2Zq9sbyoGxwGCtCt2eE8m0o1JX3DIFgkNDBwLo/HtH
	 4ewe+xkA+f05Gmf6y5cVCFGzkDQVh1+r7awZu/4oTaU7ag3Av9iyRFTqmEWAOsT4BG7mc
	 Hyq7Hnlhl0jmKjwQUEtGG8cgAewfGPyOzPOuk1od2j1sxdEPHCOH56No7pYxaa6ueFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=minyard.net;
	spf=pass smtp.mailfrom=minyard.net;
	dkim=pass header.d=minyard.net header.i=@minyard.net header.a=rsa-sha256 header.s=google header.b=SW+lz4cc;
	arc=none smtp.remote-ip=209.85.167.175
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDE4B606A320
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 13:00:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BDE4B606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=minyard.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=minyard.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=minyard.net header.i=@minyard.net header.a=rsa-sha256 header.s=google header.b=SW+lz4cc
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-4af81963f35so448759b6e.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 06:00:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minyard.net; s=google; t=1793365214; x=1793970014; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:reply-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=j+XGS2hwVlkuYOzPsJhAivfW0qw6OY/isoGaMkh2h1w=;
        b=SW+lz4cc+IFGkxyrSxYB/aCo5Lyvok7AKYCQ8Wz5skuiNIZ4vaNdC7rnD4NuoCYHXp
         RUqUWGosKn36y+fuQNVuKSDzfhBBKAcuFGSHK2uwnqby/qDm8e5SGkEZoecvOEd3ec4F
         aTZilWeAZUyl0fJ7KaOZom0/S86Tyw10LYujmkPjheHIXvwXXlYGzkTh7QyAdC3AdjqC
         CHa19D/MGMYc3+s+guYXRqykq0IFpT7KudMITA2jfaPbBfYW4eSqak9b39RcBt+hetVy
         KZ146IKiUui4nWPrDx+htYESibj1qbk5nb1e2y3bx6TiGnnSWKtoGr4eYeaNm7EBTaSm
         XWMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793365214; x=1793970014;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j+XGS2hwVlkuYOzPsJhAivfW0qw6OY/isoGaMkh2h1w=;
        b=rtHcU3N8q7iBD04dv9Dtbj2f7C2rHomgKU62datW8PN2KLo5cGx39dOfyNG8kxIVb3
         oBcSAmfcfQnXzAX++IFcMaPU1zAqEUbUosiZGVvkEleG1wPWi/Mvyl8BnxbFUO6W+ifi
         nu4U2zs5r5LMmk5HV4C36IyrJALng2kWB1MRnsGgMob4Aydj+A3G2KkwdXcSJUSfx0X7
         RX/ltzRdin14z93tzWfsFjdcQxfIoUztz6MbadASxG5e/w+Mz4kIPoQctZwO/B/8swUD
         UAChR/WqlFb5Y+jCWzRQ9wAqqo5DGA60DzrQAGjmXBlcQHIDG5LaM9OfYfmgpitjeFzf
         pEGg==
X-Forwarded-Encrypted: i=1; AKwUvBwQIXMS/eQ+z0IRzwg92zOjnTvzjqYB/GPZbMqPx4a9OCzdsS6hhI/XO+gmQ0H5KdzV1D5rtqGmev2u838=@vger.kernel.org
X-Gm-Message-State: AFq9FYLuHimYAVvgbOywDeaUAxRkZHeO1A9bl9X8Y/BkL2dtU6HbPugP
	QVhZ5K6Qo1DhKDcG0Iqa0e/Wz0BdyeDH8rV4XMlmqFXS7L/kUGJERCHzBe4+ZNYOHaI=
X-Gm-Gg: AYBFou12mSFqUM9BG+W/br/Pk4MT1T694o5zTNAgDSwfhCPA86RKCJcHhZFCcFtWiDJ
	kWlJX3tUpg6frRhx7VNMksBGFnmreSD2iE6Cm9pi4Vu0qM4PXp+19CZmbazLnAJHxgM/1CBHpmV
	NZ1Ul0drvZmUS+DajhSFhDt6Nz0RPXsVsXlI210IQKXmbPPrE5C4hF4oIjbUXRloaGGHFGTV3Oy
	yekQkFzhIG4fYIiB89x5LIG0WGNyqTc16ljZLCqP1G78YYzVuQOm52phOZUpUIxTXik5g6+j3KD
	WOvodyZp4K7J1Ra/LUy3sV6MDhfR+GoGrEWTCrNsG9vhMzkVJ0rIFiid8G+Es+hdrDDpZwaib95
	PH5mcJ2TM4MGJbKyBwpC0HHPCzoPKQ//c5dYyAnldjytHMGCG0AYZyarJ0UHEJwnQf2Ac3RHarQ
	eRqVJhZ8m1Iau7MhaVixsCq6CkFtbvNBpwfMXBF4qcYbYtlrnYG3sD5jIjtp938tZwoLwRgwXRf
	iDwGCHqc/+0J/nRIThwaCkRc+B4hMi4c5LfibxBpbTwBw6dW//QKTYQe3Y0335OtQ6/4VbKKMX5
	qWQy/Sp3pPnYbe1sQI5W3qH7SSszncQMTfbB0o7QfnZI1Y0KhZqWs630RmO7bc9LsHSN04ApyWS
	d6Pm5if/MVNomt0/ju6pfDNjWee7acNVCbVbU1bPfc0ipncbYiJjfttRmPhAaZnJCvYRPlzc=
X-Received: by 2002:a05:6808:bc6:b0:4f5:e12:b47c with SMTP id 5614622812f47-5640dfec8e9mr1440993b6e.48.1793365213098;
        Fri, 30 Oct 2026 06:00:13 -0700 (PDT)
Received: from mail.minyard.net ([2001:470:b8f6:1b:2f32:e466:d3ef:5b82])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5640fd95562sm1408464b6e.4.2026.10.30.06.00.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 06:00:10 -0700 (PDT)
Date: Fri, 30 Oct 2026 08:00:06 -0500
From: Corey Minyard <corey@minyard.net>
To: Breno Leitao <leitao@debian.org>
Cc: openipmi-developer@lists.sourceforge.net, linux-kernel@vger.kernel.org,
	kernel-team@meta.com, Dan Melnic <dmm@meta.com>
Subject: Re: [PATCH] ipmi:kcs: Rate limit the invalid state warning
Message-ID: <auSU1tHoDTrIkHoR@mail.minyard.net>
Reply-To: corey@minyard.net
References: <20261030-ipmi-v1-1-f84d5fa1fa6c@debian.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261030-ipmi-v1-1-f84d5fa1fa6c@debian.org>

On Fri, Oct 30, 2026 at 03:29:45AM -0700, Breno Leitao wrote:
> start_kcs_transaction() warns each time it is asked to start a
> transaction while the KCS state machine is busy. The warning is not
> rate limited, so if the SI layer believes the interface is idle while
> the state machine is still running, every message sent to the BMC logs
> another line.
> 
> Kernels carrying commit c608966f3f9c ("ipmi: fix msg stack when IPMI is
> disconnected") hit this. When the interface is declared hosed, the
> state machine is reset to KCS_ERROR0 rather than KCS_IDLE, and keeps
> walking the error states while the SI layer, which treats it as idle,
> tries to start new messages.
> 
> One host logged 29K of these lines in four days, several per second:
> 
>   [Thu Oct 29 14:55:54 2026] ipmi_si dmi-ipmi-si.0: KCS in invalid state 9
>   [Thu Oct 29 14:55:55 2026] ipmi_si dmi-ipmi-si.0: KCS in invalid state 7
>   [Thu Oct 29 14:55:55 2026] ipmi_si dmi-ipmi-si.0: KCS in invalid state 8
>   [Thu Oct 29 14:55:55 2026] ipmi_si dmi-ipmi-si.0: KCS in invalid state 9
>   [Thu Oct 29 14:55:55 2026] ipmi_si dmi-ipmi-si.0: KCS in invalid state 7

The rate limiting is a good idea.  I've included the patch.

However, it also sounds like you don't have working IPMI hardware on
these systems.  The change you mention just exacerbates the problem
here, but I think it would be a good idea to track down why this is
happening.

If you really have working IPMI hardware, then it would be a good
idea to trace down why this is happening.

If you don't have working IPMI hardware, then it sounds like your
system is advertising that it has good hardware through SMBIOS or
ACPI.  It would be good to either fix your firmware or add a deny
for this particular system.

In either case, this points to a bug in the driver; it shouldn't try to
start a transaction while in error state.  I can't see it, but I believe
I can reproduce in simulation.

What specific kernel version are you running?

BTW, I need a link to the discussion about this so I can add a Closes:
tag to the git change.

Thanks,

-corey

> 
> Across hosts running such kernels at Meta fleet, about 887 million of
> these lines were logged in one week, all for states 6 to 9 (KCS_ERROR0
> to KCS_ERROR3).
> 
> That commit was reverted by commit 5d09ee1bec87 ("Revert "ipmi: fix msg
> stack when IPMI is disconnected""), but nothing bounds the warning if
> the two layers get out of sync again.
> 
> Use dev_warn_ratelimited(), as the SI layer already does for its
> transaction warnings, given it is cheap and will protect us from this
> crazy flood.
> 
> Reported-by: Dan Melnic <dmm@meta.com>
> Signed-off-by: Breno Leitao <leitao@debian.org>
> ---
>  drivers/char/ipmi/ipmi_kcs_sm.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/char/ipmi/ipmi_kcs_sm.c b/drivers/char/ipmi/ipmi_kcs_sm.c
> index c89055db39e52e..ae0399ccd82196 100644
> --- a/drivers/char/ipmi/ipmi_kcs_sm.c
> +++ b/drivers/char/ipmi/ipmi_kcs_sm.c
> @@ -271,7 +271,8 @@ static int start_kcs_transaction(struct si_sm_data *kcs, unsigned char *data,
>  		return IPMI_REQ_LEN_EXCEEDED_ERR;
>  
>  	if ((kcs->state != KCS_IDLE) && (kcs->state != KCS_HOSED)) {
> -		dev_warn(kcs->io->dev, "KCS in invalid state %d\n", kcs->state);
> +		dev_warn_ratelimited(kcs->io->dev, "KCS in invalid state %d\n",
> +				     kcs->state);
>  		return IPMI_NOT_IN_MY_STATE_ERR;
>  	}
>  
> 
> ---
> base-commit: a39c950806213f6861d00f90729acaaa21f2d95a
> base-tree: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> change-id: 20261030-ipmi-a2223415ce84
> 
> Best regards,
> --  
> Breno Leitao <leitao@debian.org>
> 
