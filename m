Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 660DD35E1B0
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 15:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791558564; cv=pass; b=YIAc0XxaSS1rxDCtYY17wlHLQVzpVX7qqNRRHhjv1muA8Io/R7G54bjVGgSHI6jWZQpCJXOZKRRy0rgMEOy3k0igirZsfnbljn1WYliB5PCMGRx0h96UrBnIQUSNnhi28aLW1XUS4Hufp7o9DTjl32gpzz8a9zfxclVop9b/3tI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791558564; c=relaxed/simple;
	bh=YZbKpJCBFS61X4flLoy7/qmLVhvZ751onacMoLVN1KM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C4uue/j9Cp/EhL70kpntPC7gkEsh0CJqJar3bO5BeMtgPrVVgdtcwO7tKdSl4efjvn9GE6ZBc21XmzVqy2DLdQUH8jBAqDQzd1jgCeXrtOv/2raR8AiG7sV6ui8l/ZwsuYex9xHTjZXVmBJ+ZbRsmECuVOVyeVKRMh5b3QDu6fI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m2wq+wH3; arc=pass smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m2wq+wH3"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5ba3ac592faso2858978e87.0
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 08:09:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791558560; cv=none;
        d=google.com; s=arc-20260327;
        b=S6ib29zKy/sr99QxUdjt7HGzOi80EKdAnb+LXJ6OG7vkWFRfwlryFivO28G1FUdwNl
         xYCzDcqSb5h3ixVvpM/9J+byqLMzWAY9/WU6kfxjyMWrZhf1QYSZ4WTYzKfSZSsy8k80
         kFnGGUXBNuK315s2afdmI1NV+4DNmVt8qn6itgQ1nVL7hNGLU391Dda/h2fEGeDZWsYU
         tisPPHpypttwoUCemDLIHNcV6QUv1h0cMtGcU8IP6D5Xles4hNZ6RrcGD1FtgMZPUd7u
         oQi3Oa59+g2dr8RJVOaGiQ5WM8UqQprITf+8/5xiAdZlm4Tj/+IpJ2XOmdAy26b3HKin
         ZDtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=A/HDEM6SAMd1TqfEczfv3U/biPTo6BFTefjmZrIo9H4=;
        fh=sPilOYAT4QfMgYxGH2LjRrcqbLUzvrQqMQUicHZMufQ=;
        b=iaRjkIx2zmjhisroaTBV2ObN7uY8qHGZJc17TWI9JyYzr0d9ZTLuoHXJWk/TkyEWzp
         uMSl2Uw9i3TyZvm97ISU7XDn0WCd7i8TRcT80jhc74iNnFadKXrVwJCUX4FCpzmoN6Ot
         MWNbAbakZsqypcO+upFy8EWA5JDs4J9FFwdsKqcNYnkjhwlnlfld7VAHO+Ri+zpnRH0X
         +iKdIiNlWHMrwBm6hsTqVqDCCYTXUI1chD5DZbQDs/WEtoL7xPHhgCoHAV8lqel1HBXi
         ycvsRkyzi0jP2Iyu0IzKjc8xVx6dWyDp8OSoejTdJnBuYtZJMGketrUjp1aRqFioSH2S
         1o9A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791558560; x=1792163360; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=A/HDEM6SAMd1TqfEczfv3U/biPTo6BFTefjmZrIo9H4=;
        b=m2wq+wH3x9e5ctREVvlcvSDSA/0U9fDg3+X/xGhfLChkRVY6j0gz3qLL2tT2Ysst7n
         ks04It0/zXlHVt28Vu29nWGsLWd8usVED94gokoA3WeYtsyo+sN64hBaVK1WOmwuPOVG
         vEtcnJNeKang3clhH2xZp2bQRl6YN2DnSnbixsBcOzGfD0b8h5PI62o4tnvswvd0g4q3
         NjP2PsLSxWvofZqBYuWrB5TuOLCHR/ik09VBB/ARhpu3vSizxiYIvKSZE74eq3wQgDqR
         SWLzIEOEf2BZLglNH8pHWqkFH9dKDZ9zgX6qeUbrwr8YPSLAruqy+2r+b3jTcaWvbFXg
         XSMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791558560; x=1792163360;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A/HDEM6SAMd1TqfEczfv3U/biPTo6BFTefjmZrIo9H4=;
        b=IDjBkf8l5rFx3x3vkrmAOb7yRi6xKA/WEv5YsI9QwljZOuNR91d8nuwRt5aRtoCxhx
         3feAeGATzCN9hgjrvWExXB+J7S0Jx+3u6pnWCxVQrhWmZ0QIaFBgg6w1yicDYXI8txBt
         g1Zf2Yw4LUWYDWUKu1rnQfuQQlqL6a2KM347kO4ol0gihLHNDr2M5iEEOqhhYujSN+2H
         eRsHE9Up/VByy8zunBwUCaRoFtI3OoxJQmDzKFXVNlWpM/308cjq1pFcFIWlvZ4Pc9zj
         oLqeDi0hwUyDtaETK1wcc5xMZETbBuxZK9be/glR5XOixZ7HsOQzo1qAnwM0pND4Cpne
         k4sA==
