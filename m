Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792791803;
	b=W38xtFszREtb1psAuHFd89qSsBvrBB/1p5oeH/ROzP75+Xn6gMy6SJS/OKRYfq9l0D9s
	 RlgRZODipl9+ea8oJnyHLvbL4xxAPi1xI23yn535kL+GzPQmtSl/wbLVOI8+CL2OZXEMP
	 3O2R79tMZ4Do6Nc4cuqbytO8eZoi0wwypli/lR1ugK2s9MVgfeNRN76fTf4Fkx1T32HAG
	 j70NDfJypV/DLOoKA+FVIBYG5gADuQaOi++flJI00lUGqafIP07E0AADcOhuv+L1x9sma
	 sUprX4QmuqrJBdl4I4qBM7fRYAIqwD6NklkQ21GiZes2mX6WGHjLKDoX7sBwb+Xs5CA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792791803;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=+2woRkBBQBE5HI2ydQVoR214az945NliSXR+nIMmfOw=;
	b=R6PAiPSVr7NmcGUHLNCGCdkNoBWFCgyCnCfogEhgj03rFdB0YIsmPeQ8w3aps94tpFvG
	 gtVyXzwMDNJ4hBWkHFGEwn2yVSXR5FqScKqqDW3nHLLzAtEB2IJKCPDDgOLcMnhiOy6QS
	 44viI5uimoIKEgcLcRntI4yjrGbI71f9X2bXBJ3vVBPiiZ7WIr7JjJDhEzgq3mYO6epl/
	 gihuELLSb1vXSA1lqcnYAWa450cH0pQYskqJzL3WxGrqxjd/kOHujIzsrYrHbYJk1+G17
	 pONBRh/26KbBbKHhOHm8VkF/zAcDomrX3Tv+1WqlfEe0CknPkcZxtlJC76QOU+BDdDA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="J/8XnDkf";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.48
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 210FB606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 21:43:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 210FB606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=J/8XnDkf
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5be4b61fd3dso991602e87.3
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 14:43:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792791801; cv=none;
        d=google.com; s=arc-20260327;
        b=Hm+2LB6CZBPIx3y3LaL7SeH2T1xQCSeY4Xg+oyNoTmA+/YcIDFF26RmwcZnpNscKXC
         +pYVCe+SYjzC2w4EWzLg1DBAK4KzcZWLQduu+Dtmwtt3b7kT/kQiTHU5FsD0thlosepX
         OSuuIdLDFI86ljSuiO/V/mDS13li2Lw/21lo6rV+r0e4BHTXcRusSXAPVk7w9g8DKvCn
         wEOhkL+mMPrZlrKrV0kqcsUYkW8+arKSrjkNTnM0PEiHkD4qKGwsoULiOGZf1pEUlZM8
         TJwRIBOF71T4fNNCZ9uQRAoMKpuchblI7Nw+u2cajvktKc2SRxO2jeDV55VtjWIcMto0
         wayA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+2woRkBBQBE5HI2ydQVoR214az945NliSXR+nIMmfOw=;
        fh=sPilOYAT4QfMgYxGH2LjRrcqbLUzvrQqMQUicHZMufQ=;
        b=hWKFf0UDs9ZKWIqMbdFnxkz2WOOBzp5KwEznom9oqqpIRSCjA+AAPvkq2q1rCuhjBk
         nkRAEgro7D3TrQFLfpvb3aiYacrG7aXQDsYlv4N699lg22gzMN+TziLt9prSXW0XPILi
         NcYBHf1sX5Hm3VKwUTblGuiprEVEOkWBr7WhOguO8VBC4L8Bmy8oGq75mVeBta3LjRvk
         WkSPCzX2PE3Tra4ltdwlsLhIrODT316KfBR+ORJxjL2uYbEjV4M5/dDiXmw4MzTten3h
         UH+YalhyupkkCkWzGjMYAQHO5F/EKiRnjCbztD8rjTfA5K4T13K/vgdLMMPAYAB8ni5f
         ry2Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792791801; x=1793396601; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+2woRkBBQBE5HI2ydQVoR214az945NliSXR+nIMmfOw=;
        b=J/8XnDkfSE3OhAi+ozIWJt2QyF1tgV3YHzv+yX7igmIkb89fLSQD/gkw2DtFbUHRtl
         Jo2oIWzKP+T85oZqc/4JPLqIYp1pNn+2BybGr4DX97lg8fkAJvsZRjbYicW20gIW6xjj
         8uppUUYv290hKPpMwlSp8TLGml1X1ZCWUrnDowRBCPE5Pw+ZhMM+P/xc0/R/rYdpfzEF
         HprKhF+SjGxaUtOupU7hT72MqHzoKfT9WE8Z5DxZVGyNmFqhIp3VMEM0Dr0uFAsPHFqo
         3TUc9YuBxHDQSDQ9xgxeZm3R4B5jRUQUezumyVm/s67mfpO84zhExyobqZj7/Z1uAh05
         8XDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792791801; x=1793396601;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+2woRkBBQBE5HI2ydQVoR214az945NliSXR+nIMmfOw=;
        b=sfGd3WH6RxN24sa3b/H3d53sIqqcW+an0FrmrMzKWQ6nSuP0JdJ+2815I3UTJheOBq
         OlMk7cOXJ3N51oaE+zMrESQe7/0KEtDG4PHzDIWafexKSUiLB+p8joJLWYJPVRILeXwU
         PDMZUkXYbwMkB/K/uqxgY51bhrc/sMY+YkEyFPJwdHAFtxaOsX0N7OCrYrYCn5p/10vI
         lEFUZz/grgQnfIFXzXMo/HGRA08nPlSyF2X4dnCYkYRW21f8l5Er+7AGuJTxt6ojWKoX
         6JSiELzPEh8R819FfEneqkEDZc1G9zkBsX0aqKhuo7t0oKTac4d0Q2yyiLPYQ2eGGo7m
         hSFg==
