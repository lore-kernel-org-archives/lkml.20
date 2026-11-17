Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794892233;
	b=5UM9+KnQ56cKCwr4v97QbuLkrBSR1skqQ33i49zeZdw7ofc+Ee3qY92APA33ujrW1Wds
	 HbZ7L6lr5ldrovkOzUAjHttRlRGzGFTmnh3f69PLHaeD4f9pctKVXsAHAAFGpnQ6W3afz
	 Kxi09sBnLrXGuT133X4zJrxVx2DNycOB9l4A9K6OPWN85nxI9Wo/ZN7DDrtRdSynEZxBS
	 Pyro6ma361qJqS/h36rQ6I15UPA8pszi61ZXEIES9EiWzeDwrbBkjugz0tvuVypivOdLW
	 8lIfyagKokDOMAOZOmj5GeZIXk+mVSKvlNFvkIjWpN1dSDYP0jdwB3ylAVf25ezoAUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794892233;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=TIi30UMnkbCM4UtGXQM9HLD1fy4eaWCJLQHah5nV8Gg=;
	b=wqnYV7DvSdEYOOflJQKsemd7d+JZbegkNXp2Hd23sGoliiWDOm9lXHaZ4/nsuyPPrV2g
	 5Sw8Swc/N2be8piopI290RNfPl0ZA3UdcBrF8Nnfqk8O5XvEbcTqZP2ueVMp+kmuI4E9R
	 Xrg4Toyx9Gf33XBk5xbqZFN4zQ54d28dtmMBeGF1W0469loepHWWIN77MuOQROsyqtl1S
	 UiaXrxzj7ijMWz4F/jHu08AooutU+HvTspB7IX3mcR0YaPuzs7gX5dxNJlc+7kM6x6uKq
	 SC245/l8xpSH1DUVwcqdx2VDWGW/rtB6IPaDX1Rw95op/rFodUv1rcEm5Y8OQzIDYEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=np1YlEKo;
	arc=none smtp.remote-ip=74.125.82.47
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0585606A323
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 05:10:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0585606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=np1YlEKo
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-1a2761c69fbso494691c88.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 21:10:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794892232; x=1795497032; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TIi30UMnkbCM4UtGXQM9HLD1fy4eaWCJLQHah5nV8Gg=;
        b=np1YlEKoqz11tuK/UlAujFNKf0kDw59jGJP6oEJ1lgXt37/I7ZqS4ZyK70VQkMDfDB
         uZn+fAk+F4J4RGlvTRV6kNa7HkxJZSUhj7gIrUpZ3Pzg4+n14GhtUwAOiWukL3fuVyZ0
         7Mw5l03qET0/oxnAhh3eU8XHYRxC3mFlcw58hIlA0OXtk8Wt5C69cDtaVf6Rur9RpeOG
         dRlILS7/NTXsfuueFi1Sov2EVw0PTdK52fNvrGFVwjLz6X1+/mi8V1RuspEoZSiewRNE
         Xc8sQ8K5TcloAI37Thtl4Z9m62fHcdYM0UWzbXLZuz21n6FSuL7OeLKVuhAu3wLxttSD
         hzWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794892232; x=1795497032;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TIi30UMnkbCM4UtGXQM9HLD1fy4eaWCJLQHah5nV8Gg=;
        b=oE+NKL4/Wq0oDj1BP1fpvGqqbVVtbMWQaGclc8vL0TheMal4x9UPN6ut0KUe5hAnPk
         Cyw3NmhtSHorIxrS4R7W0kuXz5fNXTWDN2tq9dXynTlXzoIorHl7en7F5eQ57TtzWDHY
         z1Uh1OJ0m5tpUdgVTdPmF2MEeAEI7fPXxDMu/BWyXELdQ19t8nv3KZKC4k8Tw9hXbltj
         LfJzoeyZkdf1FqDM8dKKQXvutuLn15jbnWQPR7qsZ3Mi+oODolVjDrBJ9i8AMO92nCI7
         laqRAoqXc11gAw6fN1aBqgeAlihIyMBccHWZ6Hzuy2Gwr/JIl45RcuoGVIuXiG0tUOpP
         hPxA==
X-Forwarded-Encrypted: i=1; AL+hErGE+lQuIgp2aPkvrHU9ff64XKJIxB7G6+Kj4BC78s3KjGyXxM0rMvfEjDwhT8ovIXPFZ6HAJFMp61kXuBM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8szHeHUIqH0YQ/ZuBdNLKQVYZ+pfFyToHZAPcQqBaCrEpDY+bJ
	oq+5Q0mmZS6CkhHcG/VpGOKK30+0E8DwZYQ6xogpZuAPUUCwVL4JCpPi4oRS3vTmyiQ=
