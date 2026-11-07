Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.175
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794012617;
	b=xFrgrjDrrljwT55YlkgGp70Ro3iwDtZ6jp9y4EG2XPBFdQ9UEynFxMfSIlVwR4Z80D8g
	 8ure6r24aKl3rKyFz8jA9NfLYAK67hVsBsT08l2EJBTcrYopE9sn5UHo2sAGoNze9Hcqs
	 N15EZTBTSOKZcrE/cFat+YOqWsBUFB9gq0Cdy9q6dAtjhcc+UG4Zh2p6I0Or6+ypl1a7W
	 aTYEK20HvCwKtefw35Ciw2/FL6tVdydHqWA4g8FkDspkrnr+zobqb7tVvvdvJ0u56M2Rw
	 x+YKcGIhNffRMeqkorwcelRankKV1+aktaPNWjIwP7Q0elvsG08DGjuApgO98wIDuqw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794012617;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=UDIdAIMbLFTYVUq+kbKb1q8+a8DtU0N+YUkvYxJXF6k=;
	b=HHWtI5HViI7tbNhbh79Unj5cNMvSvVZEPWgbrRRnRY/+JPF/Goz32tkOxWE3TSTsLb0C
	 Dx2AWG7iun9GSQ8fqsT1OpoKSV6u7Eod47iqXo1CsiQiBEAVe/VSx2OM6GGADydXBY4FZ
	 1E3jhQhBFXUQl9BOU6f+t62nSn60qAHnIpsNxUDiN/wv/l1qKXnVSggHaT0bcvSaLSC59
	 jFDOuwr+g4DyIKwG5dlN/GLVLK7fnoX+wW3f8nQRbHqlnvGJOYUQwIK1DGdbq0zDJpXfw
	 GvrZm5edNHvcXosEAyR7S/R17qunM+Np4kUVgaiSJuFa2ACESTrGNM0Kvz/aHDxd4Iw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OAvtHTyo;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.175
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C25E606EE8C
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 00:50:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C25E606EE8C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OAvtHTyo
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-8b335eeb340so10316027b3.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 16:50:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794012616; cv=none;
        d=google.com; s=arc-20260327;
        b=VnxOTzKJTTBmmTWqUvcr9ntyj9w+9dkJJge/hVRI9EOAGPtndxlJRzlFZ7D1i06RQI
         gX7qstu0Rvv5/1Oc6OA0IJShrSGB897cHjPF4skjPv/MsqFrBrED/svL+R2xeSxrtQWf
         1FtE0VRs/Eqb9u7rOU3DIEnnTZy0gV8cqZuHpuKjYW2otbKeqj6JpLIQ58QpBfh+Mhvh
         ztNm3hAQGx5SoVo0B2hF53R7ID0HAJflZnOi7xmXjLwsE0KVFwOCvnyCtpfW9NPH51V6
         6kNFF7R6Vz7KzRyAxNWr5dgl3rkExycpmhA8T3NgcyjrsJXj0lqXcpU9E2YTClF6iPmo
         UyOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UDIdAIMbLFTYVUq+kbKb1q8+a8DtU0N+YUkvYxJXF6k=;
        fh=/j5x3pbAQdXf96JDG30+mcuJZVLHenlAVnE+VHpSNB4=;
        b=qmsMyyppLjSx2AT83JKNimztQfROvYTSP2+gqZIVjnQZqUmQCZYGBXenhWYTf+D+bw
         1P31fMPX2EtQEc8DAAUoitnXOyuWZl5cwiVXBv8xLjwnZKw8WDMHCeKkwv/jkmV77HaP
         4lgNt1hmLcbEFi6a+7m0q6MEfpPO5gtVLy9rGN9TiuQAFXTCWjO8FrcXRNpgGI4LE6hP
         /1EsTIn+E5Ws4D8kjjg5EswPvWiVXPEbGPFvl/FCsi/6qcO+x3nTFO+gkkIQ5L785SCH
         beYZz2fv2LLkGAJwXmYzqEGGuZBTtDcFA5NtXilWETrnFRvq/JeOJ9PxAoBEiBy+GRP6
         f0vg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794012616; x=1794617416; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UDIdAIMbLFTYVUq+kbKb1q8+a8DtU0N+YUkvYxJXF6k=;
        b=OAvtHTyopvWO2yMtNR08h5/hreXpJF6KjiVcwnCv2MMtkgDqUDo5bpf093PtWfp9MT
         ZuJTKBl963KO+nf83RQX018pUscr/GKPhmnWB5kq9+2Got5stHw/gAXrYDUjmVsBeMyF
         hs9baHIMd5IgkrhESN2Q9TLlkY4vBH3vSQ+N29zRVR7XfC8Tom0NluckMkyIIFQFQLS+
         yPSq//xhPoHvxLP6BN+ks7WuZMgU33i+7QZgiUTvfJFPW3MpywC4WAGnBSMZPNCGR1n/
         BnGSLAX5qm6cVx8WhTQTiPwSQKWx3ACwlsQLhj2yOrv5gzCqsKZhGRi7pBnE2ZLDnady
         v+BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794012616; x=1794617416;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UDIdAIMbLFTYVUq+kbKb1q8+a8DtU0N+YUkvYxJXF6k=;
        b=oTH4Sfeo+kknClRITckpf4Kw8MNr0bYNssy8cjxA8ST25eI/4Z1zMzWGndsG/xp+o0
         AB+5leJlj+T8Gl0w8P64px/SZcJaORrHfOpfERL+mHlN4SsyusWmJ/8by6HxgcY0YGYS
         8nhwLh1OF0BxrHiIiZ0WCps37uZ7HksX85fymudczG9H0pV7IgpZzyC+REfdiSRpFZYN
         1zVGsIIKX4WHzcURH+Pg/3ZMyGTRmH/icy5zWHCCC/fXzfoEenXsdZnlUdL6eQySYjSS
         A9A6huWHVFWX7C2tu0Yndp7FmL87r+KEmxW8vVCMRi9HL0Df7sU9p/sUpmTHK/4HwPb5
         FkzQ==
