Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794220725;
	b=iu7GH46hCSBPgaKObboS2IWppEBLWiNohW4PEyUvc4mTf0EinVRa5x479tnEB/yaI4yG
	 Rf44ao2GpLD5tFZf91niW3+6r3Xa+th1NykTyEYiM24F8NhuckhxWae8dJMg+qkW4ik6i
	 y+FSiceWHtnsRH4ZEjOnwy5XzCe9OXimnpSdNPySEBmZw+X5GBkJGgKw3S+e1pQNZSPQT
	 twNw95JN+lDJ6RoMWLwEBW306iP3YRpbcPxEzs+voa0X6oyJ1x8vMC65dJ71gJ73bHonQ
	 qy77gu6aBP5bAXaKUDjRLK5KFrqfXQBg7AYAlzNzFVCo0emAvAc94n5rG3bCim3/4Ww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794220725;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=r83k1cNkUhctdhSteH8YPD8rm/QpmvN7geVl+a5ebSw=;
	b=t8oiVyoosDKnpYQtm3npyOFyL/urI2xsUzEFrJoC/DSmXI1RrnJHE0ueh1to6l2u9a4i
	 VsXNQMk8b89MZK4pbxOtFWzNGzyksf7gbri58+AWKPc4ystw+Xzja2MdQWP0lnDBA3nt8
	 +fAa0h3CdiuS0qC7oPF2OYB1gUS3A93uDxx5zFy/AnB9Pmcn0mk98FdlkI7Ysp7vQ5k5y
	 DaV+pCIZMrSCgI699dolHj7uG+vvwKW10OOEHlLH549KK2dOVj4jNik3PNGMHMThC/V2U
	 HLDuuhdXS9YpXbtwjcHLBcF7B4gcgp3LueRSIm6/EXNSiBfY8Wd5F9OF20iRoPECf9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=g7gP5FZ7;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE966606A321
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 10:38:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EE966606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=g7gP5FZ7
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-4910b863b84so437521f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 02:38:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794220723; x=1794825523; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r83k1cNkUhctdhSteH8YPD8rm/QpmvN7geVl+a5ebSw=;
        b=g7gP5FZ7qPU8Y0uamg558uVZqf+5bTWZ3TKSe/r8HE9IZD8bbk3wcWkk/ey8VTHOje
         mOP8vTI7Pzd72NMZWv92l/IdyST5thPqHX/yfp8MyNkT+BVEk1xfsZrq8LS7mua/sKcu
         0WM8ytUr/FdLbDmhi9NQJnSvVd7P7v0RZ/EWjHjpzSFk7NIAmBuZ7dASadJjmVmH/398
         4PwCjdlF8dwKBbPZosOHYPEQdYG2xWTnDq7oCQGrMKaJCg2ln0az1zcIAbkNKklar6lA
         DcRPtTdO7vbjA5aew1ns90wJsfUGlT5U4MkuDg5CeB8SJgc39s5chO6xmN1ipf1+r3MR
         ixWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794220723; x=1794825523;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r83k1cNkUhctdhSteH8YPD8rm/QpmvN7geVl+a5ebSw=;
        b=i6COPrwtOuwmRSRsdZr9Ib/eo7zUYuGJLCW1IOhGspPqZlYWSLbbF8D+sGoxOjVI5u
         6PD+bs3ifXVdFVvXohOOtXxC+QXDuA1h8QPrfOlbhGyBn7FWyUZtgpcB/hHfholEYslb
         afbLS3EA2EZs0/DRQ5YmDOb/nEGLoeno0nEEHoJjjox5ziFbTQNIrcXWAJ5wo5UkPRnA
         ivnvnLJi+PqsBQfiN203CVS1HkmWmAdFZkXXLEspGxwBPeYmPUPVTFpQzxbBdQLPnN30
         a2qCKhQ3LzAIEo7FM61+jOGO6A7x9PmNCr9YXL66eySuw6G8z1+iiTB9izRoyMeUO8Pc
         Unxw==
X-Forwarded-Encrypted: i=1; AL+hErHP+zfuCeM+Vjyh2yDt/+EPwb66iQhVlEsSYMXf2PY15rM4Qsfme8pKOyXcoO/KjvW44hE9GrKEE/ew2fw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9sXFq/dqlG6CIf3j4wXbjnmPYJFIUqoFa24H1/ETTXK2K4WWtm
	MpnfzSxUpUrPRoM810d9i29myPML5e7v9XGwai/tqiKPx/Xiz2d1cFQyKG8vrxZ04ht4mbSTa1P
	Y2oBCeoo=
