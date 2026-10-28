Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.178
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793156374;
	b=DJxsXYTK/RHZ/zq2Rl6LHEAbvwn4rkaSEyMi1fNf+wTEh+CeG9YZrifKw8IKwEcLXDmH
	 b9w11miJNO600JE1xJY+JxpkJC69CcDIo6+HtBSLlOEmYAe88c24g47/b1o7sCMUrRtX4
	 ffPxwf2K6DEOrUWZuECdWwukHHIWraxUQERCnjWVIXx68KuiUProiTdIHrt5B3EdTCE4k
	 CXNw0g+6tpATiyeNqSAlNKmDPiIjJMiR/2/CykpYPtRo1+jryBqWEPE1XDGvgh5krlVDm
	 6StBREdW7C/ArvR41ydcDb3RPv/Jvqu9/Bq+6PjUNCtgCBjoYq8B0Axjo2/9fls8e9A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793156374;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=T2DPmyi1uKgewOwOxe3WhQYBJSJPRynqMh4U5o6K2t4=;
	b=G6XO3XvJmpqYBrRaUg6svOLnDuZM8OFMUihgOYd9Ms0nMyMyyHiaL+Gdb8g0UL4FJz9y
	 EDfgQpqkpO69Q6F3jVP0/jMmavtMMi14GSWBkuU2OrM6AhiX8A/z/CbPSXCnLFmojwKLr
	 gzuO1HT9V7Oph3sBimfkyVZuFFENAueLRNpIQfTnjHulAPcky8/17Uk9rkT5ZAjHC1QZm
	 Ssd+XQsNqdfWpJYJ9RVYFz2KnkUQetdFa5lBN74wylOulrLdKoobg5lEPrHCpve1izFsb
	 AWDIduIoGhy5BgMfcdOd4nyqIbgW8nuM4Lxu3fec2VYGucisH4UFo4cgYPrQ6/jSaKA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=crbcFEMN;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.178
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC921606A31F
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 02:59:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EC921606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=crbcFEMN
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2e987a2ba0cso2578775ad.3
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 19:59:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793156373; cv=none;
        d=google.com; s=arc-20260327;
        b=CENCCObVwkSwW4ucbTt67cs4xiosHB/BerShjP2BaQaKh2f5BKkZV4kaPZk5N0OQRy
         b8weVgIkrp1/rotA/9WdBzJ0sYbeazP8QjRNWjYQNrmBpMVP7LOrn03NqITUgEHyfSfx
         XirFxRa/PF+Dj4dBK0iUIebhi/6Rboh+DiNRCL3tRxWT6IyX7Ir0Sr69ADXm8K5d/5rv
         oUUTvYIAoYEbBrnf4xeueEhWNOsEZKo9OVSEITP7dMUC6IYJY397pmSaYnmWLp0N31AF
         jeBAy37fDgSzetWKCgoGneEx8SlAxTdW4pV035hr6TZAXGPF31DqEHvAEB5H1dUTTFlN
         GErQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=T2DPmyi1uKgewOwOxe3WhQYBJSJPRynqMh4U5o6K2t4=;
        fh=xOIN/XE4M1EKf1wE2W4NfyivqU/cmpAfAS5c5OYIA8E=;
        b=SEpWQn2D5MAyxw4MZ+89WAAZaKurqeU3Cr1qhSYzwq3anhZt0ofaQ1xLbAXYPb1LLk
         MBnshQ93dbeEqrygdP1GDNKP4hLuliLCD10bxeKmbDPw0Ib500p4evdX8F3CKVIT3cQT
         /xhuhVnHSz/s702cqvZ6W3PrjZQCC425SFx9RDdMX9hqB/Q8mcj1YPk25mJMNXMXHoOR
         HrY1DwulqoJtgON8oqiSoOYbhhzpAQYLlvqlDWMbSDq1Morp5VjKF/6ZF3jhjslzEQ18
         lAYJpkl7XovQqWF+IVFPomNqPTJo/oOBe+dWO75pykc7/8s2o/KKTUdZlXh7U1zrFlHy
         sOVA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793156373; x=1793761173; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=T2DPmyi1uKgewOwOxe3WhQYBJSJPRynqMh4U5o6K2t4=;
        b=crbcFEMNt8APwJgcJwjxerfnVJcN7B75vaq6MdGTapuOpIxG+dikyqger/rqqf2fEb
         XlOAr969DLFYnmHeKVPY6gZbQkvLCR13V0kAPys52pRQKVTMdjH2occi6ZrRLOU2x+RT
         TgPjy7vauujvmeRlhifPRLqFXU6kpi5fs9Yv17Htx7qxFky4/DzZIGQ6XanIbFN5OEYt
         lRfMzsH3AXtuGb5VsrE0TVi/SXclt2vfdvLUwRkDMm3U9LVXevW76WQojWNGMdc4wBE9
         mMnnCv3DJlngkY4/qPIJ8LUot400zIaApzLG2m2dVVM4lFtBLn0vCtOmVxLXbv0Liz9c
         G9jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793156373; x=1793761173;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T2DPmyi1uKgewOwOxe3WhQYBJSJPRynqMh4U5o6K2t4=;
        b=nlYCwWTvmoc1evpyihJytVs4SYe5u5oCpdxz3QlCJmf4twhUPK3L5Ci/1aXO+tWotW
         +5tfTvc/W5OQgQpjYjFaWAiZUWLIRM4IcvhpndbzbwxiskCv4UaQpgmuXUhesU97cj2Q
         Fl2WJ4bVVogm00Dru7h0ofaClq3E4VooFxzpmgLWDnTldxpLKSxmpiEVtDCAoy7P0buP
         DQxw4+S2tt472Z+HBlNpkUIxDnvbwfizS9HDVNtX0j9Mk3iwagCdpTkOsmWUBRDMYcYE
         T1HK+NdR5zfK5vWNP9N6TQXjW4FsA1niCbTg1nSAmwWqYl1ivfZh564ShrZZAjF9CTnJ
         Eq6A==
