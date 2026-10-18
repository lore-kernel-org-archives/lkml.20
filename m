Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D749E3DAAB9
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 10:41:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792320069; cv=pass; b=EarPfe/F8lF3Jld86PjVw3I9buV10emBQ84gFlR0TcQLGP3cz+ZuxtMLUHLiqJZ99yjmTS5NTk5aEZx5aqaGMlBupf0cY6PZYWRKyn4APkJTQ6cg/KGImDwXIWUGbjkJbI8mrHoPBmUypGvSCvhyZFg+yc+XMn1Kt/eMBWVrXLc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792320069; c=relaxed/simple;
	bh=8jhAuc7pwWvfqOH4Ow9qWedCG7FGjAiVn+1XI19X5Rc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GqDHPjV6kgVBSU22fZGw15DqdWfVUmidd7ftmtiMVss8vXpbGUB/xVM9u5rI7QuRBzJRtY3vEXJ82i0+SUL9XLKL3/xK4T/B8k3ETt/ivfxPPfBg9zwsMbG8q3wJ8YcEPOIKnU85uXYzcTFhyo2W1jT+cIxwAYPg1Llx6mzf36c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sqlLYroZ; arc=pass smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sqlLYroZ"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-3a9787a156eso8492511fa.3
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 03:41:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792320066; cv=none;
        d=google.com; s=arc-20260327;
        b=NRJvtlB6aI309DAVbJ3wjd+GRaHvUpnndDi43gBcH5OVFZjX9rpNywUXUUntkYQ2tC
         nmKKT5ZD3qCJd0DeCYlAJ7iJAqA1xG9w0HidpNpADUWLn88mXoFCdxZ9IrY0Cx9jH8Gp
         RFIfaZZpgzTMjwl8fGC5XPVwSBQjrs86iIy9/Gpds+9xa1WK8Yky9eM6nPdqMSSc0YDY
         gd6EVDkj5OdGie+vbIFvSZ2qXS/dwx42IT1mGj1elqmMEH84bhhP/AnDXRXpZiCMLlNI
         Kbk6obAQpcqaWt2pb4q2eTK1QIWZDlJFaYGig6jeuPUTM0r2NwNV2J1Vh+EqmB83N0ZA
         dAJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=a6yENM5EuRAmJBudT6I5Nb3Xf4qZEcKL22EK2zMKYnk=;
        fh=FpwZ8159Ux5XEqipuPWqiVDxWPyk/vs9cLkXr4IGBEQ=;
        b=Ki5dQDSJ+anveMmy6HS+9x46AammQ3qSA/SMsk9IuV3gsIsxRzyYvEsg4UqpWReKdK
         aqMJrudhpnAqad2ZmukZkCjCu1IbjSbyIZSlL7KmkICTNaImL27hjaHUvRit4pPD8Y1m
         35bpHDrRObZFs7KkFzxGnyS7YKmzCixcen/QF5fMdVaNo30Keaykyq6DkYUnQG+f09FJ
         X4X7+8uDITsO31iahwQFpZ4mNhydXWcY3u+m08uHo6I+5eKCrbazKBv50v00JwyR31W9
         awmB+BYVyQd1XMmM4IrdSmeuIou4LGUiuMPegV4CRzM0dbi758cKoFouk4+VTomj6GBr
         aCZA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792320066; x=1792924866; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a6yENM5EuRAmJBudT6I5Nb3Xf4qZEcKL22EK2zMKYnk=;
        b=sqlLYroZXcWgS/8iD8QwOb0cOQyMGpvXtxqS/DWu3x/frQCXcYTBLcwQBTKeKOpeo3
         Prh57fKomf10Tqk64OV9alUuk8cJSm0ih6Ta+tqKXQpyViNKD9aggHYcmo5yQ5kIefdb
         WvzT5a6ZXulHYXlhZWGO1atdQOyM0w7yfEb9diFSPxHuLQCryO6HiqjXsJuwCxIDavaq
         /xt+p6AIwRNWtdfFaDLCiDMJ7E3WnlejSrnLW9ubkHTb3O9awPBJhD975Av3V/WbV2Z8
         31CHc/sD3NQsm5zuuiETZQHq06LCgXmSWJ7wOkFFjhoaRFPkojk8mXnaqdDq2HCPiNkS
         YFoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792320066; x=1792924866;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=a6yENM5EuRAmJBudT6I5Nb3Xf4qZEcKL22EK2zMKYnk=;
        b=DcDemfzsYPoVEL3rh9DjtCr8kJfiRcKYzG4HUcy7dJ2IcsKyaO/Bv0MV54smQRHJM8
         hR1Rxuv5PGkXHvC/wV/gwuwDyvj+ff5qhhXocdQ1fPXpf38m9ZSDEhiWCqggZjIkEvYb
         Ng8zoP0DT7gPAGxoPyN/WDXqfh+xwGyIL6Aa43L6ZHs/z36nwIaZM8mkNlJPGmyCBm8t
         31ohquWD3evfBp/1+R6KXbCbcD/2jHraWMKe0Y+rwAFQIvHvlPzgIYq2ARBJhBl85JnQ
         PyS4iIuquVA4vuB7QZVqwqGoyNyGCfIgpvtrYWd0kQhXVaHNKRuBB5dshOMxf8lQPclb
         Xw6w==
