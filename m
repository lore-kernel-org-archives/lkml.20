Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C684358D32
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 18:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787942147; cv=pass; b=HaQupElB0jKzu8gAFnkYWBEGbPg6IJslyTl/qLJjuNr+q1/DJaMlQrYQ3WZanmnTWlt4MfEeSsh1oEBupvWUbnVZpSqVNWS/xR0MnhnJx3W3kFhFzoloMGmR6BL4pSVGfQTyt/jnyN9qstaDr9FNszboex2LUg83E+Y2ilq0e1Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787942147; c=relaxed/simple;
	bh=0qn4UxNb3g604jH6zmZ0Yq2KvJ6mMJRy6DHLQzewxlo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CrTs0UWAzWwUMX84gEFWgYd2rmKNe9IuQaKAKVRcy9YXuMVwFKlm2o99apisNqHfLaohUP8JCpm3GK2hspohLXa5Hxu8FdSZCx10ZSk1S7tfsZ6ypI57k+3r0jyhCk1Frqtpjqrhr66LMkVlSkwBsZ0RZ/bDsjll96h7SyD+woc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=r2Wuz51M; arc=pass smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r2Wuz51M"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5b568dae0e8so1652298e87.0
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 11:35:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787942143; cv=none;
        d=google.com; s=arc-20260327;
        b=j2viQ6H3KdES3pEsSNOG6bGTbix9aoZC1yEbtFdkrSvqpVIQtbA+MgMVRsM3V1qMS6
         9GWokOPK/09pCfr0R2055RUgwRMHkHIHVIIrk4tZLwLHVB7ZrjBvrCSCFvsAHK0whW6A
         dP4w7JN1rApS1mZdJfvrUpxVt+mey6iVe24hcvWnr0mWVISy3cqMy+QIvLjem3B5wS/O
         cxSRm+blfnSSEeu7rjqA0qpwwf6oknN3K/zspifMdX5szNmGK8p/j095vMIc/KFoq031
         DZgNVtro8x0v9NyI4rTd748Yyxq8ZTk8HvhP4Ct/ISaeVzhOMQ6ABBkS0qPbM7h+JEEf
         bhRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ynpb+Jwnqqd6rxWLKuDyYF14qvmrfmLGhrgEpg5gM8g=;
        fh=R+5WnObrt3U2ZY2gvRTvGrEWlkpHIGTZoMvn4D3HMpE=;
        b=Albng0Ffrk/t3yVoTnx6pX6iz14pL8vPsbbSmfaGQ2LQGEROj4/dJE/iCiMJeN9glx
         5W67GrsI3jV1vnLtkpQIJwONuuEiOcOMOdYAiVa7LkYn5N51gyTAIKE1joF0Vz3YnYSh
         GUucyQwYifGAUky8c1skviOHdQ7pQ4bm4u2JQHCaDdZQsT9T9FxD1dUAbkQUqeMckkA+
         xPIHztBDcCFA7DZTOtW+sQ7/8zkPCVh8WjxUKcVujj2ykxYacGMfUFUkFn1d5SsvjMFK
         8OBiGhUm/5PaYUwFCpmh9ZJh6gZAkzh4DAQQXZPpbJJwbliD3ywAkAuDDuEZerZcofl/
         TIWA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787942143; x=1788546943; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ynpb+Jwnqqd6rxWLKuDyYF14qvmrfmLGhrgEpg5gM8g=;
        b=r2Wuz51MLusSAxOV1rlK8zut2WgmDTbNRTg7hbALmYm97vbmtrdzwVu9ZPC6y0CrEm
         XyGLHtCeCiZGXbVmJG+CfpSmDuXcKe968XIDOFQ79ulhYAUbvmrrTE/ZKRGetk8tbeMw
         ZkmtpRfSjo0zvDeYLUgJWrxViocc7RZlaa+zrjKPPpRM7n1Zd6gI98lsAaliVxhe+hkD
         KvhSk/zDaZLm17LeWbJ+tRoJcydXVWFF0TM0npypOk5zaXgZemNEfJNhY9pskrojPzOf
         gk6N6AkPZ8YwAYu60473AzfL2GxMBajTtrv6mRVHwromlu8xwfI5BmqShfJTbypMyKCQ
         8wvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787942143; x=1788546943;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ynpb+Jwnqqd6rxWLKuDyYF14qvmrfmLGhrgEpg5gM8g=;
        b=UyYnUx1k2jFW25D0c8qA25KlKr6Jc/y+VeFfmwK5qffq3FEjQm9308NZWYPnnSckK6
         EpP13EfzMnCba5a3mrzzIYMJwRx5n2IvlZxpzefhLh/7eY6/SFAwevn31+IRPl1JSnF0
         Ktdq1RKwK9dgeOfl+fuP8HxTNI/ixAniKEOhj7CI9uEbefjC5K6fH7O0dmyp7cCY8ARa
         JDGFIFYYO+GR2V067A17kPzkAoyHVv2AKfwJkbW8Gs32ryi04uus+9k2LhDXT+I8slxW
         KIENLJP3rLcP3lqmiNQjBi7O3N61ENSrH1jgLxdGCMZkoMd3wPy1EFGchcabn+uFYN4l
         elFQ==
