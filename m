Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66EFE38886C
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 03:19:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791515953; cv=none; b=GnKya9M2vS0ZORZrXiCJptXZaRO+n5x0rgOgQcAxTDTAUyAcaKo6+fuo7em/qWAccwlBv0oH7dehCACMTwPfeJAL8oKtaGQoq78d2of8+45chsPvvpj2rQOaQYkBU4NGf4JAyja33WG0s7u4NfYHyUuLh1fQZt3SDDsBMbPOw08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791515953; c=relaxed/simple;
	bh=2oxsA5sL6UscgvVsOje5/5iiwfa1Jckfyitm9vY7cvQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q/cQlwQ9Uesl/7fBp1RSmCsNAqxwA58ypD7jg1KDrC+2fO8VQs+bjEuPasdxuNcNv7YZ2SRuXH0ms+QT3ueQBo+wBsbhCAPIeq2zbqdjx/gbYzR4zR6SFYZOptX4GR4PrdaiTWfsX1OYoi3AypZLUo9TF+eD2Mi3ciAwQKN21RU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Ughc6Jio; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Ughc6Jio"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48b06f58380so194046f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 20:19:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1791515944; x=1792120744; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sDFURmfhLcZd5B9RBewu4q2g5LpMwGxDtDXCFqVP5Ks=;
        b=Ughc6Jiovb5iru9UXHJPL0gNJpfVzAfAVUcZJ6OprxS+ywHGgzLhv/YnJq7DlkTRpe
         U2/6QKtpXMi+luTE3AvWGam1ZnycgzQ9otBh1bPv/odHSHWjRKnPHTkbHD/nP6z39qAd
         SzoCwaKU8Z24CPZWeNabOkmxRbdv/AZtuB2PRvjw9nuyZFDKdXjtYAclnmCoh/aL1uVC
         G5RkFWlTNoFyhA9VXoAgMLbH/ATlIflxd3UVcsDZnDWgVtLRVWECBrBQITiQE+kxrwBn
         UctpEblQdqAXRNjLxrzygGNsMEG15m0YSpXfVsv8646w0hNUXl/69y2zA2e//CocCQHJ
         7VOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791515944; x=1792120744;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sDFURmfhLcZd5B9RBewu4q2g5LpMwGxDtDXCFqVP5Ks=;
        b=RbozObI181rMg7fi5waZBD+QH7h8bDVegvjj7FVF6SOAPrHhZ6plAJUTm6qvxg7Tp6
         g8b8ex01GV9POuhEsJsox0GbvqowgVGdulHJXyCjCyIknbj1uNJQIGBp4+vkpt0/QP29
         Nke+o6scrmZOdo4AcxWl6VM0kRBspvY68RMXA+fM+zV7/+xfM7wyQRX1J8S/bPqVeT5V
         oS7GtYy5F7MSA2ayP277mgsqosdo6qIGTxzvZd9J/XKkStuKkdk+420eL0n+iDeQm1g+
         zDB+ECC43kenbKVW9WIn2Hqn5c4y/Ahljo065KRw4LV3yrj0ta+qiX1h+gi3Kxi1bCya
         fBog==
X-Forwarded-Encrypted: i=1; AKwUvByug3U7SwWbSWFsOmkuU7YyCAhMgYBmF/WnU9ZkB0zUN8ruVGC23AJOIUtooC0OuSamIRvaBMcRJ423sZ8=@vger.kernel.org
X-Gm-Message-State: AFuF++kcsbsoS2BLr2SZp9zVVokQCuA+e7AqwT5gGwdD7u/5rbKTFE1K
	7PUI/ZyqFV22KOr6sftWmr6mRjHcUabGiZnnt35ZDcJfSnOxaTj/xnEsfaCe/CSC3/k=
X-Gm-Gg: AYBFou0n6aFg5NX6bTFoCow+g1uXgv8SgWu4ru1Js7aFAlfkyXttBU/SSBB7GaNlG1i
	Wk6gOiH6EaXyK/l2WZjQzXvkvI9zqHqbDw0PgPBGOnxqq02JWS4+iqM+7ftzTdBsGIXUQUblruB
	LLC/YEMroOvnr0eKy9FoTGcmS/3i0iM+2cdSF/p11osWJ4g0e2F3nOehONjPbpaILxvVh/k9ehU
	cD31WpXB0g8/+FsAsdaDivbjnWNcX4fwh3rXIdzzbBFfIzvWn6GWP5ShvxQrC4ARMroWw8AqLth
	wp3OPSo9c8VidKcnCvs3FrNhLIGv7AtpqasQ+YRto0htbg4OhEmzI5wnDL4wJVaC7C6bTQ7hte/
	O72/jfKQ5RTZe3WAPtc2TTfI4ibXFd8fyt4GR36DRul5o2xTeVMGU+fK7CQXt/Sm0EA6tDUGdfs
	qn8DvAGRMdufVInuVo65lk0dveM9cUI2w9P9yC/Kqzfmu7i2wR2nMvOLd0wbX2bTUXEwM8
