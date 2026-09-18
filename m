Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3841751DE15
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 18:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789756260; cv=pass; b=KPruu6+nhuN9bkiHdW/bWryG8Dwx/0jyLMq6omivfHdoBM/KEomuFsCk8nvCaC4UllJWCR94UoStJwPRlnuz/+40tZsFXlAgl1G0B1thkNN4ME4HhI75C1PFsSWS9Dv7YpqyTnMaG2DcSJXPpy8FpO3ynIpgS9T/FNlanYt8zBw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789756260; c=relaxed/simple;
	bh=Z3GCDadB22nJ3H8dlp8oFEKsrJ7JLQwFPKhgk/HwR1E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hjZtUbtuqN9FeXB6p/apPC20g3wUSyzdQg/iJlLURtncWfBMphQjwCEh60U54vxqrwMQc91pqWSk6C2zNsoe2ZiroZhcRRDNFnOzQSp6g2E3QlJNE73t+5wvo1Juf4d6P8Yy7fzo67ux09RlxVuSe4Zgd2/RbTTUq1naTIK75QM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C7pXUP8g; arc=pass smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C7pXUP8g"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc4d04d740cso707068a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 11:30:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789756253; cv=none;
        d=google.com; s=arc-20260327;
        b=rOTZxtMwpzobPGXO78Vtkupkgq355eRgTlYYd0+ee6zciY2n5U4rrw8g+1CgEbaFpu
         OZTmBqYsBJhoXv3TOYqum6jFnK8FBzpaoatN+hqAn5tgj/Ai6zYGgKpeUHr9rmLeJlMm
         6dLuqNm5Jvp6A0CniIA+6YZtq1M3uPi/X59xwUnqH9HD9DIN97jhQewzdUU0zgyA65Mw
         Zy7BmLHDUKO8AcNriauiVJSMeNF6Jj4IFRLo9GL3U+6yQFLINlgQIFZ0JVpSY7Bv0/ze
         fDeSHUHJBgVAqRj9OeVrSVvo8g6fLAsT7nK70uapsHQpPV/Z7ZPJXk+uY4NLHg3tmOiE
         raMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UthLOTqsgx1H7Ky6X1sMBpSJ/ushOzRSeE2EVOIQouM=;
        fh=KIJmwJOEr28o2tiPpT/1ob+Ghe0+BvO/WZhN3wkH59Y=;
        b=JMLUaXeYRAfJDM8eZnrFvwzqWz1Zu3s/4986KaGEbiAscWmRKaeDOJqUMKMkWuyzmx
         RHSEqA55vrdMLllJKriee0+kSajE0TxvQwxND/fipZ2CN760C+OWQljZIvzUEFTpHXE8
         sf1XQ9lwBmc4fDVKNkI9+HBrjEbPGSYsk3EFOKvuYcK3bYTirMQZKpFv2LtgQPbqUo5/
         0ynDdgHG6F+dPbYHqO1IZlfk7So641rtbVr+bKMp1Ha00wnGeVoZjQKvpH6llQvnI7at
         iLp2oM5il5W9xf1Siw56/46ZxvNN7S60jaHvYNClqBhXwxSUDxH2YmibtoL1hPQpozBR
         czPQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789756253; x=1790361053; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UthLOTqsgx1H7Ky6X1sMBpSJ/ushOzRSeE2EVOIQouM=;
        b=C7pXUP8gPhskr6JrmaOqzZbQFyo1KCY0eWKQkzc1OTFuEgVNYdOOrYRvHXw4nvnV9X
         mBJPmUNTK38gMHYRi6phSIKGl4On4aHQGIrh/tv15tmpYc/TdZdWJidlJ3FLVoSdZv3A
         FMoXWk0qCpi8QwmMIh9pp8LuAIMuI+NYcr6bn5YVg8vUm4kSXDfisDdtDWvcU+0buAPa
         GATSG9GzrWjt6/EwRXvdqd5nItW2XnjP5ciEFJ4zvwfY4YLLtuNpZ/+47iKZdFBt2F+a
         GbejvzsiPaxFvUyr4smI7t8qM4KBpFVHBG175O6AcfOs0HAmLG3eoKCS1AFnL6nqubHI
         npyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789756253; x=1790361053;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UthLOTqsgx1H7Ky6X1sMBpSJ/ushOzRSeE2EVOIQouM=;
        b=NxPfr3P1AxF3/7n90GbCOBXog8JsWOFK8wdwOBAilqa9Ie0CkKoerutg8xc73rrzcL
         roNp6D6RO01soYA7TGvn8gfM2G+Jujo13bGKK+v9eBQo8N63XCmUJxLIB0nq6tRpn8My
         bbs2C9A3AfMQd620u4tPGphMIn62iQh1F+cw6/HSBqasko6tMe+lzcubr2tzA3Hz5o4k
         IMEddiLcyqj8Vybk9UyRTwA+j46wH5p+jQ2xAmMPAfGN70nhjt09mwonp484yVN3Pieg
         K4j4yRQFz5uJJ6cXdvtAXwQDfiuIzc3/rSScc3aBspkiN5fdVfcEQ9GPeXRH1+WFhg+y
         IRkA==
