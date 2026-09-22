Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E744141B8E0
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 08:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790065226; cv=pass; b=UnUEdCD2BOjxVyFuDG0rxWMsNjLunspNo+nd15nlvr8jGbtNfsszqGu1mPdveKm6sU845eIDS0gXy0W1dfUtyAWdUhujyuSLJnJFZZZNCmpSNcG7h3AEIZFUPFykrciIGVSmFvmP2iv/7T+CjJHsJYvMpHxXawyVH2DQIz6vWnc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790065226; c=relaxed/simple;
	bh=hM0EaCqPsrA1hAcKzwMcf0Q3QOnu+qe7h0GMMmXoql4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W1fXvoaGkm7VgbKk5mJjEm/MblNqkxk9w+x1xfOB+f7c3ACmJQFo6N8LL8Ju5ofmBTUUNpsMxHuJCpJzN/DHgaXVUFuIsfiVLzzGQh2KZSCUJ5MajoIQI79IdU7EcwTgLoO53KeNmGaaNBNxUIuzpYFIMbbDXkNtpF8Uf9JIcg0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WBmhKwMq; arc=pass smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WBmhKwMq"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-39b2ad83dc6so3357842a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 01:20:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790065224; cv=none;
        d=google.com; s=arc-20260327;
        b=NpztvH5HW+jQt4Xhdcw3Rw22s+wBHAMATwrTjqYDcXnmxSVxcou38uEVD5+iIdhI5R
         sVy0U0HQOWQXHn3hhgHgBRPbbgF4LvU0WBnMIyaJ4ctvbOPbmc3TNOiF1Gua6oTj+pzx
         ou4d/RiVjYruVsg811s7HSRkH7jabpZWxFiLP6DbH0aHJ414dmujPaJVdpfvABgwyghF
         3be+2HCS2nnmRqcqlWrWzdVbkpNRQ6fS/IBZ41RizmEtrXUhfFmV6YxsPUXOgF/YTREJ
         bOdadnQq8tHIHv7HRZWUu07EP5j1j+2Rxl85mAWCvkkR1XeENgdu4mrjAn2sFBXqH6fu
         X5VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=etyNrSdg7SELADqdNG6OVH3H+CXSg23SDODY/D8rF+4=;
        fh=7d0clu6Akhw13Mc4cR+hdrSyBpULB5Au4aG9lY5ozyA=;
        b=Jx1a7UWkMHfpXY1uLt20Z6n/e40oDzg0XPGkjE6r7Df/45DldDUUWud1HzBbBxhGOK
         acLe8apV6hQQmkGEdGdPMEuqKn4r9OWvPy1xiZSNFcy56/emrpRMy2b9dSlHmzvXM38p
         oB1l/nxsKbkIcG44XJLjWZx5rmTp83ep9F/+vew9dxGUKNN1scKHrZt7eMJS3gf6ypoK
         6S2agKy8t5zXP3Eq3DXZWimBH62grpMz75aAvtqFqGVWhnvaq0DvJQLj44ijjF6AjKjW
         IuJt+zHRICf38OEZx1uDRadE1wiIZi0atUUbYN4uTsnwbftpBKKKRDt0u0JR8IWJH541
         8dGg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790065224; x=1790670024; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=etyNrSdg7SELADqdNG6OVH3H+CXSg23SDODY/D8rF+4=;
        b=WBmhKwMqI8+7VIgKMApl/5FozsahuYbt3mZUF9jH7uuvf9TSGL+z0jgchG6iBxoy0/
         +Cb62Vc+vC8FAJXtcoW4VdJUFs9SrT+54X3nEmI7+s7eMHBcYwovk/wR4lrZase1WBlc
         MRDoKKyMflBhmrvjzyt3MV7XXXYz5q8D6CsCYJQxBskzziC+UNYx2Ix/5svtl8Od5aJW
         5rVZGgMhkgOFqo1dEkIHLhEEU/A3lPvmIzzLRiWeQk3d1QPCqZMwqLqCq70lEEeZfaYL
         gQ6BKcDnMnQFAyYF/f10++L3ADTmsjWH/2uQ3QvVcuW+Hd4OTsDd8yoYsYAxU3MgrkiW
         4Pug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790065224; x=1790670024;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=etyNrSdg7SELADqdNG6OVH3H+CXSg23SDODY/D8rF+4=;
        b=EuYdUwiSnFsEVHxJ+F4llX39NUIz77rrPoACa93btV7UMhFlz+Ts2Mj+81GuTEMtKm
         TeHskwzL5K55+bRcgHG9z/0hSah5AhG2TI4Ak9Q1ELh+IWJSwtLftUiAFOkOymaTe/MA
         H6FWINJClfd4jcVEIdz4TuOQhNqH7ckA/tY4Eg5tadcTpTeX5marZT0AanSa1KusNulP
         YvdhJg6kcxGSrDI5VEHIpTAdtT3gNmQ2cCKZQFCbXqjCvE7rSAdU52PiQMjQPYwuq7ZB
         w2bjNXSK9JnBMiecngHFLPgTKLh4Lkqkce7Hidk/Rmfa8EOo/BB3C7pjqOSeDN0TUvxX
         +5cw==
