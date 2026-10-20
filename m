Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792504808;
	b=2ZAEKPOHZYH/MsujN2+U+tF8YICElGDB5imAsgr6jXDSua9QRzs/pG87pyda5wDvN5tW
	 /EKC+rk+To7QFa0JDOJfJcMQ4WcsOOHSe1OZyeGv2MkYwoPtgnI6XmmO0E6brCOz7WcvE
	 jWB+S4KIcEANVPFavC0z6fGvdbTnIBRYq/Mtg0MlQd45ar+Qd26mc4urHxZBzeEZBquTg
	 51VXa1l+7Gf8+iurD2yp/QvvHgW6pskU8/KXb/L7T+X9zQnh1940ZVw/74cFnJNIGkHUX
	 lTkLDvVWZ1eG56AvL3gHtSA6Ot8wo1w888IoDi16MsDJn42gzqiRubCIlu494za3b5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792504808;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=REF0is0/vKENL6ZoojOgV2yic3mbfdUjFSqvl0PsZXk=;
	b=mOSKuB9MChFxzQBFVL7tAeXGvI8C9CZrvL3GuYqSMNib5SNmGYnCv0vvdeOxSZLeGDkB
	 wTjBMAJKoTRqNVgUDzaxbPB1Wi9QRs4/Bi0SFJZ4KeOPwSvRqGbi/eV6neOyhrEZCQNax
	 MFXU87iCO7tMLL152ggLc8oAAc+LxsGTHx0FsmdVUGsXAUKUH3xYCAZSNaEPWGv9uMRXH
	 7sI3ZjfeVWHhWKinfnhzXjlkLic+SEgVXEk+zT3GZ388pS64JbWXUoDqaOIqNQWbV5I5y
	 7Ud2Fsavy1gZxvjwO9X3rNF3SGGSXBS/YIY3lvZUKRIYNxuBAoyYfrh7RELqkGO7DTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ieee.org;
	spf=pass smtp.mailfrom=ieee.org;
	dkim=pass header.d=ieee.org header.i=@ieee.org header.a=rsa-sha256 header.s=google header.b=eXOWAvii;
	arc=none smtp.remote-ip=209.85.167.173
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B181960A2607
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 14:00:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B181960A2607
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ieee.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ieee.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=ieee.org header.i=@ieee.org header.a=rsa-sha256 header.s=google header.b=eXOWAvii
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-4f14642adb4so1439957b6e.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 07:00:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1792504806; x=1793109606; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=REF0is0/vKENL6ZoojOgV2yic3mbfdUjFSqvl0PsZXk=;
        b=eXOWAviiX3wJBgEYhkdw+68AUdyBCeafVUIzIGHstmHGmHoXR8daQJdjP0zByF72Rz
         Yg0ohAvNe+9xzjs92fPskQqFjBofzQbQCb9eaZQbaQwoYbewHlxfVww4zzVFDJISD5rC
         sHjbSN/aYN+/IGQ7JX9eThkzcirq5GJcKRuww=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792504806; x=1793109606;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=REF0is0/vKENL6ZoojOgV2yic3mbfdUjFSqvl0PsZXk=;
        b=zY/glnQ6Ixf6d6ljPDfLfCYKDh+7Vhgzr1FoeidIFj5Ll7ceDDgxWt42+nleFTzaOi
         HvHU6BuRmjMUqZBl0hOlpUY0dF+X7fzj0tJ9Pi9uCk7QpgKJJmyuZexyeEkhkZ1M+QWi
         AwKoFYp1N866w54muVIqVFEDG5cwg2rXiAF708E36z6I7bCylJXzQq9l3mR9cgOrJL+I
         z++zncXshC8snFuOg3caiZVL9yCqiJ67DEWA+R/rzTb5ruhulVUxI7YXM9+zdwtRQjWO
         rAs+xuTL4cDLcphVyOISXYiYOY2tV5sQbiL0lgA6DiGjjvTcWi0cavUjDUsGvKn7GCq5
         cV6A==
X-Forwarded-Encrypted: i=1; AKwUvBy5mtkde28XvYLBQPymiE0CcJ5jgnlEz7I13E4WRk8twb2luNi7wDlcZlB+89LI/WgfHkiqpoE10R8Bxdo=@vger.kernel.org
X-Gm-Message-State: AFq9FYL/gPb8Ao24O7BlyFkBv8hNn4BZL/H5pWViNI18NEvi+jJf6Vbe
	y58d3SBdBgxMx6U8qarJINJX35T6Qf5TVeqomtGPtFpST+7Q+Rm18OsbkXVQbICd1Q==
