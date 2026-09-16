Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32354495AEE
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 18:17:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789582679; cv=pass; b=joRL5sI8t1yZUEgIBj0lWTjWYRbYb5e1WxtWemwtQvAoY+dgUHTRZAOwiBlbRZZvkD7hu6bcG2zvlWOJv/KXTNClSozM1spBW8cHhossT5c9iiPfc8aHnNA5av277V+v1Ua0J9JlzLSe63g6w092Wmq9efLlJvOmV3MnbjN73z0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789582679; c=relaxed/simple;
	bh=Cru63pCpKSNAK6GcDnmrPULFBGS/XE5+CwZYiPLRCD4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=brFRT0aUR3axr4+EOTgtGTl/Mswaq3ODdFn/+F59H52RBiaTqwHrCeQaK2pGLat9N/o0UAa+PA7hOQbpPya9C2ze7DQche02tGOeIIGOWTQ2NC6kyPked7iXy7eazlmD26BCetVkCG0p2vHD+gpGvi5YhSJjYLg2VnSC1Oy0xJo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CXcumD2j; arc=pass smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CXcumD2j"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254f55efe7so1421566b.3
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 11:17:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789582673; cv=none;
        d=google.com; s=arc-20260327;
        b=FSphupD7FeWAGb1CIkJQePDTkXZymjee+oRrN9WJjlNtWFvYw6GYroJShPPLeQqUlu
         ZPKVxeiU9Uxm8amNjFlm4+asTVRTAp3XkTPVp8dlqhtHf8tHdURaEA375OwhjOtOQBU9
         NHjcjJG324Oky7nL5YR9aZd8+mHcC+Kvs8hVYDscEnZ/wIZbuQRv4lwkd+S6BxR0pXb3
         +Q9UqWBanXvRefaq/YL/gEHrYKGnAY18VU6A/Vn7lfjVyw+En1NYG0xvBiXknhtNshcw
         p2c2/gaGa1iMQgqm3a2kPQ6v5dqbaCmiDeii5sDIlgAaHDnCYW+8F/miwQXFeVz2sE50
         x4ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Cru63pCpKSNAK6GcDnmrPULFBGS/XE5+CwZYiPLRCD4=;
        fh=MS48ljUPIFKpunVnZINW16HUB7dtMHD4zD+VkPx1Drc=;
        b=hJYERkeGopWIfUiC4YrBKgXnc3qQhb5o9R6ZEvT1iqghBfs6A8JSQTnaUhj+av52ZI
         iIzbU14fdk2g8mDY6EjCQdeTSOTV66MaBvn1sXXTO6sFkPKWSS7y+8ga/dOT12ZruR9a
         xaNWKjVDT+N8sGjf0T/wABIwBW9fXxyBDu4pqclOKFnX/22OJ2TooYX0CLBVD/GhGKeK
         qbg+flRHLEzt3Egn5W0Eed0EgdUkoJ0bjNBYxrDfrAqzk2kRvBjxqCoyJDqJjQ07bLaZ
         YPAtlUDtUOpWh3bDgQPPs2EwKIxe+S3587tbL8ora5m9zRFVI4TZItd09UAUHmx5bbIZ
         l7Fg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789582673; x=1790187473; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Cru63pCpKSNAK6GcDnmrPULFBGS/XE5+CwZYiPLRCD4=;
        b=CXcumD2jlVFHfZ89Zeg+Xn3s5LF/hPeXp09HUu/akJWzuiucL+4im1wGg4kY4QRUxC
         HjQplmd96cC5kn6D7gwQrijreAYPofGW4TiTtA2lghtgg2e2WCaDar3tv93SMRPVBlIC
         HXPxjH66ca9jHPEwP7Gp6vYVjHgklmeSWBJGPJfY9FmmXGMRTP5r1BKcOEWS5lT3EnOV
         ntrG9JFK7cshIYwQq+KM1Zsw92v0S2tOx/+Hj3KmU7p0GQMxS+VaHy4ul/MLCgWdzNcf
         mggrPYYZYcOVmE4vdux3QCOXs7aeOVnT4LP7dbEX9p4sH5TcxYbmi9JGAZa/t3rUMM1/
         hSRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789582673; x=1790187473;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Cru63pCpKSNAK6GcDnmrPULFBGS/XE5+CwZYiPLRCD4=;
        b=SDV+9b1YI1mLKgpXzb8hAo3E15lzwPLNwXgBVj4LEaiy02cGgMmBb31Kt5MT7J1lhD
         96/9wtuhopRuXSw76Y6Jrxo6X5KKvsPv5BGMOmgmXWnPoVmyKqyytH7zJcaPR7LFrBOa
         L00foTCU3/knKRTyjxxwFVO81VgzcJh34ivMEAAMzlOdtNy2nRb+NG/lBFjV9YvKjI1f
         rwaYh5iZauxX0SYVdtu4eOlLfjAlVjhRcMQeTR9jtr+viHhbRXbiaogVPIhJ+YV/h8V+
         ILsCyWnCxvIpGcWt0Nwj7wMH4NhNIXdKxQEDiYB3A3tUpI3WSOZoZmi2yjGda8Bnw+L7
         qoPA==
