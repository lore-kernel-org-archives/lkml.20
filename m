Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794381277;
	b=U1uqErw77ywpq3FWKE7IUfuoCIwwwH6aPVytDfpL61LK3gtHpsBDmFrLe3f/z1cAeeas
	 MNO387l1//0urwKJzHLTCVQx65PuirfCapdgl1WD/exe4MpwVsTLRz3X2zwB20n+IvMRy
	 F7IrSSRV8mwyhtBwHPD2r8aBWMwuw4MdgK7AgsoteUTEZ9aPikxvjEoirusC0/puGeonv
	 XKutzLcAJKvyhsdbVS7LjQadUnbVoZXi37PX6HcCi/hck14K1oy3tjG2kZnoOj7XYylrH
	 FVmic9L1x/ZWQld94GMdd74ArtCKPcbr1gwwQuDZh1Pd77Q63w2M0dB11wyhv6P5w0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794381277;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:Cc:
	 Subject:To:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=Cq2E1uKdZ783sjjOxhVnebYndYYK303rRB0ChWVgkT8=;
	b=S70oUnCk6UqP0urFSoI5Id6yZ/uowGt4TEoPXTdlC9l+nTq4m/U9b/rGXIBWXHyOT6l1
	 vHaRH36bKN2jv3bU5iXoJILsGDb0g+xQbHGFbGU0J6V3RXZ/g1EIx9yf0IvNWMRpxAiU9
	 zWWt8uq8NGoTteOGG4ss+UoP34UyxAtZCQ6GbGYgBDceuZiZf/OlSLARFQDypnZxnx9z2
	 KgdKj+6vtAXbpjUJoucfY7M5kPfUJXktr1RAtWox0qUywavRuZntwTTVaHsog6kiN3J57
	 FNf9mhgoAW1UaMXiHRrVOBrWmKP4mYhh/c7w+c7GNF2tw2D8esBQnIlEZ/aakKExeZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=H1h8dUDI;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58FB2606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 07:14:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=H1h8dUDI
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1C791F00A05;
	Wed, 11 Nov 2026 07:14:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794381276;
	bh=Cq2E1uKdZ783sjjOxhVnebYndYYK303rRB0ChWVgkT8=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To;
	b=H1h8dUDInYVnHiVg7I/ImQemco1EnK1Htj/zPcAndtcjh75bc8PWeKxnocMJQIvG/
	 DOLNCiqaT3pPmiU2CJbVpfkikOqnkiC2/t8ttGoIXjP5VX7YVz42zs2tEJCpxCTQx5
	 11pUryNXwe2HyPZHY+N6dOmFIbhSNVsa7qCvpSv7KsPrtWQ0OB6+HCBLaAfsKAwHGH
	 ZehrjOgtS8NoRNy7lo/Wr5cveV3kScucbaVcD4XaxU2pMOe8a/5yy3SuYV1qpYYVcM
	 WmM2ZQ6N38dVzsxSjUnvxdWRs3xCLdSRkOPPAlkOLYuqMVC8jnghXnSdaHI2REUQP8
	 sC5kmVy1RO34g==
Message-ID: <8dd16c29-ed2a-418a-bd9a-4a9949cd53f1@kernel.org>
Date: Wed, 11 Nov 2026 15:14:34 +0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: chao@kernel.org, linux-f2fs-devel@lists.linux.dev,
 linux-kernel@vger.kernel.org, yi1.lai@intel.com
Subject: Re: [PATCH v2] f2fs: verify inode data-block ownership at mount
To: Haoran Wang <haoranwangsec@gmail.com>, jaegeuk@kernel.org
References: <6ad2359d.0083e9c2.97e0f.79de@mx.google.com>
 <20261109171601.75996-1-haoranwangsec@gmail.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20261109171601.75996-1-haoranwangsec@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Haoran,

Thanks for the contribution.

On 11/9/26 17:16, Haoran Wang wrote:
> At mount time, walk the NAT to enumerate live inode blocks and claim the
> direct data blocks referenced by each regular inode's i_addr region in a
> bitmap.  If two inodes claim the same data block, fail the mount with
> -EFSCORRUPTED, since at least one of them is forged or corrupted.

It seems quite heavy to load all valid nodes for verification whenever mount(),
it may slow down bootup time of filesystem significantly.

If storage device in special environment is not reliable, what do you think of
running fsck.f2fs to do a full check before mount()?

Thanks,

