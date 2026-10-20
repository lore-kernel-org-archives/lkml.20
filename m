Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792510915;
	b=M8jAShYy0kGG2KzBf8XVyIIIhf0eWRHyx4w+Jc8MLdWBPOKfRJCuomFHxdItj1Us+btP
	 4c+Ul8OopLH/23W2vVE2nN65SvxeEaX5w/oyORXsdr23V4wd7KBCqBYmJtVGg6ilpaNWm
	 aXMXa8/aHwqt0pl+wnkVuvzdpzjWkkAUZIhkY+7I5KF5zPlbnB/86ee5+bCR2HhZLFd/0
	 Wy+8JoeutFqr/lOYyENh40O3KEuqSlFt/GxPEqX56H56tPLHsPI4OWtqUqBFpg7qbCVEM
	 27jEE0+dC1+OW3vzCA8OU5gChw3KF7OfWh3zEO+wyNa98wVdyWfcleMm19wxE15UsFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792510915;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=OBYiHwgIBS5v/Omj8VoRqqRhhqFMxkEFOvedrOWQXyc=;
	b=0HEtNNeqJ65AmpfvTYKojg5X0HVaHsg4ANvKjItUKBIUhfl0kpbr9NvjiRrb6LpADkS/
	 x5SI5eYSV6lfbnCqnRVwApRkxL9Icw+jnbLfLkI4+9NHwvf8GizVMauJYB/oA/RmywR3B
	 KXOt61tN9bk9/P9W2b/5SMSAfSsBDAs/saEYRioOnReaABlTETXOue9deMXju3uKAqspa
	 V6ReB9u5leVhHg/NhccvTxiM+uMhr7W1SFg42PN8cHCNyMbrQI7Nj0p0COuOYwFw+N9he
	 fbQpcO8v2EG9tcxQ0il89dyQ3xMSVvO0g+3sWmQKRi3nEx4hYSpoh7TsWmd7GL3RF2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ifdpbQRv;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22842606A325
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 15:41:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 22842606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ifdpbQRv
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48afcd7ba9bso2116301f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 08:41:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792510913; x=1793115713; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OBYiHwgIBS5v/Omj8VoRqqRhhqFMxkEFOvedrOWQXyc=;
        b=ifdpbQRvSucS0BVDNe1xUbIFMuzt0kONi761LvW+e+4mjmmKhsnB56brFGLmr+4DCp
         Du5hDGYddP/09ZtM47PL+lsmRZfn2DfKskGpdpCe3Qeg5OFiHZS/VrsQY5IQGV8FIihj
         BIh8LulG9b7N7j2MYjg9mgG8I69vGG7LNUGklA6RBPXdvMfOO+ZVAfTCS73ntP/gPTRB
         Sjeslil7ET9h2iFby4diC+M7aB43LWFRmdGYA8ZXBF7UZ+K+pw9GHwiZFC2PYmfcrJXn
         bs9xTOJSfPatH9N7KyuhRys/NBfF1J3/swf1NmgpDeFz2s2pcqwMA7Ic6BvH/5KNZPtR
         ryTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792510913; x=1793115713;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OBYiHwgIBS5v/Omj8VoRqqRhhqFMxkEFOvedrOWQXyc=;
        b=RuLK+sxaYqLkFAOPyw80Ppwuxqk1vbMBTftaGeX0qBHB4GN59g4PK5FOF0Z3O8s1/V
         gYiZFST8+8rcHpFaXTe/QayZXCFORyyJZGLhHt/HVTl91SQU2IZBXklGBvDOKNxQVUzA
         3ZGUMLqHf58KO5genmk9eBwfMJih4xskaSoHG3PWSJofnU/l/LvMb+8hxPGeew4dpXdJ
         qpuIWwlzZVh2RkVHo/WMnrW2rxVf3LB/MXPQ2GrLyKjhTBSYzrYyE/YqFs9APawK0bap
         8Vwc0I4OCIcLdULvrwaorR4WAUg5xjyrlhDo7mOONZ+M/Kya+bxQJKm3zSj4ASdnFTnu
         oDhQ==
X-Forwarded-Encrypted: i=1; AKwUvBxOaFVNsOC0YtgPqRdvg8kQ1JI3tNqn4twc09dkkiKIm7JIW+JXyYYVlLQdYQ1kd0g1RLkwijL0UJ/UF+k=@vger.kernel.org
X-Gm-Message-State: AFq9FYJvZ3Tc3oJkBQqFK8SGial5MhuPSRUDQOtoD6mNmC9apo9A/aZD
	Q4dXJBnPOIrmEvU5sfUhvH3DoxepBkMmq70YiMDltdG2tyN+mhZo+xZA
X-Gm-Gg: AYBFou3z2wTZCEsm02rcBH8CFZOsjT58H83cxiGDrfh7YkiyA4MB8jSlQ04ba4UOpqq
	SZ2GCAiDlOcjBXu1i6CbCRDMWrk0oMZmvZD1zII5h2J8DQhmz5EVVyIK0ZDJMGSvNize6SG7Cf0
	VMvf7ZGdVXDgL+L4qkEHYGcJXAzL4bwtModhSdQmeIEocsXRrM++fyFnj9ShiNWa51t9CSUAUi6
	GmLQDElF2PswqR44al/qFisqFQyt4iB2/NeXtRqp5AWhN/qOAmWxvm6MWalwViRwEEZT62La7f1
	nLDbYa7PXyijwQTdIyP/YKGF+U54nTPX72IJBPsfekiUVllJUeKxYds2PWAz10OKm5+8DiwixL3
	F110wtBpBCcDwFzSSnf4aO3FV2bUFAKQ8slGxXcfqsRnlCNQOZIU1HAE4+hGA87IJhG27Mg5X5i
	gO2vGpNb0ipolvPIzUjJfjxwtG5FPgtkeDFU7ra9yckPbltg4O6brR3twuuTkhtDPDp2ZRSfxsb
	rjsl4WB1rjCfqeRWX3NZYbFi81QP9kwdsD8sb0=
X-Received: by 2002:a05:6000:46dc:b0:48d:ee59:3a30 with SMTP id ffacd0b85a97d-48e07f9d2damr16530082f8f.22.1792510913111;
        Tue, 20 Oct 2026 08:41:53 -0700 (PDT)
Received: from [10.5.0.2] ([187.14.227.39])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d80fdbbsm7488238f8f.17.2026.10.20.08.41.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 08:41:52 -0700 (PDT)
Message-ID: <f8b282fc-34b5-4ffe-806a-fcf525012064@gmail.com>
Date: Tue, 20 Oct 2026 09:41:48 -0600
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
Subject: Re: [PATCH 1/1] staging: greybus: remove unnecessary goto
To: Haasham Khan <haasham93@gmail.com>, pure.logic@nexus-software.ie,
 johan@kernel.org, elder@kernel.org, gregkh@linuxfoundation.org
Cc: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, outreachy@lists.linux.dev
References: <20261020131913.5171-1-haasham93@gmail.com>
Content-Language: en-US
From: Jeremy Dean Clifton <gservice341@gmail.com>
In-Reply-To: <20261020131913.5171-1-haasham93@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/20/26 7:19 AM, Haasham Khan wrote:
> Signed-off-by: Haasham Khan<haasham93@gmail.com>
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
> -- 2.53.0

A few things here:

You don't have a commit message explaining anything. You need something 
there explaining what your changing and why.

Also, it looks like you're starting a series ("1/1"). That is not needed.

I'm not sure the why you have a series here, but the big thing missing 
here is your commit message.

Jeremy Dean Clifton
