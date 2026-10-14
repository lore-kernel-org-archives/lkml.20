Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C8CA388382
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 15:33:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791991992; cv=none; b=t5JXhp6uOvg9NhTfOJbLHEBtUxy4wCe/rdXKJ3+hNkCM2jjv8I7NgaSnof710FMYUThjwxYcB9LOjaIEMubNc2atgeCaxtl6bwpZM0sbreRQMEVqSj4ttJt+7P5MUKkGVGf+yJEBMD0kOgiQJywkQxcuiVK+jhoJwj9ScWKADSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791991992; c=relaxed/simple;
	bh=gSc6UpJfQueqn3xvcrDKi7fymYuOVBBl17mL2gyPIrE=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OCXkiIIeWIKUS5XeTtTA3V1rQ/l5eWooyrA2uqQHgBAw5FTR404l5WSkbiyHDlWIf+jRTXGw32HgZYFB38fKQ9jQAJALp0wG3Zk1nJ1XI2G+3j8bsD9OPn7RLNC9U+n+tCHGTG5DOWgt1ABnC8S65vwjbLMPVk4L5LUmmnNgUgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i9r03DVo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i9r03DVo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA5841F000C5
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 15:33:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791991990;
	bh=gSc6UpJfQueqn3xvcrDKi7fymYuOVBBl17mL2gyPIrE=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=i9r03DVoX4ie5z0pl/0FxRxBptr/3hOzC5U9c0uH9adMRfnk6Jv13JqJFwKGz0i59
	 ZfNHZsaEnqRjYSeLAPlmG44da36DPeoWunkqWKnlXDtnt9dmERytzk4MSDBQbXtWU+
	 IhpRSYCA4EXrKJj0DUOyyKZCW3MWC5uX8Fm2uPIbs9GdcVDuHRpS3OrHusxGqUNK3T
	 4/zVyIFXpQMDDlPwTkI3M0wqHVpErABrJPxyDBYoewfWdsWADUfjrkvBplVy/civzZ
	 S04hW5vg+LuIirEL/J6dmOvIc4tylUYMp8lhkrV7VyWgjHcakgfH+K2kPaUcvINV+z
	 tgB5zUJCAngCA==
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5bcdae234ecso3889877e87.3
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 08:33:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxvAYPhnxX//JWPIx6BYVyYaCPYW2CoMiposgsM7OeSLKyKUZMaruD3tHAoJe4jzwgj0fe124aS7tTOVeQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYIHsLhuGtsJ/IIl3LJ3jCyy6M1FCwU0qZeiNvRw1Uex2NPQexxs
	7TMWZhGOY2wNbfJomPWXQHZ0nQ2npmcnka8Z6NBTdkgyVD2AK7dzobiZPmVIAElRvPRV7yMCLcB
	t885Z7FlzVDuDlZkd0qon6l9QWNyWd2UiEKket17gHA==
X-Received: by 2002:a05:6512:10cf:b0:5bc:b67d:58d0 with SMTP id
 2adb3069b0e04-5bcde6c332dmr5547626e87.24.1791991989620; Wed, 14 Oct 2026
 08:33:09 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 14 Oct 2026 15:33:08 +0000
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 14 Oct 2026 15:33:08 +0000
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <7D6EB1C6-0CCB-44F1-B698-89B0479EEDA2@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261002-loongsongpio-v2-0-6e3eb150a4ef@gmail.com>
 <CAMRc=McnDBO6OZx6p9HGHn=Yyt8ydD=8Z=zYZvYvuy-_DUq6tQ@mail.gmail.com> <7D6EB1C6-0CCB-44F1-B698-89B0479EEDA2@gmail.com>
Date: Wed, 14 Oct 2026 15:33:08 +0000
X-Gmail-Original-Message-ID: <CAMRc=MeW2nR8W3_4266N05p3Oa1WPNJhA92+T3miXQ0k5CsyJg@mail.gmail.com>
X-Gm-Features: AclHuK-Hm_r59Hkph0VsRse3Q7rHSNP68Kjq_5PQ5Rf6iOR_993gdwwD4MIIx_I
Message-ID: <CAMRc=MeW2nR8W3_4266N05p3Oa1WPNJhA92+T3miXQ0k5CsyJg@mail.gmail.com>
Subject: Re: [PATCH RFC v2 0/4] gpio: loongson-64bit: add interrupt support
 for more models
To: Miao Wang <shankerwangmiao@gmail.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Miao Wang via B4 Relay <devnull+shankerwangmiao.gmail.com@kernel.org>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Yinbo Zhu <zhuyinbo@loongson.cn>, 
	Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 8 Oct 2026 12:21:43 +0200, Miao Wang <shankerwangmiao@gmail.com> sa=
id:
> Hi,
>
>> 2026=E5=B9=B410=E6=9C=888=E6=97=A5 18:04=EF=BC=8CBartosz Golaszewski <br=
gl@kernel.org> =E5=86=99=E9=81=93=EF=BC=9A
>>
>> On Thu, 1 Oct 2026 20:13:18 +0200, Miao Wang via B4 Relay
>> <devnull+shankerwangmiao.gmail.com@kernel.org> said:
>>> This patch series aims to correctly add interrupt support for GPIO
>>> controllers found on more Loongson CPUs. The GPIO controllers in such
>>> models do not have a complete intgrated interrupt controller, but choos=
e
>>> to delegate interrupt handling to their parent interrupt controller.
>>> This sounds like a heirarchical interrupt setup, but what makes it
>>> more complex is that multiple GPIO lines in these controllers may share
>>> one interrupt line on the parent interrupt controller. The details is
>>> described in the third patch.
>>>
>>> Signed-off-by: Miao Wang <shankerwangmiao@gmail.com>
>>> ---
>>
>> The series looks pretty good. Who is the RFC addressed at in this case? =
I can't
>> really answer the questions from patch 3/4 as I don't know this platform=
 nor am
>> I well versed in ACPI. Maybe Cc the GPIO ACPI maintainers for review?
>
> Thanks for your review. The RFC contains two questions, the first is abou=
t
> the firmware interface, including FDT and ACPI; the second is about the
> way handling the delegated IRQs.
>
> Regarding the firmware interface, it is to be decided how to declare
> platform irq numbers for the GPIO controller. Such a GPIO controller
> may have N gpio lines with M parent interrupt lines (M < N). The
> firmware should a) list M irq numbers corresponding to the M parent
> interrupt lines or b) list N irq numbers (which might be duplicated)
> orresponding to the N gpio lines. Previously b) was chosen by the
> kernel driver. However actual ACPI tables found in the published
> firmware chose a). The discussion about it happened in [1].
>

Unless it impacts DT systems, I'll let Andy handle the ACPI part. Please Cc=
 him
next time as I pointed out under the RFC.

> Regarding to the interrupt handling delegation, since there is no
> complete interrupt controller integrated with the GPIO controller,
> the interrupt handling, including detecting edge triggered interrupts
> and masking/unmasking, should be delegated to the parent IRQ controller.
> I want to check if my implementation approach is acceptable and not
> violating any implicit rules on the interrupt subsystem side.
>

I'd suggest to run your implementation by Thomas Gleixner because directly
accessing the internals of the parent's irq data looks fishy. For instance:
you call irq_set_type() directly without going through __setup_irq() ->
__irq_set_trigger() which does some additional bookkeeping.

Bartosz
