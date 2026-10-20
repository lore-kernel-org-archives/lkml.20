Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792534845;
	b=WqT5e0ivzQzDJl65fmUpQ1iFXtxL5V+bD6tbQ4uwF79eFxeit1/sch4vwWY4FTt8OBRw
	 TFMid/LHdZSNySuCS9ES959ZQnwdk47QJNrlilJ3QnZwZ8uZRN9MaSLJqYFOZgfbEUh49
	 k36pGj87bFjU9VPh6OXLTSj2N5M6BfyYl4psezdn6S5eXVr//a8A5nCYGaPSgosbCkOHn
	 Z63VbI6G0YcvJodbVw12WmPctAxNandvH8L1TvrRdWn2TsdUgSFciqgyZZgNaR/OBCdta
	 gkKZrNX0hd9d5aYwS6hj49RSGRAhfn/DbHJfqGs/ge3G+JNqVTBMYYL7j3inDxdRl2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792534845;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:Autocrypt:
	 Content-Type:Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=e+rTVv+iVEWd7x5t04ng7tJ6COM7wdfTXhcIHfC1DuM=;
	b=Z96yeGv9Ebmt2R/t5XrZKRGmMGVIoDXHrdh9bA2GqXZjynEbsxtBbdyfjrdllDXTGgwc
	 h2IgrpUN2uu14byTe+kZSeeLKU8dk7lHRQ6cHzBmN4X8SzIlJ8rdb6oJZGawSqRX9Bzul
	 9dBM8hgVlTByUCdtoplMmtXMGov8hz2pKs5YEKdLKqjlU6tE0AECIlACvm3g49H7XNuqg
	 uEkYBrRsaCzxKvJU2VwS7X9d4Sq4/E6EkhN9tTGSgqCsJLEPbOopbfiXGN0TDS/5lHApY
	 YilfbhbqgAvbScKE7rdoPd0lwVqu8ZG4GxPMHCdI/zetDG5XXSPc+5/2luYNuSILkAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=dubeyko.com;
	spf=pass smtp.mailfrom=dubeyko.com;
	dkim=pass header.d=dubeyko-com.20251104.gappssmtp.com header.i=@dubeyko-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=MqPk8s2a;
	arc=none smtp.remote-ip=209.85.128.173
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A410606A31D
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 22:20:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A410606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dubeyko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dubeyko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=dubeyko-com.20251104.gappssmtp.com header.i=@dubeyko-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=MqPk8s2a
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-8b0a28a720aso1216507b3.2
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 15:20:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dubeyko-com.20251104.gappssmtp.com; s=20251104; t=1792534843; x=1793139643; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=e+rTVv+iVEWd7x5t04ng7tJ6COM7wdfTXhcIHfC1DuM=;
        b=MqPk8s2a4tjVazcQHMfxG051sFME4NlP1WUT0DIlituCnD1S+lzkfKxLK/TXi6f/Bi
         UtmG4uh7z2l8FoMSTAa3vWo6J8xB65/dvUUASQVo7uUY2xHw81xRxQYMfKhFBugmuLDS
         27lwafyyM3mp+EF1sBdKs11vYiVDS2wKl/CZWOMTXvXvL9D+/7Y30xNVQtdL/aoZOwV5
         KXG+8oL60CwFN7zLFsh8fusIKRKYO+wD9Un0fdUIoAWaJ5bAsFqq72MAi/HAkpZxM14v
         3tqYUzb/TOEy8Q4c7eDG+6Cj7QJM4na+O7sWqP6HpPFCN+gdS4CCSFfI3xmyOQD9CUWB
         dOww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792534843; x=1793139643;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=e+rTVv+iVEWd7x5t04ng7tJ6COM7wdfTXhcIHfC1DuM=;
        b=UPuBOo/PJ7a/7SpDzFVN7pb8ODvFyWwS4Jlg7H8vUBBS+WadOzCTpkHZ5iWYfCcStR
         JEpo0P/7+VXXFeb75n//7WV2gfiHiPV/M9a7JgW59sLU6wO/J4bSmPRjcK8prPQCaveD
         uvVMsdBFjFxP+Y/fbOhJjV/AmWJOQHdR/EQM93c3CjdCoT7f3nH3V/fYOlOCZpQc83bw
         8og8QG4qbpYsihezRJf3vaP33T/26Mf3/Z/jz9wO8Qwy2Jf7E12cjm2qPEQuy//gOVhw
         dfwbB+BVtYh8MNZYnJh6+MycAuPdD/Y1GBk+uYOM2oGuukxx8FfsJX/HuYXsw1zzoigq
         6xgA==
