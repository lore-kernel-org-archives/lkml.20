Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=74.125.224.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1794776624;
	b=AyQ3lZlMxtEJaqzX4aZ2n/YLDUIpQdiy9sAGyG03/T16TfgPqKNH7RbK2vx8jvdhnlEm
	 BYcTioUZgTBpG8QhUqC8QJJIM7bdrSLId2rUyYjcd84fii1EyGQ0KUcFHMcrTXh1iJ4yQ
	 yD7NRxZV+qrMeD9MFXdwVxCauptLXDuEPU4XIdSazOzidmhLwodFmz4NJ9XCX1DAOi+TY
	 j0povQv4MzrxmQlkCE3incsyqJjUgBDHpaw53pPPjbEOfApZxgQaCAjeMMPF6uZNWxP+p
	 rMpjhffm1FPGX5jYrelKiZ7am8L+g50Xd+BenIusyan+z7fozj8RPkCOvQdo4+ONAkg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794776624;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=JeZW25rG3PtAzFodSzRAtiRusay7Hp/q+l2Vzy5PdOM=;
	b=a/p5k+F6UDQ+XLJHKZMAZikFz7oRlaKM1zpLjVhVVMU59MadLmM7/nwUJKPGfcYuP8Us
	 GXTm/hOwDGe6t6rhE8bvJ8iRU8iETI5PX29KtVFhMzMwyujNKbrISvhgP7irj8mxQTdB1
	 5vy7zsNq4VIcrxZLRO5esRuu6Z3bVGszsmEMt48TmMlXyKSRULhQAxu+GxYIFphevT4E+
	 kQejOwm84ZeSBaWh/Ak/bUCVVTOAJQ1NRtUItKTbUsah5A96pLdzaNfBQXs0EV1WRKdtD
	 1BoPNKsW76lVefUrPD/9+jIDzhVYopQBb9bDQpe589eQFlyzhNll5iNteSrDzxV83xQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=googlemail.com;
	spf=pass smtp.mailfrom=googlemail.com;
	dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=Ngk2DVgv;
	arc=fail smtp.remote-ip=74.125.224.43
Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB0E1606A32F
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 21:03:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB0E1606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=Ngk2DVgv
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-679a2b5fe87so2745615d50.3
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 13:03:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794776623; cv=none;
        d=google.com; s=arc-20260327;
        b=b4sUVNvDCCJ72+eJdGUHmrpnO3kiyXhgJpdG6aCNZWX1+fQ5hZg5HmTcQ58q1s26sk
         SgMSDkaqqzZIyobi0DUxBcdRoSBu3IiRJzaeX203wIpomayiYfJrh2a5vIM3oVypOe9l
         E6BdKet1bmRtC5gXGKh1bfrsVnvWTvp5cnlgpGR4oRprA7ufxV8gwKdDTUfX0E8AbUWw
         HVJ/CAPeXq6o4ai8yumoaoljSFSmpFjjtTjuCuiY1OtSPnOhWywyLyjZRRgAG1OMb9v5
         l1QdvChIi1IlAH2QPuLXvd8pb1DC96KccbNDRTk5m86IZ8gwdy4mpSpMY2lw5kjfmgNG
         ibtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JeZW25rG3PtAzFodSzRAtiRusay7Hp/q+l2Vzy5PdOM=;
        fh=RfHdXnm6ihG4ET8s1OVMgXCn2MAMN1wr0ui5tIQUcXo=;
        b=H9pcJDmmlU3Z92RFuDdP6k1d1QYi4iJIZVdF2OKkfBQ7QtBVQVyraE4TzkOdheTzaZ
         kp0dbvySdlNFGqsqJi5KBuJdU/j4BT+rlapbQ6uyrUfEjXK+AnX0AdORCg42Z4+KXDDM
         WgQreSHU+BuSQxk2Y0GTdxPxuA0q779fkVwYEfqkoOrZ4AFwvzR7WfAIEpjSGT53UhA+
         lwPpuTcUwX/idt/6Pq3ERnNxPv9KbepdKd24ypYYb3caUl2gfX3bbCmPIDs56pTqQrUd
         OUjSEub2M6gOK9iQM0jUkueIi3Wzg7vMn6Lyv/QL1LNVlUhADchhpvHbLdSHAISGpUto
         x59A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1794776623; x=1795381423; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JeZW25rG3PtAzFodSzRAtiRusay7Hp/q+l2Vzy5PdOM=;
        b=Ngk2DVgv3r28OnfOZXzmGqPF9KIldZV4siYG2jnY/eLZA0Q+HpDh3boP93A6PrRNM5
         YXgDavVLkjCRWFSMTn67aArDtygf4xnZWCxAyChn3AGBrUOTNT1Ekq5Qvz8RI8ahGili
         uQcvSDz7PYWGlY4pHvXQhl5hhSzGPpisrAjiSyYbXIEt7QMlt1KVAuPbhmZN6ke/I1Uk
         yzh7X6lzGwWLI0eIB7KgpFK4h4Y3JOt7MQrUiNMwQOQmLnApkCi0OA6cMgPx8rawEyZJ
         iMCbrdjBwyERqd26SjQ8ml6K+OcBQJjIQUN7Gw+1j8fcHoCb1o4wTmqDv+t/gkdi/Afj
         T4rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794776623; x=1795381423;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JeZW25rG3PtAzFodSzRAtiRusay7Hp/q+l2Vzy5PdOM=;
        b=qwQczhDK0qdgNK83ZP0SRuQvjUoRqlgp/wBd2w2ReU94lRRSSS4E2T7WEiyY7t2vcY
         5/uiY/ZtmZ/n/J5pnNINFFFPwPKPfO9bszTQ7DoIGgX+C3c5NOoUrhVZb3aAytXK4Ofn
         RwTqW3EqfKOb8+DGOLG2+tB/4BCb3gWvTmgEFcFe4iW9ru1hwyrZaYYJUQD+oIrTjv3q
         NELxEj8kfkaarsTv0ttYdtrWlO4rbJ1znydXroAQ0q6aHwgOkJuwq60VuihIffvI/btj
         Ga10pmBC1yw1Zt/pHzdTB0MkGt17zPDIif4A1Wpiw97VyiAz3Kqof2UfVfZIOua82oI8
         I5Hw==
