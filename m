Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794749211;
	b=hEuLCE8/P4aIhhhnrTYWur80Fx4d2TFqBIXTghdjoHHAIDN45aUXzO9CX4qAxD/uBDuH
	 35/BI3iwuUay73yV2oclqgja+N3FUTi3+l7htopfxOwytBjhWwaQI4y87eElS2K+LHImi
	 m+wQoTbJwTFzDsZoS1xo8KHaOfj9OtiUNXJQGqQlNRMhUsPuIcDOx0qGrsSRn9rM77dwu
	 E6r6RT+KeCxO+blMzYCTcSYXC5APkUK8DASrSHP2E98Akniej9T9piM4g9sb7p0j++unS
	 IaZ8ZH5XhE+L8Bh3y9pu5ary6P3YsAatJAyWM0nTe4tWPIE2d4JmkcVU0V5mEPnhW1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794749211;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=jY3xGG57GVWa+wMl7oxhpSIomPcM/kWyJWqi5RR6jzk=;
	b=v0JDcRcomyqnELvZvX8t8rlryLIs4gUuxNkQROLBFD5VffIN7+6qEaaP/m6FBhk/7vbD
	 u2+MoLxigbr6IHyXGOV22LW1amKBbjPei4PvlF0/RdPHegWTvatnAPd8o9srchiaApaSG
	 z/eJM4ze63WDRorzJJaNMiawsDSREqAilRN+Lhl2QZyxTGrY09i3ePh5ZTwbcq0LktXIt
	 9uTK4Nmt+3lToh8ldl6tJBpISoUZKvK8tDwN8RrLIpkMqWFctxv7sEJG9FYXoEdrAd/eJ
	 7ICAh3n0gV4uUgAVGzKXrbgCMqhNL+fKRN7HLNHj476MCsAM2/9YFiQtUOpDx6jNt8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=sung-woo.kim;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.218.43
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12965606A327
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 13:26:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 12965606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=sung-woo.kim
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c247f6687dcso485540666b.2
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 05:26:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794749209; x=1795354009;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jY3xGG57GVWa+wMl7oxhpSIomPcM/kWyJWqi5RR6jzk=;
        b=C0iNgYUn/prBZFaOnXUhPSdtQtI7gBggywzlLOPoiaVilEzxGw3PX0ipIJXTOMS7BF
         mpuZ+WGqee+qjsDtnJ8L6lAnACVtLQ8JwBVW6YQusMzcn9JCLU2cz7JRNr6XMdaaVHlT
         i08DUqlx4L1rD9m84XK76sBV0IlLgoxsbi8vCecp6K53ISdomUdFR/XwIGEV2HsltaAQ
         oU9GRpRdkOO/JtuqURAbL/SXa2/UQEaDql+ebv2DQxaswapItxpP9JuxKacO0uJb3ZHu
         ya0JRFxQeIG0oNXbMOVFcp9HM8q+wkP+ayxkmNF3tVA/ZRwToaWGQGO5BpEMzi7B0zZE
         XkuQ==
X-Forwarded-Encrypted: i=1; AL+hErGUn9knXJWQsGVHJ7F+Tl1pf//5VuLwPjYBhc/il/n8Bh4InM3QUtwNkljEr+D5Jk4+lB0qUlvZ10wNp08=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Q4tCwf+Bbk7T8RNil+u1FZZ8wgKuhWO9N//NQQLGfp8O3/LAU
	Zbfa3m+tdVCzdfAovA6+lKPZzYlBEgXNL74d/VuDNB+bn0B8zEXt3mP8w1amygNWl4Y=
X-Gm-Gg: AYBFou0ov6KwQvBwNrTfRa/3aau7Q04A3r8sR26F9bpI8hisvJZ45D9ayf8rHNRh+bd
	zFLrlWRn3M0rZ0afVhZulaqEzEUs6Qj5yrW08yUpW4u1yiMrh8cOqvWjkkiaYr9joaEflDVxnI/
	l1KNTyDlLkxyCWLqM+lP3pOaWzy9d6ZZa0cTGYhxUv2XkEkDcilqnQo6eVdj3Yph6b4eTYlz9fr
	Jf3Nqmxst1msKMMP9QudS/UaBVHih1oql6VsFKtZCnXAa8MZCUPPlUEIDRx4lANvJnLKEPWNmvP
	46opetvjuYCWjSSZIXhj63dWrVLH+uj9bIeti8ktYkurze0448bQKIIIK087cgYYHJ+mPNQkb6o
	aEY0t8t5J/dDPeaD/eM9fRXVnPiA+JFtoiqoF6MDnV0M7poRg/ss75CgkL3QiYyBk9oYxS/1uyU
	lLjFX9iW9mPJfFadpAEvL5rGb9l31R4cLM+X3t0FyqQbHKM0neOpsrT3lu8afr5DeIABxmmge7L
	1xVVfprp0lj1DlZf0XK+QqBNvzgABANp2E63ljdAXb2wOLHFyXrk92gIzHOmfmPsKwlO8kSNjme
	bVt25qFFefpOa0H+k+NJO+X3IUZfMefq8qqX/vwFgDwo6VuqWn3n0QFHJyqeVVvnktxGjf/Hd/3
	gOr1rsHDPPBpxBJT/JA==