X-Gm-Message-State: AFq9FYJ3LSJMfqsurS/JiCcqgSLJYw/Mfd7K3qEauqdCDn+qrPdcDQXw
	sB0+9q2AX1AvxnE2nISqBawr4nNnUEDGhlIbTqO6237iJc0YimEZkdROea5xRueDIYbBksm3aKh
	fyqU1uY+FsoMCZjA7Zu+20TokfwB/qSU=
X-Gm-Gg: AYBFou2NYvDEKdq9+u701XiZkQCStUDtmNuBsIDwBKX4Fm0lOlJ1t/5mEk1kDE2Ubu6
	0L7ApK4bw90xmQhTUAH0ggkpdDOSNg6or+l3kC7nz8+uHrLsbdn7kyK1BbXTjpq9H+56cP84dYC
	lVL1AcpQ56ZTa7Yeh33Xm+iD+z9LPiUcpbvjGRcmdSdtCu3Gt2pF/EwrTnJOOyyrEgRhy6YUNHY
	DBxSVnGbT1g9hhIlGZ6EMZR91/UV3X2ejpyT6/N5ru0q8B8r4TKPe9j66H3JKBLtmC67EclEyYe
	okyZo1YOu2y8Awd3ENi/sT5/ifPwf3fEIrOLbhENOBs0BgOc5codHXEeJ/ICNip4V+OkoMxg0FI
	FKrqKnteuOUngYM47f2DdCrhy00J8kspx3c+Qt96Si+afRJmj/Bz835oOQJIB7UKpdMDAz7BDV7
	n2LZzrUIj1+Hn1T3W0UnMQcpe7M8c=
X-Received: by 2002:a05:6512:3188:b0:5bc:cec9:59bd with SMTP id
 2adb3069b0e04-5bfb71bcd2emr124625e87.36.1792791800877; Fri, 23 Oct 2026
 14:43:20 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261023023118.3460118-1-daeho43@gmail.com> <3617b48e-513f-418f-be0a-bf9d08d4ac60@kernel.org>
