Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794326290;
	b=kHa+3fXgYbuJi/yAKe2EJ1bUtLQ+IP4yQG4suYtfcwe9ou1CxiiBLBRrIlNdiV2f5SEX
	 V57Zel4nZEmja6G3/pK/syJEjYtRex0cYMS71VRfUar2fawSYkqpGpwkhW+BLGieHYCHg
	 sod4dCvcjquBnpBaCzp6yvbpFpzhUzG3FJ1WHpjAa2Yke51gqXVyDzd67GCAd/sXQ8+aO
	 iYlI/si5uoGTdI0GcKjhGXp/3sBzWyDOF2VeTr54MuEJMeTwOW+qk3j0SRETkZO+1iA68
	 hH8mFapRRQ2wuQ1YF7uFsSxbKPPdpTCErFK3hE/AlnRM0Xx1SagmNnJj19RNHNM4nig==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794326290;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=EsbKpFcuLMq41Elq3siL6Ogks64uU5Zyr5ZlrtXoBoE=;
	b=lqG3Fs4ksxqRCDLNncqLc/Kk4ZAA1oI7tD92oIIDeR7d9pGpXCKlVdtdYVHk06U0Jx96
	 yax/iekTzMxnLi1f26Arbu6zStD00tLaEvrGCSEPXrZb8recvrfTiVfeoUADLImIo/VUL
	 nkH1mMWbuirQplOchJWe4J4NTouJY+Dj7T3L9ejI08Q5Whhzcym3Op+s+DePJLlUsIpel
	 62mURyS7Lux7jfOdwXpKd745fWlamuaeWs6aFp25PAqsw8hVZkzqwg330OhxNDE5fPW87
	 +VB3fKF6il3LE8LUu0sdrytuHUd9ap1GZ8n9XpbmqZK4pqDViCqtG7UPSOz6PztIk8g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Q79zNSdD;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8C2A606A331
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 15:58:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D8C2A606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Q79zNSdD
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48e1d0e5dafso1458803f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 07:58:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794326288; cv=none;
        d=google.com; s=arc-20260327;
        b=jBcBCVrBlRg/sMIUtrURrBD8fyy5E6Opyzs0JG7VA5yd19rzCZV0JhSjz+jfHYAxxl
         CtopKTP+N+ztLMDXI90MxMycxq4scFJxtoA/Fgw0M1NZ9uE9tWiaN76HT6hcS/vcM7/i
         eMItbEMfZpov+PumhvBHDoC8hSQly/gQOvIc4eusDlpFrgo5Ahk8ALHJvha95k/0AQw9
         oBpquhYTCqng07sh3VrW0uokRU+aG86/r8uDfvhgO/Lfr2W0oNifSOERY11wCCW1FKP2
         jcwL6TdLVMbZub1ISlETenZqRQ0BxbtCMSX3LH07/0rAZ6KbKrBtR3HLEDVSrm9iTNgt
         gOgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EsbKpFcuLMq41Elq3siL6Ogks64uU5Zyr5ZlrtXoBoE=;
        fh=fTA2UtpfAAGu3AWrqSM+kfNr+XUtEZz/ZBP2jMdZTZg=;
        b=bb+22rrX1lnO42DsPI3gzR/3j7LhG7Jqk83JyouLD7iYKFgJEKGCciozU/gjZTIaPS
         1KnSoDfQleM9xJ7qPX+g7rsUoCj0x5HqgKmPXejo6zYMPwLyIXgW3vDzhuLDnTKkl/25
         trkDvf/WHmX8uWCWDz5yNYRMa7ky0tZSfReFWgHUZl0GoEhSVugQtLo0SJZF4bRDzcGJ
         iYf3rbyq/3D+8t33ZIrayMWTMLOCVS1maCS8kqLWr7uvcHkBlid/xDTYe/nIxRke6Au4
         S5CdtlbWR4XaQyVELF0bDRHYPE9cqHYXRrEH+St3rJabHQI5paBfhw4bn7EC+Gj/Lihf
         J3Wg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794326288; x=1794931088; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EsbKpFcuLMq41Elq3siL6Ogks64uU5Zyr5ZlrtXoBoE=;
        b=Q79zNSdDUkIkW8QYnHL5dRfVZhyo3YrEKQe0HL6dhmDyhzaUk/x/kN+quabtnbkJkD
         05Jgvk/OGWba/oWsoXLOBAgR0aFnwUBpoItFY5UBERV9LY8mjnQ5nCx/tq9yOXdfD+N1
         qi87NmiMuLPmMsXvnnAVYUyr7h/hqDbpRr+hUTi3QbMIKNPzHAOPdqbXWF4BHvzIo81w
         3kXNcutCo7dJlu+8O+oPjQdjv/ZbNI5dNQXvbF1Nt5P8drlD5WmIDqN2yK88iDdwsJS+
         R/OAziKpJhTgLqQzRSaXm0y/4MzpZDfuD+0xpncEE+gWGkR6YGzKtxniDUCBwL7MMd7g
         4z4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794326288; x=1794931088;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EsbKpFcuLMq41Elq3siL6Ogks64uU5Zyr5ZlrtXoBoE=;
        b=n3mSBCvMqD6WRRZ05zOEGWeE5QcZGZmrYKvcyqIoaSliHoWMCG3DPxp7adO/pub2g1
         W2dAw6CWRHnCYwdJe/rU2lbOoF39MPFvWGJFlIUBzeAiM5BRJttSg+r3w1xQaTZ+Nm7Z
         inhn2IHnyBb0SWKX2uNCYWPq1Xu34sUBzUGNxfq4CT66Cp7vaZQoYUzfb14U/Y50HQqP
         QsJdXatD6e3IDblTATgMFSeS2nXlBDTzIvYp5EGZG09SuRRFvNWXKvJs7UK//FnEXKBQ
         m2PfyVOHTeRqihZekfqLFkV+4ndrV9TrmuA/qRPmnDCi9EgXCI8fqdMBU24+j0WvGIFf
         ImJA==
