Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1514F4EA367
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 15:54:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791906868; cv=pass; b=EA8z+DtR4JA7YguCfttMB7nlnjn5kttdtKwPUFbWFMF0iTDWqpx815gbdngbDzg9Baq0p7XY+JHV2AEgdMVIbzdI61IalV/SBXd72gmtc1rz3KbZYN/+MNAccZQHSlsXKiwjHV/w+QA8jYJDoLmfAMTtH9BaQl6UQGTemhyH+lM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791906868; c=relaxed/simple;
	bh=oxAgFjUtVgQMNrKnLa34zPkf2GsjrYpAb2c8ECTaplA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bBcPBR/5iFV+IlIhAz2ZyOjpBd86UHQS+AfVGjgdh5SiWpkdMz6/3mMyrE3XV3R08foMawA0h0uUqThCTcFd3NOHQ0TISSNz0/LC0h803DNITrc3ew6bS0CtqaQVojipVqK6Sb5vwpxH7E/XOI9YHux4RcnpUCGF7cy0ofJQ0uM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PCy2dW+m; arc=pass smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PCy2dW+m"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5bcc6094d7fso2493963e87.2
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 08:54:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791906865; cv=none;
        d=google.com; s=arc-20260327;
        b=DLaS+Wb23ohikRN8vd1mrMEl+/eQUtyhSA1iL0VVhhE6B4OySD20KYMlusB4tldSgX
         X+GQHny5FfbhCRXwGGoMZ3NZ+yYtwoR9k8x6RTMj4Tmlv/mfqBDcLoyOPlnxw+qUuS3J
         U/SQwyUecEBTRWnxaeMsC3F0OPdQFUOix/tsYqYraHqEk//srmbJc6s60tPS0ydC4bHN
         G18PXads/aIWzGu+MBIifoMp44e9FLVh/h49TrVzdxpd0Nea8mBnnwG0hNhKDoPPrbTG
         2nI98zcM3Sjz+wTvBZc7pOHPtQFIgus6Rm+gBSEWyYGumrS4gjvF2AIyZi7bxMLxiV8X
         9LNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rUxAHLiVJ++sul2Jm66JmrePRs+RfbOvzGxUS+GnQIw=;
        fh=zADtJv32tF24kk0kjoCFOXWGEkLHMDafBo+zzMIQv2E=;
        b=EIoNGxrlpjSluoltq6aw7r2alNwn6pLdHEG+c0sh299qyktqGs7X65SC40mb/Tf6JG
         66eOQsV8FuJbqIynwRDxtyCnnSEAx1sKpfXJRE/6i/oUxqvbsOIQaWlBAe9B9FxgbbI0
         heHP3IWwv6SildGLkAGKhWCnQ+Jyw4lft/oVagQjsA4PEnREq58nNZIKzENVZThTyWRy
         19Zg7xuoRvVEjLcZhKAHNcWHT6S371x9SZRilaP7GiY/zzs1UCz+V80XTMCZjDEHHvgS
         yjTCW+CeRpqEuRrvyUJHImMxc2d9xkgfdCUcQmMIl42YqMdHJpf12o7/ZAb1H63bhC6g
         +shg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791906865; x=1792511665; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rUxAHLiVJ++sul2Jm66JmrePRs+RfbOvzGxUS+GnQIw=;
        b=PCy2dW+m1KWDa5GVjz0ZeArnoClb8p8FBHrvrd18HblT6Wu6Q1LGI8ZoDB6tlhYkez
         CrUhn1SA0op5eYdfP5LTF7rm5AAUfQ/bYylC5SKiNy1vBLYSTWwHgtHftDDzKjvjPzNr
         g55mHYlak4OC8dyYZzdmXlVO9j+UbYbVp8JfgpU1WCr8a8ojz98BZMBx9IIKCxDnyPL4
         W/nruNcdeMsnMZT/RDYWC6GPhkmaeUGJXUnobaKqpHdCIw5O/vcxf3OLwUAzsK1F6xpD
         eOHeObprtd4CAuNein88mZS+faUoVarfNY9aCqO4rkd59c2GyoTOxzPcXUSvXYZ/gYwG
         lP1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791906865; x=1792511665;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rUxAHLiVJ++sul2Jm66JmrePRs+RfbOvzGxUS+GnQIw=;
        b=SYFcnIbdtnVXLIOfo4y+5rg3/c3FNNk7AvOOqDS13Fwr18xCAuqOX66zsdUE5zAhGQ
         TeyU5XBA6MNiFXkjRpPmZJyOapJCXFd6LbjmDpvw992U0hZSxxq3FizxhYwn4ofmrllB
         mFuoGuCtCVNhgIl5PLY3usCfgVjQx8YSYXBo6i7kpaY1Yj3hOv8ct9txguNTH+znnsej
         p49dM3RffCToWRN+GPnyvDXtVYLUrrj8N8a6nEmLYlVSS2RtDc3jo8gw8425EfThagoL
         jmRc1kKWvRl5BoqKUsc38GaY4UxZQBx2dNFYrS7RsqjhagjXpLNWxmSekuT7JuaVwJ9i
         ea/g==