> 
> The check is NAT-driven, so blocks unreachable from the NAT - such as
> stale images left by earlier mkfs runs on untrimmed disks - are ignored
> and cannot trigger false positives.
> 
> Reported-by: kernel test robot <yi1.lai@intel.com>
> Closes: https://lore.kernel.org/oe-lkp/202610262143.a92547a9-lkp@intel.com
> Signed-off-by: Haoran Wang <haoranwangsec@gmail.com>
> 
> ---
> Changes since v1: fix the false positive reported by the kernel test
> robot: v1 scanned the whole main area with sb_bread and trusted stale
> inode blocks left on disk by earlier mkfs runs, failing the mount.
> Rework the scan to walk the NAT so only NAT-reachable inodes are checked.
> 
>  fs/f2fs/f2fs.h  |    1 +
>  fs/f2fs/node.c  |   98 +++++++++++++++++++++++++++++++++++++++++++++++
>  fs/f2fs/super.c |    5 ++
>  3 files changed, 104 insertions(+)
> 
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -4000,6 +4000,7 @@
>  bool f2fs_need_dentry_mark(struct f2fs_sb_info *sbi, nid_t nid);
>  bool f2fs_is_checkpointed_node(struct f2fs_sb_info *sbi, nid_t nid);
>  bool f2fs_need_inode_block_update(struct f2fs_sb_info *sbi, nid_t ino);
> +int f2fs_verify_inode_data_ownership(struct f2fs_sb_info *sbi);
>  int f2fs_get_node_info(struct f2fs_sb_info *sbi, nid_t nid,
>  				struct node_info *ni, bool checkpoint_context);
>  pgoff_t f2fs_get_next_page_offset(struct dnode_of_data *dn, pgoff_t pgofs);
> --- a/fs/f2fs/node.c
> +++ b/fs/f2fs/node.c
> @@ -3455,6 +3455,111 @@
>  	return 0;
>  }
>  
> +
> +static int f2fs_claim_data_addr(unsigned long *claimed, block_t main_b,
> +		block_t total, block_t blkaddr)
> +{
> +	if (blkaddr == NULL_ADDR || blkaddr == NEW_ADDR)
> +		return 0;
> +	if (blkaddr < main_b || blkaddr >= total)
> +		return 0;
> +	if (test_and_set_bit(blkaddr - main_b, claimed))
> +		return -EFSCORRUPTED;
> +	return 0;
> +}
> +
> +/*
> + * Verify that no data block in the main area is claimed by more than one
> + * regular inode.  Walk the NAT (the authoritative index of live node
> + * blocks) instead of scanning the raw main area, so stale node blocks
> + * left on disk by previous filesystem generations are ignored.  Only
> + * inodes reachable from the NAT are checked; inline-data files carry no
> + * separate data block and are out of scope.
> + */
> +int f2fs_verify_inode_data_ownership(struct f2fs_sb_info *sbi)
> +{
> +	struct f2fs_nm_info *nm_i = NM_I(sbi);
> +	struct f2fs_super_block *raw = F2FS_RAW_SUPER(sbi);
> +	block_t main_b = le32_to_cpu(raw->main_blkaddr);
> +	block_t total = le64_to_cpu(raw->block_count);
> +	unsigned long *claimed;
> +	struct f2fs_node *fn;
> +	struct f2fs_inode *ri;
> +	struct folio *folio;
> +	unsigned long *bitmap_bits;
> +	nid_t nid;
> +	int err = 0;
> +
> +	bitmap_bits = kvzalloc_objs(*bitmap_bits,
> +				      BITS_TO_LONGS(total - main_b),
> +				      GFP_KERNEL);
> +	if (!bitmap_bits)
> +		return -ENOMEM;
> +	claimed = bitmap_bits;
> +
> +	/* skip the f2fs-internal metadata inodes (NODE_INO, META_INO):
> +	 * their NAT entries are not user data and trip
> +	 * "inconsistent nat entry" on every lookup.
> +	 */
> +	for (nid = F2FS_ROOT_INO(sbi); nid < nm_i->max_nid; nid++) {
> +		struct node_info ni;
> +		int base, end, i;
> +
> +		/* only live inode blocks: NAT entry valid and nid == ino */
> +		if (f2fs_get_node_info(sbi, nid, &ni, false))
> +			continue;
> +		if (ni.blk_addr == NULL_ADDR || ni.blk_addr == NEW_ADDR)
> +			continue;
> +		if (ni.ino != nid)
> +			continue;
> +
> +		folio = f2fs_get_node_folio(sbi, nid, NODE_TYPE_INODE);
> +		if (IS_ERR(folio)) {
> +			err = PTR_ERR(folio);
> +			if (err == -ENOENT)
> +				err = 0;	/* node gone, skip */
> +			else
> +				break;
> +			continue;
> +		}
> +		fn = F2FS_NODE(folio);
> +		ri = &fn->i;
> +		if (!S_ISREG(le16_to_cpu(ri->i_mode)))
> +			goto next;
> +		if (ri->i_inline & (F2FS_INLINE_DATA | F2FS_INLINE_DENTRY))
> +			goto next;
> +		if (le32_to_cpu(ri->i_flags) & F2FS_COMPR_FL)
> +			goto next;
> +		base = (ri->i_inline & F2FS_EXTRA_ATTR)
> +			? le16_to_cpu(ri->i_extra_isize) / 4 : 0;
> +		end = DEF_ADDRS_PER_INODE;
> +		if (ri->i_inline & F2FS_INLINE_XATTR) {
> +			if (f2fs_sb_has_flexible_inline_xattr(sbi) &&
> +					(ri->i_inline & F2FS_EXTRA_ATTR))
> +				end -= le16_to_cpu(ri->i_inline_xattr_size);
> +			else
> +				end -= DEFAULT_INLINE_XATTR_ADDRS;
> +		}
> +		if (base > end || end > DEF_ADDRS_PER_INODE)
> +			goto next;
> +		for (i = base; i < end; i++) {
> +			err = f2fs_claim_data_addr(claimed, main_b, total,
> +					le32_to_cpu(ri->i_addr[i]));
> +			if (err) {
> +				f2fs_err(sbi, "inode %u claims data block %u already owned by another inode",
> +					 nid, le32_to_cpu(ri->i_addr[i]));
> +				f2fs_folio_put(folio, true);
> +				goto out;
> +			}
> +		}
> +next:
> +		f2fs_folio_put(folio, true);
> +	}
> +out:
> +	kvfree(claimed);
> +	return err;
> +}
> +
>  int f2fs_build_node_manager(struct f2fs_sb_info *sbi)
>  {
>  	int err;
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c
> @@ -5372,6 +5372,12 @@
>  	if (err)
>  		goto free_root_inode;
>  
> +	err = f2fs_verify_inode_data_ownership(sbi);
> +	if (err) {
> +		f2fs_err(sbi, "data block referenced by multiple inodes");
> +		goto free_root_inode;
> +	}
> +
>  	err = f2fs_register_sysfs(sbi);
>  	if (err)
>  		goto free_compress_inode;

