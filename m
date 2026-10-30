Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.181
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793387157;
	b=dS/9HaLpHpISlGAhhtL0yfvvn2L3LYupxd7pEvoheZy6tARFTcsFMTbK9zbnRBHrqOE1
	 6gGIGiDcd6yyQ7y5dWgF4XStjH6J/GJlKr2lzha5mUDX3QqBid0NEvrL+JzjQx4KzOhNe
	 EMCFb74Ty109zTUTwZRaoIabYDrGKeE5bsY+0EwyLzse1lSTtE5kUMrb2ef6+c7QilqMI
	 61eamYVQ8gAAmnsE8c2W52q+o9QWbIqpG+JGZVvLFyPcPbZxOOXRj/QACS+HkZUfnvpYc
	 vTSCAeCr8rC7Rap/76a9vot7rBWTRUcc0aiLsmk+NXExV73kspXpYSWtjTcIyDYO6Cw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793387157;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=J9hrI45jlpVu4PlMmMuPTFeOsIL9X7w+vA3kaWRvlIk=;
	b=j8s8zrdhC2fAOyI6TyCBo7UuY5Kc0qij+YzGxZJP4/h54uxohBcYCZlBnP2mqtSilOaq
	 IT2iQeV6tbwqe7SYoUOzliTjmcDTWhDEcRnTecNoDX9IE+wwSiNOHq8Oh5oNt18eTOZ3W
	 /CtNyjDIozb9UWY9MZuTE9gZeNggqSi9/mx5+qR3lPvcFAoCi38ou6vJqoHs0KwpS+nXW
	 ntQdUYxRyptTnW9pBd47WzD3fKUdhmj22K/iOMpe7BMPTc44qSmh6H1MFXXi8nbl48jXn
	 ra0YFtzwPachPo6JU4TWJ6yHZE6QrKK2hRb0KrNnPhTTFghQFrni/m8+pjUkyJRKFxQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amarulasolutions.com;
	spf=pass smtp.mailfrom=amarulasolutions.com;
	dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=LLofvvb7;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5118606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 19:05:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5118606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=LLofvvb7
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-35cd4e8bdbdso1406043eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 12:05:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793387156; cv=none;
        d=google.com; s=arc-20260327;
        b=bpr3H+kdg1MH4KFgYFizHOlUTj9RbFoFMhtfSbfXd8FFr/3DI/1319vH4OkVcFYVso
         mrOYNOcqEfLCW7JGvV/nCCKRbxJ47JvuWudUpmnWOe4i4c326C9hcN/m/UXNOWeXY4Nl
         wTj8X8x4FjQiqzIeLqwO1hlymeXYjVe/aZPeqcVCV6LGJRaVlZV7Xd+Mox1R4PjHEa7v
         Q1xBT7wesh8Z1vW71cN+AcpEEJFdVIQUtJL7TehsFdTT8ZZoqYPw/iqUJDAU0RXvt9n4
         HI7Sr0lMnv1WTpjw3ULgmJz/StwKismIFgNpvyM8U78nRM54OAvp7dYXjLvQsnSydeD/
         AdqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=J9hrI45jlpVu4PlMmMuPTFeOsIL9X7w+vA3kaWRvlIk=;
        fh=PaXzwgwGYnnYOR5r/UTIcotV1fWuZ6dykyI2yVw229Y=;
        b=AAiRWF8R3gLQku0oGAJjoktJxGfndSqklRibNz/ZUlFQ+U/oyziXUWOnT8ojGfbTGu
         GuhYAn57wqSCKdxMrASCf2nWYC/8RwIXqgQID8NOVAO2uDPI423gktOepLnmgbtqtG5E
         r3z9Ag3zI6NVan2GWj6t4eUlS57FRzUI7gMQV+2dcykIzCld1+UHaslopo2TTSPz0ol0
         6sQlDHI0bm2V2DPyn3iMzGqB40ZOCE+0iMdbV65ESEbI5KeQe0jN3OvikFt8plxTGl61
         lfkaQKMxc+yT4dvl4Pb6hTcLMVvefNGNHO0nIUtDEPAFcy50JYdz0ZPjTBppDsvJJIlv
         DT7Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1793387156; x=1793991956; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=J9hrI45jlpVu4PlMmMuPTFeOsIL9X7w+vA3kaWRvlIk=;
        b=LLofvvb7RajJaXSnFtcrWvkkzieiyeC7FpzUPkjNpN3+NGdZ0cJSo9RtjkFZsnF6ru
         UANyOEc/Qglo8QMluP1PHrBrCPNKujunsuG5NIxmQ2C8DbvAyDwC9jI+i/KYrAHzEZBB
         RXJhoPo4tI3n81k+JN7Mwfoh0c5IQSUjZ6Rys=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793387156; x=1793991956;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J9hrI45jlpVu4PlMmMuPTFeOsIL9X7w+vA3kaWRvlIk=;
        b=lrBU7ILQz7uRoxxn1iH300csVMlo3dhTQn8ekq/PbsHkO3VqGmXgPZ/mT5iR+RdnBo
         Bt2p3enXZI8c6+zSFPXffJHaBnhUQ2LPggl33F6h8gqUad57zHI3vCQR0TTOFL2pA4oQ
         DOAD42xLj6H4vL35D7lwX3xmBNWXNj1xHPBa8YgmyUilL+BN8eGbxNPlm+7B2B2/NKHB
         99z8FpHYcxG4p5siFdljxpCWlAG/Hw5KyaQYAnN7AeOLR+v7IDx6r6BA2ddRDsdhGfbl
         pmnYwFTEZE72LHRROV0O6LGSKtnbVUUG1uSh5/X+sD+Rp8i5vCPXho2dl7wtiWcTmY9L
         AQrw==
