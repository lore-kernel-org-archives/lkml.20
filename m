Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793655151;
	b=u/r6taASbtokSXsvL4KjS5s87UXtqxLiv26c2+XMNqXaEIg6AZ+JCmbizxhzYnCeRG3d
	 /J1lLs244jUE7nrnoMAIzWhQ7raXl2LW7E8n3tUnYVqQrGbl8NPz15uzb+G1bUwB0ibit
	 xRO+/g0EXyHwPaNhmwO/sthZf5uAiBOVe3DYnrFjQRKJMfCjoCWdxBINAWNr61fHmfgsi
	 dawS3ASGHNbDu3og5slNcA4wz929FtNdkA6HRn7QHF09xzdszo4zxWTOa1EHg62ZbvYbv
	 u4AIoxQ48UYLtCI2W1/1qL+5ZysQKCuIc5+1ZXysoWXxvRu/JUiXwFp6O7tvmC816og==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793655151;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Dy/3+y6cTy46fWlcbVMD558vn7aro/Q74xHtkgWN7Dg=;
	b=QSKG6WLqOqqI90w3rR5ImnR5FVyOpjjr9NoEdwVVPeds+KnI4BjD93q8tZMC/PoB2IIw
	 8saiyo8CkUcN5WG4MwiOKyf65qxQ9vzrb0RdoaS7kqyxoY2NX22lQei+77uNM9GHUKUiZ
	 w0500GPXce3TZiSIn/QejAfwR8TPM3eCbl9h7kGtqAvwbrvLIuQZ3bIXAmb42Qn7WbD/m
	 +hPIb9SvQCCZHh7fY5cU3OzEr8HLnwSbmaTspvVjBOq91WRTeYJ7ksKMiFm1l4HiHOvTV
	 IdGRKyhB+b84oqcqaUB4pFvKz3cuDpYTSt4PSZob+vSO1DzYrvPuzKicAWdweaFu4YA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OJBl9LUk;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.41
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F533606A324
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 21:32:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9F533606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OJBl9LUk
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-91befbcad6dso61939856d6.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 13:32:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793655149; cv=none;
        d=google.com; s=arc-20260327;
        b=ZATC4Y9LLt1mOW7lkk5UZ3XFl6eQfSM68OXt8Ekjmf1P1RVQDHZWE7e9j+S+A0EYcv
         Y6mNY5SAEm5FjtNkhaKJ2NRbV49Htd7HC9hAu2wlJLxthP5ugrFLKpVzssalyZK2uMwL
         f+ElgAPUH4k6lH2f+f0SJPnS9ClKHG+vYtQlfW/ht7CLXwSPoD1o6AgmIqg88dVJn+Wl
         VcQ4rJGd1OTYb7DawmC73foXHAiIT5BIdFoER06eIXNcJ39GCAPlI5V95eVuQUuGXhL1
         u+D1cN/i1LdOj8pq56I3HrUBMrhpMb0UtNyVueyWQ5oZTKtdPwOH1QHx0ZvduYGxnJJv
         fzyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Dy/3+y6cTy46fWlcbVMD558vn7aro/Q74xHtkgWN7Dg=;
        fh=+Doi2RetV8d8Bv96avoiTvNoMmFJh4Kl093Hs1wEMsY=;
        b=s/A/OnEhCMOimD3iHUp1BxL0x2t2EqBi0YmOkQyHvPHKWtYINRDI34ooqzM7zXZLRZ
         KpYzwNYwWD2tyKbuKiBkV+Oiu6wWrWkvGo+qN2n6tKEDbwDmfeTziFWfbeoau/uHEysJ
         NEALFsdCP17LonJJqH7pbsk/CtyV9bQtmcCdJdwEiEHSV1FhIsjgmT3ZzXBwUgURR3s9
         2X1Dzophx9VoXODUqpP0SyAkpQYTdjJfaZaSYARcj46KUN3NTyDPvPncK8y7vqqplsDp
         ddRgtWYx4bspg3VtWp1cCzECBNW5iIo3sBxq8mWRxhKYUfPTdlTMZsT7B0CV6D9jkuQg
         5HxQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793655149; x=1794259949; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Dy/3+y6cTy46fWlcbVMD558vn7aro/Q74xHtkgWN7Dg=;
        b=OJBl9LUki163v7WEot8KNBkz+ZyHxB3U3PZWOzUQnqU1C9gwNWqMqo4ep2zJTiF76E
         H27U0U2Y2xU1edkWPvCXKNlTdh7FHNvP6iPCbdbi4N485mFhvwTigF1MWvhKjB3dtraS
         rVPVpUnl8PFkyNlD5j8BF8pdDkAdWyttJ0cI7ax1saMKaIKfFduWLBkxscuo7Xjswgmk
         KWgTFFt3DNYb1YENzHWh81+7DLhh4cD15nS0R0RZswSSg1fEUniAiObyXCdPXUw4E70b
         LdyxMtqanpWwzAvoE/TOYetmETdsu/uLnQujF+lPJWE/HBU7sdTJaZxo3v+UlCUj6GfD
         Y9kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793655149; x=1794259949;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Dy/3+y6cTy46fWlcbVMD558vn7aro/Q74xHtkgWN7Dg=;
        b=LfAozacrHjixfXt4BLX1iz/YgJoML4b2kFcOZcZ6YuggUuvSunREdTuAB26IBTbjav
         NIL/1FligYIwlKE6o18KhFj3nHD5szdI2jixUel7o4WTChqhpY7NF3mXCzRrF7iOcpEd
         I7ryCQePw17k6Z5zAdcXOSSUCu+A7udWvR8wh+Ps2hM+USosrpFOxCd+mnvN/7S7Ykoi
         pGkdRGAqLYhFmz3Bje2WBTvI6nO7Ivy3znGa1Id6kldcxD53/xMbNpkGM6udc/OYx3FK
         +giLBj6Y1rBEubRAS8AvSYZM2r3RK2+/c8pEQ+2qyTLytIoKnfYuIfky0oyDG8FmeNMH
         Cq0A==
