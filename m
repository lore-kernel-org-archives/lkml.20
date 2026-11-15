Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794762098;
	b=bnr9wp/7HN2Nb0CdG75EffH1BBllgaiNNY0XbmuhZ4svkkpFtu9pGLWFpUag8I5kKOQC
	 D73HltKmly6wMHYj9m7pXyLPgBwp1zWozS/aLqADf3/vm8e1pXeafzCLWnw7y74f/EgFU
	 bFAsmh8c/p93I6KrWqpMgGY7Wsqo5MtLGqZqZr9bJMXKJWl1atlJKZo5Hciq8WIbKFGV2
	 3MhWQxKP6wl2ex6p3fYCL5NGyx8VuD3xBMigyW3dfqf/DXO+ZmuF8XrSDcBwm3r40cG8A
	 JugvM3eH0mT/GA/FE2nxTbHOsg11TJRE6QOcwlzrgH6aBli3/9Rdt3ZQln2851fsC9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794762098;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	bh=Y9ebx/NeQHDJ2vvkvIEG+xSfxmCUF1LYcJcgNXG5cuE=;
	b=tDskx6Epr9rv/E2nZkFXaI4Ikb5fMciobnGF0fx6vchqx3FE0ZLFjq5EVEHlIwZFLs6A
	 RMBBCtq4k1q4eud8AxiLQjmsHBp353lKlzKh7d0XBwZwJ68uDAEzZ30LqkUqKJadwFZPO
	 ISZNoVV8CZ5Ms6kFzdHIyUrqiFFFfNRY8RMfSPT1adr/YXCYNXTrZF1/zlT+JTqMWsksW
	 Vq7UJYHaRiNoo7EBYYFh7piKH3ZGJ7/7BQ0T4poya6SFnhIbwq17vgVzdLHrA0Xv6NTm6
	 4vjoWuVPFH7jys+uAZEb4tzj9PUG5u7rsollFDtqah5tj+eH/IA91/HhIWhaWjVES/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=P0uPOeqg;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 907F9606A339
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 17:01:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 907F9606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=P0uPOeqg
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-49412eb1474so1239246f8f.3
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 09:01:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794762096; x=1795366896; darn=vger.kernel.org;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Y9ebx/NeQHDJ2vvkvIEG+xSfxmCUF1LYcJcgNXG5cuE=;
        b=P0uPOeqgL+Ozr22vFeYw8xScHK88O15rGxbv8FwzdKQ1nyYB9uluioHIEs1OU2SJDX
         vvoXbaXRN1/h7HX+g9bsRS9InHpDtO0bStHEJykILzxQH+E+BYPxq7BxULvnFiOMM6b/
         EACPMneJmTYOZDrPQawB75GstchrzjB4CU3VSMt9GanIAOcMyP561Om1k3txjjG5GoB8
         WTdnUFOS/SY9NKHS/xmwy56RdSUxsu5o0bl6cl8LFPm9qGyac0DCnxBMRsECx7BWIVbM
         c6HyNeKAJ8+3vOTKkuyYF0SQGRXFuLFGzc42HntptA0+5WA/jcs2/hTinq/wZ8yHuO0z
         JOkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794762096; x=1795366896;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y9ebx/NeQHDJ2vvkvIEG+xSfxmCUF1LYcJcgNXG5cuE=;
        b=V/dETLlyRaPHj9/OxA8QERrJcxJuxs2R2HfWBmj9uND0yPWJo8HFPP/ytiqk0w+I94
         cRwGwtMcX6kpsMrlr1iVm4keuebbqm++UqmUJotM9kBRqHK0X2MteGUlTExZrR0WMC/6
         CgKLI8UzlTX1ALXTvLc01lvVX++o6obfV03LC7c5wAKFA+9BAJvZeAWviAeqhVUPZR4A
         0+05TFUx8x8g0WlOrAKgpW9HhjfByE/0O7Why2mmmZTLL6ulvyPB2z5uUfg0E1I10Yi6
         mWBqVJjVXCReU5kyhqA0WPEPIizZ1/Oq2HDaLyKmlWCWGV6QgCMvEPD7ssXVP6ZC+U89
         ap/g==
X-Forwarded-Encrypted: i=1; AL+hErGFhtvj/8PCBmpL3Qwdt11YuWyz0iyZDPajVU34xkdP9CLTxM30WGb8AcKMvv0mwUF4HM6TmWLQyejEi8M=@vger.kernel.org
X-Gm-Message-State: APuU4Z/dCU16c/r230PYBobU/GYq26SdrIu9xbq3YITys7jHQd/2L/AP
	fQU4nAcLBYf+bs+LTAA8W8ZWLw6g5IYlA7lyVItO+QE4ZqVim7nYDA25P0Gh7ZUU
