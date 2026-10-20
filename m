Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792523051;
	b=qfD8u2AlflQbVmGnTe22UkQMizIC7If7tJcBHdEgmM0NQHb4tpfMU0/ZZvvOP7o+wVJz
	 qo1WCv6hENZhjxZDkeHDpft4W0+8jqxO8oh824D0orHmSD3DcoYkepcLv6Q1kV9xGAv1K
	 UfntRE3nd2tRcMd514GpLuNnNyG5/ad5e1TnD/fRslg2pN1tJfCvzoLVqdqeF677lC1wR
	 UOlM1sxgaenlRwQaY6wi+ULXtpdPqqufk6uzChm2+v3uocnmxsjh9wyTLtg0xWfSitPlD
	 Ca/dj/GPEdN4Mvaa906jXCkksAw3jB87k7+5UuOUm3M6hGkMXjneN4XWFq5DPamJ4RQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792523051;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=7NqznRIlKLn/pELhTMEco0REzkh4v7wlCaqZptITogI=;
	b=ni6yAPZfQFTY4V3zsNWKBSETZkI4cc9iu9E2a/enhrkMJW9e1JIzYD9PCR44CqmcNu04
	 Ddz5bFSTRwsPCdmRN4Tv4K/MZFnuBVCDyoQCgP2FLqhO7/A4iTUiWCdhDOwluadviE6zq
	 gk0t8kePCETIjml9XiVug/wDLkY9kKBI8S+U2xSokhseI8SnWeeB8kIb4FxiW+fuZWYZT
	 Hd7I88Bqfmu/A/Nvrih9J8YepBxMOXAx5Ha+ccq+EOD4kfIyZmntkKhjj2yy547jpccnA
	 2fXMMLsq8+VL7nX08QEemCs/QV/d/j9nT6wvzSfAzRFc39+AMAvLKiSxFJn7uXHVxaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=hLr4Pt+J;
	arc=none smtp.remote-ip=74.125.82.44
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3714E606A323
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 19:04:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3714E606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=hLr4Pt+J
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-17bc533fda3so4292658c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 12:04:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792523050; x=1793127850; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7NqznRIlKLn/pELhTMEco0REzkh4v7wlCaqZptITogI=;
        b=hLr4Pt+JNnJwfVdSIiwSzVwN2M1EdektMGoj8qGvTIg2MHi43g6P3LOjqDktLIrXJc
         /LbjGbnm0fv1Cio5pJKxGcmBKzdvQ1Bf8jSuV8V5JJip79CY3ECKV2x7PotCCn1kvzCQ
         4YaZ8G9IpdE+7Ow3oYO6+adNmYfrSPrPRZiHksLbJk7N1fryAL33UOp5jSq6Nup2ngpH
         wOl0+Aik0n+dpNKqrXJHKnb8BU2rkXjhhP8rhu7nQdn7ktiO6XlCo5a1Jmr294bKdHsr
         TPkfN5DqX8YEfDV0yTlKP0LpctSqRfqyj58P+bLiOitnTlcAmXRX4sdFHQMGgmS5yS9g
         opWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792523050; x=1793127850;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=7NqznRIlKLn/pELhTMEco0REzkh4v7wlCaqZptITogI=;
        b=kr5+R6dAxl2p//j0GXhqmmG1nwty8jNU79PvdVliq8oTRtFdpHGItAxHcD1mhNWvyL
         83ito9VSKNXt3jooH2Fry7z2t29ohFDAAenRbhbKnW7avtg2Uk5Qf+aLdwNijaFhSWXX
         8qJsvDS+mRvXzVX+nt5FZYm267hVxv9XLmaouZYLnAS6TtoVYL/yApbs8wQDeYpcicS2
         zZ/AUx2S4UNdhGRE++FTsYxgQk9pd/Cz6csfpq+0MRTkKz/N5h0p185ynUcmiGus6lf3
         Dn0sQV9e2xsGJ8bkKsB+sLV9qQBt7FdD0H7/485AGKB7e1bpPNTNNSA6reBfW5JuydxB
         SmzQ==
X-Forwarded-Encrypted: i=1; AKwUvBwP6AkeaWU2bkd6koEoho/fhd5+Qt3jEbZG2/IC+JqhwkcJsRnkwrg5TawgLBwSr6eA/1oLruPLGTb2Tew=@vger.kernel.org
X-Gm-Message-State: AFq9FYJI+uEMk15I9ohYKyjydpONTsFVxUxGUXMtloxqLYkm1Xml6kTk
	HKCe+7fRTLQ1VTI+nf7kqPG3k33vpx7uB9qvxu6PyygwvRqE5jD9sQlR
