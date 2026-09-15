Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08D4C43F8AE
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 05:48:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789451303; cv=pass; b=TSgT7bJMcCdkXnlbNK1hBAXKf80A25eXBE+Il+Kpb/yAi8/eXR/YajTKwfJ8VMdIGCg17uHGoDgHCT2f6iMuSNTZThMhmnnvfX15u5eQ+0PlNDf9AykkwfaBUQOZTxRrxhG+KLKkIDE3Jj5TWMUudeqPUd3l1oRgBdlxWEHZsV0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789451303; c=relaxed/simple;
	bh=+P5PG32j/Of8TX5DMyOrie2c8vQ4azM+ufsi5mmU/uA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I7srDq9G0XhHpUijFvUxu4JSGLx6HNEG+gJpofiBjnyMbhKxGwYA2AcPk1rZYuiV7tzE1fGTLehJm9VSjw3aVNVQx1uUUk4SGItHUd/7pVjNcn7mFq6Z2RvVha66o5WpgeARkbAvmIGvzw0izy5JOo7XDSuF40hsWyJ0ng1D4C0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TKiNYQh5; arc=pass smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TKiNYQh5"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5b8b3c8c4bbso137379e87.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 22:48:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789451298; cv=none;
        d=google.com; s=arc-20260327;
        b=ICqodY/t+pRJYwD3DyZAjbYcJJpFMvCt1bzlNxA8arD3afv4fLpZfgkPJPf87t/gn6
         amcutRw3DDHuQYGZuRLRbdyn7xAZc32IDPrz2Ko2DHUdFrMIwUeUJi6rTebyR3k3+49D
         S0aENg0V2EBCyl8jzI+ZEAsiMEmscFwgQcoK07cc0/pSVRpSgPxqWqxd1tbT84d+zu1D
         VbDARjzldlJ1ESODnRSwF5mbv/ly8Wle1mAjQiMu5EUEDHrbNEZprOyjWS+UtuXNjcgt
         SPnlwNkSOipfacTzpsrCkUl7tXvEZAIVGcOqDU5Y2KMj/3fIrRHkxhrqy3n2npCYNIJK
         XAPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AR6GwgJ16RrWX9JH4eaeCDVCKlN9ZYf1vr6arYzModk=;
        fh=GhG6wZaGzuZhZ5YdwqfV19jXHFZIFO5yAmhcPlYP5pE=;
        b=WKKIdS7fGxuUOmDYOU71B4zxIigU3hhiB0B/1kNnJgf38X/f24VxVML9xJ36/iN1uO
         jl6ES3We72WJS4N5FNPORLUUyl+zTKZQAK25E3yBBxgiRMhCo8BAxmXSnP5Wxs6h1KZC
         nMjtZFS448onNIvRMS+m19cflryXmhk8qZImjviBXPHZAxFgJkI5dfOyzDZggs/6nVQ7
         WSWZdBX9pGu1gaNCqMXf0oxRi3wDNWDEvQF0ylHVFtFNqKyvrWL0J88tJ3hugz9Mg472
         0bzVBFv8kw7kYpJ01XsifQjGL/B6OA4grYH7Gu6AUvJkVIPeouTNxfKL8OVdRG09S/Hh
         vTbA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789451298; x=1790056098; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AR6GwgJ16RrWX9JH4eaeCDVCKlN9ZYf1vr6arYzModk=;
        b=TKiNYQh5EERCGnymn9kbwvRsRSVVSIFDzl5qgqExmJ7nBdrR0geBZoVa3WAJBDZP/M
         79EW36akUssHKkxZPvnWY25iQetV5ObqWEMK7DCEzv9ysDbfUCP9QIB6vp0RAGNqRdqb
         mPpQXv/JPWWRgjqRGIAai6Cx9cqRrh8eMEDLCxSjM7vg824tOGxQ7Ep6W0YsuXYiGJfO
         wpF1F5f38mJo/5PTzRVxNWOjifweD6Rm/4dyBeC5Aps6LiPrWJePIZXpbZcFd9B0MPyi
         WCZq3hHIsZ4zTCAXuiVGb0UCVdCq3U8xqRxXobG5mFgfVEVisDvutpTVS9as5aYW6fry
         kynw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789451298; x=1790056098;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AR6GwgJ16RrWX9JH4eaeCDVCKlN9ZYf1vr6arYzModk=;
        b=tscfH4xJwu7kdFGFnfydGhnuck47N67zbxP1ryhcr1MWl2Qs+i1LbNu4UC/NJeRoz4
         73+JpoU1nzuhvbLwQjtlc4Oi3qTWgoi6UxxLu6xxASfMVK1wY7aZ6m4w3vMUcNgph1wE
         yB0h0ciNoOfoEXXXN70Cf3kTejkaZad8oiQVfLhL6T1PNIWKW6HvIRnuMKaFieXn4S0X
         DZdmKU8jqbp5YH5sckxZkdAmrMYnMLuTLvFn5kyAwefnKyidd7b/qB08ngW68oYqvojq
         WFuqXfdJd6CPN5btvZXZ4ij605E1ayDls86fQ9UNIMfsHLeTCCPyu6HfVjY72O+354gh
         nekA==
