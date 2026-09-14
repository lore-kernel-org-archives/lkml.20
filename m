Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1605A3AAF54
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 19:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789413972; cv=none; b=IGivZKyEeb3Gny67UDydEQkmbz0VLor+0VTjErcusfQzj3V7IhKETLil43S8xV4uSm1jhD0v0z2VlqPXLmUVwQz+vGPzlaWN/HWr4UFKpa+vh1o4TyiYyywPktScl5X6y2vnxJ0GIR2i6aUiJQIrQPlXB02m+CCMSpSuVWG2sYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789413972; c=relaxed/simple;
	bh=5DbRj/iYqndjmb8Q45VZ6RZRXuNb2x8vDoqW8HnYWiQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=fssW+BizYiMZ1JJ990oJJdcVFF25ugSBxNmfDvocyJtrTM74so3piMZkU0SdfQ37RUrehbDdsxEJe3iKn+tVr3BuTLbBprKG32LxYeFrfvpauMXqs6CjBJHCKQlJG7vaVu6hQLzhXmzwjMwiqRTL7r2+BFfE18Ru4aj8cApDHg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dubeyko.com; spf=pass smtp.mailfrom=dubeyko.com; dkim=pass (2048-bit key) header.d=dubeyko-com.20251104.gappssmtp.com header.i=@dubeyko-com.20251104.gappssmtp.com header.b=UNKx3QWA; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dubeyko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dubeyko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dubeyko-com.20251104.gappssmtp.com header.i=@dubeyko-com.20251104.gappssmtp.com header.b="UNKx3QWA"
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-8871ada1a26so22042777b3.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:26:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dubeyko-com.20251104.gappssmtp.com; s=20251104; t=1789413967; x=1790018767; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IEQPgJ9nFW6WOZIE7dLVwT5VkA5qAfJb83CJ9iXYDR8=;
        b=UNKx3QWAwzgTfX4q9IXzHPv3yr7JEjZKvujXhzup968pMCl0ddwB0HWLcr/yBoymRI
         11Iu7ueMbMy5OE0rCyYurE8fXXoE9DetOxOG4BuGKaIGrVuJZh3cRgWFQx1aKLdV4FfD
         LOtgwJmKWd8V8dsaiV/ZkQ/h2kckNPLKWx6AG1h58O/MdXKL6VIxP13F6Xl6Cm81Yq84
         u89hgOCK+gE551t34bsOXZnak3KE44bb7og8UOf881HUJ4EEpQCNKFHiUUeQQAPhHpJY
         niqpT9MYSCgKch2WzIVrFeCTko1UpVGSp4XWKrrNO80BOE2AcYbAsIbL10DlwrW9UG66
         Gslw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789413967; x=1790018767;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=IEQPgJ9nFW6WOZIE7dLVwT5VkA5qAfJb83CJ9iXYDR8=;
        b=VcQoOdISQ07CtmPFLEpP41nHDZpTXOouH7G7Q7pIUd/Nve4zQSCjiHJkeOA9EkTOZh
         hs116uZcsO50OlJN/ju+K9ucavqnoZmaSVLYvRHCfSpeyV+VH24L1EMBOmdTGlTLQQBf
         ycW5QcKCwjjUTJ9KKq+qREbTN/4hPLkECn1LVK+CZgHJ5H8vcnjel4rlgbzGnVyZZ9/t
         C3Iqhcoy9OALW1aoQxlMRtf3pPlhPOLvnVAcwGPJS1ZwV6D5In2e6kt7vPGBQyZ/nnvV
         NA4WzLK9oP6kzejTkn4Ds/YlaU2YgMpB9E7VGtLg4dShRE2poSQ4witvs3tYlAfTlvN3
         0wjw==
