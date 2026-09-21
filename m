Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D7BB4EE87C
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 21:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790024869; cv=none; b=jhflgu/vO/UPd73dwda+NfwsNnbUfzH7WH/BFKyFX07kgQ2LMAwmDIHin4/SM64HZ5Ay799ZorA8xT/W1G5C7U3GAoKVhKowmB9ktBlCeMidimETfBc/VBMyFbCgFYq6eLY7sDakk3/lvlPG15YFwRsm+qvUQivR/WcrCm0qZOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790024869; c=relaxed/simple;
	bh=4zEwxvPktaYAQHztURrFu0k5JWF/RLn0MTu1GkhsvO4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=nXqZ5Tv38wEc5ZCK87H/y0HzEeyIc5UM9vvAVb3SQnI15ihp/v0ZKc8E080uMKvkRCxRrCxP0hwiOudH/+tO6Tkeelf1BWLXwwUjgnA1P71Z8Ht0Lytx1NVFSVzy9Nd3Z2XsqLVZnCzwvC6Ml+iElBdj5vZYXXueSZXLtbUHzEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dubeyko.com; spf=pass smtp.mailfrom=dubeyko.com; dkim=pass (2048-bit key) header.d=dubeyko-com.20251104.gappssmtp.com header.i=@dubeyko-com.20251104.gappssmtp.com header.b=qYIKW8C1; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dubeyko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dubeyko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dubeyko-com.20251104.gappssmtp.com header.i=@dubeyko-com.20251104.gappssmtp.com header.b="qYIKW8C1"
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-86162c086f8so2675807b3.1
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 14:07:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dubeyko-com.20251104.gappssmtp.com; s=20251104; t=1790024865; x=1790629665; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Dpe0IKufbiRfhpiAWaY7OFMMPAcVyG0Lh2Ykv/Q/Mwg=;
        b=qYIKW8C18Ac5Ths8GaP2mbQAfsUgUt8VwTrup1kVMSuSMqcgGzDyUkgNGGKzXXSrJE
         09biDRQPpaBA57r4H0dWZ+8qxUg7Tmgs9egZkF5rFgf+wf/ryc2CHFjfofdgF3OUTb66
         Ig49HbCLBTRF+r3kZHf5vkBMzggdQ1E+wkaNxX/CFRbNbWPDjLoBcsjb5Mg998OTU+Ve
         F/29k0wsGlSsc0ODq0RoDtauFP4LOlEB4nqg1vlam5DU/HjaRtnYGrHA/v1Sq82fu7e5
         KXBW/BAnMS+tmqhmJc6gw+CGt8eb6OnB7nnLiJmXyByclMdMo1YrLcQjbG2pFaFTKr7W
         pJFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790024865; x=1790629665;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Dpe0IKufbiRfhpiAWaY7OFMMPAcVyG0Lh2Ykv/Q/Mwg=;
        b=EaZalP7lIZIMJy6+HDcJ8Xtj6srPFTn1xkebwyN0ebScZDaprKQsHlcuWkpVBMN+Nf
         Kn0eR181ReKS5LUpbT2Lri23+cDdWeTqnjn7IJunAOwS8S8CljLDPbalgwrPxxbsjU9l
         TDP6tjDTcn3xcBWqm2R+SqL6aUq0l6kfne2Gl2hNWPY7afstHKuEajVvafWlCDCEyYiN
         zzyLR4M8n1okqkTWRHg0D4+2rW8XBayJcyUSdKy/wiisOx8o9OdAt16TTUGk6UNQNm5r
         5H+V6Tqn8Sm3ZwDgjvTYwTB+vWX6mFhCTWOnTeQtVZpX1E2YyqajflSxz+fjughFADAy
         sQYg==
X-Forwarded-Encrypted: i=1; AKwUvBzYvbba35hNrnT0PO/DwYNpNonfXr+mGiTZyKjB7juLGkz2FC7RqLP7RZsncKW9PStoijN8yzo4EyXyxiI=@vger.kernel.org
X-Gm-Message-State: AFuF++lCcR0X7FtYyIzQ1EzvH3/7Z4hSKCT5mARPJhHGSYkmL1NEh8Mo
	lUFDAVrzG0dnlCFpryO1eEX255pjf0fU2RZr0ztYrt2isndI5RKZMPik7BiO2rcCTiUylTcAbIk
	ulPUiyNYL9Q==
