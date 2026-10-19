Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A929486E51
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 06:53:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792392810; cv=none; b=otXPDqBPvo48I3Qg2TBvG9L/IlpBxfThRp/WUreczTi1Q14rQdJp49IeZc5VjauNVpiCVZBAb4wttPs/LDfFThj6ldXqnJyP9W+1efqq++lOT1QrdxqrDR2lHw64vCDfVXMtCRcbNdsoKMOu2OPoF1LgsLbtAOz89vWeMjoVVpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792392810; c=relaxed/simple;
	bh=d4Ns9MrcjrkL74lU3nY8b1EUlzF1MbtrTa1z9FgniQI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jKhBpkkIydwAnIcEvXt7e9wgtlGoZf1gbttBfDwp2z7YQhFyCfwMnPaYhefvLjfSCHgCMJo4jXoJTg8+5Qf4MOm9BlKH0vX8GzocW3+bBksrRow0wc0JmozuFGVZQzIwTiYRe6QjxWlAsL7q5q8pnaljtikMBRcCtP2AcDZDTc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-5eac4855401so310499e0c.1
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 23:53:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792392807; x=1792997607;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=cjJM139EIVeGEh8rWsgMbCEX7knwMHfAW0CurdOdiu8=;
        b=U5Pv9XfYqEiqUMMVUaDwU/APDlQb7EnQLmAEW+sHNzpKZYoeLjwJ7K+nwBnDPBW5A6
         scS1+LKFtp8B3HwbqIBOUgyUmZ+5AJY+zWhRwncRziTOtQIh6suDxz2Y1njBNvJS0pTj
         85cXZnlYHeitD5qmxqb48cGq1INbJYoB7rsfQ7b24nGc6Mfh66tHMuac56MXmWVBOICW
         fpc1/2v5txhIpoqR7wXXbE0Bz1+1bQPeNvqYqJ45E2yDBN2ZRY4dChr0RbCra8uWsmY0
         y1PjHXb7ZFanGwWbnI1XjogPXCvECWQn0lucVasENrCYukQ3d2qrjpk8Xg7/5IcZW/oC
         ZjXQ==
X-Forwarded-Encrypted: i=1; AKwUvBxsmZwWjLJr5cuekBFvSXkCialL3DM0EyOEXyf5WJ+GSNAqDFqLsbfuLDC7B16azAtvmRa1LJEVSGl+t+g=@vger.kernel.org
X-Gm-Message-State: AFq9FYLamCDEp9tOKEMFN4v32tB0dHSXfh1ITE+XBNS34GGPnFJjJl3X
	UsgPaOjq2OfDmIYQ4MSZn5t7f4/6CJe8FKvMIuBMHr4ADXddlZoAAUpcafWvs4I0
X-Gm-Gg: AYBFou26v2JlgP8jH3eX2+gF2T5KfwSR6O6r8fe5yEAb4TBb+5MeDodUXXt3tYVv65S
	FsIM3kRIVH49mRlhJAEQzgwlJfh5T+PuuxgJEZIWue8X84sTXrqEMVvspb7pZY/pFjLEMv9t/1K
	d5Vinz1Ci5mnCPdb+4yrR97sJEkfJMr5r9mPL6XS0UKIOOUuKd5hEAu32c9hGx550Uo7O/nRdsS
	6s9gtPULz99CTfn1TW2Dj0EpqYjuS5R+T1jBdC4pSLjZTrz2uXbDLc0ccMHVnRGkksyLCqEIy1H
	Wm1pJx6uYbWEHM4CVs+AlFHTwST5rtiXKVaqJV5nvk46dKRCUr9uhLCt84yloq0it86gWv4QhmC
	cGqNRt9aVNN45JrqqSoP+mfijob31PqbKK2/EQ87f7oOYF5/CtiUjQ7n1T2I61WU61fCD4zm/QE
	4kn+B1bhucRgJv1frjgX7Cso+qGvSbyrm9SB7OWVEK6HIKuleqPePrePKCnlMkFX7TT8MDwSFyD
	tRK8YI+MSDLJiCTGpMqcKNI3eFGYBaAdwuVsgAR
