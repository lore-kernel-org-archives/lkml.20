Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83799545288
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 20:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791923670; cv=none; b=JkzsRD4nB4mrDRSBLAJZIqrX9rddC8bShWy73XcYdVsKHUa+qkWa0VRF06q2EOc60Ghlyb88KXKWAQNfPQNPtqsZfJGGGaL6TSr6R60zhEpEJ8Qj80LziQ+aoPF6xU1xA8JZPyxvp+etGJer8aGmP/AQZSu/EEAxGZFMcn9MgKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791923670; c=relaxed/simple;
	bh=BiOUJECQfa8oLUz76ipeoIUDX15cvVMHQ8spw3DBskk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ae8Sx20NM0nXEYgtZi7P8N01rEydu5QHUA1l8DAi5IvpbTtMr9cOVMMntoFGg460N/ZZU7ZxhaFkim+WrU/bOz1oiLtu2yJGXch2fCFPxXuqd5cCHQJJJ9ajqpxFeqaryFpEDSFO5tKivfk9usTcPtoDGPEtceCR749HwgspzZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=N20o45XD; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="N20o45XD"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c3156e7705cso56551066b.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 13:34:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1791923665; x=1792528465; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YJ43Mh4hkAEjbaMZVv2fyyL/+b2N74lpzDGKc7Xi/bw=;
        b=N20o45XDlIZkI8kka77CJ1nKJ6xoD1GUES6V4eSjQEtPCMom2hZcljWYDpOc0Aj2Qn
         0bayL6/lu58xgcXtIR9AHfVG5m1oNO1hGKrJDfxb6M606RKF+9rvLoE5U3rDoOzQgpZQ
         h/4T7HPeaqhYW81yErVkR+yQZsl9JBZNW46r8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791923665; x=1792528465;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YJ43Mh4hkAEjbaMZVv2fyyL/+b2N74lpzDGKc7Xi/bw=;
        b=JQU4X3bsttxp0+mqF7u333s0wVVPwXdLdJHb5uqnKsmwc1vlklFSdQo5z0+kLQ0+7v
         gfbkqpAcwKxxdSSiDcm0O0M9JQtDrqjfC7pDkgQDNUhYHRQBg9s2bw5OpcU797uFwwgA
         r0rA52pm1QbJFxvJBVJMYz/MYdF2imLFgJc88XADVVLZLfsizJX0l/b452uJyW46k+Rt
         FqzvURMkL4WBiHqbWeFY9nV4swtCKcTNwryG1/zhZgevy7/18YuE/N6YVXmrxn3F44sU
         qPqZwCw6WDl/8sgP2fS3/GOMLS5CUYrz4kvTCmGCd35AQSC6FcWNO/em9eTZ8vPjRLtE
         oMXw==
X-Forwarded-Encrypted: i=1; AKwUvBx51UwGOJkVeSWUij0ls9KwxKVDpg9gEJwqjRAy8XU2YKWjPsl3QBxxgX4xwgQX79yOVqomfLi/l+ky9yg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJbRsDhNaIbNr+eUSDBxTFuZlHLphheB0re8B4krjamJcrlcF5G
	Lq2w7a+0aMlqD4G1l/gEhJgVuGzwjcYk/O0gpnmGS2OUOLR8xILIs/qdGl0J0T9BE6QfViM4H0x
	DH8amKA==
X-Gm-Gg: AYBFou0+qdhBtwtP+fVxmZBzAxxkrYNAT/2dezyO31nDR9fdQ8cPj0AlDAfhUDJ9+uS
	ACezRpTvYCcp1syajPCK6h09jXhTE27PsFjCY29yr0o7qPu9LnwVdRh28gHI3pmLcnTBDaHVp5y
	2BuygND4UJgGt7SaMdea8lZzmgWoUPQSa23kqWg/PkLLCv3MVNXUi/VplKkKf6pwexDcYRVIJoH
	F2cO6jYv9XPHubA0udAp9QvdpVeqddoD+h0HN9sHs+Z140z1keXP4VcY/m5XU61oZDpR7HyAjGL
	sQPoVg8KGbFhtCAZjpOQ9Jz/3yUD9lWr7fYIpEjnCdf4Ub8AZiEpzCEMPjmvsmfGjSi5ng06NSW
	JeBliLe9/pQ5MJMwRAy1d9aFhG0U+d2r6VKVLWrIup24+1huL1H7N9oCpO/v/9w/iYgKoKdwZ9+
	9LPMGknTLFNDjLWyole5rEweviV1pXCnjPX6vDljGHYBUdT3yCdDpv4B9pl2Gtnsq7K+AFbWrja
	QuyJVo+lW4GoUOdIlaTpI8c56LCcLLXYYXwYA==
