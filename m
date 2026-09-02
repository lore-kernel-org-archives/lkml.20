Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D4B03DB97A
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 07:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788335721; cv=none; b=Xcp949WKVVEF1RzJpurQRyoz1oelFZXexiiqSvqAfbq/u6tyeBvlW0owPU9V9I1NKBzMv05fzH9u2HSj0NhehqtcbIpJor1p5C7uL5sK4sLzihjLOf7+A2WdCyxgjgvoOuo5uGEl0sf7+Qj/STIaG0D0HZ+I6M29Ns7dsNImR2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788335721; c=relaxed/simple;
	bh=LqmhBA2Uaqj96r7IoqhILAq5dspdgOGcSa9hyKEtVSc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dFJe5Sa5jtciJsAUI75kUwMe/K5wtkmXAZY7mfJivrBjWLq0ks17NugBrUqUY/nq7L2vAP+lXVfvuAMpq0LGHQVYErFD3JI2tge7uPuMsjYq3vEQfd8kIwCx1RhFApiKWcPOp6S1weDNoCI0QUvRt7ZInIGeEeXvKpDELT6pYaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jnd9SLym; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jnd9SLym"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-47ddf7b09e5so751351f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 00:55:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788335718; x=1788940518; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6YX0g1ltOeVRJXePTRjTJXJYLcoS+wQGBHQ9Rhr0r0g=;
        b=jnd9SLymUfbnTIvOXekvWtxAKvJ+p84oG/hHo+EX1YZkWYmbNQ3SIGJkIfSDFh43Y1
         z9F5uIp4TV39aFT1R52bQ2yl8XOkO0Jtd+IB/aYjpUSNGRvGf+rAogncAGoOtA/xBbKI
         98/hCtbrzraUX1KA7/zJvglLQ/R93mvnsAdKmfr10CltQfYz7Yq/PcLLUiwMRTm2Ktgw
         pcVqe9MsN9i+5e2JjF2gcfyj7NMbOclTNk0+I/9EMpkbBHpS4K+wBw3EARNzuHidGZyF
         gsba11uQnjLt6vrmU3rPY0dXjJxxA+RZAIMNRJOmyF//Iw1GgfnhHRz/0N4HsdLCsGvq
         8uEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788335718; x=1788940518;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6YX0g1ltOeVRJXePTRjTJXJYLcoS+wQGBHQ9Rhr0r0g=;
        b=XNZiecyXpJduDZEaCje8wojQWcvomE9CK3XvIUW0laRv+cPk54t/xKJVn8rLZJMtfd
         ak+tdrjXnfjDrTqX+RjQwcNrtnx03SvJzY9NxVkHfB39UdK7Kx2gpUIli6z7LQT88/rJ
         BbykrSHbDZYBEUV0BhB1Jp7tvh/6ccIQhN8ZP5JUqcEvgxtKtfTSMTJ22nLqBROsmeCg
         uWImPX7brz8mtpOmH4ywtDdGSYTwrpXBdgdOqPPb+xoYa0iwD1ApOLJqxCML7Vy1WCa6
         BR6MEKRtkHtQyIluQb1lNaGd/0YeJDeovDSmwjx0yE/D8P6rFsTzUhwuZtu1spDM7ldY
         QIxg==
X-Forwarded-Encrypted: i=1; AKwUvBxUpVXi8T+wne+YCQmYmUS5wQi3Lb2X80wpXLwp1XFKeA49g+kddfEOggBIwTrb97KimeuOYTsGGT23Wkw=@vger.kernel.org
X-Gm-Message-State: AFuF++kPluIH86SEF9zM7njPnowV11APeqFXS1aTINGTpQN2Sttg5CiM
	gGWqrt2V7qL9RqbjHOWl87TIXh2K2qN2vk1pqeG8h3yGbTzvVdTPXlX3
