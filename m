Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792675006;
	b=KDgAtt7YO9e06JnmSXJPXKuvMQ1ujC9NovS78J+HcpmTPjmS4rerfrONCxf321rYd55j
	 0+tn2/B/quRlJBoVcdFK32tUonnRnSX2AxMdE3oe7uUVwR5xTOBdbP09cUI+/GHJih20q
	 fsqRd8+S+BX1lrVCM6laBoImBLKLfw5qlIE7Q5ktkf0SMXlTc/yxWixCxZJ+N/cgkvjbY
	 VwG9PJSvOrJ1Zt6nD35qNkV8+n8vXS/H9W38J9yLJHBCyxJpk/W2tXRnXoyUPrvmzTODd
	 nHf/Tiv9zQ7oS3AvJTb4A5HYMri87NmQkNnFdu+kXeG6prTxTFNIhr0KxVzWZPqsnAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792675006;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=qndGYIabhOTOnIxX+m/6QHAEddG4IB6/QCy41KbLtAc=;
	b=Ww1x1dulVpp/d9ajmmYhYzD4dStRmVzMVkF2m69zpLsTPLmVniBwNIqyELl00t9A3PS7
	 srPmcAywC3Wd90gDHpnm59Bgtjad8+UaL9WwnEj4Bwde7zu8y8r7xim+2xhw2kaIKR2Qp
	 wCrEDZGYROoiRY7qm1Pes1o/V8hGPiVU4Wc07HwmdmoV3wLW+LAUaYCARxfSOhhTftfxF
	 O7XnqPd0Y0VJHzIkKBsS7BM78uppgmXvVwHwL07oot59pVgHLs30Zjon4BtFy+UTeENgu
	 fvdXuqZ8sRWG6yudcQXwIE+Ry+J56mnaRhtu0gtnjVIc4jnZ7xqAagPvsTkMDJlTVcA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ieee.org;
	spf=pass smtp.mailfrom=ieee.org;
	dkim=pass header.d=ieee.org header.i=@ieee.org header.a=rsa-sha256 header.s=google header.b="PhNlCg/t";
	arc=none smtp.remote-ip=209.85.222.178
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70EE0606A31B
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 13:16:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70EE0606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ieee.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ieee.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=ieee.org header.i=@ieee.org header.a=rsa-sha256 header.s=google header.b=PhNlCg/t
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-93e4c00d71aso200021185a.3
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 06:16:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1792675003; x=1793279803; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qndGYIabhOTOnIxX+m/6QHAEddG4IB6/QCy41KbLtAc=;
        b=PhNlCg/tkMgHLU3RewOjwSTW7h3OyZ/xJsVU2tfGYPUfYOgFrfALdjwLZo83GP2TFa
         5wD2SLBjetUW89P1YMiTnraF3eXUOU+EdrBP1+J4OEWz+nwavIY6axf+ATEKlTRV0UF3
         vc+YVzJQ/ZbZz17UdTJidrubAfOTng/LdVUdk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792675003; x=1793279803;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qndGYIabhOTOnIxX+m/6QHAEddG4IB6/QCy41KbLtAc=;
        b=de5W+zvSW+N70Crss3gfdjLmtGMAAptkVHIbVz9CXrHZdIKJqjbkjrCKWK8he05BqH
         33p/pxD2MYmQ1V+JoBB6IXn3a5DWu7WHxto/qUs99ZpFSl1Se85zMoa29PBEi6y4JgeK
         ZTnFfYrltk8LPJvEs8Ssq7sExw2YZ0RT2W1k1A5aXb1yaXVOKvFi0/QYrXXvygmV888e
         yW3Hvo7uRYDiFH91wEn4e9yEBY15nQpEMMbh+MGVc5lheLmahjaLuOsDIbyNjLUcqIZN
         DU+EaHz7gIjp5xgFa6xukT4HquHwInpRp2G1mKSgnUnXkMx92/3Lf4PTeSFX2DV/SQ8K
         64iQ==
X-Forwarded-Encrypted: i=1; AKwUvBzla/o+lpQZlo6ngZRnkyu1kTEvNHZCGLPeZZIjViMXVunPIOu83Ggwvce+j2uAMmLQrRh0KPH2ZlGybLw=@vger.kernel.org
X-Gm-Message-State: AFq9FYJDxxbmq2Mw6BhN4I8YAggQb6rLmxSi6r8Xaqf6g6WfNzOwWKij
	QZsCK4aWNDCtJ9fLb8odzAOrNzKIA948ZKKRLJMpPzUIBt2dzu+2aWn/P6BrS8cXBN9D9GGqlHO
	lpAaZaQ==
X-Gm-Gg: AYBFou31jEIMwys3wMLAInCxy63XdIixEZhZkvQ/r0J5TuqyNxLAxbvtI7IpaldI3w0
	vXmMsqKR2SCtNAT67xDPkjsubPtSjDNSlMPKyU0NFbqHDLeXASPiRmMKbd7x4cm5ymk7y2yhZ8p
	5Gbff0XA0cGMYluZWH/YPHH6Z+4QWPNtglM/g2I0tZILuXkXXRdsOBNuFIxw0j2Caq8QIkZyH83
	vPOvEsDbHQvroIGK/w8aKP75uoZH+afSrDRquitcCP/trT4XLdAbaqVVyIc7HLYGrLc8TwazTWa
	jnTYdNorEEL8VFTM2qlKOeSS5iQobRbmmWxDuUewgyWI9xUKFQIvXwjKZh7akRqjrH7kn/EEeHd
	39za1n9RPvbn6mDgCNS9P+gwcFmz1nxaydKTPOnr1m68Kd6LaM3jbLrP+jJesa8OHANLmPWdQQz
	dtjkF+fLwDFVzgzkbxXlcfl6KwZKYKCgXEUwROtLSHKKWXmjQ5ZASuAP4jBqAqRHzEgkC7tf2Ps
	FvAHL+3Ai29IATFOcABAaTpD3AnEHjev8O3kV59BI+ixUnn7e8=
