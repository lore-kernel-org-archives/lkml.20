Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54E70481234
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 16:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792166567; cv=pass; b=uX/whkQPKVWlBmpfSNZBkYb4FbiEFXNkx5PlFA3ElOxMVLz+a8hgfq2i7gMNPjrMf3eM3qcAZhTgYOtdb77RdvaUizFyByMnQyCP/Tn/eonh3dLdN1K69JROZDG61QF9NSDx/awvDVjYqQNbQ0HkYeRhcKCCGNyn6hgp3N9cNko=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792166567; c=relaxed/simple;
	bh=neSsI5yo2dEO/Bc9LuO7516sGK2fFKHn0eyO26zBIbk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=t9NP34/KtP27sGgsxq8g8sdAUK/uAcO0lzLISLXxHSL3HbVOkny4mdIB+aVNDj7sDy+OQ4v3DdrJ7BJHBnK9WxlJ/NkSvIC+179CP1A179tgtXhbQLjsMZTUKrLrcHyAXqG47Rxg6hJUIhosG6707G0cBsxVCKVOwuFr9LJOHjU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tMVHLZOI; arc=pass smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tMVHLZOI"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-cd60d155070so66089a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 09:02:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792166565; cv=none;
        d=google.com; s=arc-20260327;
        b=jrLnZ7ScdfQ6fUad2TwHkI4+vfpcN5AINZ3koIBMQXAsQULCQsBkDqLdSHgbr4+uLz
         mDMWw+ke0VfJCOarmSjYGilPPigtQ075kax8XmFZcv6twh9naeHbtJ0Qvmdcs6S6wrn5
         bx5Aa1B4GqyfLJQCUi82cgaelSYVmNVgJKzJYY5AULH0bSalq1mOs2Yn4w6tMGGwHIT+
         MXQHiGCrLHp/tdBkp+sTikQT+fSdtndq7o8gC2dCA223qQsbVsAS3sF9sk9/QT9V8WRj
         cUXGYklB1iY4hwetTxEXUgyaP8fTqEca93M7TwQ485n6z6aeStz3Cw1dBWqN9UAVjkLC
         bOIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=p6W0MzkJletU/sr7B+WwRQV/QfxWsVPQAXfOFMTAVd4=;
        fh=K5YzxQA1SyX7BEW3aYzKIcWgMwOo+aV4PiY1lncFS9U=;
        b=oiOvTBE+pUyN7mODxnGYc1Hv2kKynotB78q1kAuUZphAF9PUjwrO2H/ss9Kqs9zEav
         Cc20JkWXib9PZDpFoPSObRg6Vi8uwT1WWnSuJ9kCAuymUJhvKAD1SPrDMn4hQGADUcBG
         JDuy+YOWueox7+1+XNffdeX1LnHlD/bVJ+JG30Qm1+9nXzFsYkd8K6FqT1iwo3H4TpEl
         /9VBu3aX9WzwRwWJXOB5AbLhTdtZbi6/StEJ+MEpTCtNg/5xQo5sxshHbJ6LayAuAica
         woEy0W0c5Jn6TepFckSytsDLduMV3HiJc0b1pQcvEujJ0Dz+kvN5zcEphhBOOLmPONJS
         12XQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792166565; x=1792771365; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=p6W0MzkJletU/sr7B+WwRQV/QfxWsVPQAXfOFMTAVd4=;
        b=tMVHLZOI/aIDkiCmI17SOwYQgoCUDLqpHN0iFJxeZUZy2qVzHM6E1B7ozOOSx///hJ
         jA8VZnT/PfcSkkcpCfN3dqQDd+8/58QgMsV2sytDHbQMbG0mq0CO64AS10r7/bCU2ITK
         3GYZfImNe+7BfrhFEVmP31TaPP7KSuS8ePPX4APk8Sp6bTLshBEQzzDNLl60q3e1Xts5
         3VV3mPqib0owV5bWXQaVORbq8Qs8P6z8rAq8q6rx63Mv6Q+R2A2+/o/PQ8wv8wZqJwX+
         jwN8W3dyLvyEopEEQDKfwCwRAB708ZnRkm588e+pk0IidX0akYfwnHrgNljAjaTUbVsr
         SwOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792166565; x=1792771365;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p6W0MzkJletU/sr7B+WwRQV/QfxWsVPQAXfOFMTAVd4=;
        b=b1TiSBiHMUPhHjCTvJPYV7OnO+s0h2OrkylnkE9cEMiWjdIhb18ALo0O5jQ9OsSnZ8
         Kig54Ak0EJVR/Z7/gH3OsJ9DSrIP5YBipqKPeSDb+a25GQxlpXg+B9V7I/fYWxEJdi9x
         wmybGyoie8BpeZqjOiQXPmqZqzk/UR4EBEO+QwlxJjuyi5gp6dY/6DXWtozKpFxAwQlN
         MZ63aSX88gMIC1zvNbPa5EMAtxYPIeLc99K+SCduTK90hipjjDHez91JqlxKzMgdPgoN
         ezXyVE4zEfJW038Y4w2ze9tKRuVCFTjZZSQjlsb5frZexprRhmyjRYHWwTYMOl/MHeJb
         4tnQ==
