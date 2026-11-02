Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793657427;
	b=ui2P3VKiZwZjmqfPpDPyNCBqVSu2GYl3v0e6UMIdVsD5CVtn0BfBybRGlKPwrlqELBiA
	 sxha3EbUPkcNFl6W52PCZc32bsTGsVAoFzv7iB5zfPEdTKKvDphtHrFGyV8fvbVk415lI
	 ltKEVhcuJ/poEbXjuj2/PK7/F5G87wd680m/EKV+Ec17k8HbDIfl6qqgZhYk9AtYjPcJ8
	 kXlHDJbVDyH5TDFLbWoMjgHA7/CKJIz1GOFomWGdLY/rYGPE3AkFIQ2fF+m/I0JnfY69o
	 KQT7T3ugK2AAaP6w+SIQQd4dvjt7W6sPitc4Xkbg3oGvmHooP5lKNTLwv7QcwRnDvPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793657427;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Content-Transfer-Encoding:Message-Id:References:To:X-Mailer;
	bh=mVbYNGcEKVi2Ryiv8CDqgNXOLHmXsJsrIxCit/L/4J0=;
	b=ZOEWiV5d8sPAXXAIc+IVMSCW8NhCRXwP9XRjl5HystQ+AQ5S6SQqb396sC0sZ+sxF8mQ
	 LhzBW2hXjuhXf0WH8VVNeP0tXTiwH2dz4b4JAVO7rUIbfZG2sZBq1U7qDz2RDEBpA2TVF
	 W+UC4iqqnrB7Yx0TdP7cLAdWW/nBu/g/rAVjCRelZ7qeOL4Uekikoo16SrqXDA4BzFZ6r
	 85Lwv0D1QSLL5EC3Uvkfj6HS5M7L7Yv9XQTn2mfNlwSuvNQh4nAJSZ+Pqoh2qB9MNINIC
	 e1+/qa4S1Ty6oemIJQQMPk28BGVFyMUdC7PF/6vjLful4Lm4PbE/XKEqXEpKEVJnLuQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=dilger.ca;
	spf=pass smtp.mailfrom=dilger.ca;
	dkim=pass header.d=dilger-ca.20260707.gappssmtp.com header.i=@dilger-ca.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=PJa8cTbZ;
	arc=none smtp.remote-ip=209.85.214.175
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8EA1606A32C
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 22:10:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8EA1606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dilger.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dilger.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=dilger-ca.20260707.gappssmtp.com header.i=@dilger-ca.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=PJa8cTbZ
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2e60f9af6e6so33381875ad.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 14:10:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dilger-ca.20260707.gappssmtp.com; s=20260707; t=1793657425; x=1794262225; darn=vger.kernel.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=mVbYNGcEKVi2Ryiv8CDqgNXOLHmXsJsrIxCit/L/4J0=;
        b=PJa8cTbZfleI4DErsiJ4xwCm1ztzwfNbaCMymQZmXSAmjJ4J0bqourlRY9o6TkV32Y
         K3BH/oqbHE1m1wwcDist9Js/iZtxXU2YRoDK0sDGFMeR+u8D3v5ZOVZ7cEL4B0D1+3iY
         DAyBjnMZdgMO5e7XbKWfmyHFr4LG9Lx5i/PuOcLA6b+RYA9lzn2/qVzqVYHSt6cNT6wE
         GH6QYYSd/gSy2TGyV8pDwZqLVp7wnZ/ygvAFKT/8u4VLvr2aqi9pO39Ug0BzSNYfjAVy
         y5xCvxBbLwazBoH+802drvNe1COuO7PLyDjcBQmS2wc7pPd1GLZZW5F/UzGHCOfmKs0w
         j5gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793657425; x=1794262225;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mVbYNGcEKVi2Ryiv8CDqgNXOLHmXsJsrIxCit/L/4J0=;
        b=JVXHt7BmKUl11hhq6mqbKLkgBizKUTeD8oxSbMg46ki9Y0hKMmptvx5pmEkzuQ2UT6
         BeN62ABKcVG4DD6ATwg5ZeSfhDZfIYAKvJh5nJbyB/KJ1SYsMKz9rqtK4Xmnz4+DsBv/
         zZ2kH5QAdaXyR2PEUAOP1txbPg6MsLYeKeyp/3AvjsFB8JeuxPzaRtQEOHAmxYhDE0KH
         c3t//z1+E/WlpWTfLMMBQWtZS/dIn7/k9WnqcRGqEiXrA1CfhaKK1dH7Q/WB8Fzq/FOY
         oartw3XidugLCu+vAPc5PYDR3edQezRrCM0R9HNXK8kPwU+xj4kuKmXPUH9LQk8xC/rc
         nRpg==
