Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 446E83BB134
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 16:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789403116; cv=pass; b=ElfsKW7qyDal/36puY6v78jbORTGwi49NwA8Kaj9WvSUojAIaO38Qp78cXPtKn4GNmjIRSriSms6zZZ8OMKzqjtEfddIGdNwz7sG0ggsOgnYZ27GGmFUoWuoGdAgRGtxmHeJriY5f15dDgXXN9nLEk2IpHYHqmGa9+kJ1/UjgAk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789403116; c=relaxed/simple;
	bh=ufGG5dr49wOfW2jA/+fInfuYm0+wPX7PxyHeKn7lX3g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hAM+fRghOdIeDxfQxzoONSNbEfIDG0HTgaGtuiylnNQV7DQ8N+dWhkm1bdalkOGh4DHVzXO/e85A4jIBYJ8dOncY0nqSC0VKQ/PjicTYanWw/2+hW7AFjsJODUlmiP+44afRpQH3OvEqN3rUbNd2v7KKSJSjPbE3ChFZQeHN2HA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TV2erqA/; arc=pass smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TV2erqA/"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5b6188a2c0eso3127417e87.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 09:25:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789403112; cv=none;
        d=google.com; s=arc-20260327;
        b=s2Slqul9CYSBBcUyABQ0Pllu1n2id2tSJ4YZb9hArbyNv6DT47xc5mZBgZQdrPYaHf
         /cFf49TlGs5dzlpDWw+2iVjYv36tmUoXs5wOQsja6xHx8pAWtFFn3uabgkZdlqppavw9
         z8hAGB9PlWsdfWks6l2mUzxdZEvAqDsZje1gQ2PYGqk6i/mU4xzblzBAq1viLuula58e
         7TN+hoKnn8HgfW2t5QqMtmzs464VGDvELKmHt221tSVDdt8pNGIM7iYBIPfiQHjdoATw
         XnqEoM4m0y5HaXQpB3I6WhA8KgE2B69oZoF1kbaiQsv6zJLi9b4Cxua8IRBOInAwnKh9
         IFTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HfDIh5D8fZpOMMs8FBy/CHDMZduq98lfE9kT+1pcKmc=;
        fh=sPilOYAT4QfMgYxGH2LjRrcqbLUzvrQqMQUicHZMufQ=;
        b=dvjs0xQwlA0gA6k7MHy6iJrQQ/02fRXZdLNZ8j4gApzPQT6BqZe5mdOwmojJosocj2
         QAr2j2YqHT+ESKeLRJBwhBGGjZ4MbdC3sdlAf/D8hhblQEJE5evWYQ/foubctaDmmlNa
         lJTeseW2uZbrHyHKBzA6HWqUOuwHReSITW+4+tvWkn6G4pld4g8vcq/B3rfW0fY4oi5p
         meotDdEwMlm3E6pskRPFvNRPSFWtVuIZBOoIDaqmm/jUXNeHa0PniiO+7ijpRfaJcL5u
         dxcUrHpjhz35EQWp5WA4EtC7J/tiRv05NlHbjkzQ/p5Vk+wBPHo+eCR9xz01xbxLOyol
         unJQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789403112; x=1790007912; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HfDIh5D8fZpOMMs8FBy/CHDMZduq98lfE9kT+1pcKmc=;
        b=TV2erqA/MS2klHjRylANWnrZBPJ2VHz0QF3PKkr/zMz9ccLpliclwzulH35SfELvcd
         vro3ok20bG77uUnxrledMUrHMcJwSUGIMfz0iSZ0M+HGShTNd1KdKdIIJgMiRIOg4AAL
         B7HcWOMa9D29jHxZTQHbB0x56MaT7wcVRyqnhDjDBF0pGGAeYZpFCLJamkjNW4+D4F09
         wUbyk0lCeDT6P4LF4XAF1GRd948omOl9iOW0+WJKItj8nAXMaNu09Q+w0ctSVgrGUIy2
         y7PvFCIndDVGMFJ7bLyQTWdSSQHcyY409Mnr2f/hId00nKDoLz3trerLv2d47N1J9EIy
         FdkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789403112; x=1790007912;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HfDIh5D8fZpOMMs8FBy/CHDMZduq98lfE9kT+1pcKmc=;
        b=QXUNwpe+Rq4jYd8637u0gJdBPGaR5OT/Daa6qqxijgrSQa2er/h2IUK0HoLSuxY4ni
         GqwRqRFV0LM8XiKLrSD4rje5SrNSllt9KtDrI9NyX1V/qMN+pO1FAPiyFsJzvG5ke0A4
         Si3HSxqlYfQQSdJmixzUHxqz/028texzcDHn7Z+mxWgOyJKkBoWyuxYkNXsPvHeGKmjt
         I8vH3l12bt3ivTvOv0XuEPJVEuxwn8wH19XqB3kcN04WWZiaja67KXydBgCApsVcR9Yc
         CF3viawcO0GkJ3mcAyRVLpLQV2+5PUY2lUGiiqNZp5ENYTsfi+NlI0LBEaDJkeyNyk2Y
         31+g==
