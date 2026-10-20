Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792515928;
	b=KOFF3C7vnAfPlv9q7w9B65CpajvWvr3+PHg0YAKOHboOldmCXXk+3C2Saahizqjku3zA
	 /vdV/hbI5a+O77qHHxr7YY705QD/5ev1CsYJkNwhQTUBf6T0NAqQ+NgS5PRPyFT2PLGio
	 OU9Ajp4VzYW+QTAl/FrAPKa6nMNseyxBgAjMLQJQYhyUEnjXQM4TjpG4dzU3OmP/LZ08I
	 k4EFIVU9DDhS7us9sFWjeHiYwF8K5KFMEJ0b74Bg865+qhGmvZvgvK5qAo2FRVXQ4KE8F
	 L71jha+hvGO18bhf2AevaPgeWG5f4B7VCr18nre8FAqN5K4sr8bUngUDqnu4vkK9ygw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792515928;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=pb5RaWd5jwLfIYb5FACQb0INcelOdE+bJc7PDSGp4uA=;
	b=0haKNRREmYWFnjHHkCVraDuHrmxvuq4tN2xbWyHm/oZd9Q6LxIecy9Bwm7iqh/nfcIMo
	 CsMZjgYRKaCUALR2hZtA9jCxhuIEZZXCWjRbFxy1M8YZGQ0Kaca8+4+tnxa6zHNcHvUte
	 /LKWP8aeGUCdxW5XURUw9jiRBcP53D5LcLMy7ujWaua9tril0XrVwpNQ07RdK8qwWUnEY
	 ZtSphXUi8N+WkG2HpAH6kmYOyz+RMDVJZaBCaknIXUxZ5F4xhnErRpxVWQ11L94vIm45A
	 exvN1RI0IAhYdw7Ns5TNgiYvLVhOQPghZRrHy9oBXzl065gSi6qYfnhurUlvgq99sJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ieee.org;
	spf=pass smtp.mailfrom=ieee.org;
	dkim=pass header.d=ieee.org header.i=@ieee.org header.a=rsa-sha256 header.s=google header.b=Dlf2z7uW;
	arc=none smtp.remote-ip=209.85.161.51
Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51067606A31D
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 17:05:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51067606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ieee.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ieee.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=ieee.org header.i=@ieee.org header.a=rsa-sha256 header.s=google header.b=Dlf2z7uW
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-6b19e291cc6so3353653eaf.2
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 10:05:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1792515926; x=1793120726; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pb5RaWd5jwLfIYb5FACQb0INcelOdE+bJc7PDSGp4uA=;
        b=Dlf2z7uWEtTRcp65pdzEFcTW4fy7Nt5cG8WHgRuOPgVABGt/adnPifYVgGPqCtCTz+
         1tyf9v7MdwDUfGpvmLsbBBrJ8mCzi89+QayKi/KL4E5uVsTn8bC7/yttRW52HrbaG3xQ
         TWbEmOresBhjpzaHgcNjV6lE7pKsN/uEYY2kE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792515926; x=1793120726;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pb5RaWd5jwLfIYb5FACQb0INcelOdE+bJc7PDSGp4uA=;
        b=lsigbkBMi1+x1ho0aLVIs2b9GxreI5iQYCcMvIZoza+hXvvj6nF8HY0Jt6nxLbwjMv
         SPGZ1cCIdR5vZ3bpfpEXRjdRvwQgXUafCJk3KOfZlHeZrdn223emY/jf1XwDkMRo6xyf
         niob2D0qrnYjM1t1cPSzBvuGU/PaVao3QOvL1xqyOrRYE2QMinfjr6BH4osWE02KnduY
         XW62sI9grfFjuWeIuBmOm8kn89HmmXOFWkDOAL77yo7fM2oFugDXYgioKZItKSfECKfA
         0ZU8r+gjNclu0npto6uF27hYNvEY54UDav/ohuocF2c14jb6oqiCBQkDxguzdyDw3gBG
         H03g==
