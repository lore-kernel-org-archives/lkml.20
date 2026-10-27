Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793114297;
	b=WWYKzqTsrpyOuQhwiOjAcZbQlegK1DEgPQlsJ6uMvOlezGBHu7wHTvnJ1dhuog/zmwZ2
	 2bP/kPyyAE+DSIvYgZnM19tgv48cxDb04IWRWapZl+p7zalAsejtoXO5O6Y5vSUUjwa6U
	 EbmTGEskOkU9E0/pX5WkbaARYgU/fBTESJDY1UCrb8FkcjLNTN0D1Jowz/yAquvqXgq85
	 AAcacxNuywjrRdau6z+f0mVg8GRKbZMneBobnRP9ZOldQ33wcHoXZCfLVN9J+Goddqcdk
	 7URD7PN1o/+KIohKeWTUBBz6xhY1i/TlwVD9lFSdCY8cCD7nlsc/lSbn72LFD1qe6xA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793114297;
	h=DMARC-Filter:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=ETh+qmqMfEkr1Nqt6XulXH2AGIO17TLVulw6TLSaZMI=;
	b=bvMspT/WyAwph/cHpeiVYnfyFCrHp3HS0xfS0bsgcw0P0KE3YSJw2xE49+Van0ehcecg
	 mzSnUXmtx/cKzCOigJflaCftIt+x6UkTfh+clR8jSiweSBevW2ZYRfryhBMHG2vMNxZ97
	 icX2z5gtvzSO0k9wrCGTFRxyuBXAfA0ot3WOuY9Tur+czPuh6r9wqBYCtHC4ncTy21B6S
	 6woV6KsPobUGmq7OCJ29ZtuNORluWljKkfjliHae5JLpbjqZLgg88Sxwz03vXeQ7sU3wI
	 xE1lReD9ut/UCECzzof2AuiS8S0wAyO2zT5TXQM12srZx89rvXa2VhAlLuh2UvjKwtA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=WqqR29Pp;
	arc=none smtp.remote-ip=220.197.31.5
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0179E606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 15:18:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0179E606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=WqqR29Pp
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=ETh+qmqMfEkr1Nqt6XulXH2AGIO17TLVulw6TLSaZMI=;
	b=WqqR29Pp2Vlx3OtcVC4Kr5NLZdfz36TZwerg6Vvb+gD0YAnJXORe6etAKcnNWw
	uE1Co0o2Y7LJo227IPd9b2kGO5RK7InACI86Iw03UmPow3sgoWrkWUt3vds8mwJA
	2WqpE3JztnOLl97KqK8CDPEEISdgUHR8IE8OB6NDGVeX0=
Message-ID: <a48de7cb-31dd-465e-9080-6dc05d6b5703@163.com>
Date: Tue, 27 Oct 2026 23:17:33 +0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] [v1] coresight: funnel: inport schedule by priority can
 not take work
To: Leo Yan <leo.yan@arm.com>
Cc: suzuki.poulose@arm.com, mike.leach@arm.com, james.clark@linaro.org,
 alexander.shishkin@linux.intel.com, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261025131308.7158-1-xuchao066@163.com>
 <20261027084133.GA766279@e132581.arm.com>
From: Chao Xu <xuchao066@163.com>
In-Reply-To: <20261027084133.GA766279@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:QCgvCgCnSaGKwOBqOhCZCQ--.49558S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7tFykGF17XF1xtw45Xr13Jwb_yoW8ZFWrpF
	Wvk3yYkFsYgr4jywnrtF4UWF13tw4vvayxXr95Kr40gw1YqrykZF1xKrykKFn7uF4rGr13
	tr4ayr92gFyUWw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UV7K3UUUUU=
X-CM-SenderInfo: x0xfxtbrqwlqqrwthudrp/xtbC6Aola2rgwIojVAAA3b

在 2026/10/27 16:41, Leo Yan 写道:

> Hi,
>
> On Sun, Oct 25, 2026 at 09:13:07PM +0800, Chao Xu wrote:
>> Before enable funnel, priority must be set. Changing the port
>> priorities in real time is not supported.
>> If the priority control register is written when one or more of ports
>> are enable, then the write is silently rejected.
> Could you cite the relevant documentation in commit log?
>
>    The CoreSight SoC-600 TRM, section 9.11.2, PRIORITYCONTROL, a funnel
>    rejects priority register writes whenever any port is enabled. The
>    current sequence therefore prevent the configured priorities from
>    taking effect.
>
>    Write the priority register before enabling the first port.
v2 patch add.
>
>> Signed-off-by: Chao Xu <xuchao066@163.com>
>> ---
>>   drivers/hwtracing/coresight/coresight-funnel.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/hwtracing/coresight/coresight-funnel.c b/drivers/hwtracing/coresight/coresight-funnel.c
>> index af40814ce560..17f985798d7f 100644
>> --- a/drivers/hwtracing/coresight/coresight-funnel.c
>> +++ b/drivers/hwtracing/coresight/coresight-funnel.c
>> @@ -66,8 +66,8 @@ static int dynamic_funnel_enable_hw(struct funnel_drvdata *drvdata, int port)
>>   	functl &= ~FUNNEL_HOLDTIME_MASK;
>>   	functl |= FUNNEL_HOLDTIME;
>>   	functl |= (1 << port);
>> -	writel_relaxed(functl, drvdata->base + FUNNEL_FUNCTL);
>>   	writel_relaxed(drvdata->priority, drvdata->base + FUNNEL_PRICTL);
>> +	writel_relaxed(functl, drvdata->base + FUNNEL_FUNCTL);
> Please move the priority write into the first port branch:
>
>    /* Claim the device only when we enable the first slave */
>    if (!(functl & FUNNEL_ENSx_MASK)) {
>            rc = coresight_claim_device_unlocked(csdev);
>            if (rc)
>                    goto done;
>
>            /* Update priorities while all ports are disabled */
>            writel_relaxed(drvdata->priority,
>                           drvdata->base + FUNNEL_PRICTL);
>    }
here is more better then v1 patch, v2 patch will be sent.
>
> Thanks,
> Leo

