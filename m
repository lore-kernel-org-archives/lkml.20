Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=80.86.107.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793793677;
	b=AieJ9PFgvpR/J7uWQ37fHjjAWvh1doEzBJs0r1Vkp3GDFo3bxcTWxDbvMWbViDoNoOFE
	 uPd6AFlDcq6R1AvlhXbLk05arr810XzN9S+s5HFaNpMZcn7a8PB0yyRAL4+Y394a4AlFu
	 M+Et52TPuB5A1hZ6+QBRoSb65tDj7VcFXeoB8FjbTF/ZMS/KuFLiYK8psdmtiyuNVzzq8
	 dNUG9sA1yuk5SY8mJIpougb7t9y8so7bTs3MZdi0maLeEcGq05NUj/vUMHIqCZSWs8G1K
	 oaIOeEWxibnFxJ6opeJ2PcKy1fiD287TeuLW30sX0CWQlDHOBD7QEf/uecNJfJzZrqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793793677;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Message-ID:Subject:
	 From:To:Cc:Date:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=SyLUHxyvOwp7GEPi1oveTrS8s1159q8UOp+3JAwxNqo=;
	b=0T9TIEcqK9XPXicKYKk8SihAnibM3K7XjfzISoAbk4SM5QXfQsTxVN++VkwRIH2QlJPJ
	 /l58vH26UWJXW4zDq3b8/15h495qR5TWIhVysudWdoeQA/dz8/tSMr9qzAIA2lg6y+Nvx
	 6VlPbIs2P6UvA+H2R5Lb+y/HIjYMUcWxCt5JRoEJy/qbOH2FntNT4ahFlfZefrCNceJjV
	 DAKLTeDlbXS7o4kwYJPwMbGRhh6xaULbuSO3QDZ8PUktX4xI5kSY2qKkIDzWwJFaFx3cB
	 k7aFolvawMYjC/bTFeiKwYx/AA9HUd+GIz9zHreOBbI8U4sffYUTQWihWhXpNb76wkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rendec.net;
	spf=pass smtp.mailfrom=rendec.net;
	dkim=pass header.d=rendec.net header.i=@rendec.net header.a=rsa-sha256 header.s=default header.b=SRoegsFy;
	arc=none smtp.remote-ip=80.86.107.70
Received: from mail.mindbit.ro (xs1.mindbit.ro [80.86.107.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09858606A31B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 12:01:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 09858606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=rendec.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rendec.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=rendec.net header.i=@rendec.net header.a=rsa-sha256 header.s=default header.b=SRoegsFy
Received: from dog.kanata.rendec.net (pool-174-112-193-187.cpe.net.cable.rogers.com [174.112.193.187])
	by mail.mindbit.ro (Postfix) with ESMTPSA id 987F9D3370;
	Wed,  4 Nov 2026 14:01:06 +0200 (EET)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.mindbit.ro 987F9D3370
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rendec.net;
	s=default; t=1793793667;
	bh=SyLUHxyvOwp7GEPi1oveTrS8s1159q8UOp+3JAwxNqo=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=SRoegsFy7GARTLsj/G5eA7HZiznBxbCinZyr2PhAzS4HnfIdX28L+eDYO+pa4G1bz
	 8F0BkCR2idJii81iNgELGPseKn8ZmlMuD1Lw/HMO/N9l1bMSKc8aMW9hZhPEyzBC9X
	 nySAqI6Ed+OUB217/UOb6+TPNhEYttefwPRmTwSrvAojP5i5sbEXuBBxzEMfhJCbkJ
	 Qd311iHqzBPzWMU6o7JM5fxuTaaoitXNRKerZv7rSEzhlZOqK0tRl7oBbQBjKbalwj
	 RxUQNuDbd3rUzX18RZsmdKr26LLd48Y79GoeWsJq6ewu7lM5aP0ckCxtV4e81GfgKZ
	 fFe8giPw0Wbcw==
Message-ID: <6cf5152f35e4e8fb66f51f79f5f39e2e3ae1aa7d.camel@rendec.net>
Subject: Re: [PATCH v2 4/5] irqchip/alpine-msi: Fix format and wording of
 the registration debug print
From: Radu Rendec <radu@rendec.net>
To: Eliav Farber <farbere@amazon.com>, Thomas Gleixner <tglx@kernel.org>, 
 Antoine Tenart <atenart@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Wed, 04 Nov 2026 07:01:04 -0500
In-Reply-To: <20261024193620.39999-5-farbere@amazon.com>
References: <20261024193620.39999-1-farbere@amazon.com>
	 <20261024193620.39999-5-farbere@amazon.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-2.fc43) 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Sat, 2026-10-24 at 19:36 +0000, Eliav Farber wrote:
> The "Registering" debug message in alpine_msix_init() prints
> priv->num_spis and priv->spi_first, both u32, with %d. Use %u to match
> their type, and fix the "msixs" wording while at it. No functional
> change.
>=20
> Signed-off-by: Eliav Farber <farbere@amazon.com>
> ---
> v2: New patch (Radu).
>=20
> =C2=A0drivers/irqchip/irq-alpine-msi.c | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/irqchip/irq-alpine-msi.c b/drivers/irqchip/irq-alpin=
e-msi.c
> index 8155f63cfd29..fb84b6046193 100644
> --- a/drivers/irqchip/irq-alpine-msi.c
> +++ b/drivers/irqchip/irq-alpine-msi.c
> @@ -229,7 +229,7 @@ static int alpine_msix_init(struct device_node *node,=
 struct device_node *parent
> =C2=A0		return -ENOMEM;
> =C2=A0	priv->msi_map =3D msi_map;
> =C2=A0
> -	pr_debug("Registering %d msixs, starting at %d\n", priv->num_spis, priv=
->spi_first);
> +	pr_debug("Registering %u MSIs, starting at SPI %u\n", priv->num_spis, p=
riv->spi_first);
> =C2=A0
> =C2=A0	ret =3D alpine_msix_init_domains(priv, node);
> =C2=A0	if (ret)

Reviewed-by: Radu Rendec <radu@rendec.net>