X-Forwarded-Encrypted: i=1; AKwUvBwvOz9a63YxA1YtVMb4YO0o5BEwOsjYCj/MIFJyXZx9Xfvrlaej2FKmjac19oYyBncOEsVsr8qwPt1HgC8=@vger.kernel.org
X-Gm-Message-State: AFuF++nMaaqvRb8viYTnRudnNaBiIdX3FZQ2l7uOKpPlzkarDiF+qRFa
	P9qIKrXu61CwegO3cGgbZqlYK4j4KL0e9k+bcC1TBPtP5lgHf8Co506zBFrCBU+m7HgZ+HVH9wc
	gC/fYdYeK+g==
X-Gm-Gg: AYBFou1pG7d3ur+Y565niUuFm4/f5dPMYdGihHJuOe0PM3BYnc0FGLN0D8iNT1tLnR3
	T1BRDJswaAAVNUfX0pc2kFuGgqEQKZ4tBb2iZ1I6vYZqYsWTJXPofmit45CTyDiw15G772Yw8bM
	b3cZcbnWRVweDB8iduaGOQrFymmIYm8sEFLBA8PsyftcGtoUM/wS4PlFc6Eol5fecd4c0TWs4LI
	b3YtEe3tqiHRtEZ/mvee9CcjH42dd9RRHUVEs3BlAOGCUNjPPti6QP2E9a6rSFbxTMpHGdnSHCE
	8L1xSKKcDW9JsLIjLBFm5tqtDYBioctvw2I27Qs6OBcDB1xQYO5Zf76GDLeYjWQmtPWgYRk2FFU
	KL0bs0Vw49hIZ//1oxcjwWK6OohQw3Zvp0sC08gqZXJCh17VyM0Q3TAfboI7+q00qxDrL2Ohl4S
	edXZ9PN9lme3afUMpQQaks94lwLg7E+0ld+xHRWtDeIuAGtEXh9qtHXlgCVnmuw6MOTH6rKMfVe
	vvTzPp/AIEZmArXL5/MT/rGWO28yEOGf+jxGLT4dupIuU8GyCS8VoAuBUUrAt4/By/T5lyoJdrk
	t9TO+8HwG704dJ1X55bipYUchiZu
X-Received: by 2002:a05:690c:e3c1:b0:845:1064:5c03 with SMTP id 00721157ae682-88d1fbd5731mr13241967b3.23.1789413966589;
        Mon, 14 Sep 2026 12:26:06 -0700 (PDT)
Received: from pop-os.attlocal.net ([2600:1700:6476:1430:df87:8743:655b:3824])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-884894fd624sm40027897b3.46.2026.09.14.12.26.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 12:26:05 -0700 (PDT)
Message-ID: <d66b55454add2f2a48a6dabdb4569051bebb5d42.camel@dubeyko.com>
Subject: Re: [PATCH v4 1/2] hfsplus: fix recursive tree_lock in
 hfsplus_file_extend()
From: Viacheslav Dubeyko <slava@dubeyko.com>
To: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
Cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Yangtao Li
	 <frank.li@vivo.com>, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	syzbot+f8ce6c197125ab9d72ce@syzkaller.appspotmail.com
Date: Mon, 14 Sep 2026 12:26:03 -0700
In-Reply-To: <20260912132407.16856-2-ngocthang2710.1999@gmail.com>
References: <c6b841becc5b1709a9f54a1c0efd0a14f02ad97b.camel@dubeyko.com>
	 <20260912132407.16856-1-ngocthang2710.1999@gmail.com>
	 <20260912132407.16856-2-ngocthang2710.1999@gmail.com>
