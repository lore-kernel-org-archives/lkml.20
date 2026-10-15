Received: from mail-pj2-f9.google.com (mail-pj2-f9.google.com [74.125.227.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EF8B53FD2B
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 15:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.137
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792077878; cv=pass; b=rX4ljae9ZoL5pMpWmAicA3WjYBjNhSn/S3qJS/gF7FMdjNpUeYQVTJ6Z/OcKRLfWDitBVoM5zv5pNG6C/w7A0NCBFEurXtieYf7J8oPtsF2jNrMcbsx3Zj1e4GeDzqHksxFDYR2Jz4XkxS8K/DuZeQph0bvjqcPMA9Eg/CEn49M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792077878; c=relaxed/simple;
	bh=kxnCtFMlKaIT7SBEfLNeNNflUjSOXev1aVTpw3wxrSk=;
	h=MIME-Version:From:In-Reply-To:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KWxe1Olu9Zx63F9F6jTkEI5AM2UFeku7ZsDcjlXZOUKNSHJh6F+z3VjiDtbQe8RL1QG64wQNelfsoRnfGvl1cbHbfkNMdQ4AbWluYxFxViRrxBjBZMH9TOPKrhDiVYJJI24tc6yjiZpZCKEknnEMZSeWAolQug8Luej8fxQPH5k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lVzWvSJ7; arc=pass smtp.client-ip=74.125.227.137
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lVzWvSJ7"
Received: by mail-pj2-f9.google.com with SMTP id d9443c01a7336-2e4a61a2ff9so24880965ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 08:24:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792077872; cv=none;
        d=google.com; s=arc-20260327;
        b=Wty+N//FvVJtdrQqD2Rj68yB66sOzqEgLHnSNpe12gKRlhUj/o/mvlhVgUDTV2rmFt
         eLphTZzdTqzQ0VK6XDOinsyXXTpegsm0AcKLEDImXV+XJCym8NHufSJkAkludo5J9LVP
         GXpvxgE63kWnk47gZeorRcxwRIAF3pemb66te3+FQmkt1PMa3e+la5ifahLNQEd6lT0r
         /KfTm8YJl3spJz4haYo8xehgM3mkyjco2uLNajwyd/lbkVCSgeVeu1t3AKbIzZuvUgSv
         9kiuNwW/Rbdz+xT4Zcx7HhEgpxtbjOKaAi+OuzjDmOxuuBdVZeHeqdBaulzvKUYISfqz
         bNlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:references:in-reply-to:from
         :mime-version:dkim-signature;
        bh=YD6S+6u+gzgwuU4ceon9d+8HFftoXU9zg34ox/v9I5o=;
        fh=3ubE3TT/VNFo5zAXfEplGCIUwqo3aFjTBihTjJ2rAnc=;
        b=qIgdd7ZziVG0UWkLgow82+EtPTR1pWfnWzQEeK4xGPz0TLdHKFWwzD6fjPhAjdlo6x
         f1GF+YWQQZfaxyiiy31oKrJVTT0bJMQw7sKkvyXw2HH3SPmLt2YYgOJNtp3/aKLT+5o2
         9mNZqV0SBLU+Ig2B/qcm85QjtOHFUB2JRFEDDrjBlUdjnejwqlYtnBZAz5GB+hZ1KYEM
         yBASPbhvuL3buwJ5nOW10kIVZFgSyvX6hcCi5pk03zxjeZ+9vphKvfHaEoLyJDanmKpq
         0YRPuieIepQJuncPQlGVofEBBv+MjKs8mh0vuoI/VNpIGJ4KKrUQVZXuud3WOW01umDL
         DTYQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792077872; x=1792682672; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YD6S+6u+gzgwuU4ceon9d+8HFftoXU9zg34ox/v9I5o=;
        b=lVzWvSJ7tnOVRJuWNEvIAjRcPQNcbWahP8fLd0ZXWMjpRHDV92wOxkJ5ou2Cru3u+E
         0Mo7UwcF8umojzBAIFVu1r9Rcnfxa9idn65xvWiiEEEMJVbGOaz93uW1w0hk77hD/8sY
         yAxOlFNoPVrY/0MHkNoZVRl6jPYnelCX3zI8t+ZXZwtaKhkFph46It7A+hqA4vULTxMY
         tNwtVke3rMz11Tb27xImGrhEStQwJDxpxcBKAfK0n800vuH3j1rfez/C+WjcNuW9q/MB
         9Pa2DhRS3vlNlxtxRL9AI6QXEK4OK8+QQ2amMZv+PO0FYHbUK+8+X15upmsvZAJrm1x5
         MhSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792077872; x=1792682672;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YD6S+6u+gzgwuU4ceon9d+8HFftoXU9zg34ox/v9I5o=;
        b=ZtQ5abYIO97Red8qO4iI6NumacaRljj2PfJlg78qgtZPfVBU+9KhSsuuYk1ZHxE3Lg
         b0EM8cSoDcUgYx0QcgWCdxzYIXAkrAYkqzyDiWV29pQ3pTZ2sywe7Hch7OrcOmHpT+cD
         gWqWYDGyFuq11B6NK0ZDiv+FxMYylhjAUbTecDS+Hel14uElZIle+lccoE2iVBVgQhHH
         ZG9XtvCuqrKEvsMhQDGeDwn1bBFg18o567kx99rnqFrU9L5NOWIxytNZkpXoMGrDoElV
         np0dyMU9yXkL1jsb3yLNjqYgwjslCvDfRW8RFz/kXPnwsEr9wb9XWpHKkh1qrTK5+kwI
         KrTA==
X-Forwarded-Encrypted: i=1; AKwUvBxds9IxlYgHKRufRJrbvc0DRg27VKDXdK83MoWdtdON7zdQD/4IEMl2BGCVsYUjA2N2G8xlMjNVGm5Maa0=@vger.kernel.org
X-Gm-Message-State: AFq9FYKiwt5oqb9UpYvsFM7hL8o7IR6l+emRJfvdytwfp8XEkVOprGa3
	sF0fmoa7S2lmiReieZRlDi863/klTQtrtlk6u5W873BnH3Y+j6rPrpz4E0lVXbezDgoxDkWtQAt
	WbOtLi6tRr9b+VTT6zM/xgM1Z/zep5/Y=
X-Gm-Gg: AYBFou2DQqCteqW/knHEFcWu08zxA9OSc5frf+qem+NkK10VPMP2bJhGzwwOS9o80AD
	Mp7Ol5uMXT06jipxjP6BlWYo2SBYaTWlOO2FjHT957vmsnnHJeW6y70oMl/driw90yxxR0gH8+g
	fHCZQi6aq2C6ejRuzEdP48wwPLaezpZybcVhlQF2UBBaff3S3h1bOgu9wzgsZdsFRLcp8kR5dAE
	xhjjV3n7YGUCglFlVPo6uyTkjQA8h4enctNGzYk/pSxbxpPsz6ONt3BVxZh3WdPFfJ6SbEDDA2I
	FiqYvblnM+0WGlPmMaiKQ/+4QRNVmeJaemiWMcJjJ33EVRgDEQhrk6qmDScNbEuZ/SVAXF6U9cU
	nmdaj39w=
X-Received: by 2002:a05:6a20:d4c:b0:3e1:d80e:c960 with SMTP id
 adf61e73a8af0-3e1d80ecaa1mr4599730637.1.1792077872127; Thu, 15 Oct 2026
 08:24:32 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 15 Oct 2026 11:24:30 -0400
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 15 Oct 2026 11:24:30 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Aveline Noir <jm5905938@gmail.com>
In-Reply-To: <20261015141442.88741-1-sj@kernel.org>
References: <20261015141442.88741-1-sj@kernel.org>
Date: Thu, 15 Oct 2026 11:24:30 -0400
X-Gm-Features: AclHuK9j35VyoW4Zsj0WfuB6VFfItZnWYUAYwwxvoEyaCDxY4Cay-VoxbSK8Zf4
Message-ID: <CANOyQmG9Cw5wtv_XHzOPa7o+rWcDn6R0WQLpeFUc1uK=e94ARQ@mail.gmail.com>
Subject: Re: [BUG] DAMON_STAT: 32-bit overflow reports wrong estimated bandwidth
To: SJ Park <sj@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, damon@lists.linux.dev, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi SJ,

I haven't seen this affect a real workload. I found it while testing
DAMON_STAT on 32-bit.

I used a 32 MiB page-touching workload to get nonzero samples and GDB
to check the calculation. For one sample, the kernel reported 31079 B/s,
while full-width arithmetic gives 333578240 B/s from the same inputs.

A tool using this estimate to compare memory access intensity could
get the wrong picture.

Thanks,
Aveline Noir


On Thu, 15 Oct 2026 07:14:41 -0700, SJ Park <sj@kernel.org> wrote:
> Hi Aveline,
>
> On Thu, 15 Oct 2026 04:24:19 -0700 Aveline Noir <jm5905938@gmail.com> wrote:
>
> > Hi,
> >
> > On an unmodified i386 QEMU kernel at mm-new commit ad9f2d463666,
> > DAMON_STAT reported an incorrect estimated_memory_bandwidth value.
> > CONFIG_DAMON_STAT=y and CONFIG_DAMON_STAT_ENABLED_DEFAULT=y were set.
> > The guest continuously wrote one byte per page across a 32 MiB mapping.
> > I used QEMU's GDB stub and the matching vmlinux to stop just after
> > damon_stat_set_estimated_memory_bandwidth() stored its result.  At each
> > stop, I traversed the same target's regions separately and recomputed
> > access_bytes with full-width integers.
> >
> > Three nonzero callbacks, all with aggr_interval=100000 us, showed:
> >
> >   access_bytes   independent sum   stored B/s   full-width B/s
> >       33357824          33357824        31079        333578240
> >       65200128          65200128        25244        652001280
> >       41152512          41152512        24303        411525120
> >
> > The final sysfs read was estimated_memory_bandwidth=24303, matching the
> > last stored value.  The independent region sum matched the kernel's
> > access_bytes in every callback, so the sum had not overflowed.  Each
> > full-width result fits a 32-bit unsigned long.
> >
> > In mm/damon/stat.c, the expression multiplies the unsigned long
> > access_bytes by 1000000 before dividing by the aggregation interval.
> > On i386 the product wraps.  In the first row it becomes 3107979264;
> > dividing by 100000 gives the stored value, 31079.  Full-width arithmetic
> > gives 333578240 B/s from the same inputs.  The other two rows show the
> > same problem at the callback site.
> >
> > The workload is synthetic; the test checks DAMON_STAT's arithmetic, not
> > the accuracy of its traffic estimate.  The i386 config, guest init,
> > disassembly, GDB probe, logs, and build/run steps are here:
>
> Could you share more details about your use case that require this setup, and
> how this becomes a problem?
>
>
> Thanks,
> SJ
>
> [...]
