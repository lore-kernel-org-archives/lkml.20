Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03F5531197C
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 08:24:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788510286; cv=pass; b=CP6js+OE6+qeqrjP/nEvVJgQ/84+yvGR6ZzfXVYcHlJxX3QOg3fbJuY8qj6SxQn726I4fwYjUFIWc6Fr2mdYdZAeokkg6TAEBWdqNW4RyZsfFuluL1ScAS4hZdfO2B/BniJ1m+G97hWWiKIVhxz+aJNF/D3a1KsrhTEXvIxULcs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788510286; c=relaxed/simple;
	bh=y7sH0qo3GiXsyGYAiNNzndufWc7qUUuBehGgJtjwLPY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Cnw3xffMPwf5+UuZoW7dO3ZQlyuuO6ysSHuAaAQMcqvKFkilYKW0UOsyZJ59zjwGXQU4aDA1CH0yoO2icOslBg6jGAxDDxZP88K/JNnyvk3C1QeL3tpjx2STAJQg3gk91dzEcv8BhRSv07jUaLb7Lt1HxRazK5+bH/VHgkyK3dA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=btJ+WiKf; arc=pass smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="btJ+WiKf"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-3a20367cf82so7491191fa.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 01:24:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788510283; cv=none;
        d=google.com; s=arc-20260327;
        b=fGghWZN7JXCd4mlBXT0KhXRznRPN2ZrNCQHvTfHGXPcOKjRdQu47bi0TX0OTIx26hV
         mqcYWTJq5omvxz8m47XuHuSWM332w44IjvS1Sc/RRGDI88bDJAhJ2Kt1OQeH3jaY+9vc
         2tvZCoszWWkdc39T/4sgeVfF77sglKRTgtnugyb5zSvrTsP9izXiwDCn0ynRsMGUkJZ3
         Yjykf3NZXqx1Z4wZS2pjZEN4YAlKd8qJ1a+nqsbDGsK2vT0Gz+erjMjzPClmdSTrMsGX
         40nLYd33vDbJIYFCDje2hifaPLMK5xIFRuTdlvEdMIpzsh/KBDvIBV1xzBYTvzo4HjNU
         +G5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dXb1ScaV1KsEhcA/AL+HD48Eief08Xf8oe+ZEn2sFII=;
        fh=wqpym5wdywHKX1k4LfSuYEIgziUVveNNjJlYs87qQ4Q=;
        b=NLHiv9aYeVTOwS8wTF9aWH4cr02odx6sOaJWrmg3MNYCZGy5YMC5Yv2fHhkL74zGqc
         yLJU14UE7vkeKAKrBQjkm9foIqbqKar5qkFSXe4MmLlRiMEcDg0b045SDQPWzbqCCS8d
         QNz4F3I9v0vtJ7LkBYo7cbCXSxYMYWAHRTDkhFs9HwxPmH0Z2GFKAl4jWkc5/S0VVu25
         8/Ilx0+X6t7UQkYRGkXFbRg8bCvtxUEBomCr+yK5xejfWuYzb1N5nxp8sBAvvZejM4y+
         pjooM+bL0oFgHk7Y1qpT/SxgYy+X8C4BIk7IVAnEwuXHDIvD9nE4PHh27DKrv4YJ9kaR
         Y66w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1788510283; x=1789115083; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dXb1ScaV1KsEhcA/AL+HD48Eief08Xf8oe+ZEn2sFII=;
        b=btJ+WiKfekJwZNs6J6HPdk7ZlxzDXwc/sB68QuV/m1npwByZQYsqL/6fAqvlXm6qDO
         wW3MthUcdc8Iy4dTLN8rP4LpX3AzGGglFcYY2zh2g6/s27DQPgkMgBcvrqTNPsrmgHXI
         m0QdTfMj/BQYiUYf5htQdcpoLPO0pmMBtOVuETY/y7+6Qe1+cPEHW/y7n2BfUsqwtQGH
         k1H0ysjBWZdS1R0rTsTu90R3ktl2j1TSAx/tYEL4tG/PKXo9Qf9vU5FN37vkDrntormW
         1XwLBHFlrZN1dhBQxZADWv6oYd590C/FVqqZdlsR7NDf3LJvCZIXCZV9PNGpOb1Z86Og
         YoUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788510283; x=1789115083;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dXb1ScaV1KsEhcA/AL+HD48Eief08Xf8oe+ZEn2sFII=;
        b=Q7YXf2ezVwGykVcY2Z+W7/F4GFJYMi73eqWVAKkMfiY7dXvLKFzApBnN0Lev/zDdMI
         rF9ED4M5ffXzuu0hQYatnlGpVMA7IrEFfQl59dkPmD08fosNZs+Ied72ox0/46vNwfUD
         uwemwhy4lAEiBLUpcByyvK3z5pcWpFJZnt0Z/aowkvzc7FnuHRM5bFY8SuyZmWhk4fZj
         JFdA5HkVGijSTpnoyvoCpUjlKbVNbJuR1I/Cr4ByL6NijqZ0PKBJr3yfx/vzetYZIFMq
         ni6gh7c15p06xG6upmm8Oezb40B1Q/YyS8eEUM3HewatEDZXki/hJIe/fmuQN6melRkp
         2CGQ==
