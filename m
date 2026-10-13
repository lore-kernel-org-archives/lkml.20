Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02E531C84CB
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 01:27:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791854848; cv=none; b=jrxQAE0Tl5ITW7g2MkmVL/e6ElfZZx9Spg/hYtbCDa7MqDs+V7VWTXVXUgyCa23fLYSBoifgftPAdhuvZDlpiNN6D4BfLDVbT/lK/vz7GT2gTta2ZlFQNbb/pq1x8FsLASBgmoEGmsp7tute3Apv2UkqiNEYT18w7NOVsQ5gor4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791854848; c=relaxed/simple;
	bh=A9E3S33Sd0kwJMLNL0y7Kh/ZKVJW3UjIPpyHKvZx7fQ=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=JfEinz8LrGu3nr5Ab9K0Eehjp1n2CpcRQvi4yaNywe6ySvLUKbm63RunerYyF07xJvPLYMXZ+SvBFbZlEBZbbEvbGRSfAHubu7u2645WjKMEoR9ODGP4e7bR7SD5jqyAakOIw5sOozVdZypLcpWW2Tbd4raBamlRe13VS1tltCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZR/2ISBX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZR/2ISBX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F353F1F0089B;
	Tue, 13 Oct 2026 01:27:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791854846;
	bh=gspSJpx/eLuiH3OBgcFpNhZAp0zCuuNaHXA0SHBng08=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To;
	b=ZR/2ISBXSHLCTCKif91NgXfyTHuTptWNHglHl6MG5O+TlId3B/UKdlhgTMbJupSVd
	 owWpPEibV/qcMosseOc3RLTMw6lqOHjkEjQIVZh/5etww/ETxB16gI50U+lHEOIeZM
	 lfSpwoRpoSf3dNC0mKilS4T9npSkGwlpydaykTrQHfXszqtuQlgAtJj9MXk7BMS3QG
	 Ifden4bxAPkcLxabpH+9wuTYc3pP9MJL+4ZeqUjam7rqqN3F1ZCUcxrxCl8r86+7Pw
	 eDcsDiYG2P56ByiHz/7qEk0EIWB0UXK0PaWaOh1J8T5dpnhQE5uRedOVK/GFCa7P5J
	 qY7bGBQuARxjA==
Message-ID: <ad98fde8-0480-4585-806f-31c65bb623ab@kernel.org>
Date: Tue, 13 Oct 2026 09:27:22 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: chao@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, kernel-team@android.com,
 Daeho Jeong <daehojeong@google.com>
Subject: Re: [f2fs-dev] [PATCH v2 2/2] f2fs: introduce reserve_shrink mount
 option for filesystem shrinkage
To: Daeho Jeong <daeho43@gmail.com>
References: <20260911143549.909867-1-daeho43@gmail.com>
 <20260911143549.909867-2-daeho43@gmail.com>
 <3e5f2bd4-f0e6-4f79-b182-6cb8ac331580@kernel.org>
 <CACOAw_zJGF5GnJoxMWSAH2yXYFKBmo6mXCamdTixyN+pDp+5Hg@mail.gmail.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <CACOAw_zJGF5GnJoxMWSAH2yXYFKBmo6mXCamdTixyN+pDp+5Hg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 9/15/26 00:24, Daeho Jeong wrote:
> On Mon, Sep 14, 2026 at 12:15 AM Chao Yu <chao@kernel.org> wrote:
>>
>> On 9/11/26 22:35, Daeho Jeong wrote:
>>> From: Daeho Jeong <daehojeong@google.com>
>>>
>>> When preparing for subsequent online filesystem shrinkage (e.g., during
>>> partition resizing or FOTA updates), sufficient free space must be
>>> preserved so that valid data blocks can be evacuated and the filesystem
>>> can safely shrink.
>>>
>>> Existing reserve_root cannot prevent space exhaustion by privileged root
>>> processes (such as OTA updaters, package managers, and system daemons
>>> running with CAP_SYS_RESOURCE), which can allocate blocks from the root
>>> reserve and lead to resize failures due to lack of space. Moreover,
>>
>> I'm thinking about reusing existing mount option AMAP, is there any problem
>> to use "reserve_root=" w/ 128mb+shrunk_size_mb when we execute online filesyste
>> shrinkage? once it is done, recover w/ reserve_root=128mb.
>>
>>> runtime configurable reserved_blocks represents permanent GC and metadata
>>> headroom that must persist after resize, which would cause double-counting
>>> if inflated for shrinkage.
>>
>> I didn't get it, can you please explain a bit more about this issue?
>>
>> Thanks,
> 
> Hi Chao,
> 
> There are three main reasons why reserve_root cannot be reused:
> 
> 1. Double-counting in f2fs_resize_fs():
> f2fs_resize_fs() checks:
>    shrunk_blocks + valid_user_blocks + root_reserved_blocks + ... >
> user_block_count
> Since root_reserved_blocks must persist after
> resize, inflating it by shrunk_size causes shrunk_size to be counted twice,
> requiring 2x free space and triggering false -ENOSPC. Resetting it right before
> resize also introduces a race window where concurrent writes can
> consume the space.
> 2. Root can allocate from reserve_root:
> reserve_root allows root/CAP_SYS_RESOURCE processes to allocate. During OTA,
> system daemons and updaters can eat into the reserved blocks.
> reserve_shrink strictly blocks all callers, including root.