X-Forwarded-Encrypted: i=1; AHgh+RqfQNAiDywUBfKXBDtTBCz4W4VBxkHWYgTeoxrsjwwNhkgyS0FkeacQ+eL2LNs+1mnZwrrZSnt6D9LzNKc=@vger.kernel.org
X-Gm-Message-State: AFuF++kf1CFlc1l2KWT5/vEh/i+PSqGbsR29mXahP+pwuxYt0yZmdv3m
	4/piolDz/tGtxRzbIDL+MZiYJ/hP3d5t9m4PRQxD0LwYEndVuA1/RY/3ZuLFDzbUlwTlKqdAZYh
	iaaKkZ1C8NF5WpIfrX8UF4ZYErJjprYc=
X-Gm-Gg: AR+sD10i0mWPUp2SqFN2IJqi/+yy/SJXjbjXPiFjArNOZZR4DOuMkc0SnZg1aMDNZkO
	qxGy5bz5RQov1JM/X1kcG6PfYEJxTPuyyWSvfQfbcyGwWioVQIooWe+NsyhH47ki/umVVL4Xe1R
	d70LQ2R7ek+cEJYjvblcoyEC2SdQL3LbUii4AZx9wDhO5T7GiPmsTIiBKRDxMJSJMgEa4trNjCm
	KMfg6Au98P7LWrX5HBOykCyyV/yh/dhF4ohF4TK7WdDoj6Vh6lUDYjU99cnwIPMY4ZDHpTNcN51
	bvIQF5IfP+MfLBX0ZZlnC8zmr5l8CvkZ7sJTlEdFaskK/CnIN+ZCi02bak/4ZknL89abDgC9Sjn
	RYvXbBg4VLUag3ybwaCdz24XextGvQMdyYQ==
X-Received: by 2002:a05:6512:3c8f:b0:5b0:ceb3:1150 with SMTP id
 2adb3069b0e04-5b5e68c215emr2691269e87.8.1787942143391; Fri, 28 Aug 2026
 11:35:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260828114125.637513-1-qiwenjie@xiaomi.com>
In-Reply-To: <20260828114125.637513-1-qiwenjie@xiaomi.com>
From: Daeho Jeong <daeho43@gmail.com>
Date: Fri, 28 Aug 2026 11:35:31 -0700
X-Gm-Features: AcwNN1XKyS8swpSmb2FoICesReCmb-oe2WjEFTdnn3lU_zfqIrEESazdS_1qYyo
Message-ID: <CACOAw_x5wNWf6s7j9FBrC5P28c__UiN9kw6mDvqVGgZZCk-ruA@mail.gmail.com>
Subject: Re: [f2fs-dev] [PATCH] f2fs: sync pending discards before reserving
 device alias
To: Wenjie Qi <qwjhust@gmail.com>
Cc: jaegeuk@kernel.org, chao@kernel.org, daehojeong@google.com, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	linux-f2fs-devel@lists.sourceforge.net, qiwenjie@xiaomi.com, 
	stable@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 28, 2026 at 4:44=E2=80=AFAM Wenjie Qi <qwjhust@gmail.com> wrote=