X-Received: by 2002:a17:906:dc89:b0:c26:1648:a06b with SMTP id a640c23a62f3a-c509642fa78mr654139966b.38.1794749209132;
        Sun, 15 Nov 2026 05:26:49 -0800 (PST)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com. [209.85.221.47])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b57c5bsm307855366b.49.2026.11.15.05.26.48
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Nov 2026 05:26:48 -0800 (PST)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-490d59c3f0aso914319f8f.1
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 05:26:48 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHdEPJ134cwRUg9aQQp4dYW/2+YS8tCzZkfsr0rfjKMj/P38iFsx+baLahZiUa4YFJYifmlZRufQMLs+Qw=@vger.kernel.org
X-Received: by 2002:a05:6000:1848:b0:48f:bcbf:26f8 with SMTP id
 ffacd0b85a97d-49c7390fcbamr17525357f8f.48.1794749208648; Sun, 15 Nov 2026
 05:26:48 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261115132215.4084031-2-iam@sung-woo.kim>
In-Reply-To: <20261115132215.4084031-2-iam@sung-woo.kim>
From: Sungwoo Kim <iam@sung-woo.kim>
Date: Sun, 15 Nov 2026 08:26:32 -0500
X-Gmail-Original-Message-ID: <CAJNyHpK8ZpP5uAK0tgtswKVvD3=Z=d+2dR148RSNw-L7X_ih0w@mail.gmail.com>
X-Gm-Features: AclHuK89S0biKagP1-Gmz3zw0cKplorvpQTCrvEikzedtHJQEI8ZvWsTk-6J-VQ
Message-ID: <CAJNyHpK8ZpP5uAK0tgtswKVvD3=Z=d+2dR148RSNw-L7X_ih0w@mail.gmail.com>
Subject: Re: [RFC PATCH] ALSA: hda/realtek: fix missing chained flag in fixup
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: Dave Tian <daveti@purdue.edu>, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

One more, ALC668_FIXUP_ASUS_Nx51_HEADSET_MODE in alc662.c also has the
same issue (missing .chained=3Dtrue)

On Sun, Nov 15, 2026 at 8:23=E2=80=AFAM Sungwoo Kim <iam@sung-woo.kim> wrot=
e:
>
> The fixup specifies a chain_id but does not set the chained flag,
> which prevents the chained fixup from being executed.
>
> Should chained be set to true here?
>
> This was identified through static analysis and has not been tested
> on actual hardware.
>
> Signed-off-by: Sungwoo Kim <iam@sung-woo.kim>
> ---
>  sound/hda/codecs/realtek/alc269.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek=
/alc269.c
> index 96fa8c2782bb..1be2e609c28d 100644
> --- a/sound/hda/codecs/realtek/alc269.c
> +++ b/sound/hda/codecs/realtek/alc269.c
> @@ -6431,6 +6431,7 @@ static const struct hda_fixup alc269_fixups[] =3D {
>                         { 0x1e, 0x411111f0 },
>                         { }
>                 },
> +               .chained =3D true,
>                 .chain_id =3D ALC269_FIXUP_DMIC,
>         },
>         [ALC269_FIXUP_CZC_TMI] =3D {
> @@ -6449,6 +6450,7 @@ static const struct hda_fixup alc269_fixups[] =3D {
>                         { 0x20, 0x8000ffff },
>                         { }
>                 },
> +               .chained =3D true,
>                 .chain_id =3D ALC269_FIXUP_DMIC,
>         },
>         [ALC269_FIXUP_CZC_L101] =3D {
> @@ -6467,6 +6469,7 @@ static const struct hda_fixup alc269_fixups[] =3D {
>                         { 0x1e, 0x411111f0 },
>                         { }
>                 },
> +               .chained =3D true,
>                 .chain_id =3D ALC269_FIXUP_DMIC,
>         },
>         [ALC269_FIXUP_LEMOTE_A1802] =3D {
> @@ -6485,6 +6488,7 @@ static const struct hda_fixup alc269_fixups[] =3D {
>                         { 0x21, 0x03214020 },
>                         { }
>                 },
> +               .chained =3D true,
>                 .chain_id =3D ALC269_FIXUP_DMIC,
>         },
>         [ALC269_FIXUP_LEMOTE_A190X] =3D {
> @@ -6497,6 +6501,7 @@ static const struct hda_fixup alc269_fixups[] =3D {
>                         { 0x1b, 0x0201401f }, /* front lineout */
>                         { }
>                 },
> +               .chained =3D true,
>                 .chain_id =3D ALC269_FIXUP_DMIC,
>         },
>         [ALC256_FIXUP_INTEL_NUC8_RUGGED] =3D {
> --
> 2.47.3
>