X-Forwarded-Encrypted: i=1; AKwUvBy1sAmYBT+5SynMb5LTJKVJnvTAKMArn9QS48DuoNU1SS5k1KJAPydWdn1BPYucZLkaTADXc5on/wnYfd4=@vger.kernel.org
X-Gm-Message-State: APuU4Z85JzlK3D08W6qR2jVZvN1gpGgR+iOs8B76XwsyMkZU744GqKFg
	cfjtcsL0UGrMoBhxMOmIAGi3M6bjnPDOymq5kuOz81cC0W2tUTR1pZVxX8ez7DbpCzod23Mv/NH
	vt9kK7L4=
X-Gm-Gg: AYBFou151luZqfrRmsyZMmq1nkx90Zrn14/6usd0glbh5TFlzFfeO7ZpHDnaTofrsoj
	FX7qsoXGOWK3E4LaTV1n0HqUe/URABmI2deteIBg1hwUJwz2K14Ppl6n7IsB7Mx45QXwqxCAhw5
	Gm9HYxHmnDmN9P7460QBAtV0SiA7Ce9JcctoAD4EwrJ3urt6HoqS1lAnVHnwngbf3H2hWPQTto5
	T3SciqZn6GsCxlRbIULlMp0RlrYa6ywjRDb82U+VC5P0aQP/caGLa8703gMmyV/wDUjkIxKI80u
	hP1FmkRZZRo6rqXtw1oEisXQWZblt6zbG+EO+pJHwU0AhRpb1MFXb7k++5DtOKHJHJE9kiTevAh
	lnyJuXF4vlcm/QYVpFnkmMPWISPVi8UAylRqyK1RFHQVvv//yU8LkHZ4GMW3qo4wjTwKqBPfwZ1
	iPJCThqnZdZ5DdZJ7edx7mEZ3mAx9Ozy+MUJMFsB1CzBPZj84QroJkfV4pd8pod2dde49G/8OtO
	5M7+5Vo3hjqxZ6paE2T/tbslBQzBV4jCqd0o0bW2qQWtxlnSb8Agl2osqCN1gKWVn26ulam5+16
	b8iLjqvo103e6V+ZAaJWe9EYcmHQ5ilJu9F2Nn9zMNBJSzuySUNP2fCBbfRQUidfUngDZX+KKtr
	1phu0+Z8=
X-Received: by 2002:a17:902:ce81:b0:2ea:dacd:1663 with SMTP id d9443c01a7336-2eb364f23a4mr119485125ad.47.1793657425228;
        Mon, 02 Nov 2026 14:10:25 -0800 (PST)
Received: from smtpclient.apple (S01068c763f81ca4b.cg.shawcable.net. [24.64.171.237])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb39247e32sm32583445ad.27.2026.11.02.14.10.24
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 02 Nov 2026 14:10:24 -0800 (PST)
Content-Type: text/plain;
	charset=us-ascii
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.700.51.1.3\))
Subject: Re: [PATCH] ext4: reject impossible group free cluster counts
From: Andreas Dilger <adilger@dilger.ca>
In-Reply-To: <20261102042428.65204-1-zhaogongyi@bytedance.com>
Date: Mon, 2 Nov 2026 16:10:13 -0600
Cc: linux-ext4@vger.kernel.org,
 tytso@mit.edu,
 libaokun@linux.alibaba.com,
 jack@suse.cz,
 ojaswin@linux.ibm.com,
 ritesh.list@gmail.com,
 yi.zhang@huawei.com,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <F238B62D-6BED-4D64-B099-B956B820BA44@dilger.ca>
