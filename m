Received: from mail-ej2-f43.google.com (mail-ej2-f43.google.com [74.125.228.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83C1F4F68A7
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 21:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790631186; cv=pass; b=nL7R+vx58HdkVykC4Vbd351TXO2wa+zSdBG1dPuv1rNIq7HQVi3T7+bNhWuZgrs5jYP8yl6AtE2+/0AvZ4c3su7ZDLCRarseRxEsCslG2lk1LV31i4utv73PYKxyd6oxAJxj+B6rExWeeyCRSUBVkm95hVlosJFQ3wXZ2VmN0+c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790631186; c=relaxed/simple;
	bh=EA27YKz9impM5lVK/eI8Pn+cGv629ZkPNM+KYO0C0Tg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tv2CpNsb42O7IpNBqEFOrmiuXJVSTm+WnRWR4ZY+oKyh7Fk0esxm8vciRjJwNkdl2mJDTNFPTPyo7+q9LwQCkD5mx9BiRgf1h+69Z8NWjSldHO7UVJKc/0B8tQAry7nMchIiJ8j5MUroTd9su9EU5++Wj/xB7pFpTEhT+CDiLAU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z/qoVaES; arc=pass smtp.client-ip=74.125.228.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z/qoVaES"
Received: by mail-ej2-f43.google.com with SMTP id a640c23a62f3a-c2a4fbc5586so546693066b.2
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 14:33:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790631181; cv=none;
        d=google.com; s=arc-20260327;
        b=U/dUfB8HFwegbqOxZZsMaWxwbdjep5v3EK6qFUXbQv2pIJlejFqd2pDHpWI6zdOj1U
         zFbwUx8UmGkix21Y7GUDWhiMZ5escTOWhwqpETWiwW9LUnWYJqzyN7PBmAmTlmy5Qfap
         q42DtO+FsQV7nN3gYvV2oaIBpR5DwSbHnz4GiqDQHMzR+OZfXC4CG/mbtYIS/WRjYMR2
         LTLoq+ar/tsNOyCT0dotfl8b7mlPfak1QoPfCqGajxjpn//Alkg4wKVeHboP4AKSZ9mo
         ExK+o7pP7viVrZckaxj3RhBNDtjkWnIxPOHexRb/bk9xrF2PVeHfPMYdryprXevNwIC7
         SiUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pgy0F69XgkRODojgxpYtLEioAZBN7GxAhb6l/0w25jw=;
        fh=2cctWrMsXufC6iXdZY8igqIMBWYHh3EBPzReHVGPntY=;
        b=DV4D4HyphgnllaatcTfUv1y0fEk3ULEwRMdIgFvqmyqYd5PGeByjYZFlFrQ48gT6rb
         RrbyVeHnet1K7AK/iUNLoJ6CPd204g2ch/PIi8pJFSJ6HfTuAPRpjtq5oxFPxwqyUhij
         cRt6jxuO4gNP8FpmAcfIw4zd5bc8J16wVNa/YH+Lx0ncB3ZWs4VxEyM7IBLFShjxmgfI
         xgqytVg6zal8yFKz8ibE/l3D1jo9iBH1HnuHU0JjIJ7702CnStav8VbGuHChP/SFkWP6
         iIEfyke11xvsYjSwT/aX0HcbgeIWHf52zj//YhrG9YUYeWmNKaxMJ5WaTILmkx9WY4Pm
         SX9Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790631181; x=1791235981; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pgy0F69XgkRODojgxpYtLEioAZBN7GxAhb6l/0w25jw=;
        b=Z/qoVaESgQAUcg99LiBp4xtvNuS2mCiAwcVnWvKaHFqtekjNZ0dy3AEMqMxqbunmd1
         r5IfeVSXZF2WVFntnlifD4fRUeUu3RONK1QXXyFQT/LnPjzUFvNFjnLi1YvCGlae8wKk
         LNpbr4RzPTOnzcCBvrNSHSBcHMMzU1Jg2SaNtlv/n85Lu1yWoTb7Zvsxvyx+HfyVqRLw
         iMEry0mp4Lp5W/niNb/0i5nF05yqV2PTaapdFRJIDQLPeBFQXlBkoEdn1bT+FKUzW85o
         +2BGgRLSB8cykzavEO5tjEQbyfZS3/LOgd68GH4pVE9qlR+PfWyeSDPPdf6Y+2Q1rZeK
         NNZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790631181; x=1791235981;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pgy0F69XgkRODojgxpYtLEioAZBN7GxAhb6l/0w25jw=;
        b=aNto7lWAxCWUl5VBv2aYjkoJeHRBHFK7c9CD1CccYS+tJa3i4PaILvI3lcOptX7wSo
         pVGRevOyqpfildqAhuFa9vCGyUHFcgEnagQCZIQy/gue6WECvg5vHw+7GbwV6sA8y3UJ
         N+8mUxn79nUOPv/MgiiFAis0uBo536mPlkQUkeWXn9Xjf7x5HaCpqlifDpoY/xri6t69
         3Qm/YSFl1eSzAPsjZY07P+zUuQE0muM28RErZRD05dQ7cV3X/r/cCtlpZC6v6JJezJ8t
         epbzNV/sYbgAdu/7moDz2QL42+KCrxUl6kOCIO53mSzSMbuLEd7a9c7Xh4hvXp12z+i4
         BusA==
X-Forwarded-Encrypted: i=1; AKwUvBy/zKU+tDkIhiFh457z09GtXLLPNMmvhlm80WuyQ1xJ+8LQJIB4VLVV6W94QAYwF6v9Ut7pAWBsVphOGJ0=@vger.kernel.org
X-Gm-Message-State: AFuF++lvDgs1QrMfp5Hk7IB8SKYAFLhMyaP43n510A2sMUO73KeZxg5i
	XHnzF3NmIAqFXyl8MbMZMekZo3Xsz1NtmONG9KgU+nIBw4smRREHzXUQe62gyeAsTQ9dikV8/dY
	kYRrzvdrjK7hBh0n7TQgvudHdmfif4vs=
X-Gm-Gg: AYBFou16h44N7j/EMEYxkh5luIiFpCVtRhC/rPNVS+jXcplCP0AORIG2IlcOfGiVvQE
	RsrqtYH0G20DRoRoyxmCVOlHWYKceOg06gTqnV4NJ6Gq30dRYobgpbKRLhZp4E6MFJePOOBf8Aw
	VryVNBH1P5/rkd2AYpNR+UHPVVg9mpQaW8GjZMYdJpZ06El1iTAlh8GdTR+pW63GrwZfIknaqzI
	vN4JA1azBWQK/RDKnCMc/krJ6AUzLcxbbr7fmKN8F+l1nNLnUXs3X6aiNR38ZXQ5yQGTud6AGj0
	uujowun/JEz1x6iqf74J2FBhOHgise8iRzDfhyt0T+IhZOjh/jVyq9juc6xyGayxtawyZT1D1/N
	NqFTYbvZMVWbgE2ODKSyc7XoGToftYq/NAs/q4/i8j1GG93r4hp+Uvl2fG/oPPMYHUyFym0gjJG
	Ggmdv9Q4V0fzauBY9YF+om8XFyX0XiuDn5ys8I2O2t
X-Received: by 2002:a17:906:6a04:b0:c2d:d89d:346a with SMTP id
 a640c23a62f3a-c2dd89d497amr349572966b.3.1790631181365; Mon, 28 Sep 2026
 14:33:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260928200318.63383-1-meatuni001@gmail.com> <20260928200318.63383-3-meatuni001@gmail.com>
In-Reply-To: <20260928200318.63383-3-meatuni001@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 29 Sep 2026 00:32:24 +0300
X-Gm-Features: AclHuK9jufUluVP0aI50nLvoQUmzoRhFid92QksQpAfKio6g-wKWdy9HiOsdwUA
Message-ID: <CAHp75VeLOAs_hZUk5aX8O0Cktj9oc0MP0QEd-eJPmA8s_6NSCA@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] platform/x86: hp-bioscfg: fix non-ASCII truncation
 in hp_get_string_from_buffer()
To: Muhammad Bilal <meatuni001@gmail.com>
Cc: Jorge Lopez <jorge.lopez2@hp.com>, Hans de Goede <hdegoede@redhat.com>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 28, 2026 at 11:03=E2=80=AFPM Muhammad Bilal <meatuni001@gmail.c=
om> wrote:
>
> utf16s_to_utf8s() writes into dst, but the manual loop that follows
> re-walks src from the start and overwrites dst with truncating casts
> (dst[i] =3D *src), discarding the UTF-8 output. Any code point above
> U+007F produces garbage.
>
> Replace both with a two-stage conversion: utf16s_to_utf8s() into a
> scratch buffer, then string_escape_mem(ESCAPE_SPACE | ESCAPE_SPECIAL,
> "\\\r\n\t") into dst. Passing the four characters to @only avoids
> escaping quotes, leaving them for the existing strreplace() call.
>
> Tested on HP EliteBook 840 G2 (Fedora 44, Linux 7.2.7).
>
> Suggested-by: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>

> Suggested-by: Andy Shevchenko <andy.shevchenko@gmail.com>

Wrong tag. I have not suggested the (main) idea behind this change.
You're not supposed to arbitrarily add some tags without respective
consent.

> Fixes: a34fc329b189 ("platform/x86: hp-bioscfg: bioscfg")
> Cc: stable@vger.kernel.org
> Signed-off-by: Muhammad Bilal <meatuni001@gmail.com>

...

>  #include <linux/string.h>
> +#include <linux/string_helpers.h>

You can replace string.h with string_helpers.h as the latter implies the fo=
rmer.

...

>         u16 *src =3D (u16 *)*buffer;
>         u16 src_size;
>
> +       char utf8_buf[MAX_BUFF_SIZE];

Try to preserve reversed xmas tree order.

>         u16 orig_size;
> -       u16 size;
> -       int i;
> -       int conv_dst_size;
> +       int utf8_len;
> +       int escaped_len;

--=20
With Best Regards,
Andy Shevchenko
