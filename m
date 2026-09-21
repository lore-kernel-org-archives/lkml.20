Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF9E9484235
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 14:03:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789999440; cv=none; b=ZvtiorEBrMo3H95ljiUn2H16KupyHGrjmjuy/mJo8VCvHqYsDKBYtdF2fy9+EBFD3S6bqO2aeF/EheA2Sfi/c34b2BigjY3rA8BDBNDeEnZSEjONcySV9xx8dfw01JnNveBC1jMHj1/cwJZa6fr/KfsKKGEszTeFaO3566zZG2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789999440; c=relaxed/simple;
	bh=9yxDWeoXyET7im0vPGRIQQJr112zR1B+CrfA3+RIFIU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LwwpoLZZ4uS0zx+gyBEjt2O5lnJDulrzZTCVUuoN9qvViCncNh2mPdviEDdFN6Ecs6bZwEb7g0AvJ4JEbRA+9lOdnCTPKI6f7le6unth3iDOAXCYkCNH7OxTSrCycJ1//eArH61UcCQ55rvr76dnaRGgNzD7tZF2Wf5j+Vldt9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QAMZDbGf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QAMZDbGf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A83631F00893
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 14:03:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789999437;
	bh=Ds/j0lOmNgNcO3qKBdWYsVX1mHXVi4h0Q6BrQfEfK1k=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=QAMZDbGfazVrrAbAqk2H2IDn8bX6MqsogvVz7NjCI3aA7PjmwbakDHVrUSW7YL/xE
	 IfELlwqp9rElU7H3VMOxoVKRLtWbfgrucLfxiCikFjrqTI0uZoouS/3OAyrNB04/A5
	 J2oBZp/eVZuNPGDUIZNsPAVM5wbfx3WclsCnchndo6LGcQwUzXHf0HFTozpuxLpVyF
	 RpK2iNsyA99qPqWJtGHvOyvBGqTVqQUcQf6GcHTVbA0aGjXBJN1mv0NCIpX2RnKSRo
	 5OWinWrrbhwFs/088JNoQ+RWKtN9ibfusfjr6bHUWy3UUWvrtCZjHyZQD0QeeIJofR
	 qrL9YlFUmMn1Q==
Received: by mail-ua2-f43.google.com with SMTP id a1e0cc1a2514c-97e7c62dde3so757922241.3
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 07:03:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxkusp4sobE0AobKYoeYrt0/3kU1qnRADJieg0tdJC4/eNkUxK+Fv2OJVNc6RRoWMEfAMTIAkrXjxK11OE=@vger.kernel.org
X-Gm-Message-State: AFuF++lkdY7BDeMjoA1DSZat6Kr8dcfSeOge4RZ/AkGnCHZD7QP9TPBZ
	tmMCgitTuuntcSbaLoIizDaYmfE7+zJvv6H+xkL0ix++FsKISEIX+sLgSogyErwky03yHybocIJ
	GNLKyaM1aqQNN2aM6Vp7O/q0Sjh0UccA=
X-Received: by 2002:a05:6102:5714:b0:7a1:f7d2:e849 with SMTP id
 ada2fe7eead31-7a55e1a6309mr4024862137.25.1789999436903; Mon, 21 Sep 2026
 07:03:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260915072000.47367-2-krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260915072000.47367-2-krzysztof.kozlowski@oss.qualcomm.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Mon, 21 Sep 2026 22:03:39 +0800
X-Gmail-Original-Message-ID: <CAAhV-H6Q30Go9bTqxC6kZdCmRZbiC+4RjEdmvKd7FJe9brU0mw@mail.gmail.com>
X-Gm-Features: AcwNN1XoVcahAhjvpratz48o_Y5tLuUmFVbC1pwuKID2bA2ggRg42Clk-YHmhT4
Message-ID: <CAAhV-H6Q30Go9bTqxC6kZdCmRZbiC+4RjEdmvKd7FJe9brU0mw@mail.gmail.com>
Subject: Re: [PATCH] LoongArch: dts: loongson-2k0500: Drop unsupported bus_id
 in DWMAC
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, WANG Xuerui <kernel@xen0n.name>, devicetree@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Applied, thanks.

Huacai

On Tue, Sep 15, 2026 at 3:20=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@oss.qualcomm.com> wrote:
>
> There is no "bus_id" property at all defined in the bindings and new DTS
> is not allowed to bring undocumented properties.  Fix dtbs_check
> warning:
>
>   loongson-2k0500-ref.dtb: ethernet@1f020000 (snps,dwmac-3.70a): bus_id: =
b'\x00\x00\x00\x00' is not of type 'object', 'integer', 'array', 'boolean',=
 'null'
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  arch/loongarch/boot/dts/loongson-2k0500-ref.dts | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/arch/loongarch/boot/dts/loongson-2k0500-ref.dts b/arch/loong=
arch/boot/dts/loongson-2k0500-ref.dts
> index 7ace54c84244..d2a3ed9fa578 100644
> --- a/arch/loongarch/boot/dts/loongson-2k0500-ref.dts
> +++ b/arch/loongarch/boot/dts/loongson-2k0500-ref.dts
> @@ -73,14 +73,12 @@ &gmac0 {
>         status =3D "okay";
>
>         phy-mode =3D "rgmii-id";
> -       bus_id =3D <0x0>;
>  };
>
>  &gmac1 {
>         status =3D "okay";
>
>         phy-mode =3D "rgmii-id";
> -       bus_id =3D <0x1>;
>  };
>
>  &i2c0 {
> --
> 2.53.0
>
