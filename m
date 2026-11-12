Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794489939;
	b=zQ2MLhc122Xr0i1zFkykdJdFZI/ELgtLaMqinnAxvAUBEPOEK7e1rzxw0Ohwgim2gqTo
	 wNlKcYuYKbM+ZFrGMadLehKx3Ji+vBp7J0hyDpol4cqB9DLOAB29ski0xNlfOCfawM09C
	 fMDvoANxcVUF3Xvz465iycHNs/WDwv6A5t/BF/6wbdtnW3hsv9rMQfBB33JnZI8P8TgMO
	 hvCvFaU4dL18MIG62V8wcWjJ+VYFg6deiVaj7O5HXeUpuJfrOVD05EAhXXIQpzwAH40io
	 ac0Snj7UBYxofHGCSel9NcXdaYPMcdgP+qHwOvrkAM7Ys3z9tZAAd1MHBEtg3B+ou/g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794489939;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=y7Re7D8sh20+8UvmpEtbEexH0DREKJTutui6y5r8LDI=;
	b=BPCqbKKSJpPUlxtW9oifG+IEIMtST1zcKLLbGLZxBRm2qLFq4aJSlIWTfUAYKZ2/m2WN
	 hnGRzhxjYEDK6HmkLft/Qi7oAylUOMESFxfQH43STff5gBkT3IqZVlY07nczBz0Z/JYD8
	 fWEaecw0+ruiukrTATrSzkmRT+c3NxzbAswN+u57qc10JrJ6ym5xg6TY48Cmw17vbB/1r
	 oys1OmM+YmIGk1V4n6eAa1NaI1yjqfA+jrpWxWam1FXl+OppAGdDGpvntNqkszR05Ikti
	 roVAklo5wYYt7q5Qe0DGl0DCaq0Es68Pz+v/d2BpZZ9+zBmyErarbGa3G01YB0/ZO6w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=flipper.net;
	spf=pass smtp.mailfrom=flipper.net;
	dkim=pass header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=u+Yela27;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.44
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAFFF606A321
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 13:25:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EAFFF606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=u+Yela27
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c5083bc0e28so76674266b.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 05:25:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794489937; cv=none;
        d=google.com; s=arc-20260327;
        b=VWOMnal/2cr1C0KmhXsBRmE4ZA028kNNDUbkoGOQ2l59BgId2/6YLxUlYKUmAe+z+3
         qPhATU8/Jxwybwg87fZHdI5G1sfwlM9rtWuLwpzXptp6XYjyqE5bUW/NqcqwRaNYmT4H
         cdJ4JkGuqDHgwf3l7Hyr0f6bF77tfxCYrKqhpB3jS2Qqtzk2195F1f8fYPnuuLYmY4Mt
         ARy8geZ8AcOrkVV+LxgWLUXP7VODMZKMAngdNJh7DapPXowhPm8JqEaX5wmnr/+3/CRW
         58EEkYLDthGXJpP8GX/T11rhxszo0fenXUnYOaHmi0FPf/qKRvZ897aNaApFetcwmhxi
         yrBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=y7Re7D8sh20+8UvmpEtbEexH0DREKJTutui6y5r8LDI=;
        fh=DjSfJlOmUNSvDR6FFCjOEf84djdSqOK7aSrCCF8go6c=;
        b=d5V0lgOl5iMkIK+BZIm2SHBn65dz5JTnscwlm80bN2rYY+FRaS2amr8xRMf5h01mYI
         ZR4JF62ed0CfsC47nNrpW4OFxw/hWpHeIOfi1voTuh+xhNPwEknWOIke0NuWnVRge1ec
         Qj3bgHoz1Bosln3BmutFNI6U0Y7gVg4I+ugVaP6oQaGcNz5ZSF4as1u3OXX/M+OO/Q7g
         jxKL2FjSdkT8UafmA3g4BurM90eEMsWMX/vz5gHtRPz3Nm2TQfhGOuUgnI9kaCV//i/s
         nNxdqD4T831uftQ1w36WHEc2nvu+HqffFyzviMmFfwkBeZIi3J7MmH1RrKZsB55ZS8bb
         rgjg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1794489937; x=1795094737; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=y7Re7D8sh20+8UvmpEtbEexH0DREKJTutui6y5r8LDI=;
        b=u+Yela27ys6WrC6O6cMeu8FbCzQ1GxNwG/t9Lv3qK2J01oLMc8YnEOhkrRQVrP50lc
         oonW0tndDuePWY2dgnEqV0N3/APvsKjyw5d/y95ft1LMbzTKx7h3LjfXl9clk6RoC9Us
         RRUX4Jlo/wede39EAd9CKmXpzyDucIJsQeuNRs6cqg7qkXDxoKHG/YB5XhS+bLoHtTsE
         dRbPnE523JDyuMkpSxGzlabo/HFRZDLwxRFZWA1lpLg/CcmETwKNwk/gCIECEtQ3zSrv
         nFfBGP4vIgGiO/pBr6ZjJ4ngeUqbPbZltyfz5K7B/RHtuz3jRS0SxN21KXhj3m/agjvS
         AbVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794489937; x=1795094737;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y7Re7D8sh20+8UvmpEtbEexH0DREKJTutui6y5r8LDI=;
        b=wc82oYJvUQ9HRgtS1sDsWSojZbS9GuWAi2mN5tPJP1J7UVZnT543v9wkOkClUIo1Y0
         gGrXxo82aR37kJFPeg6v+AnnVf8XNfEeEPxXKUf316Idh9PowQ3ttPwnaELpBZ1BoZxb
         35YTLFjl2g6Jz1MVv5voWkhKCs7hbxyumSeByNi3+jC0QNL9cgZRuyXNISM2VblAdphK
         jaQamSQ2rPhrSjdOySOrcD19wmaN6NZxZiDsxTUuZmayBWx4eLY8fCwroJ5tm0P7OR8+
         +uU01Wj5TbL+hXMIkQhFkonMv+OsLdP9k+Wn0LXIR02xDXoTb5aSyOCFhMMfmo4A3aUe
         vV3w==