X-Gm-Message-State: AFuF++khv5orVuwjAJUI0YQDY5G1dWIy2s2Ftj90wOOzgy51lZiQDvx/
	82URRlAG0LNPxVXkAskmLML/csfay9vE2ZdAZ5NK+nr0VNo2l7AWHWhBf5ije+OR+ppt6LB8AVQ
	W1zQLX6o+pz0KLCGduJ5aDQ2O27DLETo=
X-Gm-Gg: AYBFou142Be4o6KN9d64keSo64SfbhuBljrgsPsK/xgvuAy6EVJEKGjNDQsZ6li/X+F
	KMFctfYAq9VAnRDYaImPhX3BbBHDrX0dsuYaN4pWXAq9fKqhIaFSRU70NFSIi9FF+D9nPQUlrsN
	QUnxjCBB3d+zqXO32G3L3VbSVQdvOup7Sm4s3F0PoMr/N1YXFETN2c5+Vd9SGbdy0fmdfN661dt
	MvAPCpBr9BZzJNk/pVJqhZb80l+gRT70+gWp8OsEgq5cWgYyhz8YOO5E8rUOUue+5msJA7y4pFw
	OuEd09aOouDrzLWspntfxzKLem93lnU7dLpjAjJJAiYSwVLmWk+GJ67ANmjhHQRbbHSUc+MSVJ1
	5nH081bseTakximjNIhhy+N/TuN1lMGJxK0St4cNyViqN
X-Received: by 2002:ac2:5687:0:b0:5b6:1a7c:fd92 with SMTP id
 2adb3069b0e04-5b8ae6a593amr943065e87.56.1789403111667; Mon, 14 Sep 2026
 09:25:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260911143549.909867-1-daeho43@gmail.com> <20260911143549.909867-2-daeho43@gmail.com>
 <3e5f2bd4-f0e6-4f79-b182-6cb8ac331580@kernel.org>
In-Reply-To: <3e5f2bd4-f0e6-4f79-b182-6cb8ac331580@kernel.org>
From: Daeho Jeong <daeho43@gmail.com>
Date: Mon, 14 Sep 2026 09:24:56 -0700
X-Gm-Features: AcwNN1WfiHKQcRpLaOrkV_m1es-yDtZWz0khGeDUgMcPFpyqu1EjatV_T-CqTos
Message-ID: <CACOAw_zJGF5GnJoxMWSAH2yXYFKBmo6mXCamdTixyN+pDp+5Hg@mail.gmail.com>
Subject: Re: [f2fs-dev] [PATCH v2 2/2] f2fs: introduce reserve_shrink mount
 option for filesystem shrinkage
To: Chao Yu <chao@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net, 
	kernel-team@android.com, Daeho Jeong <daehojeong@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 14, 2026 at 12:15=E2=80=AFAM Chao Yu <chao@kernel.org> wrote:
>
> On 9/11/26 22:35, Daeho Jeong wrote:
> > From: Daeho Jeong <daehojeong@google.com>
> >
> > When preparing for subsequent online filesystem shrinkage (e.g., during
> > partition resizing or FOTA updates), sufficient free space must be
> > preserved so that valid data blocks can be evacuated and the filesystem
> > can safely shrink.
> >
> > Existing reserve_root cannot prevent space exhaustion by privileged roo=
t
> > processes (such as OTA updaters, package managers, and system daemons
> > running with CAP_SYS_RESOURCE), which can allocate blocks from the root
> > reserve and lead to resize failures due to lack of space. Moreover,
>
> I'm thinking about reusing existing mount option AMAP, is there any probl=
em
> to use "reserve_root=3D" w/ 128mb+shrunk_size_mb when we execute online f=
ilesyste
> shrinkage? once it is done, recover w/ reserve_root=3D128mb.
>
> > runtime configurable reserved_blocks represents permanent GC and metada=
ta
> > headroom that must persist after resize, which would cause double-count=
ing
> > if inflated for shrinkage.
>
> I didn't get it, can you please explain a bit more about this issue?
>
> Thanks,

Hi Chao,

There are three main reasons why reserve_root cannot be reused:

1. Double-counting in f2fs_resize_fs():
f2fs_resize_fs() checks:
  shrunk_blocks + valid_user_blocks + root_reserved_blocks + ... >
user_block_count
Since root_reserved_blocks must persist after
resize, inflating it by shrunk_size causes shrunk_size to be counted twice,
requiring 2x free space and triggering false -ENOSPC. Resetting it right be=
fore
resize also introduces a race window where concurrent writes can
consume the space.
2. Root can allocate from reserve_root:
reserve_root allows root/CAP_SYS_RESOURCE processes to allocate. During OTA=
,
system daemons and updaters can eat into the reserved blocks.
reserve_shrink strictly blocks all callers, including root.

Thanks,
Daeho

>
> >
> > To resolve this, introduce a dedicated reserve_shrink=3D<blocks>
> > mount option:
> > 1. Symmetrically mirrors reserve_root=3D<blocks> in block units to
> >     pre-reserve space specifically for subsequent filesystem shrinkage.
> > 2. In get_available_block_count(), unconditionally deducts
> >     reserve_shrink_blocks for all callers, strictly rejecting all
> >     allocations (including root / CAP_SYS_RESOURCE) once available bloc=
ks
> >     are exhausted.
> > 3. In f2fs_statfs(), deducts reserve_shrink_blocks from f_bfree (and
> >     f_bavail) so that filesystem statistics accurately reflect usable s=
pace.
> > 4. In f2fs_resize_fs(), automatically resets reserve_shrink_blocks to 0
> >     and clears F2FS_MOUNT_RESERVE_SHRINK upon successful shrink complet=
ion,
> >     releasing any remaining reservation.
> > 5. In sysfs: reserved_blocks, subtracts reserve_shrink_blocks when
> >     validating the upper limit of configurable reserved blocks.
> >
> > Signed-off-by: Daeho Jeong <daehojeong@google.com>
> > ---
> > v2:
> >   - Split out mount option bitmask expansion (BIT_ULL) into a separate
> >     prerequisite patch (Patch 1/2).
> > ---
> >   Documentation/filesystems/f2fs.rst |  7 +++++
> >   fs/f2fs/f2fs.h                     |  9 ++++++
> >   fs/f2fs/gc.c                       |  5 ++++
> >   fs/f2fs/super.c                    | 47 +++++++++++++++++++++++++++++=
+
> >   fs/f2fs/sysfs.c                    | 13 +++++++--
> >   5 files changed, 79 insertions(+), 2 deletions(-)
> >
> > diff --git a/Documentation/filesystems/f2fs.rst b/Documentation/filesys=
tems/f2fs.rst
> > index 771216f45207..dbdc5d5a83ad 100644
> > --- a/Documentation/filesystems/f2fs.rst
> > +++ b/Documentation/filesystems/f2fs.rst
> > @@ -191,6 +191,13 @@ reserve_node=3D%d           Support configuring re=
served nodes which are used for
> >                        gid, the default limit is 12.5% of all nodes.
> >   resuid=3D%d            The user ID which may use the reserved blocks =
and nodes.
> >   resgid=3D%d            The group ID which may use the reserved blocks=
 and nodes.