X-Forwarded-Encrypted: i=1; AKwUvBxxshXwf/iBnRLFjfSq2epV/N+BQxVu7wNRkjBKehHeRZLKcdW9Cr7ret3FOPyHNKtCvYlseDF4rhVU3OE=@vger.kernel.org
X-Gm-Message-State: AFq9FYLaHqUpVP4m8svP08Qvzb30SPIvFae3vXdr9AEsuvlQTrUtD/Zz
	e/GM4naZjNZ/+po33Zz7k5VfHZqrG14iyJ0q2xbF/7b5YDSrsZ0I+uRTLKuClvhZoMZCQ6up0xA
	0Y47ZsbwIPS7kSl4DwcL91uylnJDhEas=
X-Gm-Gg: AYBFou2rICQ/30QZaXF9ERjTVl0pLrmn0jEVEfxu3uDTH6YJlZgYeRXrlArHS8KVzNk
	UBnIXio3Uimmc4dwtmjzcZnBIwGiaJ+MW7O/qhYZ3S9WFIaOCJ6YVl/36FbRw8v3nHckWOonD7O
	VCGeViXnKFOt5XZnJuHDYUC06UpgtrTZ07zzpgMdlFIm089ulZgGHniLafHNl76edNnX0H5WqqV
	OgS/6Jqxj0wpi88WAUVJvGILo0te1jkwgkMQ/LHdZizpf2PoPiLvxwu4DKCx+LMaJhVQeoyX+fj
	833AcvzGFzUUZ9Shjmp5eJMkFT5SEhQCZUaQn8KruU7g24FppRXjCaorOp5rrm+yVJnjQDySq1k
	3wO2rMamNN2fWmBf3mP25DFvJOSweg+YIO8Tw
X-Received: by 2002:a17:902:e889:b0:2e8:3566:b53f with SMTP id
 d9443c01a7336-2eb003bf1f6mr12865955ad.33.1793156373309; Tue, 27 Oct 2026
 19:59:33 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261026085352.4009534-1-shengjiu.wang@oss.nxp.com> <9b6c85f4-5881-46d8-b247-ae6bbfef8f91@gmail.com>
In-Reply-To: <9b6c85f4-5881-46d8-b247-ae6bbfef8f91@gmail.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Wed, 28 Oct 2026 10:59:14 +0800
X-Gm-Features: AclHuK-tGLoHs34jMEzH16dC5P2hcrMRxMtYOVpGan1D-YWjOsuDop2uhxHPtLo
Message-ID: <CAA+D8ANey+JLj1v0wLh9cAWCD93Pg+gFoH-FwZU49f4-6zS7tA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: imx952-frdm: support AONMIX MQS
To: Chancel Liu <chancel.liu@gmail.com>
Cc: shengjiu.wang@oss.nxp.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, Frank.Li@nxp.com, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 27, 2026 at 11:01=E2=80=AFAM Chancel Liu <chancel.liu@gmail.com=
> wrote:
>
> > From: Shengjiu Wang <shengjiu.wang@nxp.com>
> >
> > Add support for AONMIX MQS (i.e. MQS1).
> >
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > ---
> >  .../arm64/boot/dts/freescale/imx952-frdm.dtsi | 77 +++++++++++++++++++
> >  1 file changed, 77 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/freescale/imx952-frdm.dtsi b/arch/arm6=
4/boot/dts/freescale/imx952-frdm.dtsi
> > index 7785eb1a68fc..750046e1a5c4 100644
> > --- a/arch/arm64/boot/dts/freescale/imx952-frdm.dtsi
> > +++ b/arch/arm64/boot/dts/freescale/imx952-frdm.dtsi
> > @@ -222,6 +222,12 @@ cpu {
> >               };
> >       };
> >
> > +     sound-mqs {
> > +             compatible =3D "audio-graph-card2";
> > +             label =3D "mqs-audio";
> > +             links =3D <&sai1_port1>;
> > +     };
> > +
> >       usdhc3_pwrseq: usdhc3-pwrseq {
> >               compatible =3D "mmc-pwrseq-simple";
> >               reset-gpios =3D <&pcal6416 8 GPIO_ACTIVE_LOW>;
> > @@ -390,6 +396,70 @@ &micfil {
> >       status =3D "okay";
> >  };
> >
> > +&mqs1 {
> > +     clocks =3D <&scmi_clk IMX952_CLK_SAI1>;
> > +     clock-names =3D "mclk";
> > +     #sound-dai-cells =3D <0>;
>
> Above 3 properties have been defined in dtsi node. No need to add again.

Yes,  will remove them in the next version.

best regards
shengjiu Wang
