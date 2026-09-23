Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD5F1470421
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 08:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790151979; cv=none; b=AAUHzMqz4g2nTrcYckIpB0fUcTJn420yq4ZhZF1frkark4pseSPTAhAAmrxENibcYW86zOfwmALbMp44uEFYe/CfqWNBcFRd/XHguEEeTwyk56v89Px4qJk9Uoe34v1mfMIC3JNTWCVYEE1kEFUnQK01Bg+3s4i/GH43BdpUSOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790151979; c=relaxed/simple;
	bh=7I+XqVub4vfcxM+YWE6IFJGQML9ImhDRjbXd9HkId3s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W3GgT+xlEj/NOakVXUGYCNJ7RB8WiH5oNu7kFZuD/uPgEnUB25eGtcYVxoeyyRWdym37SVqxH3ryzMrIW5mhGxxVy3tlUTUP0BX0dtPoMSndpFh+udPGPsl7yIyuxoJdQVH0OHK6gsUofP5jqZxdfuemEbLzZf8NBjKci/Ea1sQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=aBl88vb8; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=jKhljKcV; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="aBl88vb8";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="jKhljKcV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790151975;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=1v7Dylx6zxeZqQ8SiUaUNliO66xdHljUAJnyYOz05SA=;
	b=aBl88vb8LnEIWvodZJnCM1WHc9U1UrBCB08+Az6dr0dcL259B/2EEOkNKKkl9GkBYFykPk
	99tiaaNyWO3blPjbY5+HG4jJ0sqxcatq3qAy9+lR38XANaVvCq3Ic748EVQ3h+Xcx8zHo0
	TZGWTt9KcM2nGR+Xm1ue9nySLiqIYsk=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-574-TP8grF9VMT2lZ6MGYBnthA-1; Wed, 23 Sep 2026 04:26:14 -0400
X-MC-Unique: TP8grF9VMT2lZ6MGYBnthA-1
X-Mimecast-MFC-AGG-ID: TP8grF9VMT2lZ6MGYBnthA_1790151973
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-49e735659b7so4556855e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 01:26:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790151973; x=1790756773; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1v7Dylx6zxeZqQ8SiUaUNliO66xdHljUAJnyYOz05SA=;
        b=jKhljKcVdrtoQBhzN0fQGkOiBINYmRBZCda+Tkvq/tCImslsGP89518ep3mgCmAsp9
         4mgEgXTnR18igRdeO9DcczH2saBLI5PKIZWmxFCpIP7vWmGb1OZMEAE1egsx7Uo6zszz
         h1oau5Olua1A1uqoVjAdQ2xWJGwtu5ObQAaaghWzpdl7DO0BAX3xuOhXiuS8aPgzB5vX
         O8NdkgcHfvI0ErAu1HZEu+JOqj5VZG8Wn5pKGfGooWdld7UXNpc+ShZqyLZ2HqtxeaDI
         j9yLjgmF7DYdvi03bIxpiBmSAP3nBFhCT9LDgUvSNU69CoiPvC+X1cSZEgyHjb/OdZlA
         8xcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790151973; x=1790756773;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1v7Dylx6zxeZqQ8SiUaUNliO66xdHljUAJnyYOz05SA=;
        b=n7lpBzAT1BuX16n4ltoDw37Ldh8R6JY8GDcrqavZrr388HEb3DIRlenGi1lqtjbQDm
         sHbRAZ70njW7p2zGJvF/U7H2o036xQ12dSF4b83n0+Lj2naiMHliOoR92MX4BmCtiRe0
         TZ3J0DNSqmI9Ywpm8Y4gMz7ve9KI1P4zxCdTGHn/zT7dC4QOcWEPtTTUKc5vhwQ2Ljef
         u3EdrPyT0L/xH/YXN4vI4zB9JZpavlsbJKt82xmGLNbn1u4mhVcX2CC7Suxi3qDZQJwE
         pHDLvM5BfUtJ4haD9ck8rGjp6f3JgJffewrIoMkPVHVb7qouuF331z/DjuyC6xt5ng8C
         yuiQ==
X-Forwarded-Encrypted: i=1; AKwUvBw/fTe7RH4SlVxa2vPVhBR4pravmUOKQ4RHdcpwuhcTAHzfqqM2OoKj5OE+rta4BaKnTHutFerr3UhQDhs=@vger.kernel.org
X-Gm-Message-State: AFuF++kOQvSa1aq481PMF/rtXl/G0vUEApc3+3RRJPUWSiXDmWSA2Bqe
	hqO0mYowGENQWR8dWMtc4FWrTfEZ9GG8uXw2IJyHeix6B6diizJ0x5K73EV13tl4kNqsmoOkC9o
	J28cFgjhYjCvze1ZCYOF/DKG1RKF6NHVucnweMl+2O958M4rTd9jxXVvFIbBC/v7wOA==