Autocrypt: addr=slava@dubeyko.com; prefer-encrypt=mutual;
 keydata=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
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.1 (by Flathub.org) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Sat, 2026-09-12 at 20:24 +0700, Nguyen Ngoc Thang wrote:
> hfs_bmap_reserve() calls hfsplus_file_extend() on tree->inode with
> tree->tree_lock already held. For the extents overflow B-tree's own
> inode, growing it can call hfsplus_ext_read_extent() ->
> hfs_find_init()
> on that same tree, taking tree_lock a second time (lockdep: "possible
> recursive locking ... &tree->tree_lock/1"). This happens two ways:
>=20
> =C2=A0- the fork already claims more blocks than its eight extents
> =C2=A0=C2=A0 describe (a corrupted on-disk fork), so hfsplus_ext_read_ext=
ent()
> =C2=A0=C2=A0 is called immediately to look up the rest; or
> =C2=A0- the fork's eight extents get exhausted during this call, and
> =C2=A0=C2=A0 inserting a new overflow extent record for the file would ne=
ed
> =C2=A0=C2=A0 the same lookup.
>=20
> Per the HFS+ format the extents overflow file is fully described by
> its eight fork extents and can never legitimately have overflow
> extents of its own, so both cases mean it cannot grow any further.
>=20
> Move the check into hfsplus_ext_read_extent() itself, the one place
> that actually re-enters hfs_find_init(), rather than duplicating it
> at
> each caller, and report -ENOSPC.
>=20
> For the second case, don't allocate blocks on the chance the fork
> still has room and undo it if not: hfsplus_ext_fork_full() tests the
> fork first. If it does have a free extent slot, any free space works,
> same as before. If it's already full, the only way to grow is a
> contiguous extension of the last extent, so only search for free
> space starting exactly at the block right after it, and fail with
> -ENOSPC immediately if that block isn't free -- nothing gets
> allocated in that case, so there's nothing to undo. The prior
> allocate-then-free-on-failure code stays at the insert_extent label
> as a backstop, in case this reasoning has a gap.
>=20
> Reported-by: syzbot+f8ce6c197125ab9d72ce@syzkaller.appspotmail.com
> Signed-off-by: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
> Co-Authored-By: Claude Sonnet 5 <noreply@anthropic.com>
> ---
> =C2=A0fs/hfsplus/extents.c | 59 +++++++++++++++++++++++++++++++++++++++++=
-
> --
> =C2=A01 file changed, 55 insertions(+), 4 deletions(-)
>=20
> diff --git a/fs/hfsplus/extents.c b/fs/hfsplus/extents.c
> index eb7c11524d18..236f2d9a7a2d 100644
> --- a/fs/hfsplus/extents.c
> +++ b/fs/hfsplus/extents.c
> @@ -84,6 +84,17 @@ static u32 hfsplus_ext_lastblock(struct
> hfsplus_extent *ext)
> =C2=A0	return be32_to_cpu(ext->start_block) + be32_to_cpu(ext-
> >block_count);
> =C2=A0}
> =C2=A0
> +/* True if all eight extents of a fork are in use (no free slot
> left) */
> +static bool hfsplus_ext_fork_full(struct hfsplus_extent *ext)

static inline?

> +{
> +	int i;
> +
> +	for (i =3D 0; i < 8; ext++, i++)

I am introducing the special constant for the 8 extents of the fork in
HFS+ iomap patchset. How can we handle this? Because I would like to
see the named constant instead of hardcoded value.


> +	=09
> if (!ext->block_count)
> +			return false;
> +	return true;
> +}
> +
> =C2=A0static int __hfsplus_ext_write_extent(struct inode *inode,
> =C2=A0		struct hfs_find_data *fd)
> =C2=A0{
> @@ -217,6 +228,15 @@ static int hfsplus_ext_read_extent(struct inode
> *inode, u32 block)
> =C2=A0	=C2=A0=C2=A0=C2=A0 block < hip->cached_start + hip->cached_blocks)
> =C2=A0		return 0;
> =C2=A0
> +	/*
> +	 * The extents overflow file is fully described by its own
> fork
> +	 * extents; looking up an overflow extent for it would re-
> enter
> +	 * hfs_find_init() on the extents tree, whose tree_lock may
> already
> +	 * be held by the caller.
> +	 */

The comment is not fully correct. We should not be here for the case of
Extents Overflow file because there is no forks other than in
superblock. It's not about the lock issue. We simply should not be here
at all.

> +	if (inode->i_ino =3D=3D HFSPLUS_EXT_CNID)

