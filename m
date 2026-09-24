Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB5913AD50F
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 11:18:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790248725; cv=none; b=cfrVgptllpenlwyy0HAUo4BX6RNmI8pyjv9laU160UGRSaELKgJNyFfr89Jsn00x92iJTQaZOv1Z5pezy7buJk7BOfroXw5uQUzg846Fi0t6TrQlpxptFq5OvN2V4o8Xwbo6YHBMyDmRwLQh1yxx5FxTkmVGQZ44yfh+zmRnQSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790248725; c=relaxed/simple;
	bh=lcdubPlHtoDIjRt+QuMoY5OpbtDK10iEJXOyO3ON3QE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gcEHTw3bzxEA4OHZ82eHhhp3m9hqhLFdITQkFL3HwS68+Z6GnOc9tknDIhlUMA+Epl0KrqRQN4Mx9jvh0w89s56ZQ9WwKxWcbhIsdIPhUEJyCWTs8kcla+moy+jHrLYCg1hU42ud8wmhVPVo6MFbsEnWL3kJVZp9N4IusVDKQps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FahPZOSY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FahPZOSY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F87A1F00893
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 11:18:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790248724;
	bh=OcTJOje/LLFPmLDozu5uW9vUgvKXaCAXc1Kv5yqHgEY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=FahPZOSY9crA1L+tZ2mcaAeDcUpaVGBCPpXYVBau2ivxRn0VSwlZaQ/9gDHL6isyo
	 dU/hrwWQogLUh46GOB0l8pbm37WFKh/u53rxqteIRdgYJ9Sibmp2OrZrkSEGmNARVQ
	 5t9dHojCWb5g86m0Wlb0DFCKJIe955akV/gjUgTufTAC0Y0f95s1XFRTKZwz+BBn4o
	 iZcV2DA7KMCZEmCY5R0llJSGGyjq0PybsyKQkWg4mPltKPSuIfVq5kIGdolFOPkE6S
	 GviMJA8uT5IZNY41uZSKBS2nJq3wtP7QenLDNWiCypFaK89NzVbIrEL11GnWB9yyS/
	 T1nP3nz/i1Sew==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5b5f21afe8cso893713e87.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 04:18:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwUmEUp0KlB5gFctr0uFLiaXjS0zZJDQ4u5SXEfumIWGdcUUIEXrCEbzT2y+DFiysw9ABReRVBXQmux+Bk=@vger.kernel.org
X-Gm-Message-State: AFuF++lZfjQPwAYUu0+TrAGDDLwn+SAGb0rP0WGEPxmdAjUyJCH95m2F
	Z90xZ7R/Z0gD1xwx03CrdZzLHbCCXbmVcrmtmaLF8bok5yJ+kCIkPkt9mZ875mRs6oa2tUPTd0H
	gwfpRV31IBFwyynHgjuQsVbSHmAa57ro=
X-Received: by 2002:a05:6512:378c:20b0:5b8:c15a:6ce3 with SMTP id
 2adb3069b0e04-5b8df1f2b2bmr492740e87.29.1790248718275; Thu, 24 Sep 2026
 04:18:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260924065514.3678640-1-mehmet.fide@gmail.com>
In-Reply-To: <20260924065514.3678640-1-mehmet.fide@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 24 Sep 2026 13:18:25 +0200
X-Gmail-Original-Message-ID: <CAD++jLmth4fewBX7FCEJooDuwHWtGv+XvvQas6Y5iStpTwAy9Q@mail.gmail.com>
X-Gm-Features: AclHuK95jx6rtMJfElg8F2gKY3_L62ve5zcmLjc1yqjBoxFNa2u9t59lm0nJBi8
Message-ID: <CAD++jLmth4fewBX7FCEJooDuwHWtGv+XvvQas6Y5iStpTwAy9Q@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: include linux/errno.h in consumer.h for ENOTSUPP
To: Mehmet Fide <mehmet.fide@gmail.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Haibo Chen <haibo.chen@nxp.com>, 
	kernel test robot <lkp@intel.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 24, 2026 at 8:55=E2=80=AFAM Mehmet Fide <mehmet.fide@gmail.com>=
 wrote:

> From: Mehmet Fide <mehmet.fide@screeningeagle.com>
>
> The CONFIG_PINCTRL=3Dn stubs of pinctrl_gpio_get_config() and
> pinctrl_gpio_set_config() return -ENOTSUPP, but the header only pulls in
> linux/err.h, which provides asm/errno.h and not the kernel-internal
> ENOTSUPP from linux/errno.h. A translation unit that includes
> pinctrl/consumer.h before anything else fails to build:
>
>   include/linux/pinctrl/consumer.h:110:10: error: use of undeclared ident=
ifier 'ENOTSUPP'
>
> Include linux/errno.h explicitly.
>
> Fixes: b44aec87658e ("pinctrl: make the CONFIG_PINCTRL=3Dn gpio config st=
ubs return -ENOTSUPP")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202609240855.U59akHDO-lkp@i=
ntel.com/
> Closes: https://lore.kernel.org/oe-kbuild-all/202609241240.61Hz5rix-lkp@i=
ntel.com/
> Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>

Patch applied!

Yours,
Linus Walleij
