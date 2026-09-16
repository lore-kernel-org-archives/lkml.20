Received: from mail-oo2-f42.google.com (mail-oo2-f42.google.com [74.125.231.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9082C3AFCEE
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 01:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789522412; cv=pass; b=n69Y+0Uo6ZkiPtYJwglXWQC/f+xFQJ5n1CQEaT2pNvFymt2sNYzM+Z41hZ2rKWYaQLXjW7ZqzdZ1PDTIw1UmGdvUTfxSf5oPPX/iM6QVzf/3cxCGwzxQ0ulvnskhdILvhB1yZRTvfnwgLZnDsuV4GvCcR93D5KYPymT6GLPmDyw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789522412; c=relaxed/simple;
	bh=5Ztf0qMjYRT3YmteIgUtTBDw9tTq4t89/7WSQzzqUiU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rNey++mut10Hp3JIabV0lCVpvUR1cBjQpJDwx4nOC8jV4GevmHds4TgU4HBTV+pzQ3NI3v6xx+z8NAOvHfXURYx1AnWYQPII+YF7KriW3c1/sNsVkP9D/HFOIGIuBh3thFx87bh8pjDIN5Y/xJvr8cYFkJtVWepVGp1MeNurqEg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y+DbufsI; arc=pass smtp.client-ip=74.125.231.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y+DbufsI"
Received: by mail-oo2-f42.google.com with SMTP id 46e09a7af769-7f4f0d37f9dso168345a34.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 18:33:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789522396; cv=none;
        d=google.com; s=arc-20260327;
        b=L3SHtbe4kVxKrZ9dUJoM7lH7wbacvoNKoZC69EDCQNVdQqXBMcO+vrYeU0d2IwBewW
         a09vk899UQv5MsMjolGa3ecnNBEDTWFQ3Px20NWG5jMWIXHv8JxM0DwICRQ/sy6jKdS9
         BDiBULfKIuEymn7Oi5IIIfISgegpY/udxgJ66KgKcDfogW6WUAyXc9I3vXgabH+3GRtG
         U3gUNIl++iq1aIG/1VWpBtyW03PYNdDrUgWcXSPj3PNVFZ/VpaC1j+l+nw1tQhjYJqnW
         qDPoBCcJ8FjkErGrxodKuDc6Z5wOcbYgvwCv9r0WSTsN8D4+p3Rn8c6iLTNn6lgnmL8c
         ov/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NzYXWSSJlKGV+Gc5Rdc9JQPvWSUHP7lfXEi/F4mrLtw=;
        fh=uZ0Hc2VbTDxYDfVWwYteS1P9DJ4Y5Tsuf7feblYyK8U=;
        b=WAng8jbJmEP9GJ4wpGBiIHXibIjb+zcbXeqyEaFo4oEphwJL+CTA8ZkcggFxG6XEFy
         zucYpzkFnqfCMoYOsme7ezR0cCsRYL2IxhCy+qtfLhRx5lUCtIvMriZQw8fec5R4jbBh
         fheOHBcz4IFSf/eGGr8hUgzTaCxw8Az8POc7S25k5EhghC4g7jtsBUSe45/6b9jk13Sn
         KsTfRbQR269/N25snjClB+FbIXLIxpeqb7Oxp2z7Cga39zhmWDGLQJ8hKFqPguix9pTI
         Lcyc1ZGHSZSLiHEBTVUsLNb/ZDMVa+qBzsY4WDxMvF71AycK7olux0PjQ8497eAVbI0Z
         KtXQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789522396; x=1790127196; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NzYXWSSJlKGV+Gc5Rdc9JQPvWSUHP7lfXEi/F4mrLtw=;
        b=Y+DbufsI0ZZDqoM1aJiTrFXb65c2kNdiUwVT7icOKG4BwvmySAwLloArTnM6JPF6dc
         HWS8vRDjgXQklkZ36KLtQmHFFivqSYx9oqOHI7XsqxYnM7nnrBSXC33N6pTLDHU5bZNq
         fty/KR8BFHi7e+n2B5T54wwqjUK4Gz0YfKOGd92lAXAx8AmkiJcTsbKXQHCaK9LWXIDN
         HudqiRP/LHPStx/74lWsp3Wkl/Z0x7XUGtg9uq5usyE+omNhEYEySBiNsGC7Y5fGRwVu
         zv7OqrdvC9eQ33QyvN/yGDz4+Jez0QUnIctIGnp48iMykveUxp781mH4rGHepuloWsHU
         tcGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789522396; x=1790127196;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NzYXWSSJlKGV+Gc5Rdc9JQPvWSUHP7lfXEi/F4mrLtw=;
        b=jSnHU71tGdr8Nu7X7Tcp8KauFOg6uMC4yNeAKQCo/VWctxLddabVPH0sKg9kj2SzKU
         L+G4cQ4QDWc8zGbw6y7DY7zB9EDgaX2mmA8K1/+ZZL+m4SOn2zH/kwX79BpmIpKq/2Sb
         jmmD6zeIKGObKr/4gqhejp+Hyx5tH0m/lmZ42xWRb2ryxui7ZB3eGfpKwIJUBlgURGTI
         jnKZSpYasyO2EDJLhK+npXaT/EKK+DZLLVz7D0+mK03OPN5ctwyzOvp9ln+r2KPumY7a
         qtAkoKfv8QfmGbGZ6ulLIucjNVJX9s36sHcl/nquL9cESGL2S2E072Hrxx1dqoWktjrw
         zgDQ==
X-Forwarded-Encrypted: i=1; AKwUvByLHErzJ/H2gOXgfY3vAh/uwW9Q0F5iSR4C6uKVS47WtOKE2Ib4hpfpNsi4NT2CLZEKXzaSEdv9Rpanwz0=@vger.kernel.org
X-Gm-Message-State: AFuF++nMb5l7hUkDKCLDcnxlA8iws4zzWUeIi7MlQ++0T0JLdo+ICedO
	bRs8UiYnR7nDCK0/3sBTSiYNLtW7GcgPfUpipf3JHr23iE5Z2x5A8LpDAjVK2vcaVWngGzrXfBz
	upUlNMhWu4bfp9Whrd2uj22QEcKCGfPI=
X-Gm-Gg: AYBFou1wPWeCGCqIr8G8NT3L9tWy3DVvqKizTYopBLqb5cqTOLWE0Luh6cLZT/QV3Fe
	4mBZjq9qMwFvO8INOG6PPJ2ajvo++duAXbffzCEzHaOJtoEF5A9LJAm4FKAo8BIjNZA9iPY7NwP
	+c3R/hYWPPxa/R5AoW1S3tHDy60cHnex71cc96D0kWS682IPhwa19DcT6tmKAoYfhldZ+VchZnq
	HK8IMPwgf711w4BQb40Q9UySaqvI8aT9LaaF++EulyUHNEgCIKfeKGURd/snEFxT9xt4gRKMqFD
	oGKFFSVjG1vSCV930ahW4ur61gtcRlPqMlNUQmQa6d28urPPn4r6GQs8fQ==
X-Received: by 2002:a05:6820:81d8:b0:6aa:e573:9ce0 with SMTP id
 006d021491bc7-6c7d16ce206mr1034905eaf.16.1789522395927; Tue, 15 Sep 2026
 18:33:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260914013033.3938-1-ki.chiang65@gmail.com> <20260914130907.749cd8e7.michal.pecio@gmail.com>
In-Reply-To: <20260914130907.749cd8e7.michal.pecio@gmail.com>
From: Kuangyi Chiang <ki.chiang65@gmail.com>
Date: Wed, 16 Sep 2026 09:33:05 +0800
X-Gm-Features: AcwNN1VLAxgU8jUn2SKIvvg4jEKPXKphx-A7W_IX-q6bjSUvDc3ySm2Ohv-nfKk
Message-ID: <CAHN5xi0NSJO=V0=eVd4_MGp2Lg5NrwB3D+hsF87ehTSmaeeSbQ@mail.gmail.com>
Subject: Re: [PATCH] xhci: Fix HIK camera control timeout on Etron hosts
To: Michal Pecio <michal.pecio@gmail.com>
Cc: mathias.nyman@intel.com, gregkh@linuxfoundation.org, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Thanks for the review.

Michal Pecio <michal.pecio@gmail.com> =E6=96=BC 2026=E5=B9=B49=E6=9C=8814=
=E6=97=A5=E9=80=B1=E4=B8=80 =E4=B8=8B=E5=8D=887:09=E5=AF=AB=E9=81=93=EF=BC=
=9A
>
> On Mon, 14 Sep 2026 09:30:33 +0800, Kuangyi Chiang wrote:
> > Control transfers to the HIK 1080P Camera (2bdf:0280) can time out when
> > the device is connected through an Etron xHCI host:
> >
> > [   48.363671] uvcvideo: Found UVC 1.00 device HIK 1080P Camera (2bdf:0=
280)
> > [   53.465662] uvcvideo: Failed to set UVC probe control : -110 (exp. 2=
6).
> > [   58.585653] uvcvideo: Failed to query (129) UVC probe control : -110=
 (exp. 26).
> > [   58.592967] uvcvideo: Failed to initialize the device (-5).
> >
> > Testing shows that at least 125 us between control transfers is require=
d
> > to avoid the timeout. Limit the workaround to the affected Etron host a=
nd
> > USB device combination to avoid changing control-transfer timing for ot=
her
> > devices.
>
> Any idea why it happens or why the delay helps?

We don't know the root cause yet, but we did some more testing.

We tested delays of 50us, 125us, and 200us. The issue was still
reproducible with 50us, while 125us and 200us passed our test.

Our pass criterion is 30 successful plug/unplug cycles on each port.
So 125us is the minimum delay we tested that consistently works.

We also tried USB_QUIRK_DELAY_CTRL_MSG, but its 200ms delay is too
long and causes UVC initialization to fail.

> How many other HCs did you test this camera with?

The camera works with the EHCI host we tested without any delay.
We can also reproduce a similar issue with an ASMedia ASM1142 xHCI
host (1b21:1242). This patch, however, is limited to the Etron/HIK
combination.

> Does it help to reconnect and try again?

No. The issue is still reproducible after reconnecting the camera.

>
> FWIW, I tried a few USB 2.0 cameras with my Etron and they mostly work,
> except one. It passes probe just fine, but fails on streaming attempt.
> Adding 125us delay doesn't help, but 1000 works sometimes and 4000 even
> more often.
>
> Probably a HW bug. Honestly, I never use Etron for anything serious.
>
> > Perform the delay before taking xhci->lock so the existing state
> > validation and TD queueing remain in the same critical section. Use
> > udelay() because urb_enqueue() may be called from atomic context and
> > cannot use a sleeping delay.
>
> Actually, you would need to do that under lock if you want to ensure
> that multiple callers can't submit URBs closely together. But that's
> dodgy and we don't even know what exactly triggers it or whether this
> solution really is the best one.

Agreed. For the UVC control transfers involved here, the next transfer
is submitted only after the previous one completes, so they are
serialized.

The delay before xhci->lock does not prevent other callers from
submitting control URBs close together. However, this workaround is
limited to control transfers for the affected Etron/HIK combination.

Regards,
Kuangyi

>
> Regards,
> Michal