X-Forwarded-Encrypted: i=1; AL+hErFTuH2/tEG0NX7FD4YTGZNmJqA/e9nXiW1nwn4k9LiX0ZJu4aJ+hEx3dVk7k57XdAJTU6sB7o82sLfdMmU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9vwXBR9o588xDfbCbEqblctbCyNFCbNZTZQCAh8bFm+F2j17SE
	F4GjQRhHP09Z7tGNVZszhHeCWhkZT7awvI8JUhv9JG84+In/+UfsP86N++LV4ZERmu5LqxV3JXC
	tO/O/pYPppX+E6XDblxbeGO6HoNxU6a0=
X-Gm-Gg: AYBFou2aX+re3XYZ8tC/gF5Proyoj4WQfYOm4rwDP/DcZDDuL/Sw17E5YvzBeSIGtNt
	hqLwluhVdhKOUYz7pMIIFn0UOA9+6MIlvMh8HBtT5m4kPpAPWRpTkxJK/3GUPjlwoPlsomZhh1y
	9Q7xUgD13+mljgk/UMRG99COMfhWrdrSlsms/hwjskMExAGc7EdNBtN1MbtPWUgweOyI0D252Im
	FkPFo6VwvqYsU/nJ5nlXc4wpKASXuJcFiybcqGutgYlWKHH+FqhF4TRCGZWGPz5VUZgaUvog35z
	R00oPUugNhVQlH6egO6YDO/buoaJWhPnLuB+nXhzD6Z9ZbjUSnfcqlNnYZgFGmCDSKiE71FKko8
	kzJ88HuQtBDrLFbAsckPGC8VvkdsWBaFk6HlPSHerpAx6jRL0d4kaLr7SrYT59q8WbAFBEOc=
X-Received: by 2002:a05:690e:134b:b0:67d:a747:37cb with SMTP id
 956f58d0204a3-67da7473984mr1788570d50.80.1794776622877; Sun, 15 Nov 2026
 13:03:42 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261018-audin-v5-0-4b8cc13a1b22@baylibre.com> <20261018-audin-v5-1-4b8cc13a1b22@baylibre.com>