X-Forwarded-Encrypted: i=1; AKwUvBxDKH1IumwzZvcy5OgAEsvxFBvAhquqejQG/BUZmY5MNdrEELLveMQ6sd8Rl+zzfuvV5uJtBjItxe+/Sp4=@vger.kernel.org
X-Gm-Message-State: AFuF++ldNJwd1hB509CcOK9Ig0kEV5ym2GTUsmnZexKXhQfS2kKFyNwb
	JJXSrdsFbQC+M8kRXbEm5Q4aq7e2V+LKHUhbbRmlofefNuCXwmQJ1NNfx+hDV9lg7Fipf0J812P
	YnR+VRX4+J8+KwkaXctBkrgqzEIB7SpI=
X-Gm-Gg: AYBFou3PPxlV+JdTzfisuItC2T99+XjV9jQ2yOfjvLGtAtRqQVys62e1NCusK7iHfGA
	CU4Q0MJ4vWmapQKNJrX2YMcLojaW1/yRzE3yeaYYK1j2XJG8gOu2SLaj70oClpAa+upyQkCPN6Q
	ps8wbEG+xRAx69zYtQ97tii0SltlEbwj0nTQlkYaz0wl7O7f8yldi8hhKRCf0w4qX8yS/to7wg1
	T7SGezdtGJDv8uDlhFL54/4yw2tPIjlY2t6xgenOJv24SiMDXXvNj4mald+ZRu1x7SRwpaaFI7h
	QOzn4GABbTtUZgPWDP2m/FgavUDdy6cESls2FwMZUZscY5XUD6xPYrq6yo9mGEHt4Dtr8fAy5Di
	fBcFhuhiqlw+Z
X-Received: by 2002:a17:90b:2681:b0:39e:6c69:f482 with SMTP id
 98e67ed59e1d1-39e6c69f55fmr655165a91.65.1789756253090; Fri, 18 Sep 2026
 11:30:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260918-kbingham-orientation-v6-0-5e8b1f01be29@ideasonboard.com> <20260918-kbingham-orientation-v6-5-5e8b1f01be29@ideasonboard.com>
In-Reply-To: <20260918-kbingham-orientation-v6-5-5e8b1f01be29@ideasonboard.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Fri, 18 Sep 2026 21:30:41 +0300
X-Gm-Features: AcwNN1UUuDTcQsQdT6LSC3YiQR-XJenFcyp7p3MxtUdbO4cYi1dTxigUEDSEcPc
Message-ID: <CAPVz0n2pZukL2tnaJef-N=kRiudVLN7RsTjKJJkTqp9-_k7HwA@mail.gmail.com>
Subject: Re: [PATCH v6 5/6] ARM: tegra: Convert to new media orientation definitions
To: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jacopo Mondi <jacopo@jmondi.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Jimmy Su <jimmy.su@intel.com>, Matthias Fend <matthias.fend@emfend.at>, 
	Mikhail Rudenko <mike.rudenko@gmail.com>, Daniel Scally <dan.scally@ideasonboard.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Michael Riesch <michael.riesch@collabora.com>, 
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
	Sylvain Petinot <sylvain.petinot@foss.st.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Paul Elder <paul.elder@ideasonboard.com>, Martin Kepplinger <martin.kepplinger@puri.sm>, 
	Quentin Schulz <quentin.schulz@theobroma-systems.com>, 
	Tommaso Merciai <tomm.merciai@gmail.com>, Richard Acayan <mailingradian@gmail.com>, 
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Heiko Stuebner <heiko@sntech.de>, Thierry Reding <thierry.reding@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux@ew.tq-group.com, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-tegra@vger.kernel.org, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D1=82, 18 =D0=B2=D0=B5=D1=80. 2026=E2=80=AF=D1=80. =D0=BE 13:44 Kier=
an Bingham
<kieran.bingham@ideasonboard.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
>
> The orientation property for video interface devices now has definitions
> to prevent hardcoded integer values for the enum options.
>
> Update the users throughout the nvidia device trees to use the new
> definitions.
>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> ---
> v2:
>  - Fix MEDIA_ORIENTATION_REAR to MEDIA_ORIENTATION_BACK
> ---
>  arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-grouper-common.dtsi | 3 ++-
>  arch/arm/boot/dts/nvidia/tegra30-asus-transformer-common.dtsi    | 3 ++-
>  arch/arm/boot/dts/nvidia/tegra30-lg-p895.dts                     | 4 +++=
-
>  arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi                      | 3 ++-
>  4 files changed, 9 insertions(+), 4 deletions(-)
>

Reviewed-by: Svyatoslav Ryhel <clamor95@gmail.com>