X-Received: by 2002:a05:6122:e14e:b0:5c8:46e3:ec57 with SMTP id 71dfb90a1353d-5eaaa0ba603mr2368145e0c.1.1792392807143;
        Sun, 18 Oct 2026 23:53:27 -0700 (PDT)
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com. [209.85.221.171])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ea9b4776b5sm8720571e0c.3.2026.10.18.23.53.24
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Oct 2026 23:53:26 -0700 (PDT)
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-5eac4855401so310474e0c.1
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 23:53:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByhXcx+Kl8/Ig7Xj9UbR05f2i5LWZ6CQjVfS2vILEhMz2mcG2z9AIVDVeq6i5sBEaDFsBrG/MFA0SSduMg=@vger.kernel.org
X-Received: by 2002:a05:6102:1492:b0:7a1:f980:e93b with SMTP id
 ada2fe7eead31-7cc36a1726amr1724652137.23.1792392804446; Sun, 18 Oct 2026
 23:53:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261010065442.23780-1-rosenp@gmail.com> <202610131201.wWk11MLy-lkp@intel.com>
 <alpine.DEB.2.21.2610190013300.22065@angie.orcam.me.uk>
In-Reply-To: <alpine.DEB.2.21.2610190013300.22065@angie.orcam.me.uk>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 19 Oct 2026 08:53:12 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVoAthYZFzuMmVb8awHUia4xeEfFKK=1PA23iCV0SsFbw@mail.gmail.com>
X-Gm-Features: AclHuK-hkOaUNvhawt4bfdwYbTv8-8VXt4ePnbu5KtWM6yoyqBrlCyoN2rObGDw
Message-ID: <CAMuHMdVoAthYZFzuMmVb8awHUia4xeEfFKK=1PA23iCV0SsFbw@mail.gmail.com>
Subject: Re: [PATCH] MIPS: lib: prefetch ahead in csum_partial()
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: kernel test robot <lkp@intel.com>, Rosen Penev <rosenp@gmail.com>, linux-mips@vger.kernel.org, 
	oe-kbuild-all@lists.linux.dev, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Maciej,

On Mon, 19 Oct 2026 at 01:26, Maciej W. Rozycki <macro@orcam.me.uk> wrote:
> On Tue, 13 Oct 2026, kernel test robot wrote:
> > config: mips-rbtx49xx_defconfig (https://download.01.org/0day-ci/archive/20261013/202610131201.wWk11MLy-lkp@intel.com/config)
> > compiler: mips-linux-gcc (GCC) 16.1.0
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261013/202610131201.wWk11MLy-lkp@intel.com/reproduce)
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202610131201.wWk11MLy-lkp@intel.com/
> >
> > All errors (new ones prefixed by >>):
> >
> >    Assembler messages:
> > >> arch/mips/lib/csum_partial.S:202: Error: opcode not supported on this processor: r4600 (mips3) `pref 0,0x100($4)'
> >    arch/mips/lib/csum_partial.S:203: Error: opcode not supported on this processor: r4600 (mips3) `pref 0,0x120($4)'
> >    arch/mips/lib/csum_partial.S:204: Error: opcode not supported on this processor: r4600 (mips3) `pref 0,0x140($4)'
> >    arch/mips/lib/csum_partial.S:205: Error: opcode not supported on this processor: r4600 (mips3) `pref 0,0x160($4)'
>
>  So oddly enough we're missing Tx49 support in the toolchain and we've
> only managed to survive with CPU_HAS_PREFETCH enabled for CPU_TX49XX
> because it also implies DMA_NONCOHERENT via MACH_TX49XX -> MACH_TXX9,
> which in turn disables stuff in arch/mips/lib/memcpy.S.
>
>  Quite straighforward to fix in binutils since docs are available (as in:
> I have a copy), but do we have any users?  Geert?

Yes, I still boot test rbtx4927 regularly.
I never touched binutils sources, though...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
