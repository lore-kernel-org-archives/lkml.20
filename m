Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 204BC3ABD9D
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 05:46:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792129571; cv=none; b=VlSVrRRBSqXpk62BzRI52pp74/j7QjC/La3mI9yuLmPs7B/sdkdETzyxIIqocTSJ2nMhHyp7n1+7Mvaoj/XWekifK+qO9bTIOngL7y+a2Yzc6oO8ezc87KdfnFBcmnpqfPsO/YE1VhgFff89NHBBDr60bmHK1gJWBBaYfb5JV04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792129571; c=relaxed/simple;
	bh=6ymS+b/OLR/rl7wKcQ+VUBVwLwrZQuAjaXbNO9gOQXc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YRwSD90V+IoNIjhlS0GQ1V4LrfBZKG3Reix9/78JdjEZBVrluD5NnwpYB0iL5X91wsfj43Wg5K1yIvC55TJqPtWa6fuWjwNin3/H5wfnD8b0qZ/foibx4vF1yJ+KNdoBeARV1hNSjZ5ZJJRenMEG7EGcwebm2P3+D/pTisJSN6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JWyV6FqO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JWyV6FqO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4504E1F000C9
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 05:46:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792129567;
	bh=LoKtrw7hyNRnwwtzfdOXkXTi9AGhOrp6JERxAlqfWSs=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=JWyV6FqOv9QQWa1oVzJgkTyXA0h1PgnXMa5/dRfAxiA9L9E/+kQI1uUr6tkciK5KX
	 4Ti73fLs44mN99sMYAWSNNVM3JnWOWl5LeudwYgQUdn4jCg+oGTGVZDMcAliLFRsGN
	 49u0h71/rNIcINv6KH4Hq0qOxoX7HN0D8P3loAaP0vtJp65rJ1FKa72xPOqoFLoMS5
	 nmMzFPMs1r2EB7QA9SLXH9AYz+SdN54asOWpwyE7vKsfp0CZCSqnRr68hXpXnqJCGf
	 3XQJk5kKMXgIYSuNZrVdBY/LsWN1P0he7gqlmhyJ2BqD1aDQGx9x+KvnJIzF8gi2iJ
	 +y0oEn6bx3yEw==
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-3aae7df0971so10147591fa.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 22:46:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBysmQMS7zMThElOtTpOH2SEaWEsy5ffTbgVTgNXMUCRwm1FEh3rOXeSOXsLc4N0dNssN15+vXGU8VEQK9o=@vger.kernel.org
X-Gm-Message-State: AFq9FYJPFrhsZQ8QbZKMrlAhUDGy9vlvOQOyr+Afh5abJGcApbRNO/wo
	5NU0n+dVFE5VSNugUTqHzLY2YBlG0nf6zHV8G9mztxfAzRcS7dTClBaZlMClTxF0+ki8xZ1+U/q
	pPNWTWoeHbM7S0HN9gXuhvl3layVbb54=
X-Received: by 2002:a05:651c:211e:b0:3a9:8450:813e with SMTP id
 38308e7fff4ca-3a9c56df14cmr54234641fa.20.1792129565639; Thu, 15 Oct 2026
 22:46:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261016-helios64-power-tree-v1-0-31d6c8dc5092@iav.lv> <20261016-helios64-power-tree-v1-2-31d6c8dc5092@iav.lv>
In-Reply-To: <20261016-helios64-power-tree-v1-2-31d6c8dc5092@iav.lv>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Fri, 16 Oct 2026 14:45:51 +0900
X-Gmail-Original-Message-ID: <CAGb2v64pcvwak2kC7rPwiZm4=BCnb+Kh3WUps3J-19=DC6pkzw@mail.gmail.com>
X-Gm-Features: AclHuK8uVlitNY7i2NB9uFdKYW8oiH_IPPYtbAi4f1OZkEfiAEY-pnEtxZkD2cM
Message-ID: <CAGb2v64pcvwak2kC7rPwiZm4=BCnb+Kh3WUps3J-19=DC6pkzw@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: rockchip: Describe the unused RK808
 outputs on Kobol Helios64
To: iav@iav.lv
Cc: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 16, 2026 at 2:34=E2=80=AFPM Igor Velkov via B4 Relay
<devnull+iav.iav.lv@kernel.org> wrote:
>
> From: Igor Velkov <iav@iav.lv>
>
> The Helios64 schematic lists RK808 LDO_REG1, LDO_REG2, LDO_REG5,
> LDO_REG7 and SWITCH_REG2 as unused (sheet 2). Each output has only a
> 0.1 uF capacitor and goes nowhere else (sheet 6).
>
> Describe them with the names from the schematic and no constraints, so
> the regulator core switches them off as unused.

To be honest this seems a bit odd. If something is unused you should
not need to describe it.

ChenYu


> Link: https://wiki.kobol.io/helios64/files/schematics/Helios64_Schematics=
_Rev1.2.pdf
> Assisted-by: LLM
> Signed-off-by: Igor Velkov <iav@iav.lv>
> ---
>  .../boot/dts/rockchip/rk3399-kobol-helios64.dts      | 20 ++++++++++++++=
++++++
>  1 file changed, 20 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/rockchip/rk3399-kobol-helios64.dts b/arc=
h/arm64/boot/dts/rockchip/rk3399-kobol-helios64.dts
> index cf247d6c6212..35e92e1c8ff8 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3399-kobol-helios64.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3399-kobol-helios64.dts
> @@ -436,6 +436,14 @@ regulator-state-mem {
>                                 };
>                         };
>
> +                       vcc1v8_dvp: LDO_REG1 {
> +                               regulator-name =3D "vcc1v8_dvp";
> +                       };
> +
> +                       vcc3v0_touch: LDO_REG2 {
> +                               regulator-name =3D "vcc3v0_touch";
> +                       };
> +
>                         vcc1v8_s3: LDO_REG3 {
>                                 regulator-name =3D "vcc1v8_s3";
>                                 regulator-always-on;
> @@ -462,6 +470,10 @@ regulator-state-mem {
>                                 };
>                         };
>
> +                       vcca3v0_codec: LDO_REG5 {
> +                               regulator-name =3D "vcca3v0_codec";
> +                       };
> +
>                         vcc1v5_s3: LDO_REG6 {
>                                 regulator-name =3D "vcc1v5_s3";
>                                 regulator-always-on;
> @@ -475,6 +487,10 @@ regulator-state-mem {
>                                 };
>                         };
>
> +                       vcca1v8_codec: LDO_REG7 {
> +                               regulator-name =3D "vcca1v8_codec";
> +                       };
> +
>                         vcc3v0_s3: LDO_REG8 {
>                                 regulator-name =3D "vcc3v0_s3";
>                                 regulator-always-on;
> @@ -497,6 +513,10 @@ regulator-state-mem {
>                                         regulator-off-in-suspend;
>                                 };
>                         };
> +
> +                       vcc3v3_s0: SWITCH_REG2 {
> +                               regulator-name =3D "vcc3v3_s0";
> +                       };
>                 };
>         };
>
>
> --
> 2.43.0
>
>
>