X-Gm-Message-State: AFq9FYKcRUAiYgM0rQUGFhDIm/xRqNfr5y3KZnIACKRqjufGBXcGp1yF
	Ltd9JuKoGuW4UK8EeyCMbMHBKWfDdnRwbIfacU73/aO+MKSvt9waUycN/A39p8F+BjPLa2HOE2M
	jeJ8PBlFlUwq+q9ZJdFLg+eab6t8YVgY=
X-Gm-Gg: AYBFou3okKf3u4R2I/SvzGsWYIvlWfkvmwo9HFeaTsuQGTw30NoXnWOd/QaFO+FTZmV
	l3DVET54Wk/3t96Ag946ZzcvqOxXzg6ZzQ/3uBmlv+7bGZNXrq+REJsn4tu+DZO7b7m2h0Kwxle
	X7u0vmGtotZeHEIbCkVBsrCuKSWnK4YdOz84iWRnKm1DLk/HqqtoppxKibAZEAf0S1Pg0trDJ5y
	V2Qmo/EU5yT8ghJcnESqqUp9kxzKQBdffBnY9gmzC8Mw0UFIMdXDHgz/F/OlIDlIBcGAKaeg7OM
	jut+D6GJORfRT5HjK4ESoQqj1dwX/NPjWxvmfFTy9koUQ7yrSZFax3HuwEyJLxiPiIG5UXcbiJl
	VxW3zkhLaQuI/3W7tlCXw7WB4BzJkv9xotoSIow6ZUUw=
X-Received: by 2002:a05:6512:a83:b0:5bb:42a2:31fa with SMTP id
 2adb3069b0e04-5bcde8d79ecmr856633e87.60.1791558560095; Fri, 09 Oct 2026
 08:09:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261007223608.2158904-1-daeho43@gmail.com> <411bd479-f3ba-48cd-9b96-ec017c685b1c@kernel.org>
In-Reply-To: <411bd479-f3ba-48cd-9b96-ec017c685b1c@kernel.org>
From: Daeho Jeong <daeho43@gmail.com>
Date: Fri, 9 Oct 2026 08:09:07 -0700
X-Gm-Features: AclHuK-b0iOAUVp3Gb3M3uy87PAKMjg-PM45YloYZBWvj1PWu9YXwALNhrlHGRc
Message-ID: <CACOAw_x0ahtE3bdD0TG3FjzbkFzyQYTah-trPVrkmH62AGCAqg@mail.gmail.com>
Subject: Re: [f2fs-dev] [PATCH] f2fs: write the directory inode in fsync
 before checkpoint
To: Chao Yu <chao@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net, 
	kernel-team@android.com, Daeho Jeong <daehojeong@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 9, 2026 at 2:03=E2=80=AFAM Chao Yu <chao@kernel.org> wrote:
>
> On 10/8/26 06:36, Daeho Jeong wrote:
> > From: Daeho Jeong <daehojeong@google.com>
> >
> > fsync() on a directory is done by a checkpoint, but the checkpoint
> > does not write timestamp-only inode updates. Since commit 7c45729a4d6d
> > ("f2fs: keep dirty inodes selectively for checkpoint"), such updates
> > are marked with sync=3Dfalse and left to inode writeback on purpose.
> >
> > fsync() on a regular file calls f2fs_write_inode() first when the
> > inode is dirty, but fsync() on a directory goes to the checkpoint
> > directly and misses it. So if the last change to a directory only
> > updated its timestamps, e.g. unlinking a file in it, the new mtime is
> > lost after a sudden power off even though fsync() returned. generic/547
> > fails sometimes because of this.
>
> Has 9ec09d5f4b31 ("f2fs: dirty directory inodes on mtime/ctime update") f=
ixed
> this issue?
>
> Thanks,

Oh, yes, it does. I missed that commit since I tested on a tree
without it. Please drop this patch.

Thanks,

Thanks,

>
> >
> > Call f2fs_write_inode() for a directory before the checkpoint, as the
> > regular file path does. The inode block becomes dirty and is written by
> > the same checkpoint, so no extra checkpoint or flush is added.
> > Timestamp-only updates without fsync() are still not written by the
> > checkpoint.
> >
> > Fixes: 7c45729a4d6d ("f2fs: keep dirty inodes selectively for checkpoin=
t")
> > Signed-off-by: Daeho Jeong <daehojeong@google.com>
> > ---
> >  fs/f2fs/file.c | 9 ++++++++-
> >  1 file changed, 8 insertions(+), 1 deletion(-)
> >
> > diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> > index 56c686b8580..b012cc22307 100644
> > --- a/fs/f2fs/file.c
> > +++ b/fs/f2fs/file.c
> > @@ -351,8 +351,15 @@ static int f2fs_do_sync_file(struct file *file, lo=
ff_t start, loff_t end,
> >
> >       trace_f2fs_sync_file_enter(inode);
> >
> > -     if (S_ISDIR(inode->i_mode))
> > +     if (S_ISDIR(inode->i_mode)) {
> > +             /*
> > +              * Checkpoint writes only the inodes on the dirty meta li=
st.
> > +              * Timestamp updates of a directory, e.g. by unlinking a =
file
> > +              * in it, do not put it on the list, so write it here.
> > +              */
> > +             f2fs_write_inode(inode, NULL);
> >               goto go_write;
> > +     }
> >
> >       /* if fdatasync is triggered, let's do in-place-update */
> >       if (datasync || get_dirty_pages(inode) <=3D SM_I(sbi)->min_fsync_=
blocks)
>
