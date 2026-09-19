Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6BB035C68C
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 09:39:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789810791; cv=none; b=N7cNV6NVDlcC3hy2FIg3skVKd0ykKUiV+G+/eAA9ge6GBnsuh8wsm2VG/HgeMU9wyOSJ1yyFji/l8/XCxyzrFu81XRWCRXiInasXHYP5kksCxJQsacW9VFNG5sTPjkc5ytukOlXCesaDZAGtXZ3s9/sPO9qVW8qUOZ9Yggj6HAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789810791; c=relaxed/simple;
	bh=VnurqPrpnN+sAeEL0x3TldaQv3nsKFA2accKz2jjL5k=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Fqu6hM60FkrpWQgHY+SKdG2/taL12jmFhuO0rGPfslRPu/9U0BG2ZpEfipWKraSjiBXD9lojOOZEw8nLeqppNXcQRpR2mNXCahH6HMfsMtm8XzrLKxPPAYw26TBlTZiLAeGnoybGQoOmQM8Nr/No+gWwwdeTrYGYC0zyKZBXqHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xdy4y/0d; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xdy4y/0d"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49cd38e0e5dso19674355e9.2
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 02:39:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789810788; x=1790415588; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uuNs+jmp7P80c+ETSoD8IhUkYAoa0hGSn0P6AjTo/tk=;
        b=Xdy4y/0d9E2EulS41gMojgLvVGEQa5wi6wotpFRTtA5Ug2QefACIn+1zHZfH4ZDUXk
         Zdc6t5JAYrL8mZCUeTf9NqrpUeIkVGOYHjXROLksUbQEOMX8U15kNJY96+RM9VjpQlGC
         8Xg/n5gD1UQ8W8WuV/1+raPO3W4RQN5b0OHIJ9XBcKfCMBxy+lw1SSbXkSAr/mX6dRha
         ICmho3xvBFd9RHdsphEZ2ZzaYnzW3YxaCmjLauVBN1PnSkoNgkzUEk5jTM5YYrxgZ4MG
         XT2Rx9W1m87Y4EdaXCfpJVzn509bBTWF5mWaG1utt0zE2Bm908PNouVsG9uvgGJwba8n
         GU1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789810788; x=1790415588;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uuNs+jmp7P80c+ETSoD8IhUkYAoa0hGSn0P6AjTo/tk=;
        b=lPh0fWKLPCSvrz35l7acDWOC8Olr0BmrCrqMSoXPOvueOw3u7NBCvnmbRkk7FrQhEc
         XFxAk8ApXDpGaYtRBtcD9hYR4oeszJwPeSWCwVF4mTG4s673TrR9t+pe68NaGLaMOt4e
         7wREsfznKOxav6iHBOQKuuanxacPJYfUEdiabOfGBrG0M98wkIFwTQJpspBqHKsViv75
         qhraagza1ogt80/rXxjdrtLGqdCszorlarqUVZ5ao+6xYK4xT9Mpl2DhoAlHasDdTzq4
         5NzX+Wvbk2rVLBDV2hNfqPpVfY8vyTBYvlUDEQHCGEA+lh4sitccPbV4j8EUBBBGvz0Y
         qh9Q==
X-Forwarded-Encrypted: i=1; AKwUvBwaIK8QQL/H+7T9gRC3UrXD2hJvyScXC6p65GUeHx7st242h3WijCLqptsVDQgWVGCKCa6Z6hPB0pHYeE4=@vger.kernel.org
X-Gm-Message-State: AFuF++kO/Wk04/K9OoxlVQB4LGs/8ljK9+naP4QUOiva04YhoicCb8Sl
	LXyb9qkV0t53fwQ2Tt6HFiDaM5QsFNXUkjYz/qJw677P6m8aHj9ygxEwSgXpxw==