X-Gm-Gg: AYBFou0icKZy0EmCNON5exKkKl96D47C+j5mpxHIVLoknn6z6/Lw8cagyl5eEGHq068
	xqa/VaxB8NLgU7MCE0jsTzjko6tif+HFDJts9ApNuZKTStRtwWuB2fDCjQCqu8j/MQXwbvqZnQG
	8LDn9tBrteN4vkJnDAu6hOuZg7biRwvHNYgbesKij8dzeIBXOVloCFI9OvwqbfTUtoZULyh8FsL
	hzJfevuiEN6sXxZnMMnF9ui+lxThFLMN25onr5/OmlLoHaLmZOnz1BhLOBQ7eG1bDufzPsvdc2D
	D6HcPmsVQMlr8IxtHC5Mcy1QR4bQ2wDlTdlC6Bg+Z8qvXJKY5fvFfcZ1G5r9MZylkwWsxznH3dI
	4dvu2xUj6dKaeneWZCICybk05K98VE/uluJhOOTyvAQ5SmA+ICZNOGDIEB+zOffMerYremcTqRM
	xyP3BdDcfZqT2eJsCDD9EakHjyoft5la/p2QBy+5EyCXI3LlLePIADnPP9r27ljaqbRxJi3E3Qk
	PlailM3e+nNZlV1bZW3sUykkfxTvX170UztQXHrsjR6AwuVRguIqTs7/q3RzJxs4Ilujhy/MBPG
	ydEC1ABEFaEm+aVhLskNf9aVO0gMgLpo
X-Received: by 2002:a5d:5f47:0:b0:48e:6669:fefb with SMTP id ffacd0b85a97d-4958b62ee80mr7635031f8f.22.1794220723287;
        Mon, 09 Nov 2026 02:38:43 -0800 (PST)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49596ea5008sm9181122f8f.26.2026.11.09.02.38.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 02:38:42 -0800 (PST)
Message-ID: <3e75a65e-0dab-4c7c-8d2d-264c31ecd985@linaro.org>
Date: Mon, 9 Nov 2026 10:38:42 +0000
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
Subject: Re: [PATCH] [v2] coresight: funnel: inport schedule by priority can
 not take work
To: Chao Xu <xuchao066@163.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, suzuki.poulose@arm.com, mike.leach@arm.com,
 leo.yan@arm.com, alexander.shishkin@linux.intel.com
References: <20261027151457.5713-1-xuchao066@163.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20261027151457.5713-1-xuchao066@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 27/10/2026 15:14, Chao Xu wrote:
> The CoreSight SoC-600 TRM, section 10.11.2, PRIORITYCONTROL, a funnel
> rejects priority register writes whenever any port is enabled. The
> current sequence therefore prevent the configured priorities from
> taking effect. Write the priority register before enabling the
> first port.
> 
> Signed-off-by: Chao Xu <xuchao066@163.com>
> ---
>   drivers/hwtracing/coresight/coresight-funnel.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-funnel.c b/drivers/hwtracing/coresight/coresight-funnel.c
> index 0abc11f0690c..500ff72a83c8 100644
> --- a/drivers/hwtracing/coresight/coresight-funnel.c
> +++ b/drivers/hwtracing/coresight/coresight-funnel.c
> @@ -62,13 +62,15 @@ static int dynamic_funnel_enable_hw(struct funnel_drvdata *drvdata, int port)
>   		rc = coresight_claim_device_unlocked(csdev);
>   		if (rc)
>   			goto done;
> +
> +		/* Update priorities while all ports are disabled */
> +		writel_relaxed(drvdata->priority, drvdata->base + FUNNEL_PRICTL);
>   	}
>   
>   	functl &= ~FUNNEL_HOLDTIME_MASK;
>   	functl |= FUNNEL_HOLDTIME;
>   	functl |= (1 << port);
>   	writel_relaxed(functl, drvdata->base + FUNNEL_FUNCTL);
> -	writel_relaxed(drvdata->priority, drvdata->base + FUNNEL_PRICTL);
>   done:
>   	CS_LOCK(drvdata->base);
>   	return rc;

Reviewed-by: James Clark <james.clark@linaro.org>

