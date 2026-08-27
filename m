Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A64F415F3A
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 17:20:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787851230; cv=pass; b=lX8s1SzT8ndq/7OOs8iRK9U1JK/Tk/tGmHHWgEY+Rkz4GQERkLLRDE5RiiuGVEJSTT9+pxlX2LIq035UJ7iEaby3NSOyZuoiSPJ0CtpTNhZL7Q9NtYz21xITRicvGhEaPVhffWMJdEuEMc8qQBDfEpODtR6S88Bt8skELVsdQ0w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787851230; c=relaxed/simple;
	bh=68nBQNUxR5fNISsNqp21UpLPEGDIlMeweWukrd9kiKQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QWOjKCQ0pWoFkAOhdcDmADbwf0lwe+X6CM9dOZdm2jR3JNRlZO9N50P3AR5qX47xVv8Gr/IwsvZcdJyM5FpwqAawri8E3lA7yU4VTHzgZORVmCU9YnC3yL69/9zj0a/uT5Qg0BbE9vqRYYcr/nPA/PS5uBmZn1Dq0NOcnPvxMUk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gf1i73yD; arc=pass smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gf1i73yD"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5b15dcaca31so40241e87.0
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 10:20:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787851227; cv=none;
        d=google.com; s=arc-20260327;
        b=R3Nwq9Nh3s2zf1pYEX0ieuUBtEYYuS2vXMk93jB80K82/axDWMKFu0uk4F0K7KITzW
         1dIptnp18HkbnbImWd3X2TYnG8E3qCVdehXTUSIogyIqzbWVV+cGYbyEgqb3eZFLskR6
         F9FhnzaJNLDeesbFQBOe+kFOi+G7rKiSMkuTbHqxg3HmZ/jrmfahXiJ/5Nuq6hkI7VC1
         7oCDUByPB5lcKZjwD2iOkSt++oa3DEGGwXVLzEioorkKgmPPfPBC/SnebLx7vcVbDUpg
         CnzkWxApIWT806uyh6E+lD//qBrm1iXUSYpaiwNmoFxrWGQnZecrRav5fpXNz8qwbRyn
         Ba9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4Q2WP3xYXvtNm+8JHX/keBD8T0fHDerrdRWjZNJYCX0=;
        fh=lX7Bh3k7llCOtBdyk4+1P/sNAaMmi/MUMh34ib/15Go=;
        b=qBNlqUIUIa7GPG4EBQ4UQxQaHgWc0wdlFdQvMWQkq+T1teFtD7JSIt1QL3A9lqr262
         a3Yxztz67BTi2wNyZIhGxA3VyzI7b4nyMFVv0JckOl/7GYou8Uadkhso2zD36hDBwCTH
         QxhnhJ9QGcvFctaq5tjKpFDgSKrx1Wfk2se9ApVcXZZqOgg9MDg3YNd0tEZfuZhQwvlb
         ISSQPUXCvEvPVW8ZR5/ibT4ALT/2ooKOZPgEa/w4P831vsawz+LYQMkmna0ojXxMcP+l
         phIpIdw1seb8w4IJn5xKed9nYFrh6Zi9FgI6y6rbJ2SUNGHSmdTwrs7A0VSIvlWq1nqZ
         Pg8Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787851227; x=1788456027; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4Q2WP3xYXvtNm+8JHX/keBD8T0fHDerrdRWjZNJYCX0=;
        b=Gf1i73yD4bZl8y6gW+FTqtsBjziKGyxvTtXeigvBXTCAhZ85EiHf9Osdss99W4gfmi
         UM/8N7ck4STKb39Jt6CK6i+cfFBpexCnQr/zJFr+KWhGTQCKrMgLctSHSfJSd0MHHK9j
         hf7vvdLh/DduGW2/XyjoJKna/9NHXiabSTdjgbQRE1P9cjx7Fkf438YjVyS5DNUd5PiZ
         HLeRk+NTRNXjEePJuhyPAPHBPq5po9x8idBawu19z4yvsf1jxCFB92BFy9+EEDVBQyd6
         zN20MQAhWe2+zSggHN5GDvzXNt26SiQWX8dsTB0HjFc45IiKFeofbZuFIJtpgDWNSwxV
         1Jkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787851227; x=1788456027;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4Q2WP3xYXvtNm+8JHX/keBD8T0fHDerrdRWjZNJYCX0=;
        b=DZdnUlf9Lz7/hDjcKxo5TFnAyXDr75V7WlhnjNTDcJo75HC3+g6rH8tOeS9IFrqqlA
         Z1l5yhqkbk/akqMDTBhXBaYB6TPHjEzrTqxwpjaSqdV3x55EAewk4sKNW/Yo8QPVH9P8
         CX7dof1FyJyj7/3z8TneeRym7HS3qppJhMnJXre6cILhpqlOxNCpC7njBwkF053QtrG2
         sC5fRR4OuezYZrdWnrAAprQznPnfZmPmSLZ0xbdEO9kSaYgx4rLTjhRscjZBb6vOUzUI
         AEuAyWUBp7zzRoU01t6kH0H5+IGrFrSlp9dIhB0FliRfun5Fp++SWrNt9VGsQdI6gk97
         +y0A==