X-Forwarded-Encrypted: i=1; AL+hErEXjFW9Ico/fAHueUFFT3gLXWHDC9fk+U413XoMyApa7Cx9/38Q9fjno8RNyOcmhSEhU5YL6ObAkazNnqk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8nUyk/rYPj0kmOkwPfBi3BemgjFGUEfACkRF6nwLYSbBjicv2J
	RW7+PQ5r0TETAGmv3pQYr4tQIXoahmDF1kr/NdZ5CXPdbe+cxiIjuhOA022wSgEd0vWWQfAUe2E
	2z/ZyFO1VpSvsE2ahAP90chhjyFcJ+uE=
X-Gm-Gg: AYBFou0WUDIPPY/PKzXaJfDdbwKcIM/uJLT0UoRjSnu8jzTKDf7LYwC1CrSk0PVHOzn
	PY0LnZwF8IHw5hdqkU5I9kdD6fo4Wa66vma50iS34lbDsYtwieW2tjMUPUKqc3akcnehANOme+u
	f0zXA27ImfrjskdQZyJi9u8wrEpLu83vtDIrwhtvS/lN/uauK3/LMtSG6d76IY7KhclGUgd50xf
	OUh3FbzFlkTibGGCluMgUgb4sSuQ+vx6YqwBDlrgYTdEakFvO2rR4WCEmUtrY4Q87AYoAXeGNeJ
	BfYkN7wftrT23xYyVFVvGL3Ab1xmYTGm+54eipIeFntnTTCXEtZLWSm9WwosAOo+1eGUPk4CX8d
	C1lVwjaIyoA5xiZm7H4JXcstnpdYs1Yut8lu5Kd7WzQADL+m5e4zWTgaVxiSBjv3V1J82kmPx47
	MWMdYQp0F4RYJZDB86eUboqraCvWkkcDIt7QiKFSas3A1WFsqOa4C6Kw6rhw==
X-Received: by 2002:a05:6000:1acd:b0:48f:bbb5:61c2 with SMTP id
 ffacd0b85a97d-49835e20dfamr5690481f8f.4.1794326287951; Tue, 10 Nov 2026
 07:58:07 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261109114123.797741-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdXc=DRkGOhc75Zq524X9Rcc7OOMs6dy0rj0-zm+iFP1wg@mail.gmail.com>
In-Reply-To: <CAMuHMdXc=DRkGOhc75Zq524X9Rcc7OOMs6dy0rj0-zm+iFP1wg@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 10 Nov 2026 15:57:41 +0000
X-Gm-Features: AclHuK8VhXmMiM-0xoy1Quk2mtTjBlhaN-fEKwHUTOUmC_0XTYG3Vg7pF9M9bxE
Message-ID: <CA+V-a8vtcZA_51PmDVWMKsOWaQB+CVDe=qh2FG=6iH2Rf2szVQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: defconfig: Enable the RZN1 RTC driver
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, 
	Prabhakar <prabhakar.csengg+renesas@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Geert,

Thank you for the review.

On Tue, Nov 10, 2026 at 1:47=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Prabhakar,
>
> On Mon, 9 Nov 2026 at 12:41, Prabhakar <prabhakar.csengg@gmail.com> wrote=
:
> >
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Enable the RZN1 RTC driver as a module. It is used by the Renesas
> > RZ/T2H and RZ/N2H SoCs.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Thanks for your patch!
>
> > --- a/arch/arm64/configs/defconfig
> > +++ b/arch/arm64/configs/defconfig
> > @@ -1393,6 +1393,7 @@ CONFIG_RTC_DRV_TI_K3=3Dm
> >  CONFIG_RTC_DRV_RENESAS_RTCA3=3Dm
> >  CONFIG_RTC_DRV_MACSMC=3Dm
> >  CONFIG_RTC_DRV_S32G=3Dm
> > +CONFIG_RTC_DRV_RZN1=3Dm
>
> I don't know what happened here, but this is not the right location to
> add it? Moving between CONFIG_RTC_DRV_PL031=3Dy and CONFIG_RTC_DRV_SUN6I=
=3Dy
> while applying.
>
The configs weren't sorted, so I added it at the end. Thank you for
taking care of it.

Cheers,
Prabhakar

> >  CONFIG_DMADEVICES=3Dy
> >  CONFIG_APPLE_ADMAC=3Dm
> >  CONFIG_DMA_BCM2835=3Dy
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> i.e. will queue in renesas-devel for v7.5.
>
> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m6=
8k.org
>
> In personal conversations with technical people, I call myself a hacker. =
But
> when I'm talking to journalists I just say "programmer" or something like=
 that.
>                                 -- Linus Torvalds