X-Gm-Gg: AYBFou24TL9KslYETxoe/33Wks4EpuzIgMa6aTCwuJL2wW6ueTVoxHaH5tUYRonNY5z
	7ima1XWIWAeEpdEINIyUUYEI7E/VNu9UKYIgleMbtRpE7IlwizsuHkw2M+LfQ3dMPNFpheEqpi3
	GQHm6M472Z5buWFYxRJhcG7ZexfRK8tSsun5uDpRsnra+FYO4gSlR/3YTpSTR0lTJlo2uFFvOXo
	aHCdqiZlwa4wr9A2a+9xkQY10WvvQ2ToKPYReBL1uJxck/BchyiMW/txzkow8bNDJQndFQPWt9i
	Bmq29I+aygKql1XEbmfBF2NQGPa09EhtFQAzdmJqYcTacvlkeMxC+2Y8WrjXv7fkYwQs5Xp5VhB
	zj7C2rw/xmIiVR3+SmpoAml0oBnV/6i5rDWHyUG52GKmzMtyj68PLzEY9pChFLZZuOsDEBlI3cB
	VMfjWWcGhLn3QeALvtLiiUJWfMgcjUiSzQ87uucoTthvYllNXOeoAhSy1pLu89Iiu4w2qQf7dGw
	Mc2dMVwuW67CX0W2QvUKWfhcGbqUdUvmS2hyd071W/NupN79DgwKlqLrsnRzPSyQZbjfw0z5yNL
	OMOHGz8WUb/iQU7jQcE+WyZHioewJhoCrjGqs8DZWqbUoRtjL5m57/jNgnQTTV8q
X-Received: by 2002:a05:690c:e0d0:20b0:873:5c7b:c130 with SMTP id 00721157ae682-8a1f8681a6dmr3368127b3.24.1790024864898;
        Mon, 21 Sep 2026 14:07:44 -0700 (PDT)
Received: from ?IPv6:2600:1700:6476:1430:8475:e6ce:2d2c:ddc2? ([2600:1700:6476:1430:8475:e6ce:2d2c:ddc2])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8a23e9685f6sm1452227b3.35.2026.09.21.14.07.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 14:07:44 -0700 (PDT)
Message-ID: <3c8e684e71a769765ab4c0459e53e65ca40a63ef.camel@dubeyko.com>
Subject: Re: [PATCH v6] hfsplus: validate b-tree fork extents at mount and
 inode read
From: Viacheslav Dubeyko <slava@dubeyko.com>
To: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
Cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Yangtao Li
	 <frank.li@vivo.com>, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	syzbot+f8ce6c197125ab9d72ce@syzkaller.appspotmail.com
Date: Mon, 21 Sep 2026 14:07:40 -0700
In-Reply-To: <20260918085156.920842-1-ngocthang2710.1999@gmail.com>
References: <20260918085156.920842-1-ngocthang2710.1999@gmail.com>
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

On Fri, 2026-09-18 at 15:51 +0700, Nguyen Ngoc Thang wrote:
> Validate fork extents during inode reading and mount time to catch
> on-disk corruptions early, returning appropriate errors and marking
> the tree as corrupted.
>=20
> v6:
> =C2=A0- Move fork validation logic into inode read fork function.
> =C2=A0- Refactor extent validation helpers, use volume_blocks, count =3D=
=3D 0,
> =C2=A0=C2=A0 and introduce HFSPLUS_EXTENT_LAST_IDX named constant.
> =C2=A0- Return error from hfsplus_inode_read_fork() to allow
> hfsplus_iget()
> =C2=A0=C2=A0 to catch on-disk corruption and propagate error correctly.

This patch looks like the small portion of the whole fix. As far as I
can see, this patch has lost necessary portion of fixes that we had
before.

>=20
> Signed-off-by: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
> ---
> =C2=A0fs/hfsplus/extents.c | 41 ++++++++++++++++++++++++++++
> =C2=A0fs/hfsplus/inode.c=C2=A0=C2=A0 | 65 ++++++++++++++++++++++++++-----=
-----------
> --
> =C2=A02 files changed, 79 insertions(+), 27 deletions(-)
>=20
> diff --git a/fs/hfsplus/extents.c b/fs/hfsplus/extents.c
> index eb7c11524d18..eaf3bed7ede8 100644
> --- a/fs/hfsplus/extents.c
> +++ b/fs/hfsplus/extents.c
> @@ -16,6 +16,47 @@
> =C2=A0#include "hfsplus_fs.h"
> =C2=A0#include "hfsplus_raw.h"
> =C2=A0
> +/* Index of the last extent in the fork */
> +#define HFSPLUS_EXTENT_LAST_IDX 7