X-Forwarded-Encrypted: i=1; AL+hErGYBmIqQ1wbDSibs5pP+uDZq3XH/FC+gRNSYPkvw5V0hSCaNuO3HiwywTaFxoeEcELUQfWJYNteAbWSIRw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/630IeWRhiD1nEgQt7phnMr2IFx3wIdVLpFHiLt5e7ofXHQNZn
	ggqVpcSq9rGpkEy6CYtpDuH76PeHD59ipxfQsEMXwC+2EuKcC4nhsCbstADtDEJp8u5grmn3oer
	N4S5u3/P6s4AENZURbXMs0fiOUmD1fDs=
X-Gm-Gg: AYBFou1t470KiMwHJR0WVahhZKBHcr6hI6UAZQp7bvc78cFM6W0/znIsjXiaVjlinlZ
	oL8z1l34cWknhGAD/K+UBRL2SYHS5ALNDO3WRoz7SzS2GPh6AmU2j3W1sUTV9jvg72/VeF5tio6
	UlYMF09UF+RvpV+fwdqhCnarf0hXGcq4EI8H2es+ifQpGNg6u6R6SjNcDezQZNxxsKmQ82dc3d4
	jbdwerNNjvP82l2myRaS354nymC5/uWV1XZXdu059JA1Fz6LCQlNiYMWP1MH3vkQwyemI4SCImr
	EJGDgl0Lj87w1Lgf0X25AHRl/YlG6VpuOkQ3gDp+92GtUwIcnsdbc7R3K+bSwAPqyXpa3OH2Yf+
	ZS7N1WEssnIrvqA08scXr+mDmYQbgt0imKjOf8BqSFJ5dllTIAZE2wCVBZeA=
