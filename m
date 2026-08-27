Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74B273A4521
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 07:58:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787817498; cv=pass; b=N9wRquSr6i7JSD0xGqLkf9T6uYbU63K0W9kkct1zCG50xHEIr5KQsIulF6p1NLcRVCF9uW6hfOCR3Mc61qAckmepXXMpxOH+NiFkpb27XPeWXvzfzlLDJPMurKCrvZadFA+rPsnpk9LRE/7d+FDI5o6DEIAUWDLTg+Bgb53sB7k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787817498; c=relaxed/simple;
	bh=lotjI7DGya2jvffM5uBbsyWkSe6sFtu18wkc9M1Lrzs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BvTpWH44HG8a9kNiwKVhh6yyh8Mf94mFoextPxXywPAV/6ZuAGs8sNECcadMe0b8wpu/wof2HMJb0k95JNbvVZt35Rf44y5VLi+UrUNMr+rPrwtIXww6+LRjh/G1GC/+K30AJlIAqCXUr0AGvtkVl5p45uFWg7D0SPnG76/sKZk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f+agFnWQ; arc=pass smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f+agFnWQ"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-38e58034d05so435245a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 00:58:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787817496; cv=none;
        d=google.com; s=arc-20260327;
        b=kgP7z2dErsVjVYQYEc6BXdd7zMUivFpQESTwQILPrGSBA5D2Esmxy9bazevGR4C6Vs
         8lDZ3nW3gfiUSTrul7fOGYtIzPtghYHzYr+T0eVKStvT82+hYBFhAXy+hyM6oGwGWnPK
         C9qMRz0rXak3Q8BsAboDIeM1M+tXadYG55qOLEWhDNVYvmYlPFd3bPl6wk1fwg+uoeUN
         hvO8AsE4XvcEgm7M+cCupoj/evEqxoKvAKvfbIMQA0evfw8XmBCvOBUamdMj2wHpnIy8
         Kln/WtS3EeWjpfUkmcORKLlmaK8mvblKpbPtZhFy1Ue6UQSFgh7guncBm36bCm828MNB
         YIyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Nrk8uUDBNanFfnr96a4o3nFXywW6wHqNdCn0K9fnuO8=;
        fh=Up9Av/EXbXS1WgEx7O2pNnBZSpljyqIH1ATTVBZXRmw=;
        b=ojNr2VZkLKuvro0wHSw4gOnbKiUshkT94JjQrDKt4JWnvsqU8dQOGsp8fe/JVo2tUU
         bwj3qjk2cIoi9tCEjmfaZHBb9Nkdh4HcdqJNetsY7ygtOUPlG+G0dD5rDOx+u7+1wAoT
         INSmr+JcIlsV/zJrGJyn5SGcneVVKesNKeWgvhBaMw+LPZNX2kIheohWZMCQ24vNeHAS
         ZB+kp20O1Y58PjHQAt1+SrCRnXs08f49Hu62xpK1Tz+IWGXLH5dlcfcq+UwocU9gKuul
         yn40n/qNg/NzxXwGN1blYcf8stRxv6paJVjogLcVmO9OawBglsTzb82bRvekEHlSkk68
         VQag==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787817496; x=1788422296; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Nrk8uUDBNanFfnr96a4o3nFXywW6wHqNdCn0K9fnuO8=;
        b=f+agFnWQdzfVJzq26Sxor8l0kPRutQBRGUGYa32Ue5TsaUDQAVTkkv6HL08DmxKmu8
         MU+Iw9TNU0MwvHbIsDIHQHSoRnjKCu7dfZjLacyk2Ww60u2gzNgNlVh7tyAN2r0zZqOz
         +XYosVZrgabCLVV6YFBsCaie1Yd1rPx46WtB+ebiyo8SRbuDKCUoJJTb+dElS6EIsF6p
         tUNDPUir197+kEbxO6Li52JGFEB4wEw2m4sHxVHjViboFuJawf5+x17KecHay80ZO7XQ
         6WqImGMt03Q4SVcs2FpJEozZiqKbyJ9M0XBy06wWy+vVl7zQq9t50qjNoYgTVeJwso/h
         HLmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787817496; x=1788422296;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Nrk8uUDBNanFfnr96a4o3nFXywW6wHqNdCn0K9fnuO8=;
        b=lDEDWLbLiF1T7N8YcYoU+VX5qaXFWmp6orlyir+gUwPquhS72fjS8eiZPtbeu+kB3h
         WGutVUYVL8gPFtBxbozmM/TZlBRD/b6XZaWYgxbu/vfnTCEQWrIZfmeDBM8eTwf9FPq2
         b9aEWje5NSYuDPV/YdRLS95+ev07F2qYomu2rOT5jlK19tZTxiv9vy69R1W1FudSgIkt
         TanEISc50x944H4HpmrLbiz77A7SECuLwKU52RZn9XuefQhjxc99RJlAzZFFtxHqn3ME
         +Fewl2HU5zHkoXy45qUYDmes31K22J8xH9Z7nKLbTPGgAY/c3YkjDzDovS/kI8hrRUuP
         FrRg==