In-Reply-To: <3617b48e-513f-418f-be0a-bf9d08d4ac60@kernel.org>
From: Daeho Jeong <daeho43@gmail.com>
Date: Fri, 23 Oct 2026 14:43:08 -0700
X-Gm-Features: AclHuK8xev6douPgEc_qqx7YLaciCs8P-tZp6oGbd91oOF0gbQQG81Yo6dbSZnw
Message-ID: <CACOAw_x5utRe3C3PrgYsW7Wf0fjF=XxSd3jUv0B9TNgZXOJPJQ@mail.gmail.com>
Subject: Re: [f2fs-dev] [PATCH] f2fs: flush devices when a sync checkpoint is skipped
To: Chao Yu <chao@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net, 
	kernel-team@android.com, Daeho Jeong <daehojeong@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 22, 2026 at 8:02=E2=80=AFPM Chao Yu <chao@kernel.org> wrote:
>
> On 10/23/26 10:31, Daeho Jeong wrote:
> > From: Daeho Jeong <daehojeong@google.com>
> >
> > When fsync needs a checkpoint, f2fs_do_sync_file() writes and waits for
> > the file data and then relies on the checkpoint to flush the device
> > write caches. syncfs works the same way through f2fs_sync_fs(). But
> > f2fs_write_checkpoint() skips a CP_SYNC or CP_FASTBOOT checkpoint
> > without any flush when SBI_IS_DIRTY is clear.
> >
> > That can happen even though the data was just written. A checkpoint
> > does not wait for F2FS_WB_DATA writes, so another checkpoint can commit
> > the new block addresses of the file while its data writes are still in
> > flight, flush the devices before they complete, and clear SBI_IS_DIRTY.
> > The checkpoint requested by fsync is then skipped, and fsync returns
> > while the data may still be in a volatile write cache. After a power
> > cut, the file points to blocks that were never persisted.
> >
> > Flush the write caches of all devices when a sync checkpoint is skipped=
.
> >
> > This was found by generic/455 with compression enabled for all files,
> > where every fsync goes through a checkpoint. On a 4KB page kernel, 3 of
> > 100 runs lost fsynced blocks without this patch and none of 100 runs di=
d
> > with it.
>
> Seems we only find this issue on compressed file, can we fix compression
> case only? If compression is disable, it will issue unnecessary preflush
> during syncfs?
>
> Maybe we can add a reference count to track writebacked compressed page.
>
> - increase it during writeback
> - decrease it in write_end_io
> - in f2fs_write_checkpoint
>   - skip if it's zero
>   - otherwise, wait it to be zero & issue flush
>
> Thoughts?

Hi Chao,

It is not specific to compression. Compressed writes are F2FS_WB_CP_DATA,
but the raw clusters of a compressed file and all other regular file data
are F2FS_WB_DATA, which a checkpoint does not wait for. fsync also goes
through a checkpoint for many other reasons in need_do_checkpoint()
(hardlinks, non-regular files, SBI_NEED_CP, fastboot, ...), and syncfs
always does. Compression just makes every fsync take that path, so
generic/455 hits it often.

I also checked it without compression: generic/455 with -o fastboot, which
makes every fsync go through a checkpoint as well, lost fsynced data in
6 of 100 runs without this patch and none of 100 runs with it.

You're right that a syncfs on a clean filesystem now issues one flush,
where it issued none before. SBI_IS_DIRTY cannot tell whether some data
completed after the last checkpoint flushed the devices, so a skipped
checkpoint cannot know whether the flush is needed. I think the cost is
mitigated, since it occurs, only when a sync checkpoint is
skipped. ext4_sync_fs() does the same: it sends a flush whenever the
journal commit will not, as data writeback can happen without a
transaction.

If you still want to avoid that flush, we can track whether any write
completed after the last flush:
- set a flag in the write end_io, f2fs_write_end_bio() and the direct IO
completion,
- clear it right before the checkpoint issues its flush,
- and flush in a skipped CP_SYNC/CP_FASTBOOT checkpoint only when the flag
is set.

Then a syncfs with nothing written does not flush. The downside is that
every write completion path has to set the flag, and missing one brings
the data loss back silently. Please let me know what you prefer.

