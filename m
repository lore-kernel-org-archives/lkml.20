Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04BF9470450
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 14:40:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791556855; cv=none; b=t1uXdex8l4jTttGTU6vE2nYyJmgBGlPdZ1QtYs8AcDoXDBJttNaCwPhoIeS6qPDGXT23an3qXGWydOQVSCuzOFRzdgKscTREj5BIanSpajXnUdnPgKl53qhNeFfX5FXIHA2visG9Fy27jkqFiVMckFNjwm13uE36n0s/XxSNwcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791556855; c=relaxed/simple;
	bh=iQapXPqyzCyW0yh+hLQEmt32QweFEdb0Dwc5kwmIrgA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oeoJ1uFuGmFlNORDltob8X4GHd13iiZ6sgw/V7rrX9usjryEpTfmmk/TYE3rMbM7Q9AXbjEbUo6Zmi+2Fi3h4K3edgN7KlBSpCnOUTBmNPFIkPoNZ7+ZNY0op6IDOL2rqq0PI/JHuuk9c3oeyiIRC0lLYEWLKwZDylRZgoKeSCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=Hk6VkITb; arc=none smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="Hk6VkITb"
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-351775aa1c0so2893023eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 07:40:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1791556853; x=1792161653; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E8pCZ9jzEXeu3V91z7yTFHUowpIkdOUOpn2JEuBADS4=;
        b=Hk6VkITbP++OIKKGM96V5JWIPH2alq8yYq+kvdhRa627RHSFbdlVAfDETgZLVhsk1V
         /+1mFiSiWczDfcdg1Hoo8Qr9vTt7XcBBqD8tgw62N5mwYIx+gSHcpIOGd9OvLn2oMidV
         gTaAWkjK6RE7eNvieLP+xzwd19d+lQV2gDcQvXIGI8MpVS7LRu/CxoZJhq5AeyajaLM1
         LRjXR7AvPuApZ4kuq6iMvC6dwPgZexvkZNOP1Tuz61hYYXt7t8mSmkyJM0MQrLjn2SfO
         8svGStNVGSR0/BPgIPpFya4P17AHN9+jcoTXEa2IMWvFg8KOIO9SnC/u2cLi8t940JNx
         pVVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791556853; x=1792161653;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E8pCZ9jzEXeu3V91z7yTFHUowpIkdOUOpn2JEuBADS4=;
        b=p2HR8LK7WGqVloKmcF0rKiSZzSz1yXhcOm8MjaosGib2u6wdgW/P2IvRwBmY93eCzV
         DtyDPfL6b7Gp/qItOm3n/sgjxxNMhXgfvgvg3stnYaFIpSG9O70eSsU+wV8K6GUXjKqO
         9z9gDA+LjVVXyH6SoUxQX4sL0xdJfRfyXrFAh2ocAnuS1Tjjjkp1vQaFHW7+Ty0sz143
         Vl9hNZ2gy3BC/3otCx8QJmCDOSO0iZ0iXn6dGQIKtlwTclMefdpteue1MOUo3J9O/T5U
         +6H4+PtPNI7rZt0GXHY0fEBRif507gBhnhGJOj60QWX+mrvPcyL2LDLECs2I/eZ1H/+F
         O6yw==
X-Forwarded-Encrypted: i=1; AKwUvBwiEd0vF1gQukjmmMn5UYU3yuKkl5ec9R8qNAQDQXkxItu3B2nn/PpNQQdNbMEBmwOokfRHVibVsOJdtWw=@vger.kernel.org
X-Gm-Message-State: AFq9FYIr2FGaElKMNdwyeL6xdDEStQzsNhMdUito666A3hmyjmqtM9sQ
	U3ausLGs0bIQ+VbUZ9Xda1FfNHVO4G6IhWJxCgblY0bN5O3QNPiuScW0pb2iByTNNxY=
X-Gm-Gg: AYBFou2LTx1ROVtbEeLdswWBEDhNFnAed//Nf2O6NssFBh9phiT5QYKIGni9qkKr1HV
	BHcSFV3eyXhtFbca8Ks4JzbP+wy/PBWV0NePb2pqjj3gySue5N+yj6WiMAyMkEqyG2+g2DllLCD
	Cg9vbW97LOtAXGjFHqcHLjqEKF1A348tHqyBRUQCmfNkg4BedxtBn6jS9N1Fytrte9waAtdv4oD
	b0OSatZhP12y/ki0MK+Vcwu2dl/ATl2OxG31UiizQHAT4fR+FX8hhF1V4Pl6RAr0Uia8oapeIfG
	3tQMngydrQpfb1coqOVjzXpeAdfs3NTiepjawgWdagB0uhVrwa2zrSYOEV6cqirjEo01d11s5PT
	Q/zbPtCPhsiugRW33OlqugA2IEWlx/HSAz0UkXUY42+tRy5xUYfb1B4OXmZ07o/LqC9dQJMvPEE
	ERir6JKeNZYpRMK2FV2dpNyecCOVEgInQFmvMhhMKg6nBSsEWKaegcxUY+DuJ0lCr2pk4Dy3cT0
	i3D6NJ742+FxN2oskdZrhFeMORgjeMyXxDrsNf5Z2c6eq8+sMpfdhMnq3F66FBjmAxa7/IMToPj
X-Received: by 2002:a05:7301:fc18:b0:341:2466:2d68 with SMTP id 5a478bee46e88-3537e0cf2a1mr2938047eec.38.1791556852849;
        Fri, 09 Oct 2026 07:40:52 -0700 (PDT)
Received: from [10.61.8.29] ([155.98.132.5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537ca0e64csm7578272eec.10.2026.10.09.07.40.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Oct 2026 07:40:51 -0700 (PDT)
Message-ID: <3b0edaa8-75e4-4282-8310-0dfb878484be@kernel.dk>
Date: Fri, 9 Oct 2026 08:40:50 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] aoe: pull in the headers each received packet type reads
To: Christoph Hellwig <hch@infradead.org>, Josef Bacik <josef@toxicpanda.com>
Cc: Justin Sanders <justin@coraid.com>, linux-block@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20261007-b4-aoe-short-packets-v1-1-db5155f7bb9c@toxicpanda.com>
 <asdpwPEpGFxfLDNz@infradead.org>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <asdpwPEpGFxfLDNz@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/8/26 4:00 AM, Christoph Hellwig wrote:
> Can we plus just kill the aoe driver given how buggy both the driver
> and the protocol is instead of playing whack-a-mole?

I'd love to, but not sure it's feasible. I'll have to go search emails
for details, but I know there are people using this driver still,
unfortunately.

-- 
Jens Axboe
