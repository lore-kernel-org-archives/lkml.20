Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 139D22FDC20
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 01:16:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790126195; cv=none; b=KDuJ9shQoJzq2XkrBLSMlMVRMp7PYrfiZ+S7ImdKyyRz5145KRxJpd0YFYU7CkC+gmmKuZdHPVu+RcuLTKGfgqOcfooWE9+KC/cpmuXgZPBeSUCMpJt6WRB7pqsEMdjz7XRPbB6aRi3SBV22zq/IhiNxzCQYttJN8U3dbM2R3Bk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790126195; c=relaxed/simple;
	bh=a2c2CW6PypfgOVWO7cUHyksDLEj6SEFvukGjc6yON3M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VNu2tetUJ2vwr7uLkJQYX59NbFwh5u5PTD2P6c59gGamFBYIoDHcm07ss7klrUY+yJ/2yr3pHUfN2vh0q9yrMT3w2sjE1n5Iiq+yxyQtU2xwWzQT51T/CuX+I6nJCKqjBwKGpwOOXbi0673B7yywiWAwFXoKLoeEQeAjvZoCIWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ol+x+Ekw; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ol+x+Ekw"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d747ec6188so1856585ad.3
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 18:16:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790126193; x=1790730993; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5lWji8UmxNSsnkxKoH/cSiuyuZZ53U03RDNiUtRnj4I=;
        b=ol+x+EkwHJFMsHk/0MU7eAfc26OQTzd/g2DRb85cFN8pcVG8i0IRWPJd2d/MOjFl6V
         M935asisjE/4cifmNBITRlMx8T/RlMLtNleaRNb8BzF2tM5vpKAVorznpWNn3GzBnxgu
         kTChSchbDdiFo5n4Nv7Jf1z/iCZ5EQwZHvgEuRNlPpQ7wem7W3XiNK/77yrl4KK9eIOS
         rIuS6lGdT+LLRRqC3BSg4BlDppUY0wGcZlioTmZfgO0D4bqRHYTeXWn/3tU8d6xIj3dY
         ad49EWtIWcO+K8a8rNzcYACBn7AjEIH3tyxoczHK5kEFNCLIingNLOScuZ2ZhtQ+BRjd
         7ICg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790126193; x=1790730993;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5lWji8UmxNSsnkxKoH/cSiuyuZZ53U03RDNiUtRnj4I=;
        b=g2xwcZdOxPDaj6I6caQCad8mCGUQuzb/Bzk/cbAioMY8yx4pPe/jvxJJRiKce5xhFC
         S8ceBTSzQSwGB3hRhv+RCJKFr6wmUJ+YBUPhCH5X+ZLYx72DXEBwo3jq/F0MiQX/qVsP
         +obb+hPkY87Zuc0cJDgkW8qGn+7DQd3u4P0OkaNcuot/ewBzpD85tQ/QK4kUQm0O9g+7
         Kk8ugk9cZeHZf7c17AczY/ObAVvSFYfkMsEdySFqeCVYF4mmn3w3sda81+WN6wBHAoQK
         qq/LXvYfQa3NbNV1KJlsI+O7LS6ByZUsFqNayWQyStOiGH0N/pfMf7XUpa7YjPKkjak9
         yNtg==
X-Forwarded-Encrypted: i=1; AKwUvBwuANi5JJpviA1X9DQJ7DZNrdmwhrX0kFVsSpN/o71ohbKOBwuOiKwcr5r5qbbVFsiV4sZC3/q9CXGYI1w=@vger.kernel.org
X-Gm-Message-State: AFuF++lLqyZZKk7MYHPVt8wZROXh0LOkwJpicwYjOQl/znqCw8jyUOWG
	z1chJyHyYNMmf2YOoXKs7KJianY4yJ3YW1F0UQm//0QnV3czuCfD3qwt
X-Gm-Gg: AYBFou2uaytTwDNVtYqG85QnFkd9FRy3gtY0yD0pNRkP0oBfPatD+w5t/rVlHaFE/fI
	OXqtnEZeui+GsJpxO81tTahG2NfB4j9ohHxjyvJXd6DFXYOGLCIrBJ/pV/d0shiom70no8Fv3+x
	h2AfdFoXg5eZ2KEFfSXkQGFu0anN/emjyXSRAdm+qF48hCF7L/qcpWZ1DYMI8me+7EFUcjQKpm1
	rGir5L8uSlA8zOITANXjvPXj6Yqte4IKgsMqSkkLznwK6Qgie0wr2nXXzBw/Qz3WR4JpJ3qvRO0
	FjQHs5C2hpik1IaXN6HiRHwIUqy0Yqc8BuXYeHtIjCLQjTMhTdL1UsfaDQnzCeJhSWfD9hdQp8V
	Nlci9YGq+b7HQS7y5MqM9Rk7CYIq6poQXUlFLOELIBEA/G5fFgG04xIdCboXg4re9ce1H8Y157K
	6q9jrSjFSPS2I2pDpfdpFLHRrlCg1TLll9Zjh+xzWDmk2zkj0Z3bjmdxcdUzAIu63weGdHxuo=