X-Forwarded-Encrypted: i=1; AL+hErEcRTSdt7msX006IcQpKxuArovlcePft++81oik5IHLKaoaNBwwVB1l0/TjDSGaCLeI18lJH1Pl1zc0Ans=@vger.kernel.org
X-Gm-Message-State: APuU4Z+0D4CAONbID2eOkm1NRlfbAQYukmUiNX7Ukw03IgVR8+sBNMn3
	kakdSSDgpcAOpjewW2J2cpEaRJM00ivUrshsmNIRZdeqUuYvumhnq3WK3S1zTtCWBjU+0RAEUgC
	Uajit5OzjcAhjTJUt43zWCYnsHSL/QwZn9hCp2eg6sw==
X-Gm-Gg: AYBFou37J9KKQDEGMMjHgjwRsPaNp2nE/krvbGBrNbalrarvus48pk/ybHz9RxQr9X5
	kgQtFjsUYPJK0eDdyNv7qymdo8Ll4l2wwf3E+hfmKSn2TnRawhmL2mahrb/g5TSn0fS7xxPYP4/
	pargxuBataFI060ge/BTNvy9kRR7zxyyrdjzNJVxfQavUhCM+hORhTRr5zAF16+t5Ufqv+G3gbM
	njKiVilzaq3HdLGZV6EYtGCmuU4M/4PfzM0X6jHZkU3JkvDR1URsVDMVSkHMySchNKPFhs1JvF1
	bnu3C6cjMz7+K4peHyzN4PJFXEQQuqt92GxLgLZYOYUSoSSbbs87tLZZg1QVpC1VvTwij8Fx09a
	EeLq3yXYwzLCs2Sq+OGi+HUs2Fza5JPhY2MubpMP8P3SZIU+cCK/i1tma2cWT84qJ8AnN
