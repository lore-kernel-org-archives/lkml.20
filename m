Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=80.86.107.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792866035;
	b=Obb8NlbgBZZ2OwK5uJH0OOwrn6QS4l6ShO2LsAB1+VRO3e+aGNjCVPsQXsxxVXPws7jk
	 PNdfl7dWuG5kafZ+d/z6xmas5bVeMtKTY90k0+RIUg07FqdKdvGB/lZATMkDqW+TyyhBU
	 JkdFWdm5tQVBlLV2jILCk5nHNPZcEQr4JO39af7rMc1irHrws9G9Tc1D/15pLpysaDG13
	 gvzY2oDaiFavWFl9xzIaM0O+wxX9eJ1vu0y6tTcemZRgpnmUwh+qan2Fp0xYagAAdSrf4
	 cJwGe60w1IKT0E4TKej9Avwy/qft0viY69G1xw55zjJJHBBXmK1TWVYBYF4p14L3v6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792866035;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Message-ID:Subject:
	 From:To:Cc:Date:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=vmV4lQnSO2Bn4fy60UoiGjkHhPKslPFl/aNWvs1arNc=;
	b=zDRm7W3rxbOW1h7XuPrzJpTGVh2pECMyKxBVOBhdUmFlJrLg0h+hBSLY9xAwSbjwfsWm
	 SUHu478R702kxGhpn5m4bbgSwLK8syfKvKLfj6LQUSo4c2AHvMV7RVeiRfnQp0fqNqXPH
	 SWYPLVpKO36WdleF1OypLzeexwBTs5oT8ZM4yA9c+SaHlZ8tSmKD0D45MbkY+yJjnj4pb
	 Es6uEnbNFu3oYFYHeuHuZ3LaDkQkDWRlbkmibsEKkhOO9p6Tt77bUjSrXNotJ8xSDupM/
	 sw/1nuyYqfpkIjRJighnb4s7/Un7VEb4vX+Ksji5ztpcSN6lS9ZT3yRDH7UK6fzBpsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rendec.net;
	spf=pass smtp.mailfrom=rendec.net;
	dkim=pass header.d=rendec.net header.i=@rendec.net header.a=rsa-sha256 header.s=default header.b=mdC2Daft;
	arc=none smtp.remote-ip=80.86.107.70
Received: from mail.mindbit.ro (xs1.mindbit.ro [80.86.107.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42AB2606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 18:20:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42AB2606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=rendec.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rendec.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=rendec.net header.i=@rendec.net header.a=rsa-sha256 header.s=default header.b=mdC2Daft
Received: from dog.kanata.rendec.net (pool-174-112-193-187.cpe.net.cable.rogers.com [174.112.193.187])
	by mail.mindbit.ro (Postfix) with ESMTPSA id 857DED312F;
	Sat, 24 Oct 2026 21:20:30 +0300 (EEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.mindbit.ro 857DED312F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rendec.net;
	s=default; t=1792866031;
	bh=vmV4lQnSO2Bn4fy60UoiGjkHhPKslPFl/aNWvs1arNc=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=mdC2DaftTNrer2AXTJTCUDU6YzhakrgTJAFmsuxReRsFJ/NheGYcsVZcGBkuE0rhG
	 17iNJe20ZnjstYVGCXSkI7NJGg0vSIKteqc9Z7NzeRfNysJgItFC1GhMC2eYiGsw7U
	 HPd7uCgdaFokVZuE8LGICwBzoNcNWg2w2JfGJg2wWd7SKKDaOcZ3oOcZt0phPOQHpl
	 TGa27OhsC2mpjjK4NorLvmEzxez4xX+khPzTH+x818zOyq/A9ewoQlZmP3XmarfrLf
	 IN3Sm7EqtlmA2wAQmNJgDchbRVPj3VzQK2inrbGhG194Hy5qnEX32S3X9RPrhDNRfk
	 BbKt+j8nxuFhQ==
Message-ID: <1a128eaffb2994591882308f67e0d7a0c4bcd4b1.camel@rendec.net>
Subject: Re: [PATCH 2/4] irqchip/alpine-msi: Drop redundant asm/msi.h include
From: Radu Rendec <radu@rendec.net>
To: Eliav Farber <farbere@amazon.com>, Thomas Gleixner <tglx@kernel.org>, 
 Antoine Tenart <atenart@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Sat, 24 Oct 2026 14:20:28 -0400
In-Reply-To: <20260923083703.38974-3-farbere@amazon.com>
References: <20260923083703.38974-1-farbere@amazon.com>
	 <20260923083703.38974-3-farbere@amazon.com>
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

On Wed, 2026-09-23 at 08:37 +0000, Eliav Farber wrote:
> The driver already includes <linux/msi.h>, which itself pulls in
> <asm/msi.h>, so the explicit arch include is redundant. Remove it;
> checkpatch also flags the direct use of the asm header in favour of
> the linux one. No functional change.
>=20
> Signed-off-by: Eliav Farber <farbere@amazon.com>
> ---
> =C2=A0drivers/irqchip/irq-alpine-msi.c | 1 -
> =C2=A01 file changed, 1 deletion(-)
>=20
> diff --git a/drivers/irqchip/irq-alpine-msi.c b/drivers/irqchip/irq-alpin=
e-msi.c
> index 0d97abb85e16..20f1f7f7612b 100644
> --- a/drivers/irqchip/irq-alpine-msi.c
> +++ b/drivers/irqchip/irq-alpine-msi.c
> @@ -21,7 +21,6 @@
> =C2=A0#include <linux/slab.h>
> =C2=A0
> =C2=A0#include <asm/irq.h>
> -#include <asm/msi.h>
> =C2=A0
> =C2=A0/* MSIX message address format: local GIC target */
> =C2=A0#define ALPINE_MSIX_SPI_TARGET_CLUSTER0		BIT(16)

Reviewed-by: Radu Rendec <radu@rendec.net>
