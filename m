Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2772C38D3E4
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 02:50:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788231006; cv=pass; b=HCqj5ZZHF5L5IfX4dlD9K3RxJSAn2R+RzJbIs2b9B4K+NcfGA7VsMHcYL6F2p+A9ez1+b97xnlhz8DssUQ21I1G4L2mtrNrvjAvH0r2936k82eTKasFvOWstcfQBzHI9SMeN2WJ+78PPixL1KaJBzqt2/9b7p8DZ2Aw90a1V+u8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788231006; c=relaxed/simple;
	bh=d+5sNu6yCImmExOIG0N8b7ccM60ZupY+qjLmAb2IucU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LVn+MMDnLWAndIrwacPWf8d3BOF8JlzqLVX1EsvTo6+fNZwP4gW675CAmrRZlzvR9dMvGH0M9eQdUwac5X5I1twsaP9lyUB3MQy2kRhO8SHPOwKBGtila+j8urMBdxFv/05NB1yamiW9iFmN4fvW8y86ALlypzaQbFsCriXCpEA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c6LR3cfI; arc=pass smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c6LR3cfI"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c247f6687dcso693226566b.2
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 19:50:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788230999; cv=none;
        d=google.com; s=arc-20260327;
        b=XPdx73dAPv6PIPnI/5aHDjR7+1xAhoOtlPDoMetraC7zwo/ygyXZkH420RpNNainyS
         hNMR3Nb/BZYlaUS69IDevI5+qyFrcKT9nngWOLp1XzJ9Q6WIsMM9y3W0wKf/irCEWrO9
         eVryrrYxnptTChcdaMfByR3je8Ew2/qXra9mrlfPCgFismY/PksnslHQ4OzMrJUs9jiN
         HBNjMy3QqoVStmFxbQjPX+YRvgVZ/QjkkKOCEJ/D/nZ5V205Rc13Ojady5v8BOofyaPW
         vJAk1y+qchiPO4L2DEjvpP3QwNgnK5/Yb6M41yK/rjm8IWuzHuL7417mqm9wB59wkAp4
         XJqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FE0XcRGmiiYWJ9U7pQXykX2gv5/KOpFiI3Aylrs/Qqo=;
        fh=DdxjxZTA2zYpN4SYNun+27qCI2aSnwNPFt/D1ex76bI=;
        b=fFQkbEcbYBx9hvBMQCQSP+ow/j/EgUg1O9Irpqzkw/UozhDE0yTLH9d80ODHRn8FKq
         eFZOAsbnnzg2dCWfWnSPi9s9lqe+KLd/my4WlKiZT2uQ8EluU2GLLIO5bRPvzv0DoBpl
         k/LLirXcUOQbTpskIohyxB2//2eGUuKGz5tcof+i0LImdDjJKBRGs1JYMv7kACViZ4ZJ
         ULna1nbZln+Vw0rm816HyGFgp0+uib4UVyC3TicLh9gc3HnPBiqQlZPRAIQDuq760fWJ
         jc6qZkRwX0GXcFt0HpzZ2iGIdrb5nD8eGovekXjCgxnep6K6vaa5nM2o/DQnkBNrqIrg
         RXWg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788230999; x=1788835799; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FE0XcRGmiiYWJ9U7pQXykX2gv5/KOpFiI3Aylrs/Qqo=;
        b=c6LR3cfI+ZqH6iXHEZX3EmzvUVPFYc3RQgs8t/1X7FtFLto/TZxs6wVV6Lgn3DIp/h
         jkIdFDloc/lB+sHFCSC6RBtNNIuvgv5FMsqvqptV5QFjFTQLHR5I4kRuAfFAxB3PuWCG
         8GJv7DHkZHji3Q8lb7vZnQJLKOA2KkNHAsnyFbwabCQGw66R+Pm3Sqkrsux2f1xc75Fm
         jyVtNAQVpx/kY74ue+J7FPvcNJeQ53sQ2vK6fJ3CSTMuWl06aXHzKKVoRoHry9ZU4XNH
         G5D3aDHIb3sCeaXyDRSDO2rogkcnzFVVo19oPjSLkb/fqtqJPb5eeJGOrPHCFYjOdE/s
         VPdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788230999; x=1788835799;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FE0XcRGmiiYWJ9U7pQXykX2gv5/KOpFiI3Aylrs/Qqo=;
        b=QagPtqvC/duE3u1AjMfKHQsDVx46h8fHwuv2hKwATPhrzMCCpguKt6+6EXU1y56NlH
         go01j5IDDlKS5vWAPOgtBGItFHnMGtWKet0OSjYsc0rHicqH268zYb9DXJuUhl1cQtWy
         yDExrLkaAOQhaENDQ5Afv0OnurVT2iLlmazQXvp6bLakhtRe62jM/lmGTUwZy6GJ8F1l
         VFEn3M4LuVaec+doQW7gV5NF/jEG6737Zk/dKd/LfxLDHfenhl0e4E4Q1e7D58htubIQ
         YfY4FSV8xxlxd5xG91Gtl1yBnk0xXyE/indtFDUDQb5dA+wbS922kb8Mq7NIcCO6PAZD
         k74Q==