X-Received: by 2002:a17:906:4a8e:b0:c50:750a:6a1b with SMTP id
 a640c23a62f3a-c50750a6a81mr275760466b.29.1794489937376; Thu, 12 Nov 2026
 05:25:37 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261106-rk3576-evb1-husb311-v1-1-99c2f57ea2a5@flipper.net>
 <dd59d491-82b0-4047-ae98-f8070f6be112@rock-chips.com> <CAKTNdwHbxnknob9NdjqWUcGU2fURO5B7V4kTTK+fvEYjNDOLCA@mail.gmail.com>
 <dd25880e-be2d-4adc-8384-fa4a7160a4df@rock-chips.com>
In-Reply-To: <dd25880e-be2d-4adc-8384-fa4a7160a4df@rock-chips.com>
From: Alexey Charkov <alchark@flipper.net>
Date: Thu, 12 Nov 2026 17:25:26 +0400
X-Gm-Features: AclHuK-ae6rK5KLX865N1ZAAiK3m-L1yS3bWzPXEljeOEVs3lx4mmzdXwRyUZxQ
Message-ID: <CAKTNdwGHS5M4yNKEqfKV8hEJRAYf3wnY1Z6jOWQx7e4cipTF9A@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: rockchip: Describe the Type-C port on RK3576 EVB1
To: Chaoyi Chen <chaoyi.chen@rock-chips.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 12, 2026 at 5:01=E2=80=AFAM Chaoyi Chen <chaoyi.chen@rock-chips=
.com> wrote:
>
> Hi Alexey,
>
> On 11/11/2026 6:45 PM, Alexey Charkov wrote:
> > Hi Chaoyi,
> >
> > On Wed, Nov 11, 2026 at 1:31=E2=80=AFPM Chaoyi Chen <chaoyi.chen@rock-c=
hips.com> wrote:
> >>
> >> Hi Alexey,
> >>
> >> On 11/7/2026 1:52 AM, Alexey Charkov wrote:
> >>> RK3576 EVB1 has its USBDP PHY routed to a Type-C port with a HUSB311 =
CC
> >>> controller and a fixed-voltage VBUS supply.
> >>>
> >>> Describe it in the device tree, including the wiring for both the USB=
 and
> >>> the DP side.
> >>>
> >>> This makes the data roles follow the Type-C port's negotiation, so th=
e
> >>> port stops being host only. It also leaves the VBUS regulator to be
> >>> managed by TCPM instead of being hardwired via the tangentially relat=
ed
> >>> phy-supply on a USB controller. DP lanes are also muxed dynamically b=
y
> >>> the USBDP PHY based on the Type-C port's negotiation, so the hacky fi=
xed
> >>> lane muxing also goes away.
> >>>
> >>
> >> Have you tested this? As far as I know, dw-dp driver does not support
> >> Type-C HPD yet.
> >
> > I did - it works fine for me under Linux with Sebastian's patches. My
> > primary motivation, however, was U-Boot, where the current phy-supply
> > hack breaks USB data role switching, due to VBUS being forced
> > always-on. With this patch it works, and now the DT actually describes
> > the hardware, as it is supposed to.
> >
>
> Oh, I almost forgot about that. I think it should be this patch series[0]=
, right?
>
> But I think we probably need more than just this series, because
> richtek,rt1711h does not register the HPD bridge, so we will get this:
>
> [   14.828983] auxiliary aux_bridge.aux_bridge.0: deferred probe pending:=
 aux_bridge.aux_bridge: failed to acquire drm_bridge
>
> Maybe you have already added the corresponding patch yourself?
> Another option is to use the generic AUX HPD patch[1]. :)
>
> [0]: https://lore.kernel.org/linux-rockchip/20260806-synopsys-dw-dp-impro=
vements-v11-0-0d508505f383@collabora.com/
> [1]: https://lore.kernel.org/all/20261020072816.180-1-kernel@airkyi.com/

Yes, on my daily-use branch [0] I've got a local commit enabling the
HPD bridge specifically for TCPCI (69b7c806b334). But that's all
driver territory, so out of scope for DT discussion ;-)

[0] https://github.com/flipperdevices/flipper-linux-kernel

Best regards,
Alexey
