Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792780862;
	b=NLZ0gVIAR5uXSAFeBSXKcFlXawmmfw4Qf+xhHza+tCUJP3qQ8sTXSP2+UCez7K5JuZAh
	 0kH3AmL9PCJVbwd9dWtmbF+w5G3hUsXpqyySI4q654040Zh9F6mapO7AqhovdgkITRfyn
	 3ZKFePR3NGCIUVg/MCDdkDcJblOmZeKCRveeo3Ma9PmQ0WDUhM0M78VbDMwnkDaGBiV8m
	 V6Wx0tbYp0K7eKz9QG2CYwPu4x0y3K75UCHd+nBlJuMEVmlV6yU2lS12/ENcj/UsQDzSB
	 GWVhdVV625bhXhx07AH0CqQ5hRjQ4xxTjq/LmEXl7yTpbp8+CvY8NjKscGdC3nafLkA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792780862;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=hvRwUyJ5wl+Vys6kUOnT5y3rEbSPcjUNYAl4hML2kDk=;
	b=X7LNwxXdQGCjP7OKZhDLznH1Qlljw3x8RYRs7iTxVpWMMIO5p9JgcErDueuxKF0em0Rf
	 dDiIqEYzn5bQsHjvWXRq9G7zPoM17ICo18eXHK50GQOFG39par25tWyr4X5qEC8xP0O8z
	 YvQlX6z2Jz81Wuqycmy5xnNh2v0XaZa0VwjQko5Ph+g7uKS+3l05Zjn0ZBYwqrkGwHTay
	 G264l8F5fFxdaX9GfYNgKI7LMtvq3+w+9jCG6HtZZ8n59RMJkRzEXy3Q035EM5eTLxPSG
	 iX3coPXLWA5mp53rqfOMFqx0UCQ/zeSx4g7ojO+OruhMBFJvmR7PUlxpae0WQEJ4VMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=I0Wjdbhg;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FBD5606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 18:41:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8FBD5606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=I0Wjdbhg
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48e0d1da913so965656f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 11:41:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792780861; x=1793385661; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hvRwUyJ5wl+Vys6kUOnT5y3rEbSPcjUNYAl4hML2kDk=;
        b=I0Wjdbhg7XVwj5t+d5yzbO5GWQLgCXYLZdjy10Ji8rNNW3VLtWfGFD8LqqUx1iXKOD
         DiJa4qGY3Xbijfmlub7iZSeDROTwHD/a/wvgmsC4ZUeGTyx2wtFly5cOocBHPYk3aD7N
         4SjTQyuyuY9RG2orwm4FWpxrwVel3MBF5lyY1AzS/r5i2tz1ThsoZ3lhUmrhOi8k4eVK
         0bKfj20ZoClJs19w6P9K2W+yxs13xVXy77mZ98+p6Q1KpVphGuIW3bWBoF/lhpmYCgPX
         5c2fzomJUck2SNNbeXj1bOBExLN0nYG3rKltVtx4hl8dgPvh49oHs73ualcLk3gHT9k3
         4T/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792780861; x=1793385661;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hvRwUyJ5wl+Vys6kUOnT5y3rEbSPcjUNYAl4hML2kDk=;
        b=Pvl1f8/RRkRzPfL10Qyyo6Yu/8kBXmulYK2CNEI27eZEHJHMkiYatJMjzh7+KGWzOS
         ePQLjchbTArxhnfrjQbpYtAmF/gqKy6Dqbu2x/+/+AgHRsiy6aIksvXNUYTl0ZyELgWP
         c+VRg842TWu7Me1o5w/NqY1mDg9rkeUuBcGMkhT7o7ggM6w5KsLnFAx+VniZ1xmjWSWu
         8cqEYyMe8bMNxBfulUQL4lCMcMycAlwGs33zRvXROSiz8w88L0j1GiUZNcA2oVj8+tFY
         eaqvyN2wuP73MzmJK6Nrm4iQzxspGIz729sX042td8A2JF5m6GP1agb2IQCdaauCXRJm
         J9HA==
X-Forwarded-Encrypted: i=1; AKwUvBxWiiUq7OKCOAsE1B2rVhS7MsooxD/JNNRECuMP/CwJfy8Y+lnn2SnZRcXT/QXmNq+dxIIaWMqBTDfR1Es=@vger.kernel.org
X-Gm-Message-State: AFq9FYIF0Yq7fnWIuBq13nWvXaEx4SxbJUiXZOlV+yawG+7sgScs7x9+
	kI3XsZ5VZUi3WVuTxmtOPDLUef9z59HC9EOQCg1UuUdSEaZLWweAgCrd