X-Forwarded-Encrypted: i=1; AKwUvBwWBTyD5E6PmXfAEvh24OPeg2MtQSu/t9Xrxk7r1+fW4GG186gC2Xo0uDDlS7gWpvVjSNwZdk4mVm4g7As=@vger.kernel.org
X-Gm-Message-State: AFq9FYKx4lLPFg1TVNn1P8SgLGHqWEpZq+yinLkuky+i7tRYChzJBPtc
	7EQZwz2hk78gJIx6THKyXX2o7gDj5sZNd3Zm7aBMFkSiK1S+8wlpBUSd46pazhaAZi9Mj/RLuxE
	wdYeMeNpGWK6ZkDpxR/9c+n0DCQav0JY=
X-Gm-Gg: AYBFou31fBbC7OFter2d7p9Yo9WgXNKjia1wgCDTjFecSaVipxrKhkFuP1rXuetzGAL
	SDMukKgQNnFWxbfwMdVoL8ZSmKPrCnNy5HeSGHgBS4GkG/2B6l2uSmx3qO7t4GbvrXuH+KV0mCY
	cOVjKKRdOvkOtwKPOCGyuyZxmDWAHegOwZIYmOdaLSyFVuwM985r0Iv6oGGy1IM76PZDvLGEOSJ
	8e9sMiqBad+733KxFuYa8ywLM3bmfzVkozi7fMFN/XJboNEjdIa5M1crK9SCinHcWeUZY8iz6yu
	GFJO3i4dwvK6aTAqhQMHWn+6h25bLh2LxJRU1vnFSHyqZhybzUN9ROBRoU3aodVuHF4Ng1JwaPZ
	yQ3A7ZIuarVqWO0ij50ivgv/6/hg4N7KW4xDbXOeFhL84RiifmQITff2djQ5UAnF9x8+V0+mUWb
	5I8uuq4Bq6uv9WFlrqmZmdG97rvwrctcyoo0Te27TGpHurh8OS6MK0dlCxZDGSze20jeSvIlM=
X-Received: by 2002:a2e:be27:0:b0:3aa:f1f0:1e2a with SMTP id
 38308e7fff4ca-3ab29294e73mr11194711fa.11.1792320065495; Sun, 18 Oct 2026
 03:41:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261016102846.22908-1-leepaulmann@gmail.com> <9eff39cf-24a1-47f8-ad78-781d467cbfaf@linux.dev>
In-Reply-To: <9eff39cf-24a1-47f8-ad78-781d467cbfaf@linux.dev>
From: Lee Mann <leepaulmann@gmail.com>
Date: Sun, 18 Oct 2026 11:40:52 +0100
X-Gm-Features: AclHuK-dBsw2XRKK0VBBmns2XgkV6vizQOqMvQ_kjopl16lqoHClNrkOWUpQeuI
Message-ID: <CAJgi9roroOLL+ftaufLfB-K2_oMnVf62yODHFf-AN37hh975DQ@mail.gmail.com>
Subject: Re: [PATCH] ASoC: tas2783-sdw: restore the volume controls after re-initialisation
To: Matthew Schwartz <matthew.schwartz@linux.dev>
Cc: broonie@kernel.org, lgirdwood@gmail.com, linux-sound@vger.kernel.org, 
	shenghao-ding@ti.com, kevin-lu@ti.com, baojun.xu@ti.com, sen@ti.com, 
	perex@perex.cz, tiwai@suse.com, andrey.golovko@gmail.com, 
	antoine@montane.tech, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Matt,

Thanks, that sounds like the better fix. A Reported-by is fine with me,
and please consider my patch superseded by your series.

One data point from the ProArt PX13 (two TAS2783 on one AMD ACP link):
with for-next plus my patch I didn't see the -16 errors at boot over
several boots, so this machine may not hit the idle runtime-suspend
path the way the X20 does. I'm happy to test your series here and send
a Tested-by.

Thanks,
Lee


On Sun, 18 Oct 2026 at 06:37, Matthew Schwartz
<matthew.schwartz@linux.dev> wrote:
>
> On 10/16/26 3:28 AM, Lee Mann wrote:
> > -     return snd_soc_put_volsw(kcontrol, ucontrol);
> > +     struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
> > +     struct tas2783_prv *tas_dev = snd_soc_component_get_drvdata(component);
> > +     s32 ret = snd_soc_put_volsw(kcontrol, ucontrol);
> > +
> > +     if (ret >= 0)
> > +             tas2783_save_vol(tas_dev, TAS2783_DVC_LVL,
> > +                              &tas_dev->user_dvc_lvl, &tas_dev->user_dvc_set);
>
>
> Hi Lee,
>
> I ran into the same bug bringing up the ASUS ROG Xbox Ally X20 (two
> TAS2783 on one AMD link), and there's one more case this doesn't cover.
>
> On for-next idle_bias_on is 0, so the amps runtime suspend whenever
> nothing is playing. The cache is dropped on attach and after the
> firmware download, so until something writes the volume registers
> again they aren't cached, and snd_soc_get_volsw()/put_volsw() fail with
> -EBUSY from regmap in cache-only mode while the amp is suspended. Your
> restore fixes that once a value has been set during playback, but at
> boot nothing has set it yet, so the first mixer accesses fail and every
> boot logs "ASoC error (-16)" for both registers. On the X20 the link
> is also powered off when idle, so the amps are re-initialized on every
> wake, not just after system suspend.
>
> I have a fix I was working on that addresses the same issue but keeps
> both values in the driver instead of the register cache, so get/put
> work while the amp is suspended and the values are programmed again
> after every init and resume. It's part of a small series with two
> other tas2783 fixes. I'll post it shortly with you on Cc with a
> Reported-by on the relevant patch if that's okay with you.
>
> Thanks,
> Matt