X-Gm-Message-State: AFuF++labqFeuk4oJDtor7qcSZ5SKvgctyPKtmEYqIPhWtMAGErfCUgR
	UtnMQS+FfHCanXt3kDfps5oO7jhfwag4A1Tzx0iqgFkYHmUZNkV3dUBH4jGSEfKqx+qIUuX/NSc
	09RXg782up0gr8Ytp+KVCQWnqrvwxOZizLUg/7rPGGGQ1PmRqfD0ZINs=
X-Gm-Gg: AYBFou2qyRB74H6vihRdZoS/dBsuJeREDOhn0gFa2CmLY5kwpS1TwbasNtYfuWjHBPW
	qlRQ9yMIB7WrlD7+tYK5D3RXFfo8uSYz2mfxHAARO5SflSzwsH6xxcdRRIa79E8f/JoC96yARUK
	nAKXL/x+3PFzlUMK4W7Ol6l1zxNmIADdq8gfatfXhsYbWmdtzoQhrImOEt3a0lZzFUw+pKHUwGP
	SCeRkdOmRc2vLJBfreWRnKIXHUMQzbcV5ehzRNIjD0NenVIx3C15rLI9m784OkY2j3c1VY2di6h
	g/kRHnJo1skMJMF+Gf2t+Vut5EEbWth5NU595v5URlV+F49na0Ro7oyl8mOWxP7imXCY1onvJ3L
	07nlbHiklq1UdbA==
X-Received: by 2002:a2e:bc09:0:b0:3a3:7680:67f4 with SMTP id
 38308e7fff4ca-3a37680699dmr1855311fa.19.1788510282786; Fri, 04 Sep 2026
 01:24:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260903165251.481362-1-marco.crivellari@suse.com>
 <20260903165251.481362-2-marco.crivellari@suse.com> <c02681b23c71737d9a84dea194b24691@kernel.org>
In-Reply-To: <c02681b23c71737d9a84dea194b24691@kernel.org>
From: Marco Crivellari <marco.crivellari@suse.com>
Date: Fri, 4 Sep 2026 10:24:30 +0200
X-Gm-Features: AcwNN1WlGOaLjlQF17ifhPWAnRGVM40fl8NxS5vd03xU0uNCWzBzYr2BWEoBTp0
Message-ID: <CAAofZF7vrkxiOu-qS5A2fAXpxhu0swXBtqJqJL3XEjEacoySiQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] workqueue: Make alloc_workqueue() unbound by default
To: Tejun Heo <tj@kernel.org>
Cc: linux-kernel@vger.kernel.org, Lai Jiangshan <jiangshanlai@gmail.com>, 
	Frederic Weisbecker <frederic@kernel.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
	Michal Hocko <mhocko@suse.com>, Breno Leitao <leitao@debian.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 3, 2026 at 8:42=E2=80=AFPM Tejun Heo <tj@kernel.org> wrote:
>
> Hello, Marco.
>
> On Thu, Sep 03, 2026 at 06:52:50PM +0200, Marco Crivellari wrote:
> > +     if (unlikely(!(flags & (WQ_UNBOUND | WQ_PERCPU)))) {
> > +             flags |=3D WQ_UNBOUND;
> > +             wq_unbound_by_default =3D true;
>
> WQ_BH without WQ_PERCPU passes the __WQ_BH_ALLOWS check above and then ge=
ts
> WQ_UNBOUND here, putting a BH workqueue on an unbound pool. WQ_BH should
> imply WQ_PERCPU.
>
> Thanks.

Hello Tejun,

Thanks for the review, I will fix it for v3.

--=20

Marco Crivellari

SUSE Labs
