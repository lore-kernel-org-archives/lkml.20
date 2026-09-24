Received: from mail-yx2-f13.google.com (mail-yx2-f13.google.com [74.125.224.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61755490BEC
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 13:45:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790257523; cv=pass; b=Y6Nldn8PQi0sof0AMrY3dUJaIT8gcOp9EXyt67u7U+tU06PUntMC6OeKXmH08tckcSoQXDlZ+U7e2aRKRY0cAzhct8mfQQlHtoEqe0LQjbibKdp++LDbgdvXZ07JoY8z/t6pR6OCgc8p6VURB+cXiXopjDbR2QfVo8KDT8N7K4c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790257523; c=relaxed/simple;
	bh=jZQJkk3KHNIcE56oWvAfHwi1YqZoDB4/A8UkPIGIqKc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=M51VKvw9drydJ9EV33QtUltU/GRP9Wewghcs9EHWvHOGsQaijJVqfblrgVD0ui50yyUQnEvJFbg7k6YRam+M0c6Ww4XsHTznx6gSMOi2bgy4kNDMHC5ZxPwHpAuwoZi6ma+T06Kk18i82MlIHnt5eJympcIfec446+U8B6+p3+M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AkFm5kJP; arc=pass smtp.client-ip=74.125.224.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AkFm5kJP"
Received: by mail-yx2-f13.google.com with SMTP id 956f58d0204a3-670fee39d73so2238681d50.3
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 06:45:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790257515; cv=none;
        d=google.com; s=arc-20260327;
        b=lAyjMpz9gddLLvAA0xOObbZQlmXLyXCP/Q0uQ9ypjs8qrbPdfQdjq0bF784vZrt7f+
         +wrYfprh+Eui0bnqW0cjFYVWAQyzVBbOfyJWQTaaPzi/T33ynRTsB7Gxa6huQXGLUylL
         xtwxuUR3DyrLAXjirMBfpJdr67nR4yFwjj5GgCgxy3BTYjzxBI2UcXAe07c+P5G+vCzu
         ZUboPa2Wwm2VKhgI6An0QQbVAZz1v2YjY8AdJhbn4SMKo0o5+u7behVrdDgyGbpz52vU
         m/dh2KofdPQhPjMSg09xW+5lYXkcfVDmZX23b97dwYDBqJYZLDNUQlKlKOUnLii7oLWX
         59ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=FNNubV5ejx2bLbWQoB8ueW+/fkh0ACbiMkvSyTP+9DI=;
        fh=6d/sfe081E76Pas9muexKGK8gz+hiYKrwdOUnBWyzBo=;
        b=r8B1UC0YuXWXVKuUUrNa+aUCMph8o7EHu67w6IV81QUeFHmICk72KXOt8cDcVtt0ON
         sd0lKrizXaLN1eITCHxGFXpFf9lITTGEsi4VqfZjCpA1vtOKgNa7hHrthUbX/E+A5ViG
         QdyMrP9JSxo0jOmZ7VSx0gtHWWbZiDLmWU6yusiyKeMJlsdjtfa6YQDtf6ZjPQ20KSFt
         viBhiVLZlpGtgvMMOWHIf5RRVgmsAuDX8QOLtwuiMGq42ss9X0YwhcE9dO1RSH/B7CzX
         aIoBvsO9IgpI094QC30qFdkjlHeQi0Dgpbb8eEdwvQCNdz/mk/BBF66JxnPWzw2H5pSv
         1qZw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790257515; x=1790862315; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FNNubV5ejx2bLbWQoB8ueW+/fkh0ACbiMkvSyTP+9DI=;
        b=AkFm5kJPBWhEpym/Od1w9XRnCnR2bocmI+klD0GK7b8Ymlb9HOoL+GMivc3IJ2AE6X
         yRt/DNeQika1XXDo/czBrYXzdZb6HDOgQR10fHCltgK+GmHC9QQFH/rkjoIPLSgTxcq2
         K9WCyA2S0TswE4QOnbm8M8Jd2gcFpzFgRPW5jxL27QWTt3m3ukGYrd0mlTzVimC0spcf
         zf/yxUrJSqwBwpTSfjKDSDqb8KSKNhGIxG/jjBNKJVfEdflNU1zW7taNbJxwXq1bVd5I
         M/DF7KvXoJu7JFf2Knd2ebcNlDeD8eIM8pcFVLnun4yvyE8Qu27ajYBQl4Nv6Vm7HwNB
         gYpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790257515; x=1790862315;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=FNNubV5ejx2bLbWQoB8ueW+/fkh0ACbiMkvSyTP+9DI=;
        b=bOmIlvC77WpUGIkXwYh17BFDb8fO1bteleVCSetA6e4Yjuv33Xk+YKBlhxajegUjiq
         MnYB6yWhncheM7fU6yqS5ykulgq65O7aHebDowfT3uWXWx/dgHZgg0oB/ZWqq9PbQ28O
         Ng7Lv6ZohK3z6FKXHl3EaEORzgYjM46PRHNR/3Y96jTk338T8X3XtuY7PWy3UhvX6Yzn
         zl4kM9tK3Py4SpLXOfbEZ6gmsLdDFc8ngoCrYwnZX66Z113ZiMNKZ+p0TJhlfhjrDf+l
         4Y4sR0ySprttaoh2EDHHQt3b084Gux5nGb2f+FR6aVC7eDXdr6f9rOoMtmyqNuvs3Mv1
         nb5Q==
X-Forwarded-Encrypted: i=1; AKwUvBwA9eq9Gd+DYUv5Ffcu4HcxfE5mAC4OPP0T5/KXhwLIwsNyE+EjZdErWFRj1/jGrevBw1NRC0DgduyxeS8=@vger.kernel.org
X-Gm-Message-State: AFuF++n2ER5Nj5kqbfzv3KHbz3nwKQSnIt/GaXoy0P0cc2nvFGUKyvUC
	7Mn9FTJpDDVhKp8/6NckD0NqVl+JwoVmEe29M2wfQNgfG6jv3FWdhuy6gY+BwBxlNPb4ZS4cbgS
	7UMWiRk4kGCYcRr324+8NQlTaVvO505U=
X-Gm-Gg: AYBFou2CyMoklUmt9SKh8MxAcmLnobV3PwX2N5JFTGAPjjVdnN1Mh0UEmtfKzN77SVS
	qtjId0atCdHdwZMpK9AkdwgQdzyUW5x7FF3XCdZo5Uy2wyBSeGiM2p6WpfY15gNUqzAUX/FKcWk
	c3c93dmdEAEJyicfSqfL8BlHSJoumbA4twhYwNLtwZrWDC7PyfHhhAkoa35zd++jSM2PL20d8FT
	1GObQseOUSJMePSbfe5BUZfHWWqf22OtjvvFeh+E7EDOh8veaPQoNElGKkNu6tuy1jvzuyy5bd4
	DVI8qMHa/t8Gc+1V1/njU3wjuriI0kciLf+k+YLLOSLfxpDZfGdlI0tZxA==
X-Received: by 2002:a05:690e:118e:b0:672:d609:6bfe with SMTP id
 956f58d0204a3-672ed32167bmr1527450d50.39.1790257515508; Thu, 24 Sep 2026
 06:45:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260921073847.63505-1-lgs201920130244@gmail.com>
 <dd60ce64-4af1-479e-99d3-1787a06da882@intel.com> <CANUHTR9F+D1C49MLiiy5z1snyKtbBtdU1cnuhsgr0cysp+yOcQ@mail.gmail.com>
 <af20eb97-2fca-4ab9-9759-90b210b34802@intel.com>
In-Reply-To: <af20eb97-2fca-4ab9-9759-90b210b34802@intel.com>
From: Guangshuo Li <lgs201920130244@gmail.com>
Date: Thu, 24 Sep 2026 21:45:05 +0800
X-Gm-Features: AclHuK-k2HlTZ7P5DTUJL2j0cqyTUAaIHPGi3MajOMUrhuB7BSfKPVp4d38KpIc
Message-ID: <CANUHTR99pQfVVjNiQbVFQ9y9EAgTgxu6WbdSAcMxpWHJJuTJJg@mail.gmail.com>
Subject: Re: [PATCH] ASoC: Intel: SST: fix platform device leak on probe failure
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: stable@vger.kernel.org, Liam Girdwood <liam.r.girdwood@linux.intel.com>, 
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
	Bard Liao <yung-chuan.liao@linux.intel.com>, 
	Kai Vehmanen <kai.vehmanen@linux.intel.com>, 
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Thorsten Blum <thorsten.blum@linux.dev>, 
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Czarek,

Thanks for the clarification.

On Wed, 23 Sept 2026 at 16:15, Cezary Rojewski
<cezary.rojewski@intel.com> wrote:
>
> On 9/22/2026 10:17 AM, Guangshuo Li wrote:
> > Hi Czarek,
> >
> > Thanks for the review.
>
> >>> @@ -361,15 +362,21 @@ static int sst_acpi_probe(struct platform_device *pdev)
> >>>
> >>>       ret = sst_platform_get_resources(ctx);
> >>>       if (ret)
> >>> -             return ret;
> >>> +             goto err_unregister_mdev;
> >>>
> >>>       ret = sst_context_init(ctx);
> >>>       if (ret < 0)
> >>> -             return ret;
> >>> +             goto err_unregister_mdev;
> >>>
> >>>       sst_configure_runtime_pm(ctx);
> >>>       platform_set_drvdata(pdev, ctx);
> >>>       return ret;
> >>> +
> >>> +err_unregister_mdev:
> >>> +     platform_device_unregister(mdev);
> >>> +err_unregister_plat_dev:
> >>> +     platform_device_unregister(plat_dev);
> >>> +     return ret;
> >>>  }
> >>
> >> Looks like sst_acpi_remove() does not unregister the devices either.
> >> That could be fixed by enlisting devm_add_action_or_reset() in
> >> sst_acpi_probe() without altering sst_acpi_remove() at all.
> >>
> >> Would you mind sending a separate patch updating the function so both
> >> the error path and the driver-unload clean up the device objects?
> >>
> >>
> >> Kind regards,
> >> Czarek
> >
> > I'll update the title to:
> >
> > ASoC: Intel: atom: Fix platform device leak on probe failure
> >
> > and trim the commit message as suggested, including the
> > s/machine drivers/machine board/ change. I'll also add your Reviewed-by.
> >
> > For the separate cleanup patch, do you mean something like this?
> >
> > +static void sst_unregister_platform_device(void *data)
> > +{
> > +        platform_device_unregister(data);
> > +}
> > +
> >         plat_dev = platform_device_register_data(...);
> >         if (IS_ERR(plat_dev))
> >                 return PTR_ERR(plat_dev);
> > +
> > +       ret = devm_add_action_or_reset(dev, sst_unregister_platform_device,
> > +                                      plat_dev);
> > +       if (ret)
> > +               return ret;
> >
> >         ...
> >
> >         mdev = platform_device_register_data(...);
> >         if (IS_ERR(mdev))
> >                 return PTR_ERR(mdev);
> > +
> > +       ret = devm_add_action_or_reset(dev, sst_unregister_platform_device,
> > +                                      mdev);
> > +       if (ret)
> > +               return ret;
> >
> > This would let devres clean up both devices on later probe failure and on
> > driver unload, so the explicit unregister error paths from the first patch
> > would no longer be needed after this patch.
> >
> > Would this be what you had in mind? If so, I'll follow Krzysztof's
> > suggestion, organize the related changes into a proper patch series,
> > and send a two-patch v2.
>
> I do not mind either approach. There are two problems here:
>         1) leak on probe() failure
>         2) leak on driver remove()
>
> So, two patches-approach IMHO is perfectly fine. And yes, enlisting
> devm_add_action_or_reset() closes both 1) and 2) in one go.
>
> Kind regards,
> Czarek

I'll use devm_add_action_or_reset() to handle both the probe failure and
driver removal cases, and send the updated change in v2.

Thanks,
Guangshuo
