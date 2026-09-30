Received: from mail-yx2-f43.google.com (mail-yx2-f43.google.com [74.125.224.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DB0650EBFC
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 16:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790785911; cv=pass; b=UNzzYPW6cPJ3z02dxWIOJWpPyDZIogKAc5UWH/rXmrciVXJKTZhN2JhLQAsU1hWlQoK6iYbx4TGVo8Gemzfv8Mtdf43cNQroaMTQSPurAwABofDTjUyC+JakJbNjIMta646+wqbAsMQ3uqKGzTId5VWaNcQnbRTckbPFQgb6DPk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790785911; c=relaxed/simple;
	bh=MA5Z03Ujg7k+1Xpvmgu/oagug0WaGjFD0FDkj7II4qo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sMky6uVz4jkFHNkZih6czY8ptimF9G4AGjgM9ZSrOoeeorCqH73f0eQyTtMPd+t4M0GMqU7sSAL5iwhg28sLincZj9DHnhsct4juypSDWMPdWAlq7jBqWp37jEE4ihComD3d0vORSMlNiWKmRepRTANqUmfaw7XxDr1Vyvb7dHc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DYtXWDiB; arc=pass smtp.client-ip=74.125.224.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DYtXWDiB"
Received: by mail-yx2-f43.google.com with SMTP id 956f58d0204a3-66e4ab201ebso5386413d50.3
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 09:31:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790785908; cv=none;
        d=google.com; s=arc-20260327;
        b=WMfdoyh2wddC/FqMxwnqgcelyBYGPpuSebYp+JKJwGFLrERDmtUrLa7dvEItTD3mzE
         VTEyNVeFikW9G21ha6wOlpm8yawnAhJXQUAjbOoDm5RXeEVXrXzYhQWa+AT366EdftUu
         J8em7lAkqe6wWloJzx8Y4YSv3t2fuLdZO1YLp+VKrY1Nkfm+GQzcCrt1IBxcSvp70dvu
         eBgNou80PxPObcjKmkhv2R25946oypK2L3Y5MDo9dkJM4oOu/nVeBB8zOEQWAXACgK7n
         wHtM3DleNcItohbXWuxZEtad10gDmlMjaby8FCtQRcFtePM164FtYozaTxEjR03v4olF
         JljA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kBFSz8Hg+47uuDgA4INkTekVz9fv548HRY4ltJTPkUw=;
        fh=OrBK35lSbSQAs6o1tLU4SA0lLjOlgPzAhCOKI1QeZnE=;
        b=fCZYd7lbcFptWFdtpFxOdkdyEFHPvlVsRi6v2M8WpLXY4scddQhRXTG29lLjNwzBub
         ABVD0Gh/jGkvqnnYG44STy7JTdlbF/paImCNqTmWyUkzg8uGwlum3UB0250Mj3/Wir8G
         wt4ScdXZ5oSkExtDJm/KTngCNVLe06nOuqbHI0UJHGxP2mKSnaVgFoTxPhlS0HlTgpyN
         kdPkOpCbBTLz2uhH1bt7uskawLMW4m90wQsAHVI6bbpQ/Zo84RVDrVMROBZUirKtUfII
         feYaK39IHGezTE/VufKWMb8owj3jRKb73EurXMxSiaDJPFk6dIeAmg/QrN7wGM8CvDBr
         Y58Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790785908; x=1791390708; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kBFSz8Hg+47uuDgA4INkTekVz9fv548HRY4ltJTPkUw=;
        b=DYtXWDiBUDM6xXO6F2f59IbfQTkjZM8XBEyoBi966dpqSQuUumWizP2K6+3GmVcvEs
         ySZvpNj/N6hbo9WrfOULPtAqHeAZkC1nDKF7EIWtVdCWHFLAp4mwkLQFlRfDtQiIsKGx
         UEvJPwDFxPVDz5tJj+lPcRfTLN4dJpIdLYAuyoXCVdsv1m1mlfVQgcoMMGUbiPd5602V
         GkddD5ZMtIliRuk26CyndWq1Ewd+5Vk9eezJcfUGx/KOGW2c7HkJcMSo3tN5fID+d+tS
         X4286eBeEw+SQpxqfXy/QoEfxhvLHw3HpT5S5eI8aM5DqEzIfYsuIjn08CpUjkxcYOhd
         ZB7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790785908; x=1791390708;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kBFSz8Hg+47uuDgA4INkTekVz9fv548HRY4ltJTPkUw=;
        b=f3BL8QBa4A9VHPJAIEnfDYOJ0mpSKez6Gi6oNIF0OpdWwkcH17OJRYos22X/fG/44H
         QQXEktMqMCD5oQoiyjqQCzeIuhKouGcTg2gdf+k3xmSH6+L6capKWqRPiRUCzLuuEPh4
         EAyCVQZYt5xf9P/zXKO3nwUKw88m+PpPmZDmXGZTINAXBEcbEDLlzQG6UTdskMzZr7WC
         57TsECK6DXJSurge3seZbPfQVydbC6zVB69RkAJbLah4cmMpSckBGYP9zRjA8bNDtm1Z
         iWN8O7DxWsYhwXT6pFKUcKmWnr9szOsc3LLvA1YNNpBNmL87eFnU3M09yf9HscOXpB+K
         a1iQ==
X-Forwarded-Encrypted: i=1; AKwUvBwhBoYwo9s8e4vyMgbsGhIG+W1ykUquSkgfhiC5LuaO+5XWDHTh5sh0e4N1rRkITzfa7YLDXwxF57IZVY8=@vger.kernel.org
X-Gm-Message-State: AFq9FYIxjObAt+umqUb3If9JjiM8Ftu6BcCjhAQiLCHsRTrX6vq/dr5b
	I/+VWFi3NQMJrkYPRbPGqWlQIzEZnUj0raCKTfbkVtYWM2PjcK6o1q+00mwmIv/C1FucYfKcCAL
	1vvWJ0XvWNfWzyZaD+g1a2O4+fc0Rlf164R1XXiwWZA==
X-Gm-Gg: AYBFou0WsREEfQWu6+gJpKEOgKHgweiJEhV0IIVRSecRLneDHQU9O6bxqPp9cTN4KW6
	YhofKhQSSBNa8mvSuA2tX4vxEaYFygLeX9qBWDVBCKsHhW59gmmzvFG7tFOmEsPZXqEt9CQqdUU
	BgwAvuQUjsvV6EvfAfZmSsV2DvDyrJN7IfGUyu++F96WEn/jlEKrEG5/S/FRp0Qh060vPd6yez9
	0AhDU29/W2mPRM4VR1vXIy95M0zlboJQrIrQTwhqT1iQo/5DLsKWJDXRAr9ZJmcLF93EAGTaPTj
	QFK8iD0UWLXmvWRACXHa1SULLTY4iYqbEXq5SzOKNX8+tOU+cEgFE5wXgot+08uL
X-Received: by 2002:a05:690e:408b:b0:672:99e1:11e7 with SMTP id
 956f58d0204a3-676834ee0a2mr951729d50.132.1790785908030; Wed, 30 Sep 2026
 09:31:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260727-sm8650-7-1-bonded-dsi-v5-0-c042266b9eeb@linaro.org>
 <20260727-sm8650-7-1-bonded-dsi-v5-6-c042266b9eeb@linaro.org> <CAD++jLm2dVVKM075MDoStTudO+2hdECS-XucFiMGnM1H-Xk=TA@mail.gmail.com>
In-Reply-To: <CAD++jLm2dVVKM075MDoStTudO+2hdECS-XucFiMGnM1H-Xk=TA@mail.gmail.com>
From: Jun Nie <jun.nie@linaro.org>
Date: Thu, 1 Oct 2026 00:31:37 +0800
X-Gm-Features: AclHuK-Ut7huYikkw-ut_7tEiGgl7jCeAuf3fgmv1fyl04iaoD4uVhF3GKH3maM
Message-ID: <CABymUCN1oxuqPi=s1cpBHvMJorHN62uieD8Pf=Y--WBPp-=NHA@mail.gmail.com>
Subject: Re: [PATCH v5 6/6] drm/panel: Add driver for Synaptics R63455 DSI panel
To: Linus Walleij <linusw@kernel.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
	Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Linus Walleij <linusw@kernel.org> =E4=BA=8E2026=E5=B9=B49=E6=9C=8829=E6=97=
=A5=E5=91=A8=E4=BA=8C 21:03=E5=86=99=E9=81=93=EF=BC=9A
>
> Hi Jun,
>
> thanks for your patch!
>
> On Mon, Jul 27, 2026 at 10:09=E2=80=AFAM Jun Nie <jun.nie@linaro.org> wro=
te:
>
> > +#define R63455_MF_CMD_ACCESS_PROTECT   0xb0
> > +#define R63455_SEQ_CTL                 0xd6
> > +#define R63455_DSI_CTL                 0xb6
> > +#define R63455_DISP_MODE               0xb7
> > +#define R63455_GEN_OUTPIN_SET          0xb9
> > +#define R63455_DISP_SET1               0xc0
> > +#define R63455_DISP_SET2               0xf1
> > +#define R63455_DISP_SET3               0xc6
> > +#define R63455_DISP_SET3_2             0xcd
> > +#define R63455_DISP_SET4               0xcf
> > +#define R63455_DISP_SET5               0xec
> > +#define R63455_DISP_SET6               0xef
> > +#define R63455_TE_GPIO_CTL             0xbe
> > +#define R63455_PPS_SET                 0xe6
>
> This is more details than we usually get, which is nice.
>
> > +       r63455_dsi_write_seq(ctx, dsi_ctx, R63455_MF_CMD_ACCESS_PROTECT=
, 0x00);
> > +       r63455_dsi_write_seq(ctx, dsi_ctx, R63455_SEQ_CTL, 0x00);
> > +       r63455_dsi_write_seq(ctx, dsi_ctx,
> > +                            R63455_DSI_CTL,
> > +                            0x20, 0x6b, 0x80, 0x06, 0x33, 0x9a, 0x00, =
0x1a,
> > +                            0x7a);
> > +       r63455_dsi_write_seq(ctx, dsi_ctx, R63455_DISP_MODE,
> > +                            0x54, 0x00, 0x00, 0x00);
> > +       r63455_dsi_write_seq(ctx, dsi_ctx, R63455_GEN_OUTPIN_SET,
> > +                            0xf, 0xe4, 0x00, 0x00, 0x00, 0x00, 0x00, 0=
x00,
> > +                            0xf, 0xb2, 0x00, 0x64);
> > +       r63455_dsi_write_seq(ctx, dsi_ctx, R63455_DISP_SET3,
> > +                            0x08, 0x70, 0x28, 0x48, 0x00, 0x00, 0x13, =
0x21,
> > +                            0xff, 0x00, 0x0f, 0x01, 0x14, 0x17, 0x00, =
0x00,
> > +                            0x00, 0x02, 0x40, 0x0C, 0x00, 0x00, 0x00, =
0x20,
> > +                            0x00, 0x00, 0x00, 0x40, 0x00, 0x00, 0x70, =
0x08,
> > +                            0xD0, 0x02, 0x21, 0x6F, 0x08, 0x5A, 0x00, =
0x00,
> > +                            0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, =
0x00,
> > +                            0x00, 0x00, 0x00, 0x00, 0x00);
> > +       r63455_dsi_write_seq(ctx, dsi_ctx, R63455_DISP_SET1,
> > +                            RTN, 0x86, LE16_BYTE0(VBP), LE16_BYTE1(VBP=
), 0x08,
> > +                            0x70, BE16_BYTE0(VFP), BE16_BYTE1(VFP), 0x=
00,
> > +                            0x00, 0x08, 0x3B, 0x00, 0x00, 0x19, 0x01, =
0x22);
> > +       r63455_dsi_write_seq(ctx, dsi_ctx, R63455_DISP_SET3_2, 0x00);
> > +       r63455_dsi_write_seq(ctx, dsi_ctx, R63455_DISP_SET4,
> > +                            0x8b, 0x00, 0x80, 0x46, 0x61, 0x00, 0x8b);
> > +       r63455_dsi_write_seq(ctx, dsi_ctx, R63455_DISP_SET5,
> > +                            BE16_BYTE0(VID_VS_DELAY),
> > +                            BE16_BYTE1(VID_VS_DELAY),
> > +                            0x00, 0x00, 0x00);
> > +       r63455_dsi_write_seq(ctx, dsi_ctx, R63455_DISP_SET6,
> > +                            0x00, 0x24, 0x00, 0x00, 0x1f, 0x00, 0x00, =
0x00,
> > +                            0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, =
0x00,
> > +                            0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, =
0x00,
> > +                            0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, =
0x00,
> > +                            0x03, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, =
0x00,
> > +                            0x00, 0x00, 0x0A, 0x0A, 0x00, 0x00, 0x00, =
0x03,
> > +                            0x1D, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, =
0x00,
> > +                            0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, =
0x00,
> > +                            0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, =
0x00,
> > +                            0x00);
> > +       r63455_dsi_write_seq(ctx, dsi_ctx, R63455_TE_GPIO_CTL,
> > +                            0x00, 0x6A, 0x02);
>
> So for the commands above we have a little more knowledge than just
> opaque numbers about what the display controller is doing.
>
> If you have a datasheet for this display controller, then please add some
> one-line comments before each command to explain what is being set
> up.

I hope I had datasheet, but the answer is no. All I have is an init sequenc=
e
with the information in the above macro definition. Let just live with it @=
_@

>
> It still bugs me that we accept this much magic numbers in panel
> drivers but I guess I just take a deep breath and live with it.
>
> Yours,
> Linus Walleij
