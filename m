Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E09D3E5A32
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 20:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791922316; cv=none; b=n1LfcmQPq5e4VEWppFR3byc/27tDmFomZQR/awmBZC9FCJMKTyuHnEqOd2E1+6p807KeSuA10ayF7i9pafWxW41cXPyvoJA3IhWHlen7TzBtsMxwUQ2CNt/xQHAr3VCx/43L4/BzN7w9MOP3xEtWiOz/y39gRb+l0QiSHSrhUQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791922316; c=relaxed/simple;
	bh=HNXFWZVoSrIw23q3IgkNMzcKb/CWkz06yGOhyswlFZs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Sem20Ej7DD7M6CCkEWtcqsR+k205q6KRg8rfPLkJFKFKFm3dpWPLYg53jNCTDWbSZ/ALb/JEJtnKuOLPDSqvAKDcvCjjjGNllKPBrrsj8XL8/Tm1gWN2MEqT7jf2KMcUkwv2LeACahMI7Gjl1qJg9LpjoS56CFeBIKnScbGisf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ieee.org; spf=pass smtp.mailfrom=ieee.org; dkim=pass (1024-bit key) header.d=ieee.org header.i=@ieee.org header.b=K92+NuaA; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ieee.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ieee.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ieee.org header.i=@ieee.org header.b="K92+NuaA"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-5337fb43c16so36713081cf.3
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 13:11:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1791922314; x=1792527114; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xuCIoz2IYjkzdzL/4g0Gyi+YveB0FaYW1V1bCHm1ABI=;
        b=K92+NuaACRW0owrRflPF3PbczIUoiGqJR8o7YhhKwC2jFt631xFuO+iJV6l34I+tAb
         OHqICf8/A4eJ3L2sN+nTOWLMW/wMHOYwdJxl8mGXmF/hmW4ekvrOyDqNDcv6OI5vNuea
         2tEbZBEA3NZhwqx/E5d32MuqetcQZJrQVMUC4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791922314; x=1792527114;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xuCIoz2IYjkzdzL/4g0Gyi+YveB0FaYW1V1bCHm1ABI=;
        b=uBPOYCXwjk9E568VJEoFvaHXFhRDQCG1Unf15oaIZsh7C035d9CdF84PdTn/FUppau
         h/yZCc5+Qo+Ob5plvGOv7ScUu6/HGbnyL0XbeMxvm9kyvmL/a5YNbvTM47PeJMAau/M7
         TBQnfvr7yiDMagjaSHjdtXLZZv4LbvI2t71/B2JyaNmdAYE14MFvIC7nkcHLKTHTesSi
         aCRFuDjPvCAFH7kQANybDYQc3UsANMk5Yt0PQONXmeitqVKLQ60F644hJ80R0WVI+Lzt
         ObGwpMOMtEe0+B0R4UNDSikOPK41i6Fk0fpcg52LDJrEoyEWSpKAfS5tMQFJ4kG9SI1g
         MgGQ==
X-Forwarded-Encrypted: i=1; AKwUvBzFHSxoXGRH0rEhZ/W/+XzeU6oUHRpni+Vfvqun8az2xzwtyHQgDSEehyxlSaQYoaTuswl7jadD0j6wuWk=@vger.kernel.org
X-Gm-Message-State: AFq9FYKsu+0KGBV6+RH7h05kGqYNFcDVl0ZeEYDutD7TZFAkVhbcYxcg
	7H/eSRh3AZ3DKx8DH+4BapxCs9+YzmVKemarYSY07A8dzw2iO2xkJ7K/YMsvg036Zg==
X-Gm-Gg: AYBFou2cxB+xfgnvzB7vm/bfbhPat+RpP7ysCg+6113LGyHIJOQNy2331M3OSbB8POt
	FBS9jA/lcayFX1DglWjW7gTasEbDtw48nUVPRN1YUhtMna0+n/vZNacgf+X48LriyULI9qTKxtP
	1liN2Gl1j1XtNbZTYF/lq+k+MVGNqXQ0TP7+opIDMHmpN+qMz9GnWZxtq30FIjp1vmtTEeex/lZ
	T1L7rqYXFUXfp3ggfa+kxr56yYCz9mmBzHUuhj6NdRUGr4tpzH9eScMkjtQ5qC6MwYf/1udzBY3
	IGLdupYL8mn1QwKuE3isnDZVt1akZvgzgwNJ7ZfG9pxNcLPBVNvs4Z4rynLiYcgL4xKZaxJgGUY
	PvWBkfwTTn/axrmYM1upe5QMfyaxafwytRBcS+55UKWtrBkcPmLcJzrOBaO5Aowe4hXoW+2xlDJ
	ZtS2CzO/efgfUjGnh0TDDRMyPdn1EqvQiiWY/PurMZngC84JOPBzeqeyo3nc5LH0Z4HA==