X-Forwarded-Encrypted: i=1; AKwUvBwDbeawxpvx64q4iFT0BnXjBHhQySVkwZdPT4xXsnslHP2+OE5yE/DFsBIeUSbuX+xYaRJcMJQJZovjY1A=@vger.kernel.org
X-Gm-Message-State: AFq9FYJmjukfVXJ2akKZ6OlbA+u5MEYp0yK/a2OSLIJWvqvmLB5nACVq
	KQyTT6lV4IQktYUOkXbIZseN2qyifVLEGZlUzFzUBm1CaFtUZcFokPLMgwy4VoNXiZ1zVmtK25S
	3BN4/P91XKhTyGv4pqN94/87XbjPJe8k/CwfdjW7Gvg==
X-Gm-Gg: AYBFou1oZwZpWSrXx1wQoMskU7rkQLXkUh8ktzO+aNvERLuYzL+m5NQDoeDO3Nl/78o
	EiuPgFE8E1v1FN12ABjqLe7qPydTEKQbGNplWZhcTJtXFcVLxKuoiPpDa6LxD8PLfmWshqZ5zE8
	de+5aZgVxOw+AELwWssQHbbpNwb/xEvLsMRP8q717v/bXAAH7hTt9OKcV8mSvupECsCrpdeTUWC
	WF9ovtTyO7FJlA8ij8IZnjs0+9OdNnuwer78HtRkL+4G9wVWdcxLTe9oMgSNb+mIShjUaAe7p5C
	rbw33/QaUJPVDZQGn7ePEdEkiQjTK4prqseA8YI0VETvY+WmlMgMYzx47H+462IC5GCA7tHtG0y
	WcLbHJjBj8OXwdvgscbUk+umqqZAg78DVHBz35pNOMKJwlwn+aVJcAiGvI/GL5lKT57w=
X-Received: by 2002:a05:693c:4154:20b0:35e:f4ac:5f8e with SMTP id
 5a478bee46e88-36a420574admr4840973eec.0.1793387155597; Fri, 30 Oct 2026
 12:05:55 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261020113717.189082-1-patrick.barsanti@amarulasolutions.com>
 <20261020113717.189082-4-patrick.barsanti@amarulasolutions.com> <10806856.0AQdONaE2F@phil>