Maybe, we need to introduce something like is_extents_btree() method?
What do you think?

> +		return -ENOSPC;
> +
> =C2=A0	res =3D hfs_find_init(HFSPLUS_SB(inode->i_sb)->ext_tree, &fd);
> =C2=A0	if (!res) {
> =C2=A0		res =3D __hfsplus_ext_cache_extent(&fd, inode, block);
> @@ -465,13 +485,30 @@ int hfsplus_file_extend(struct inode *inode,
> bool zeroout)
> =C2=A0	}
> =C2=A0
> =C2=A0	len =3D hip->clump_blocks;
> -	start =3D hfsplus_block_allocate(sb, sbi->total_blocks, goal,
> &len);
> -	if (start >=3D sbi->total_blocks) {
> -		start =3D hfsplus_block_allocate(sb, goal, 0, &len);
> -		if (start >=3D goal) {
> +	if (inode->i_ino =3D=3D HFSPLUS_EXT_CNID &&
> +	=C2=A0=C2=A0=C2=A0 hip->alloc_blocks =3D=3D hip->first_blocks &&
> +	=C2=A0=C2=A0=C2=A0 hfsplus_ext_fork_full(hip->first_extents)) {

It looks like complicated condition and it deserves a static inline
function, from my point of view.

> +		/*
> +		 * No free slot is left in the fork, and the extents
> overflow
> +		 * file can't record an overflow extent of its own:
> the only
> +		 * way to grow it is a contiguous extension of the
> last
> +		 * extent, so only accept free space starting
> exactly at
> +		 * goal instead of allocating anywhere and having to
> undo it.
> +		 */

Maybe, instead of this long comment we need to introduce a dedicated
method for processing Extents Overflow file allocation case?

> +		start =3D hfsplus_block_allocate(sb, goal + 1, goal,
> &len);

Maybe, I am missing something here. But goal + 1 sounds like we request
to allocate only one block. Is it correct? If yes, why only one block?
Usually, we need to try to allocate a clumpSize.

> +		if (start !=3D goal) {
> =C2=A0			res =3D -ENOSPC;
> =C2=A0			goto out;
> =C2=A0		}
> +	} else {
> +		start =3D hfsplus_block_allocate(sb, sbi-
> >total_blocks, goal, &len);
> +		if (start >=3D sbi->total_blocks) {
> +			start =3D hfsplus_block_allocate(sb, goal, 0,
> &len);
> +			if (start >=3D goal) {
> +				res =3D -ENOSPC;
> +				goto out;
> +			}
> +		}
> =C2=A0	}
> =C2=A0
> =C2=A0	if (zeroout) {
> @@ -526,6 +563,20 @@ int hfsplus_file_extend(struct inode *inode,
> bool zeroout)
> =C2=A0	return res;
> =C2=A0
> =C2=A0insert_extent:
> +	/*
> +	 * The fork-full precheck above keeps the extents overflow
> file's
> +	 * own inode from ever landing here with blocks already
> allocated;
> +	 * this is a backstop, so still free what was allocated
> rather
> +	 * than leak it.
> +	 */
> +	if (inode->i_ino =3D=3D HFSPLUS_EXT_CNID) {
> +		if (hfsplus_block_free(sb, start, len))

Can we be here at all? If start !=3D goal, then we cannot allocate at
all. And we can be here only if we have empty slot it the fork. Am I
right?

Additional comment:

checkpatch.pl --strict flags one alignment style issue:
fs/hfsplus/extents.c:575: pr_err("can't free extent: start %u, count
%u\n",
                      start, len);
continuation should align with the open paren =E2=80=94 cosmetic only

Thanks,
Slava.

> +			pr_err("can't free extent: start %u, count
> %u\n",
> +				start, len);
> +		res =3D -ENOSPC;
> +		goto out;
> +	}
> +
> =C2=A0	hfs_dbg("insert new extent\n");
> =C2=A0	res =3D hfsplus_ext_write_extent_locked(inode);
> =C2=A0	if (res)