X-Received: by 2002:a05:620a:472a:b0:93e:70cd:e428 with SMTP id af79cd13be357-93ebd267ddemr2287238885a.66.1791922313908;
        Tue, 13 Oct 2026 13:11:53 -0700 (PDT)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.googlemail.com with ESMTPSA id af79cd13be357-93ef4d31b91sm323643685a.0.2026.10.13.13.11.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 13:11:53 -0700 (PDT)
Message-ID: <2fd23f9b-7eab-4afd-aa77-93a5b9ff0c75@ieee.org>
Date: Tue, 13 Oct 2026 15:11:51 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] staging: greybus: replace PTR_ERR() with %pe in error
 messages
To: pavankumaryalagada@gmail.com, johan@kernel.org, gregkh@linuxfoundation.org
Cc: vireshk@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 outreachy@lists.linux.dev, gservice341@gmail.com
References: <20261013022402.6322-1-pavankumaryalagada@gmail.com>
Content-Language: en-US
From: Alex Elder <elder@ieee.org>
In-Reply-To: <20261013022402.6322-1-pavankumaryalagada@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/12/26 9:24 PM, pavankumaryalagada@gmail.com wrote:
> From: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>
> 
> Use %pe to print error pointers directly and display their
> error names.
> 
> Keep the other PTR_ERR() call because its return value is
> needed for ret.
> 
> Signed-off-by: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>


Generally I think what you're doing is OK.  It looks
like %pe is better than just %d, because it prints
the error *name* for the pointer-coded error.

But I have two general questions about this effort:

- There are other places in the Greybus code (even in
   just the staging source files) where this exact same
   thing could be done.  Why limit this to "fw-core.c" only?

- Do you think that all Greybus error messages should be
   converted to use %pe (passing ERR_PTR() if necessary)
   instead of %d for showing the error number?

I think your suggested change is a net positive, but
doing it in some spots but not others means it is
adding a bit of inconsistency.

					-Alex

> ---
> v2:
> - Use %pe in the firmware management case, as suggested by Jeremy Clifton,
>    to match the other cases.
> 
> v1: https://lore.kernel.org/outreachy/as0nhVbagZa8Birm@user/T/#t
> ---
>   drivers/staging/greybus/fw-core.c | 16 ++++++++--------
>   1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/staging/greybus/fw-core.c b/drivers/staging/greybus/fw-core.c
> index 2016a74f137f..78321be80013 100644
> --- a/drivers/staging/greybus/fw-core.c
> +++ b/drivers/staging/greybus/fw-core.c
> @@ -93,8 +93,8 @@ static int gb_fw_core_probe(struct gb_bundle *bundle,
>   			if (IS_ERR(connection)) {
>   				ret = PTR_ERR(connection);
>   				dev_err(&bundle->dev,
> -					"failed to create management connection (%d)\n",
> -					ret);
> +					"failed to create management connection (%pe)\n",
> +					connection);
>   				goto err_destroy_connections;
>   			}
>   
> @@ -112,8 +112,8 @@ static int gb_fw_core_probe(struct gb_bundle *bundle,
>   			connection = gb_connection_create(bundle, cport_id,
>   							  gb_fw_download_request_handler);
>   			if (IS_ERR(connection)) {
> -				dev_err(&bundle->dev, "failed to create download connection (%ld)\n",
> -					PTR_ERR(connection));
> +				dev_err(&bundle->dev, "failed to create download connection (%pe)\n",
> +					connection);
>   			} else {
>   				fw_core->download_connection = connection;
>   			}
> @@ -131,8 +131,8 @@ static int gb_fw_core_probe(struct gb_bundle *bundle,
>   			connection = gb_connection_create(bundle, cport_id,
>   							  NULL);
>   			if (IS_ERR(connection)) {
> -				dev_err(&bundle->dev, "failed to create SPI connection (%ld)\n",
> -					PTR_ERR(connection));
> +				dev_err(&bundle->dev, "failed to create SPI connection (%pe)\n",
> +					connection);
>   			} else {
>   				fw_core->spi_connection = connection;
>   			}
> @@ -149,8 +149,8 @@ static int gb_fw_core_probe(struct gb_bundle *bundle,
>   			connection = gb_connection_create(bundle, cport_id,
>   							  NULL);
>   			if (IS_ERR(connection)) {
> -				dev_err(&bundle->dev, "failed to create Authentication connection (%ld)\n",
> -					PTR_ERR(connection));
> +				dev_err(&bundle->dev, "failed to create Authentication connection (%pe)\n",
> +					connection);
>   			} else {
>   				fw_core->cap_connection = connection;
>   			}