In-Reply-To: <10806856.0AQdONaE2F@phil>
From: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Date: Fri, 30 Oct 2026 20:05:43 +0100
X-Gm-Features: AclHuK-vdnEzcEGsGvQRBO8g78jL4SBlJMAH8_NBpy5nWJ1J3N8PxOJgd16wrPs
Message-ID: <CAOf5uw=iMTOgoJZHXWRc=XBfTZ4jVc9LDToRSi6RvgknyAjDUw@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] arm64: dts: rockchip: Add Axelera Embedded 111c
To: Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, Patrick Barsanti <patrick.barsanti@amarulasolutions.com>, 
	linux-amarula@amarulasolutions.com, dario.binacchi@amarulasolutions.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Heiko

On Fri, Oct 30, 2026 at 7:54=E2=80=AFPM Heiko Stuebner <heiko@sntech.de> wr=
ote:
>
> Am Dienstag, 20. Oktober 2026, 13:37:17 Mitteleurop=C3=A4ische Normalzeit=
 schrieb Patrick Barsanti:
> > Add minimal device tree for the Axelera Embedded 111c
> > (rk3588-embedded-111c).
> >
> > It offers efficient AI compute for multi-stream computer vision and
> > GenAI applications in a compact design. It features a quad-core
> > Axelera AI Metis AIPU and an RK3588 SoC processor.
> >
> > This basic version of the dts supports:
> > - Console
> > - eMMC
> > - HDMI
> > - 4x USB-A
> > - 2x Gigabit Ethernet
> > - RTC
> > - Enumeration of on-board Axelera Metis AIPU
> >
> > Link: https://axelera.ai/axelera-products/embedded/111c
> > Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
> > Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> > Signed-off-by: Patrick Barsanti <patrick.barsanti@amarulasolutions.com>
>
> that Signed-off chain is not correct.
>
> As it stands, the first signed-off would indicate Michael as the author.
>

It's a bit complicated; let's say the core was done by us in a
workshop and even I'm
the original author of the first version of this board's support in downstr=
eam.
I think that co-development is more appropriate for me and Dario.
Anyway not being here is not a big deal for me, because I don't spend
time on the series at the end

> If all 3 of you worked on this, this needs Co-developed-by tags, though
> 3 people for one devicetree?
>

:). You are right here

>
>
> > diff --git a/arch/arm64/boot/dts/rockchip/rk3588-embedded-111c.dts b/ar=
ch/arm64/boot/dts/rockchip/rk3588-embedded-111c.dts
> > new file mode 100644
> > index 000000000000..a964b46e5c12
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/rockchip/rk3588-embedded-111c.dts
>
> please name this rk3588-axelera-embedded-111c.dts
>
> The name is otherwise way too generic.
>
>
> > +                     vdd_log_s0: dcdc-reg3 {
> > +                             regulator-always-on;
> > +                             regulator-boot-on;
> > +                             regulator-min-microvolt =3D <675000>;
> > +                             regulator-max-microvolt =3D <800000>;
> > +                             regulator-name =3D "vdd_log_s0";
> > +                             regulator-ramp-delay =3D <12500>;
> > +
> > +                             regulator-state-mem {
> > +                                     regulator-off-in-suspend;
> > +                                     regulator-suspend-microvolt =3D <=
750000>;
>
> regulator-suspend-microvolt is deprecated, so should not be used in
> new devicetrees. Same for all other occurences.
>
>
> rest looks ok :-)
>

Michael

>
> Thanks
> Heiko
>
>


--=20
Michael Nazzareno Trimarchi
Co-Founder & Chief Executive Officer
M. +39 347 913 2170
michael@amarulasolutions.com
__________________________________

Amarula Solutions BV
Joop Geesinkweg 125, 1114 AB, Amsterdam, NL
T. +31 (0)85 111 9172
info@amarulasolutions.com
www.amarulasolutions.com