X-Gm-Gg: AYBFou2Rlw4KrrahMIHBD35KAFQ4Ou6a3XuTd2/CzpWnf/1tspj0Cs9z9jiATjCL067
	i9l0A03EJvm+g2uool2qvDrbPwfOpThRbbOnVz5Dg2h347bZoIKX8OIXEO69HVauQPWdieiWdeL
	8gEf+hg/oqrEiEPvic5HIsMciTN3jPDGvhBRo7FMDT5cG+aGm+KEc26zB3o51s0CfEIE+68t9du
	s4HTIm5LoMX/Suh0SnhHLqCNR1rl/FqWY5rGWGLWD2Yii9WUTHiZ5w4JMPnQYGST0QbVKKvV0TA
	9JKVeAOIaU/xEbcfYUjDe1JDap7D8eYY+/xerW9sR3Q3rB/i3fdfies/JAtxp2R+2Kj4WCK6
X-Received: by 2002:a05:600c:c8a:b0:49f:ce73:7a9 with SMTP id 5b1f17b1804b1-49fdf2543f4mr22113875e9.34.1790151972941;
        Wed, 23 Sep 2026 01:26:12 -0700 (PDT)
X-Received: by 2002:a05:600c:c8a:b0:49f:ce73:7a9 with SMTP id 5b1f17b1804b1-49fdf2543f4mr22113545e9.34.1790151972589;
        Wed, 23 Sep 2026 01:26:12 -0700 (PDT)
Received: from [192.168.0.9] ([47.64.113.141])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fde1c159esm66217765e9.4.2026.09.23.01.26.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 01:26:10 -0700 (PDT)
Message-ID: <9811c544-3af2-487d-894e-0a3e85ba511f@redhat.com>
Date: Wed, 23 Sep 2026 10:26:08 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] crypto: ccp - fix SFS ioctl race against device teardown
To: Muhammad Bilal <meatuni001@gmail.com>, herbert@gondor.apana.org.au
Cc: thomas.lendacky@amd.com, john.allen@amd.com, davem@davemloft.net,
 bp@alien8.de, ashish.kalra@amd.com, linux-crypto@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260919192432.272680-1-meatuni001@gmail.com>
Content-Language: en-US
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20260919192432.272680-1-meatuni001@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 19/09/2026 21.24, Muhammad Bilal wrote:
> sfs_ioctl() reads psp_master->sfs_data and caches it in sfs_dev before
> taking sfs_ioctl_mutex, while sfs_dev_destroy() frees sfs_dev->page
> and sfs_dev->command_buf with no locking at all and only clears
> psp->sfs_data afterwards. A call to sfs_ioctl() that reads sfs_data
> just before sfs_dev_destroy() runs will still acquire the mutex and
> go on to use the now-freed command buffer in send_sfs_cmd().
> 
> Have both functions take sfs_ioctl_mutex before touching
> psp->sfs_data, so a call that is already using sfs_dev completes
> before teardown can free it, and a call arriving after teardown sees
> sfs_data cleared and returns -ENODEV instead of racing it.
> 
> Fixes: 648dbccc03a0 ("crypto: ccp - Add AMD Seamless Firmware Servicing (SFS) driver")
> Signed-off-by: Muhammad Bilal <meatuni001@gmail.com>
> ---
>   drivers/crypto/ccp/sfs.c | 9 ++++++---
>   1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/crypto/ccp/sfs.c b/drivers/crypto/ccp/sfs.c
> index a4777839790b..530141f8bc74 100644
> --- a/drivers/crypto/ccp/sfs.c
> +++ b/drivers/crypto/ccp/sfs.c
> @@ -111,13 +111,13 @@ static long sfs_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
>   	struct sfs_device *sfs_dev;
>   	int ret = 0;
>   
> +	guard(mutex)(&sfs_ioctl_mutex);
> +
>   	if (!psp_master || !psp_master->sfs_data)
>   		return -ENODEV;
>   
>   	sfs_dev = psp_master->sfs_data;
>   
> -	guard(mutex)(&sfs_ioctl_mutex);
> -
>   	switch (cmd) {
>   	case SFSIOCFWVERS:
>   		dev_dbg(sfs_dev->dev, "in SFSIOCFWVERS\n");
> @@ -191,8 +191,11 @@ static void sfs_exit(struct kref *ref)
>   
>   void sfs_dev_destroy(struct psp_device *psp)
>   {
> -	struct sfs_device *sfs_dev = psp->sfs_data;
> +	struct sfs_device *sfs_dev;
> +
> +	guard(mutex)(&sfs_ioctl_mutex);
>   
> +	sfs_dev = psp->sfs_data;
>   	if (!sfs_dev)
>   		return;
>   

Reviewed-by: Thomas Huth <thuth@redhat.com>

