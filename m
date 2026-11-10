Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794326833;
	b=kVrFWamyYIJgVIt/DFvf0crJ6m0kBx6jIQTxoFh6z40DPHZiyqUBY0fOrRw3Bqbhq1Xn
	 kujMe2WunYZjChPDWIyff30enFAHf4e3SXlsAQGj/vA4tio7Ba4H9XdoTO0qWH0YFPHB5
	 w0pEn315ULd7tr17fuaT5U7DcT3UXCQjFIlo5N9uPi8f/gWEo5zQchvT0DkBAeF1cfuOM
	 lTdR93J3/C7v4/UwAY5nwdFFuZvloVL4qR1ifIcE4xKgQ6neVBlg8wWP6iELku3Oh8GCC
	 sf2R5T6Ae+BmoOemVNaXjDrxThWMLQH+Zgd7BFj6bgJnIS00Oww/H7jlMg8LyTWpEIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794326833;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:Content-Language:To:Cc:References:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=Hx7PdOFoy3DDyb5Yl9lhBRCrmT8HbVEMfYuz02WsYzw=;
	b=VoZ+8dvAr493vOle2feepiRmaRk1Gy7Bz2lWInloWZsB0XX3ha0yDIe4l39aZhjXM2Lb
	 6ne1oysM/n9gMmLBKTDL9lYrsee+znmrIasku8OFg9AQRKVmdmSFVS+U3PMJDRD0kQe77
	 1UNKoKNgf14i8+woXaZCxgqn8dYiWUI/xzCGmKOMl3pLuqwtFYXefqy8P/UBHPxUWkDDz
	 cXbdMPy4tWQZx0IwN2Civ9O2vX9iBDTh0UQTbHkimCLAWHmLG51LpYHHFRPr58VCti5rB
	 qred5fxSUo2CVrNMEURBC7qWP+x+zCIaKXyXMBcwovW339q8uLOsoILG6hCiOoMo49A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XDjiHE03;
	arc=none smtp.remote-ip=209.85.218.50
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED121606A320
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 16:07:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ED121606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XDjiHE03
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c4395d31228so297280066b.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 08:07:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794326831; x=1794931631; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Hx7PdOFoy3DDyb5Yl9lhBRCrmT8HbVEMfYuz02WsYzw=;
        b=XDjiHE03zZBunu/ipDBY/mgWQbXa2axnnltc3YePQgBV8RPN1JM1Ou9GlFxXY17m1Q
         RSlHAVYSkhRhJSo8FFG6K6gM0yfiUeC8zKpPIOSQPeDu5t7KsvijzV+fN9gxHc7407bs
         1yCLVAHoqhGCM/kUsg43WbPmY12Ao1nqrxGQzZ+ljryuDOzRgWbuKnsFWDYFvDxmv7ms
         b1Wna2pyQ3ykpuxN97HitesQ9/JyDj6RPvWEAsFHMNcONOsWanuH7/L6Pv70+dhi+lzn
         28AQdmm1qACi5Q82u0VafPXe72OlvYC0RwtolxkO/x6tLiL7WSgG3HXZrchhLDdyokvM
         plMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794326831; x=1794931631;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Hx7PdOFoy3DDyb5Yl9lhBRCrmT8HbVEMfYuz02WsYzw=;
        b=ze3qoC4Ppdmps+TF4+wmat4uo04fXeJQuFspayA4xvg064FFW1y8oMSU10TsWBVfxX
         nfe21xPzIbky7zWFjkv+Y2xPDKr90bw464cBo6RRA9+3AXpalSTE2iXwMS5RZzICye7j
         f9jsurrbYtINsFa24j70BTwkQEKbCzuidjIB46no4H8UcUSZDedXCeQzPHqMsQxfjtSz
         QVk0XmAif+oNN3RjncV7P4MHD7ZS6D/BZHhi+2FkMYYHJaWhNZ7BVPo49gjzItWXa8gS
         hoGZySg2CmD/zsfSjXu1Duilt5qUF9ZxcyYwgFz7ahJ0ApeefPeZJSfYszqw4HTb7RJT
         O+Lw==
X-Gm-Message-State: APuU4Z87j/OcB+KL7t88MkVWigp79msMpAfmUdjAqwlDOpJe4FlL+yWO
	6sceyzDU+08A1pKOOpt3UdxkhF8BNCui0xyQJotneqKNyNFUFthGtbyn
