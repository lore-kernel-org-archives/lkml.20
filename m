Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9473734DCE3
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 23:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792364616; cv=pass; b=leg9vxDwx5mG050pSHeos3sTqp/o8sRxrVn3udJXKwiOjeBZMfdLaYMaGGzRUqD2pBKzgHPruee9afLaQ9OS2nbQlyNjToBM8wPjspPJ1mqcuN9IB8zCVC6BHhYoycTzMDVvvHNwHKCfxSISAj92R14Qu7vl202MK5YJmSZoZbc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792364616; c=relaxed/simple;
	bh=ijO1ofwtEk8IQ9wrxIsbZ5OqO4mGdU7H4W4wNstdTvk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f76//f9ppK4EVKFi5DYDf2O52iJLEZu9gRGXre7F5cjqGlqIGb1BVAS4FOPfexWTdg3qZzezCqqToLeg5vBAd5etjxu8PblZRGGkEIPwQIHyo0viCfDRToveW1ghV36tD93jZuWp10+iGSP5sEk4DeiXIsbxoIMkn7bFflou6gw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=inBinjm1; arc=pass smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="inBinjm1"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-3a65ed9c7cfso10520541fa.3
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 16:03:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792364612; cv=none;
        d=google.com; s=arc-20260327;
        b=aR4rIGZyNakEH3lgkRuqADeUTW+/T4V88cuTE+b/dg4XVLQtao5n9O5VDMqcEFyro0
         Vfuz35GFOIas2qUeX9GMmpyKbKTTEFZBzxWLKN5Ii+fcnyIEmo8EML50z+znDvtSP42h
         MHFdbOGypl0GDmvKl49w4Qpvs0NzgjbaPvOw1Ws8AFg8LQiwde5IbizVOmaz+w/2E6Yh
         8hprcjdUDQqIpQ3m7L2PWvUKAk7oYMcuyhNJE3Xm03cKGghYL+aRiwIOxAWMMd2V+BIt
         Bi0ti3JZb/i7hhUgJ+DUQvQFc3ShEjvKC8sQB6yDpMUFIdMXih69f/GvSr0NX+ywq4Lg
         Z3iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=CtDEPcWWsmT1C69fTGFKrXB4DRq4jy7DyiNJS8fWhlw=;
        fh=t89Lskgsdlx3dNX/hlJsplo3Q1U8GyhZHZpifvx5WY8=;
        b=YMUEFnWZy928BpSr09sfYnWLplzpwTfj42BJobG8/dm+gRx2TAlj0OKxjY636FeK4v
         EHNQiMkBQ2d+2qRFCXsK11/UGwH1pFtn4STUP0hr0QBW0dmozecA/pyCfldc6lTuauyg
         LuLLjlzh4ajNkgBY15ox5mUDAgCiQN/KCpN565uZW7zm0yHOhrII2FBXbbzdpPGQUTER
         S50lbgAEFtSHGG2IbGEF8D3dyTh+9LRrM4EO+yEBbOscCA8Utg4b7+FVlN5COmisBpn6
         e+crf/ufeyl9ZU1JYaT4dyHLkD6LcsfcQXkAOHdJFYsSJYQb/RRvSflJV9pYUSLquXoJ
         QIow==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792364612; x=1792969412; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CtDEPcWWsmT1C69fTGFKrXB4DRq4jy7DyiNJS8fWhlw=;
        b=inBinjm1BQeuHPft3qhR18LQ0KyeC/S9aDax9RgINjUiP+vH4SmdMTAcLVNap3GtOK
         FfihsA7Si9I6npjZ3TmnZV0idxtGeW9IKoeEqxGrWyKzzi9MMVRu4MhXJg44+5KAQSNS
         yshtSaQeDySd+bNiCJnhxxCLUrvSCB0XakcNkU+AR9URdnnqqfOFMeSlJkxmVX8Q0dRD
         y60mJ+7WTbXBTmcLvQiw3ZS+Xwxi9J/4dJNE5aJB755gwxtnszmnbZqT7QQgExbV0TJI
         zJGQQxFOPwSyo8FAbzNUvsy1Jm3r/jAxjwgqpOXXHFGV74Vi55DIOvyEPU2V0pL+m/c9
         Vojw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792364612; x=1792969412;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=CtDEPcWWsmT1C69fTGFKrXB4DRq4jy7DyiNJS8fWhlw=;
        b=1CywD0wugwtou5gaJOI83RRP/AO1llmiC3ELBT5oHf7T/tjSechgs7Vsoci/DKOA9r
         baAYMCr8asFk5kbw3POZkfIMZQkX//nhPjukNgc8AhMHw6B3IRgoi4Sl4kLcZYJrh0Fh
         /5M21/haq5oa0+8n0rGExvvq26a2k4HIC/nqXilYJ+fXpFdrMjbP4gro/K7SWdpzw8q2
         uWkwvAl+V36FUNPpMKWmvtpsG9SZ25PVihP62VIpYKXDu3QBYSXS7F46ijMZ8Cvih9zq
         lLEFKobJXQ2OPU+zixvqOODLvJoTMcAMJYkb0d8FcftuTpxuQo2BCTPmCC66M3qpwR6Y
         97Aw==
