Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.180
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792430968;
	b=UyUEscbt4WHJAZMxEKq94upC9oWbpF2NccMoqVHUkExBprTQ3SvN5Li76lWUJfVBSeEG
	 WZhz3gQy7Lw3SHQOHerIo9rQSG/DMTSkTcDHdC3o/5XXM4cMcePsvi8kGdZdMtpkgeRyQ
	 iKKyX51zUuXs3WjoDxI+We16X25ZTCK0mtnBhXc5RKsWekaG9AXzX80oaZxjdERoeo7Eo
	 GZtEgjVhiYKgEvdAskzQ1QWAV/OI3qAHo3vGoepoRJORRbhXcnQYDLPvVZhZ0SI7blN9c
	 s/PXko4uCu5vu+sAxLjYcX3bIWMPmKVQaxeCzksE45pK3sy79U0NmK/ED5mnGS4xmVQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792430968;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Np41dxbwmZn+Bkqvil7UYopNErqC82u/VqNlpFNRLtk=;
	b=qz1VuhlRwa+pbVlNUanA2ourt2z35gxsZYNXAkL1axamh8/GzdgJDUOh3vXd+Vs3PumN
	 r0Y5/p/EyfQfFW8JX/cAVEROIqtCzAjbqI7fQwQPhNCnmL8eRVQxDWdJG9h/wPQqQ15jd
	 lfIaczWWeygktMhFiHOgvBGf6vIL2kfPr+tGjS+EzwxOE0/8FtBoD0I07C+QvNKOHOfD2
	 MdX6sHyB/nfoo2P2jQLJFIya10376rorhvCgiL9Nke2aPnKGM81lX+JJsbEXf+aCpHyRI
	 L5iuYHPjxTp/xlFJHILFLnYUVttfGCOibMatyBO5Og2znq/+HDaJbSK0Qhq1FJ2JSMw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=fX+Gl0W7;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.180
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 392F0606A31B
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 17:29:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 392F0606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=fX+Gl0W7
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-3ab35e31f6dso14194971fa.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 10:29:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792430965; cv=none;
        d=google.com; s=arc-20260327;
        b=JSux4rOjB61AWE8HatFKu5UQd7CT0IVHwV8+TRMe+pNIQ8qVoiL1cVb7/308wOhyiO
         kQGzYOawoOyR+Ewi+IY6pbapeVowaGJyiu1l2HrLObz9FJJmwfEi5a1W8CA4HZDlE7Xc
         YcFFb3v3Brr1WCderWSRhtA3h1EYKkCXC6ZbxG9za1mJ303+hln4IjsT8k/Yy285MdMa
         yVM5+VMy0fBShMknDlOpodksp/q9GOsjNb4ee78UJERpXNKiaqa9LQ1meyiKWBiu9zG6
         EctKIJ8lpDKE0DzwCEXlfVgbxv1kuPoc+haZtS3Dj7Hn96LYA6xwVGKz199iC5SYSwSZ
         l/mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Np41dxbwmZn+Bkqvil7UYopNErqC82u/VqNlpFNRLtk=;
        fh=EwV6cCnjHs8D3hh+mdMVgLb370OB/dfkkrpNpa463/A=;
        b=LVYgPIaPfvoF+RN1V0npQLW1RFcXCYykkXRWCdIwfqULpdPEVIWuikOZJudodhAhwZ
         dIhY+Q8mJEinCvjXFJ1qusSREcEjKg+iJmlGBR8GkcSsmI4Ky0z6to8uIsera5vq3z8q
         ZMpZFmrCBNW+xvwI9jXVBE7egpIVPFb4k/2UTqsnFxcg7xdfSWA1C4j+ka2rEAG77vPY
         5A54LXS2x2ukA/zH/OaLf1CrxfPLx6PsUORIY0I1XNVy/gjc486OeYruYw2gVoqEKnHS
         +ZDgyDOTLeIYDyG5mBySkqWsjQ/dDtZQ1fm4ishNWP5AaPV3cg6QF8tzqwObtqiLjhK9
         0p5A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792430965; x=1793035765; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Np41dxbwmZn+Bkqvil7UYopNErqC82u/VqNlpFNRLtk=;
        b=fX+Gl0W76Ub+1zWUQnlSEBDXLvC6MZJZ62Jua1HcNIT7N2rVI1gkW+dx7RVVwUl/DZ
         MiyB5pJdAo+SZrSVIuaoBuFgJUwBh0eJ9GzFYPimn5DocFuxfzywVhiw9Gh2Iqk22WzO
         mV7hXaFEfodmTSnyb7RoQkYED71RVo3Ms1slJJLXNMvPaIbl+2+ReKDfaOZalneFwJHn
         egJkEcZ5IqK6hDzccfESLFP7eZYAYk6ih5UE55A1s63jWfpAlcIurfw4sEZsARvKKkvN
         dN9rR0Waa2NHfwYYQmk1dT5Sc4AcnGEfN/tzbz4vI0o7mqEN1bZPk2shPZeJnpty19k5
         jNiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792430965; x=1793035765;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Np41dxbwmZn+Bkqvil7UYopNErqC82u/VqNlpFNRLtk=;
        b=Ld4y4ascC4VHFLGk+5v2834/BFcSudCphw3izX9T8M/IIT75daXKBJq+tCt1Rw5jJJ
         EkEyLuehtvrE/Kb7h3/ChP2/a3ciPXdVdjjtCq0X49Ij5+7Bg1iQil+1TE39RZmOgXN0
         F/G6/LqHYBrjHBdQf/OAIbO0hco4SuB8nVqf9figPuueHhC6//R3asZ7ETOIuXlACxO2
         r/e+HjBfJC1qOmqwXxlWh49avq9EeY4Hg9BuGXJVsRq97DtOzw+OC7LxPwf3bqQorD0s
         4A8lKgZZDPShTWk1d2IjuDd3f9oF+omb0+VDP06kkDyNFl+KVkH2iBcwlzYb5lyahiZi
         5h7w==
