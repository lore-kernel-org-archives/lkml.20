Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5C2E470EB2
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 07:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791531987; cv=pass; b=Wyvw/ZTRV/DKkzRF068qPTpN/MPMdTMUSeaBBQqiB9M6q1Ow9GJuRmF9v99vZN869N/fB5Cs/BhUmG5ji9r1nyF2S31hcSZoCgqitoqoTICbhKngxyKqXLmRJAsWYBgBK7vTINnvliiwZ/G+wT3kE/zIbjdkLQAxgnCiuD+UFOA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791531987; c=relaxed/simple;
	bh=0gRN2SakYbEgJc/3ZWGnLbXr3HCroechbpStJaaI808=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PTYYmd1n70n5eGano4A6VucW24jWzcpX+Nc1klPwFvsQ2qpI1pBYklRaVXnA2uR7+xYW8HUWY3CX7/xDAlt1jKurydo0WW0Cl5KI+mAdrcMpALgd1Dg+uQnolpAcMtpFQKGjWz4Mm+PPpJX4jrB3uNNAq4rXollOlDhrm9UnANQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KRV6jeJ0; arc=pass smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KRV6jeJ0"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-5339173489eso45148621cf.3
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 00:46:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791531985; cv=none;
        d=google.com; s=arc-20260327;
        b=C+6mOZUyZvmFTlbMAvhXVGTpD32LzTNMjyRTVFcvpZgkK9drZLdInn2oYAj/xQ8WQK
         4+w1+smgAGOjA3SN0Wib2cqzp/LagmSgD9LFrqr5fz7FkGZWiarTSv0JjscCuQ8GFN98
         EZzIbHCmsiBm3kFEGIBsLIjzBODDBA5fCavdcbTgpU6/DUEFUhxkBIl4cfrMhWRYcXvs
         J8H9l4JJaT1pcCcOjKdMbvzFZ/+6ZoGTSfnl2KGivmKcMsvQ9ETaFO89Uv8IJarbSlgB
         6mjMCGn2Juf3p9UpUuhdLlH8Cw39IAmbLwoHxP3ZkgIaGgrJdJ1KuOBNd3I1Jms4nm+E
         Asjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=IhbhXrSuqXoly0LP+ZlIux6BvCSs3BvpYjEi3pYxM6E=;
        fh=y9i733PKn+yuxB4msWSzqMe6aOr9WTIm4tztPJhh1C8=;
        b=H8H5redINaqNFRxfgE7W9ujH3WeLZgXPrvU3vCGU0/3GtrhESG4fAB8pYbJNKOAaF1
         J79EPpCr2PVvQWnAtBqzjVjC7XkT8+i/VcJ2IPMAaIKgf8GMB7CLnW6an4nBsN2KTsKc
         JUBD87FBgsPypNtucZ879TVOB/oGBcdK616c7eX0Ne9oE2Y1uxiWzxiik1ZmfFTkRRcl
         vRebShXR4qSYDVfmsFJB4FlQU5kAxj32ghKjE+rFE21DNv2lgw1Z5wnAT5vuApwo0dNx
         LtqNVmNCZNrzERvriOrmOUHwIhaigAB85n5E+KFwhfw5ltY5piHaLJsUefHAzlUoz1y+
         4ARA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791531985; x=1792136785; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IhbhXrSuqXoly0LP+ZlIux6BvCSs3BvpYjEi3pYxM6E=;
        b=KRV6jeJ0kIlXGoyfazccjIuPBD+0kcgmq9FyawAchST3ThtywFwF03gwOMBUKPVb7y
         s9U5+RCiJKIiG2kdNF5lYwTvQxH4lyVU753uRn5JbKX/7C0yNYCO/ml7FSB1Pr1LFU+7
         +X91Wuxa1S6pnB0+pdvrTvT834Zhq48te/477IzHnGeFHDdsQuz8pvyBGXS/sucHkriJ
         a5fddnyjDS5KPdd431dUPujZIHHcXR380LLvPOW8eLc+EJxmF118z+GL5HzGc6kVGaR9
         diVqs/wxYaHFyGx1b8GSJkyZLCmGjVtB9mtbJQFrBBQjHCdjKbVbGZfW2GV9My1UbUKO
         5XLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791531985; x=1792136785;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=IhbhXrSuqXoly0LP+ZlIux6BvCSs3BvpYjEi3pYxM6E=;
        b=HgveNO+zATVeGWIWCNodpV4X2sqGF9IlJe1YLVFBoJ0ZYZL23HFg8xFwXBoyIX+es9
         Xp4pbEAGf2Nr1Sea2eIXBBoQAzxdeMIcZUfIV3tVkQMy+pmfXyLQtmbJDnIy1qk2SqpA
         AHtr2vPMVfHTKymdrZ9vsIbSIwD065OhEq3PoSxWEFT1aYNaz2+KrJduhDkoeK231Syp
         p7sDDsmI4M6RH8NyEIcQjnCTJyl4Mtk/htaet4UvS7cnMWAyoSKn87TGhr7QP7Ojw1ze
         rtJDwcsWtLzipRI/xsU+/GEl+eePibNb6RJqbJ+2+/HMP+7bMAi4BePU3kUYLsZgAuYA
         nhmQ==
