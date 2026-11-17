Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794892220;
	b=keqza8B/3Qo9vmFi1URiShvzyrytNdiGfpd27yKtvPR4Ik3i5ZHbZB/4RkJewLZjkYrU
	 lOcrt2w0Hlok8SZ28jg6sGzKdA6iOW+tuYR/dj2c599Rh3v7fq5lKFmhwcmMu2OCHr3GC
	 itdd6dOfoAkEXel8CzZqKIr7xGGCbUjxxYTCPYz7N23ycgLPQUuDyw6sUX5IIhi1dnPyC
	 6swjYNPeGfx9Dmv1ZvC38IYQfASxuXKSX4Eow3voBNCctwwDAT+zTn/diwuAq5HGIYD+R
	 cuWY9ySrthX2IQnd3rKJ8KvN5hQTd/2gH+RzQz8l0De6BPVP+XEec94yi3vLExzNybQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794892220;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=2HROhYrsHDpN8EZWrWCuWsnDk1gTxZfjwa9MvLNeoEE=;
	b=fTq1zRzGYEEL3t/DFWgbOpDp3jZ2TMibv0itHZL7aIPozcatx1BGsM1sFgyhq3iPhde5
	 yEYffj0NY660VtvLA41VHNhVBWRSIWChWzkQNSTG1okz04CehY1e8sKDyPvDQyFBu+RdZ
	 1Ru4Rgll0We4lJYIbXKHMP+iman9HqVLAiOuj7m1KMPUpu2q3fTKdW1iMCKDaJ+zHAsoG
	 pozqj8Ak65oDw1GkceNW8Vpo90eOWIsQ+BMG4zkK28HQ31jcxw1C33apKAdMAsUmFJQ5C
	 9CBF6OX5Q0OqkwSTawecnJiCok/HYTFpiVo4PnW2qgSFVaZuvgD8/Z9r2vW8VinQHZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=QF1lpluy;
	arc=none smtp.remote-ip=74.125.82.47
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 486C9606A323
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 05:10:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 486C9606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=QF1lpluy
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-170135e43c7so6803497c88.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 21:10:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794892219; x=1795497019; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2HROhYrsHDpN8EZWrWCuWsnDk1gTxZfjwa9MvLNeoEE=;
        b=QF1lpluy9KLK2IGIKiu6Ld2Xl59P4H0JE2/ItEyLmgAAv4OLyO0W+5xhxFevc5hxBG
         Ev1hkL9Hji0f2HFl8IHVEBKjGt27Wm3Ny3muKEBfPJ0A/fifctXfzE3y19ZkQPGr238c
         HlYx2R187H1U55BpcnbVX9ytcs2hMs4or7mqQuC6irMEWgpdnSz40JoXRW6aSKJp8X5l
         n4FGSRhMlPAOhMoVFtq2TDpJmdoyYE8ENmRzYD1Ei7/tqA1RmSc8BvuMmtwcin7jhUPX
         mStilZsD9Kd+fLX9ExluNv6uC29KSQbwJsRt8lSCcZV5UB/8pjQ3oTSkUTdZ5h7Imsrc
         2eAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794892219; x=1795497019;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2HROhYrsHDpN8EZWrWCuWsnDk1gTxZfjwa9MvLNeoEE=;
        b=B1Y1vtQ+fQKr2JW0yBgL+XDgxmARkXNwcKypM/p48pPtkMYflMpmXuns8gG2/cDMC3
         qt1mhrozGPQGNoapeJ3CP4ozZ3fbfI5aZa/XEcILxpNV78U/2du1jYjY89p4IKTH/VS0
         /5Xmf7Ef+gsD6JnmF/qdugjkFYsC+cRFQxGW+hAwEREjzlbjLnuK+u9/OoMd03NQB8Wf
         Bty1Jq9Wt/7THuzB23l9WC3yooht45SvBQCl9DpyYcP/10b6wvozfWhXa1Ui/QclXVMa
         v4c2PenDNFlgTWTMBlzGzB6X+GqjTA1DJUiARlXwXxG0H3rbqS9q29DybzFLWP73CxSM
         yFMw==
X-Forwarded-Encrypted: i=1; AL+hErHnmHE/kIZ9QZQL2CJ0bDnM4k7l973IK01DaYlTaOZoPJLt5uqJPI7K2zixCCLNLeeBGOg2OrMeREr/C6g=@vger.kernel.org
X-Gm-Message-State: APuU4Z8jxAfUTDol2qYnYxSYJdbVhptF5jQtRTUhVnCaE8wprjVjpW3h
	jhtr158Itm0h3TDfkksC6W7fvW5y6aqfIrjUmZkPFreF0k9rM7CEfute32VAv4iTvAEFMl8PHht
	ZYklL