X-Forwarded-Encrypted: i=1; AKwUvBwCBxdIs5i0pSY5rWykgqlcewv1kFa45MP2VjODi0PVnbKfyRJLVXZ+XQi1PvJw/DeWCkvukDN3KSEY2Kg=@vger.kernel.org
X-Gm-Message-State: AFq9FYIzctWG5ge8KnUW+O/wu79n1VggrRgVJu5rps3RyLxfz6ht4TXv
	Ht75bdqqmAFhEHBcAEaiuznm41Fb0gzrcZ7Ly+M8bSAoOE3IQllXSXg64i0xDEggLU3TcblsAPM
	7kqwDvhqH3+4DnacbbaovTbbzK1VxaPA=
X-Gm-Gg: AYBFou2q+gAhuZVkgHxwiA4J/cuz9FgRMNgnMbzX8l5yGNR4GYIf6yw9ltmr4pnAo41
	yrMo1CKHQfPMBYXlvLBfGeWQVWr6S244hBLxfnrqOrItOxFyPAMaamifX+QhGq9jrXm9JyYSgZo
	X63XMxULaAFkAtcbawHWgWD7GbDpO0MAUeCtB6YjS1bJF5ukWi/ovBtQKnyjpS71oD3uEaDS1jU
	RyVBgzKbsBeRW7QNecIseauy99WSGPkHzXOxG9ZGbC5joWP33KAkAhHOiAgU0Ik4skfG+wWoCWJ
	kY/JCHrWxUqjNM4AhvU6q6jcwoZImo4yz4htUDwItt9R1PD4OSKocefTDa028B2enyYtM5aF2Mg
	6YJ6YivnGFkWgg9AR429/Y04ddrbAaxtJHMVybN0wJpw=
