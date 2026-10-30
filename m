Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793359586;
	b=CFHriLISpF/fSCiczu14gI15sqYs7CgIm50CLznEjKkOtlRyzCLRrDMRUn4JkPTMZbKf
	 PyTHb8zj5AifrsUHtwQF1kceK1mwLc7lbqKrJZXOGeptPmfb8vPXG30o+qSayC7q0tr4L
	 axDclQZvPP414FEJJCx4i0pa44uYqWrW8SlSLozyA8LAQKERM/OzbmaeIx3tE0efVvZrV
	 2nNTdRvcarGD4Yv3xndPBEAkL6kmcqK9+E/ds78cAJHcBcWo7ayfpORZBNmMEGEN2h+d/
	 qkccr4gXPJHmcOHOSbRgpi91T+wRXqy9ca2l5XQH0H/5JhH2eqCRCEhq+JZhFoaQTrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793359586;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=3lYBSPOUkDUYx/GqJ2cXYoKcfGUJRnJswQ+l9oWZRUo=;
	b=wDpmTkVoNWQQsiV4yuPGuS3zJMeYTT1Czj8vLMkOvZMR72zPPFhmxJ2GUbJQB4gjhj3H
	 EEYNIPxfN9hyl+nG6mmp82Xrk4tPHN/3wcG4fem8KzzXHXdL+vEn+JrYBUN0jgtxugaPh
	 5Z/RVX7w1+9z852zRZKkw7+QdXSKlC8fIaFUPttztIBxkwEob029JYQF2PXn4EsbhsLiy
	 ucJXVcekxYJRo6Xa0BPH0hGhorLla4AOusjIpV4yGol6NFIoZnTZecvVNbghMcLJ2ldMa
	 erbG6tLwWklq7He9VPYPK/QuW8CbPinxc2/o/E+72UJwFTacxHwgyBAtEwhQoOXNBEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PbIUdlYA;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF851606A326;
	Fri, 30 Oct 2026 11:26:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PbIUdlYA
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D08E11F000C1;
	Fri, 30 Oct 2026 11:26:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793359585;
	bh=3lYBSPOUkDUYx/GqJ2cXYoKcfGUJRnJswQ+l9oWZRUo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=PbIUdlYAuEN1TYtmyKypruUtd4NjkwrZpTosLekKjzcewGM6vjUENVRHwRu0hqMLZ
	 oorY8DnEAbTVLkZTITWVYFxfWUDpHYccUG/dKYqBbZzb7tMDvHBiwLdpoRkBRvuuQw
	 +SC+7woRfRXndicdbFvj9JDH7K2huS7whb7CApIE5/2d4yLUpz5Detz2hxD60os84E
	 nNEHvTXusrgMFolxG8iYCNTmGU/O0bjFm8SxQ3qcgv/JVQgmBXdDU0hrbysxLufhQE
	 HcvSeuqokgSgAyvag5CuV4y3Y8i8wmxnluFj8rwNcPESOiYRvK19dPwgpHi4H22cBr
	 ormOcqlnf5kpg==
Date: Fri, 30 Oct 2026 12:26:21 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: christian.koever-draxl@student.uibk.ac.at
Cc: zhentao.guo@amlogic.com, mchehab@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Christian Stefan =?utf-8?B?S8O2dsOpci1EcmF4bA==?= <ckoever@outlook.de>
Subject: Re: [PATCH 02/11] dt-bindings: media: amlogic,s4-vdec: describe both
 decoder cores
Message-ID: <20261030-adorable-garrulous-flounder-d4bd09@quoll>
References: <20261025192507.210058-1-christian.koever-draxl@student.uibk.ac.at>
 <20261025192507.210058-3-christian.koever-draxl@student.uibk.ac.at>
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
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20261025192507.210058-3-christian.koever-draxl@student.uibk.ac.at>

On Sun, Oct 25, 2026 at 08:24:58PM +0100, christian.koever-draxl@student.ui=
bk.ac.at wrote:
> From: Christian Stefan K=C3=B6v=C3=A9r-Draxl <ckoever@outlook.de>
>=20
> The S4 video decoder has two cores: VDEC for H.264, MPEG-1/2 and MJPEG,
> and the HEVC core for HEVC, VP9 and AV1. Update the description and
> name the individual reg, interrupt, clock and power-domain entries.
>=20
> Signed-off-by: Christian Stefan K=C3=B6v=C3=A9r-Draxl <ckoever@outlook.de>
> ---
>  .../bindings/media/amlogic,s4-vdec.yaml       | 24 ++++++++++++++-----
>  1 file changed, 18 insertions(+), 6 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/media/amlogic,s4-vdec.yaml=
 b/Documentation/devicetree/bindings/media/amlogic,s4-vdec.yaml
> index e3c2ab4000aa..6c98d7013029 100644
> --- a/Documentation/devicetree/bindings/media/amlogic,s4-vdec.yaml
> +++ b/Documentation/devicetree/bindings/media/amlogic,s4-vdec.yaml

There is no such file. Do not send in-flight patches with fixes, just
fix the source.

> @@ -11,15 +11,19 @@ maintainers:

>    - Zhentao Guo <zhentao.guo@amlogic.com>
> =20
>  description:
> -  The Video Decoder Accelerator present on Amlogic SOCs.
> -  It supports stateless h264 decoding.
> +  The video decoder (DOS block) of the Amlogic S4 family. It has two cor=
es,
> +  VDEC for H.264, MPEG-1/2, MPEG-4 Part 2 and MJPEG, and the HEVC core f=
or
> +  HEVC, VP9 and AV1. Both run microcode that the secure world loads, and
> +  are exposed as a stateless V4L2 decoder.
> =20
>  properties:
>    compatible:
>      const: amlogic,s4-vdec
> =20
>    reg:
> -    maxItems: 2
> +    items:
> +      - description: DOS register block, both decoder cores
> +      - description: DMC request control, gates the cores' memory reques=
ts
> =20
>    reg-names:
>      items:
> @@ -27,10 +31,16 @@ properties:
>        - const: dmc
> =20
>    interrupts:
> -    maxItems: 3
> +    items:
> +      - description: HEVC core
> +      - description: VDEC core
> +      - description: third DOS mailbox, not used by the decoder
> =20

Aren't you just duplicating names properties? I would check... if that
file ever existed :/

Best regards,
Krzysztof

