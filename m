Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792502223;
	b=XJSwHscnPvpKalcVTZud5Q5g3CDj3rBYOGXc/dQwLcAZTCT4IQAbQ5F3O5tnRf1dcA4y
	 voCJxW5I7QqSTnex0rzoDnrm1RGmdqHWia8ds0tUurgvECoVjO2KtqwAxh6lXSgyg9tv1
	 wrZSp4pibkVOxAFWK2V7tIevK5rPGkNZ2/ugbot8ZLnXDV+G0Z2LLw2SOaJoEqyRKspbo
	 xDsa5cZwsyeLvLn+SXfGbZU4fmfFV6g93u01yeKQKwpKzGbKVy6f28vUotio+0YbUVr3p
	 XMllpzcyQAp4Ncp1Evm7+W6/1WTYUllrvzy5Y3j++N5efXe9ZfHUSpPn+VcbP8LfoCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792502223;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:Received:Received:From:In-Reply-To:
	 MIME-Version:References:Date:X-Gmail-Original-Message-ID:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=sDfwnfFMb7H/U0LG01YBStUGulHQM26pPCTaRK+6r7Q=;
	b=Xry6mxbzj7kbe7Lxv3OqV65v2laNZVwFOAk5fuYK9sstSh7DbeZp7beR3aWrjSlhqLeQ
	 IkZuYdDfhXgtFjMOXp3OwRfCsfy8/aclFKlvm5DCdairOXv+ScVaoLvEeIGeFgCuagj9O
	 AJX1Enl7fdm32yms781/n1eDay9K+k8m7vI83+YyZ51YxmEOWHAq7/G8DQAMHD2+l0/++
	 Gdp7PXqlEMh84d+ykPR+flM0e/3lI3iopGWssjSP2j0SIf/9HmqnUTA1AHULBP1k+CC+N
	 Sqth0Z/dSTgqPF7T3slVUY2EevNL7iGEXsv8bL+j7MiE8e1ShR/nCm2/rD9603eHwPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FfsesGt7;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E9C6606A321
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 13:17:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FfsesGt7
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2ACC01F000C8
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 13:17:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792502223;
	bh=sDfwnfFMb7H/U0LG01YBStUGulHQM26pPCTaRK+6r7Q=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=FfsesGt74++87e1PYiuiZqu6olz8+eXc/5ca3xBoiBV0HrNseGvgF+mEMgjbyaUwm
	 /3urQVvJYdqeuAfGj52OJdl74yrRsYI2HqpWv5b2JVx/U/YbCoe5s4ESTKFdUrU8WE
	 Z/ydMSAjjTC5INk9Uwh8pzP4ZevG8nJ+ZnR6u3YnrLwLUKqSu9j2aH0TqFehZTwwuL
	 bVbjp61s2IYymQYrsOo233TB7XGRD92ee3QbUc17zgIIhq03TCkaW9vyOPDKfPMKQL
	 8OBCWqCxuJ3GQuyvUGQr5U6bpL4pLPktM0SX8htUkdJazwOMwBVcaWYeFRJNZ6kUkb
	 Cd+EupBy6yN9g==
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5be3db57938so2764446e87.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 06:17:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwnnj7EofHTe+oO+3FeR+jYYq4ogt6AHqPZ6cVtYEbk0tETr+L70ZWdInP8E1xrkXE4lU1KnFdA8pk1hMI=@vger.kernel.org
X-Gm-Message-State: AFq9FYK+BYwOyzQ1zxPLrrTlhRce+t1bQrpN9CZdFXv7c+j5rvOB8U2v
	Mivk8meAF7CBBG5k7Pi4OEpPDIF9bBlQ7yyTL7ronyYmUPb4i1MWr+KEn/1PazBu8YR8j+ZYQwr
	PJBU/pDyw6oB/1S2mJnO6MLXJwt8o4TM8JM9+JhUZxQ==
X-Received: by 2002:a05:6512:60c:b0:5be:516e:5728 with SMTP id
 2adb3069b0e04-5be516e574emr2125370e87.32.1792502221841; Tue, 20 Oct 2026
 06:17:01 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 20 Oct 2026 09:17:00 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 20 Oct 2026 09:17:00 -0400
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20261017043605.1503563-4-shengchao.guo@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261017043605.1503563-1-shengchao.guo@oss.qualcomm.com> <20261017043605.1503563-4-shengchao.guo@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 09:17:00 -0400
X-Gmail-Original-Message-ID: <CAMRc=McoAYKHojJCT6yeTvsMLKDTisD3V42VH5ebRapuG-UGBg@mail.gmail.com>
X-Gm-Features: AclHuK_k9lO_i1S3i6iGAOndmTvxczShpEE6soiPBepKsGh7JYvDFptjfrC8dpU
Message-ID: <CAMRc=McoAYKHojJCT6yeTvsMLKDTisD3V42VH5ebRapuG-UGBg@mail.gmail.com>
Subject: Re: [PATCH v4 3/4] gpio: shared-proxy: Drive the default value when
 no votes are cast
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Sat, 17 Oct 2026 06:36:04 +0200, Shawn Guo
<shengchao.guo@oss.qualcomm.com> said:
> A consumer that requests a shared line with GPIOD_ASIS never calls
> direction_output(), so def_val keeps its initial value of 0. If the
> line was left high, for instance by the bootloader, a later
> gpiod_set_value(0) from that consumer matches def_val and the proxy
> treats it as withdrawing a vote it never cast. It returns success
> without writing the hardware, and the line stays high.
>
> The consumer has no way to tell. Its request to drive the line low is
> silently ignored until it first votes for high and then withdraws
> that vote.
>
> When the requested value is the default and no votes are
> outstanding, write it to the hardware instead of returning early.
> For lines configured via direction_output() this is a redundant
> write of the value the line already has. With votes outstanding the
> request remains a no-op, as the line must stay at the voted value.
>

Wouldn't this only matter for a line requested as-is? We could avoid the
redundant write if we only did it for such lines instead of for all
unconditionally.

Bart

> Fixes: e992d54c6f97 ("gpio: shared-proxy: implement the shared GPIO proxy driver")
> Assisted-by: LLM
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---
>  drivers/gpio/gpio-shared-proxy.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpio/gpio-shared-proxy.c b/drivers/gpio/gpio-shared-proxy.c
> index 24241c981df1..456a3c3dbf71 100644
> --- a/drivers/gpio/gpio-shared-proxy.c
> +++ b/drivers/gpio/gpio-shared-proxy.c
> @@ -81,9 +81,16 @@ gpio_shared_proxy_set_unlocked(struct gpio_shared_proxy_data *proxy, int value)
>  	}
>
>  	/* Desired value is the default. */
> -	if (!proxy->voted_change)
> -		/* We didn't vote for change previously, nothing to do. */
> +	if (!proxy->voted_change) {
> +		/*
> +		 * With no votes outstanding the line should be at the
> +		 * default, but a GPIOD_ASIS line may have been left at the
> +		 * opposite value. Drive it there.
> +		 */
> +		if (!shared_desc->votecnt)
> +			ret = gpiod_set_value_cansleep(desc, shared_desc->def_val);
>  		goto out;
> +	}
>
>  	/* We previously voted for change. */
>  	if (shared_desc->votecnt == 1) {
> --
> 2.43.0
>
>