X-Received: by 2002:a17:90b:3d8e:b0:39d:8794:5564 with SMTP id 98e67ed59e1d1-3a07e568a05mr1067626a91.12.1790126193148;
        Tue, 22 Sep 2026 18:16:33 -0700 (PDT)
Received: from localhost ([27.122.242.71])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df6a5db05dsm2499195ad.49.2026.09.22.18.16.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 18:16:30 -0700 (PDT)
Date: Wed, 23 Sep 2026 10:16:26 +0900
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Matthias Goergens <matthias.goergens@gmail.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>, ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ntfs: fail the mount when $MFT needs its own extent
 records
Message-ID: <arMoap0ZgeORuktT@hyunchul-PC02>
References: <20260922153931.1976405-1-matthias.goergens@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260922153931.1976405-1-matthias.goergens@gmail.com>

Hi Matthias,

On Tue, Sep 22, 2026 at 11:39:31PM +0800, Matthias Goergens wrote:
> Mounting a crafted image hangs the mount process forever: no output, no
> progress, unkillable, 0% CPU.  Nothing is reported, because the task is
> not blocked on any lock lockdep tracks.  With PROVE_LOCKING and
> DEBUG_MUTEXES on it stays silent, and only the hung-task detector
> notices:
> 
>   INFO: task mount:74 blocked in I/O wait for more than 30 seconds.
>   locks held by mount/74: 1
>     #0: (&type->s_umount_key#26/1) at sget_fc
> 
> It is a folio lock, which lockdep does not track:
> 
>   folio_wait_bit_common      <- waits forever
>   filemap_read_folio
>   map_mft_record_folio
>   map_mft_record
>   ntfs_map_runlist_nolock
>   ntfs_attr_vcn_to_rl
>   __ntfs_read_iomap_begin
>   iomap_read_folio
>   ntfs_read_folio            <- already holds that folio's lock
>   ntfs_read_inode_mount
>   ntfs_fill_super
> 
> ntfs_read_inode_mount() builds the first extent of $MFT/$DATA by hand
> and then calls ntfs_read_locked_inode() to pick up $MFT's remaining
> attributes.  The comment there says what that assumes:
> 
> 	 * ... we would hope that we don't need
> 	 * further extents in order to find the other
> 	 * attributes belonging to $MFT. ... But lets
> 	 * hope this never happens...
> 
> An image whose $MFT attribute list puts those attributes in one of
> $MFT's own extent records makes it false.  Mapping that extent record
> reads $MFT at a vcn the half-built runlist does not cover, so the read
> comes back into ntfs_map_runlist_nolock() for $MFT while it already
> holds the lock on the folio it then waits for.
> 
> So check it.  Mark the volume while the bootstrap is assembling $MFT's
> runlist, and refuse to map $MFT's runlist through the general path
> while that mark is set.  The bootstrap builds the runlist itself with
> ntfs_mapping_pairs_decompress() and never goes through the guarded
> path, so only the re-entrant case is rejected.
> 
> The mount now fails instead of hanging:
> 
>   ntfs: (device vda): ntfs_map_runlist_nolock(): $MFT needs its own
>     extent records to describe itself. $MFT is corrupt. Run chkdsk.
>   ntfs: (device vda): ntfs_read_inode_mount(): ntfs_read_inode() of
>     $MFT failed.
> 
> The guard bails before the function touches anything: no search
> context, no mapped record, no lock taken.  -EIO is not a new return
> value here either, and all six call sites already handle a negative
> one.  ntfs_map_runlist() and ntfs_empty_logfile() propagate it,
> ntfs_attr_vcn_to_lcn_nolock() maps it to LCN_EIO,
> ntfs_attr_find_vcn_nolock() passes it through, and
> ntfs_attr_vcn_to_rl() and ntfs_write_simple_iomap_begin_non_resident()
> only act on success, falling through to the unmapped-runlist handling
> they already have.
> 
> Found by fuzzing mountable images.  Checked under qemu with KASAN,
> PROVE_LOCKING and the hung-task detector: two crafted images hang an
> unpatched kernel and are rejected by a patched one, and eight
> well-formed images mount on both.
> 
> Fixes: b041ca562526 ("ntfs: update iomap and address space operations")
> Cc: stable@vger.kernel.org
> Signed-off-by: Matthias Goergens <matthias.goergens@gmail.com>
> ---
> The two crafted images are 28 KB each; happy to send them or put them
> somewhere fetchable.
> 
> fs/ntfs3 rejects both while loading $Volume, so it is not affected by
> these images, but I did not try fuzzing its parser.
> 
>  fs/ntfs/attrib.c | 11 +++++++++++
>  fs/ntfs/inode.c  |  2 ++
>  fs/ntfs/volume.h |  3 +++
>  3 files changed, 16 insertions(+)
> 
> diff --git a/fs/ntfs/attrib.c b/fs/ntfs/attrib.c
> index c949ff765075..f94e928f145f 100644
> --- a/fs/ntfs/attrib.c
> +++ b/fs/ntfs/attrib.c
> @@ -103,6 +103,17 @@ int ntfs_map_runlist_nolock(struct ntfs_inode *ni, s64 vcn, struct ntfs_attr_sea
>  		base_ni = ni;
>  	else
>  		base_ni = ni->ext.base_ntfs_ino;
> +	/*
> +	 * ntfs_read_inode_mount() builds $MFT's runlist itself, so nothing
> +	 * should reach here for $MFT.  A crafted image can: the read that
> +	 * gets here already holds the $MFT folio lock it would wait on.
> +	 */
> +	if (unlikely(NVolMftBootstrap(ni->vol) &&
> +		     base_ni == NTFS_I(ni->vol->mft_ino))) {
> +		ntfs_error(ni->vol->sb,
> +			   "$MFT needs its own extent records to describe itself. $MFT is corrupt. Run chkdsk.");
> +		return -EIO;
> +	}
>  	if (!ctx) {
>  		ctx_is_temporary = ctx_needs_reset = true;
>  		m = map_mft_record(base_ni);
> diff --git a/fs/ntfs/inode.c b/fs/ntfs/inode.c
> index a777de8a80c7..55f6d3334238 100644
> --- a/fs/ntfs/inode.c
> +++ b/fs/ntfs/inode.c
> @@ -2150,7 +2150,9 @@ int ntfs_read_inode_mount(struct inode *vi)
>  			 * ntfs_read_inode() on extents of $MFT/$DATA. But lets
>  			 * hope this never happens...
>  			 */
> +			NVolSetMftBootstrap(vol);
>  			err = ntfs_read_locked_inode(vi);
> +			NVolClearMftBootstrap(vol);

The scope of the bootstrp flag seems to be too narrow.
The outer loop continues to call ntfs_attr_lookup() until all $DATA
extents are enumerated. ntfs_attr_lookup() can call map_mft_record()
also, when mapping pairs is stored in another MFT record. So the same
folio deadlock can occur.

I think that NVolMftBootstrap should remain set until all $DATA
extent enumeration has completed.

>  			if (err) {
>  				ntfs_error(sb, "ntfs_read_inode() of $MFT failed.\n");
>  				ntfs_attr_put_search_ctx(ctx);
> diff --git a/fs/ntfs/volume.h b/fs/ntfs/volume.h
> index bc85a9592245..f9ecbbe205ad 100644
> --- a/fs/ntfs/volume.h
> +++ b/fs/ntfs/volume.h
> @@ -184,6 +184,7 @@ struct ntfs_volume {
>   * NV_Discard			Issue discard/TRIM commands for freed clusters.
>   * NV_DisableSparse		Disable creation of sparse regions.
>   * NV_NativeSymlinkRel		Translate absolute Windows reparse targets (native_symlink=rel).
> + * NV_MftBootstrap		Mount is still assembling $MFT's own runlist.
>   */
>  enum {
>  	NV_Errors,
> @@ -203,6 +204,7 @@ enum {
>  	NV_DisableSparse,
>  	NV_NativeSymlinkRel,
>  	NV_SymlinkNative,
> +	NV_MftBootstrap,
>  };
>  
>  /*
> @@ -241,6 +243,7 @@ DEFINE_NVOL_BIT_OPS(Discard)
>  DEFINE_NVOL_BIT_OPS(DisableSparse)
>  DEFINE_NVOL_BIT_OPS(NativeSymlinkRel)
>  DEFINE_NVOL_BIT_OPS(SymlinkNative)
> +DEFINE_NVOL_BIT_OPS(MftBootstrap)
>  
>  static inline void ntfs_inc_free_clusters(struct ntfs_volume *vol, s64 nr)
>  {
> 
> base-commit: 40288c9206c17eb66a603262e06a58d300d0f279
> -- 
> 2.55.0
> 

-- 
Thanks,
Hyunchul