X-Gm-Gg: AYBFou1K0KFszvLP9aMghqw7whZKjpOITKuhA/ifQCG/uCgKyXAggBAntNaOSPuv7fS
	Q/QhbcfJvhZHa3CgDK8qHjWVbTlr3zn1GCgZAKYx2XHsw6vBpRAVBJJ39sE6VRuZmjwhMm/DFri
	ZRAxvZLoubWwupVBqT8bvqeMAnUH2XFLplEn/1XxOJ+dHaGC1foja/95BLgMP9wDiIiAaMPjiEN
	dKRuTG/dZtRmbyGQ/9npBr5jkDqV7BgtEm5TtxCWqXl4MGW5WQ1RvUGVKkhC+LySant/PCAr7mW
	r//wtY+NAClvI5YZKHVdIBpJT8qzBcMe6Q6U0ZyWW5CDZSciuBz/TxbPgh3VzI3RzlnBZZBDV1s
	0bE9DIwhftv0kKqNftDjq0cl1OJ+5VnfINkJca/AEj/OlQfgaYp5W0zD8N8J5QrRawlP9BGboUn
	vP1QNAA0X4ptDjHLxUfxggixUQh83C1cugoSyURVGiMyGabAmxiZBkRcgfsnP9d8om+2yAhy6dc
	Rd9
X-Received: by 2002:a05:6808:c226:b0:4d6:93c3:1af4 with SMTP id 5614622812f47-53cd561563fmr8452317b6e.63.1792504805444;
        Tue, 20 Oct 2026 07:00:05 -0700 (PDT)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.googlemail.com with ESMTPSA id 5614622812f47-5388a5572a9sm9566960b6e.4.2026.10.20.07.00.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 07:00:04 -0700 (PDT)
Message-ID: <7e71d57b-f3c7-48b7-bcdf-75254ee87cdd@ieee.org>
Date: Tue, 20 Oct 2026 09:00:03 -0500
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
Subject: Re: [PATCH v2] staging: greybus: Align function arguments
To: pavankumaryalagada@gmail.com, gregkh@linuxfoundation.org,
 outreachy@lists.linux.dev
Cc: pure.logic@nexus-software.ie, johan@kernel.org, elder@kernel.org,
 rmfrfs@gmail.com, vireshk@kernel.org, greybus-dev@lists.linaro.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 ethantidmore06@gmail.com
References: <20261017084441.12123-1-pavankumaryalagada@gmail.com>
Content-Language: en-US
From: Alex Elder <elder@ieee.org>
In-Reply-To: <20261017084441.12123-1-pavankumaryalagada@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/17/26 3:44 AM, pavankumaryalagada@gmail.com wrote:
> From: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>
> 
> Align the function arguments to follow the coding style and
> improve readability, addressing the alignment warning reported by
> checkpatch.pl
> 
> Signed-off-by: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>

This patch is OK, and it's a good kind of thing to do for
getting your feet wet with sending out patches for review.

But I encourage you to try to really *read* and understand
the code, and see if you can find anything you think is wrong,
or some bit of code or comments that you think could be more
clear.

I just scanned through "loopback.c" and one minor change (to
*code*) you could try is using fsleep() in one place that
uses other functions to delay.

Another thing you could look for is printf-style format
specifiers.  I see more than one place where an unsigned
value uses %d (which, for large values, produce misleading
results).

These suggestions aren't especially complex, but my hope
is they lead you further into understanding the code and
not relying heavily on checkpatch.pl to find things.

Anyway, this change looks fine to me.

Reviewed-by: Alex Elder <elder@riscstar.com>
> ---
> v2:
>   - Rebased onto staging-next.
> v1: https://lore.kernel.org/outreachy/C560A15E-6F28-4FC8-8BE2-277B503340AD@inria.fr/T/#t
> 
>   drivers/staging/greybus/loopback.c | 3 ++-
>   drivers/staging/greybus/spilib.c   | 3 ++-
>   2 files changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/greybus/loopback.c b/drivers/staging/greybus/loopback.c
> index fe48a687377a..efc69c10cffe 100644
> --- a/drivers/staging/greybus/loopback.c
> +++ b/drivers/staging/greybus/loopback.c
> @@ -652,7 +652,8 @@ static int gb_loopback_request_handler(struct gb_operation *operation)
>   		}
>   
>   		if (!gb_operation_response_alloc(operation,
> -						 len + sizeof(*response), GFP_KERNEL)) {
> +						 len + sizeof(*response),
> +						 GFP_KERNEL)) {
>   			dev_err(dev, "error allocating response\n");
>   			return -ENOMEM;
>   		}
> diff --git a/drivers/staging/greybus/spilib.c b/drivers/staging/greybus/spilib.c
> index e4d1ae8308aa..c1982f3fb931 100644
> --- a/drivers/staging/greybus/spilib.c
> +++ b/drivers/staging/greybus/spilib.c
> @@ -160,7 +160,8 @@ static struct spi_transfer *get_next_xfer(struct spi_transfer *xfer,
>   
>   /* Routines to transfer data */
>   static struct gb_operation *gb_spi_operation_create(struct gb_spilib *spi,
> -		struct gb_connection *connection, struct spi_message *msg)
> +						    struct gb_connection *connection,
> +						    struct spi_message *msg)
>   {
>   	struct gb_spi_transfer_request *request;
>   	struct spi_device *dev = msg->spi;

