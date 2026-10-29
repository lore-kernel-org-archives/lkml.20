Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793287252;
	b=TUAg8KMpTeGtsLiInTSuHDxj1WvEwcAFvZ/CId1P8bErw24Xl8NC9OIav0IFjKe7bsGE
	 qsGDw9qjZST/sxLvt5HFEgZc20ZtAbTaIlzBcYSQ5kt+hws9JuxoiKhlicgpTvGNLG+CA
	 2oERM5cUEPXQaxUMIQ/jzl5Hc48MP30aEffnFn0tTwGJ5w2nWAVbc4ZUo+9rAkc61NTto
	 QE0NArwa3ZSaAhu7Y7B0hnFBwdrVIV6yiwKWIMQ6mWxwmXzhR043w2WgNFeYDnssAHSCQ
	 KrJBdAFG+arnrMfFhsGHSphv9vdOywRxqBQs2ri7BkThy7TzNLpU4HCjc6w5Nd6r6Tg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793287252;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:In-Reply-To:References:User-Agent:Date:Message-ID:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=zDXaXId2QMZQGGH0ZkoNgmI6zhuM3ACKFfQoGGvgzc0=;
	b=YyDOrX4Sw5dTslc9VRP9EfxoXwBTye5cdCcXcKMyCeepcAIGPkj2o/QHzU9AIW0zhkht
	 FNkbQR2BZHb5eM31gmdpeLJUmuM3NrG7BQAnpdguY0Z6jjl3p+cBGx06CFbeMHzrKYdjN
	 2k6+P0NVcQWfLuFLe/LkDLgkQ4QxvWh7Rmm0ig6DWlzoG5hoMbwJLyfGQiDBTFTw+bvD3
	 4eWF3VgM/VTZ+GsPCcdS6fwS2z0Nf/813RaP5jNIi6DmmriIzBiYA9OHLSYhkIyBun9yO
	 9lz1+vfrZFGhG1tjvbLsZXlb+6MGcr/H3QEKG3weptIn74Iut8uRnEt0pu4SgRfVMyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=16Vbpycg;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96237606A31A;
	Thu, 29 Oct 2026 15:20:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96237606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=16Vbpycg
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id B930E4E41394;
	Thu, 29 Oct 2026 15:20:48 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6035460360;
	Thu, 29 Oct 2026 15:20:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7A63910329108;
	Thu, 29 Oct 2026 16:20:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793287247; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=zDXaXId2QMZQGGH0ZkoNgmI6zhuM3ACKFfQoGGvgzc0=;
	b=16VbpycgoGK+Bueo3Fxkz/Q35JqsNP5tV2hWIwDWhcLwgp8NkOOkwGhPp1MbQ2QYG/ygPF
	DV1w/R0AU0yrE1vtbn4ta5J+AKFvjeOQNjlL7XHAuo1LHvCalbwB0NLu1/3AqWFQRveILg
	tIaVwq9LI8hNHb719+KcfM9x6VJ6JhWaXFtZhiiNKbzjKJNBNcSP5mSejyPHMG9mklfdHm
	89s8/0bWGr54x6edPik3VTQIlzXQYMN5V9WDPLSd790LDd9enfTuPRH66RB4B8j6YioU1G
	BwwcB7Ztty22BcfDSskDeOQqXE5tyTa79Qg5aJJBO28Kx2J0O3+7+4WIi9mSQg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Yige Jiang <yigejiang86@gmail.com>
Cc: linux-mtd@lists.infradead.org,  Vignesh Raghavendra <vigneshr@ti.com>,
  Tudor Ambarus <tudor.ambarus@linaro.org>,  Richard Weinberger
 <richard@nod.at>,  linux-kernel@vger.kernel.org,  Geert Uytterhoeven
 <geert+renesas@glider.be>,  linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] mtd: hyperbus: rpc-if: fix an OF node reference leak
In-Reply-To: <rc-review-20261023-ai33-33-fd231771d138@gmail.com> (Yige Jiang's
	message of "Thu, 29 Oct 2026 00:47:40 +0800")
References: <rc-review-20261023-ai33-33-fd231771d138@gmail.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Thu, 29 Oct 2026 16:20:43 +0100
Message-ID: <87se1oedo4.fsf@bootlin.com>
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
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

On 29/10/2026 at 00:47:40 +08, Yige Jiang <yigejiang86@gmail.com> wrote:

> rpcif_hb_probe() gets a child-node reference with of_get_next_child().
> The HyperBus core does not consume it, so the driver leaks the
> reference on registration failure and remove.
>
> Put the node on registration failure and after unregistering the
> HyperBus device on remove. Leave hardware initialization failures on
> out_disable_rpm, since no node reference has been acquired there.
>
> Fixes: 5de15b610f78 ("mtd: hyperbus: add Renesas RPC-IF driver")
> Assisted-by: LLM
> Signed-off-by: Yige Jiang <yigejiang86@gmail.com>
> ---
> Based on linux-next next-20261016 (2efb7a11f1aa).
> Compile-tested: arm64, GCC 14.2.0, W=3D1, CONFIG_OF_DYNAMIC=3Dy.
> COMPILE_TEST=3Dy.
> The object was built from this exact base with the patch applied.
> No full kernel or module-link, hardware or runtime test was performed.
>
>  drivers/mtd/hyperbus/rpc-if.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/mtd/hyperbus/rpc-if.c b/drivers/mtd/hyperbus/rpc-if.c
> index f448e23f9260f10abe17842849b312365dcd8294..aa69abe6d6bc674bb8cdb531b=
badfb7b356e3123 100644
> --- a/drivers/mtd/hyperbus/rpc-if.c
> +++ b/drivers/mtd/hyperbus/rpc-if.c
> @@ -145,10 +145,12 @@ static int rpcif_hb_probe(struct platform_device *p=
dev)
>  	hyperbus->hbdev.np =3D of_get_next_child(pdev->dev.parent->of_node, NUL=
L);
>  	error =3D hyperbus_register_device(&hyperbus->hbdev);
>  	if (error)
> -		goto out_disable_rpm;
> +		goto out_put_node;
>=20=20
>  	return 0;
>=20=20
> +out_put_node:
> +	of_node_put(hyperbus->hbdev.np);
>  out_disable_rpm:
>  	pm_runtime_disable(hyperbus->rpc.dev);
>  	return error;
> @@ -161,6 +163,7 @@ static void rpcif_hb_remove(struct platform_device *p=
dev)
>  	hyperbus_unregister_device(&hyperbus->hbdev);
>=20=20
>  	pm_runtime_disable(hyperbus->rpc.dev);
> +	of_node_put(hyperbus->hbdev.np);
>  }
>=20=20

In general we always apply the same order in the probe error path and in
the remove path. This is not respected here?

Thanks,
Miqu=C3=A8l