X-Forwarded-Encrypted: i=1; AKwUvBxTXHSl6w8OII6EXmye4n2i6aHkl/xTci89lsUY8yuEbcbc5jIRmRwWpTNCCgBCUYPPf/yu2LWgB0nkVIA=@vger.kernel.org
X-Gm-Message-State: AFq9FYLdOjPWEh3x9zgxLwiZ9Y9q9A8vAZIxaULiBKsV8r2f4N1I0oAT
	Z4eMspJoM3KmHWW8TG2n3iaW8WqpSqg7kEFOMUWqatNN3lCQ+HdD5upeMoSziLyvzDLeS4s/VN6
	qVu2l3UvANZ6iN/kwFKuOYjte7QFyL3Cem7YWwY2Png==
X-Gm-Gg: AYBFou2XeoPcLvBLPWLqr7aDD8cYqFmrhAhhWBJH7qFTxnm0PWmZgMFYrACHdJUMO5D
	X2Nn5AclQ5d6bZlHzNW7940Z7EM/Utlsjm9G8mH0d9nhqCaXes9JYQjJ7EeMjZjT4w+9lGDvsf4
	R7mMJpUsXMdprVTcKVgNeuy8LjSfMLesgd6Y2w/ot6aI7177jRib4m1ueLni17t1yMAAzg6yUjq
	YOvP/v27pU7P2Ka9sYdtX6/7ZVTi8gcXCCcnvIDtRMobzamrR6g1IrzBnRIBqJW/h/B1p5eFRDB
	Ci07pcOV5kovgT3MHlRBYFFy1H5RCbzBFmbNTjhkeY5igODa6ATgl2PMRQIg7GAZY0bmNlrouWK
	YIaP67fAenzVIHCuBS/FQq2k2Xuspkq8OGMcExGj22q6RqG7+Ya0lQKk=
X-Received: by 2002:a05:6a21:4ea8:b0:3cc:92d9:80cb with SMTP id
 adf61e73a8af0-3e16bf7b29amr19368926637.12.1792166565245; Fri, 16 Oct 2026
 09:02:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261016021737.4121867-1-chao@kernel.org>
In-Reply-To: <20261016021737.4121867-1-chao@kernel.org>
From: Daeho Jeong <daeho43@gmail.com>
Date: Fri, 16 Oct 2026 09:02:31 -0700
X-Gm-Features: AclHuK-iEUih5Z3WE9v_5gQnnB8d6hXT8gHW-l_9UdcQgvGf7HR15nb1PCXYFVE
Message-ID: <CACOAw_z0cRcUg5R33dBnVsJrdeKL=4_xL+vxRsAjQPSSRc91CA@mail.gmail.com>
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix to avoid potential reference count
 leak in do_garbage_collect()
To: Chao Yu <chao@kernel.org>
Cc: jaegeuk@kernel.org, stable@kernel.org, Daeho Jeong <daehojeong@google.com>, 
	linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 15, 2026 at 7:22=E2=80=AFPM Chao Yu via Linux-f2fs-devel
<linux-f2fs-devel@lists.sourceforge.net> wrote:
>
> From: Chao Yu <chao@kernel.org>
>
> In do_garbage_collect(), we have reserved reference counts on summary cac=
he
> of all segments, once gc_thread encounter freezing, we need to release al=
l
> reference counts.
>
> Cc: stable@kernel.org
> Cc: Daeho Jeong <daehojeong@google.com>
> Fixes: 02d91398a602 ("f2fs: fix to freeze GC and discard threads quickly"=
)
> Signed-off-by: Chao Yu <chao@kernel.org>
> ---
>  fs/f2fs/gc.c | 10 +++-------
>  1 file changed, 3 insertions(+), 7 deletions(-)
>
> diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
> index 5bb117e5e811..ad6f604cc27f 100644
> --- a/fs/f2fs/gc.c
> +++ b/fs/f2fs/gc.c
> @@ -1901,6 +1901,9 @@ static int do_garbage_collect(struct f2fs_sb_info *=
sbi,
>                 if (block_end_segno > end_segno)
>                         block_end_segno =3D end_segno;
>
> +               if (unlikely(freezing(current)))
> +                       goto next_block;
> +
>                 if (is_cursec(sbi, GET_SEC_FROM_SEG(sbi, segno))) {
>                         f2fs_err(sbi, "%s: segment %u is used by log",
>                                                         __func__, segno);
> @@ -1968,12 +1971,6 @@ static int do_garbage_collect(struct f2fs_sb_info =
*sbi,
>                                 sbi->next_victim_seg[gc_type] =3D
>                                         (cur_segno + 1 < sec_end_segno) ?
>                                         cur_segno + 1 : NULL_SEGNO;
> -
> -                       if (unlikely(freezing(current))) {
> -                               f2fs_put_cache(sum_entry, false);
> -                               f2fs_put_cache(sum_entry, false);
> -                               goto stop;
> -                       }
>                 }
>  next_block:
>                 f2fs_put_cache(sum_entry, false);
> @@ -1981,7 +1978,6 @@ static int do_garbage_collect(struct f2fs_sb_info *=
sbi,
>                 segno =3D block_end_segno;
>         }
>
> -stop:
>         if (submitted)
>                 f2fs_submit_merged_write(sbi, data_type);
>
> --
> 2.49.0
>
>

Reviewed-by: Daeho Jeong <daehojeong@google.com>

Thanks,

>
> _______________________________________________
> Linux-f2fs-devel mailing list
> Linux-f2fs-devel@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