:
>
> A released device-alias range can accumulate pending discard
> commands. The reserve path then marks the same range valid again
> through f2fs_reserve_device_alias() without first synchronizing
> those discards.
>
> If the discard thread later submits one of the stale commands,
> __check_sit_bitmap() can still see valid blocks in that range and
> trigger a BUG.
>
> Synchronize pending discard commands in the alias range before
> making it valid again.
>
> Fixes: eae3faf210bd ("f2fs: support dynamic reserve/release for device al=
iasing")
> Cc: stable@vger.kernel.org
> Signed-off-by: Wenjie Qi <qiwenjie@xiaomi.com>
> ---
>   kernel BUG at fs/f2fs/segment.c:1228!
>   Oops: invalid opcode: 0000 [#1] SMP DEBUG_PAGEALLOC KASAN PTI
>   CPU: 1 UID: 0 PID: 79 Comm: f2fs_discard-25
>   RIP: 0010:__check_sit_bitmap+0x2e1/0x4e0
>   Call Trace:
>    __submit_discard_cmd+0x921/0x1140
>    __issue_discard_cmd+0x524/0x12f0
>    issue_discard_thread+0x686/0xe20
>
>  fs/f2fs/f2fs.h    | 2 ++
>  fs/f2fs/file.c    | 1 +
>  fs/f2fs/segment.c | 9 +++++++++
>  3 files changed, 12 insertions(+)
>
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index 16720f1f0a9..2b9c6bf310b 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -4067,6 +4067,8 @@ int f2fs_start_discard_thread(struct f2fs_sb_info *=
sbi);
>  void f2fs_drop_discard_cmd(struct f2fs_sb_info *sbi);
>  void f2fs_stop_discard_thread(struct f2fs_sb_info *sbi);
>  bool f2fs_issue_discard_timeout(struct f2fs_sb_info *sbi, bool need_chec=
k);
> +void f2fs_wait_discard_bios(struct f2fs_sb_info *sbi,
> +                           block_t blkaddr, unsigned int len);
>  void f2fs_clear_prefree_segments(struct f2fs_sb_info *sbi,
>                                         struct cp_control *cpc);
>  void f2fs_dirty_to_prefree(struct f2fs_sb_info *sbi);
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index d440231b8cb..58cea2aa314 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -3847,6 +3847,7 @@ static int f2fs_ioc_reserve_dev_alias(struct file *=
filp)
>         write_unlock(&et->lock);
>         clear_inode_flag(inode, FI_NO_EXTENT);
>
> +       f2fs_wait_discard_bios(sbi, ei.blk, ei.len);
>         f2fs_reserve_device_alias(sbi, ei.blk, ei.len);
>
>         i_size_write(inode, (loff_t)ei.len << sbi->log_blocksize);
> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> index 1e7e745be71..7f4fe8c34c2 100644
> --- a/fs/f2fs/segment.c
> +++ b/fs/f2fs/segment.c
> @@ -1916,6 +1916,15 @@ static void f2fs_wait_discard_bio(struct f2fs_sb_i=
nfo *sbi, block_t blkaddr)
>                 __wait_one_discard_bio(sbi, dc);
>  }
>
> +void f2fs_wait_discard_bios(struct f2fs_sb_info *sbi,
> +                           block_t blkaddr, unsigned int len)
> +{
> +       block_t end =3D blkaddr + len;
> +
> +       while (blkaddr < end)
> +               f2fs_wait_discard_bio(sbi, blkaddr++);
> +}
> +
>  void f2fs_stop_discard_thread(struct f2fs_sb_info *sbi)
>  {
>         struct discard_cmd_control *dcc =3D SM_I(sbi)->dcc_info;
> --
> 2.43.0
>

Hi Wenjie,

Thanks for catching this discard race and for sending the patch.

This is a critical issue, but we need to address it differently:
1. Data corruption risk during the released state:
Once released, external applications write data directly to the raw
block device (/dev/block/...). If delayed discard commands remain in
the background queue, F2FS's discard thread will asynchronously erase
the data written by the external application.
Thus, handling this at `reserve` is too late=E2=80=94we must clean up all
discards at `release` time before returning to userspace.
2. Performance issue with block iteration:
Looping block-by-block (`while (blkaddr < end)`) causes millions of
lock acquisitions and rbtree lookups for an 8GB+ device.

Fix:
In `f2fs_ioc_release_dev_alias()`, right after
`f2fs_write_checkpoint()`, we should either:
- Drop/cancel pending discard commands for that range from the discard tree=
, or
- Synchronously flush and wait for all discard commands in `[ei.blk,
ei.blk + ei.len)`

If you'd like, I can write and post the fix for this. Let me know what
you think.

Thanks,

>
> _______________________________________________
> Linux-f2fs-devel mailing list
> Linux-f2fs-devel@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
