Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792490787;
	b=hVZaznNTh0Fk4gC49Rh4MMHSmRRX9koztWn/HVSuQKYuJqLfET1GBMQC2HOM/s83Fo6V
	 +I9Xeb3o1QvhPdm0wdSs5O5C1TU/CDjtEeQbnbr8WpS8m4VaRSeYxm2E/NMHbpis6biMe
	 QBtpa+qquX+yIZVet/1LpoM3MVl+SoMknTJtIxjzu76DyMJvewzumibrSOdhZFrD7r5E5
	 k//mjifGcLVkVdgPy4cli+RvPdpKn4zqq+P7hv202sHPr/fPHxqf9kUjFjgByw9aundVa
	 O4VyfsQA/ouqwSlhR5uHB2HSWCJyuzFEMcBuEswXWPN6etd0HIbgx1LVS12VnuFAYuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792490787;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:Received:Received:From:In-Reply-To:
	 MIME-Version:References:Date:X-Gmail-Original-Message-ID:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=r9QLTI7y2KKW96b0Zz1Kc2Odp0wZxzx//zKMAKbRUr4=;
	b=UC/HvrQRFvFotUJDgcH8sRFgylPiUJLQyyDwi5bWOoZMZPDe0doFVfPhQwmAHF3U1/fy
	 A53o+VZ/MIBO2OUt/u5q/7b7gUdSyPHDAOaAebgA1NkLGANEAmzxyQNpqrys2rVD2xGHB
	 79zzuHYBg6PqhV3Prqqx6VXCsuI9Efz2M8UPZmxkPJmGvR80/WIms8OMD5TLDizGGCiM+
	 MT02QHbf2co5vTi708r0GUQnDuXwBFKp3J1eSjZDg/fHMkZHTzX28Y/Rr936Z2EGwUpYU
	 NfmFDcS7ZxX8N6rzqvYSfbNWnk+I1h/xSMlWKXTfy+Uv50tdUltowZvgrh1eTfHm3+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=S6C9b4NF;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 728EF606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 10:06:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=S6C9b4NF
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDB001F000C5
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 10:06:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792490786;
	bh=r9QLTI7y2KKW96b0Zz1Kc2Odp0wZxzx//zKMAKbRUr4=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=S6C9b4NFID2J4bHjqwI2Dm/QxObsQCvuRcfPzP1YbdFCKlgGYUMKtIKd8GZ5NSF83
	 U1SZ/G3T2SgoQHuTWBWW2hND4ru8CZyeEVL+viOBtnF9LPFV/A33mbSAbD9VlT6SFa
	 nea3494QrJclKNJNiRjeJXT5i3Hp/TiED/Kl2Wt/pvUJDAgDcwmKLyCy8rZ7yaH3WH
	 Wt7O6HEFfhTq345E0ajj6AqLfsYyS3L09OELHlw3DQe7p9MY/fx3xqS4Q3EmyEPOcZ
	 RqyhrwuXXNOpSR6YF7UAtj253wHrCgllC1Euq9er9HxpwogJtMHjmVdvlMHPkbo3Fi
	 qAMmv/IbBAVBA==
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-3ab4c608a6dso8271741fa.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 03:06:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBx65J8q6qiy5GFeZj+OTH9WmK/3GzmWXPSRPixwywsT+gwCVYl72DXXZ47a2/2pq/QB/5lGsPCnmBfSqLI=@vger.kernel.org
X-Gm-Message-State: AFq9FYLWTFqJgwei/fTlMa1T2b/bH+32zLmnFsCgGqJKsuEt41wiGaTH
	GSIvj3K63HSC/Gccr64wJi5BFZOezQP1X3SrqP76t+jqfjxZ5+lNZhAqeWjZlv7CZlt//SpHGcE
	nKgG8O73+ffLzO0B4iDvchAC6uGD/SIbvy/q0IHWNww==