In-Reply-To: <20261018-audin-v5-1-4b8cc13a1b22@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 15 Nov 2026 22:03:32 +0100
X-Gm-Features: AclHuK8RZRddO7WOnvwxzgFddHhyLeT9NtqQThzXqpKNCFZiOf6pqJWI8MgY6vE
Message-ID: <CAFBinCC+-N8LvoXZwMhoxjOzXgoYUfDKCcvmD7Uuph5=hTSg7g@mail.gmail.com>
Subject: Re: [PATCH v5 1/7] ASoC: dt-bindings: add amlogic,gxbb-audin
To: Valerio Setti <vsetti@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Valerio,

On Sun, Oct 18, 2026 at 12:18=E2=80=AFPM Valerio Setti <vsetti@baylibre.com=
> wrote:
>
> AUDIN provides I2S audio input support to the Meson GXBB and GXL SoCs.
>
> The AUDIN block on GXL is identical to the GXBB one, so "amlogic,gxl-audi=
n"
> uses "amlogic,gxbb-audin" as fallback; the SoC-specific compatible is
> added so that differences can be handled later if any are found.
>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Valerio Setti <vsetti@baylibre.com>
> ---
>  .../bindings/sound/amlogic,gxbb-audin.yaml         | 69 ++++++++++++++++=
++++++
>  1 file changed, 69 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/sound/amlogic,gxbb-audin.y=
aml b/Documentation/devicetree/bindings/sound/amlogic,gxbb-audin.yaml
> new file mode 100644
> index 000000000000..4df4796623ed
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/amlogic,gxbb-audin.yaml
> @@ -0,0 +1,69 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/amlogic,gxbb-audin.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Amlogic GXBB AUDIN audio input controller
> +
> +maintainers:
> +  - Valerio Setti <vsetti@baylibre.com>
> +
> +description:
> +  AUDIN is the audio input block of the Amlogic GXBB/GXL SoCs. It suppor=
ts
> +  various input formatters (I2S, SPDIF, PCM, HDMI) feeding three FIFOs t=
hat
> +  transfer captured samples to memory. The sound-dai cell selects the FI=
FO.
> +
> +allOf:
> +  - $ref: dai-common.yaml#
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - const: amlogic,gxbb-audin
> +      - items:
> +          - const: amlogic,gxl-audin
> +          - const: amlogic,gxbb-audin
From what I can tell it's even amlogic,meson8-audin compatible.
Although I didn't have the time to test in on hardware yet.

[...]
> +    audio-controller@a000 {
> +      compatible =3D "amlogic,gxbb-audin";
> +      reg =3D <0xa000 0x148>;
I believe the audin registers are 0x300 wide.
Both, GXL datasheet [0] page 43 and GXM datasheet [1] page 48 claim
that the register area is 0x100 wide.
The last documented register with AUDIN_ prefix is AUDIN_FIFO2_PIO_RDH
=3D 0xb8. The datasheet [0] (page 395) lists register numbers divided by
4, so to get the actual address in the memory map we need to multiply
it by 4, which gives 0x2e0.
The 32-bit SoC vendor kernel [2] has a header that states: #define
AUDIN_ADDR_END 0x28bf (same as in datasheet, we need to multiply this
by 4).

I'm bringing this up because dt-bindings are supposed to be complete.
So even if the driver doesn't use a resource yet we're supposed to
still describe it.
I don't see any additional resources that we'd need to describe and
#sound-dai-cells allows adding the additional SPDIF input later.
From what I saw in the registers there's also the possibility to send
the input signal to AUDIN but I couldn't find any additional resources
we'd need to describe in the dt-bindings for this.



[0] https://dl.khadas.com/products/vim1/datasheet/s905x-datasheet-v0.3.pdf
[1] https://dl.khadas.com/products/vim2/datasheet/s912-datasheet.pdf
[2] https://github.com/endlessm/linux-meson/blob/d6e13c220931110fe676ede6da=
69fc61a7cb04b6/arch/arm/mach-meson8/include/mach/register.h#L2274
