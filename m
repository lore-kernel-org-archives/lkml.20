Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91A1241687D
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 10:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788517218; cv=none; b=qN3lRTWmuNW3MXnotAxPyDhD314le8hLsYywsKTvjoTVPF60Glj4SeEpwusW+rJ115oZzZo8kqXdmdnCVNbobFrsemTbC9p3LllIg8hBG0SoFlE22aqZ1wPlbsMApM4xo6rWM9BRTvNFd9DI/dOGcuMkOalhLuCaBM6gCja6C+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788517218; c=relaxed/simple;
	bh=QkrSEynGau1ZbI201+0Em8TncEc13fHHUvNMrEc6cck=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=keh0ESxku8kcRaEWCB2+QNKfVpq3THYLd4HA786KxPeX5V9THsG/j5BNLeaEkxZOLaen3PLDfNFnbHJl7yvwRZEvTpKig8iCtvM4EO3gcbBEiBmdBZPt5RhsdkIT1F/h8E9MTPKQD5h20FJGHiBpB4jjUAYzIH6Pb3y39LK89BQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.161.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-6b127c88220so588988eaf.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 03:20:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788517212; x=1789122012;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n8ZpJN9RlZp1CfHTyya0RqETx9peOqUoR2+FiCTsKgE=;
        b=putAdibu2oIOCT9TrHf8IUdi+vBKSacpamBgy3dRSW9JkPsobUxSumAvqr1mcTBRyq
         k9IuSMxysP1QXNfXbOvHO7dYcib9jBYbJvHbd5ERJp13Is797xB08szaSP3VmO5nKsX3
         YBMbXgDQww9MQOYON+OZzRMkjXZoPcC+TiZ1sQsWlHlDemIzhM4kPDuEPAVUFxpj82tm
         ecTm2c3Eom9unC5aV7Rcxi/WWPbB66LtAD9AP8rsXEzQHc+xiEKPRlOmoPKkyVYWaOTP
         EHPGrIxBa0z4zRn02jDCiXi61zTqcvJuU2pBqRrgtvycBBur+7VACprf84J1d4EDST60
         A/uw==
X-Forwarded-Encrypted: i=1; AKwUvBzrDCWOefv5DrINAjija5q3OwRMJ2eM7GFTpo7XQQWQ12px3uMfmOQU4sTC6ffSS+9K8RDw9+Qvr8ulJOc=@vger.kernel.org
X-Gm-Message-State: AFuF++mfXzOufpSZQGlrbrn0igoxcxBq75VE7p8WN/nqJ2iDlej+4gB1
	s52li38OBw/QTQxpxopGm58DBDlCVTulcziKFIPJ6RAYzuVtoJkOqRSHk8Shhu2pTNc=
X-Gm-Gg: AYBFou3pqE5KcTaJf0sGHWMW4JX+2blDTkGXEQ4otcpLkIDwYaeSiGqCujP941h+6iz
	uHfjRngzYwF115jJuV9gzVyIHp8TGCdvJZeMx6wj2TjZiq0xAH8jOoVmhRRKdrNN6m2HcrO8TDn
	eKcclodBmOiBU66tNBOIJyzRiSgoBGdtDLrB+WuAkDht7ghTlzUFnuzMNyC/TSb8jFtJ90UTlek
	Cm6ddcfQOF3UHYqfAO5DiY5quAhdrCVoCy9lC5JcgV1oN2qAoxXNF8T4ngU8IlHShq+UosPoqU/
	07YTdBjR1Xo1Lv+SmLWHPxjuNpiOKo3C9YB65SIeKF3DzLeruIquM0/B/Lj2mKYiC5pXhJVONO8
	Na+Q4Qy+1jIufNGvyPf73Y7QDVbJC8Q8VLSDPowq0o8lUYj0NGfd1Tc2klI11AQ2j7uYGIpXHsU
	ULhCt/yRdjnbi+Vfa+WrJ/HMLWyx4VNONu1iA+3AtEb/UN1VPj8y3h1hacExKFGZjxLW24+l2PK
	i1ee8klayBfAdxGQ4uj4dI3BA==