X-Received: by 2002:a2e:a9a1:0:b0:3a9:a2fd:5932 with SMTP id
 38308e7fff4ca-3ab29274a45mr27643151fa.5.1792490784657; Tue, 20 Oct 2026
 03:06:24 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 20 Oct 2026 11:06:23 +0100
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 20 Oct 2026 11:06:23 +0100
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20261017043605.1503563-2-shengchao.guo@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261017043605.1503563-1-shengchao.guo@oss.qualcomm.com> <20261017043605.1503563-2-shengchao.guo@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 11:06:23 +0100
X-Gmail-Original-Message-ID: <CAMRc=MeiENro-ivDkve5Y8C8aVKsPyR8x+Nd6gC5h_fn4ZKoPg@mail.gmail.com>
X-Gm-Features: AclHuK9tcMLOQ-DANRxT1WRMHcMO7kXm-3fextj9Ju-NI33QJSEyvkMQNyI4_Fw
Message-ID: <CAMRc=MeiENro-ivDkve5Y8C8aVKsPyR8x+Nd6gC5h_fn4ZKoPg@mail.gmail.com>
Subject: Re: [PATCH v4 1/4] gpio: shared-proxy: Fix race between concurrent
 first users
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Sat, 17 Oct 2026 06:36:02 +0200, Shawn Guo
<shengchao.guo@oss.qualcomm.com> said:
> The proxy lets a consumer set the line direction and reset the
> default value and vote tally only when usecnt == 1, i.e. when it is
> the sole requester. But request() and direction_output() take the
> descriptor mutex separately. When two consumers probe concurrently,
> both request the line before either configures it, both see
> usecnt == 2, both fall into the shared path, read back the still
> unconfigured direction (input) and fail with -EPERM.
>
> On Nord RRD the two DAC supplies are reg-fixed-voltage regulators
> sharing tlmm GPIO 41. They probe asynchronously and intermittently
> both fail, leaving the codecs without supplies:
>
>   reg-fixed-voltage regulator-3p3-dac: setup of GPIO (default) failed: -1
>   reg-fixed-voltage regulator-5p0-dac: setup of GPIO (default) failed: -1
>
> Requesting the line is not evidence that a consumer has claimed it.
> Instead, count proxies that have actually configured the line (set its
> direction or voted for a value) in a new cfgcnt, with a per-proxy
> configured flag, and allow (re)initialization only while no other
> proxy has done so. A consumer obtained with GPIOD_ASIS that votes via
> gpiod_set_value() without ever setting the direction counts as
> configured, so a later user can never reset def_val/votecnt behind its
> vote. The count is dropped when the proxy frees the line.
>
> Fixes: e992d54c6f97 ("gpio: shared-proxy: implement the shared GPIO proxy driver")
> Assisted-by: LLM
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---
>  drivers/gpio/gpio-shared-proxy.c | 74 ++++++++++++++++++++++++++++----
>  drivers/gpio/gpiolib-shared.h    |  1 +
>  2 files changed, 66 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/gpio/gpio-shared-proxy.c b/drivers/gpio/gpio-shared-proxy.c
> index bc69b8729d19..0d1d724a6a37 100644
> --- a/drivers/gpio/gpio-shared-proxy.c
> +++ b/drivers/gpio/gpio-shared-proxy.c
> @@ -21,9 +21,33 @@ struct gpio_shared_proxy_data {
>  	struct gpio_chip gc;
>  	struct gpio_shared_desc *shared_desc;
>  	struct device *dev;
> +	bool configured;
>  	bool voted_change;
>  };
>
> +/*
> + * A proxy may (re)initialize the line - set its direction and reset the
> + * default value and the vote tally - only while no other proxy has set the
> + * direction or voted for a value. Requesting the line is not enough: consumers
> + * may request concurrently, so counting requests lets every one of them
> + * conclude that it is not first.
> + */
> +static bool gpio_shared_proxy_may_init(struct gpio_shared_proxy_data *proxy)
> +{
> +	unsigned int cfgcnt = proxy->shared_desc->cfgcnt;
> +

We expect the shared lock to be taken, so can you add lockdep assert here ...

> +	return !cfgcnt || (cfgcnt == 1 && proxy->configured);
> +}
> +
> +static void gpio_shared_proxy_mark_configured(struct gpio_shared_proxy_data *proxy)
> +{
> +	if (proxy->configured)
> +		return;

... and here?

Thanks,
Bartosz