X-Received: by 2002:a05:600c:1912:b0:4a0:73b:a222 with SMTP id 5b1f17b1804b1-4a18e3ee97dmr7458505e9.0.1791515944392;
        Thu, 08 Oct 2026 20:19:04 -0700 (PDT)
Received: from localhost ([202.127.77.110])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e84219e503sm2459595ad.17.2026.10.08.20.19.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 20:19:03 -0700 (PDT)
Date: Fri, 9 Oct 2026 11:18:26 +0800
From: Heming Zhao <heming.zhao@suse.com>
To: Joseph Qi <joseph.qi@linux.alibaba.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Anderson Ferneda <anderson.ferneda@braza.com.br>, Mark Fasheh <mark@fasheh.com>, Joel Becker <jlbec@evilplan.org>, 
	ocfs2-devel@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] ocfs2: deal with legacy signed xattr name hash values
Message-ID: <ashc5y5FgsvxvX0F@p15>
References: <20261008122743.616779-1-joseph.qi@linux.alibaba.com>
 <20261008122743.616779-2-joseph.qi@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261008122743.616779-2-joseph.qi@linux.alibaba.com>

On Thu, Oct 08, 2026 at 08:27:43PM +0800, Joseph Qi wrote:
> Commit 3bc753c06dd0 ("kbuild: treat char as always unsigned") set
> -funsigned-char globally, which changed the result of the naked 'char'
> load in ocfs2_xattr_name_hash():
> 
> 	hash = (hash << OCFS2_HASH_SHIFT) ^
> 	       (hash >> (8*sizeof(hash) - OCFS2_HASH_SHIFT)) ^
> 	       *name++;
> 
> A name byte >= 0x80 used to sign-extend and now zero-extends, so the
> hash no longer matches the xe_name_hash an older kernel stored.  An
> indexed xattr tree is searched by that hash alone, and both the bucket
> binary search and the entry scan within it stop as soon as the wanted
> hash falls below an entry's, so the entry is never reached: getxattr,
> setxattr and removexattr return -ENODATA for a name that listxattr
> still lists.
> 
> Search with the current unsigned hash and, on a miss, retry with the
> legacy signed one, as ext4 does in commit f3bbac32475b2 ("ext4: deal
> with legacy signed xattr name hash values").  New entries are always
> stored under the unsigned hash.  Skip the retry when the two hashes are
> equal, so that a miss on an ASCII name does not walk the tree twice.
> 
> A miss is not empty handed: ocfs2_xattr_bucket_find() leaves xs->bucket
> holding the bucket a new entry would go into.  So after a double miss
> drop it and search once more with the unsigned hash, otherwise a new
> entry would be placed by its legacy hash and stored under its unsigned
> one, breaking the ordering the search relies on.
> 
> Only indexed trees are affected; inline xattrs and non-indexed xattr
> blocks compare names with memcmp and never look at the hash.
> 
> Also spell out the signedness instead of leaving the current hash to
> -funsigned-char, as commit 854f0912f813 ("ext4: make xattr char
> unsignedness in hash explicit") did, so that both variants stay correct
> if this is backported to a kernel without the flag.
> 
> Exposed-by: 3bc753c06dd0 ("kbuild: treat char as always unsigned")
> Cc: stable@vger.kernel.org # 6.2+
> Signed-off-by: Joseph Qi <joseph.qi@linux.alibaba.com>

I agree with Sashiko review comment, the ocfs2_check_xattr_bucket_collision()
also requires the same fix.

Thanks,
Heming
> ---
>  fs/ocfs2/xattr.c | 93 ++++++++++++++++++++++++++++++++++++++++++------
>  1 file changed, 82 insertions(+), 11 deletions(-)
> 
> diff --git a/fs/ocfs2/xattr.c b/fs/ocfs2/xattr.c
> index a428fe908116..0834883ae971 100644
> --- a/fs/ocfs2/xattr.c
> +++ b/fs/ocfs2/xattr.c
> @@ -601,9 +601,10 @@ static inline const char *ocfs2_xattr_prefix(int name_index)
>  	return handler ? xattr_prefix(handler) : NULL;
>  }
>  
> -static u32 ocfs2_xattr_name_hash(struct inode *inode,
> -				 const char *name,
> -				 int name_len)
> +static u32 __ocfs2_xattr_name_hash(struct inode *inode,
> +				   const char *name,
> +				   int name_len,
> +				   bool legacy_signed)
>  {
>  	/* Get hash value of uuid from super block */
>  	u32 hash = OCFS2_SB(inode->i_sb)->uuid_hash;
> @@ -612,13 +613,30 @@ static u32 ocfs2_xattr_name_hash(struct inode *inode,
>  	/* hash extended attribute name */
>  	for (i = 0; i < name_len; i++) {
>  		hash = (hash << OCFS2_HASH_SHIFT) ^
> -		       (hash >> (8*sizeof(hash) - OCFS2_HASH_SHIFT)) ^
> -		       *name++;
> +		       (hash >> (8*sizeof(hash) - OCFS2_HASH_SHIFT));
> +		if (legacy_signed)
> +			hash ^= (signed char)name[i];
> +		else
> +			hash ^= (unsigned char)name[i];
>  	}
>  
>  	return hash;
>  }
>  
> +static u32 ocfs2_xattr_name_hash(struct inode *inode,
> +				 const char *name,
> +				 int name_len)
> +{
> +	return __ocfs2_xattr_name_hash(inode, name, name_len, false);
> +}
> +
> +static u32 ocfs2_xattr_name_hash_signed(struct inode *inode,
> +					const char *name,
> +					int name_len)
> +{
> +	return __ocfs2_xattr_name_hash(inode, name, name_len, true);
> +}
> +
>  static int ocfs2_xattr_entry_real_size(int name_len, size_t value_len)
>  {
>  	return namevalue_size(name_len, value_len) +
> @@ -4304,11 +4322,12 @@ static int ocfs2_xattr_bucket_find(struct inode *inode,
>  	return ret;
>  }
>  
> -static int ocfs2_xattr_index_block_find(struct inode *inode,
> -					struct buffer_head *root_bh,
> -					int name_index,
> -					const char *name,
> -					struct ocfs2_xattr_search *xs)
> +static int __ocfs2_xattr_index_block_find(struct inode *inode,
> +					  struct buffer_head *root_bh,
> +					  int name_index,
> +					  const char *name,
> +					  u32 name_hash,
> +					  struct ocfs2_xattr_search *xs)
>  {
>  	int ret;
>  	struct ocfs2_xattr_block *xb =
> @@ -4317,7 +4336,6 @@ static int ocfs2_xattr_index_block_find(struct inode *inode,
>  	struct ocfs2_extent_list *el = &xb_root->xt_list;
>  	u64 p_blkno = 0;
>  	u32 first_hash, num_clusters = 0;
> -	u32 name_hash = ocfs2_xattr_name_hash(inode, name, strlen(name));
>  
>  	if (le16_to_cpu(el->l_next_free_rec) == 0)
>  		return -ENODATA;
> @@ -4348,6 +4366,59 @@ static int ocfs2_xattr_index_block_find(struct inode *inode,
>  	return ret;
>  }
>  
> +static int ocfs2_xattr_index_block_find(struct inode *inode,
> +					struct buffer_head *root_bh,
> +					int name_index,
> +					const char *name,
> +					struct ocfs2_xattr_search *xs)
> +{
> +	u32 name_hash, legacy_hash;
> +	int name_len = strlen(name);
> +	int ret;
> +
> +	name_hash = ocfs2_xattr_name_hash(inode, name, name_len);
> +
> +	ret = __ocfs2_xattr_index_block_find(inode, root_bh, name_index, name,
> +					     name_hash, xs);
> +	if (ret != -ENODATA)
> +		return ret;
> +
> +	/*
> +	 * Nothing under the current hash.  The entry may have been stored by
> +	 * an older kernel, which sign-extended the name bytes when hashing.
> +	 * Skip the retry when the two hashes are equal, so that a name made
> +	 * only of ASCII does not have to walk the tree twice.
> +	 */
> +	legacy_hash = ocfs2_xattr_name_hash_signed(inode, name, name_len);
> +	if (legacy_hash == name_hash)
> +		return ret;
> +
> +	/*
> +	 * A miss still leaves xs->bucket holding the bucket a new entry would
> +	 * be inserted into, so drop it before searching again.
> +	 */
> +	ocfs2_xattr_bucket_relse(xs->bucket);
> +
> +	ret = __ocfs2_xattr_index_block_find(inode, root_bh, name_index, name,
> +					     legacy_hash, xs);
> +	if (!ret) {
> +		pr_warn_once("ocfs2: xattr tree with signed name hash\n");
> +		return ret;
> +	}
> +	if (ret != -ENODATA)
> +		return ret;
> +
> +	/*
> +	 * Not under either hash.  Restore the unsigned placement, since that
> +	 * is where a new entry is stored: leaving the bucket where the legacy
> +	 * hash put it would break the ordering the search relies on.
> +	 */
> +	ocfs2_xattr_bucket_relse(xs->bucket);
> +
> +	return __ocfs2_xattr_index_block_find(inode, root_bh, name_index, name,
> +					      name_hash, xs);
> +}
> +
>  static int ocfs2_iterate_xattr_buckets(struct inode *inode,
>  				       u64 blkno,
>  				       u32 clusters,
> -- 
> 2.39.3
> 