I think we need to place this declaration into hfsplus_fs.h.

> +
> +static inline bool is_extents_btree(struct inode *inode)
> +{
> +=C2=A0=C2=A0=C2=A0 return inode->i_ino =3D=3D HFSPLUS_EXT_CNID;
> +}
> +
> +static bool hfsplus_extent_valid(struct hfsplus_extent *ext, u32
> volume_blocks)
> +{
> +=C2=A0=C2=A0=C2=A0 u32 start =3D be32_to_cpu(ext->start_block);
> +=C2=A0=C2=A0=C2=A0 u32 count =3D be32_to_cpu(ext->block_count);
> +
> +=C2=A0=C2=A0=C2=A0 if (count =3D=3D 0)
> +	return start =3D=3D 0;
> +
> +=C2=A0=C2=A0=C2=A0 return start + count <=3D volume_blocks;
> +}
> +
> +/*
> + * Returns 0 if fork extents are consistent, -EUCLEAN if extents
> + * past the first are corrupt, or -EIO if the first extent is
> corrupt.
> + */
> +int hfsplus_check_fork(struct super_block *sb, struct hfsplus_extent
> *ext, u32 volume_blocks)
> +{
> +=C2=A0=C2=A0=C2=A0 bool non_zero_seen =3D false;
> +=C2=A0=C2=A0=C2=A0 int i;
> +
> +=C2=A0=C2=A0=C2=A0 for (i =3D 0; i <=3D HFSPLUS_EXTENT_LAST_IDX; i++, ex=
t++) {
> +	u32 count =3D be32_to_cpu(ext->block_count);
> +
> +	if (!hfsplus_extent_valid(ext, volume_blocks) ||
> (non_zero_seen && count =3D=3D 0))
> +	=C2=A0=C2=A0=C2=A0 return i ? -EUCLEAN : -EIO;
> +
> +	if (count > 0)
> +	=C2=A0=C2=A0=C2=A0 non_zero_seen =3D true;
> +=C2=A0=C2=A0=C2=A0 }
> +
> +=C2=A0=C2=A0=C2=A0 return 0;
> +}

This logic doesn't look like the fork check.

struct hfsplus_fork_raw {
	__be64 total_size;
	__be32 clump_size;
	__be32 total_blocks;
	hfsplus_extent_rec extents;
} __packed;

We need to be sure that total_size, total_blocks are consistent with
the extents state. Also, we can check the clump_size that it is
reasonable one.

> +
> =C2=A0/* Compare two extents keys, returns 0 on same, pos/neg for
> difference */
> =C2=A0int hfsplus_ext_cmp_key(const hfsplus_btree_key *k1,
> =C2=A0			const hfsplus_btree_key *k2)
> diff --git a/fs/hfsplus/inode.c b/fs/hfsplus/inode.c
> index 2ce6de574fa6..aa201f4e80d5 100644
> --- a/fs/hfsplus/inode.c
> +++ b/fs/hfsplus/inode.c
> @@ -559,34 +559,45 @@ void hfsplus_delete_inode(struct inode *inode)
> =C2=A0	hfsplus_mark_mdb_dirty(sb);
> =C2=A0}
> =C2=A0
> -void hfsplus_inode_read_fork(struct inode *inode, struct
> hfsplus_fork_raw *fork)
> +int hfsplus_inode_read_fork(struct inode *inode, struct
> hfsplus_fork_raw *fork)

This patch hasn't any logic of checking the error code of
hfsplus_inode_read_fork().