X-Gm-Gg: AYBFou1gnB+WFIwdV3oJ1Cu3kNfZbz6s5HKrPwRbp6Uipj+eYTAB2X+DRRd3vaN3S2u
	MTBfWbPGpvROxCxY88ZwMUEQP1Jp3CKRrBZop/2XFvjgUEnZ6UptSNdE2j35T/2+rKRgdTU2AVc
	G60TI2pkyy/6B73cR6QfeTs50mbxIZPTkNoilza23pCSK7d1DKmGoJxh9ME1yzxaAhiVdeZW7A0
	855z96MlPaioZIEj0dEm+19Vl3ISJRZKBskBwA0gfgEPfYGY//huSKz3boLUv9h6a3gLWu8zVfc
	AqNf0tUZeacG4wTjatHF8xxm8DuLys+G3vhCDquGgX+MBmXvGdC9DNFLln8pS2fuN44eyzS0WgL
	5lcVlQX0ykcUas40KGVh7Xa1GLpnbaXNaITgcTiIRg5j+vt/Y/k4QuoeRnEd2G4Qty4gY8uzbjM
	wS42ntX0ldXvf84ip7TiD4Q0u1bfFcN37ymLzZfMAA68a7y/k9GRzCa9badxBRwLE4N05Wzyn35
	WCsXLXNlFlCdjV3P9vvCAstBKn9yzPOYNmMZZ4X7a2Wa0KqAZjW6wRt7RXoFMDP62OE9ZnOICWx
	zZI7Y7nj+PnENQa1
X-Received: by 2002:a5d:5f0a:0:b0:48d:ed0e:6bb4 with SMTP id ffacd0b85a97d-48e2d0ff5e8mr12701841f8f.4.1792780860722;
        Fri, 23 Oct 2026 11:41:00 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3d3ee6d8sm1432381f8f.14.2026.10.23.11.41.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 11:41:00 -0700 (PDT)
Date: Fri, 23 Oct 2026 19:40:59 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Thorsten Blum <blum@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, "Uwe
 =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= (The Capable Hub)"
 <u.kleine-koenig@baylibre.com>, Zhao Dongdong <zhaodongdong@kylinos.cn>,
 Takashi Iwai <tiwai@suse.de>, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: cmipci: Use strscpy() in snd_cmipci_create()
Message-ID: <20261023194059.4e307a32@pumpkin>
In-Reply-To: <20261022164013.95811-2-blum@kernel.org>
References: <20261022164013.95811-2-blum@kernel.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 22 Oct 2026 18:40:11 +0200
Thorsten Blum <blum@kernel.org> wrote:

> To prepare for removing strlcat() from the kernel [1], use strscpy()
> instead with the current driver name length as the append offset. Also
> use size_t in the multi-channel branch to match strlen()'s return type.
> 
> No functional change.
> 
> Link: https://github.com/KSPP/linux/issues/370 [1]
> Signed-off-by: Thorsten Blum <blum@kernel.org>
> ---
>  sound/pci/cmipci.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/sound/pci/cmipci.c b/sound/pci/cmipci.c
> index 9d9f784e3a8c..5722b722da95 100644
> --- a/sound/pci/cmipci.c
> +++ b/sound/pci/cmipci.c
> @@ -2980,11 +2980,15 @@ static int snd_cmipci_create(struct snd_card *card, struct pci_dev *pci,
>  		query_chip(cm);
>  	/* added -MCx suffix for chip supporting multi-channels */
>  	if (cm->can_multi_ch) {
> -		int l = strlen(cm->card->driver);
> +		size_t l = strlen(cm->card->driver);
> +
>  		scnprintf(cm->card->driver + l, sizeof(cm->card->driver) - l,
>  			  "-MC%d", cm->max_channels);
> -	} else if (cm->can_ac3_sw)
> -		strlcat(cm->card->driver, "-SWIEC", sizeof(cm->card->driver));
> +	} else if (cm->can_ac3_sw) {
> +		size_t l = strlen(cm->card->driver);
> +
> +		strscpy(cm->card->driver + l, "-SWIEC", sizeof(cm->card->driver) - l);
> +	}

There are all sorts of reasons for not using strlcat() and various ways
of changing code so that it doesn't need to do the string concatenation.
But replacing calls with strlen() and strscpy() is just plain stupid.

It has no benefits and lots of downsides.

David

>  
>  	cm->dig_status = SNDRV_PCM_DEFAULT_CON_SPDIF;
>  	cm->dig_pcm_status = SNDRV_PCM_DEFAULT_CON_SPDIF;
> 

