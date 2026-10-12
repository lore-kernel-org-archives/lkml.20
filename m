Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29DEA4657D6
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 10:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791801049; cv=pass; b=utRiTfgohtPbrWqlYz9VJ5zLvozQaVxAQwOf7VZ9tZyAoFHo3u4Ck+wzElsTV44DynlDnidQR7Y6cDfT6vt/ilTyNS8jwhIhlwxoZa18Anx3Ba+VGPclxqGEMuIAUz7xP6y8+pbIwk1s5W4Hv85KE38V+w/qmMA2pjAlKzSZZeM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791801049; c=relaxed/simple;
	bh=IB3vRWAv26Z0PCb3g+aKE9Rqo053txGYE69qpbQkWQc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OAcD7Uyx92xnWpcP2NqhYlZuUOJsJMHLvc6JV14GposQ4P90w6LUYT6z13ZqLr//DYPUW4iUL7XsKLQbkG++ag/ibGX6LCTWjLzMDBk21hUuSFal1gbOP7zTPvw5fKOZ797CsaR4WJQDt8IqerM9SeXbhe12t/q36mSnIUL805M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JxDrdibd; arc=pass smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JxDrdibd"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c2dc8cb0decso175539466b.2
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 03:30:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791801041; cv=none;
        d=google.com; s=arc-20260327;
        b=EpWIUMuUzGwI9kkIHgtDRlVrlz1tHc6TRr51zSt/xDVrsdcpBz0jJ5NxZ6MTgf7aou
         EzyZPjVvqJ8yj711/HzCIxkjTK+Xq+9tRzGNp32BkAF2YTAf9K/oUm54YFmfmn9z/t3e
         KqL3lYOz9NoHyzPwdcTJvVcL9KhgQoOojqrabTikK+zw+ZxhpfLYcU1DRv1ngqczGHug
         tLlpI/TLxl0b93Y2j/D5NvMZ07mNRWVGj30OGkefj9slGedqOaFuxt7XVHFLZJYKXaWR
         Tm5c5JesYMG7Ke0gMDL/+F9FHX/TQKMyBFqSY0EApsAceeH1KGQw/VRG6hJuTnG0TOPe
         8Xqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IB3vRWAv26Z0PCb3g+aKE9Rqo053txGYE69qpbQkWQc=;
        fh=zU1Y/9Ci27cRrIaCk81CwWeAgjRd6sFFiBqUDrBRg1g=;
        b=RbpNy6Xy3usW81nslhofJIUd34JASLsM9fTXbKvctuaPnDJJFVlY7wG4PLqNm+Xo1Z
         O0qp7TSKF0+XDXPMIsip7ngcBAOxIGrln8DVk+Ze7+VMuOEOyKCb3dxlrLwpeZiFgP2O
         57eJSyBJ6EPil/IaecKp/ZLtdImd1BT/EYQ98UiFywqmixNPaHStGgN9VqZlwFAKnRej
         ZEa3yUEVARv80P0E/LVV37F3x3Fh3BK4qooXabJFv53m+EcznUpYpSa31ox+Y15Cf6O7
         DelTIQY5nJRd1w7Uyq6VMKI1Ux64lWOSKZCURvabrInDDH213RGDjwqE+fNh3C0kPc0H
         e21Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791801041; x=1792405841; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IB3vRWAv26Z0PCb3g+aKE9Rqo053txGYE69qpbQkWQc=;
        b=JxDrdibdlfh4aeRXmzmgxuwDKumTFnNV5hbsVLB0Dk8K2AsIt5PppPNoOjJyM07sk/
         pQMUikMfpfLU8Ch9VVa+3w2yC5hwQNVFfsLxuOoMqVuMP4rdrbvDXfncHtTNYl8nrBxb
         4o/WGIpWXM3gR5iMBmEp9VjAfS8vv37e2ZsRMUJplSKfWiCIS3EEaewmcLa0ppZ1ylCZ
         KKonEDcDKbRx4P6SdzQMeJctNngJj3lgyE4UcaNrMyNDUGzEqy0cmFcAyBKz62RWbTCK
         N6ULrcbz7VIiOBlmE0DfhroWZz74/Pt8I0kwyzy7kTyhkweUaB118SLVzJo1iv2HeTSf
         hEPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791801041; x=1792405841;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IB3vRWAv26Z0PCb3g+aKE9Rqo053txGYE69qpbQkWQc=;
        b=brhaXn+TH1FfifQ26H3x7BIctMVT1Gmhrm0gvQ8Cr+XKTI/rgW/YCqElomCSKG8+aE
         CfcAt53aBtSc/6GxdjGSZCm7w5IiF4WArPqxICcfnGhHfzdoTT5s95N59hO2lrzDRZOj
         BlP6IF8AQvPoBEyDUioUmPKtRHYrv5cFqivbiwe9SUTIYqpNT2qj8FOGOEDRnqY7FN1J
         a58o0qiCm4a5FkZASJg5OWRI72DxHN/8DTudIWkAYQ9A48PdF/ynF+JPw98hCEuoL6iP
         VsxVHqI1rz+NYq1uwxICeoRtD/jDRfiSxgPBOcumgeBKvexrOmy2eXvG2GXlZPK7btPt
         gCCw==