X-Gm-Gg: AYBFou2JrqtkSK/u3QfkiOvBnoEPDD3et1WI4MRkLfEVIQftMb9bm4N2PyCxbfAAlK2
	LeRdDfl+IvggIBSSvQkeNkpb7Cjx9ZZWuVKcifS2xPaxgi1e+97oS6qBwXXtNcfN7WJOTl7b8iN
	aI5szS3ZAdVUVmQLRlF/aJAA8pxqyNvom0sRYxHA/L2UlNfHyprBpVvjdkwiMdkR+eS+sxaPG8P
	6iIaW7/Ofuzcfn5eDHc/EFU37yfo/Fa1K3Wq9ptIIVERfBb2pDee8P3F+2Wq/9Pd0hz8C65kaG+
	d+djtKMqPSGRJ2h1bqgtrQnR3kpH2AVTnMT/xk1l1IaLRroVlbv9+9ElpU8l8BaN6hAEDBEuC7r
	xlhnBGtuMmqv0KvlsVX6U2p9W/MEDauBY6rWyrjSvVIGZxTbYYR1cEe7i/4JAByBh5vpyDS/b65
	NFn9bIyufPx2PXsJgp70N6u2NEx9GmVMjE27Ge4NMpnl0gq/R26UnE+8L0LrSwUMsAMOXvfp6QO
	QmWgjV0PDYukpW3b+wTTr7hdvFAFs+6gNAzWNLcZP5+Dc95WBCa86qm/maK9BODoNoOz2YuUk2/
	KsIKJwt59px/3uJy5/pZJ8dm7gU0Tvl3FLY2mBAaWtvAiDd0mkZ7p/Yr5hThXU7Dx0FG2gS7/6P
	ULqJwRRgh1pCvT/56akVcUC8n46U=
X-Received: by 2002:a17:907:3f0d:b0:c2e:4a61:d436 with SMTP id a640c23a62f3a-c50495d6ee1mr267672066b.36.1794326830946;
        Tue, 10 Nov 2026 08:07:10 -0800 (PST)
Received: from ?IPV6:2001:9e8:f112:4801:300f:57c8:c9fd:3080? ([2001:9e8:f112:4801:300f:57c8:c9fd:3080])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c504a6551efsm126029266b.68.2026.11.10.08.07.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 08:07:06 -0800 (PST)
Message-ID: <8f5f5582-523f-4632-be69-b176f7ac52db@gmail.com>
Date: Tue, 10 Nov 2026 17:07:04 +0100
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
Subject: Re: [PATCH v2] gpio: line-mux: fix unsigned truncation of property
 count error
Content-Language: en-US
To: shao.mingyin@zte.com.cn, linusw@kernel.org, brgl@kernel.org,
 linux-gpio@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
References: <20261110225742308FW7iPw8mc9gwd2DU0W-_w@zte.com.cn>
From: Jonas Jelonek <jelonek.jonas@gmail.com>
In-Reply-To: <20261110225742308FW7iPw8mc9gwd2DU0W-_w@zte.com.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Shao,

On 10.11.26 15:57, shao.mingyin@zte.com.cn wrote:
> From: Shao Mingyin <shao.mingyin@zte.com.cn>
>
> device_property_count_u32() returns an int and reports errors with a
> negative errno (e.g. -EINVAL when the "gpio-line-mux-states" property is
> missing).  Storing that into an unsigned int turns -EINVAL into a huge
> value, so the "if (!ngpio)" guard never triggers and struct_size() then
> computes a huge size.  The allocation fails with -ENOMEM, hiding the
> real error; struct_size() saturates on overflow, so this is not an
> undersized allocation on 32-bit builds either.
>
> Use a signed int for the count, propagate the property-array error, and
> reject a zero count.
>
> Fixes: 2b03d9a40cd1 ("gpio: add gpio-line-mux driver")
> Signed-off-by: Shao Mingyin <shao.mingyin@zte.com.cn>
> Reviewed-by: Jonas Jelonek <jelonek.jonas@gmail.com>
> ---
> This patch supersedes 5/5 of the v1 series; 1/5 has been withdrawn and
> 2/5-4/5 are unchanged.
>
> v2:
>   - keep the declarations in reverse christmas tree order; merge
>     "int ngpio, ret" (Jonas Jelonek)
>   - propagate the property-array errno when ngpio < 0, and map only a
>     zero count to -EINVAL (Jonas Jelonek)
> v1: https://lore.kernel.org/all/20261107161258203oCy-Pa4_0rNe65TqrzFWD@zte.com.cn/
>
>  drivers/gpio/gpio-line-mux.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpio/gpio-line-mux.c b/drivers/gpio/gpio-line-mux.c
> index b4452d956bf0271d25598de2117c0db73805aba6..00b69632c4401300d11bbc296306df114d18c08f 100644
> --- a/drivers/gpio/gpio-line-mux.c
> +++ b/drivers/gpio/gpio-line-mux.c
> @@ -48,11 +48,12 @@ static int gpio_lmux_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
>  	struct gpio_lmux *glm;
> -	unsigned int ngpio;
>  	size_t size;
> -	int ret;
> +	int ngpio, ret;
>  

I think you still need to move it up where 'unsigned int ngpio' was before 
for RCT.

>  	ngpio = device_property_count_u32(dev, "gpio-line-mux-states");
> +	if (ngpio < 0)
> +		return ngpio;
>  	if (!ngpio)
>  		return -EINVAL;
>  

Best,
Jonas