References: <20261102042428.65204-1-zhaogongyi@bytedance.com>
To: Zhao Gongyi <zhaogongyi@bytedance.com>
X-Mailer: Apple Mail (2.3864.700.51.1.3)


On Nov 1, 2026, at 22:24, Zhao Gongyi <zhaogongyi@bytedance.com> wrote:
>=20
> ext4_count_free_clusters() initializes global free-space accounting =
from
> group descriptors. A corrupt bigalloc image advertises 201327130 free
> clusters in a 32-cluster group. The mount succeeds and delayed
> allocation later sees an impossible free-space total.
>=20
> Reject counts above the group's cluster capacity during descriptor
> validation. Reuse the existing capacity calculation so bigalloc and
> short final groups use the same bound as the block bitmap.
>=20
> Journal replay can overwrite a descriptor after the initial check. A
> crafted transaction changes a valid count to 32769 in a 32768-cluster
> group; a pre-replay-only check lets both read-only and read-write =
mounts
> succeed. Recheck after recovery, before initializing free-space
> counters. Limit the second scan to mounts needing recovery.
>=20
> Apply the bound to read-only mounts too, since they use the descriptor
> count for in-memory accounting.
>=20
> Signed-off-by: Zhao Gongyi <zhaogongyi@bytedance.com>

I think a lot of this class of bug could be avoided by doing very =
minimal
checks on the group descriptors initially (and other metadata, enough to
load and validate the journal inode itself is sane). The journal inode =
is
otherwise read-only so its allocations should never be modified.  Then
replaying the journal if it is dirty, and restarting the superblock/GDT
checks from the beginning to validate the _current_ blocks are sane.

That should only be done once per mount. To keep sanity after checks, we
could validate the journal never contains updates to its own inode (or =
at
least not until an SMR "wandering journal/log structure" feature =
exists).=20

Cheers, Andreas