X-Forwarded-Encrypted: i=1; AKwUvBx1xoTNNns5NfWoUUyHyh8tRXHbpNlgTGINP4HXAYX2iXiRXpi7VOZbiA9Uz9nDLo4xMlBwKSyrPIhW8Ms=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ/ZMff3TbxHie6l3/UgM/SdOD57OyfnaOJ6wYv/DQGtgqqM3d4
	YIBnoqnAZbSZIcorn+kqxnGeF3LuIrJayeWmwwx1MClUaq0NxQRVnY6mBPyOY02rH8SjZoecTN4
	Uc7ktMKQba/ZSBrNQeXxdKTF4V1E2OBE=
X-Gm-Gg: AYBFou1+g7OoJCbx4feAqYPo8g2W8cNnSH2xtL4lvBzNxtZ1lHZXzlc51WtWkpapGbI
	w6RU1uqoIS6hCXp4y3Y+A2uyBw1ZWm1CsZciGREtCPnruUOIv2XDdtBsttglIFk08FxnWaEE2Iv
	uHgjqyfuOCFmO426c05EShax4U7mi7mezVmpPNzGjC6AbFAOtSuZS5sj1jN5ThTRAHBzl0xiCKb
	Pdn9c4/5gsBC7Yv2DOHc5o5BxoHuYks4ccvs3BpxeogsRUCORaQ4P3H/Aj9yiiC4aixIzp3k224
	vt8GJisUZRaWF1MVu6tmw0j8BIePmnz7LX1fSd93erUThHqjcq21ZVUY48Krhz1aNULtpxgQOUM
	gKbew4U2P6LiK5hQB0cV1e5cZ2T25WQOKT2J4uYkLMQptmiW/GK9yHiHHVPwiUiAD7S87bI1lPf
	pVxznbEqALClCQX73Tx5nySHH7RkCTmrmBbAcWfsOJ
X-Received: by 2002:a17:907:3d4f:b0:c26:19e3:e979 with SMTP id
 a640c23a62f3a-c31aa02999amr829174566b.25.1791801040894; Mon, 12 Oct 2026
 03:30:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261011-gpio-mxc-cleanup-v6-0-cb47ce2ad758@nxp.com>
 <20261011-gpio-mxc-cleanup-v6-3-cb47ce2ad758@nxp.com> <CAHp75VfCrQAnVYV-7wiga-R8A4VKgjfV+EHo_7jy=FNmU=Ov6Q@mail.gmail.com>
 <asytkrYip+v2vl/i@shlinux89>
In-Reply-To: <asytkrYip+v2vl/i@shlinux89>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 12 Oct 2026 13:30:04 +0300
X-Gm-Features: AclHuK89C5O-S_Ib4WjyrexO79x7Ht_pFlIF6GUEOqfiEQUn-PMquRFiuZzNiXE
Message-ID: <CAHp75VfqdVAYCTi2j0sB=rxBYaJ709-Wq7-aprfZZiBxbu=U_A@mail.gmail.com>
Subject: Re: [PATCH v6 03/13] gpio: mxc: fix wakeup_pads bit operations
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Shenwei Wang <shenwei.wang@nxp.com>, linux-gpio@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 12, 2026 at 12:46=E2=80=AFPM Peng Fan <peng.fan@oss.nxp.com> wr=
ote:
> On Mon, Oct 12, 2026 at 12:15:28PM +0300, Andy Shevchenko wrote:
> >On Sun, Oct 11, 2026 at 2:54=E2=80=AFPM Peng Fan (OSS) <peng.fan@oss.nxp=
.com> wrote:
> >>
> >> gpio_set_wake_irq() can be called concurrently for different pins on
> >> the same port, so use atomic bitops when modifying wakeup_pads.
> >
> >The code doesn't modify any reader part of this member. So, the above
> >paragraph is incorrect, right? Otherwise it needs to be clarified how
> >assign_bit() does change anything.
>
> I will replace with below:
>
> gpio_set_wake_irq() can be called concurrently for different pins on
> the same port. The IRQ core serializes per irq descriptor, but
> different pins have different descriptors, so concurrent calls for
> pins on the same port run without mutual exclusion. The plain |=3D and
> &=3D on wakeup_pads are non-atomic read-modify-write operations that
> can lose updates when two CPUs modify different bits simultaneously.
> Replace them with assign_bit() to make the modifications atomic.

Right, but the code does change only the writer side. There is no
reader side that was changed. So this patch does *not* add any
atomicity. You also need to check if the reader side already uses
test_bit() or something like that. Otherwise it makes no sense.

> >> wakeup_pads is a u32, while assign_bit() operates on unsigned long
> >> pointers. On 64-bit platforms, this causes an 8-byte read-modify-write
> >> on a 4-byte field, corrupting the adjacent is_pad_wakeup. So change
> >> wakeup_pads to unsigned long and reorder to avoid wasting words.
> >>
> >> And fix the enable/disable path unconditionally sets/clears the
> >> wakeup_pads bit even when enable_irq_wake()/disable_irq_wake() fails.
> >> Only update the bit on success.



--=20
With Best Regards,
Andy Shevchenko