X-Forwarded-Encrypted: i=1; AHgh+Rp5JwM3eEUxf/2prRhiD72yYnMK1nMb+1nql2R3rRchse+R3zmHs//Hbi6exLyR98Wwhw0uRHHdzKRrSdQ=@vger.kernel.org
X-Gm-Message-State: AFuF++kUz9WrsGRCckwZZP+QWgs3FCwJDiKdi25IlETyrWXKSyqwaBgj
	uL/AcmzXcdxXHKzU15K30UBWnv3m9Z26OqhVOlE5brd/rQIBWMpbU+9O+nIazWckj9V7IoJHIRk
	XSZEIol21k7DpwzgeVoslFqRgpojp0S0=
X-Gm-Gg: AR+sD10y3baEwqangEEuNkTry5f621+YlU/Nbcm0Z+JF9YbiulASKObCNyPMr04JMjX
	wBI6oh6BZW+EIhlQknlgvt6chW3D76uDWmqWNRWCOpqSWy/Q2GzuvuTqrm6ZxLTPa4AO43ojzcO
	34PWNjo2EE13FeiadcSmbfgBBRR/JLuC3HYk2ZugHyMTrIuojpRSnKhmcmEXFZu3N/2tmkmlVrE
	gBgC2W53Hiq4beOQNSVyQFZkjhOoV1Nd2p4fi7LNOktW1ItSBOMestx3iVT7gM8KoCasa6gMRHx
	ezhNdXywVjjCJqZ3SyHYza05JJcPD5siLCSEBtbjUtiliFbV8Q5N0RQX0XHm1k/MiUMpk0bmzFG
	d2akHVKC6ettQBWSVDUqP5Q5jzqm00noR
X-Received: by 2002:a05:6512:220c:b0:5b4:3ddd:8996 with SMTP id
 2adb3069b0e04-5b5e68de595mr55082e87.15.1787851227372; Thu, 27 Aug 2026
 10:20:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260825130126.2078627-1-chao@kernel.org> <20260825130126.2078627-10-chao@kernel.org>
 <CACOAw_w+QMkTNK=McScLHh1gpm6UFjxLSnVxhFMsgsuArLA=qQ@mail.gmail.com> <8e02060f-6921-4d3c-abb2-cc36fe1e9594@kernel.org>
In-Reply-To: <8e02060f-6921-4d3c-abb2-cc36fe1e9594@kernel.org>
From: Daeho Jeong <daeho43@gmail.com>
Date: Thu, 27 Aug 2026 10:20:14 -0700
X-Gm-Features: AcwNN1U7PNNLW0IUB1V-PjZHUSzb3AnJaCjYPBfr_1O0hFm2d1nERUvn4m841Rk
Message-ID: <CACOAw_ySh3pW5tg7pa6r7Rr7tuqp9btPWvN-rrWN7mOpKcw3kQ@mail.gmail.com>
Subject: Re: [f2fs-dev] [PATCH v3 09/12] f2fs: cache: use compress cache
To: Chao Yu <chao@kernel.org>
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org, 
	linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 26, 2026 at 8:24=E2=80=AFPM Chao Yu <chao@kernel.org> wrote:
>
> On 8/27/26 04:04, Daeho Jeong wrote:
> >> -static void f2fs_truncate_cache(struct f2fs_cached_block *entry,
> >> +void f2fs_truncate_cache(struct f2fs_cached_block *entry,
> >>                                         bool drop_dirty)
> >
> > -> __f2fs_truncate_cache() without locking?
> Or, I guess you mean we need a cleanup here?
>
> What about:
>
> void f2fs_truncate_cache(struct f2fs_cached_block *entry, bool drop_dirty=
)
> {
>         if (!entry->cache)
>                 return;
>         f2fs_do_truncate_cache(entry, drop_dirty);
> }
>
> static void f2fs_truncate_cache_locked(struct f2fs_cached_block *entry, b=
ool drop_dirty)
> {
>         f2fs_lock_cache(entry);
>         f2fs_truncate_cache(entry, drop_dirty);
>         f2fs_unlock_cache(entry);
> }
>
> f2fs_truncate_cache() was exported for using in other .c file, in the mea=
ntime,
> static f2fs_truncate_cache_locked() can be used inside cache.c.

Splitting them into two helpers (one with locking, one without) makes
total sense.

However, in the Linux kernel convention, having `_locked` or `__`
usually indicates that the caller is expected to ALREADY hold the lock
(e.g. `__list_add()`, `__folio_mark_dirty()`).

If an exported function is named `f2fs_truncate_cache()` without `__`,
callers would naturally assume it handles locking internally.

So I'd suggest following the standard kernel pattern:

/* Caller must hold f2fs_lock_cache(entry) */
void __f2fs_truncate_cache(struct f2fs_cached_block *entry, bool drop_dirty=
)
{
if (!entry->cache)
return;
f2fs_do_truncate_cache(entry, drop_dirty);
}

/* Safe wrapper that acquires entry lock internally */
void f2fs_truncate_cache(struct f2fs_cached_block *entry, bool drop_dirty)
{
f2fs_lock_cache(entry);
__f2fs_truncate_cache(entry, drop_dirty);
f2fs_unlock_cache(entry);
}

Then compress.c (which already holds the lock to check entry->ino) can
call `__f2fs_truncate_cache()`, while other callers can safely use
`f2fs_truncate_cache()`.

What do you think?

Thanks,

>
> Thanks,
