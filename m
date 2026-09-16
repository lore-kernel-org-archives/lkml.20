Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A22184FECCA
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 13:34:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789565660; cv=none; b=G8yWYgMBxiWMdFHLnAdDsuApz/XOyl9mSbA4eTVQxtX8NGVBnEvI8vunuwp1FXcF89wuA7BkSQxDY6tCybq1sa0iVF+0mekwbLi3yqOdA/F7dFEA65NLMhj5OpXjuZN/PvG7k1FyA+hS+qX0VV5MkOfeqbgkBCeIXCeujDfvJIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789565660; c=relaxed/simple;
	bh=SL0N0err1nZrZl0HktBhkPwZ7Ptdym3maQuJxgqRR3Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PurUvigMfmyv99RSsfRQpdOpxAPkPRMz7MI7xlmMk6OXILTbOliuQ7EwXWOXpjV2GaQ2FfFLrgJcwx68Ve08PUEDgz/pI8fbwrZkhEISrBCnL9d+LMfIhdl3+8t/c72Q2rFEC5/BGtpULDdiWrojo8/o0garINl2CyL8/WU2pDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FDKwF6Zt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FDKwF6Zt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66B0F1F0089B
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 13:34:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789565646;
	bh=SL0N0err1nZrZl0HktBhkPwZ7Ptdym3maQuJxgqRR3Q=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=FDKwF6Zt3xrnR3aWoFDJkCUoc9ezuYstdOCdmN6nfFTim2tUb8Y/IGV+QJF02tLsk
	 MQ1NhY4/57rbKFdPTCZqyM0S1b3mdez8IMD0hdcdIRT17TMIEHTlNx/N9gCQqAXW+L
	 ed0MV5gFtaueFtcdzpAeG1f/SspnY88X59cx3ZdYYGRZSNgqfr+BE+ZAEAbuZC6zcw
	 6URCygR/n3IG1HVsgk1WCVrWQ7cfa4ROJM+UyIP9NwmePXLiOZJbuKrSpl27k7+58k
	 GWqhxoT3gqj8Bym8Lter+/gCrjeRW9v+TCD9237yUKNq/bJ0kI13C8w61BeFKpNhYM
	 LIXH45rYSm9Ww==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5b8997bc6e6so1663945e87.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 06:34:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByjTaOlLXCXhNqHhwiw3ZDE5onV7DyRwNgYqmHcv18DW+OOgjRkOjbEN02pNiyCYa5t7v/gnXUhjMCQDJw=@vger.kernel.org
X-Gm-Message-State: AFuF++kTeIU2UhxgW085w9oVMm1BrEPLDAJwiseoDXnLacCNsk8aCUHG
	y1suT9XJXvWZziAqD9DkSy063uWtpovkVUkiNjODOWe3D51GRiQprK2qLRiJROWHPZv74BUq6I5
	WQMl4NJmzZ3HrsH9GlkJ/g/oYJUd/y2w=
X-Received: by 2002:a05:6512:250f:b0:5b6:19c9:e53 with SMTP id
 2adb3069b0e04-5b8b2a5e29bmr2267729e87.12.1789565645091; Wed, 16 Sep 2026
 06:34:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260710070704.60680-1-rosenp@gmail.com>
In-Reply-To: <20260710070704.60680-1-rosenp@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 16 Sep 2026 15:33:53 +0200
X-Gmail-Original-Message-ID: <CAD++jLkpAi3Vh=YYMckM7z8SmRFeHUUeXS4wPLfciOyMZpZ1Hg@mail.gmail.com>
X-Gm-Features: AcwNN1X8gayhrt9XNUrdZms7Iwl96lHZC5Mt4H7hlL-SMLIPUbFfIIGz_mTVQm8
Message-ID: <CAD++jLkpAi3Vh=YYMckM7z8SmRFeHUUeXS4wPLfciOyMZpZ1Hg@mail.gmail.com>
Subject: Re: [PATCHv2] gpio: mvebu: convert to noirq suspend/resume to prevent
 interrupt storm on resume
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@kernel.org>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 10, 2026 at 9:07=E2=80=AFAM Rosen Penev <rosenp@gmail.com> wrot=
e:

> The driver uses the legacy .suspend/.resume callbacks, but sets
> IRQCHIP_MASK_ON_SUSPEND on the irq_chip. During resume, the PM core
> runs dpm_resume_noirq() first, which calls irq_pm_resume() to unmask
> interrupts, and only then runs dpm_resume() which invokes the driver's
> .resume callback to restore GPIO registers (GPIO_IN_POL, GPIO_IO_CONF,
> mask registers).
>
> This ordering means interrupts are unmasked while the hardware is still
> in its reset state, potentially with incorrect polarities, causing
> spurious level-triggered interrupts before local IRQs are re-enabled.
>
> Convert the driver from legacy .suspend/.resume callbacks to noirq
> callbacks via dev_pm_ops. The noirq phase runs before resume_device_irqs(=
)
> on resume and after suspend_device_irqs() on suspend, ensuring GPIO
> registers are restored before interrupts are unmasked.
>
> Assisted-by: opencode:big-pickle

Should be
Assisted-by: LLM
these days (Bartosz can probs fix when applying)

> Signed-off-by: Rosen Penev <rosenp@gmail.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