X-Forwarded-Encrypted: i=1; AKwUvBz0WH0aDUKREuStywLSg+5w9tVkOSyog7TeNZy1rqK8FuwvwzfsPs2OVaPkV6DhLcNPie/prGyTGxKY4lE=@vger.kernel.org
X-Gm-Message-State: AFq9FYIQEHiQb14qEmuTb4NvHeV8wALT5v6ah3eMYFWHUSWE6H3EZJZ8
	jQyR6r0jj81zNBxuwsmW4DYR+dXrA2YhXXeIX3l8Sv9WVaH0ko7gnVWZAdhmyg/2gw==
X-Gm-Gg: AYBFou0PtjxOTHtLrJpa+xy4yrSCVE2bKOXXAkPqW8ptZyy1mbAbWCT3l9ZIzYKaEXi
	2ViBEpeeWGND2XCRw+D+oOXei43Ozx1Qs6Z1s+8afA9WJdvYliAdI98boLAyFPQC0ALDQUi8kRe
	lBQ62zRuu4xFniA4i0TSknz5bkLNUAONeRBsC7AZb9kRpEMR+ySnqJLQFbN8NqKOQMv0WlMxyhm
	wCCKAEl1Egv5CE2cF3+gTAPOSJwumKFvVB1alRLkyWuwlOupfgOOaI1rIi5rmzqP5nLaxAjnbeJ
	mDJq14EYtpWWc+RXTr86xmSRzaRbNDtFfVGFWV5wHl5T6vDyopelt5A6o1d7q2oH9YK5oloXd3Y
	1t/m4sBijd2BftwfqtPATEz/D/J0u/MOM5HDFRFcxdhVFq9GVTG6EWM1mDR0fuyPI0hkN34HmPq
	x2lggYpTQDvmq0z9xj5cZsPh90NAhmvYnswot6jZPxlpltz66Y+kL9VboCMDU9vE5kvuzo6mCji
	3H0
X-Received: by 2002:a05:6820:1c89:b0:6d9:3d73:6e7d with SMTP id 006d021491bc7-70355d88b04mr8635937eaf.26.1792515926257;
        Tue, 20 Oct 2026 10:05:26 -0700 (PDT)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.googlemail.com with ESMTPSA id 006d021491bc7-709036ccad0sm90614eaf.7.2026.10.20.10.05.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 10:05:25 -0700 (PDT)
Message-ID: <833ee0ba-9fa3-4732-997b-c1a655217cb5@ieee.org>
Date: Tue, 20 Oct 2026 12:05:24 -0500
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
Subject: Re: [PATCH v2] staging: greybus: remove unnecessary goto
To: Haasham Khan <haasham93@gmail.com>, pure.logic@nexus-software.ie,
 johan@kernel.org, elder@kernel.org, gregkh@linuxfoundation.org
Cc: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, outreachy@lists.linux.dev
References: <20261020163636.7629-1-haasham93@gmail.com>
Content-Language: en-US
From: Alex Elder <elder@ieee.org>
In-Reply-To: <20261020163636.7629-1-haasham93@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/20/26 11:36 AM, Haasham Khan wrote:
> Remove the conditional jump to gb_error, as both success and error
> paths proceed to free the request and return the result.
> 
> This simplifies the control flow without changing the function's
> behavior.
> 
> Signed-off-by: Haasham Khan <haasham93@gmail.com>

Looks good.

Reviewed-by: Alex Elder <elder@riscstar.com>

> ---
>   drivers/staging/greybus/loopback.c | 4 ----
>   1 file changed, 4 deletions(-)
> 
> diff --git a/drivers/staging/greybus/loopback.c b/drivers/staging/greybus/loopback.c
> index efc69c10cffe..284935fded12 100644
> --- a/drivers/staging/greybus/loopback.c
> +++ b/drivers/staging/greybus/loopback.c
> @@ -609,10 +609,6 @@ static int gb_loopback_async_transfer(struct gb_loopback *gb, u32 len)
>   					     request, len + sizeof(*request),
>   					     len + response_len,
>   					     gb_loopback_async_transfer_complete);
> -	if (retval)
> -		goto gb_error;
> -
> -gb_error:
>   	kfree(request);
>   	return retval;
>   }