X-Forwarded-Encrypted: i=1; AKwUvBzGG8nm8BqjyRzxgmC/p7ZJsGbfsqZ5aTONT1twmutU/CJTcsBl5+tbE8klbvJIys2tLTYwn7h+gXmNgrE=@vger.kernel.org
X-Gm-Message-State: AFq9FYLnrGKZ4D2T36Wx92M09LEU7eYTEIFiJAmPxNAMwk+11N0A23cN
	zKlG5XvqczmgPKdOZqZC8B3nVGHX1KzXYaM9TGasWgwk0Y9FsuEnbavDxaZqbnBYfYI4DZzSwMM
	daxv+kG42YynTK2aEIHYQmnqCTlo7HLQ=
X-Gm-Gg: AYBFou0b0TXKbewCZkQIuAj58/ezBpxjoVV0Eu5q6uaqSzGYQKglUP5Jw5ZsmMH6AsD
	K51eeL/MRqk1w3+2+azFXMmBrJxTy4PI6OypbKVjeQouo+6iVEBFDOKqS2uswKrWR+nGLxAEkWL
	OIOFn2uUKP020Fcm0csFKmyep0A4tP+noTXEzRWzFhr96qbvOI3CLg5e5b5Tt5yiHh0dvFlFANg
	9P8oDp+J074Jn7/5J8hYGE0C/+dAAqKkv+sEJdk9CxFEmlAhNMAdkWH5h/J1xE3VUPLKxc+/m//
	aioDKa1Rm1mOggda4nbbNs6sRzdAa9ZfxIfTyKt9XXADnhlA1ofIMW2xcCd3SMeAHMzSWymWQ+H
	sbeXZX/3/pZWc0f58Y4FcBcXFITDLyHeZW7RR441zpE2dO+vLAVIYPdIa5Rvp2BfloxFj90rPB7
	Ag24Y1gnz+nqyEfNxa8fmirKf85Cn5lO64h+P+8fiKPnFHC89i5+D02+2FDDhmUVl1tI1mKps=
X-Received: by 2002:a2e:b88e:0:b0:3aa:f42a:b78 with SMTP id
 38308e7fff4ca-3ab292ead58mr14531581fa.20.1792364611365; Sun, 18 Oct 2026
 16:03:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261018200009.1493438-1-matthew.schwartz@linux.dev>
In-Reply-To: <20261018200009.1493438-1-matthew.schwartz@linux.dev>
From: Lee Mann <leepaulmann@gmail.com>
Date: Mon, 19 Oct 2026 00:03:20 +0100
X-Gm-Features: AclHuK8Udt_rUpVjU1H7ERu9sfyMPax2ZWl4XcdoMOoyRgj4wfj10Hek764Ch50
Message-ID: <CAJgi9roCJtatxZuZbgHZucWjid4z2ZBiZfuz1oc6mpUHq8dbKA@mail.gmail.com>
Subject: Re: [PATCH 0/3] ASoC: tas2783-sdw: volume and firmware load fixes
To: Matthew Schwartz <matthew.schwartz@linux.dev>
Cc: broonie@kernel.org, Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
	Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Andrey Golovko <andrey.golovko@gmail.com>, Bard Liao <yung-chuan.liao@linux.intel.com>, 
	Niranjan H Y <niranjan.hy@ti.com>, Charles Keepax <ckeepax@opensource.cirrus.com>, 
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 18 Oct 2026 at 21:00, Matthew Schwartz
<matthew.schwartz@linux.dev> wrote:
>
> Three tas2783-sdw fixes found while bringing up the ASUS ROG Xbox Ally
> X20 [1], whose two TAS2783 amps share a SoundWire link that is powered
> off when idle.

Tested on an ASUS ProArt PX13 HN7306EA (two TAS2783 on one AMD ACP
link), with the series on broonie/sound for-next (686b3eff60) plus
173cb3147ba2 ("ASoC: tas2783-sdw: split a stereo stream across the two
mono amps"), which this machine needs for stereo and which for-next
does not have yet:

- stereo playback after boot, no ASoC or -EBUSY errors in the log
- volume changes while both amps are runtime suspended work, no errors
- after ~2.5 min of s2idle both amps come back at the level set before
  suspend, with nothing done in userspace

The PX13 firmware has no usable SDCA function type, so it takes the
tas2783_init_seq path; the ACPI init table case in patch 3 is not
exercised here.

Tested-by: Lee Mann <leepaulmann@gmail.com>

One thing you may want to check on the X20: on the PX13, applying the
ACPI init table (via the fallback in thesofproject/linux PR #5904)
together with 173cb3147ba2 left the second amp silent, because the
table puts it on Right while the stereo split hands it a one-channel
payload. If the X20 table also sets a different posture per amp, it
may hit the same once for-next picks up 173cb3147ba2.

Thanks,
Lee