X-Forwarded-Encrypted: i=1; AKwUvByaV2hgI32gKQzWHOwOt5LLEkLMgGdfvWaQ165/vMRwS9huzsvqcXSEH6O889sxfMgt04q1fwTNA/4D42U=@vger.kernel.org
X-Gm-Message-State: AFuF++kOPg33CLexbWvl5aJBN6N7gcvHbHPk50EfzU4JXaYNHVivOkrS
	sWbRp3eR7pNSagv8+sBLbryUDAlzSLqV5hUaEm97Hj5rJjylUCSrtjYaqcdKKwtl0Oqb13SEkFK
	THb1IZ6m/EW7ANeWq8kTtWM5mD1+WI0U=
X-Gm-Gg: AYBFou2JoeV9A92ucef6thUj0c/08tOyFiboB/TU3F8YOyXswy3sxaJHtEq9FfGcBqx
	SoPmeYjc+pMCTrwWRshRoeGnao24yorw3N65YkVINajQN36ZzJ3+ZJ3Viss8E5fAye+5t+c3+HW
	wYB/SjylOZBGgcfY3FbxIlN45Wd+5KzRT8KQt3ho+TqW3GzsHlCr+fG7TBHj2lFkVFVZzz61yLk
	UzRaMRt5WPqS3EBpFnL7wqoQ27qnxPpGv0AETXZ4cxqASsJxNfEsvm/SepRSQl9Uwkm0RGhUc9j
	ClUuMTsAeFH2tM4DQdSVUmGE+0llsfCcyagYBYHZvjYua1Lw1BgHCwyvEM/zgld9+Myv2GMSM0n
	MBC63qcJUkbWg/gZ18kKAGRWCqXc8B9YhxRnzaSlaFJFywYfC9xZ5vwJ2xMnLS83SA9oOUdQWRY
	D9PcJaqBbnkC7LQEEeV4XbdHW6SHUHm5mHjtvj+i6uDCddRTMzjVIx3JPvV8l9F9P4xA==
X-Received: by 2002:a05:6402:1ecb:b0:6a6:32fa:cac with SMTP id
 4fb4d7f45d1cf-6a663b43846mr2830056a12.17.1788230998708; Mon, 31 Aug 2026
 19:49:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260831233653.14232-1-rosenp@gmail.com>
In-Reply-To: <20260831233653.14232-1-rosenp@gmail.com>
From: Rosen Penev <rosenp@gmail.com>
Date: Mon, 31 Aug 2026 19:49:47 -0700
X-Gm-Features: AcwNN1WtBJgmoVyxxnr1GxEJ1-2nuIjkP_fAURpv3voSdGn5BCgrhOsGs_1n4Pw
Message-ID: <CAKxU2N-qwFSPzLT1j1Bmo3-S8m+H5xaxGH5iHiACqHbj1+fiBQ@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: helios4: drop unused phy0 pin group
To: devicetree@vger.kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"moderated list:ARM/Marvell Kirkwood and Armada 370, 375, 38x,..." <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 31, 2026 at 4:36=E2=80=AFPM Rosen Penev <rosenp@gmail.com> wrot=
e:
>
> The microsom_phy0_int_pins group muxes mpp18 to gpio, but nothing
> references it: no PHY interrupt, GPIO user or consumer pins it in,
> and the sibling ClearFog board does not define it either. It has
> been dead config since the board file was first added, so drop it.
This is wrong. I have a separate patch that uses it.
>
> Assisted-by: opencode:big-pickle
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  arch/arm/boot/dts/marvell/armada-388-helios4.dts | 4 ----
>  1 file changed, 4 deletions(-)
>
> diff --git a/arch/arm/boot/dts/marvell/armada-388-helios4.dts b/arch/arm/=
boot/dts/marvell/armada-388-helios4.dts
> index ae03d42f92a0..e63b8b5e632d 100644
> --- a/arch/arm/boot/dts/marvell/armada-388-helios4.dts
> +++ b/arch/arm/boot/dts/marvell/armada-388-helios4.dts
> @@ -284,10 +284,6 @@ pca0_pins: pca0-pins {
>                                         marvell,pins =3D "mpp23";
>                                         marvell,function =3D "gpio";
>                                 };
> -                               microsom_phy0_int_pins: microsom-phy0-int=
-pins {
> -                                       marvell,pins =3D "mpp18";
> -                                       marvell,function =3D "gpio";
> -                               };
>                                 helios_i2c1_pins: i2c1-pins {
>                                         marvell,pins =3D "mpp26", "mpp27"=
;
>                                         marvell,function =3D "i2c1";
> --
> 2.55.0
>
