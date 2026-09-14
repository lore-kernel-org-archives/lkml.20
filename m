Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF8FE3546FF
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 22:17:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789424223; cv=pass; b=i6++TXW2AtnAt5WmK7shRny29lyDoO4ry9LqYGb8h4fd4wxgudtbP3BCQr7Ko+o06OkCWZOrR9lEPTYAUmn7PHJqhyXIRCBvKnFRhoaexQm4LWyERve3oYquKh1ESw7hMYjyVPJ970d85Xti2c/dTpS0jXxy/fwL0nlGKVXLXpU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789424223; c=relaxed/simple;
	bh=F26XusL349fj/POvj6KSDmCxhPlIXdg95qDIGU2tpFU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gIU9LDCaKYelpG+afLr0D5I7N/iMLICOwunecd2fla4n+nRoI1rPLx1R9Nw4RCzfhyTf0XdAAwlks8Lx+4iFX0IP2EATqhV+1VX58N+DDQi7pvs+Ppy47ScaZBcc2HXrFKMCJcqDnytioJsoQIv6jJzrX8rcvoTKm3NrEH64Wc4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JF4Lg3bg; arc=pass smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JF4Lg3bg"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a9ab2a135dso3514979a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 15:17:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789424220; cv=none;
        d=google.com; s=arc-20260327;
        b=XsnoPLHZFQxWT7rzjZZwHmwyxhkuTcySg7Ug/yM5/r7l+L44XrT4jsfXKuc5XF0bOi
         rhX57hpPyjZbyhfu2OXbzk23cqD7P6c5je5wImXEmUAaIVtGrehCQol4j4YBi/8A0Ugs
         7sjMdCPFCP7RK+6RSPojm/7q9lmuUOYXTKJ92kwCMMOJra9InXdYeWL17RcJZR410QxS
         5OZM0bCGLwve6UFMrSp7VQ3S0Dd1jOMmknZu/U9uOZnsRe0hIbocKwzYq6Eqh9ePzwnx
         2Ea6fH4gfUBgFLN//OawaR7gqySXXhrBGYRpwkH8BGt0oBNLO4y2OBj8NvfLG3bTr5Tv
         MHNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5811usFaNJpGkrxjrcQnbMmTE8twHwPG+c7GaruR6FI=;
        fh=8R91REZTeWJ+DQnaxOYPuJXaf6b2n/c/YDUapYesN6E=;
        b=LNCcNrzD9JiO9DRhdYVzMXPkH/t9puyTUs/4U81RltLy2e16krgz5DamWq0/O6hOuw
         Pm9RJmBpJpivcMIz2SYLwcmcFbCFp8Kh/LZ3cNvXUw6CgDu/2JnfN7AguzBv3IdhAizT
         g/zsk9u7u2VLmUowzKcOAPksQ3OkGw1lO2ZwjIscjwO0qOhvLkIony/143c0dWlpOUYq
         KZKaozCei9+q6sOjh9hoGrh7yEjdpjXa0noxLUb67OQUtfyZODt4RChOBpu9OTXf0FNF
         9IDKchIV1BLN2MtOWnn+qLw9xO4Qh3QXuCBg8XXNhBCVHe0VKoBgdzuGWXGEs4dWgTCv
         oGow==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789424220; x=1790029020; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5811usFaNJpGkrxjrcQnbMmTE8twHwPG+c7GaruR6FI=;
        b=JF4Lg3bg1ulIQ8qM8049az39jQMI3l0Kj1ZCq9qy4ckmBw2tpCCDDCT8W4HYVRWqEk
         I2QMf00irDAWucGI1UdhWsMfKEvRib4n+XnFT15XQdL1AcY/YvX5EznJ7y7fPT6ZRyxZ
         NF9iX8ubbfxdeLHRz8yNsoRCnvPClc6g7b0J+EqRyVoDp9R2JRUWLVlfPJabLOz9+mvn
         7UgRYtVVj38hE9/E264xoRNnidFRj33pjRXlZNvZMJWsW8BTvIYYJbhGZVaP/H7iKvIC
         CcXlsrav8nDAfKEks2sUMfxfWmt/ApPPO3QgPjIxSgGbsGNnFfGgqBs2EDzD7mTvVYMd
         ksdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789424220; x=1790029020;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5811usFaNJpGkrxjrcQnbMmTE8twHwPG+c7GaruR6FI=;
        b=Nma2X1Ly5NDRAgKj2DB1WihUS4TSeE7GjHqt8ij5Xwcsmq3Ot9iIan40ZlvDfjBWmi
         yV8O2VNUhvM3P4RVnQE9jAmqCU21gVUDHOiqYcSw1fIW1QCXO6Xyv6PgPkI+Ow9ljQy+
         i2nPBlCnD0iCaAvFiB6wkMxHEkLfnAIWWOWBuSAv5oymmrkKUjvJbDfgA8DV/ZFiOTSy
         ZBE667jwM3GHvkZy31dPc6VF820zyLu9ohwetHqi9fAsCT5/l13WSYyzdNpWVnzZNg+7
         h9auTPg9QiSlqUWGD6eN4xSIR0mSX2TYd1DANYjeIOJZ7AbpidpghK3heUCuFKJUfraF
         bNug==
