Received: from mail-yx2-f12.google.com (mail-yx2-f12.google.com [74.125.224.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06EC735F602
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 15:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789140101; cv=pass; b=jdv9DGVKNaJFYgmT1gn/+KQ44AiJEsogREBHAj+Hc7UJaG4Y9ZO/8F99cpu2lZd60zcWtVjSMXhK7GyEgBpsGFwwbswA+SFVaHU17zpoYuQ8368oYQ65yUT7IxCJM3KXPoNbH+M0RSP5Z5JQ8BGQVXSC0xHG7fZuOvb9MUMi23E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789140101; c=relaxed/simple;
	bh=X73qWbgasVwFRCsdt41DwsiJOL71A/gEluZDRHMXGw8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e3fTWIVKVomcCyVR7eGvus6+9+4g2lSZZvidO5AIMZS2FjVLC1M/VEXNupuwaxIphXcNf1pPjK9o3iILl6RNBs9jRe8IaP3o1zSjZnzHdFrhMTjfV/PLy5yt6lrdnzr6aevtIuFmIZeFa2TyECjGz8jZtcZBbUML16H2xYpr3Xo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=CoBm5puH; arc=pass smtp.client-ip=74.125.224.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="CoBm5puH"
Received: by mail-yx2-f12.google.com with SMTP id 956f58d0204a3-66e4aae314aso822695d50.3
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 08:21:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789140099; cv=none;
        d=google.com; s=arc-20260327;
        b=RXZIjgGMaoBqgUxP0n2mMZcFl72+J0L1tHmvCyP1S0InnBObja19D9ycebR3DJ30W/
         uI4lMlw56GxaS51xovWpViNltpZ4go9LxoH5bAnftA7/pZnxmBnjS7DH0MPKSdKJ5GWs
         X3fDfKtT6xnk8xXId6CeyzSFws3IXoQ4AR0zwGqfPp5pz8avJLDQNd8QPmfFhluNzfYm
         ptgX1K/MDHog1fG7bMjyoD8wmbqUJQZHvhP2fYxU3cVnAXHEW8Ca2dFe+09XLADnqB4C
         vTWTJ2HsEclglZEB6je+5h2RE9ADlKLIwjauDayAhjWqB5bvUPsxhuWjB0wyqx9zqAXr
         Vkdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FkkSMxc0+XLFGXfcobgYJWMCi6rudZ0wwsjRC0+wmrk=;
        fh=ohGG87yPm30PFqReiHQ/dftmijcLWLIDAbVUtP7hhfc=;
        b=CQ08vxoG0lpiGNPgocAXSyrCtVv1Lkk/m1Yn9x7/BGRLnnHqfz6GsnsrDiTBq6ODae
         9wLoZE2ww7+2glQbR/unCevYvpxDpVaAKejFne9AfQKgHjmFyHvcCCPudTmDltfevfdi
         KnDU++z754Pl1aR+MajPViaAfVEMmIeVpNspdWpTmELEQsDeHLZ6tHYdOcK12G/ikuqx
         6+MfIuuavUMzk/mhpiuAxmzrjnigAI2/v3HCBmFb0Lr1q0X4oWshboJkblIicvHYzgGl
         ip+knUDgYK1enQs/yUlAvR0xOZHo5DLSMs7pGZCQTq4nIm1LPtnN2R7Wc8TBDaZTWSeD
         S+8w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1789140099; x=1789744899; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FkkSMxc0+XLFGXfcobgYJWMCi6rudZ0wwsjRC0+wmrk=;
        b=CoBm5puHJ6qxzoETT8/f+7HxgqqC9zi1VI7IyPTQ5Z2iiWlVhWl8311sVr2qckRCDB
         2BvWKTu11gNOMRVm6kNgcX6kDnGMtz19MR6Yr1K7LXQMuws7TBZxpoHC9Pi3SKMFM+at
         oV5Ny5R/wi42XLoh7Wk+OTbAiUHV5dK17f0yY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789140099; x=1789744899;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FkkSMxc0+XLFGXfcobgYJWMCi6rudZ0wwsjRC0+wmrk=;
        b=pB09FfeKIc/cV7dwu5+vs8RjIiVH1C+073XRDzboaO6HSa5H2t9vkijwOdShUCzLY+
         87wIOJQLFPBNINfB+9fxlzjnnJa62a5uhj5gF8mzqmxs0vS9sJ16MNN0OpZ2vf8Tia7f
         bU3Wl+ucG9uSsJ2gjj9+Q0NFUnbZjjQAu1urN1XIZZtSEhbK2n7xBK4Rxf/9i/8Aiz21
         lWFPHHSUuKEARPoemDGaMjZvHe+TVXPiD6VT+Gtmqit3lyIa+ezjT1slwcdkdBn1YYeE
         w1GInbIQO9S6vkmmLNUPQgtaXA5UZwaP2v+FAXER5TMxW3o6Q6hXZC+tuRcCYlrYvOw/
         f1Qg==
X-Gm-Message-State: AFuF++ldEZXUcnjGitH+h0qNe8Ywl/Jh5XYuocYMjbJvLAa5Sjlni8NZ
	EOVurUBrrOWEitmtfV9P5lkvuBGsCvQ/2IoI8iZklX67o2FA2jn2ybNQuYOihUON0PrbGGk3Xcw
	zo4likvHRyijM5FRbM5eZAnokGw05iAz2yxgIWQ9rzQ==
X-Gm-Gg: AYBFou0YZjlsTnL9nA/r6uI87u7yepEgPaEeXhK1P7TORQ6tdXduMp5fMm2g6ygX+Kf
	zov5ZGYUE0r0Mr7cSYZSIFK25PwlkfVl9mrHo5OSuIYQakFArcCMhARIcUzJIRQRv0o2ujLEeVJ
	MbKjGWRTJ2wEk+/MADh35WhdkMoaUtcKnQ3wfcdgJq19SxpWOtnh9OxTH3taPYfmxM12+I/55M9
	ixL1JwHxIaUNwyarqcJPMqtxJhW6+J1DCTMJ3BHXtdNdozL+l9vzdfQPix/1lcE8fvf377K8dvL
	9MlD22ExXmx6eIeQFUo7KnyYsqwub+1CtdgLo6blXM3rbGZS1WlZZtiwUGYYZOCsalllelI6xQI
	fjd08xQMbUQ==
X-Received: by 2002:a05:690e:4549:20b0:66c:ba49:1316 with SMTP id
 956f58d0204a3-671245483c7mr1612948d50.10.1789140098875; Fri, 11 Sep 2026
 08:21:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260820092143.44829-1-dario.binacchi@amarulasolutions.com> <adc7f285-6269-487e-bbcf-d157da49f379@foss.st.com>
In-Reply-To: <adc7f285-6269-487e-bbcf-d157da49f379@foss.st.com>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Fri, 11 Sep 2026 17:21:27 +0200
X-Gm-Features: AcwNN1Ulqxcrv_HW3Dh6aPwZRfGOKMd7-GxKs7PSgQjZfT6GRUC-E4KDQ90Z2_Q
Message-ID: <CABGWkvpBT5xg3BKXAn01rxcpc8E4r238JQxx0YsYOG7Xvg5_LA@mail.gmail.com>
Subject: Re: [RESEND PATCH 1/3] ARM: dts: stm32: add missed
 arm,num-irq-priority-bits for stm32f429
To: Alexandre TORGUE <alexandre.torgue@foss.st.com>
Cc: linux-kernel@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, 
	linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Alexandre,

On Fri, Sep 11, 2026 at 4:32=E2=80=AFPM Alexandre TORGUE
<alexandre.torgue@foss.st.com> wrote:
>
> Hi Dario,
>
> On 8/20/26 11:21, Dario Binacchi wrote:
> > Add missed arm,num-irq-priority-bits to fix below CHECK_DTBS warning:
> >
> > arch/arm/boot/dts/st/stm32f429-disco.dtb: interrupt-controller@e000e100=
 (arm,armv7m-nvic): 'arm,num-irq-priority-bits' is a required property
> >       from schema $id: http://devicetree.org/schemas/interrupt-controll=
er/arm,nvic.yaml
> >
> > Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> > ---
> >
> >   arch/arm/boot/dts/st/stm32f429.dtsi | 4 ++++
> >   1 file changed, 4 insertions(+)
> >
> > diff --git a/arch/arm/boot/dts/st/stm32f429.dtsi b/arch/arm/boot/dts/st=
/stm32f429.dtsi
> > index ad91b74ddd0d..f94500cd90cc 100644
> > --- a/arch/arm/boot/dts/st/stm32f429.dtsi
> > +++ b/arch/arm/boot/dts/st/stm32f429.dtsi
> > @@ -794,6 +794,10 @@ rng: rng@50060800 {
> >       };
> >   };
> >
> > +&nvic {
> > +     arm,num-irq-priority-bits =3D <4>;
> > +};
> > +
> >   &systick {
> >       clocks =3D <&rcc 1 SYSTICK>;
> >       status =3D "okay";
> > ---
> > base-commit: a4ff2be345d0abc943da8dd8da98151843b750dc
> > branch: stm32-nvic-irq-priority-bits
> >
>
> Do you really want this patch ? MCU boards are deprecated.

You are right. I agree that this series is no longer needed.

I wasn't aware that the STM32 MCU boards were deprecated.
I noticed Arnd Bergmann's series, "[PATCH 10/13] ARM: stm32: remove
stm32f4/f7/h7 MCU support", after sending the patch.

Sorry for the noise.

Thanks and regards,
Dario

>
> Regards
> Alex



--=20
Dario Binacchi
Senior Embedded Software Engineer
M. +39 328 0625246
dario.binacchi@amarulasolutions.com
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95
Amarula Solutions SRL
 Via Felice Cavallotti 25D, 41012 Carpi, MO, IT
info@amarulasolutions.com
www.amarulasolutions.com