> ---
> fs/ext4/balloc.c | 10 +++++-----
> fs/ext4/ext4.h   |  2 ++
> fs/ext4/super.c  | 38 ++++++++++++++++++++++++++++++++++++++
> 3 files changed, 45 insertions(+), 5 deletions(-)
>=20
> diff --git a/fs/ext4/balloc.c b/fs/ext4/balloc.c
> index 778fe87..0f36630 100644
> --- a/fs/ext4/balloc.c
> +++ b/fs/ext4/balloc.c
> @@ -159,8 +159,8 @@ static unsigned ext4_num_overhead_clusters(struct =
super_block *sb,
> return num_clusters;
> }
>=20
> -static unsigned int num_clusters_in_group(struct super_block *sb,
> -  ext4_group_t block_group)
> +unsigned int ext4_num_clusters_in_group(struct super_block *sb,
> + ext4_group_t block_group)
> {
> unsigned int blocks;
>=20
> @@ -228,7 +228,7 @@ static int ext4_init_block_bitmap(struct =
super_block *sb,
> * the blocksize * 8 ( which is the size of bitmap ), set rest
> * of the block bitmap to 1
> */
> - ext4_mark_bitmap_end(num_clusters_in_group(sb, block_group),
> + ext4_mark_bitmap_end(ext4_num_clusters_in_group(sb, block_group),
>     sb->s_blocksize * 8, bh->b_data);
> return 0;
> }
> @@ -240,7 +240,7 @@ unsigned ext4_free_clusters_after_init(struct =
super_block *sb,
>       ext4_group_t block_group,
>       struct ext4_group_desc *gdp)
> {
> - return num_clusters_in_group(sb, block_group) -
> + return ext4_num_clusters_in_group(sb, block_group) -
> ext4_num_overhead_clusters(sb, block_group, gdp);
> }
>=20
> @@ -313,7 +313,7 @@ static ext4_fsblk_t =
ext4_valid_block_bitmap_padding(struct super_block *sb,
> {
> ext4_grpblk_t next_zero_bit;
> unsigned long bitmap_size =3D sb->s_blocksize * 8;
> - unsigned int offset =3D num_clusters_in_group(sb, block_group);
> + unsigned int offset =3D ext4_num_clusters_in_group(sb, block_group);
>=20
> if (bitmap_size <=3D offset)
> return 0;
> diff --git a/fs/ext4/ext4.h b/fs/ext4/ext4.h
> index 8d3af06..3956545 100644
> --- a/fs/ext4/ext4.h
> +++ b/fs/ext4/ext4.h
> @@ -3468,6 +3468,8 @@ extern ext4_fsblk_t ext4_inode_bitmap(struct =
super_block *sb,
>      struct ext4_group_desc *bg);
> extern ext4_fsblk_t ext4_inode_table(struct super_block *sb,
>     struct ext4_group_desc *bg);
> +unsigned int ext4_num_clusters_in_group(struct super_block *sb,
> + ext4_group_t block_group);
> extern __u32 ext4_free_group_clusters(struct super_block *sb,
>      struct ext4_group_desc *bg);
> extern __u32 ext4_free_inodes_count(struct super_block *sb,
> diff --git a/fs/ext4/super.c b/fs/ext4/super.c
> index 7d8aedf..83e4ef6 100644
> --- a/fs/ext4/super.c
> +++ b/fs/ext4/super.c
> @@ -3355,6 +3355,36 @@ void ext4_group_desc_csum_set(struct =
super_block *sb, __u32 block_group,
> gdp->bg_checksum =3D ext4_group_desc_csum(sb, block_group, gdp);
> }
>=20
> +static bool ext4_check_group_free_clusters(struct super_block *sb,
> +   ext4_group_t group,
> +  struct ext4_group_desc *gdp)
> +{
> + unsigned int free_clusters =3D ext4_free_group_clusters(sb, gdp);
> + unsigned int group_clusters =3D ext4_num_clusters_in_group(sb, =
group);
> +
> + if (free_clusters > group_clusters) {
> + ext4_msg(sb, KERN_ERR,
> + "%s: group %u has invalid free clusters count %u > %u",
> + __func__, group, free_clusters, group_clusters);
> + return false;
> + }
> + return true;
> +}
> +
> +static int ext4_check_replayed_free_clusters(struct super_block *sb)
> +{
> + struct ext4_sb_info *sbi =3D EXT4_SB(sb);
> + ext4_group_t group;
> +
> + for (group =3D 0; group < sbi->s_groups_count; group++) {
> + struct ext4_group_desc *gdp =3D ext4_get_group_desc(sb, group, =
NULL);
> +
> + if (!ext4_check_group_free_clusters(sb, group, gdp))
> + return -EFSCORRUPTED;
> + }
> + return 0;
> +}
> +
> /* Called at mount-time, super-block is locked */
> static int ext4_check_descriptors(struct super_block *sb,
>  ext4_fsblk_t sb_block,
> @@ -3467,6 +3497,8 @@ static int ext4_check_descriptors(struct =
super_block *sb,
> }
> }
> ext4_unlock_group(sb, i);
> + if (!ext4_check_group_free_clusters(sb, i, gdp))
> + return 0;
> if (!flexbg_flag)
> first_block +=3D EXT4_BLOCKS_PER_GROUP(sb);
> }
> @@ -5567,6 +5599,12 @@ static int __ext4_fill_super(struct fs_context =
*fc, struct super_block *sb)
> err =3D ext4_load_and_init_journal(sb, es, ctx);
> if (err)
> goto failed_mount3a;
> + /* Journal replay may change descriptors after the initial check. */
> + if (needs_recovery) {
> + err =3D ext4_check_replayed_free_clusters(sb);
> + if (err)
> + goto failed_mount_wq;
> + }
> if (bdev_read_only(sb->s_bdev))
>    needs_recovery =3D 0;
> } else if (test_opt(sb, NOLOAD) && !sb_rdonly(sb) &&
>=20
> base-commit: 8c4f6e3376348fc3162eed86a05b933921c8f9ed
> --=20
> 2.39.5 (Apple Git-154)


Cheers, Andreas