X-Forwarded-Encrypted: i=1; AKwUvBymT9nmnLpCqAuvwx6iMatVR9MOlKUDt22wRROwupmbPIkIOHRjOzGjAotgUTwvo8TSoIU6fNvimQaDEjY=@vger.kernel.org
X-Gm-Message-State: AFq9FYLi89plavbNo3Efw4rLzLFx2k2OJwIsETFCcoQQIiO9yz+G4J/J
	zOftDn0I3VDLdNzy/uGCf8T6tX3B51VwGkf1F+QONU5/BYSrmrvdwn74YLHfGWxy5mA=
X-Gm-Gg: AYBFou35Zru/ULQLFUv6fcC2v1YkBuGQg/HYr9IYVEeYWpOnfqcUDsILIRgWX4YUDGs
	WGKC+5sr66mZa5l5dDS3gJ0xk3Yg6PwRRNxK6Gq5LyYHYWL4GlQwkLTu/pZzUy4pT4aydhW/xij
	NmlHoZatEuKXXeTTxegQykHdfEjcoixJBojsfmF5VakRpEWSU2z6XDirrp82L7kwfqb7vjRfonz
	gh20NDzE1iLyXfLXQZQ8T5/MPnEL5BzuU/2H6okjspzHUondDXwL+X5rYSIWgmAun50ZpxU3xQ3
	/DVtIZhCo8Eyqll8ju1oUgAZ5qKflZXTDZLGCFLjhVTWEjOhui1Gn7rOC5r9cFuDiyg7JDbDHmv
	txCnD9gHVHlwplMPyqsPNcflXSR6i1klChtHr0noT+n8xfhcpodc5n8sG2Ko97kd0lV+3r/zYt3
	HaDMjOeEIkGier615jl3aoPMhJctOlDaOYFqqCtV/Wa6OkhRd+T2bd8ZDVoPiNjypLxwgpj147b
	U0kz8yN0nlXICgOj2gQ2lryf70S7fDSlk70n3O1RX4mYFD+YaE+gRYLQZh7TGhjO+kz5Lubc3qv
	cBWXqz8oNVBPlszogy+MnVJoCAMJIDXwzVqfwVHxuEyx/RxvvqW/LuVr1l7O2A==
X-Received: by 2002:a05:690c:e183:10b0:8a8:7e5a:dc2f with SMTP id 00721157ae682-8b133e48e78mr1338827b3.12.1792534843355;
        Tue, 20 Oct 2026 15:20:43 -0700 (PDT)
Received: from ?IPv6:2600:1700:6476:1430:9597:5848:ae16:6bc? ([2600:1700:6476:1430:9597:5848:ae16:6bc])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b1301045a3sm3834287b3.28.2026.10.20.15.20.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 15:20:42 -0700 (PDT)
Message-ID: <582a511b9ff2229d012587e93249b1c3df2cc7e1.camel@dubeyko.com>
Subject: Re: [PATCH v6 1/2] hfs: initialize B-tree inodes and validate
 catalog CNIDs
From: Viacheslav Dubeyko <slava@dubeyko.com>
To: yangguikun <yangguikun19@qq.com>, John Paul Adrian Glaubitz
	 <glaubitz@physik.fu-berlin.de>, Yangtao Li <frank.li@vivo.com>