X-Forwarded-Encrypted: i=1; AKwUvBzlSoS/5SNn62oK0jh04BgB3ogFrm+WP6dyXqNVhToCeyUeJUyS/7GtPhQFJQCC2DhVyp23wq088kBwRWE=@vger.kernel.org
X-Gm-Message-State: AFuF++mAM+ukbVAGPLheOi0PnsvPx4kq3gTvPwlxwGJdIQpNDZgask+A
	KdB+kQ+ym/SjJZSPdyKzsp23siQzv7VjzVSnTcjmUv+PUY/S1aySjjzYnwzquGh7GHG14s3CEsx
	flMMdzRQnMD9VEmo7spHM6FkIUfcv/xc=
X-Gm-Gg: AYBFou3tm4NjPS/M8MUNq1iRnmMgmIsVRczuAiLp61QS6KCzmIFLUhF7slrfp5X8Eyf
	zjgfMH557H/sM6VBnpgttKT0AKqr1U4js0x3mcbyXtYFoKPtQrP55DSoCZYi2fps3IA0z2tNxJU
	0N9B4xk+zjuKFdL+brmOnePuzwu/ucojgc0vZo09A+juKl/BHqc8Vx6OJflIuibmTlKhskspyNj
	J8NgMZn2M0gbSzuVXsbaUhDBI/HYT9Cd2Z48lqjBvQExd9HPpGNx073oDWXW0O0Uh9NZ7xIlgDf
	2hYXFaSS79ciUtQudhMoXjd3IfMoo+tp6MS7ZRVwzBMgjSCST6iAUAY2sruRdKPpIqZVCiNpFMA
	nAY7GOk1sk5+M
X-Received: by 2002:a05:6512:2343:b0:5b6:199d:c1c6 with SMTP id
 2adb3069b0e04-5b8b2ab7ac5mr522710e87.37.1789451298220; Mon, 14 Sep 2026
 22:48:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260914054926.78808-1-zenghongling@kylinos.cn>
In-Reply-To: <20260914054926.78808-1-zenghongling@kylinos.cn>
From: Hyunchul Lee <hyc.lee@gmail.com>
Date: Tue, 15 Sep 2026 14:48:05 +0900
X-Gm-Features: AcwNN1VcPq2i5E7Xg8O4s4W6KObdRjVNIhTfdG84OREbQW1Cb8as5dB4qcgIcec
Message-ID: <CANFS6bZi+Nsrieh1M1sxwc7SPyjy8xx9KJcfUQdctsUrYrQedQ@mail.gmail.com>
Subject: Re: [PATCH v11 0/6] ntfs: fix volume flag races and persist the
 recorded error state
To: Hongling Zeng <zenghongling@kylinos.cn>
Cc: linkinjeon@kernel.org, ntfs@lists.linux.dev, linux-kernel@vger.kernel.org, 
	zhongling0719@126.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Hongling,

Thank you, and this patch set looks good to me.

As a follow up, it would be useful to discuss making volume dirty
when an RW mount is established and clearing it only after a clean
unmount.

The current implementation still has a window where metadata
changes may be written while the on-disk volume flag is still
clean, and also does not clear the dirty volume for sync(2).

2026=EB=85=84 9=EC=9B=94 14=EC=9D=BC (=EC=9B=94) =EC=98=A4=ED=9B=84 2:49, H=
ongling Zeng <zenghongling@kylinos.cn>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1=
:
>
> The fs/ntfs runtime metadata-corruption paths only record the in-memory
> NVolErrors() flag, and the caller-side dirty-bit marking races with
> ntfs_sync_fs(): a volume can end up with a clean on-disk dirty flag
> despite modification or recorded corruption, so chkdsk never runs on
> the next mount.  Based on ntfs/ntfs-next (9a05b5715cfa).
>
>  1/4 makes the volume flag read-modify-write atomic under the
>     $Volume mrec_lock;
>  2/4 marks the volume dirty unconditionally on metadata changes,
>     dropping the racy caller-side checks in file.c and namei.c;
>  3/4 derives the on-disk dirty bit from the recorded error state at
>     the persistence points (sync_fs, remount-ro, put_super) and never
>     writes a hibernated volume;
>  4/4 persists the dirty state after the final put_super() commits so
>     late errors cannot unmount clean.
>
> Changes in v11:
>
> - Add 5/6: Stop clearing VOLUME_IS_DIRTY during sync. The bit is now
>   cleared only on remount to read-only or clean unmount, preventing a
>   crash during metadata updates from bypassing chkdsk. Verified in QEMU.
>
> - Add 6/6: Check commit and flush errors during remount and unmount.
>   Re-check NInoDirty() after __ntfs_write_inode(). A failed remount is
>   rejected so unmount can retry; unmount failures are reported as warning=
s.
>
>
> Hongling Zeng (4):
>   ntfs: fix volume flag update races
>   ntfs: set the volume dirty bit unconditionally on metadata changes
>   ntfs: sync the volume dirty bit with the recorded error state
>   ntfs: persist the dirty state after the final put_super() commits
>
>  fs/ntfs/file.c   |  20 ++---
>  fs/ntfs/namei.c  |  24 ++----
>  fs/ntfs/ntfs.h   |   1 -
>  fs/ntfs/super.c  | 191 ++++++++++++++++++++++++++++++++++++-----------
>  fs/ntfs/volume.h |   4 +
>  5 files changed, 171 insertions(+), 69 deletions(-)
>
> --
> 2.25.1
>


--=20
Thanks,
Hyunchul