X-Received: by 2002:a05:620a:7105:b0:93e:c12c:f12f with SMTP id af79cd13be357-93f5800dc62mr810116685a.74.1792675003270;
        Thu, 22 Oct 2026 06:16:43 -0700 (PDT)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.googlemail.com with ESMTPSA id af79cd13be357-93f56c70057sm513651785a.5.2026.10.22.06.16.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 06:16:42 -0700 (PDT)
Message-ID: <3433f922-bffb-4f1c-8e06-a7a87f5dbcaf@ieee.org>
Date: Thu, 22 Oct 2026 08:16:40 -0500
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
Subject: Re: [PATCH] staging: greybus: Replace format specifiers
To: pavankumaryalagada@gmail.com, greybus-dev@lists.linaro.org,
 linux-staging@lists.linux.dev, outreachy@lists.linux.dev
Cc: johan@kernel.org, elder@kernel.org, gregkh@linuxfoundation.org,
 vaibhav.sr@gmail.com, mgreer@animalcreek.com, vireshk@kernel.org,
 rmfrfs@gmail.com, dtwlin@gmail.com, pure.logic@nexus-software.ie,
 linux-kernel@vger.kernel.org
References: <20261021163437.280930-1-pavankumaryalagada@gmail.com>
Content-Language: en-US
From: Alex Elder <elder@ieee.org>
In-Reply-To: <20261021163437.280930-1-pavankumaryalagada@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/21/26 11:34 AM, pavankumaryalagada@gmail.com wrote:
> From: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>
> 
> Unsigned variables are printed using %d.
> Replace them with %u to match their types.
> 
> Signed-off-by: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>

I have reviewed every one of these and they look good.  Quite a few
of them--because the size of the value being formatted is less than
32 bits--would print correctly no matter what their value.  But I
think it at least does no harm to convert the format specifier to
unsigned in all of these cases.

I have highlighted below an existing bug that should be fixed.  It
gives an example of something to look for when you do this sort of
activity.  Please arrange to get that bug fixed.

I also pointed out one other observation for you to think about.

Thanks for sending this.  I didn't check to find any other instances
you might have missed, but you seem to have found quite a few.

Reviewed-by: Alex Elder <elder@riscstar.com>

> ---
>   drivers/staging/greybus/audio_codec.c    | 20 ++++++++--------
>   drivers/staging/greybus/audio_topology.c | 30 ++++++++++++------------
>   drivers/staging/greybus/bootrom.c        |  2 +-
>   drivers/staging/greybus/fw-download.c    |  2 +-
>   drivers/staging/greybus/fw-management.c  |  2 +-
>   drivers/staging/greybus/gpio.c           |  2 +-
>   drivers/staging/greybus/light.c          |  2 +-
>   drivers/staging/greybus/log.c            |  4 ++--
>   drivers/staging/greybus/loopback.c       |  4 ++--
>   drivers/staging/greybus/power_supply.c   |  2 +-
>   drivers/staging/greybus/raw.c            |  2 +-
>   drivers/staging/greybus/sdio.c           |  4 ++--
>   drivers/staging/greybus/spilib.c         |  2 +-
>   drivers/staging/greybus/uart.c           |  4 ++--
>   14 files changed, 41 insertions(+), 41 deletions(-)
> 

. . .

> diff --git a/drivers/staging/greybus/bootrom.c b/drivers/staging/greybus/bootrom.c
> index 83921d90c322..fb1fbd3f7b99 100644
> --- a/drivers/staging/greybus/bootrom.c
> +++ b/drivers/staging/greybus/bootrom.c
> @@ -222,7 +222,7 @@ static int gb_bootrom_firmware_size_request(struct gb_operation *op)
>   	size_response = op->response->payload;
>   	size_response->size = cpu_to_le32(bootrom->fw->size);
>   
> -	dev_dbg(dev, "%s: firmware size %d bytes\n",
> +	dev_dbg(dev, "%s: firmware size %u bytes\n",
>   		__func__, size_response->size);

This line actually contains an error (and it was there before).

The type of gb_bootrom_firmware_size_response->size is __le32.
So the value being formatted needs to be converted into CPU
byte order before being used.  That could be done this way:
	le32_to_cpu(size_response->size)
or just use this, which is known from a few lines above to
have the proper value and byte order:
	bootrom->fw->size

Please add this to your list of things to fix, and submit it
as a separate patch.  This would be a bug fix, which would
also give you a little bit of a new experience.

>   
>   unlock:

. . .

> diff --git a/drivers/staging/greybus/raw.c b/drivers/staging/greybus/raw.c
> index 4f1b3f4db404..2314496a858a 100644
> --- a/drivers/staging/greybus/raw.c
> +++ b/drivers/staging/greybus/raw.c
> @@ -112,7 +112,7 @@ static int gb_raw_request_handler(struct gb_operation *op)
>   	receive = op->request->payload;
>   	len = le32_to_cpu(receive->len);
>   	if (len != (int)(op->request->payload_size - sizeof(__le32))) {
> -		dev_err(dev, "raw receive request wrong size %d vs %d\n", len,
> +		dev_err(dev, "raw receive request wrong size %u vs %d\n", len,
>   			(int)(op->request->payload_size - sizeof(__le32)));

The above size calculation was done somewhere else without the
(int) cast, and the format specifier was %zu in that case.
I don't think this needs to be changed necessarily, but it's
something inconsistent across the Greybus code.  Consistency
helps readability and maintainability.
  >   		return -EINVAL;
>   	}

. . .