X-Received: by 2002:a2e:bea4:0:b0:3ab:1729:e08c with SMTP id
 38308e7fff4ca-3ab292917e9mr16875971fa.13.1792430964535; Mon, 19 Oct 2026
 10:29:24 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261018-tegra-hda-hbr-v1-1-b8bb1f1d8d15@gmail.com> <87ecdmaxh1.wl-tiwai@suse.de>
In-Reply-To: <87ecdmaxh1.wl-tiwai@suse.de>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Mon, 19 Oct 2026 12:29:12 -0500
X-Gm-Features: AclHuK9pYgXL6PjRd-4EMhy8uGYeAfm8xiH3e07GVU1bNqM2yd8kKJKrKzkZa0A
Message-ID: <CALHNRZ_oXkdOO=Q8khQTeAfH_1XQjLK4Vp1WQZ-J3oHoihAFQg@mail.gmail.com>
Subject: Re: [PATCH] ALSA: hda/hdmi: Enable HBR capability
To: Takashi Iwai <tiwai@suse.de>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	linux-sound@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 19, 2026 at 3:47=E2=80=AFAM Takashi Iwai <tiwai@suse.de> wrote:
>
> On Mon, 19 Oct 2026 04:16:31 +0200,
> Aaron Kling via B4 Relay wrote:
> >
> > From: Aaron Kling <webgeek1234@gmail.com>
> >
> > Tegra HDA does not set the HBR capability bit, however every SoC since
> > Tegra114 does support HBR. Override the hbr setup function for these
> > SoCs to unconditionally enable the feature. Since Tegra30 does not
> > support HBR, this function will report invalid on that SoC.
> >
> > Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> > ---
> > Before this, any attempt to open an hbr stream resulted in a rejection
> > on Tegra hardware. Looking at the downstream support, that just bypasse=
d
> > the capbility check for all supported Tegra hardware in the common code=
.
> > This replicates that in a driver specific hook.
> >
> > This has been tested on a SHIELD TV 2019 Pro trying to bitstream an
> > Atmos demo video. It attempts to play, but mostly just underruns the
> > entire time, with a few spurts of correct noise. My expectation is that
> > issue is userspace, since that is a WIP android audio hal. But even if
> > there are more kernel problems, this should be correct as a standalone
> > change.
> > ---
> >  sound/hda/codecs/hdmi/tegrahdmi.c | 37 +++++++++++++++++++++++++++++++=
++++++
> >  1 file changed, 37 insertions(+)
> >
> > diff --git a/sound/hda/codecs/hdmi/tegrahdmi.c b/sound/hda/codecs/hdmi/=
tegrahdmi.c
> > index ebb6410a48313..c4d8d8a570542 100644
> > --- a/sound/hda/codecs/hdmi/tegrahdmi.c
> > +++ b/sound/hda/codecs/hdmi/tegrahdmi.c
> > @@ -227,6 +227,41 @@ static int nvhdmi_chmap_validate(struct hdac_chmap=
 *chmap,
> >       return 0;
> >  }
> >
> > +static int tegrahdmi_pin_hbr_setup(struct hda_codec *codec, hda_nid_t =
pin_nid,
> > +                                int dev_id, bool hbr)
> > +{
> > +     int pinctl, new_pinctl;
> > +
> > +     // Tegra 3 does not support HBR
> > +     if (codec->core.vendor_id =3D=3D 0x10de0020)
> > +             return -EINVAL;
>
> I guess this will break the HDMI on old Tegra.
>
> Better to enable pin_hbr_setup conditionally for newer chips below, so
> that the older chip continues to work without HBR.

Mmm. I was trying to replicate what the default version of this
function does when hbr isn't supported, but it does look like I missed
part of it. Blocking the override entirely is simpler, will do in a
new revision.

Aaron

>
> > +     spec->ops.pin_hbr_setup =3D tegrahdmi_pin_hbr_setup;
>
>
> thanks,
>
> Takashi
