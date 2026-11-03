Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793732066;
	b=rL1CmirX80Qt4g4xeoQ10IjgYm984XuYuQh1On6QhdtDbs1QlP9ZBo+iWqqNgeWntSlz
	 /6AzE6IOwk+OussLXl+tdGc82NuM995JViSRmalvZLaiukj34Z36xwwZxKP/V71aCPZr8
	 L2q1O9nVXFM0SZ+2nS+p2RlkE1m/Ib0Uhp2x1koF/nHqQFk2fsQ43/SZoB751MqcPLINQ
	 9evDdhQjQdOcd1cytpr30OYcn09JYk+SnIUmXDg9Au9tAeK9zBKDECySb7bGcX5IAWHA/
	 VBZqkx9x6m23gqJtqDHrctKHmRr/JOaGdLwEm3JJWSLbLF5utWQp3XBx7LHl073n3Bw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793732066;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=qSLS6P8awR8sg8YK6TCBsmvvbL4PGOeF41QBtG7ggjM=;
	b=bzwh7Tn2R5nYR1JbjyBsp4dczmN7lwxIOrjbTGGYb0yHyc1CJNysvdLub2kwDqML9U5D
	 PQmkIrVtVdj16XyXwwGq97tn7p6eksprZuSP3agRR7Hc+mKvbmVJQdPhSkOvyMwGBRMCl
	 ZSStRbT+gPC1j9wC4mb9imhA8OAuPkjbQW4ibFIy/gieEY5RW357p1mQnGZ4FcXKb23J1
	 WqGdu6TBtnCgJowOAdCWtWCsPEe1XeUr8AfKPDh3TPacSJ/zs9ENskAfjfv9WNSGjDe3v
	 9dgJyPMLVh5XTIDF3NmenfKtC795NRxSTojsxtbrRcK2S6r+xdJea8k6WXztTolW59Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LgITnaNd;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14F2C606A324
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 18:54:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 14F2C606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LgITnaNd
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-3535a54bed9so6731055eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 10:54:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793732065; x=1794336865; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qSLS6P8awR8sg8YK6TCBsmvvbL4PGOeF41QBtG7ggjM=;
        b=LgITnaNdSvowF6Qh9MK3lhkdJPA8Hol85Npafv8fz6TgPGGRUf3tlmYysTR89Xtxp6
         VSnrZDzLthYWxaLR1kgxM9Jur6pTJsckxVY4tK/XJBjEyJ3M3Gxoj5yFyUjxjbrUIBHY
         MyUU9yqaJ9iRsVwaDEW1Gzu20I3B4dufRV/InC434N05ZrwIQF4DjjkL1uVzCrFLcHMP
         P1D5zUfo9KF7DdPoBkMh6cFnxX/BGNublaSDhMQ8yWb3fqRzQ988S1tPrmLmpUzioddU
         JBuxKh78qeEIG78xc6hHQmruArbOJM7KN2Edhs7yjt0E8wSiKbFRBA+mFX35jq8145R/
         P2FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793732065; x=1794336865;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qSLS6P8awR8sg8YK6TCBsmvvbL4PGOeF41QBtG7ggjM=;
        b=S3ugKsOnMx1qKNukU2EDXgj+bjWyy7jJUSreqU3M6TuiYv3TvELa0XUjBy8RSoffUh
         cMc1o316d45p4QKNvcN+bqqzRzzsbDYugwa47dvr6Uhm1O4YeGRd7sIiD0PfrFRS06mY
         kBfQ36lUfedrRH1HuRqTHQ/ArgMWIiYC0IlrezsPmKiAxVRQxmfBS8XMQYnnijX5Czt3
         LMEt22X5JhNbkApdoPOf9TV0p8P2IIV5dKenRlwmRP0Pl6y6UM+3H8YujVqNDoY9PhEc
         1wRMqvMOR/sxgBdsImTM2Io0n0guInWZ5s0s+7QqWTb2Hic58SDx/weYJsUV2QPIWZ/L
         Uipg==
X-Forwarded-Encrypted: i=1; AKwUvBxLu5pKO3n05ESu6IOiwfCnrxPaUzAQgK0OhfJTllHD0PvpUWsAgcIb5Av6HFEyjpuBJGVPjNzH92HaCvQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9GpsxQvdyIhmxWtMU45aR2SopZtlLvmS0B5JO8W2qxTMc5/QFn
	T7sF6I/8OBKykJngAtrUM6rTmLas3l+jg5+//pmc+8l6xDi4cdBpM6kt
