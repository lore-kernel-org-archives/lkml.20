Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91F244D0CE2
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 14:09:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791986968; cv=pass; b=rlNKsKiiicX/9fdmprsebCZD+7nKJvcUbVF1tm27ipXZxe0ib1B0NJwhYQsC7Hw/fuxgk35da6q9ewPkSdk7VdqCUZQPfJGd1yBnKw3ilDWF8jizpB6AIYPwpcc9uP2RiSLUGbwywRpAlt3ZNcvWJaHfufjL7U4M8AXIHBThrww=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791986968; c=relaxed/simple;
	bh=sd73B+0fv4kFWg1/BIpMIx0XVt6pOSOqH8NxgJdLnhs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nAlUKz0dfjBaVWaTxcFnovZH65re4uiuDTXFlzdTIuMx6cWqWHcyYFMScjO3Usj7ZjgtIy3SbgKxxge36kNtUemhBdfQWsHiahdEDflBIQAfmVmjWg9bTVEt29M8mzDkA1ZUH69hKDW7qhMGMniu3rl/mlu/itYZ6R7sdHEr+FY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yv9FP3sb; arc=pass smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yv9FP3sb"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c2055573c8cso522944166b.3
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 07:09:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791986965; cv=none;
        d=google.com; s=arc-20260327;
        b=PwIPr0ZREWC4lDJQjTy33BBxfNsQMSYDU8Cyd5vKZmX4lrUb5REe8tD6LSp/0YmPew
         mzV5R5qLLf0sCCKQgtVdi8ZbhACOMr8vElYH9bRSMchHasWSNsPDhEgnVArpJP7SyKbj
         s0dVRUw9prEsb4Gfup7V5L4gNUN7oynxqIZk5Ko+sgrgDGeb11X+DlSQLMfyS00pj/iq
         KY4bEetWxB+Qu+6RXpnVCnrxXE0qgQ1I5MMjKLimCeWyjd0BQsM8ticIwv03FB7S5ihf
         DWjCMhNX2yy79Ta/iZs5qJqEx7DezRhRtoo7tmIzwHc1HVfvZG4Sc6E0ybazwOO2v8ea
         ejaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3FLZn3X7YL11DIAVkQWpw7vFctgltGOcmiwV6tG+5Ks=;
        fh=OXB4Oqm5TKMy/fVDQURnYkPcLcsnEWr4muWSOfUcpDc=;
        b=FgZ0asH162llYrU4REUuHKOaw7anljhTju0P6/OsvcIUTU8ALoUWWP/FSx4uigx6Yi
         bWT4RGsbM9GIqB0eSghz7HTsvPvmpo4vBKTr+edwj+iO68cW4Yf4+xHW5CQslyX/Sqld
         cxyHbvF5leVw6Zm7fTq+7im+bTHtrB6JSiBmR5eanptisOjPMPLAcpMRKeD6PcRZGJ+6
         QQlEZZrDmvMi5LDL8jgwTaw3TrTXVcNqa9+LDsfFqmKa5Sc3H+eSmCASNc04lUMhsPjp
         bjgfE6k0RrUQTl3RaQhwKQzhMpLJy+hn/CQ6swzFaoVc081+aZBLX+VVQJiRJiywrtv4
         8Qlg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791986965; x=1792591765; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3FLZn3X7YL11DIAVkQWpw7vFctgltGOcmiwV6tG+5Ks=;
        b=Yv9FP3sbiIObVAd7cQCkT8vTjPQW2euo9H17lTc683i6p/9tjAZHD3S9ayAId6G0zz
         dQYUlx/P+mPWnqR8kIwELDxA4rrlK+DZSm+KaUQTAMniHDkNZnPCR++KRwh7RTt9+Agi
         I9i7NLKsLJS+UmpnuE9zPi0jx6n/+/T5irpT7bVmblmpFszyxhKin/46rGpydo95BcKq
         IcyN18iUvpnSLYyb+pKCR/J6dInJLThCGAfphxMtfBW1C1+VN+CsTQ2MJ2gii8IBuZTe
         80PVez7adrbGox9g4t7B1FfYLvu9DSMHEeD0fm38bCBymSXz53Xvaub2gtunyZidBGOu
         OVQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791986965; x=1792591765;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3FLZn3X7YL11DIAVkQWpw7vFctgltGOcmiwV6tG+5Ks=;
        b=NTAO3v3m4mYDUBGIIC/vhjMZ1PXwm77tkVu9papcG6TS97sD2BynONXiD66wGMYmrz
         25JDEtnosAFIlO4cl7Toud7DEP2DQ9s018SnjCSoM/KeitRp5jf/OpwzEgji8tBL/fW9
         +LJHi20xmZi1G8bPJWB0JN030INMA5v1V7Y4ZhCOnIqcAWfCHAdK2r/cCIcyT/81gV+r
         DE4g08/Hb1cVh7/P3QcCoMJLooHnVO0UVg+PB3DxPQiq7d+JJInMd8wfHM4BToYwc/Yd
         KwEsKDVHSGxcL8BOnxios5UkHu1SD/t7ZEHNjtw24s8Y73RHUclDmPGw1EYpFCrdII66
         E3iw==