X-Received: by 2002:a05:6820:180e:b0:6b1:65ad:3181 with SMTP id 006d021491bc7-6b6fcfd957cmr4429393eaf.16.1788517211548;
        Fri, 04 Sep 2026 03:20:11 -0700 (PDT)
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com. [209.85.160.41])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6b6dcb85a61sm2742310eaf.8.2026.09.04.03.20.11
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Sep 2026 03:20:11 -0700 (PDT)
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-46ac530ba95so553791fac.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 03:20:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzr6CUnyYjTPvgkae3IyoTxHmX64RpxSnRYv7mW7dsSAI6jax91Po+bOLCLcXT8VmdzaZ6wutzDm2NWdy4=@vger.kernel.org
X-Received: by 2002:a05:6102:8098:b0:783:79ac:9dc3 with SMTP id
 ada2fe7eead31-78a4a880ccdmr1286425137.10.1788516746128; Fri, 04 Sep 2026
 03:12:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260902-rzg2-sr-boards-v4-0-4a456a422fee@solid-run.com>
 <20260902-rzg2-sr-boards-v4-2-4a456a422fee@solid-run.com> <CAD++jL=fGonMHd0jitwAE8+w=JYPX_6YFW6CzS9kRZLbx3045Q@mail.gmail.com>
 <0435939c-2836-480d-9ba2-8de4c5e22cc2@solid-run.com>
In-Reply-To: <0435939c-2836-480d-9ba2-8de4c5e22cc2@solid-run.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 4 Sep 2026 12:12:15 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUE3+qBdy2CoSQMzJ1iePiv0PSTfOjxHAqgp78i_XpMPQ@mail.gmail.com>
X-Gm-Features: AcwNN1V1Us7DEfFHRItLM1ZA7SwiTD-ZOtpiiIkRmjTu4wyeWXgopaPPPq_n9t4
Message-ID: <CAMuHMdUE3+qBdy2CoSQMzJ1iePiv0PSTfOjxHAqgp78i_XpMPQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/7] dt-bindings: pinctrl: renesas,rzg2l-pinctrl: Allow
 input-enable pinconf
To: Josua Mayer <josua@solid-run.com>
Cc: Linus Walleij <linusw@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Benjamin Bara <benjamin.bara@skidata.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, Jon Nettleton <jon@solid-run.com>, 
	Mikhail Anikin <mikhail.anikin@solid-run.com>, Yazan Shhady <yazan.shhady@solid-run.com>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Joshua,

On Thu, 3 Sept 2026 at 11:23, Josua Mayer <josua@solid-run.com> wrote:
> Am 02.09.26 um 14:58 schrieb Linus Walleij:
> > On Wed, Sep 2, 2026 at 1:50=E2=80=AFPM Josua Mayer <josua@solid-run.com=
> wrote:
> >> The list of allowed pinconf properties already includes input-enable,
> >> but has omitted input-disable.
> >>
> >> Both refer to the same hardware property, setting and clearing input-e=
nable.
> >>
> >> Add input-disable to the list.
> >>
> >> Signed-off-by: Josua Mayer <josua@solid-run.com>
> > (...)
> >> +        input-disable: true
> > The Subject of this patch is  "Allow input-enable pinconf".
> >
> > But what you are doing is allowing input-disable.
> >
> > With the subject fixed:
> > Reviewed-by: Linus Walleij <linusw@kernel.org>
> Thanks!
> I'll fix the subject ... !
>
> ("dt-bindings: pinctrl: renesas,rzg2l-pinctrl: Allow input-disable pincon=
f")

No need to resend, I will fix this while applying
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-pinctrl for v7.4.

I will also add "output-disable", which is missing, too.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