X-Gm-Gg: AYBFou3wDgrg1FkE8tqpKrOQSZLNLspCI3+mmp++o9eUbgBnHoEelqEMq5obD1bmalf
	ljzmX3w3FqpilBDBYkAUMjO91DVCJyKVt74ajFtvHkyb8QJ/KVeaRPoJXtOAsYKmROmq0HCUIhu
	ACXtmJ2837bcjoAKbmDAa1EQDWYZ0sLuot5P614pgNApt9CmMe6PdMb4IYUpPWrSaidqoJcVCY2
	bX/ULMh8Byph+heqPNGwM08lEG0upThdFo+GYfYPIwrrByCo4RhoongQd9JWr60Ili2Bv9Gy2IK
	AqcSWDUgb/o9dv5+wZYKPxPbsL4pkwaW2+fknHeyhIZqm/W+q3pGhMELJoTKsR055vbvu4WdpyF
	28Eqgj+OqOns64UUP1W09IZIETDnm4g27XZvSuqXTHAiahAsLFEP8UU5Sr1emeqb2N8EzhL4THZ
	HC6EH3Xeebrx1VnmMbMya/peam9zegm59EnCzxwSS4FEhyEcAGj17FdYtTmvZg4ia2K5aS/fPcI
	RMmE0LuvFHMvoWa0CSyLjhGepLgMME0cwquDm0smu6mmUA1yi9WOaFZ3UTjk62SdeJu+X8cONao
	Gepqk1k7d68cpmgziuRsDA1EN4v6StcMrBuoxkEKpG5r6Tnim4k0JqvmLokGoGp2NbeR
X-Received: by 2002:a05:7301:3ab0:b0:369:535f:4d12 with SMTP id 5a478bee46e88-36a4221aa1dmr21444083eec.3.1793732064912;
        Tue, 03 Nov 2026 10:54:24 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:88b4:22ec:d621:c1b])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38a6160sm82913eec.9.2026.11.03.10.54.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 10:54:24 -0800 (PST)
Date: Tue, 3 Nov 2026 10:54:21 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Guanglei Zhu <zhugl3@xiaopeng.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	liuc63@xiaopeng.com, stable@vger.kernel.org
Subject: Re: [PATCH] Input: lpc32xx-keys - reject matrices bigger than the
 hardware has
Message-ID: <auos7TgVNv7EWnbj@google.com>
References: <20261103084135.426629-1-zhugl3@xiaopeng.com>
 <20261103084135.426629-5-zhugl3@xiaopeng.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261103084135.426629-5-zhugl3@xiaopeng.com>

On Tue, Nov 03, 2026 at 04:41:32PM +0800, Guanglei Zhu wrote:
> The scanner state array holds the last state of eight matrix
> columns, and the interrupt handler walks the matrix size that the
> device tree declared:
> 
> 	u8 lastkeystates[8];
> 	...
> 	for (i = 0; i < kscandat->matrix_sz; i++)
> 		lpc32xx_mod_states(kscandat, i);
> 
> The probe path only checks that rows and columns match; the
> hardware supports square matrices from 1x1 up to 8x8, but nothing
> stops a device tree from declaring more, which makes the state
> array index run past the field into the rest of the driver data -
> including the keymap pointer the same code dereferences.
> 
> Reject matrices larger than the hardware supports.
> 
> Fixes: 69690bec400e ("Input: add support for key scan interface of the LPC32xx SoC")
> Cc: stable@vger.kernel.org
> Signed-off-by: Guanglei Zhu <zhugl3@xiaopeng.com>
> ---
>  drivers/input/keyboard/lpc32xx-keys.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/input/keyboard/lpc32xx-keys.c b/drivers/input/keyboard/lpc32xx-keys.c
> index 285d5c32fe70..1d0b082e7881 100644
> --- a/drivers/input/keyboard/lpc32xx-keys.c
> +++ b/drivers/input/keyboard/lpc32xx-keys.c
> @@ -142,6 +142,11 @@ static int lpc32xx_parse_dt(struct device *dev,
>  		return -EINVAL;
>  	}
>  
> +	if (rows > 8) {

This should be a constant/#define.

> +		dev_err(dev, "rows and columns must be at most 8!\n");
> +		return -EINVAL;
> +	}
> +
>  	kscandat->matrix_sz = rows;
>  	kscandat->row_shift = get_count_order(columns);

Thanks.

-- 
Dmitry