X-Forwarded-Encrypted: i=1; AKwUvBxFAL7IC/zhjmHeKuhVgYfH/oTCxkiO9mHlEZZTxJZOGkytqbio11/gCEGA1WNzY5AhRp0sZcZkSvSPKd4=@vger.kernel.org
X-Gm-Message-State: AFuF++kSnLkW99e1+GNbAaSoQWVgIhVRV+yaiiqtue70d/AG0L8ortI3
	OuwPoFiG4Z7OGe3IyWctNQ7xacbIhCFDqysw8UQ+NGAGFRd/iJdA7uuyvM2saUL98TVxWMTx1ej
	EuvUjzN+fyWto6AYv93tez2AR039p72g=
X-Gm-Gg: AYBFou3buZ2/BsaF4R8emzOfMHAT43Vy3evuhOj/mxShpUFW/CD/B7Ji827is5kdLBr
	VzsvGYLrsoZe6YPIewD4nN6tOhxUVSY3tdkb53oRwP7LwxBiPeZFQ0HvPgEOo/7idXOjI2PVG3v
	WlZa/Pf7QpazhiD3P/GRBEISAMzCAMZSN7RoOtQHlWC7HAXRGtZPWv9rd2gpmUcdNnJLGpcJORp
	7zXnApcxpfdl6PqPFy8AJsywvMAikSe/3BENVqr+JfiPjDJU+jMCBUjI2eBViB8O+sKDYHWK0rL
	PSNjKaJFpBzWCEr4mXlUKGUPQqjc+J7uepS0qJSuk7V2C4d5MR/x+otX1bSK9VJItfP+tA0bXtH
	8B3ycrdvVGETxQpWKwxxwA/tOvygzvxVH53GaJoDKrE3t6wc4YKFLsLFBoi+YmKVx421PNTp1nf
	EYzSz9GXNRPLDW5j/ikkKROlORWL+gV+m/MmY+sTe50nGWEnyhZs8rclAyBldtBLuzJw==
X-Received: by 2002:a17:906:6a28:b0:c24:4128:c19f with SMTP id
 a640c23a62f3a-c29e51f0ec4mr299577866b.11.1789582672999; Wed, 16 Sep 2026
 11:17:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260710070704.60680-1-rosenp@gmail.com> <CAD++jLkpAi3Vh=YYMckM7z8SmRFeHUUeXS4wPLfciOyMZpZ1Hg@mail.gmail.com>
In-Reply-To: <CAD++jLkpAi3Vh=YYMckM7z8SmRFeHUUeXS4wPLfciOyMZpZ1Hg@mail.gmail.com>
From: Rosen Penev <rosenp@gmail.com>
Date: Wed, 16 Sep 2026 11:17:41 -0700
X-Gm-Features: AcwNN1WJVvzdnVOZHo3lmjytRPKjTBA3ddruZMUBzOzR06ZUxhHvHvqAjdwZQVk
Message-ID: <CAKxU2N_cLWq2KHGGsbJhcm-EC66TNbwshV9wTetub9_cWJFqaA@mail.gmail.com>
Subject: Re: [PATCHv2] gpio: mvebu: convert to noirq suspend/resume to prevent
 interrupt storm on resume
To: Linus Walleij <linusw@kernel.org>
Cc: linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@kernel.org>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 16, 2026 at 6:34=E2=80=AFAM Linus Walleij <linusw@kernel.org> w=
rote:
>
> On Fri, Jul 10, 2026 at 9:07=E2=80=AFAM Rosen Penev <rosenp@gmail.com> wr=
ote:
>
> > The driver uses the legacy .suspend/.resume callbacks, but sets
> > IRQCHIP_MASK_ON_SUSPEND on the irq_chip. During resume, the PM core
> > runs dpm_resume_noirq() first, which calls irq_pm_resume() to unmask
> > interrupts, and only then runs dpm_resume() which invokes the driver's
> > .resume callback to restore GPIO registers (GPIO_IN_POL, GPIO_IO_CONF,
> > mask registers).
> >
> > This ordering means interrupts are unmasked while the hardware is still
> > in its reset state, potentially with incorrect polarities, causing
> > spurious level-triggered interrupts before local IRQs are re-enabled.
> >
> > Convert the driver from legacy .suspend/.resume callbacks to noirq
> > callbacks via dev_pm_ops. The noirq phase runs before resume_device_irq=
s()
> > on resume and after suspend_device_irqs() on suspend, ensuring GPIO
> > registers are restored before interrupts are unmasked.
> >
> > Assisted-by: opencode:big-pickle
>
> Should be
> Assisted-by: LLM
> these days (Bartosz can probs fix when applying)
I'll post a v3. There's a better way than __maybe_unused.
>
> > Signed-off-by: Rosen Penev <rosenp@gmail.com>
>
> Reviewed-by: Linus Walleij <linusw@kernel.org>
>
> Yours,
> Linus Walleij
