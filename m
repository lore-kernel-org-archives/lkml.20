Received: from mail.mindbit.ro (xs1.mindbit.ro [80.86.107.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DA9E15AADA;
	Mon,  5 Oct 2026 01:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.86.107.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791162247; cv=none; b=BvVPGjxg3Hdrq3Em+CQk1P9+fHviV07H+1y+uYUJpZNpMF6us8mP8YibdG+oVeGXDXlwabtNog6KrEzajF2qhwFk1PS+M8yPg33M06A1EhjvPdOESuiFw6FYyYJa8EKyj5yw0sIB4gmgb2oD7A1qcOGdsTV4EKK4KpCaMGMmTPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791162247; c=relaxed/simple;
	bh=yd//7GjHvshWTWLzAOKN4SbQyiGKNcQxpn/2kb2Ls1U=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=o6oFOHePCMdnXGh/Lu0rOgTWRD1alPUKe6T7bTgXiiaRhS2EdEdqh2ejIdaPRgB+M8c5mCYH1mxfIxEcPAh3lOfKff7aQZFDFDkKgSwl+8L0DVeAExcq1M+WuBv+rI0STN9KUvGpg5usCeNDgf7nFXvw/U7rBgGFNBBoAAW8Qgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=rendec.net; spf=pass smtp.mailfrom=rendec.net; dkim=pass (2048-bit key) header.d=rendec.net header.i=@rendec.net header.b=R4GjFCyA; arc=none smtp.client-ip=80.86.107.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=rendec.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rendec.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rendec.net header.i=@rendec.net header.b="R4GjFCyA"
Received: from dog.kanata.rendec.net (pool-174-112-193-187.cpe.net.cable.rogers.com [174.112.193.187])
	by mail.mindbit.ro (Postfix) with ESMTPSA id 306DACCDF6;
	Mon,  5 Oct 2026 04:04:02 +0300 (EEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.mindbit.ro 306DACCDF6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rendec.net;
	s=default; t=1791162243;
	bh=3d+8ZKWHPbaMLFox3j6exEVTfvKPTWg4k7SxmLyaypg=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=R4GjFCyAtQf6tkDlPwoKVZeT7yEaznrLp7FqX87RSGqSTDPuxaqiydVTRRz1Ftgxg
	 g59fNR6dZ+QWnwByByAxwwQ3XLCYn50eR7PYuFtoagZwF9rq+fdNsHoiFVZa0aLmAD
	 B8R+ex+s85gal6uypCZWchaD/NTdWP98slAL/pXL5wELMr/35mHG4s6YmrboGjxn9+
	 KGVlPvHkm30lnv82+72so+0M8RYqRGetV9G5QuTAicQxpHMxD4LY25SXc2uTmrsc1E
	 zMDpSoRCjPChr9x4qQXbV6gF8GgHgc2Pg8FU5Bf/dzg+ORg0/s1YQceDrlW7sLNDw9
	 TWmOpogn2GaFQ==
Message-ID: <4eac1b35110b7e642d4a4c6f4856ac4db428170a.camel@rendec.net>
Subject: Re: [PATCH v2 7/8] irqchip/al-fic: add support for FIC v3
From: Radu Rendec <radu@rendec.net>
To: Eliav Farber <farbere@amazon.com>, Thomas Gleixner <tglx@kernel.org>, 
 Talel Shenhar <talel@amazon.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Date: Sun, 04 Oct 2026 21:04:00 -0400
In-Reply-To: <20260927080637.27285-8-farbere@amazon.com>
References: <20260927080637.27285-1-farbere@amazon.com>
	 <20260927080637.27285-8-farbere@amazon.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Sun, 2026-09-27 at 08:06 +0000, Eliav Farber wrote:
> FIC v3 reports version id 2 in the control register version field. It
> exposes the same info/error/fatal groups as v2, so add the version to
> enum al_fic_version; the existing "version_id > V1" handling masks the
> error and fatal groups at init as for v2.
>=20
> Unlike v2, the v3 error and fatal mask registers read back correctly, so
> v3 does not need the v2 mask_cache workaround: the workaround is gated on
> AL_FIC_VERSION_V2 and v3 keeps the register-seeded mask_cache.
>=20
> Signed-off-by: Eliav Farber <farbere@amazon.com>
> ---
> v2: the "erratum fixed from v3 onwards" code comment moved here (where
> =C2=A0=C2=A0=C2=A0 AL_FIC_VERSION_V3 is introduced) from the FIC v2 patch=
, so the claim
> =C2=A0=C2=A0=C2=A0 that v3 keeps the register-seeded mask_cache has its c=
ode in the same
> =C2=A0=C2=A0=C2=A0 commit.
>=20
> =C2=A0drivers/irqchip/irq-al-fic.c | 5 +++--
> =C2=A01 file changed, 3 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/irqchip/irq-al-fic.c b/drivers/irqchip/irq-al-fic.c
> index 35e366b4da30..322e41ffa2fa 100644
> --- a/drivers/irqchip/irq-al-fic.c
> +++ b/drivers/irqchip/irq-al-fic.c
> @@ -44,6 +44,7 @@ enum al_fic_state {
> =C2=A0enum al_fic_version {
> =C2=A0	AL_FIC_VERSION_V1,
> =C2=A0	AL_FIC_VERSION_V2,
> +	AL_FIC_VERSION_V3,
> =C2=A0};
> =C2=A0
> =C2=A0enum al_fic_id {
> @@ -177,8 +178,8 @@ static int al_fic_register(struct device_node *node,
> =C2=A0	 * register. Suppress the seeding there and set mask_cache below t=
o
> =C2=A0	 * match what al_fic_wire_init() programmed.
> =C2=A0	 *
> -	 * The info mask register is not affected, so the info output keeps the
> -	 * register-seeded mask_cache.
> +	 * The info mask register is not affected, and the erratum is fixed
> +	 * from v3 onwards, so those paths keep the register-seeded mask_cache.
> =C2=A0	 */
> =C2=A0	if (version =3D=3D AL_FIC_VERSION_V2 &&
> =C2=A0	=C2=A0=C2=A0=C2=A0 (fic_id =3D=3D AL_FIC_ID_ERROR || fic_id =3D=3D=
 AL_FIC_ID_FATAL))

Reviewed-by: Radu Rendec <radu@rendec.net>
