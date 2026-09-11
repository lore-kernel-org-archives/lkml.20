Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com [74.125.229.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA1204AEBF9
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 18:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789150013; cv=pass; b=gDODdI+zBN7KPfcknmfwhqzd4WVAXYhWvhucoNTIP8FzCkC7YDqcntdl1rDN97cvrFe9C/HRodv8ne+mW7lWBToBRmg85PQxqzVofGywoaq/SSLrA276mo83WIvVvwMVyU8k/md2cxQly7AqlL2Cm0GGdPmIYF+sj44qOo7+rA4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789150013; c=relaxed/simple;
	bh=Z3h9XI7kiJ+Bqo8r6Fo9Vj0SHPTUWjUPGxb8jcZpMiE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e8m1AOdFRQGfygxIRa4OSEAgDS+O4qIJz4XF/Hk/eAmk1xwpHDQkPQj4P/+eNFFb0wRq+cfFm3lfqFSSy48VZIMQqcKLUVuZl3jNUHoImiB+0/60koZAQYYfJgWy6cG5JDAztY2WGW7rOkub5Zej64K6D9HxtY3XyxxkL87QCoY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E1Z4+O7K; arc=pass smtp.client-ip=74.125.229.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E1Z4+O7K"
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b5e4f16f12so287214e87.1
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 11:06:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789150008; cv=none;
        d=google.com; s=arc-20260327;
        b=E2/E+5LIEmR98JDCPAEmQ4u8uWICQ+dAA4CjM/8G0dm7g+ED0I0LFMHM4VdOEk1lub
         Krz4Rn62rTPzYHnY/MdBkHK7sOTBuoDSLXmeb6xXdrOhvKtIfJ3SJ4uY8JLTXrNYjTi9
         2fFT44x8LQvxOSriOZiFkpCyFeD8uOIlAvvcVJN97vJen0cmyDAo2zjLUwAyViN7S26D
         z26+Nr2pCMgVdHv8/hjmgiacG+uBcn+n1qoJr1YP1wr2/L/LrOEN/pG4a3A3rDUcFFRd
         fWCaiWC8cmH0pR8wm9iuexOjTx+lEvxOX1LNS9O3w6EvR1TfgtfPs1c9qlQdP0tSm9Gt
         9vPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dKRvz01OxVroEE9Xne0Ge8hdQ6598p1iSks4jTSQkLY=;
        fh=6r2Nf5mapyEELWFsGun+dO8PZKta6Aajy3j4Oma965A=;
        b=iCwxK5TRTjoKe3udMbf+bFjcSFpNdqis6NyZ1ervlGwBaHVOkfEfW3y1N3NMqrNz/I
         UhQj6rnSPXUnDjuzslTCtIkxKRX0pCTUvtBwGcu1oNY7d5MBmij9j8pZSwABWrTNYwJl
         ScgalcR0f2BH71UMY38ec4PtLiEvrXgrpMM0u34YL5Cd8RS5/WxlWQCRkPsQ05rgO6ne
         xivH9yyaZuMaSAwAY6bzIHg+xsbHD9jopUx39Eq5MT9pU6QyEQUtR/hURrvBbn09HZUN
         3gyTTY6Ahhohn+Umd/HXq/6rjtSm4ceNPzstbtPxRWN/7j0GFAUmKq3SCUM+TRw/FMn+
         LDdA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789150008; x=1789754808; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dKRvz01OxVroEE9Xne0Ge8hdQ6598p1iSks4jTSQkLY=;
        b=E1Z4+O7KcU8Q5ypI67McqYrTU7a32ZoXnWDEz8Ukc9dr9FX8nWn0Fp0zluyfpo6iJD
         jkVo+XWHcdoDlOk+Wv94+P8PbhNfU2Fs5Q7Vbfb71QZXeZgBIfw77WfUj9RcNSCE0u4s
         K4sjQeDEmUWTV6ot3tqqmNrAuGC6G8hPE+RG1Sy1ohq8MoaLTSEbJTCZLkzxlC4Nnu+J
         eKKd8Ocu2mzeHBgAt0Nr+B5Z6SY929iUxwYcr0r05P/1Lmth269xAG2dSVDIkXsbUJMq
         OLIvbXCBgjyW2AshrPv9FCrw9OqA5JJkh1yJjSxShCuF9KbBhN3fKuj47qok2qtPwgBp
         GZfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789150008; x=1789754808;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dKRvz01OxVroEE9Xne0Ge8hdQ6598p1iSks4jTSQkLY=;
        b=C2zlYKxhfjyK+42ENRtaPIJ/qeWuokTjPLODqmiqtGDWz5+kyhOgiVRjHY76v2th4n
         1T4aKwquf4QEC240ZoW4IsN/lil0z6aa7KQ5IQ9M790EYbgK+PfTxxbzLM6zdAcLPva9
         s/kYUHE+0QSm1SfWwD1VUhJF3IwQF5/euLfNz1XCeRJVPK/qOirKeiwgNbOqN5bKCEuv
         vj6cv/oeuJ2h/lHfxZwb7S5virZrLoLldqZCpZpUVyJg7+He4fLb293ydzb+UZhdpHKb
         Die60J7+16oHOqgVQaCBQG/FMURUedAuC1TX9vVihhmG/55umRVfZK18FXNDwMpqeDaR
         qwyQ==
X-Forwarded-Encrypted: i=1; AKwUvBw4cVvjgTRalCyHMX7RyMfs1/dyhk6ztfEXewfjKzAMBiY5GwtbwEnso/E9zdVtOc5cYoIH2BOoENMoxwk=@vger.kernel.org
X-Gm-Message-State: AFuF++mKHmOoluxWYcJ9q+XgFeY0CqWYDitTiepPG6aNDp9NVCzb5k8A
	Kd+AldzLjwQcTKJv1dgY9eBsVjXh82M9o12rQUSzGdpVUGgKSBE+at3aDAyd3oHoTUBxvV7iz1H
	Y/7mQ3exdz4/lglFEHxo1uz7VYgCWlTY=
X-Gm-Gg: AYBFou1bneA8IyTZi2Am6USvSvxMS7Hp5V8WegMNv6LfCUS0iaiwrEB0eTUvieIKXpW
	uTJIc3W1u2ZfIVYm8W7AUNH9LMHt5Q1EVuU9lbM/vmzZm/QJIBqIlMmDtkoRY+ataCGzwpc9bSJ
	ioX/Aahh4pMsGw6SxOVzgkNwQ/Sb/FpKvkymgfFtSyjQMwm1bGru6aIkys0oBFqAO9zGF+07H9m
	j90HtsRKqBeicgfyh5jFzVNZ++K7RQdRLzoKVdXvdJAri6PjyUM44+vjbTShxKZOZ978wPiNiK3
	Gi+R3CCJMfSzGDAQeGOSGsFSCSB7nGsDVmPbZgf64el60sxlreaXrWhv2vcB+6G8oC9t1XTEiYY
	z9PhG9Ik4I/25zAJpfN3kwe+I6Cx14vtFIiZBsdn2b1E=
X-Received: by 2002:a05:6512:3da9:b0:5b6:425:4bf0 with SMTP id
 2adb3069b0e04-5b8a03465c5mr2526484e87.33.1789150008008; Fri, 11 Sep 2026
 11:06:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260727-t210b01-speedo-v2-0-4f287a3dab72@gmail.com> <DmzCZrobQoWdruuMTtwS8w@nvidia.com>
In-Reply-To: <DmzCZrobQoWdruuMTtwS8w@nvidia.com>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Fri, 11 Sep 2026 13:06:36 -0500
X-Gm-Features: AcwNN1VZm_hPjJL24YX7UodoRHHFuG-Y9JMMSCQQAeSp8mAPuz3TLz36ftvkl4I
Message-ID: <CALHNRZ_xK7uX8njW4vkiiJS-sOnb4YO0HFqHXEgPx0xZLc723Q@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] soc/tegra: fuse: Support Tegra210B01 Speedos
To: Mikko Perttunen <mperttunen@nvidia.com>
Cc: Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Alex Frid <afrid@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 28, 2026 at 7:19=E2=80=AFAM Mikko Perttunen <mperttunen@nvidia.=
com> wrote:
>
> On Tuesday, July 28, 2026 10:57=E2=80=AFAM Aaron Kling via B4 Relay wrote=
:
> > This series adds support for the b01 fuse revision, then adds speedo
> > support for known Tegra210B01 sku's.
> >
> > Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> > ---
> > Changes in v2:
> > - Update patch 1 commit messag to be more descriptive
> > - Update patch 1 to set unknown revision in the major revision B code
> >   path if minor revision is not 1.
> > - Add based-on tags to patch 2
> > - Link to v1: https://lore.kernel.org/r/20260717-t210b01-speedo-v1-0-f0=
4a8bd4d997@gmail.com
> >
> > ---
> > Aaron Kling (2):
> >       soc/tegra: fuse: Support revision B01
> >       soc/tegra: fuse: speedo-tegra210: Support revision B01
> >
> >  drivers/soc/tegra/fuse/fuse-tegra.c      |  1 +
> >  drivers/soc/tegra/fuse/speedo-tegra210.c | 22 ++++++++++++--
> >  drivers/soc/tegra/fuse/tegra-apbmisc.c   | 51 +++++++++++++++++++-----=
--------
> >  include/soc/tegra/fuse.h                 |  1 +
> >  4 files changed, 53 insertions(+), 22 deletions(-)
> > ---
> > base-commit: 1a1757b76427f6201bfe0bf1bea9f7574f332a93
> > change-id: 20260714-t210b01-speedo-07f8cd3b3aa3
> >
> > Best regards,
> > --
> > Aaron Kling <webgeek1234@gmail.com>
> >
> >
> >
>
> Series
>
> Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>

Thierry,

I see other things going in currently, can you pick up this series please?

Aaron