X-Forwarded-Encrypted: i=1; AKwUvBwt4t7ZdAoR/IM98Gkj7uEwaBEn7/P0Rh8Ba70kIMp8GSnvAyXS+LdgGryov2TuN89SfTosZ709ZqgmTYc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8XLy3pbdzI6n1yd/KOO8ySmgPmBWwOXryZFmQj1fgfh/FVH/Ys
	RPqXSzGMUNyOj3d6nlhgarvtsqJ15BWqoTPtP2Qis88Jxg3rwwhNBRULxL8YWyv3ZvbrpZPrnki
	OEpYtSe+pnSf1B3p5hmoKSXOM//jxKXI=
X-Gm-Gg: AYBFou3Wm/7mb9p9BzTciygu4c82uyBBshVm64ZHRUsz350E1HLBs+pFNP1opaUn9RT
	zjkrpiz/1eTdwLgKFtZdKQiklcq3HNk5/AjU/WdAK5Zfj6FszxJhz74OYThiwOeekM55ZPXmMyw
	xsP3WwnYHbsJK19Paypvops3I6NzTSpa8bKeNOxNi4uLaOlBC7xuasQ1Fk1jTGy3CNAgumqx3Rg
	JWp5SZ9d7oV3VsEhQ3oGoBvrlSvsA5ZbHax4C/luGxc4Y4fnqzi8wMoo09OwSBVxs5VU/oHlzob
	Oi8aJWlp15rgQOfjPd6vt5N7FbsUDcNT4f/6MMkj5odJ5cgx4j2Tw87RhI3QvrbS0nYdgxeLeUa
	/2l4uxfLK0FWj+JYt5wyALoCEC7ynE4i6Nw8LQ8r/UQiOY+4fpaWNdq/u1A==
X-Received: by 2002:a05:6214:2403:b0:91c:a2b0:dd0d with SMTP id
 6a1803df08f44-91ca4ae1111mr177407566d6.17.1793655149330; Mon, 02 Nov 2026
 13:32:29 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260927041138.4112920-1-jinmo44.yang@gmail.com> <20261024033040.316652-1-jinmo44.yang@gmail.com>
