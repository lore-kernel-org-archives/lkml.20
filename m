Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792664198;
	b=f6M9NZ5YAMC7oWMlRg/jvQLepytX8rDj1oQVGJeytUbo7Rkp0gfrD+VzLvhxxNR15VZp
	 cN2cu0ynOw6BP07u52MKvgZBdX6IYwwrPXU0frYaWQkKU74W6ExiriuUwgt0yP2TbKskw
	 kFd9T2RSGQFKNwEaK1Ittg/fjx1zG7IGApvRYprMPzob61HpDWJqQD/w1WuX5RnAn2+ra
	 5LsvkcWraE8EJFSDzb5/7wyGPW4m5FsojU9QnNSl8i4C/SfKnEf8vRxf2QR2j234r2HFe
	 3Kivng/YX/BYFi8p2WvSMXyt4VSYqKrysP9JdIFnha4GCBpKUf9vp3NZxKNJ2jj6Hzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792664198;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:Date:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=yIJA+LY/J4smL2e8nhrsDvE/0PSgaY5RU2DGHQx94co=;
	b=Yf+cy9QB4MNnrGilGHpznD2OXX0QoDxB8ZE9d/PvJflKTOdx51MTlLcfVLXAx2TvKcXP
	 u+okBgNVOIYT70PEzHcAVSIzyNCjePI//z8faNLLvPeqiKWp0wS08CWdeegyRHxhQi0pk
	 IR4KYocRSMKP4y7sYV87jbU/fR9k+ACqOSUJSaAwyIPLDwgI5qTuuzee0ipNJzS64MaIv
	 1RYOuQL13nHZx03YNSIgT/oJeyfZtwBvYtRZVbVlK3wRUXZc20i5d6HOK8K3CYUcojbH7
	 nbo8x1Gb3ypkyjP9q0tCn2et5FflPH/aGI7duCaz0gjMHVeUY5XaqC0IVUNuEtP+8Tg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=RM051wzi;
	arc=none smtp.remote-ip=209.85.167.169
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95604606A322
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 10:16:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 95604606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=RM051wzi
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-53ec92375d2so828268b6e.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 03:16:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792664196; x=1793268996; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yIJA+LY/J4smL2e8nhrsDvE/0PSgaY5RU2DGHQx94co=;
        b=RM051wziSHHDi6dz68xoW8UAdkq3DP+jAGVZKwRbd7iXLQNpTebA2mMgPq4WW3cKhE
         MKBPOdsWNAcwzLghxviDIoZ65bXBlBNEiG1Qp+Hg9ZlPX8hC9MpoTAF0PdF2OSj+3Aci
         sQ2tm/u/NFEyy3oKkHa22rxNB9n3lacrosAtOAfqUQp/0AKLXm5l+xFsKHVduXH+Netq
         DcbM1n86H7K40d7HRxPiWj+4EiwWijWbUeoX8Csx1vOwp5W/iTVoI1H+dUnZ/gruemmW
         uGdWsJNtv6G1eH3jKwJx7Fi0xx/4rYBPhpHqHFpQhkenhGCOPb+bvvwQAe3XijN98sSI
         RIjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792664196; x=1793268996;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yIJA+LY/J4smL2e8nhrsDvE/0PSgaY5RU2DGHQx94co=;
        b=L7A9uEbmhhzW0wAAmjqwtr9nxEbUW9XJ3tcm+ca20lDf0njMj02TNWW2+u8sYqaDSp
         LmZxZw1TG1Objaox7noLc9Q8xO1r/jYoXImV8TNzzZsTNJXog+WJvc//eAtFIp8Gtl6g
         45IA2GJce/JkkliVgWtSKIGmthGx/wsa4FaFs5+jIHxfzK1aMCOJ9qNTXSh+0V/lgLR2
         BYTEXQIYURYhATIySmDa0NwbYNcmVVEwOJdL7YaXDWXVNQDp98Lquywpy3vcAJluG4M0
         eazFAW935GQJ1w9soNfqFiWwD44brmQiqu1VD1iKc2cluz43NO47/uCL9oREGCmpFHy+
         8Sug==
X-Forwarded-Encrypted: i=1; AKwUvBw9ntMRY4XTILEtmHijybubPfqZMMbtnOvgJsdrqu6fsLRyx8qhhyODTblcRBU5J2exiuJr14W7s1yuNW0=@vger.kernel.org
X-Gm-Message-State: AFq9FYKDWe8vYphSKAXcFF1MDmE3+L5WodQCMu5qrgYpAdhRYN9//mFo
	usF7w/Elx7cmsgZZHI+kL1OZy0kuxPJAy1W7CHfiwEwS1ltrIONwb7qi