X-Forwarded-Encrypted: i=1; AKwUvBwGx2R4IQklqf7TA+Ar4hg5l1nU8bx/TMdGmBPR0uykxVb2mPFPDWhDjZP3hJ3IvTtT4n+OZ0/rl7lLqZg=@vger.kernel.org
X-Gm-Message-State: AFuF++lgjT/CALgSNdU35iCUR2z2xHtPH0nU6uGPdPP7EoogRdZUkPS+
	+ytHV4ge5g59iRvradVYIYKbN6gVhcqhh5qU9It6G0dtTqcuYy0m0onwlzmLnFgLqUD3H23oszT
	l6j48DaxbNfOnfHDaCuoYx/b5nyQ/bg==
X-Gm-Gg: AYBFou3RxShOi1itVBG9LTL9Os3efvGyA3DfD+4SsekVcJ42SHwuoDmfTRS74zSYiUh
	8nA4JGea4SYcsa1+8mOJfg2CT3qsZpt0THHPrpDkIlSmekzV6vc0FTdHbJ0Gv4vVccWms9tKFxw
	e0lnZLGur3RY1i5QNDc8oeejnECYZL+gQ4lkBbOkJdavKg9fR/Ks7pS3eFxSsMYcMp6IWizJ2+N
	RI3HlVW79ZYbeaY71wMH3Qb5ZVuJ6lVNMSgc+0PaPlXvXvjTA2roZgyDyG3/yyEZJpzhO/Ms+Wz
	jApSBO0dlK4dgH/aQqdOZG7NvPIB/dv5S2ekkcKZ5xBrSPr3Fm2994uq4qp3jX6IFaKdpHFIndN
	noMAIa/kwGjUGrJHeYgL4dAPd1sa808g59n89fkXea98KkEzHDbdsjsTn1zEYSuT4knACbQ==
X-Received: by 2002:a05:6402:2350:b0:6a9:b51c:9d49 with SMTP id
 4fb4d7f45d1cf-6a9f623840bmr2755096a12.10.1789424219581; Mon, 14 Sep 2026
 15:16:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260913013615.22615-1-mhun512@gmail.com> <aqexMdHnHHq_l0Y3@ashevche-desk.local>
In-Reply-To: <aqexMdHnHHq_l0Y3@ashevche-desk.local>
From: Myeonghun Pak <mhun512@gmail.com>
Date: Mon, 14 Sep 2026 18:16:47 -0400
X-Gm-Features: AcwNN1Wfuc2widyYkZuQibIG_V-Tt3xzJgrCwnfkF6XrA53w0ESfy3a1GYYfxJs
Message-ID: <CAGEsz8GnHrwmmU9-mLcj8gita4Gh+fBinyV=1WsXzj6TRvCN1g@mail.gmail.com>
Subject: Re: [PATCH] mfd: intel_soc_pmic_crc: balance IRQ wake enable
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Andy Shevchenko <andy@kernel.org>, Lee Jones <lee@kernel.org>, mfd@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Ijae Kim <ae878000@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Andy,

Thanks for the review. I'll address these in v2, including releasing
the wake-disable action at shutdown only if it was registered.

Best regards,
Myeonghun Pak

2026=EB=85=84 9=EC=9B=94 14=EC=9D=BC (=EC=9B=94) =EC=98=A4=EC=A0=84 4:32, A=
ndy Shevchenko <andriy.shevchenko@intel.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=
=84=B1:
>
> On Sat, Sep 12, 2026 at 09:36:15PM -0400, Myeonghun Pak wrote:
> > The INT33FD Crystal Cove driver enables the parent IRQ as a wake source
> > after registering its regmap IRQ chip.  When that succeeds, a later
> > mfd_add_devices() failure or driver removal leaves the wake enable
> > unbalanced.
> >
> > Register a managed action only after enable_irq_wake() succeeds.  Since
> > the action is registered after the managed regmap IRQ chip, reverse dev=
res
> > order disables IRQ wake before tearing down the IRQ chip.  Keep warning=
 and
> > continuing when enable_irq_wake() itself fails.
> >
> > This is limited to the Bay Trail and Cherry Trail Crystal Cove PMIC
> > variants using the INT33FD ACPI ID.
> >
> > This issue was identified during our ongoing static-analysis research w=
hile
> > reviewing kernel code.
>
> ...
>
> > Assisted-by: OpenAI:GPT-5.6
>
> Assisted-by: LLM
>
> ...
>
> >       ret =3D enable_irq_wake(pmic->irq);
> > -     if (ret)
> > +     if (ret) {
> >               dev_warn(dev, "Can't enable IRQ as wake source: %d\n", re=
t);
> > +     } else {
> > +             ret =3D devm_add_action_or_reset(dev,
> > +                                            crystal_cove_disable_irq_w=
ake, pmic);
>
> Make it a single line.
>
> > +             if (ret)
> > +                     return ret;
> > +     }
>
>
> Shouldn't disable_irq_wake() be called at .shutdown() as well?
>
> --
> With Best Regards,
> Andy Shevchenko
>
>