X-Received: by 2002:a05:690c:d8c:b0:8b3:f05:dd6d with SMTP id
 00721157ae682-8b34192ea67mr20495907b3.45.1794012615901; Fri, 06 Nov 2026
 16:50:15 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105152348.8567-1-prasanth.padarthi10@gmail.com>
 <20261106022907.10735-1-prasanth.padarthi10@gmail.com> <20261106022907.10735-3-prasanth.padarthi10@gmail.com>
 <71eb94df4d373d0f3afbe2a8ff880869f96e054b.camel@codeconstruct.com.au>
In-Reply-To: <71eb94df4d373d0f3afbe2a8ff880869f96e054b.camel@codeconstruct.com.au>
From: Prasanth <prasanth.padarthi10@gmail.com>
Date: Sat, 7 Nov 2026 06:20:02 +0530
X-Gm-Features: AclHuK_zfgDPcux-rGy0j0Dx_Q046t2jqfjZUDa9PKNbMEPl2IK8UVzJpqMRhCY
Message-ID: <CAMFFDGgebSfVGfogTG--kpOnGNP5UxWVUGW2g_Sej_18FybNVQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] pinctrl: aspeed: Hand over global GPIOP
 passthrough to local mux controls
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: linusw@kernel.org, Tan Siewert <tan.siewert@9elements.com>, joel@jms.id.au, 
	ryan_chen@aspeedtech.com, billy_tsai@aspeedtech.com, brgl@kernel.org, 
	linux-aspeed@lists.ozlabs.org, linux-gpio@vger.kernel.org, 
	openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

Thanks for the detailed review.

I'll address the naming, error handling, and implementation concerns
you've raised.

Regarding the necessity of the patch, on B650D4U, GPIO-only power
control failed with SCU51C[9] set. In my hardware testing, clearing
that bit allowed remote and physical-button power control to work.

However, I haven't yet established whether this requires a pinctrl
driver change or can be handled through existing initialization.

I'll investigate the existing pinctrl path further before sending
another revision.

Thanks,
Prasanth