In-Reply-To: <20261024033040.316652-1-jinmo44.yang@gmail.com>
From: Jason Gerecke <killertofu@gmail.com>
Date: Mon, 2 Nov 2026 13:32:17 -0800
X-Gm-Features: AclHuK_Ep6UP7A60iM8FcMVyZcPHYDAlQGKDcoV_PVYPLMetFNaYY3L4D27BGc0
Message-ID: <CANRwn3TaYNa-i-c-1AOdPb4HVS8otBhFUkFbMFPnwzeKKwHcBg@mail.gmail.com>
Subject: Re: [PATCH v4 0/6] HID: wacom: guard against NULL input devices on
 successful probe
To: Jinmo Yang <jinmo44.yang@gmail.com>
Cc: ping.cheng@wacom.com, jason.gerecke@wacom.com, jikos@kernel.org, 
	bentiss@kernel.org, dmitry.torokhov@gmail.com, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 23, 2026 at 8:31=E2=80=AFPM Jinmo Yang <jinmo44.yang@gmail.com>=
 wrote:
>
> When wacom_setup_{pen,touch,pad}_input_capabilities() returns -ENODEV,
> the corresponding input pointer is set to NULL but probe still succeeds.
> Subsequent irq handlers dereference those pointers unconditionally,
> causing NULL-pointer dereferences reachable from a spoofed HID device.
>
> This series adds per-function NULL guards across all affected handlers.
>
> Changes in v4:
>   - wacom_intuos_pad() now returns 2 for the normal path, 1 for the
>     NULL-guard path; wacom_intuos_irq() applies "result - 1" uniformly,
>     suppressing the spurious input_sync() the old "return 1" would
>     trigger (Jason).
>   - Added pen_input NULL guard at the top of wacom_intuos_irq() to
>     protect its helpers wacom_intuos_inout() and
>     wacom_intuos_general() (Jason).
>   - Added pen_input NULL guard to wacom_bpt_pen() (Jason).
>
> Changes in v3:
>   - Fixed wacom_dtus_irq(): DTUSX is pen-only, so do not require
>     pad_input for it (sashiko-bot).
>   - Added patch 6: touch_input guards for wacom_intuos_pro2_bt_touch(),
>     wacom_24hdt_irq(), and wacom_bamboo_pad_touch_event().
>
> Changes in v2:
>   - Restructured per Jason's review: per-function checks for dtus_irq,
>     graphire_irq, and the Bamboo handlers.
>   - wacom_intuos_pad() returns non-zero when pad_input is NULL so the
>     report does not fall through to wacom_intuos_inout() (sashiko-bot).
>   - wacom_intuos_bt_irq() guards both pen_input and pad_input (Jason).
>   - Added dev_warn_once at every guard (Jason).
>   - Dropped the cp2112 patch (Benjamin prefers Dmitry's series).
>
> Jinmo Yang (6):
>   HID: wacom: check the input device in the shared report helpers
>   HID: wacom: check the input devices in the legacy irq handlers
>   HID: wacom: add NULL input guards to wacom_intuos_irq() and its
>     helpers
>   HID: wacom: add NULL input guards to wacom_intuos_bt_irq()
>   HID: wacom: add NULL input guards to Bamboo handlers
>   HID: wacom: add NULL touch_input guards to remaining touch handlers
>
>  drivers/hid/wacom_wac.c | 127 ++++++++++++++++++++++++++++++++++++++--
>  1 file changed, 122 insertions(+), 5 deletions(-)
>
> --
> 2.53.0
>
>

Apologies for the delay in reviewing and responding. I'm happy with
the series in its current state.

For the set:
Reviewed-by: Jason Gerecke <jason.gerecke@wacom.com>

Jason (she/they)
---
Now instead of four in the eights place /
you=E2=80=99ve got three, =E2=80=98Cause you added one  /
(That is to say, eight) to the two,     /
But you can=E2=80=99t take seven from three,    /
So you look at the sixty-fours....