X-Gm-Gg: AYBFou0iIDIP2j4QOJhMj7CP1tVx01meYG3Qt1shV+JCwZVmVYKBbBPtGJskHT8XI5+
	02yd4QLgDVdC08gmgNrJ6Cpy9aPkNfFKMlQBP0QqJjIENfnH74rK247ELJejXkV8R04Inm1p8v2
	aojDUZWO7zMiYo8F5bYMXBzy3nv+cbmjBtAnHOilnGmn4UwoU7rZ6wMPxgdOwoM9TSmzKLhx7JW
	pzmjJn5HtUW+o7RzNmdDYrSLD81Ye0UR2XpoA2ByNCwxw/Bqb4UaW4VFhyIdbSICeQD6kIdSvG8
	TYmS9DARHKwG7J975uOjMTQb6TZxRaEX3Ee9CJ4ctk2AJdGizI8ud9aeOLQFJK6wSeewiRP7jN0
	EgK11MJif6pVxoEgscWYFUEYLJvjY8ko1MR4L1cOE5RshkjLcIhRlqh5yAngdqmnkL5R+xuwcME
	oZyTBCE9EMaUYQkXuP2Ks5cuVdEoTPDzvpSh5OVYFiH95NMc23iK3Tppscik640NCa/Ox/zhGb4
	Sy/JIMmED0pkoXm5Jj/d4Ih+fTVHa2zEXLCH4ZJdfk419klRSIEi7o//SSESlqIhC6X86MUODUW
	DJj5z/+Y9oSc0O91jhkhcktYNMzMc6XmvOguZcmYMZSVHTqtx/SUhrRF+GqNQZUlesL4qZLzN9R
	Bk4NV2ZNSpAPKQ0Ntk4VckSFBYcBhbbi8Gu5LafxOGatgRUU4TPAKLTUnhff9CD1Oj5mapNXjbl
	pjXfuKZ9GwcaN7Md08GYKDzC2ytEP+NhfLiW9pg/7O0Yr2kJnEzlDIgjvwSratNtPPtLxgnGAUZ
	VREYHex1D7L8W+uXlP6+XU+Bg==
X-Received: by 2002:a05:6000:4a1e:b0:48e:61c9:4e32 with SMTP id ffacd0b85a97d-49c72ab0820mr17765285f8f.32.1794762095871;
        Sun, 15 Nov 2026 09:01:35 -0800 (PST)
Received: from jernej-laptop.localnet ([2a00:ee2:6a02:9300:bb69:6bcf:1b11:e85b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49d69c21a17sm12650661f8f.50.2026.11.15.09.01.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 09:01:34 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: wens@kernel.org
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Samuel Holland <samuel@sholland.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH v2 3/3] arm64: dts: allwinner: h6: orangepi: Enable CPU frequency
 scaling
Date: Sun, 15 Nov 2026 18:01:33 +0100
Message-ID: <hUUAMPreQkqgr8nLJGKykw@gmail.com>
In-Reply-To:
 <CAGb2v66acxKq7HR=p+ky7dhT03fTXct1_82dPXu5ebS-fYgpvA@mail.gmail.com>
References:
 <20261115132215.289236-1-jernej.skrabec@gmail.com>
 <20261115132215.289236-4-jernej.skrabec@gmail.com>
 <CAGb2v66acxKq7HR=p+ky7dhT03fTXct1_82dPXu5ebS-fYgpvA@mail.gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne nedelja, 15. november 2026 ob 16:09:23 Srednjeevropski standardni =C4=
=8Das je Chen-Yu Tsai napisal(a):
> On Sun, Nov 15, 2026 at 9:22=E2=80=AFPM Jernej Skrabec <jernej.skrabec@gm=
ail.com> wrote:
> >
> > The Orange Pi One Plus and Lite2 lack the CPU OPP table and CPU supply,
> > so the CPU never scales its frequency. Add both, like on Orange Pi 3.
> > OPPs above the regulator constraints stay unused.
>=20
> My review agent noted that some of the other boards raised the constraints
> when CPU DVFS was enabled. Do you think it's reasonable to do the same
> for the OrangePi? Or do you want to be more conservative?

Yes, I'll prepare patches for raising constraints.

Best regards,
Jernej

>=20
> Note that I already applied this series.
>=20
> > Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> > ---
> >  arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi b/ar=
ch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi
> > index 40c5c42b347e..a2a2e4cb0256 100644
> > --- a/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi
> > +++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi
> > @@ -5,6 +5,7 @@
> >  /dts-v1/;
> >
> >  #include "sun50i-h6.dtsi"
> > +#include "sun50i-h6-cpu-opp.dtsi"
> >  #include "sun50i-h6-gpu-opp.dtsi"
> >
> >  #include <dt-bindings/gpio/gpio.h>
> > @@ -65,6 +66,10 @@ reg_vcc5v: vcc5v {
> >         };
> >  };
> >
> > +&cpu0 {
> > +       cpu-supply =3D <&reg_dcdca>;
> > +};
> > +
> >  &de {
> >         status =3D "okay";
> >  };
> > --
> > 2.43.0
> >
>=20