Daeho, sorry for the delay.

Thanks for the explanation, I see, it's not appropriate to reuse
"reserve_root=" option for your requirement.

May I ask that do you need to keep the reservation for a long time before resize,
e.g. from OTA starts till shrink happens? or is it enough to make it reserved
during f2fs_resize_fs()?

If the latter, can we just reserve shrunk_blocks in f2fs_resize_fs()
directly, w/ the same way we did for f2fs_ioc_reserve_dev_alias()? Then
we don't need a new mount option. Something like:

f2fs_resize_fs()
         spin_lock(&sbi->stat_lock);
         if (shrunk_blocks + valid_user_blocks(sbi) + ... > sbi->user_block_count)
             err = -ENOSPC;
         else
             sbi->resize_reserved_blocks += shrunk_blocks;
         spin_unlock(&sbi->stat_lock);

         free_segment_range(sbi, secs, true);
         ...
         freeze_super();
         ...
         spin_lock(&sbi->stat_lock);
         sbi->user_block_count -= shrunk_blocks;
         sbi->resize_reserved_blocks -= shrunk_blocks;
         spin_unlock(&sbi->stat_lock);
         ...
         /* error path: sbi->resize_reserved_blocks -= shrunk_blocks */

and in get_available_block_count(), deduct resize_reserved_blocks as we did for
alias_reserved_blocks, so that no one, including root, can allocate from the
reserved space during resize.

Thanks,