X-Forwarded-Encrypted: i=1; AKwUvBwv2FkhEwSTPJ3y29SkSaUXgWLrVAHOjjmkFC1MqvBdZ6k0cR3+WoQ7s535BUGpsBJhD/aqZuguodU3RXs=@vger.kernel.org
X-Gm-Message-State: AFq9FYJJQzm8FmkFtAeHMxPCwPDhytc2CGTU5sRieb6qY3/wTFTooLJc
	iRNuA0I301fbA22mzZOIP6KIY7aJpIP5FiQmHt2JTvEh/jE6fefb+a6XSJMmTAwk4Mxznb/6aHh
	OUSEWdhjhYbQDY6rr84aTow7zErEthbU=
X-Gm-Gg: AYBFou3zS0N+fje6lw4FOYjrAm8Aq6B45uwox+dgX25eZUyWvNHGOlPHEVLGRe69alV
	b9R/bxff6784buSsvrcnDC29Mz4TTDVo7RWJ9o5ZhjhDFMHv7F3o5Bf0teaVIAfSv4lBYc+olvf
	VZmBIJtnyJZxR1qH02m9dh38q79dJR9B0x/1WdK8AeFi+KXIJY0E57vF93ku2eGGKbGo/kOovFy
	TObCUFMxAK1/SJceswauwQN5ou7LXFyHblVMTAAv4uaBPS2bkeLrc+XnFpuDHtFNRX0wzffZLVS
	wDOOfzCuKnp3pVV3QDP1i0g6qT9j8+x7LSr0x4KLl9eD7A3h4llfXqSvTBveo351OKQv
X-Received: by 2002:a17:906:dc8c:b0:c29:555e:bf2 with SMTP id
 a640c23a62f3a-c31a9fe3cf5mr1382766766b.41.1791986964194; Wed, 14 Oct 2026
 07:09:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CANypQFZzxTAH=4QRRDoqH6VAw1daAq88NDWiQKoM7QTOnP40sg@mail.gmail.com>
 <20260916084723.877552-1-r772577952@gmail.com>
In-Reply-To: <20260916084723.877552-1-r772577952@gmail.com>
From: Jiaming Zhang <r772577952@gmail.com>
Date: Wed, 14 Oct 2026 22:08:45 +0800
X-Gm-Features: AclHuK_KOZRXvkZAlVmDLv2Mmd5CCVB7SGq_bvSi3dxWQZgMQy5Ldx3OdNtwlzo
Message-ID: <CANypQFZCx7iAhsMzb1-WRAMwi1T_sk34LkUX8-bDquWrez3_eQ@mail.gmail.com>
Subject: Re: [PATCH] ext4: clear in-inode xattr space before adding the first xattr
To: linux-ext4@vger.kernel.org, tytso@mit.edu
Cc: adilger.kernel@dilger.ca, jack@suse.cz, libaokun@linux.alibaba.com, 
	linux-kernel@vger.kernel.org, ojaswin@linux.ibm.com, ritesh.list@gmail.com, 
	syzkaller@googlegroups.com, yi.zhang@huawei.com, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Jiaming Zhang <r772577952@gmail.com> =E4=BA=8E2026=E5=B9=B49=E6=9C=8816=E6=