X-Gm-Gg: AYBFou15vTYzm7EIifzMeXt1YA+i98MeZl00rgYsFB0U4eQKTH/shpdKCn08lgTR9Yu
	2TCoyNtn1UbBwQckksF0eMMxgVjaUrVWxKHOYfEzu9nrQletaVXAkP76qIWEXmNQtvuJozw9N3c
	ymqy/EdSkbMDoLNDT7u9jO4wU7zSOTNLKH0GaSX6nAgou869zvJ1VlRjhFX66oNo6SIRw+v7J7u
	t6MKPFkTkPI+ZPQEdzI/g2iWPxnjVeOjkBjC40pEUiX5l4v4nw2J0R8YW1j446E72Ugx4LzifZ5
	2Q4lxena+CTFxppTiDznNOge0Z3jlBXnif7I+dDEe07SxR7/nJ2+5THgPLvmhaLMI17iz0YUNoF
	rdG0g02RFXffMbVtE2AUwCC8DEu5zFWrdyEvo3UjGY1rLYr9AFGTS3o1mgiJKJS6dAzR6XOqT9G
	68aa2COoBu4JIYbVdhAM+A6aqcxmCdJrqUUHuc78Kz9m49zqs2s0i/UGOpt2/ycZVw3rQEbOfxU
	l+B1UHLVWYxAh5NHCe+el3MkKO0DavUmwGnr6t3J+YGwqv4AKbS4kKM
X-Received: by 2002:adf:e196:0:b0:482:e451:6810 with SMTP id ffacd0b85a97d-48488dee050mr5700746f8f.1.1788335717956;
        Wed, 02 Sep 2026 00:55:17 -0700 (PDT)
Received: from [10.0.1.42] (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448ed30c0sm4797705f8f.24.2026.09.02.00.55.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 00:55:17 -0700 (PDT)
Message-ID: <fe9a266d-695a-4379-9aaf-8ed9ce02efa2@gmail.com>
Date: Wed, 2 Sep 2026 09:55:15 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH] crypto: caam: map job ring registers without claiming
 region
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-crypto@vger.kernel.org, =?UTF-8?Q?Horia_Geant=C4=83?=
 <horia.geanta@nxp.com>, Pankaj Gupta <pankaj.gupta@nxp.com>,
 Gaurav Jain <gaurav.jain@nxp.com>, Herbert Xu <herbert@gondor.apana.org.au>,
 "David S. Miller" <davem@davemloft.net>,
 open list <linux-kernel@vger.kernel.org>,
 Francesco Dolcini <francesco@dolcini.it>,
 Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
References: <20260901203736.13248-1-rosenp@gmail.com>
 <20260902061059.GA7187@francesco-nb>
Content-Language: en-US
From: Emanuele Ghidoli <ghidoliemanuele@gmail.com>
In-Reply-To: <20260902061059.GA7187@francesco-nb>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 9/2/26 08:10, Francesco Dolcini wrote:
> + Emanuele
> 
> On Tue, Sep 01, 2026 at 01:37:36PM -0700, Rosen Penev wrote:
>> devm_platform_ioremap_resource() ends up calling request_mem_region(),
>> which fails with -EBUSY on i.MX SoCs:
>>
>> There the job rings are modelled as sub-regions of their parent
>> fsl,sec-v4.0 register window, and caam_probe() already reserves the
>> whole window exclusively via devm_of_iomap() before the children are
>> populated.  Every job ring therefore collides with its own parent and
>> fails to probe, taking the hardware RNG offline (seen on i.MX6, i.MX7
>> and i.MX8 boards such as colibri-imx7 and verdin-imx8mp).
>>
>> Map the job ring registers with devm_ioremap() instead, which does not
>> claim the (already owned) region.
>>
>> Fixes: 9a955c0a7d11 ("crypto: caam - simplify probe resource and IRQ handling")
>> Assisted-by: opencode:big-pickle
>> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> 
> Reported-by: Emanuele Ghidoli <ghidoliemanuele@gmail.com>
> Closes: https://lore.kernel.org/lkml/20260901194524.908240-1-ghidoliemanuele@gmail.com/
> 
> Thanks,
> Francesco

Tested on colibri-imx7.

Tested-by: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>

Thanks,
Emanuele