> =C2=A0{
> -	struct super_block *sb =3D inode->i_sb;
> -	struct hfsplus_sb_info *sbi =3D HFSPLUS_SB(sb);
> -	struct hfsplus_inode_info *hip =3D HFSPLUS_I(inode);
> -	u32 count;
> -	int i;
> -
> -	memcpy(&hip->first_extents, &fork->extents,
> sizeof(hfsplus_extent_rec));
> -	for (count =3D 0, i =3D 0; i < 8; i++)
> -		count +=3D be32_to_cpu(fork->extents[i].block_count);
> -	hip->first_blocks =3D count;
> -	memset(hip->cached_extents, 0, sizeof(hfsplus_extent_rec));
> -	hip->cached_start =3D 0;
> -	hip->cached_blocks =3D 0;
> -
> -	hip->alloc_blocks =3D be32_to_cpu(fork->total_blocks);
> -	hip->phys_size =3D inode->i_size =3D be64_to_cpu(fork-
> >total_size);
> -	hip->fs_blocks =3D
> -		(inode->i_size + sb->s_blocksize - 1) >> sb-
> >s_blocksize_bits;
> -	inode_set_bytes(inode, hip->fs_blocks << sb-
> >s_blocksize_bits);
> -	hip->clump_blocks =3D
> -		be32_to_cpu(fork->clump_size) >> sbi-
> >alloc_blksz_shift;
> -	if (!hip->clump_blocks) {
> -		hip->clump_blocks =3D HFSPLUS_IS_RSRC(inode) ?
> -			sbi->rsrc_clump_blocks :
> -			sbi->data_clump_blocks;
> -	}
> +=C2=A0=C2=A0=C2=A0 struct super_block *sb =3D inode->i_sb;
> +=C2=A0=C2=A0=C2=A0 struct hfsplus_sb_info *sbi =3D HFSPLUS_SB(sb);
> +=C2=A0=C2=A0=C2=A0 struct hfsplus_inode_info *hip =3D HFSPLUS_I(inode);
> +=C2=A0=C2=A0=C2=A0 u32 count;
> +=C2=A0=C2=A0=C2=A0 int i, ret;
> +
> +=C2=A0=C2=A0=C2=A0 /* Validate fork extents to catch on-disk corruption =
early */
> +=C2=A0=C2=A0=C2=A0 ret =3D hfsplus_check_fork(sb, fork->extents, sbi->to=
tal_blocks);

We need to check the whole fork but not only extents.

> +=C2=A0=C2=A0=C2=A0 if (ret) {
> +	pr_err("hfsplus: fork check failed for inode %lu
> (err=3D%d)\n", inode->i_ino, ret);
> +	set_bit(HFSPLUS_I_CORRUPT_TREE, &hip->flags);
> +	sb->s_flags |=3D SB_RDONLY;

NO, we cannot set SB_RDONLY in this method. It can be done in
hfsplus_fill_super() or hfsplus_reconfigure().

> +	return ret; /* Return error directly to the caller */
> +=C2=A0=C2=A0=C2=A0 }
> +
> +=C2=A0=C2=A0=C2=A0 memcpy(&hip->first_extents, &fork->extents,
> sizeof(hfsplus_extent_rec));
> +=C2=A0=C2=A0=C2=A0 for (count =3D 0, i =3D 0; i <=3D HFSPLUS_EXTENT_LAST=
_IDX; i++)
> +	count +=3D be32_to_cpu(fork->extents[i].block_count);

Looks like a mess and improper formatting of the code. What's happen
here?

Thanks,
Slava.

> +=C2=A0=C2=A0=C2=A0 hip->first_blocks =3D count;
> +=C2=A0=C2=A0=C2=A0 memset(hip->cached_extents, 0, sizeof(hfsplus_extent_=
rec));
> +=C2=A0=C2=A0=C2=A0 hip->cached_start =3D 0;
> +=C2=A0=C2=A0=C2=A0 hip->cached_blocks =3D 0;
> +
> +=C2=A0=C2=A0=C2=A0 hip->alloc_blocks =3D be32_to_cpu(fork->total_blocks)=
;
> +=C2=A0=C2=A0=C2=A0 hip->phys_size =3D inode->i_size =3D be64_to_cpu(fork=
->total_size);
> +=C2=A0=C2=A0=C2=A0 hip->fs_blocks =3D
> +	(inode->i_size + sb->s_blocksize - 1) >> sb-
> >s_blocksize_bits;
> +=C2=A0=C2=A0=C2=A0 inode_set_bytes(inode, hip->fs_blocks << sb->s_blocks=
ize_bits);
> +=C2=A0=C2=A0=C2=A0 hip->clump_blocks =3D
> +	be32_to_cpu(fork->clump_size) >> sbi->alloc_blksz_shift;
> +=C2=A0=C2=A0=C2=A0 if (!hip->clump_blocks) {
> +	hip->clump_blocks =3D HFSPLUS_IS_RSRC(inode) ?
> +	=C2=A0=C2=A0=C2=A0 sbi->rsrc_clump_blocks :
> +	=C2=A0=C2=A0=C2=A0 sbi->data_clump_blocks;
> +=C2=A0=C2=A0=C2=A0 }
> +
> +=C2=A0=C2=A0=C2=A0 return 0;
> =C2=A0}
> =C2=A0
> =C2=A0void hfsplus_inode_write_fork(struct inode *inode,