X-Forwarded-Encrypted: i=1; AKwUvBxt7U5/YM3t5afQZbcgdkiYjxGUii1BnCdKOqewIcoHWW5bU55dihSJs8T8YBg935Kqf/N0IphTfegOIj8=@vger.kernel.org
X-Gm-Message-State: AFuF++m/w0LeOdCl0oyi99hJjAHpcOZpiIg543iGYZn00/ErYNlg9kUJ
	MfTag3LZJ63krOWk1y/0pAPip+T20lpR+5ADKpGxMWrZLflT9WX5Z3tWOhxupDxwhvoYVcdWu0R
	A19v2r3a7CcVpVlIZhJoBqFVavVMTa9I=
X-Gm-Gg: AYBFou3PfWRZP2Cdc9U/Ki5Qn3zlgce89YimmLj9vI0qw8T4sdn9Hw9+tDTKiOObp8A
	ALjmU2WTbGsm7qEofL2+4c8+3yUdcygWnVbkS81ff1yDhQrpnqt4OTwMM5oittUKo7aWuVl2Ii6
	zRNG/aRob8mX4rzBUYrzhmhJ3UHmXfuzA/qVS/CnrsuyS4+S94ER72Sfh30lUMkLeX69lpSbsBg
	9zTnM7Nyf+XUTkWIcLrU21tKnAj4tcDX2AJo9a0hbmC+z+sDVfurbuwlGpndxkWn0wmIDZF7vvg
	BTvpFIUJ8FE2p3nEatHYKSIxn1gQyyiAuCq0jwt+VljH0yCmn64l4KWvAAQ=
X-Received: by 2002:a17:90b:4e85:b0:393:19a3:4f1 with SMTP id
 98e67ed59e1d1-3a07309e835mr443959a91.6.1790065224306; Tue, 22 Sep 2026
 01:20:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260919175925.3739806-1-lgs201920130244@gmail.com> <4d1536a9-6836-430b-a84d-aaa19f6af9c6@web.de>
In-Reply-To: <4d1536a9-6836-430b-a84d-aaa19f6af9c6@web.de>
From: Guangshuo Li <lgs201920130244@gmail.com>
Date: Tue, 22 Sep 2026 16:20:07 +0800
X-Gm-Features: AcwNN1VeRLDrIbQQKRLeG1AyUpioVwyENSebpLtVmqJsNEPTYC8bee9d02XlHxw
Message-ID: <CANUHTR-um24oLb-446LRtHLFBGtJ7h=QwEksSjvig-SFonJpRQ@mail.gmail.com>
Subject: Re: [PATCH] dca: fix provider device memory leak on domain allocation failure
To: Markus Elfring <Markus.Elfring@web.de>
Cc: kernel-janitors@vger.kernel.org, Dan Williams <djbw@kernel.org>, 
	Kees Cook <kees@kernel.org>, Maciej Sosnowski <maciej.sosnowski@intel.com>, stable@vger.kernel.org, 
	LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Markus,

Thanks for the suggestion.

On Mon, 21 Sept 2026 at 19:30, Markus Elfring <Markus.Elfring@web.de> wrote=
:
>
> =E2=80=A6
> > +++ b/drivers/dca/dca-core.c
> > @@ -368,8 +368,11 @@ int register_dca_provider(struct dca_provider *dca=
, struct device *dev)
> >               raw_spin_unlock_irqrestore(&dca_lock, flags);
> >               rc =3D dca_pci_rc_from_dev(dev);
> >               newdomain =3D dca_allocate_domain(rc);
> > -             if (!newdomain)
> > +             if (!newdomain) {
> > +                     dca_sysfs_remove_provider(dca);
> >                       return -ENODEV;
> > +             }
> > +
> >               raw_spin_lock_irqsave(&dca_lock, flags);
> =E2=80=A6
>
> Please avoid a bit of duplicate source code in this function implementati=
on
> by using another goto chain.
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/D=
ocumentation/process/coding-style.rst?h=3Dv7.3-rc4#n572
>
> https://elixir.bootlin.com/linux/v7.3-rc3/source/drivers/dca/dca-core.c#L=
335-L389
>
> Regards,
> Markus

Do you mean using a common error path like this?

        if (dca_providers_blocked) {
                raw_spin_unlock_irqrestore(&dca_lock, flags);
-               dca_sysfs_remove_provider(dca);
                unregister_dca_providers();
-               return -ENODEV;
+               goto err_remove_provider;
        }

        ...

        newdomain =3D dca_allocate_domain(rc);
        if (!newdomain)
-               return -ENODEV;
+               goto err_remove_provider;

        ...

        kfree(newdomain);
        return 0;
+
+err_remove_provider:
+       dca_sysfs_remove_provider(dca);
+       return -ENODEV;
 }

Would this be the preferred change? If so, I'll follow Krzysztof's
suggestion and include it in a properly organized series for v2.

Thanks,
Guangshuo