X-Received: by 2002:a17:907:9618:b0:c2e:1ff3:9bda with SMTP id a640c23a62f3a-c31aa00d9b9mr1407684466b.22.1791923665389;
        Tue, 13 Oct 2026 13:34:25 -0700 (PDT)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com. [209.85.128.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9a9fffbsm617775866b.49.2026.10.13.13.34.20
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 13:34:22 -0700 (PDT)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a17baef589so2617605e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 13:34:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzaKxQDXUPgx/Ogx/v/uqpAcDjf+ZF7IwQICQQSQxRKBman3nf+XMh/2J/WNwumt7kfSmX8S80b383OoUs=@vger.kernel.org
X-Received: by 2002:a05:600c:8b64:b0:49d:174e:2a1e with SMTP id
 5b1f17b1804b1-4a18e498851mr285599465e9.19.1791923658971; Tue, 13 Oct 2026
 13:34:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAD=FV=VZs9bZciynpey2O6Yy5DQJqeq9Rgz_Ks6dgsBhVUkenA@mail.gmail.com>
 <20261013144849.343351-1-jerrysteve1101@gmail.com>
In-Reply-To: <20261013144849.343351-1-jerrysteve1101@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 13 Oct 2026 13:34:07 -0700
X-Gmail-Original-Message-ID: <CAD=FV=W=PJEE=N59U3X6dRP4ewGyKKp-Aqcf-a-g+t2qzGWu6g@mail.gmail.com>
X-Gm-Features: AclHuK-Dtu3q0Rry6LALk96rDZTOsReRNnz9Mjq4nuu4DdDjwOgB1XlO8qwgef0
Message-ID: <CAD=FV=W=PJEE=N59U3X6dRP4ewGyKKp-Aqcf-a-g+t2qzGWu6g@mail.gmail.com>
Subject: Re: [PATCH] drm/panel-edp: Add BOE NV140FHD-N43 panel
To: Jun Yan <jerrysteve1101@gmail.com>
Cc: airlied@gmail.com, dri-devel@lists.freedesktop.org, jesszhan0024@gmail.com, 
	linux-kernel@vger.kernel.org, maarten.lankhorst@linux.intel.com, 
	mripard@kernel.org, neil.armstrong@linaro.org, simona@ffwll.ch, 
	tzimmermann@suse.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Oct 13, 2026 at 7:49=E2=80=AFAM Jun Yan <jerrysteve1101@gmail.com> =
wrote:
>
> > > @@ -1972,6 +1972,7 @@ static const struct edp_panel_entry edp_panels[=
] =3D
> > =3D3D {
> > >         EDP_PANEL_ENTRY('A', 'U', 'O', 0xd497, &delay_200_500_e50, "B=
120X=3D
> > AN01.0"),
> > >         EDP_PANEL_ENTRY('A', 'U', 'O', 0xf390, &delay_200_500_e50, "B=
140X=3D
> > TN07.7"),
> > >
> > > +       EDP_PANEL_ENTRY('B', 'O', 'E', 0x03f4, &delay_200_500_e50, "N=
V140=3D
> > FHD-N43"),
> > >         EDP_PANEL_ENTRY('B', 'O', 'E', 0x0607, &delay_200_500_e200, "=
Unkn=3D
> > own"),
> > >         EDP_PANEL_ENTRY('B', 'O', 'E', 0x0608, &delay_200_500_e50, "N=
T116=3D
> > WHM-N11"),
> > >         EDP_PANEL_ENTRY('B', 'O', 'E', 0x0609, &delay_200_500_e50_po2=
e200=3D
> > , "NT116WHM-N21 V4.1"),
> >
> > Things look pretty reasonable, but before landing I'd love a little
> > more background about this panel and where your timings come from. Do
> > you actually have a datasheet here, or are the timings a guess based
> > on nearby panels? This panel is also curious in a few other ways:
> >
>
> Thanks for your review.
>
> Regarding the NV140FHD-N43 panel: I could not find its dedicated datashee=
t.
> Instead, I referenced the similar NV140FHM-N43 panel [0], which shares th=
e same
> resolution but is 6-bit.

Hard to say how similar a "FHD" vs "FHM" model is. Panel makers
sometimes use very similar names for very different panels. That being
said, we can look at the datasheet you pointed at.


> As I understand it, per section 8.0 POWER SEQUENCE:
>
> - hpd_absent maps to T3 (200ms)
> - unprepare maps to T10 (500ms)
> - enable maps to T17 (20ms).

The above doesn't appear to be correct. See the kernel doc for all
these. Unprepare is "T12-min on eDP timing diagrams.". Enable is
"(T6-min + max(T7-max, T8-min)) on eDP timing diagrams or the delay
after link training finishes until we can turn the backlight on and
see valid data."

You got the right value for unprepare. Enable should be 50, though.


> [0] https://raw.githubusercontent.com/yjun123/e-waste/master/sunniwell-z9=
6a/datasheet/NV140FHM-N43_GZ.pdf
>
> Since delay_200_500_e20 is not defined, I'd avoid adding a new delay entr=
y.
> Reusing delay_200_500_e50 is acceptable and works fine on hardware.

...so "delay_200_500_e50" seems right for the panel you pointed at.


> > 1. ID (0x03f4) is much lower than other panels.
> >
> > 2. The EDID contains the string "STARRY", which is weird for a BOE pane=
l.
> >
>
> These two points are indeed strange and I have no good explanation for th=
em.
> That said, I found a third=E2=80=91party EDID for this same panel [1].
>
> It contains identical information to the EDID I extracted from the panel,=
 so
> this is not an isolated case.
>
> [1] https://github.com/linuxhw/EDID/blob/9c0c1bffc9c0f1cb2044115149a5ecb1=
652803f8/Digital/BOE/BOE03F4/C26FE7F0F22E

Fair enough. I'm just going to append a note to your commit message
that the timings are a bit of a guess.

Reviewed-by: Douglas Anderson <dianders@chromium.org>

Pushed to drm-misc-next:

[1/1] drm/panel-edp: Add BOE NV140FHD-N43 panel
      commit: d81e2537f8082cf416e3de7bcf758191e8ef771b