>
> >
> > Signed-off-by: Daeho Jeong <daehojeong@google.com>
> > ---
> >   fs/f2fs/checkpoint.c | 18 ++++++++++++++----
> >   fs/f2fs/f2fs.h       |  1 +
> >   fs/f2fs/segment.c    | 17 +++++++++++++++++
> >   3 files changed, 32 insertions(+), 4 deletions(-)
> >
> > diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
> > index 1ed38c668fc..158d97fc349 100644
> > --- a/fs/f2fs/checkpoint.c
> > +++ b/fs/f2fs/checkpoint.c
> > @@ -1973,10 +1973,20 @@ int f2fs_write_checkpoint(struct f2fs_sb_info *=
sbi, struct cp_control *cpc)
> >
> >       stat_cp_time(cpc, CP_TIME_LOCK);
> >
> > -     if (!is_sbi_flag_set(sbi, SBI_IS_DIRTY) &&
> > -             ((cpc->reason & CP_FASTBOOT) || (cpc->reason & CP_SYNC) |=
|
> > -             ((cpc->reason & CP_DISCARD) && !sbi->discard_blks)))
> > -             goto out;
> > +     if (!is_sbi_flag_set(sbi, SBI_IS_DIRTY)) {
> > +             if (cpc->reason & (CP_FASTBOOT | CP_SYNC)) {
> > +                     /*
> > +                      * The data that fsync or syncfs waited for may h=
ave
> > +                      * completed after the last checkpoint flushed th=
e
> > +                      * devices, and that checkpoint may already point=
 to
> > +                      * it, so flush the devices.
> > +                      */
> > +                     err =3D f2fs_flush_all_devices(sbi);
> > +                     goto out;
> > +             }
> > +             if ((cpc->reason & CP_DISCARD) && !sbi->discard_blks)
> > +                     goto out;
> > +     }
> >       if (unlikely(f2fs_cp_error(sbi))) {
> >               err =3D -EIO;
> >               goto out;
> > diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> > index 1f9bd8e3b52..a4a38818988 100644
> > --- a/fs/f2fs/f2fs.h
> > +++ b/fs/f2fs/f2fs.h
> > @@ -4265,6 +4265,7 @@ void f2fs_balance_fs_bg(struct f2fs_sb_info *sbi,=
 bool from_bg);
> >   int f2fs_issue_flush(struct f2fs_sb_info *sbi, nid_t ino);
> >   int f2fs_create_flush_cmd_control(struct f2fs_sb_info *sbi);
> >   int f2fs_flush_device_cache(struct f2fs_sb_info *sbi);
> > +int f2fs_flush_all_devices(struct f2fs_sb_info *sbi);
> >   void f2fs_destroy_flush_cmd_control(struct f2fs_sb_info *sbi, bool fr=
ee);
> >   void f2fs_invalidate_blocks(struct f2fs_sb_info *sbi, block_t addr,
> >                                               unsigned int len);
> > diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> > index 06fb92fc847..5b015cf9071 100644
> > --- a/fs/f2fs/segment.c
> > +++ b/fs/f2fs/segment.c
> > @@ -822,6 +822,23 @@ int f2fs_flush_device_cache(struct f2fs_sb_info *s=
bi)
> >       return ret;
> >   }
> >
> > +/*
> > + * Flush the write caches of all devices, regardless of which ones rec=
eived
> > + * writes since the last checkpoint.
> > + */
> > +int f2fs_flush_all_devices(struct f2fs_sb_info *sbi)
>
> I guess there is an existing function f2fs_flush_device_cache(), I feel w=
e'd
> better reuse it to avoid missing any functionality inside it, right?

It only works for multiple devices, skips device 0, which the checkpoint
commit block normally flushes, and relies on the dirty_device bits that
the previous checkpoint has already cleared in this case. But you're right
that the new helper misses the retry and the f2fs_stop_checkpoint() on
failure. I'll extend f2fs_flush_device_cache() to flush all devices for
this case in v2.

Thanks,

>
> Thanks,
>
> > +{
> > +     int ret, i;
> > +
> > +     if (test_opt(sbi, NOBARRIER))
> > +             return 0;
> > +
> > +     ret =3D __submit_flush_wait(sbi, sbi->sb->s_bdev);
> > +     for (i =3D 1; !ret && i < sbi->s_ndevs; i++)
> > +             ret =3D __submit_flush_wait(sbi, FDEV(i).bdev);
> > +     return ret;
> > +}
> > +
> >   static void __locate_dirty_segment(struct f2fs_sb_info *sbi, unsigned=
 int segno,
> >               enum dirty_type dirty_type)
> >   {
>