> > +reserve_shrink=3D%d     Support pre-reserving space for subsequent fil=
esystem
> > +                      shrinkage (e.g. during partition resizing or FOT=
A),
> > +                      unit: blocks. Unlike reserve_root, allocations f=
rom
> > +                      this reserved space strictly reject all callers
> > +                      (including root / CAP_SYS_RESOURCE). Once the
> > +                      filesystem is successfully shrunk via resize, th=
is
> > +                      value is automatically reset to 0.
> >   fault_injection=3D%d   Enable fault injection in all supported types =
with
> >                        specified injection rate.
> >   fault_type=3D%d                Support configuring fault injection ty=
pe, should be
> > diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> > index 4aaf29de3f6f..48a91771be95 100644
> > --- a/fs/f2fs/f2fs.h
> > +++ b/fs/f2fs/f2fs.h
> > @@ -145,6 +145,7 @@ enum f2fs_mount_opt {
> >        */
> >       F2FS_MOUNT_LAZYTIME,
> >       F2FS_MOUNT_RESERVE_NODE,
> > +     F2FS_MOUNT_RESERVE_SHRINK,
> >   };
> >
> >   #define F2FS_OPTION(sbi)    ((sbi)->mount_opt)
> > @@ -226,6 +227,7 @@ struct f2fs_mount_info {
> >       unsigned long long opt;
> >       block_t root_reserved_blocks;   /* root reserved blocks */
> >       block_t root_reserved_nodes;    /* root reserved nodes */
> > +     block_t reserve_shrink_blocks;  /* reserve blocks for shrink */
> >       kuid_t s_resuid;                /* reserved blocks for uid */
> >       kgid_t s_resgid;                /* reserved blocks for gid */
> >       int active_logs;                /* # of active logs */
> > @@ -2658,6 +2660,13 @@ static inline unsigned int get_available_block_c=
ount(struct f2fs_sb_info *sbi,
> >       if (test_opt(sbi, RESERVE_ROOT) && !__allow_reserved_root(sbi, in=
ode, cap))
> >               avail_user_block_count -=3D F2FS_OPTION(sbi).root_reserve=
d_blocks;
> >
> > +     if (test_opt(sbi, RESERVE_SHRINK)) {
> > +             if (avail_user_block_count > F2FS_OPTION(sbi).reserve_shr=
ink_blocks)
> > +                     avail_user_block_count -=3D F2FS_OPTION(sbi).rese=
rve_shrink_blocks;
> > +             else
> > +                     avail_user_block_count =3D 0;
> > +     }
> > +
> >       if (unlikely(is_sbi_flag_set(sbi, SBI_CP_DISABLED))) {
> >               if (avail_user_block_count > sbi->unusable_block_count)
> >                       avail_user_block_count -=3D sbi->unusable_block_c=
ount;
> > diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
> > index bc22dde1cb30..556c4793478d 100644
> > --- a/fs/f2fs/gc.c
> > +++ b/fs/f2fs/gc.c
> > @@ -2492,6 +2492,11 @@ int f2fs_resize_fs(struct file *filp, __u64 bloc=
k_count)
> >               spin_lock(&sbi->stat_lock);
> >               sbi->user_block_count +=3D shrunk_blocks;
> >               spin_unlock(&sbi->stat_lock);
> > +     } else if (test_opt(sbi, RESERVE_SHRINK)) {
> > +             spin_lock(&sbi->stat_lock);
> > +             F2FS_OPTION(sbi).reserve_shrink_blocks =3D 0;
> > +             clear_opt(sbi, RESERVE_SHRINK);
> > +             spin_unlock(&sbi->stat_lock);
> >       }
> >   out_err:
> >       f2fs_up_write_trace(&sbi->cp_global_sem, &clc);
> > diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> > index a5e109bdcebc..58f33750b2a8 100644
> > --- a/fs/f2fs/super.c
> > +++ b/fs/f2fs/super.c
> > @@ -196,6 +196,7 @@ enum {
> >       Opt_data_flush,
> >       Opt_reserve_root,
> >       Opt_reserve_node,
> > +     Opt_reserve_shrink,
> >       Opt_resgid,
> >       Opt_resuid,
> >       Opt_mode,
> > @@ -328,6 +329,7 @@ static const struct fs_parameter_spec f2fs_param_sp=
ecs[] =3D {
> >       fsparam_flag("data_flush", Opt_data_flush),
> >       fsparam_u32("reserve_root", Opt_reserve_root),
> >       fsparam_u32("reserve_node", Opt_reserve_node),
> > +     fsparam_u32("reserve_shrink", Opt_reserve_shrink),
> >       fsparam_gid("resgid", Opt_resgid),
> >       fsparam_uid("resuid", Opt_resuid),
> >       fsparam_enum("mode", Opt_mode, f2fs_param_mode),
> > @@ -407,6 +409,7 @@ static match_table_t f2fs_checkpoint_tokens =3D {
> >   #define F2FS_SPEC_lookup_mode                       (1 << 24)
> >   #define F2FS_SPEC_reserve_node                      (1 << 25)
> >   #define F2FS_SPEC_resizable_tail_secno              (1 << 26)
> > +#define F2FS_SPEC_reserve_shrink             (1 << 27)
> >
> >   struct f2fs_fs_context {
> >       struct f2fs_mount_info info;
> > @@ -550,6 +553,27 @@ static inline void limit_reserve_root(struct f2fs_=
sb_info *sbi)
> >                                          F2FS_OPTION(sbi).s_resgid));
> >   }
> >
> > +static inline void limit_reserve_shrink(struct f2fs_sb_info *sbi)
> > +{
> > +     block_t block_limit;
> > +
> > +     if (!test_opt(sbi, RESERVE_SHRINK))
> > +             return;
> > +
> > +     block_limit =3D sbi->user_block_count - sbi->reserved_blocks;
> > +     if (test_opt(sbi, RESERVE_ROOT)) {
> > +             if (block_limit > F2FS_OPTION(sbi).root_reserved_blocks)
> > +                     block_limit -=3D F2FS_OPTION(sbi).root_reserved_b=
locks;
> > +             else
> > +                     block_limit =3D 0;
> > +     }
> > +     if (F2FS_OPTION(sbi).reserve_shrink_blocks > block_limit) {
> > +             F2FS_OPTION(sbi).reserve_shrink_blocks =3D block_limit;
> > +             f2fs_info(sbi, "Reduce reserved blocks for shrink =3D %u"=
,
> > +                       F2FS_OPTION(sbi).reserve_shrink_blocks);
> > +     }
> > +}
> > +
> >   static inline void adjust_unusable_cap_perc(struct f2fs_sb_info *sbi)
> >   {
> >       if (!F2FS_OPTION(sbi).unusable_cap_perc)
> > @@ -953,6 +977,14 @@ static int f2fs_parse_param(struct fs_context *fc,=
 struct fs_parameter *param)
> >               F2FS_CTX_INFO(ctx).root_reserved_nodes =3D result.uint_32=
;
> >               ctx->spec_mask |=3D F2FS_SPEC_reserve_node;
> >               break;
> > +     case Opt_reserve_shrink:
> > +             if (result.uint_32)
> > +                     ctx_set_opt(ctx, F2FS_MOUNT_RESERVE_SHRINK);
> > +             else
> > +                     ctx_clear_opt(ctx, F2FS_MOUNT_RESERVE_SHRINK);
> > +             F2FS_CTX_INFO(ctx).reserve_shrink_blocks =3D result.uint_=
32;
> > +             ctx->spec_mask |=3D F2FS_SPEC_reserve_shrink;
> > +             break;
> >       case Opt_resuid:
> >               F2FS_CTX_INFO(ctx).s_resuid =3D result.uid;
> >               ctx->spec_mask |=3D F2FS_SPEC_resuid;
> > @@ -1775,6 +1807,9 @@ static void f2fs_apply_options(struct fs_context =
*fc, struct super_block *sb)
> >       if (ctx->spec_mask & F2FS_SPEC_reserve_node)
> >               F2FS_OPTION(sbi).root_reserved_nodes =3D
> >                                       F2FS_CTX_INFO(ctx).root_reserved_=
nodes;
> > +     if (ctx->spec_mask & F2FS_SPEC_reserve_shrink)
> > +             F2FS_OPTION(sbi).reserve_shrink_blocks =3D
> > +                                     F2FS_CTX_INFO(ctx).reserve_shrink=
_blocks;
> >       if (ctx->spec_mask & F2FS_SPEC_resgid)
> >               F2FS_OPTION(sbi).s_resgid =3D F2FS_CTX_INFO(ctx).s_resgid=
;
> >       if (ctx->spec_mask & F2FS_SPEC_resuid)
> > @@ -2300,6 +2335,13 @@ static int f2fs_statfs(struct dentry *dentry, st=
ruct kstatfs *buf)
> >       buf->f_bfree =3D user_block_count - valid_user_blocks(sbi) -
> >                                               sbi->current_reserved_blo=
cks;
> >
> > +     if (test_opt(sbi, RESERVE_SHRINK)) {
> > +             if (buf->f_bfree > F2FS_OPTION(sbi).reserve_shrink_blocks=
)
> > +                     buf->f_bfree -=3D F2FS_OPTION(sbi).reserve_shrink=
_blocks;
> > +             else
> > +                     buf->f_bfree =3D 0;
> > +     }
> > +
> >       if (unlikely(buf->f_bfree <=3D sbi->unusable_block_count))
> >               buf->f_bfree =3D 0;
> >       else
> > @@ -2524,6 +2566,9 @@ static int f2fs_show_options(struct seq_file *seq=
, struct dentry *root)
> >                                       F2FS_OPTION(sbi).s_resuid),
> >                               from_kgid_munged(&init_user_ns,
> >                                       F2FS_OPTION(sbi).s_resgid));
> > +     if (test_opt(sbi, RESERVE_SHRINK))
> > +             seq_printf(seq, ",reserve_shrink=3D%u",
> > +                             F2FS_OPTION(sbi).reserve_shrink_blocks);
> >   #ifdef CONFIG_F2FS_FAULT_INJECTION
> >       if (test_opt(sbi, FAULT_INJECTION)) {
> >               seq_printf(seq, ",fault_injection=3D%u",
> > @@ -3105,6 +3150,7 @@ static int __f2fs_remount(struct fs_context *fc, =
struct super_block *sb)
> >
> >       adjust_pinned_area_boundary(sbi);
> >       limit_reserve_root(sbi);
> > +     limit_reserve_shrink(sbi);
> >       fc->sb_flags =3D (flags & ~SB_LAZYTIME) | (sb->s_flags & SB_LAZYT=
IME);
> >
> >       sbi->umount_lock_holder =3D NULL;
> > @@ -5322,6 +5368,7 @@ static int f2fs_fill_super(struct super_block *sb=
, struct fs_context *fc)
> >       sbi->current_reserved_blocks =3D 0;
> >       sbi->alias_reserved_blocks =3D 0;
> >       limit_reserve_root(sbi);
> > +     limit_reserve_shrink(sbi);
> >       adjust_unusable_cap_perc(sbi);
> >
> >       f2fs_init_extent_cache_info(sbi);
> > diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
> > index aaca9ed9b169..d61940d095b4 100644
> > --- a/fs/f2fs/sysfs.c
> > +++ b/fs/f2fs/sysfs.c
> > @@ -591,9 +591,18 @@ static ssize_t __sbi_store(struct f2fs_attr *a,
> >       }
> >   #endif
> >       if (a->struct_type =3D=3D RESERVED_BLOCKS) {
> > +             unsigned long limit;
> > +
> >               spin_lock(&sbi->stat_lock);
> > -             if (t > (unsigned long)(sbi->user_block_count -
> > -                             F2FS_OPTION(sbi).root_reserved_blocks)) {
> > +             limit =3D sbi->user_block_count -
> > +                             F2FS_OPTION(sbi).root_reserved_blocks;
> > +             if (test_opt(sbi, RESERVE_SHRINK)) {
> > +                     if (limit > F2FS_OPTION(sbi).reserve_shrink_block=
s)
> > +                             limit -=3D F2FS_OPTION(sbi).reserve_shrin=
k_blocks;
> > +                     else
> > +                             limit =3D 0;
> > +             }
> > +             if (t > limit) {
> >                       spin_unlock(&sbi->stat_lock);
> >                       return -EINVAL;
> >               }
>