X-Gm-Gg: AYBFou1kygVcE3xAU/Jr/Q3C/wvklM/IMx1weJtpas20ZvRdc/O2bLa+0jDbD0Z2UF4
	9oFiTSeTMwe0Qhv5CxSN8WjN4Qv7BTAz6wpyB83H9UPGVJVeOcbAciraztZP0owgvif314Cfon0
	Hglg8pJNy1eyu6V0QqfvuNDKMI2H9y7jmk18KRxh/9qqpYkc+mQQPR8bOMDt9R9ceR7FLoNndsv
	1nukWpG0Bpe1mY8bMhqLxU3Q8Euk3yTcN2FL4Bg/njfwwX5p50BwRXED2DzspIa606ZoYHY8T/1
	KcugUAqe9M8+rHcnqAmUZO7GpB2UjNDwwvs0sWtkI+YQdxp6zUv49+gcIW5egbDALO9u2QhU+uz
	iJVBkHeO5GotiC0keVZlW6lNmkEOyXJav5l4lqBgt6UJn3v84cv43FMpbYkOg4yW6GqgVHd3aZP
	yXm1K+8bzNy7zGDnBrVtWQUoyvzdd57sYOxmSZF6Gk9q6LYgVvmd8Xmjr6KCx47GVW5TkME+RHc
	8EW1l1dLkJbe8vr6ac5DoBFlwuiTCFJKXfEfD878HSBzL6zyqmnUsT4baj3KS5NbbrtfdVdC8bw
	F/4n5bi3J6KeUokJu9pmGvIA0y7vmXdwyl71PIbnMF7EyBfmsyIjbZKCdQiWP0BLdScX5JJHR0B
	wGSso65FPST16l85pmeRk6g5Dt4Q58GA=
X-Received: by 2002:a05:600c:1391:b0:49d:272d:74b4 with SMTP id 5b1f17b1804b1-49fc566e5ebmr66465085e9.2.1789810787947;
        Sat, 19 Sep 2026 02:39:47 -0700 (PDT)
Received: from systembl0wer ([2a02:8308:4092:11f0::f9f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fcd0ece6esm83417145e9.2.2026.09.19.02.39.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 02:39:47 -0700 (PDT)
Date: Sat, 19 Sep 2026 11:39:45 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: "Ivan A. Melnikov" <iv@altlinux.org>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner
 <dlechner@baylibre.com>, Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>, Andy
 Shevchenko <andy@kernel.org>, Jonathan Cameron
 <Jonathan.Cameron@huawei.com>, Francesco Lavra <flavra@baylibre.com>,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] iio: tools: Use proper macro to detect _Float16 support
Message-ID: <20260919113945.2bee973b@systembl0wer>
In-Reply-To: <20260918161305.1161852-1-iv@altlinux.org>
References: <20260918161305.1161852-1-iv@altlinux.org>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 18 Sep 2026 20:13:02 +0400
"Ivan A. Melnikov" <iv@altlinux.org> wrote:

> __FLT16_MAX__ is an internal compiler macro. GCC defines it if
> _Float16 is supported by the target in general, but the support
> may depend on the exact target options. For example, on i586
> without -msse2 I get the following error from GCC15:
> 
>   iio_generic_buffer.c: In function 'print2byte':
>   iio_generic_buffer.c:141:17: error: invalid conversion from type '_Float16' without option '-msse2'
>     141 |                 printf("%05f ", ((float)converter.f + info->offset) * info->scale);
>         |                 ^~~~~~
> 
> To fix that, use the public macro without double underscores.
> 
> Fixes: cdd445d4b2a9 ("iio: tools: Add support for floating-point types in buffer scan elements")
> Signed-off-by: Ivan A. Melnikov <iv@altlinux.org>
> ---
>  tools/iio/iio_generic_buffer.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/iio/iio_generic_buffer.c b/tools/iio/iio_generic_buffer.c
> index 000193612aad..9ea93984e0e9 100644
> --- a/tools/iio/iio_generic_buffer.c
> +++ b/tools/iio/iio_generic_buffer.c
> @@ -131,7 +131,7 @@ static void print2byte(uint16_t input, struct iio_channel_info *info)
>  		printf("%05f ", ((float)input + info->offset) * info->scale);
>  		break;
>  	case 'f': {
> -#if defined(__FLT16_MAX__)
> +#if defined(FLT16_MAX)
>  		union {
>  			uint16_t u;
>  			_Float16 f;

One Sashiko issue:

Does this unintentionally disable _Float16 support for all architectures?

Since the tools build environment uses gnu11 compilation flags without
explicitly defining __STDC_WANT_IEC_60559_TYPES_EXT__, FLT16_MAX is
undefined across all architectures. This causes the preprocessor to skip
this block entirely, causing the tool to always print 
<unsupported 2-byte float> for 16-bit float data, even on platforms where 
native support previously worked.

If FLT16_MAX were actually defined, the compiler would still parse the
_Float16 block and throw the same missing -msse2 compilation error mentioned
in the commit message. Is there an alternative way to check for hardware
support without completely disabling the feature?

-- 
Kind regards,
Joshua Crofts