> 
> Thanks,
> Daeho
> 
>>
>>>
>>> To resolve this, introduce a dedicated reserve_shrink=<blocks>
>>> mount option:
>>> 1. Symmetrically mirrors reserve_root=<blocks> in block units to
>>>      pre-reserve space specifically for subsequent filesystem shrinkage.
>>> 2. In get_available_block_count(), unconditionally deducts
>>>      reserve_shrink_blocks for all callers, strictly rejecting all
>>>      allocations (including root / CAP_SYS_RESOURCE) once available blocks
>>>      are exhausted.
>>> 3. In f2fs_statfs(), deducts reserve_shrink_blocks from f_bfree (and
>>>      f_bavail) so that filesystem statistics accurately reflect usable space.
>>> 4. In f2fs_resize_fs(), automatically resets reserve_shrink_blocks to 0
>>>      and clears F2FS_MOUNT_RESERVE_SHRINK upon successful shrink completion,
>>>      releasing any remaining reservation.
>>> 5. In sysfs: reserved_blocks, subtracts reserve_shrink_blocks when
>>>      validating the upper limit of configurable reserved blocks.
>>>
>>> Signed-off-by: Daeho Jeong <daehojeong@google.com>
>>> ---
>>> v2:
>>>    - Split out mount option bitmask expansion (BIT_ULL) into a separate
>>>      prerequisite patch (Patch 1/2).
>>> ---
>>>    Documentation/filesystems/f2fs.rst |  7 +++++
>>>    fs/f2fs/f2fs.h                     |  9 ++++++
>>>    fs/f2fs/gc.c                       |  5 ++++
>>>    fs/f2fs/super.c                    | 47 ++++++++++++++++++++++++++++++
>>>    fs/f2fs/sysfs.c                    | 13 +++++++--
>>>    5 files changed, 79 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/Documentation/filesystems/f2fs.rst b/Documentation/filesystems/f2fs.rst
>>> index 771216f45207..dbdc5d5a83ad 100644
>>> --- a/Documentation/filesystems/f2fs.rst
>>> +++ b/Documentation/filesystems/f2fs.rst
>>> @@ -191,6 +191,13 @@ reserve_node=%d           Support configuring reserved nodes which are used for
>>>                         gid, the default limit is 12.5% of all nodes.
>>>    resuid=%d            The user ID which may use the reserved blocks and nodes.
>>>    resgid=%d            The group ID which may use the reserved blocks and nodes.
>>> +reserve_shrink=%d     Support pre-reserving space for subsequent filesystem
>>> +                      shrinkage (e.g. during partition resizing or FOTA),
>>> +                      unit: blocks. Unlike reserve_root, allocations from
>>> +                      this reserved space strictly reject all callers
>>> +                      (including root / CAP_SYS_RESOURCE). Once the
>>> +                      filesystem is successfully shrunk via resize, this
>>> +                      value is automatically reset to 0.
>>>    fault_injection=%d   Enable fault injection in all supported types with
>>>                         specified injection rate.
>>>    fault_type=%d                Support configuring fault injection type, should be
>>> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
>>> index 4aaf29de3f6f..48a91771be95 100644
>>> --- a/fs/f2fs/f2fs.h
>>> +++ b/fs/f2fs/f2fs.h
>>> @@ -145,6 +145,7 @@ enum f2fs_mount_opt {
>>>         */
>>>        F2FS_MOUNT_LAZYTIME,
>>>        F2FS_MOUNT_RESERVE_NODE,
>>> +     F2FS_MOUNT_RESERVE_SHRINK,
>>>    };
>>>
>>>    #define F2FS_OPTION(sbi)    ((sbi)->mount_opt)
>>> @@ -226,6 +227,7 @@ struct f2fs_mount_info {
>>>        unsigned long long opt;
>>>        block_t root_reserved_blocks;   /* root reserved blocks */
>>>        block_t root_reserved_nodes;    /* root reserved nodes */
>>> +     block_t reserve_shrink_blocks;  /* reserve blocks for shrink */
>>>        kuid_t s_resuid;                /* reserved blocks for uid */
>>>        kgid_t s_resgid;                /* reserved blocks for gid */
>>>        int active_logs;                /* # of active logs */
>>> @@ -2658,6 +2660,13 @@ static inline unsigned int get_available_block_count(struct f2fs_sb_info *sbi,
>>>        if (test_opt(sbi, RESERVE_ROOT) && !__allow_reserved_root(sbi, inode, cap))
>>>                avail_user_block_count -= F2FS_OPTION(sbi).root_reserved_blocks;
>>>
>>> +     if (test_opt(sbi, RESERVE_SHRINK)) {
>>> +             if (avail_user_block_count > F2FS_OPTION(sbi).reserve_shrink_blocks)
>>> +                     avail_user_block_count -= F2FS_OPTION(sbi).reserve_shrink_blocks;
>>> +             else
>>> +                     avail_user_block_count = 0;
>>> +     }
>>> +
>>>        if (unlikely(is_sbi_flag_set(sbi, SBI_CP_DISABLED))) {
>>>                if (avail_user_block_count > sbi->unusable_block_count)
>>>                        avail_user_block_count -= sbi->unusable_block_count;
>>> diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
>>> index bc22dde1cb30..556c4793478d 100644
>>> --- a/fs/f2fs/gc.c
>>> +++ b/fs/f2fs/gc.c
>>> @@ -2492,6 +2492,11 @@ int f2fs_resize_fs(struct file *filp, __u64 block_count)
>>>                spin_lock(&sbi->stat_lock);
>>>                sbi->user_block_count += shrunk_blocks;
>>>                spin_unlock(&sbi->stat_lock);
>>> +     } else if (test_opt(sbi, RESERVE_SHRINK)) {
>>> +             spin_lock(&sbi->stat_lock);
>>> +             F2FS_OPTION(sbi).reserve_shrink_blocks = 0;
>>> +             clear_opt(sbi, RESERVE_SHRINK);
>>> +             spin_unlock(&sbi->stat_lock);
>>>        }
>>>    out_err:
>>>        f2fs_up_write_trace(&sbi->cp_global_sem, &clc);
>>> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
>>> index a5e109bdcebc..58f33750b2a8 100644
>>> --- a/fs/f2fs/super.c
>>> +++ b/fs/f2fs/super.c
>>> @@ -196,6 +196,7 @@ enum {
>>>        Opt_data_flush,
>>>        Opt_reserve_root,
>>>        Opt_reserve_node,
>>> +     Opt_reserve_shrink,
>>>        Opt_resgid,
>>>        Opt_resuid,
>>>        Opt_mode,
>>> @@ -328,6 +329,7 @@ static const struct fs_parameter_spec f2fs_param_specs[] = {
>>>        fsparam_flag("data_flush", Opt_data_flush),
>>>        fsparam_u32("reserve_root", Opt_reserve_root),
>>>        fsparam_u32("reserve_node", Opt_reserve_node),
>>> +     fsparam_u32("reserve_shrink", Opt_reserve_shrink),
>>>        fsparam_gid("resgid", Opt_resgid),
>>>        fsparam_uid("resuid", Opt_resuid),
>>>        fsparam_enum("mode", Opt_mode, f2fs_param_mode),
>>> @@ -407,6 +409,7 @@ static match_table_t f2fs_checkpoint_tokens = {
>>>    #define F2FS_SPEC_lookup_mode                       (1 << 24)
>>>    #define F2FS_SPEC_reserve_node                      (1 << 25)
>>>    #define F2FS_SPEC_resizable_tail_secno              (1 << 26)
>>> +#define F2FS_SPEC_reserve_shrink             (1 << 27)
>>>
>>>    struct f2fs_fs_context {
>>>        struct f2fs_mount_info info;
>>> @@ -550,6 +553,27 @@ static inline void limit_reserve_root(struct f2fs_sb_info *sbi)
>>>                                           F2FS_OPTION(sbi).s_resgid));
>>>    }
>>>
>>> +static inline void limit_reserve_shrink(struct f2fs_sb_info *sbi)
>>> +{
>>> +     block_t block_limit;
>>> +
>>> +     if (!test_opt(sbi, RESERVE_SHRINK))
>>> +             return;
>>> +
>>> +     block_limit = sbi->user_block_count - sbi->reserved_blocks;
>>> +     if (test_opt(sbi, RESERVE_ROOT)) {
>>> +             if (block_limit > F2FS_OPTION(sbi).root_reserved_blocks)
>>> +                     block_limit -= F2FS_OPTION(sbi).root_reserved_blocks;
>>> +             else
>>> +                     block_limit = 0;
>>> +     }
>>> +     if (F2FS_OPTION(sbi).reserve_shrink_blocks > block_limit) {
>>> +             F2FS_OPTION(sbi).reserve_shrink_blocks = block_limit;
>>> +             f2fs_info(sbi, "Reduce reserved blocks for shrink = %u",
>>> +                       F2FS_OPTION(sbi).reserve_shrink_blocks);
>>> +     }
>>> +}
>>> +
>>>    static inline void adjust_unusable_cap_perc(struct f2fs_sb_info *sbi)
>>>    {
>>>        if (!F2FS_OPTION(sbi).unusable_cap_perc)
>>> @@ -953,6 +977,14 @@ static int f2fs_parse_param(struct fs_context *fc, struct fs_parameter *param)
>>>                F2FS_CTX_INFO(ctx).root_reserved_nodes = result.uint_32;
>>>                ctx->spec_mask |= F2FS_SPEC_reserve_node;
>>>                break;
>>> +     case Opt_reserve_shrink:
>>> +             if (result.uint_32)
>>> +                     ctx_set_opt(ctx, F2FS_MOUNT_RESERVE_SHRINK);
>>> +             else
>>> +                     ctx_clear_opt(ctx, F2FS_MOUNT_RESERVE_SHRINK);
>>> +             F2FS_CTX_INFO(ctx).reserve_shrink_blocks = result.uint_32;
>>> +             ctx->spec_mask |= F2FS_SPEC_reserve_shrink;
>>> +             break;
>>>        case Opt_resuid:
>>>                F2FS_CTX_INFO(ctx).s_resuid = result.uid;
>>>                ctx->spec_mask |= F2FS_SPEC_resuid;
>>> @@ -1775,6 +1807,9 @@ static void f2fs_apply_options(struct fs_context *fc, struct super_block *sb)
>>>        if (ctx->spec_mask & F2FS_SPEC_reserve_node)
>>>                F2FS_OPTION(sbi).root_reserved_nodes =
>>>                                        F2FS_CTX_INFO(ctx).root_reserved_nodes;
>>> +     if (ctx->spec_mask & F2FS_SPEC_reserve_shrink)
>>> +             F2FS_OPTION(sbi).reserve_shrink_blocks =
>>> +                                     F2FS_CTX_INFO(ctx).reserve_shrink_blocks;
>>>        if (ctx->spec_mask & F2FS_SPEC_resgid)
>>>                F2FS_OPTION(sbi).s_resgid = F2FS_CTX_INFO(ctx).s_resgid;
>>>        if (ctx->spec_mask & F2FS_SPEC_resuid)
>>> @@ -2300,6 +2335,13 @@ static int f2fs_statfs(struct dentry *dentry, struct kstatfs *buf)
>>>        buf->f_bfree = user_block_count - valid_user_blocks(sbi) -
>>>                                                sbi->current_reserved_blocks;
>>>
>>> +     if (test_opt(sbi, RESERVE_SHRINK)) {
>>> +             if (buf->f_bfree > F2FS_OPTION(sbi).reserve_shrink_blocks)
>>> +                     buf->f_bfree -= F2FS_OPTION(sbi).reserve_shrink_blocks;
>>> +             else
>>> +                     buf->f_bfree = 0;
>>> +     }
>>> +
>>>        if (unlikely(buf->f_bfree <= sbi->unusable_block_count))
>>>                buf->f_bfree = 0;
>>>        else
>>> @@ -2524,6 +2566,9 @@ static int f2fs_show_options(struct seq_file *seq, struct dentry *root)
>>>                                        F2FS_OPTION(sbi).s_resuid),
>>>                                from_kgid_munged(&init_user_ns,
>>>                                        F2FS_OPTION(sbi).s_resgid));
>>> +     if (test_opt(sbi, RESERVE_SHRINK))
>>> +             seq_printf(seq, ",reserve_shrink=%u",
>>> +                             F2FS_OPTION(sbi).reserve_shrink_blocks);
>>>    #ifdef CONFIG_F2FS_FAULT_INJECTION
>>>        if (test_opt(sbi, FAULT_INJECTION)) {
>>>                seq_printf(seq, ",fault_injection=%u",
>>> @@ -3105,6 +3150,7 @@ static int __f2fs_remount(struct fs_context *fc, struct super_block *sb)
>>>
>>>        adjust_pinned_area_boundary(sbi);
>>>        limit_reserve_root(sbi);
>>> +     limit_reserve_shrink(sbi);
>>>        fc->sb_flags = (flags & ~SB_LAZYTIME) | (sb->s_flags & SB_LAZYTIME);
>>>
>>>        sbi->umount_lock_holder = NULL;
>>> @@ -5322,6 +5368,7 @@ static int f2fs_fill_super(struct super_block *sb, struct fs_context *fc)
>>>        sbi->current_reserved_blocks = 0;
>>>        sbi->alias_reserved_blocks = 0;
>>>        limit_reserve_root(sbi);
>>> +     limit_reserve_shrink(sbi);
>>>        adjust_unusable_cap_perc(sbi);
>>>
>>>        f2fs_init_extent_cache_info(sbi);
>>> diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
>>> index aaca9ed9b169..d61940d095b4 100644
>>> --- a/fs/f2fs/sysfs.c
>>> +++ b/fs/f2fs/sysfs.c
>>> @@ -591,9 +591,18 @@ static ssize_t __sbi_store(struct f2fs_attr *a,
>>>        }
>>>    #endif
>>>        if (a->struct_type == RESERVED_BLOCKS) {
>>> +             unsigned long limit;
>>> +
>>>                spin_lock(&sbi->stat_lock);
>>> -             if (t > (unsigned long)(sbi->user_block_count -
>>> -                             F2FS_OPTION(sbi).root_reserved_blocks)) {
>>> +             limit = sbi->user_block_count -
>>> +                             F2FS_OPTION(sbi).root_reserved_blocks;
>>> +             if (test_opt(sbi, RESERVE_SHRINK)) {
>>> +                     if (limit > F2FS_OPTION(sbi).reserve_shrink_blocks)
>>> +                             limit -= F2FS_OPTION(sbi).reserve_shrink_blocks;
>>> +                     else
>>> +                             limit = 0;
>>> +             }
>>> +             if (t > limit) {
>>>                        spin_unlock(&sbi->stat_lock);
>>>                        return -EINVAL;
>>>                }
>>