X-Gm-Gg: AYBFou2A3OBxCiYs/ypBxHA5KP8pcu9tR5dlx38Nm24byFUzo5FkdBaLpsWAWGzefVM
	37So+mae22CSXyIO59v+2cTphPNoN2tJ74vgSRhnwnoVDTc4OTSh2UoSXtuFxPWJVUrAX9JjvNu
	pa6uB3gfZ/1T4UJVbNxzn5Pd7mDXb60B2wodHNUrierhgoAlFiJxaF+MYYi24fet0QKik9UxxvL
	Afui6wWnxd794sDKjujNe8/o8iP7jOQIYNMN12AWcNXa7f0WBc2tqn/2Mtcgr5vXJFKUn4hsar5
	msC9/FdgiqslYads2Jb8TS7QCXfiPTSW0RQoPg6XsZUbRVXZerBSvRwjLvqEKy4CZ8BGCZm98Qt
	nRejHIFjHF7dO/gkCb1xOkL7Ku64crH//0TPRz9QIbtDs6dBDyGpxOKndgs1ZF4WV2EkCp6KaNW
	jTVMPIf5GRyJlCH0cEWd6sSoAlcJ490LSJPsrKm+o1wDGlOYmYyhtQ5OHbCrq05z3R/9FdDnhQT
	Vs8PSF10OcKdmTwPlCrIBv+JEnz4fjQshgoIIS3cwEcNqh6l9g=
X-Received: by 2002:a05:7022:e804:b0:13b:3132:6e99 with SMTP id a92af1059eb24-18512c38164mr17695167c88.20.1792523049985;
        Tue, 20 Oct 2026 12:04:09 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:92d1:8038:c4e7:1f0c])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1903aefe90asm552320c88.9.2026.10.20.12.04.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 12:04:09 -0700 (PDT)
Date: Tue, 20 Oct 2026 12:04:05 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
	Pavel Machek <pavel@kernel.org>, Sebastian Reichel <sre@kernel.org>, 
	Ion Agorria <ion@agorria.com>, =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>, 
	Florian Krischer <florian.krischer@fkr.dev>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-input@vger.kernel.org, mfd@lists.linux.dev, linux-leds@vger.kernel.org, 
	linux-pm@vger.kernel.org
Subject: Re: [PATCH v12 3/7] input: serio: Add driver for ASUS Transformer
 dock keyboard and touchpad
Message-ID: <ate5K6ZdrSoBUI08@google.com>
References: <20261019100406.103687-1-clamor95@gmail.com>
 <20261019100406.103687-4-clamor95@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261019100406.103687-4-clamor95@gmail.com>

On Mon, Oct 19, 2026 at 01:04:02PM +0300, Svyatoslav Ryhel wrote:
> From: Michał Mirosław <mirq-linux@rere.qmqm.pl>
> 
> Add input driver for ASUS Transformer dock keyboard and touchpad.
> 
> Some keys in ASUS Dock report keycodes that don't make sense according to
> their position, this patch modifies the incoming data that is sent to
> serio to send proper scancodes.
> 
> Co-developed-by: Ion Agorria <ion@agorria.com>
> Signed-off-by: Ion Agorria <ion@agorria.com>
> Signed-off-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>

Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

> +static int asus_ec_kbc_probe(struct platform_device *pdev)
> +{
> +	struct asusec_core *ec = dev_get_drvdata(pdev->dev.parent);
> +	struct asus_ec_kbc_data *priv;
> +	int error;
> +
> +	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	platform_set_drvdata(pdev, priv);
> +
> +	priv->ec = ec;
> +	priv->parent = to_i2c_client(pdev->dev.parent);
> +
> +	error = asus_ec_register_serio(pdev, 0, "Keyboard", 0);
> +	if (error)
> +		return error;
> +
> +	error = asus_ec_register_serio(pdev, 1, "Touchpad", I8042_CMD_AUX_SEND);
> +	if (error)
> +		return error;
> +
> +	priv->nb.notifier_call = asus_ec_kbc_notify;
> +
> +	error = blocking_notifier_chain_register(&ec->notify_list, &priv->nb);
> +	if (error)
> +		return dev_err_probe(&pdev->dev, error,
> +				     "failed to register blocking notifier chain");

I think sashiko is right that we need to register the notifier first,
and in it check if serio ports are ready/registered or not. For that we
probably need a lock and set pointers or flags in serio's start()/stop()
or open()/close() methods.

This can be done as a followup I think.

Thanks.

-- 
Dmitry