X-Gm-Gg: AYBFou2cqlDfYi3kTgl0PR/dHv4xE6nehVwC+xK8FsfZj3Qh6Rk2yVOppSgV1Av8/lJ
	OLYd4MbrtG56/sblKRrp+EFjMEoWdWbCKOVOnZlZm24iILaaJuNHzwoeYS0PFd53nvgPQjiJUjF
	xA+y0hwZ0mMAuZhy+1c1JoOLS/o20cS/GqYsx5ADyCKRrgQ8COTcgC1gVW7W7HvPAQtl6YOB+nZ
	hdi85cLwf8qzWS8OQF+Q1wNJ5pOHCFzKPjwbX1MQ5KxfdjvHR5X8zcUGI0iZPEXjpok9OmGMJ2w
	6xK9NfUr6NteH7OZKOMt/tsbldLojIWwpGqdCWHh+mnsjtm6pFslfStCsAF4MyNcRZZ5v2/TSxk
	duaVhQlS7JzwqEtojRE2Lfs2s9UDuBQon8P6AhW1GKrxXFG2xP8eSYlEWdIddoV7C3gzOR98K5e
	SRvQRJy/4Af10trMkLOlCMumoNSPgLfgloYi1dqw1umvZAcgudwTGRHm7aOQ1iQ1RhVBj0e5pxl
	CxarV2ffKzEmVker2fRe+YjoR8O3Hkw29k0iUJGJbMlNDDfN+wa2BbHFNybK73dWT+tyxHrYGmE
	l0w4Iee0T58f6jX6b4tYt4SvEKOM1mKLawdMN4N5iyWtPySAHHr2
X-Received: by 2002:a05:6808:1715:b0:4dd:18c7:5448 with SMTP id 5614622812f47-5535babba3fmr3335289b6e.56.1792664195793;
        Thu, 22 Oct 2026 03:16:35 -0700 (PDT)
Received: from RDEALENC-L01.ad.analog.com (158.95.44.30.netskope-rdns.com. [158.95.44.30])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a7d8ec2584sm3950553fac.9.2026.10.22.03.16.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 03:16:34 -0700 (PDT)
From: Rodrigo Alencar <455.rodrigo.alencar@gmail.com>
X-Google-Original-From: Rodrigo Alencar <rodrigo.alencar@analog.com>
Date: Thu, 22 Oct 2026 07:16:26 -0300
To: Arnav Kapoor <kapoorarnav43@gmail.com>, 
	Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: jic23@kernel.org, dlechner@baylibre.com, nuno.sa@analog.com, 
	andy@kernel.org, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] iio: core: fix signed integer overflow in
Message-ID: <d6aqsd2i6pyqj3wydjksgtg2zoght5i2fvunlftsko7urpyw3u@k2huwktmvcql>
References: <20261021225306.623361-1-kapoorarnav43@gmail.com>
 <atm2WhX9KDkbUIPk@ashevche-desk.local>
 <20261022082448.275582-1-kapoorarnav43@gmail.com>
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
In-Reply-To: <20261022082448.275582-1-kapoorarnav43@gmail.com>

On 22/10/26 13:54, Arnav Kapoor wrote:
> (Resending with the list Cc'd, sorry for the duplicate, Andy.)
> 
> On Thu, Oct 22, 2026 at 10:08:10AM +0300, Andy Shevchenko wrote:
> > This needs a Fixes tag, otherwise it probably won't needed as Rodrigo working
> > towards tons of improvements in this area.
> 
> Will add:
> 
> Fixes: 6807d7211327 ("iio: Factor out fixed point number parsing into its own function")
> 
> > OTOH, Rodrigo's test cases might be good as part of this fix as well.
> 
> As far as I can see, Rodrigo's tests in the E notation RFC exercise
> kstrtodec64() in lib/test-kstrtox.c, so they won't cover the current
> parser. I'd rather keep the fix small for backporting and send KUnit
> cases for iio_str_to_fixpoint() as a separate patch, if that's OK.

The current parser is being dropped in the E notation series, so that
overflow concerns are handled differently. iio_str_to_fixpoint() is being
tested there indirectly with tests on iio_write_channel_info(), maybe not
is thorough as it should, but it tries to focus on different format types
and coverage. Dedicated parsing tests with different inputs are handled
in lib/test-kstrtox.c. With that, not sure you need a KUnit test for the
current parser. Only small fix meant for backporting would make sense to me.

-- 
Kind regards,

Rodrigo Alencar