X-Gm-Gg: AYBFou3XwvTnpNtwmYy8tDXecrwnSm6b/0fQq4xiXZaYkzQl4NuC1hlW2N3QpOkBpYE
	sALVEW82BMPgilu//z+7R86XIy5TBqnwF7k1xAmMWey8fcq2OIMN5UNH05jVjVKSf1oH/vjppt0
	vKcLsd2qC4wY0KwhzeB9+lJFv8r5L6bui05SUfCD6JdqhiufT0wYvvSDO641FruRRNKfR1pVDjJ
	fiWTgqlVpqdApQ3Q6kvmIkcEUPIIR0HwD3XruDB2SPcbKO2u9yaJnGtXQr46ayVzd2lSv6sj5IB
	++0gHmOP8ny37NMsyYjFaqC2aN581XpGfM60r+WV8sTlezVpRfy0bnerL0xVBbLCGaywCZy4Tzd
	BYqtd0yeUVc4pDJmQfVs7r9qdM3My8N9Zru22uMORdFaBdrJzt0Xbq20B0Jrs7I5vSZxqWv83ND
	zVT14QMtr/rD5cKxk/ZErAPOJmlmHYdDTr8/XLy4cem0O0xV+siqEQEi6nvQb2pCjNnRKOtnGLv
	f5pKeILIV/4h9IpJyeUxguh9PKqMEkDLKm7pNaC6MK+7st6sHpUM1kLu0fldLybFepp4OUyGjWL
	ZRh/XXIaSAsH8Y+DsEHMgIlLGsX6e6M=
X-Received: by 2002:a05:701b:251b:b0:144:f089:b189 with SMTP id a92af1059eb24-1b50319ce4bmr12633287c88.36.1794892231696;
        Mon, 16 Nov 2026 21:10:31 -0800 (PST)
Received: from localhost ([122.172.83.36])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37956bad6casm38745543eec.26.2026.11.16.21.10.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 21:10:30 -0800 (PST)
Date: Tue, 17 Nov 2026 10:40:28 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Lianjie Wang <lian@is.s.u-tokyo.ac.jp>
Cc: "Enrico Weigelt, metux IT consult" <info@metux.net>,
	Viresh Kumar <vireshk@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org,
	virtualization@lists.linux.dev, linux-kernel@vger.kernel.org,
	Takahiro Shinagawa <shina@is.s.u-tokyo.ac.jp>,
	stable@vger.kernel.org
Subject: Re: [PATCH 2/2] gpio: virtio: compute the line names size in a size_t
Message-ID: <avvhxNXQ3fI73QgD@vireshk-B250M-D3H>
References: <20261104195632.1702765-1-lian@is.s.u-tokyo.ac.jp>
 <20261104195632.1702765-2-lian@is.s.u-tokyo.ac.jp>
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
In-Reply-To: <20261104195632.1702765-2-lian@is.s.u-tokyo.ac.jp>

On 05-11-26, 04:56, Lianjie Wang wrote:
> virtio_gpio_get_names() computes the size of the GET_LINE_NAMES response
> as sizeof(*res) + gpio_names_size in an int, where gpio_names_size is a
> u32 from the config space. A gpio_names_size of 0xffffffff makes the
> size 0, devm_kzalloc() returns ZERO_SIZE_PTR, and reading the status
> byte of the response through it oopses:
> 
>   Oops: general protection fault, probably for non-canonical address 0xdffffc0000000002: 0000 [#1] SMP KASAN PTI
>   KASAN: null-ptr-deref in range [0x0000000000000010-0x0000000000000017]
>   RIP: 0010:_virtio_gpio_req+0x2b8/0x550
>   Call Trace:
>    virtio_gpio_probe+0xc2a/0xfc0
>    virtio_dev_probe+0xa7a/0xc50
> 
> Compute the size with struct_size() into a size_t.
> 
> This patch is assisted by Claude Opus 5.5.
> 
> Fixes: 3a29355a22c0 ("gpio: Add virtio-gpio driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Lianjie Wang <lian@is.s.u-tokyo.ac.jp>
> ---
>  drivers/gpio/gpio-virtio.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-virtio.c b/drivers/gpio/gpio-virtio.c
> index 32326d91f33d6..fb7b40eff37dd 100644
> --- a/drivers/gpio/gpio-virtio.c
> +++ b/drivers/gpio/gpio-virtio.c
> @@ -494,12 +494,13 @@ static const char **virtio_gpio_get_names(struct virtio_gpio *vgpio,
>  	struct device *dev = &vgpio->vdev->dev;
>  	u8 *gpio_names, *str;
>  	const char **names;
> -	int i, ret, len;
> +	size_t len;
> +	int i, ret;
>  
>  	if (!gpio_names_size)
>  		return NULL;
>  
> -	len = sizeof(*res) + gpio_names_size;
> +	len = struct_size(res, value, gpio_names_size);
>  	res = devm_kzalloc(dev, len, GFP_KERNEL);
>  	if (!res)
>  		return NULL;

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