X-Forwarded-Encrypted: i=1; AKwUvBxgTONl7uUtA89SiVdHPniJO9PPyVXJmhgfhQ4xNGqj851iUFpZGllakWMCyf6VxlCeeKzhWLS4e/hTpJ0=@vger.kernel.org
X-Gm-Message-State: AFuF++k6YHD9iJmWJrHHKZSpJ5Zuv0rls+8u/3T2WLYyAZvEHBQbkqVv
	8W7Q4EA9AcBNo0x7dHmWjCFj4zXhsAZjZdzhwu2eUC1Tm0XyCDjpbh7mJVD0j/yKbdHEhDvvjXb
	EZ5Sbz4Ywsd7RjqBtBOCHJlvdk4+x0dU=
X-Gm-Gg: AYBFou1sfxgVBN2gbehEmJa1NNkrEeQfaDqayVl3k/V1r3Crf7qQMQwiA1if+auopRl
	DEGZ20Hx+/9p9B0YUgfSkbyGUUPUZAvDJlCv9TwW1CKRQ/2wKG8alYZUF5j24lAFQPnzUWx79W6
	Ty+YJNqJhe/znwT0BP6bAwC7BqKpT44cTYayVtpcKDvrljcdjBXXwqSsB5EhLbzZJlDKaGCtk9/
	AIqzgZYZfPCY6I5LWdrf/KS7hoZofSnex8+Omd1Q8A6x3jtm6Mm/DJ8m8Ya/tqho/JULqnlT72U
	BfLD+c6ZpYF9zDguLvTFiSdlB4dkktYFwJviTrcnYQFseJFcvDO/fyDwVkH/CdWtMPlrzoZNd+8
	M+ddgLY/Rjg==
X-Received: by 2002:a05:622a:e18f:20b0:535:a5f7:d593 with SMTP id
 d75a77b69052e-535a5f7deabmr2793261cf.77.1791531984791; Fri, 09 Oct 2026
 00:46:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260810143057.651478-1-ansuelsmth@gmail.com> <20260810143057.651478-2-ansuelsmth@gmail.com>
 <20260817-strange-belligerent-gazelle-d55c5c@quoll>
In-Reply-To: <20260817-strange-belligerent-gazelle-d55c5c@quoll>
From: "Christian Marangi (Ansuel)" <ansuelsmth@gmail.com>
Date: Fri, 9 Oct 2026 09:46:11 +0200
X-Gm-Features: AclHuK-f0LLvQaXw4HZlaL3j-e2e5sO13kwV5bV5TdRjah04dpSMzW4-ITExMkA
Message-ID: <CA+_ehUwTH-mn2p44Qi=TGi+55PngRra=3Ovf3mCUv8ZZ=Cky4A@mail.gmail.com>
Subject: Re: [PATCH 2/2] PM / devfreq: add Airoha SoC devfreq driver
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: MyungJoo Ham <myungjoo.ham@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, 
	Chanwoo Choi <cw00.choi@samsung.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-pm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Il giorno lun 17 ago 2026 alle ore 09:46 Krzysztof Kozlowski