X-Forwarded-Encrypted: i=1; AKwUvBx/3q7SWXWYXx3MTAiVKsj81MaiOF9i0ob2R7w9yM2ZSgtZPckg2CrnIb8HrgIVat/OP9MlTjzKFnGL2v4=@vger.kernel.org
X-Gm-Message-State: AFq9FYLq1mlZRtvuR7mmPPHtwPhvVhs8/zsiverloCNwgQI7Q2hP7RHm
	lE7l/+6tC0GThBL746lgOr5nqUqdmTunfKpUEkMlmwXyIPiQRXK6A0WNGeycL6IkqBonHfFPxmg
	rzkQyvj3ihX+qwlyBwABmz47rTWJB2Aw=
X-Gm-Gg: AYBFou3z1BU4IRr9YC6s3JHEbvVEmFJ3nMWtiAJh1+7lRwoqL4ld81rY7BSDZmckpy0
	fOd0IPLqv1ambUeWYVYIUbCVlAw20E2YcJhrIsL6qltV9BMSsOIVDatdz/gQq/FnCDXdXYD65dH
	gNtT+ymU6qZnuUTjF6zjHMnvbimzhXuRHk/e1B16PEA0agVQ6FCK5z0Qd1CbMDIf1CaaSyg/S0V
	thrEhG/vVWfmApSYhB38A8V3EJhs80NPh6/mAi3uoh6v7zVQhw3GOw36/HEhHO717IFDJnnoxRt
	IwsCAR4sSo0eGAYXZBGqy4GgIyLsQrKeXJc5pSuV11dCR5IQvlkX8EbpGjf5evnJ9Q2U1GAmcht
	5731OIs58Kus83qbdyaTmr+URYlysgPr8V8tksydhAA==
X-Received: by 2002:a05:6512:31d5:b0:5bb:783a:72ac with SMTP id
 2adb3069b0e04-5bcde6bb5a5mr4986583e87.16.1791906864747; Tue, 13 Oct 2026
 08:54:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261002064853.37782-1-jsjlee1020@gmail.com> <00c340f7-723c-4b17-a5db-17906ff2951a@kernel.org>
In-Reply-To: <00c340f7-723c-4b17-a5db-17906ff2951a@kernel.org>
From: Daeho Jeong <daeho43@gmail.com>
Date: Tue, 13 Oct 2026 08:54:12 -0700
X-Gm-Features: AclHuK84zuthNMqO_uZ7SbPD7zr3eQ0a1qCPHQBjSLYBMoqOxjJUiOKfXvqHEl0
Message-ID: <CACOAw_zm0yaC_8eyjiyC+bB-S=hfbOdNcNgSV-VnbPam6r-zAw@mail.gmail.com>
Subject: Re: [PATCH] f2fs: avoid unnecessary reads in f2fs_update_meta_block()
To: Chao Yu <chao@kernel.org>
Cc: linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
	jaegeuk@kernel.org, Seongjae Jeong <jsjlee1020@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 11, 2026 at 1:41=E2=80=AFAM Chao Yu <chao@kernel.org> wrote:
>
> On 10/2/26 14:48, Seongjae Jeong wrote:
> > When the packed SSA feature is enabled, f2fs_update_meta_block()
> > uses f2fs_get_meta_cache_retry(), which reads the target block from
> > disk if the cache entry is not uptodate.
> >
> > However, f2fs_update_meta_block() overwrites the entire filesystem
> > block with memcpy(), so the existing contents are not needed.
> > Partial updates to packed SSA blocks are handled separately in
> > write_sum_block().
> >
> > Use f2fs_grab_meta_cache() unconditionally to avoid reading blocks
> > that will be fully overwritten. Also remove the error check, since
> > f2fs_grab_meta_cache() retries allocation failures internally and
> > does not return an error pointer.
> >
> > Signed-off-by: Seongjae Jeong <jsjlee1020@gmail.com>
> > ---
> >   fs/f2fs/segment.c | 8 +-------
> >   1 file changed, 1 insertion(+), 7 deletions(-)
> >
> > diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> > index 794e0d99fc7c..51858f64e43e 100644
> > --- a/fs/f2fs/segment.c
> > +++ b/fs/f2fs/segment.c
> > @@ -2844,13 +2844,7 @@ void f2fs_update_meta_block(struct f2fs_sb_info =
*sbi,
> >   {
> >       struct f2fs_cached_block *entry;
> >
> > -     if (!f2fs_sb_has_packed_ssa(sbi))
> > -             entry =3D f2fs_grab_meta_cache(sbi, blk_addr);
> > -     else
> > -             entry =3D f2fs_get_meta_cache_retry(sbi, blk_addr);
> > -
> > -     if (IS_ERR(entry))
> > -             return;
> > +     entry =3D f2fs_grab_meta_cache(sbi, blk_addr);
>
> Daeho,
>
>  From code side, I feel this is clean.
>
> But, could you double check this cleanup? in case if we handle this
> intentionally in original patch for something.
>
> Thanks,

Looks good to me. Thanks~

>
> >
> >       memcpy(cache_address(entry), src, F2FS_BLKSIZE(sbi));
> >       f2fs_mark_cache_dirty(entry);
>