=97=A5=E5=91=A8=E4=B8=89 16:47=E5=86=99=E9=81=93=EF=BC=9A
>
> An inode can hold extended attributes in the space that follows its extra
> fields, whose size is given by i_extra_isize.  When ext4 loads an inode,
> ext4_iget_extra_inode() validates that space only if it starts with the
> xattr magic, and only then sets EXT4_STATE_XATTR.  Without the magic, the
> space is treated as empty and is not checked.
>
> ext4_xattr_ibody_set() passes the space to ext4_xattr_set_entry() whether
> or not EXT4_STATE_XATTR is set.  ext4_xattr_set_entry() walks the entries
> there to find min_offs, the lowest value offset.  That offset decides
> whether the new value fits and where the value is copied:
>
>         free =3D min_offs - ((void *)last - s->base) - sizeof(__u32);
>         ...
>         void *val =3D s->base + min_offs - new_size;
>
> A crafted image can leave non-zero bytes in that space without the magic
> where ext4 looks for it, for example by shrinking i_extra_isize.  Those
> bytes are parsed as entries, and an entry that claims an in-inode value a=
t
> offset 0 sets min_offs to 0.  Because free is a size_t, the subtraction
> then wraps around to a huge value, and the free space check passes althou=
gh
> the value does not fit.  The value is copied new_size bytes before the
> start of the space, over the inode's own fields and, for a large value, t=
he
> memory in front of the inode.
>
> On a kernel without KASAN, the copy corrupts memory: it overwrites the
> inode's own fields and, for a large value, also the memory in front of th=
e
> inode.  The bytes and their length are decided by the setxattr() caller.
> Nothing is freed and reused here, so the use-after-free in the report onl=
y
> reflects where the write happened to land.
>
> Triggering this issue requires mounting a crafted image, which needs
> CAP_SYS_ADMIN or automounting of removable media; after that, any
> setxattr() on the file reaches this path.  The issue was found by fuzzing
> and has not been seen in production; a reproducer is available in the
> linked report.
>
> Clear the space in ext4_xattr_ibody_set() before calling
> ext4_xattr_set_entry() when EXT4_STATE_XATTR is not set, so that the walk
> starts from the empty entry list.
>
> Fixes: ac27a0ec112a ("[PATCH] ext4: initial copy of files from ext3")
> Closes: https://lore.kernel.org/lkml/CANypQFZzxTAH=3D4QRRDoqH6VAw1daAq88N=
DWiQKoM7QTOnP40sg@mail.gmail.com/
> Cc: stable@vger.kernel.org
> Assisted-by: Claude Code:claude-opus-5
> Signed-off-by: Jiaming Zhang <r772577952@gmail.com>
> ---
>  fs/ext4/xattr.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/fs/ext4/xattr.c b/fs/ext4/xattr.c
> index 5c310747b965..2e5f39b710bd 100644
> --- a/fs/ext4/xattr.c
> +++ b/fs/ext4/xattr.c
> @@ -2274,6 +2274,10 @@ int ext4_xattr_ibody_set(handle_t *handle, struct =
inode *inode,
>                 if (IS_ERR(ea_inode))
>                         return PTR_ERR(ea_inode);
>         }
> +
> +       if (!ext4_test_inode_state(inode, EXT4_STATE_XATTR))
> +               memset(s->first, 0, s->end - (void *)s->first);
> +
>         error =3D ext4_xattr_set_entry(i, s, handle, inode, ea_inode,
>                                      false /* is_block */);
>         if (error) {
> --
> 2.43.0
>

Friendly ping, please tell me if any further change is needed.