<krzk@kernel.org> ha scritto:
>
> On Mon, Aug 10, 2026 at 04:30:55PM +0200, Christian Marangi wrote:
> > Add simple Airoha SoC devfreq driver. This simple driver register a
> > driver from a given clock and register a passive governor to scale the
> > frequency with the CPU frequency.
> >
> > required-opp on the CPU frequency will be used to correctly bind the
> > clock to the related CPU frequency.
> >
> > GSW, NPU, SOE, BUS and many other clock will register this devfreq
> > driver to scale all these internal peripheral  from idle to performance
> > mode.
> >
> > Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> > ---
> >  drivers/devfreq/Kconfig          | 10 ++++
> >  drivers/devfreq/Makefile         |  1 +
> >  drivers/devfreq/airoha-devfreq.c | 99 ++++++++++++++++++++++++++++++++
> >  3 files changed, 110 insertions(+)
> >  create mode 100644 drivers/devfreq/airoha-devfreq.c
> >
> > diff --git a/drivers/devfreq/Kconfig b/drivers/devfreq/Kconfig
> > index c999c4a1e567..1e857a7e9caf 100644
> > --- a/drivers/devfreq/Kconfig
> > +++ b/drivers/devfreq/Kconfig
> > @@ -75,6 +75,16 @@ config DEVFREQ_GOV_PASSIVE
> >
> >  comment "DEVFREQ Drivers"
> >
> > +config ARM_AIROHA_DEVFREQ
> > +     tristate "Scaling support for Airoha SoC"
> > +     depends on ARCH_AIROHA || COMPILE_TEST
> > +     select DEVFREQ_GOV_PASSIVE
> > +     help
> > +       This adds the DEVFREQ driver for the Airoha SoC.
> > +
> > +       The driver register with the cpufreq notifier and find the right frequency
> > +       based on the required OPP set in DT.
> > +
> >  config ARM_EXYNOS_BUS_DEVFREQ
> >       tristate "ARM Exynos Generic Memory Bus DEVFREQ Driver"
> >       depends on ARCH_EXYNOS || COMPILE_TEST
> > diff --git a/drivers/devfreq/Makefile b/drivers/devfreq/Makefile
> > index 404179d79a9d..5ca27684dee3 100644
> > --- a/drivers/devfreq/Makefile
> > +++ b/drivers/devfreq/Makefile
> > @@ -8,6 +8,7 @@ obj-$(CONFIG_DEVFREQ_GOV_USERSPACE)   += governor_userspace.o
> >  obj-$(CONFIG_DEVFREQ_GOV_PASSIVE)    += governor_passive.o
> >
> >  # DEVFREQ Drivers
> > +obj-$(CONFIG_ARM_AIROHA_DEVFREQ)     += airoha-devfreq.o
> >  obj-$(CONFIG_ARM_EXYNOS_BUS_DEVFREQ) += exynos-bus.o
> >  obj-$(CONFIG_ARM_HISI_UNCORE_DEVFREQ)        += hisi_uncore_freq.o
> >  obj-$(CONFIG_ARM_IMX_BUS_DEVFREQ)    += imx-bus.o
> > diff --git a/drivers/devfreq/airoha-devfreq.c b/drivers/devfreq/airoha-devfreq.c
> > new file mode 100644
> > index 000000000000..cb6d8b49e4a4
> > --- /dev/null
> > +++ b/drivers/devfreq/airoha-devfreq.c
> > @@ -0,0 +1,99 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +
> > +#include <linux/kernel.h>
> > +#include <linux/init.h>
> > +#include <linux/module.h>
> > +#include <linux/cpufreq.h>
> > +#include <linux/devfreq.h>
> > +#include <linux/of.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/clk.h>
> > +#include <linux/slab.h>
> > +#include <linux/pm_opp.h>
> > +
> > +struct airoha_devfreq_data {
> > +     struct clk *clk;
> > +
> > +     struct devfreq_passive_data gov_data;
> > +};
> > +
> > +static int airoha_devfreq_get_cur_freq(struct device *dev, unsigned long *freq)
> > +{
> > +     struct airoha_devfreq_data *data = dev_get_drvdata(dev);
> > +
> > +     *freq = clk_get_rate(data->clk);
> > +
> > +     return 0;
> > +};
> > +
> > +static int airoha_devfreq_target(struct device *dev, unsigned long *freq,
> > +                              u32 flags)
> > +{
> > +     struct airoha_devfreq_data *data = dev_get_drvdata(dev);
> > +
> > +     return clk_set_rate(data->clk, *freq);
> > +};
>
> Some odd copy-paste.
>
> Anyway, your driver is heavily incomplete. You can scale the clock
> directly from each device driver (each should register devfreq). You do
> not need completely new driver for that.
>

I sent a v2, the thing is that those subsystems need to scale with the
CPU frequency. It's not something where driver configure a static frequency.

There is a specific governor for devfreq driver that follow the CPU cpufreq
OPP call and with the help of DT required-opp, each subsystem is scaled
to the frequency.

It's to handle idle state for power saving and temperature and scale to
"turbo" when the SoC needs the extra perf.