X-Forwarded-Encrypted: i=1; AHgh+RqNS+GIYXqSJ5A1B0dOg+7WWIztJZLsM1tK/IR937g9QFUGg4OlJyylEpStQhJSxQqBVw80oU7dkjPJqcg=@vger.kernel.org
X-Gm-Message-State: AFuF++l4OdVmk/va2Cm8S4xuH+nuHGVPjRkOx5wGtU3zA+mEii8e/+41
	CawwZJQgoAS6lQnzcktOf8JENuydWYHjmQuY4DlJk1aiAsL9G+xFSYW10RBhZWzWJPrUpe9mULE
	Qlw3zxvaZ3PVpMfMt+GL2HAlJ7+GZCVs=
X-Gm-Gg: AR+sD11lN/U7Tw6ULCj6meIaf1ecbjaA+MIoe5zjkCPgCqOv5DQWIJC9JYG5O/5SaYX
	VpIKVEJWWBqyn0zopEzR6VKdIBIH9ccjEsmMnZW71D66BZ7StBGQsmq/dIvraVhHNRCxtvsZxuG
	HJkqDKFPYsQiKSKzGH+AWI5SMyj64KAhOgc1sD1OoWrYGFl0jWRgAz1on3hbNIS0o8ElC3giExB
	0vN/qAqSuJUQPIAEZsA/uapOKM4MYtUQZGG1q0UQhjySlr0lgdELRsm4KT/OC2GcCm67TKHUm2l
	j6UH2YK16UvbSV9zgPVrE2cpsRTrV97sPqnPilBpEpy89z+stx/c7SK1mcEbo62/Av5X3VfTBo1
	06cKV63kaEREhAfZnOVNA6NKAdJzmMFFW06X0S0U+ApCzTNsbAhq/XTsy
X-Received: by 2002:a17:90b:1649:b0:37f:fdc8:71b4 with SMTP id
 98e67ed59e1d1-3966d3fe36bmr25869449a91.2.1787817496356; Thu, 27 Aug 2026
 00:58:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260821122928.41343-1-phucduc.bui@gmail.com> <20260821122928.41343-3-phucduc.bui@gmail.com>
 <47c14ad6-0311-467b-907c-517ff5044438@intel.com>
In-Reply-To: <47c14ad6-0311-467b-907c-517ff5044438@intel.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Thu, 27 Aug 2026 14:58:04 +0700
X-Gm-Features: AcwNN1XimKrPZge6zf8CptLL1uRO5gf5i0cHec8ah767upjHTgiSMh8y0Tz3b7w
Message-ID: <CAABR9nHyDL8=EiSi+_GBpHM0xLZraH8az+HRXQWudG=1hLZ7qQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] ASoC: mediatek: mt8183: Fix APLL enable error handling
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Jaroslav Kysela <perex@perex.cz>, 
	Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Hi Cezary,

Thank you for your review.


> I have mixed feelings about appl*_mux_setting().  Take a look at its
> disable-path: if clk_set_parent() fails the follow up
> clk_disable_unprepare() is skipped possibly leaving one of the clks
> hanging.  I'd expect error paths of callers (of said mux_setting()
> function) to ensure all the clks are disabled and unprepared
> unconditionally.
>

Perhaps the primary purpose of the appl*_mux_setting() functions is to
configure the mux, as their names suggest, which may explain why the disable
path is currently structured this way. However, I think your point is valid.

As far as I understand, calling clk_disable_unprepare() before
clk_set_parent() should not cause any issues. Therefore, we could move both
clk_disable_unprepare() calls before changing the parent in the disable path:

------------------------------------
clk_disable_unprepare(afe_priv->clk[CLK_TOP_MUX_AUD_ENG2]);
clk_disable_unprepare(afe_priv->clk[CLK_TOP_MUX_AUD_2]);
ret = clk_set_parent(afe_priv->clk[CLK_TOP_MUX_AUD_ENG2],
                                 afe_priv->clk[CLK_CLK26M]);
if (ret) {
...
goto EXIT;
}
ret = clk_set_parent(afe_priv->clk[CLK_TOP_MUX_AUD_2],
                                afe_priv->clk[CLK_CLK26M]);
if (ret) {
...
goto EXIT;
}
-------------------------------------

To be honest, after looking at the code for other MediaTek SoCs, I found quite
a few logic issues and inconsistent clock handling. This, along with
the git log history,
makes me wonder whether these code paths were ever properly tested on
real hardware.
Therefore, I have stopped at mt8186 for now.


> >       /* setting for APLL */
> > -     apll1_mux_setting(afe, true);
> > +     ret = apll1_mux_setting(afe, true);
> > +     if (ret)
> > +             goto ERR_APLL1_MUX_SETTING;
>
> Why goto? The check is valid but the label in my opinion is unnecessary.
>

The function could return directly here, but I used goto to keep it
consistent with
the existing error handling in this function.

> > +     apll1_mux_setting(afe, false);
> > +ERR_APLL1_MUX_SETTING:
>
> While UPPER case for goto-labels is not part of the coding style I see
> why you did it - to be cohesive with the rest of the file.

Yes, that's right. However, I noticed that the mt8186 code uses
lowercase names for goto labels,
so the style is not consistent across the file.

https://elixir.bootlin.com/linux/v7.2/source/sound/soc/mediatek/mt8186/mt8186-afe-clk.c#L303

Best regards,
Phuc