X-Gm-Gg: AYBFou1gOV+4UMEM5+dN4+pOPMRPdyQ/md7LTdvgHfareDyPPT0teqMSDbk8zcb4uUe
	qB0WczXZaoCg1bYVA6NMLBuR1sEihCr6k6BQuA6gHTedNIQ1gCJjMs5IssvG7OeaFIwoA4I5AdY
	x3xzwgoRk2GSZMPFjIzwLwMpmvczNffHYsrjsXm6RnbB0y1RLMfIQA7eMKZwIZj1EDHC8glnAaW
	qqdLaGUxbRnjDH/vhJUObFawxtkOfL+OnQM+bMtmGvNrygKFRXdH9TtBEW+uwVdU/AuIJlIgkaX
	peiN7y+2+elydX0QLjiSrmPzSuS8DcTh1hEpV2jTQTWwWw/9BBFHPFoWoqseQZbn9oWRvq14Scf
	iTM7Qfdbytzm5RQ/JGfB3pEt84VZ8yOXSDuc5JpkdBJFwVvsUaqIVKnxeRsGRS7Xbgw8prZngSe
	ZS2/ZcT0DLwGzKaVtI+4vSfR2VK9NL312/UxEsoMSeXTOIL+Js50KrAOlWvwMvOGLKsPScb963J
	7rgJojygVdjeEmZyrCWqlimvpQKyOJVOArk9k1AVSUPZRzmJSzCwQliwtTBSw0OLy6ypQ4QjNAs
	m7+jJTKENPVlXElBr42wD7/uPEExRA==
X-Received: by 2002:a05:7022:1081:b0:154:e9d2:d741 with SMTP id a92af1059eb24-1b503112e3amr10151143c88.8.1794892218987;
        Mon, 16 Nov 2026 21:10:18 -0800 (PST)
Received: from localhost ([122.172.83.36])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38116afd7f7sm3856351eec.17.2026.11.16.21.10.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 21:10:18 -0800 (PST)
Date: Tue, 17 Nov 2026 10:40:15 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Lianjie Wang <lian@is.s.u-tokyo.ac.jp>
Cc: "Enrico Weigelt, metux IT consult" <info@metux.net>,
	Viresh Kumar <vireshk@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org,
	virtualization@lists.linux.dev, linux-kernel@vger.kernel.org,
	Takahiro Shinagawa <shina@is.s.u-tokyo.ac.jp>,
	stable@vger.kernel.org
Subject: Re: [PATCH 1/2] gpio: virtio: bound the line names block by its
 configured size
Message-ID: <avvht67hxDh7a9oV@vireshk-B250M-D3H>
References: <20261104195632.1702765-1-lian@is.s.u-tokyo.ac.jp>
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
In-Reply-To: <20261104195632.1702765-1-lian@is.s.u-tokyo.ac.jp>

On 05-11-26, 04:56, Lianjie Wang wrote:
> virtio_gpio_get_names() walks the line names that the device returns in
> a block of gpio_names_size bytes, which the driver ends with a NUL, and
> checks each name only after stepping past it. If the block holds fewer
> than ngpio names, the walk reaches the end of the block after the last
> name, and the next iteration starts strlen() at the byte after the
> allocation. With a block that holds one name for four lines, KASAN
> reports:
> 
>   BUG: KASAN: slab-out-of-bounds in strlen+0x57/0x70
>   Read of size 1 at addr ffff8880026687c0 by task swapper/0/1
>   Call Trace:
>    strlen+0x57/0x70
>    virtio_gpio_probe+0xcb4/0xfc0
>    virtio_dev_probe+0xa7a/0xc50
>   Allocated by task 1:
>    devm_kmalloc+0x6e/0x280
>    virtio_gpio_probe+0xc06/0xfc0
>   The buggy address is located 0 bytes to the right of
>    allocated 64-byte region [ffff888002668780, ffff8880026687c0)
> 
> Check that a name starts inside the block before reading it.
> 
> This patch is assisted by Claude Opus 5.5.
> 
> Fixes: 3a29355a22c0 ("gpio: Add virtio-gpio driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Lianjie Wang <lian@is.s.u-tokyo.ac.jp>
> ---
>  drivers/gpio/gpio-virtio.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-virtio.c b/drivers/gpio/gpio-virtio.c
> index ed6e0e90fa8aa..32326d91f33d6 100644
> --- a/drivers/gpio/gpio-virtio.c
> +++ b/drivers/gpio/gpio-virtio.c
> @@ -520,13 +520,13 @@ static const char **virtio_gpio_get_names(struct virtio_gpio *vgpio,
>  	gpio_names[gpio_names_size - 1] = '\0';
>  
>  	for (i = 0, str = gpio_names; i < ngpio; i++) {
> -		names[i] = str;
> -		str += strlen(str) + 1; /* zero-length strings are allowed */
> -
> -		if (str > gpio_names + gpio_names_size) {
> +		if (str >= gpio_names + gpio_names_size) {
>  			dev_err(dev, "gpio_names block is too short (%d)\n", i);
>  			return NULL;
>  		}
> +
> +		names[i] = str;
> +		str += strlen(str) + 1; /* zero-length strings are allowed */
>  	}
>  
>  	return names;

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