On Fri, Nov 6, 2026 at 4:24=E2=80=AFPM Andrew Jeffery
<andrew@codeconstruct.com.au> wrote:
>
> Hi Prasanth,
>
> On Fri, 2026-11-06 at 07:59 +0530, Prasanth Kumar Padarthi wrote:
> > On B650D4U, GPIO-only host power control fails when SCU51C[9]
> > enables GPIOP passthrough, even after the normal GPIO request path
> > clears the individual SCU4BC selections.
> >
> > Transfer globally selected GPIOP0-P5 THRU roles to SCU4BC[29:24]
> > before registering the controller, then clear the active shared
> > sources. Leave PWM selection and the strap-source selector unchanged.
> > Clear SCU510[28] through SCU514 and verify the shared enables cleared.
> >
> > If handover fails, retain an instance-local error and reject affected
> > GPIO and mux requests before changing their mux state. Check every
> > pin in a mux group before calling the shared helper. Retain prepared
> > local selections after partial failure rather than blindly restoring
> > a shared enable.
> >
> > Probe-time normalization policy, concurrent SCU writers and
> > post-handover registration failure remain open design questions.
> > Electrical continuity, mixed-pair forwarding, protected-write paths,
> > PWM coexistence and SCU510[28] hardware handling remain unvalidated.
> >
> > The implementation passed remote power-on, remote graceful power-off
> > and physical-button power-on tests on B650D4U with an OpenBMC Linux
> > 6.18.24-based kernel. The rebased version was ARM compile-tested on
> > v7.4-rc1 using aspeed_g5_defconfig with AST2600 pinctrl enabled.
> > With the managed-registration prerequisite, the v7.4-rc1 version
> > also completed one unbind/rebind cycle under generic KASAN on
> > B650D4U hardware and in AST2600 QEMU. Host power operations have
> > not been retested with the v7.4-rc1 kernel.
> >
> > Signed-off-by: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
> > ---
> >  drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c | 145 ++++++++++++++++++++-
> >  1 file changed, 141 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c b/drivers/pinct=
rl/aspeed/pinctrl-aspeed-g6.c
> > index 85d6640ff..be22a9184 100644
> > --- a/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
> > +++ b/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
> > @@ -4,7 +4,10 @@
> >  #include <linux/init.h>
> >  #include <linux/io.h>
> >  #include <linux/kernel.h>
> > +#include <linux/mfd/syscon.h>
> >  #include <linux/platform_device.h>
> > +#include <linux/slab.h>
> > +#include <linux/string.h>
> >  #include <linux/pinctrl/pinctrl.h>
> >  #include <linux/pinctrl/pinmux.h>
> >  #include <linux/types.h>
> > @@ -36,6 +39,8 @@
> >  #define SCU4D8               0x4D8 /* Multi-function Pin Control #23 *=
/
> >  #define SCU500               0x500 /* Hardware Strap 1 */
> >  #define SCU510               0x510 /* Hardware Strap 2 */
> > +#define SCU514               0x514 /* Hardware Strap 2 Clear */
> > +#define SCU51C               0x51c /* Hardware Strap 3 */
> >  #define SCU610               0x610 /* Disable GPIO Internal Pull-Down =
#0 */
> >  #define SCU614               0x614 /* Disable GPIO Internal Pull-Down =
#1 */
> >  #define SCU618               0x618 /* Disable GPIO Internal Pull-Down =
#2 */
> > @@ -2743,12 +2748,56 @@ static struct aspeed_pinctrl_data aspeed_g6_pin=
ctrl_data =3D {
> >       .nconfmaps =3D ARRAY_SIZE(aspeed_g6_pin_config_map),
> >  };
> >
> > +struct aspeed_g6_probe_data {
> > +     struct aspeed_pinctrl_data pdata;
> > +     int thru_error;
> > +};
> > +
> > +static bool aspeed_g6_is_thru_pin(unsigned int pin)
> > +{
> > +     return pin >=3D AB22 && pin <=3D AB23;
> > +}
> > +
> > +static int aspeed_g6_gpio_request_enable(struct pinctrl_dev *pctldev,
> > +                                      struct pinctrl_gpio_range *range=
,
> > +                                      unsigned int offset)
> > +{
> > +     struct aspeed_pinctrl_data *pdata =3D pinctrl_dev_get_drvdata(pct=
ldev);
> > +     struct aspeed_g6_probe_data *g6 =3D
> > +             container_of(pdata, struct aspeed_g6_probe_data, pdata);
> > +
> > +     if (g6->thru_error && aspeed_g6_is_thru_pin(offset))
> > +             return g6->thru_error;
> > +
> > +     return aspeed_gpio_request_enable(pctldev, range, offset);
> > +}
> > +
> > +static int aspeed_g6_set_mux(struct pinctrl_dev *pctldev,
> > +                          unsigned int function, unsigned int group)
> > +{
> > +     struct aspeed_pinctrl_data *pdata =3D pinctrl_dev_get_drvdata(pct=
ldev);
> > +     struct aspeed_g6_probe_data *g6 =3D
> > +             container_of(pdata, struct aspeed_g6_probe_data, pdata);
> > +     const struct aspeed_pin_group *pgroup =3D &pdata->pinmux.groups[g=
roup];
> > +     unsigned int i;
> > +
> > +     /* Check the entire group before the shared helper changes any pi=
n. */
> > +     if (g6->thru_error) {
> > +             for (i =3D 0; i < pgroup->npins; i++) {
> > +                     if (aspeed_g6_is_thru_pin(pgroup->pins[i]))
> > +                             return g6->thru_error;
> > +             }
> > +     }
> > +
> > +     return aspeed_pinmux_set_mux(pctldev, function, group);
> > +}
> > +
> >  static const struct pinmux_ops aspeed_g6_pinmux_ops =3D {
> >       .get_functions_count =3D aspeed_pinmux_get_fn_count,
> >       .get_function_name =3D aspeed_pinmux_get_fn_name,
> >       .get_function_groups =3D aspeed_pinmux_get_fn_groups,
> > -     .set_mux =3D aspeed_pinmux_set_mux,
> > -     .gpio_request_enable =3D aspeed_gpio_request_enable,
> > +     .set_mux =3D aspeed_g6_set_mux,
> > +     .gpio_request_enable =3D aspeed_g6_gpio_request_enable,
> >       .strict =3D true,
> >  };
> >
> > @@ -2778,15 +2827,103 @@ static const struct pinctrl_desc aspeed_g6_pin=
ctrl_desc =3D {
> >       .confops =3D &aspeed_g6_conf_ops,
> >  };
> >
> > +/*
> > + * Experimental: transfer the global GPIOP0-P5 THRU selection to the
> > + * individual mux controls before registering any pinctrl consumers.
> > + * PWM selection is higher priority and is deliberately left unchanged=
.
> > + *
> > + * Do not undo the local selections on error: a shared enable may alre=
ady
> > + * have cleared. Keeping the equivalent local selections preserves rou=
ting
> > + * while rejecting affected requests, rather than granting an unsafe G=
PIO.
> > + * Signal continuity during this transfer still needs hardware validat=
ion.
> > + */
> > +static int aspeed_g6_thru_handover(struct regmap *scu)
> > +{
> > +     const u32 local_mask =3D GENMASK(29, 24);
>
> Defining a variable with the value (even though that variable is
> qualified const) means it's not an integer constant expression, which
> may impede some optimisations.
>
> Further, local_mask is not a descriptive name for what's occurring
> here. Please name the mask in terms of its behaviour. Perhaps:
>
> #define GPIOP_UNGROUPED_PASSTHROUGH_MASK GENMASK(29, 24)
>
> > +     unsigned int strap2, strap3, local;
>
> Please lets improve on the name 'local'. Perhaps: ungrouped_passthrough
>
> > +     int ret;
> > +
> > +     ret =3D regmap_read(scu, SCU510, &strap2);
> > +     if (ret)
> > +             return ret;
>
> Consider this error-handling strategy:
>
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/d=
rivers/pinctrl/pinctrl-gemini.c?h=3Dv7.4-rc1#n2556
>
> If the first read doesn't work, then we can't expect any of the further
> accesses by the core aspeed pinctrl implementation to work either, so
> we can just bail out entirely in the caller.
>
> > +     ret =3D regmap_read(scu, SCU51C, &strap3);
> > +     if (ret)
> > +             return ret;
> > +
> > +     if (!(strap2 & BIT(28)) &&
> > +         ((strap2 & BIT(30)) || !(strap3 & BIT(9))))
>
> Please give these bits named macros. This is not easy to comprehend as
> it is.
>
> Also, consider FIELD_GET() from include/linux/bitfield.h. Something
> like:
>
>    if (!FIELD_GET(OTPSTRAP_ENABLE_GPIO_PASSTHROUGH, strap2) &&
>        (FIELD_GET(OTPSTRAP_ENABLE_DEDICATED_STRAP_PINS, strap2) ||
>            !(FIELD_GET(STRAP_ENABLE_GPIO_PASSTHROUGH, strap3)))
>
>
> > +             return 0;
> > +
> > +     /* Preserve every globally selected role, including under PWM. */
>
> This comment feels like a classic LLM statement that somehow manages to
> be simultaneously both too abstract and too detailed, while also devoid
> of context, all in 8 words.
>
> Can we rather say that the PWM functions on these pins are higher
> priority in the mux than the pass-through GPIO function, so if PWM is
> already selected, then the following write does not affect the PWM
> configuration?
>
> > +     ret =3D regmap_update_bits(scu, SCU4BC, local_mask, local_mask);
> > +     if (ret)
> > +             return ret;
> > +     ret =3D regmap_read(scu, SCU4BC, &local);
> > +     if (ret)
> > +             return ret;
> > +     if ((local & local_mask) !=3D local_mask)
> > +             return -EPERM;
>
> Please add a comment here about the write-protection in SCUF30.
>
> > +
> > +     /* Leave the inactive GPIOZ6 source alone in dedicated-strap mode=
. */
>
> 'dedicated strap mode' is a confusing statement because ASPEED's
> documentation is confusing. I think we can drop this comment with
> regard to making other improvements.
>
> > +     if (!(strap2 & BIT(30)) && (strap3 & BIT(9))) {
>
> We've already inspected these bit values previously. Please consider
> extracting them to bool variables for re-use and to improve everyone's
> ability to comprehend the expression.
>
> > +             ret =3D regmap_update_bits(scu, SCU51C, BIT(9), 0);
>
> Essentially, having configured the ungrouped passthrough functions
> above, we can now de-configure the grouped passthrough function in
> strap3 (SCU51C).
>
> It's probably worth noting in a comment that SCU51C cannot be write-
> protected.
>
> > +             if (ret)
> > +                     return ret;
> > +     }
> > +
> > +     if (strap2 & BIT(28)) {
> > +             /* SCU510 is write-one-set; do not use an ordinary RW cle=
ar. */
> > +             ret =3D regmap_write(scu, SCU514, BIT(28));
> > +             if (ret)
> > +                     return ret;
> > +     }
> > +
> > +     ret =3D regmap_read(scu, SCU510, &strap2);
> > +     if (ret)
> > +             return ret;
> > +     ret =3D regmap_read(scu, SCU51C, &strap3);
> > +     if (ret)
> > +             return ret;
> > +     if ((strap2 & BIT(28)) ||
> > +         (!(strap2 & BIT(30)) && (strap3 & BIT(9))))
> > +             return -EPERM;
>
> This appears to be the negated expression of the earlier one, and given
> we're only returning a fixed value in either case, you could rather use
> the same expression again. Given it's repeated, you could extract it to
> a macro or static inline function.
>
> > +
> > +     return 0;
> > +}
> > +
> >  static int aspeed_g6_pinctrl_probe(struct platform_device *pdev)
> >  {
> > -     int i;
> > +     struct aspeed_g6_probe_data *g6;
> > +     struct regmap *scu;
> > +     int i, ret;
> > +
> > +     if (!pdev->dev.parent)
> > +             return -ENODEV;
> > +     scu =3D syscon_node_to_regmap(pdev->dev.parent->of_node);
> > +     if (IS_ERR(scu))
> > +             return dev_err_probe(&pdev->dev, PTR_ERR(scu),
> > +                                  "No SCU regmap for THRU handover\n")=
;
> > +
> > +     g6 =3D devm_kzalloc(&pdev->dev, sizeof(*g6), GFP_KERNEL);
> > +     if (!g6)
> > +             return -ENOMEM;
> > +     memcpy(&g6->pdata, &aspeed_g6_pinctrl_data, sizeof(g6->pdata));
>
> This seems unfortunate.
>
> Have you considered other approaches?
>
> > +
> > +     ret =3D aspeed_g6_thru_handover(scu);
>
> Must this logic be separate to the usual set_mux path? If not, I expect
> we don't need to retain thru_error.
>
> > +     if (ret =3D=3D -EPROBE_DEFER)
>
> Do you have an example of how ret could be -EPROBE_DEFER?
>
> > +             return ret;
> > +     if (ret) {
>
> If this handover logic is to be integrated here, can you please test
> for specific return values to separate the regmap access failure from
> the write-protection failure?
>
> Related, I've heard opinions from Tan that this patch is not necessary
> to get the platform booting. Given the current complexity, I'm
> interested to hear whether you can do without it.
>
> Andrew