Cc: linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Tue, 20 Oct 2026 15:20:39 -0700
In-Reply-To: <tencent_63539C28151F9BA8C854BF6FAF9101A72707@qq.com>
References: <tencent_63539C28151F9BA8C854BF6FAF9101A72707@qq.com>
Autocrypt: addr=slava@dubeyko.com; prefer-encrypt=mutual;
 keydata=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
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.1 (by Flathub.org) 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Tue, 2026-10-20 at 18:19 +0800, yangguikun wrote:
> hfs_btree_open() leaves the internal B-tree inodes with i_mode =3D=3D 0.
> A crafted catalog record naming CNID 3 or 4 can return one of these
> cached inodes through hfs_iget(), triggering VFS_BUG_ON_INODE() in
> may_open() with CONFIG_DEBUG_VFS=3Dy.
>=20
> Initialize the B-tree inodes with S_IFREG and their address-space
> operations before publishing them. Reject attempts to reuse an
> already-cached B-tree inode.
>=20
> Validate catalog CNIDs and record types before the inode-cache
> lookup,
> since cached inodes bypass hfs_read_inode() validation. This also
> prevents a crafted file record from aliasing the root directory
> inode.
>=20
> Found by syzkaller-style fuzzing of v7.2-rc7.
>=20
> Suggested-by: Viacheslav Dubeyko <slava@dubeyko.com>
> Link:
> https://lore.kernel.org/linux-fsdevel/tencent_24D928451FEFA8A35482EFFA913=
2A7305307@qq.com/
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Cc: stable@vger.kernel.org
> Signed-off-by: yangguikun <yangguikun19@qq.com>
> ---
> Changes in v6:
> =C2=A0- Drop set_nlink() and tz_secondswest initialization for B-tree
> inodes.
> =C2=A0- Use WARN_ON_ONCE() for an already-cached B-tree inode.
> =C2=A0- Defer hfs_iget() error propagation to a separate patch.
>=20
> diff --git a/fs/hfs/btree.c b/fs/hfs/btree.c
> index 41b4e8f..1891ad5 100644
> --- a/fs/hfs/btree.c
> +++ b/fs/hfs/btree.c
> @@ -155,44 +155,9 @@ struct hfs_btree *hfs_btree_open(struct
> super_block *sb, u32 id, btree_keycmp ke
> =C2=A0	tree->cnid =3D id;
> =C2=A0	tree->keycmp =3D keycmp;
> =C2=A0
> -	tree->inode =3D iget_locked(sb, id);
> -	if (!tree->inode)
> +	tree->inode =3D hfs_system_iget(sb, id);
> +	if (IS_ERR(tree->inode))
> =C2=A0		goto free_tree;
> -	BUG_ON(!(inode_state_read_once(tree->inode) & I_NEW));
> -	{
> -	struct hfs_mdb *mdb =3D HFS_SB(sb)->mdb;
> -	HFS_I(tree->inode)->flags =3D 0;
> -	mutex_init(&HFS_I(tree->inode)->extents_lock);
> -	switch (id) {
> -	case HFS_EXT_CNID:
> -		hfs_inode_read_fork(tree->inode, mdb->drXTExtRec,
> mdb->drXTFlSize,
> -				=C2=A0=C2=A0=C2=A0 mdb->drXTFlSize,
> be32_to_cpu(mdb->drXTClpSiz));
> -		if (HFS_I(tree->inode)->alloc_blocks >
> -					HFS_I(tree->inode)-
> >first_blocks) {
> -			pr_err("invalid btree extent records\n");
> -			unlock_new_inode(tree->inode);
> -			goto free_inode;
> -		}
> -
> -		tree->inode->i_mapping->a_ops =3D &hfs_btree_aops;
> -		break;
> -	case HFS_CAT_CNID:
> -		hfs_inode_read_fork(tree->inode, mdb->drCTExtRec,
> mdb->drCTFlSize,
> -				=C2=A0=C2=A0=C2=A0 mdb->drCTFlSize,
> be32_to_cpu(mdb->drCTClpSiz));
> -
> -		if (!HFS_I(tree->inode)->first_blocks) {
> -			pr_err("invalid btree extent records (0
> size)\n");
> -			unlock_new_inode(tree->inode);
> -			goto free_inode;
> -		}
> -
> -		tree->inode->i_mapping->a_ops =3D &hfs_btree_aops;
> -		break;
> -	default:
> -		BUG();
> -	}
> -	}
> -	unlock_new_inode(tree->inode);
> =C2=A0
> =C2=A0	mapping =3D tree->inode->i_mapping;
> =C2=A0	folio =3D filemap_grab_folio(mapping, 0);
> diff --git a/fs/hfs/hfs_fs.h b/fs/hfs/hfs_fs.h
> index e250f87..8d52170 100644
> --- a/fs/hfs/hfs_fs.h
> +++ b/fs/hfs/hfs_fs.h
> @@ -163,6 +163,11 @@ extern int hfs_cat_move(u32 cnid, struct inode
> *src_dir,
> =C2=A0extern void hfs_cat_build_key(struct super_block *sb, btree_key
> *key,
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u32 parent, const struct qstr *na=
me);
> =C2=A0
> +static inline bool hfs_is_system_reserved_cnid(u32 cnid)
> +{
> +	return cnid > HFS_ROOT_CNID && cnid < HFS_FIRSTUSER_CNID;
> +}
> +
> =C2=A0/*
> =C2=A0 * Validate the CNID of a catalog record.
> =C2=A0 */
> @@ -219,6 +224,7 @@ extern void hfs_inode_read_fork(struct inode
> *inode, struct hfs_extent *ext,
> =C2=A0				u32 clump_size);
> =C2=A0extern struct inode *hfs_iget(struct super_block *sb, struct
> hfs_cat_key *key,
> =C2=A0				hfs_cat_rec *rec);
> +extern struct inode *hfs_system_iget(struct super_block *sb, u32
> cnid);
> =C2=A0extern void hfs_evict_inode(struct inode *inode);
> =C2=A0extern void hfs_delete_inode(struct inode *inode);
> =C2=A0
> diff --git a/fs/hfs/inode.c b/fs/hfs/inode.c
> index 2aef3c3..a66de7b 100644
> --- a/fs/hfs/inode.c
> +++ b/fs/hfs/inode.c
> @@ -421,6 +421,69 @@ static int hfs_read_inode(struct inode *inode,
> void *data)
> =C2=A0	return 0;
> =C2=A0}
> =C2=A0
> +static int hfs_system_read_inode(struct inode *inode)
> +{
> +	struct hfs_sb_info *hsb =3D HFS_SB(inode->i_sb);
> +	struct hfs_mdb *mdb =3D hsb->mdb;
> +
> +	HFS_I(inode)->flags =3D 0;
> +	HFS_I(inode)->rsrc_inode =3D NULL;
> +	mutex_init(&HFS_I(inode)->extents_lock);
> +
> +	inode->i_uid =3D hsb->s_uid;
> +	inode->i_gid =3D hsb->s_gid;
> +
> +	inode->i_mode =3D S_IFREG;
> +	inode->i_mapping->a_ops =3D &hfs_btree_aops;
> +
> +	switch (inode->i_ino) {
> +	case HFS_EXT_CNID:
> +		hfs_inode_read_fork(inode, mdb->drXTExtRec, mdb-
> >drXTFlSize,
> +				=C2=A0=C2=A0=C2=A0 mdb->drXTFlSize,
> be32_to_cpu(mdb->drXTClpSiz));
> +		if (HFS_I(inode)->alloc_blocks > HFS_I(inode)-
> >first_blocks) {
> +			pr_err("invalid btree extent records\n");
> +			return -EIO;
> +		}
> +		break;
> +	case HFS_CAT_CNID:
> +		hfs_inode_read_fork(inode, mdb->drCTExtRec, mdb-
> >drCTFlSize,
> +				=C2=A0=C2=A0=C2=A0 mdb->drCTFlSize,
> be32_to_cpu(mdb->drCTClpSiz));
> +		if (!HFS_I(inode)->first_blocks) {
> +			pr_err("invalid btree extent records (0
> size)\n");
> +			return -EIO;
> +		}
> +		break;
> +	default:
> +		return -EIO;
> +	}
> +
> +	return 0;
> +}
> +
> +struct inode *hfs_system_iget(struct super_block *sb, u32 cnid)
> +{
> +	struct inode *inode;
> +	int err;
> +
> +	inode =3D iget_locked(sb, cnid);
> +	if (!inode)
> +		return ERR_PTR(-ENOMEM);
> +
> +	if (WARN_ON_ONCE(!(inode_state_read_once(inode) & I_NEW))) {
> +		iput(inode);
> +		return ERR_PTR(-EEXIST);
> +	}
> +
> +	err =3D hfs_system_read_inode(inode);
> +	if (err) {
> +		iget_failed(inode);
> +		return ERR_PTR(err);
> +	}
> +
> +	unlock_new_inode(inode);
> +	return inode;
> +}
> +
> =C2=A0/*
> =C2=A0 * __hfs_iget()
> =C2=A0 *
> @@ -446,6 +509,11 @@ struct inode *hfs_iget(struct super_block *sb,
> struct hfs_cat_key *key, hfs_cat_
> =C2=A0	default:
> =C2=A0		return NULL;
> =C2=A0	}
> +
> +	if (!hfs_is_valid_cnid(cnid, rec->type) ||
> +	=C2=A0=C2=A0=C2=A0 hfs_is_system_reserved_cnid(cnid))
> +		return NULL;
> +
> =C2=A0	inode =3D iget5_locked(sb, cnid, hfs_test_inode,
> hfs_read_inode, &data);
> =C2=A0	if (inode && (inode_state_read_once(inode) & I_NEW))
> =C2=A0		unlock_new_inode(inode);

Looks good. I have run the xfstests for both patches and I don't see
any new issue.

Before the patch: Failed 121 of 786 tests
After the patch: Failed 117 of 786 tests

Reviewed-by: Viacheslav Dubeyko <slava@dubeyko.com>
Tested-by: Viacheslav Dubeyko <slava@dubeyko.com>

Thanks,
Slava.
