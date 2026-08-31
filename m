Received: from mta0.migadu.com (out-194.mta0.migadu.com [91.218.175.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEBD3472F67
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 17:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788197350; cv=none; b=Ay6g76vfyRs2ObSNflxPG2iVxoB58AcUyE6Q7VB1Vv0872wo7PjRbDaeJlj+T9wBR7XLkpzksAIAw8H8AlVhjdilb4SUppNP4frflF06BYiZnK3BBYxeb/2OqwGXbw5Z4wgNVKBoLYMjrd1pf+EimtSA6fIOYhBOffXGuxuDPGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788197350; c=relaxed/simple;
	bh=1kSqhe2+PT1a5oElxIG7Elgw45NvEJRmD8rNlzuc6uQ=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=q3PMZwjlxWZLkm+TEHd5uJ7/7LB7X4+m0aBgLx6vYxKUvsZpn06RsxFp+7aeuWkTxHxm+wB56jeEd9s3HBtfnROPMiL6Nx9cmTVXFtjswm3aUtIk/yEiDzuKR4CyqCZrYlg3gTcZYOcyt2JdrEkomAQIxSJapFYM1RSNcODDur0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow-tech.com; spf=pass smtp.mailfrom=cknow-tech.com; dkim=pass (2048-bit key) header.d=cknow-tech.com header.i=@cknow-tech.com header.b=DHLF4tOO; arc=none smtp.client-ip=91.218.175.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow-tech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cknow-tech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cknow-tech.com header.i=@cknow-tech.com header.b="DHLF4tOO"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=1kSqhe2+PT1a5oElxIG7Elgw45NvEJRmD8rNlzuc6uQ=;
 c=simple/simple; d=cknow-tech.com;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788197344; v=1; x=1788802144;
 b=DHLF4tOOWRhXHHzS8XUXjRxVubzd/MiFcMt2joJsuh4ccsLIv2xk6AYFGYMdF7V0SRRy0Fxu
 o3MHjZsRapr6sWRennPSQaWuU/zD4jEd6HxgmhRGKhWbDMvKyOpMVuGIctRT5J5rWQGgoY9gnF5
 meHCU8T/4gCfy4fbEg19ataHfsKQfTfBevfz1lFL+jiTszbk+W6MBmPMYN9lF8Dqd6oHku9+Jc7
 w0XkIyPTSwgzhV4cd/nL+fHvAEFa3oobl+plutQS8gjEQQsu1gBPXFqCESDA7NH9Je3s/Jskvp8
 erQsFNn6JysMrOz0iM7ryoeZIU/4ygaTouc+RllT4lmsQ==
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 3bb6bfbe23dd3995;
	Mon, 31 Aug 2026 17:29:04 +0000
X-Mizu-Trace-ID: 3bb6bfbe23dd3995
X-Migadu-Flow: FLOW_OUT
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 31 Aug 2026 19:29:00 +0200
Message-Id: <DL3B1XH7K4WC.1ZXA6ANI8Q1A0@cknow-tech.com>
To: "Detlev Casanova" <detlev.casanova@collabora.com>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Heiko Stuebner" <heiko@sntech.de>, "Johan
 Jonker" <jbx6244@gmail.com>, "Alex Bee" <knaerzche@gmail.com>, "Christian
 Hewitt" <christianshewitt@gmail.com>, "Robin Murphy"
 <robin.murphy@arm.com>, "Nicolas Frattaroli"
 <frattaroli.nicolas@gmail.com>, "Nicolas Frattaroli"
 <nicolas.frattaroli@collabora.com>, "Kuninori Morimoto"
 <kuninori.morimoto.gx@renesas.com>
Cc: <kernel@collabora.com>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-rockchip@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 5/7] arm64: dts: rockchip: Rename rk356x HDMI audio card
From: "Diederik de Haas" <diederik@cknow-tech.com>
X-Mailer: aerc 0.22.0-9-ge948bb7230f4
References: <20260831-fix-rockchip-hdmi-audio-names-v1-0-5b155ae05293@collabora.com> <20260831-fix-rockchip-hdmi-audio-names-v1-5-5b155ae05293@collabora.com>
In-Reply-To: <20260831-fix-rockchip-hdmi-audio-names-v1-5-5b155ae05293@collabora.com>

On Mon Aug 31, 2026 at 4:20 PM CEST, Detlev Casanova wrote:
> Rename the card from "HDMI" to "RK356x HDMI" so it identifies the SoC
> in user-visible ALSA fields and no longer collides with the identical
> "HDMI" string used by other Rockchip SoCs.
>
> Fixes: 697ee8546e241 ("arm64: dts: rockchip: Add HDMI audio nodes to rk35=
6x")
> Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
> ---
>  arch/arm64/boot/dts/rockchip/rk356x-base.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi b/arch/arm64/b=
oot/dts/rockchip/rk356x-base.dtsi
> index a5832895bd39..98785c812fc4 100644
> --- a/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
> @@ -150,7 +150,7 @@ scmi_clk: protocol@14 {
> =20
>  	hdmi_sound: hdmi-sound {
>  		compatible =3D "simple-audio-card";
> -		simple-audio-card,name =3D "HDMI";
> +		simple-audio-card,name =3D "RK356x HDMI";

Move the name property to rk3566.dtsi and rk3568.dtsi and use their actual
SoC name, thus RK3566 and RK3568?

Cheers,
  Diederik
>  		simple-audio-card,format =3D "i2s";
>  		simple-audio-card,mclk-fs =3D <256>;
>  		status =3D "disabled";


