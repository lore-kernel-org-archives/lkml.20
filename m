Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E2594CC261
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 14:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788185106; cv=none; b=PYWtWROCZFQMVYaGUlLnx8xwyxuUGUtcjlDFc/9PQfAy093qM6Nk06gHBp3RpCtEDRjnbNZ9cuWq5o67jFBnrqHSOAdqurJGZe0ZLYfTDNLiiKaPcUPKCGPzUdLO7AjJhj/EBYvSXamTQGRl+g9CcsKi2pxPFbCdWh306Nd/AsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788185106; c=relaxed/simple;
	bh=mUau29xgzygq4fLzKQ7yDYbdE24apwyfC2Kpji4fqBc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mZ/QoUY5cBvNDVW3Zy/090lgTKFKhJdjr4xNqjJ1v2VY0HwsrI284s2xY1gax5bL62g/m5n7rX62LftQ8gh/9MS/jv2QsAFLCJIfDaROvR6o1uTwfsXsVUlMhbZbI4Upj3aSOAE47y0kosH5S7d48ASVBscGVfku2RiJeCAQ02o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Hne20Yzp; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Hne20Yzp"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4954c08a7c8so3390155e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 07:05:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1788185101; x=1788789901; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=A3FIxIPh31Oscj7vvNnw/qXBHaaHBzjQMK/QOq0Mhqg=;
        b=Hne20YzpVM6APvCHBu0rl33OqAS1+540RECYcWDFqsisbmib/+pKrJkbuV/MH7m0Et
         nuTyN8MS16CG9xGS6wYnK+LTskF6z0jlazSYCantRysFF8F+hBAa035TqoPhPPHG7fxx
         MPVYqoPPbJDU3wmlVPLuC57LmsKXPlT0xMANGXGSBno+NkOkoMdduuJxjkJYYrWcwlBs
         tD3+kc62gclvxl4WRAnoqfg+GhDbLpp5JPi+MDR/nfUtqxbqVIKYPw+4/FvxWXbPJ4ty
         dufrNy3GZYVhfB2jqAVnE0QFqo/6qiCZIOlxAo8XeuBw+5JQtbC1jvvbouH++RyfNvuK
         QNfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788185101; x=1788789901;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A3FIxIPh31Oscj7vvNnw/qXBHaaHBzjQMK/QOq0Mhqg=;
        b=rI6C+EY2u6dDtjx5CNLqZIc+eRpGCuSNFMcSVcVUF4VUC7ILNqaB6btfDfHoya+Kpb
         zMBBZt6jAWVq8NOTIo9rare0AcOIiUjAyzUaps6abYzDYW15otrhdHfsUD7ISHi6zxWp
         LWCAmladG51+KS8cmYPCZ0b1nT5fJkG021hF1DXO2lj2aRAiaFSev7H3/CopBi7EuvnN
         8eddLSreyqEyC8AktPRgZE/kRNzB65SyhGudOXBB0vPLbHa0MtzqxAm4k08VUEDrapov
         7AWk+kMa3IAHmpPlmEyXaHraaurijEo9Ej7p3d3kRvVN1nLqmi6ffjduTXBGi/YT3e1h
         P+MQ==
X-Forwarded-Encrypted: i=1; AHgh+Rpu3hfH6EETj611XZe96L4VcUIjE9jk9Mjl2IsaHtvsEdBC+k4x/DHDiJWgyLD9eFCGRy14J2p2Vye7FZ0=@vger.kernel.org
X-Gm-Message-State: AFuF++lKkpv4Ycf5xDADHLdp4ClXua1R+TPi1RGGN7R6KbkKoIxBp0Hx
	vDxAGtQDw7i7k0qAivk5QcUan/ejnxjU39Vmur5behTkfy8vz/AvTP2HYUappKVTxo0=
X-Gm-Gg: AR+sD10TiGGc1i4q00Djh9Mtld5uD8ab257W31Ce2Zjgw/s9rj3y2ILVM/O/UX/oBXW
	PzcB++mTtO9+AT1lhXR0/X4uMdYmyoIz3mcTOHCWojcjBRS3L0cw+zUqiEq6Wv5GPMGDZwZ9B3c
	xdGybunEEOVsfQxgSxzqnWNBkAphKT1TTmMBLdW71dde/1K8TQw/B1KN3PKvx+lVgKjZczF1gMe
	0nwBFxsr6+3TllkPUt2Pg1oGX/iTvJj63cVOf5ZaL2LDaQKQ++F716MigYxTTFOBu6WvA23FLqj
	bIzDI+3kaJDS7W7XBAA97iVcaHxtLYz2P596j8JN3CpnTfqRgfi//OEP4ERxvIzn+tmPyVB3psw
	sHEze6TsA+oOFxyubZJ4hsF2eruGe1VLaxGJ/UzW03vM6+kVxeMa1yHyajw+XqngD7grt+zrevQ
	MASHwL9sJ44Ue6+BCN4WCBF2Seqf9GT+FV4yTNGQsMCVHEeDKtQ/WiPQJsLUGDZVDcDxV4eg==
X-Received: by 2002:a05:600c:868f:b0:49b:9241:7ff0 with SMTP id 5b1f17b1804b1-49b924181aamr132951965e9.0.1788185101570;
        Mon, 31 Aug 2026 07:05:01 -0700 (PDT)
Received: from localhost ([202.127.77.110])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-856a359515dsm3959953b3a.48.2026.08.31.07.04.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 07:05:00 -0700 (PDT)
Date: Mon, 31 Aug 2026 22:04:57 +0800
From: Heming Zhao <heming.zhao@suse.com>
To: Joseph Qi <joseph.qi@linux.alibaba.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Mark Fasheh <mark@fasheh.com>, Joel Becker <jlbec@evilplan.org>, ocfs2-devel@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] ocfs2: validate suballoc slot of extent blocks
Message-ID: <apWJ8Jr9YSC03zqr@p15>
References: <20260831062848.2743436-1-joseph.qi@linux.alibaba.com>
 <20260831062848.2743436-5-joseph.qi@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260831062848.2743436-5-joseph.qi@linux.alibaba.com>

On Mon, Aug 31, 2026 at 02:28:48PM +0800, Joseph Qi wrote:
> ocfs2_validate_extent_block() does not validate h_suballoc_slot against
> the mounted filesystem's slot range.  Since extent blocks are allocated
> from a per-slot suballocator at runtime, their suballoc slot must be
> within range.
> 
> Otherwise a corrupted image can carry an out-of-range slot.  When the
> extent block is freed, ocfs2_cache_extent_block_free() caches it and
> ocfs2_free_cached_blocks() later passes the unvalidated slot to
> ocfs2_get_system_file_inode(), so get_local_system_inode() will either
> hit BUG_ON(slot == OCFS2_INVALID_SLOT) or compute an out-of-bounds
> index into the local_system_inodes array.
> 
> Reject out-of-range suballoc slots during validation.
> 
> Signed-off-by: Joseph Qi <joseph.qi@linux.alibaba.com>

LGTM.
Reviewed-by: Heming Zhao <heming.zhao@suse.com>
> ---
>  fs/ocfs2/alloc.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/fs/ocfs2/alloc.c b/fs/ocfs2/alloc.c
> index be09e766ac1f..2abd242a438f 100644
> --- a/fs/ocfs2/alloc.c
> +++ b/fs/ocfs2/alloc.c
> @@ -925,6 +925,20 @@ static int ocfs2_validate_extent_block(struct super_block *sb,
>  		goto bail;
>  	}
>  
> +	/*
> +	 * Extent blocks are allocated from a per-slot suballocator, so the
> +	 * slot must be in range.  Otherwise freeing the block passes it to
> +	 * get_local_system_inode(), which hits BUG_ON() for
> +	 * OCFS2_INVALID_SLOT or computes an out-of-bounds index otherwise.
> +	 */
> +	if ((u32)le16_to_cpu(eb->h_suballoc_slot) >= OCFS2_SB(sb)->max_slots) {
> +		rc = ocfs2_error(sb,
> +				 "Extent block #%llu has an invalid h_suballoc_slot of %u\n",
> +				 (unsigned long long)bh->b_blocknr,
> +				 le16_to_cpu(eb->h_suballoc_slot));
> +		goto bail;
> +	}
> +
>  	if (le16_to_cpu(eb->h_list.l_count) != ocfs2_extent_recs_per_eb(sb)) {
>  		rc = ocfs2_error(sb,
>  				 "Extent block #%llu has invalid l_count %u (expected %u)\n",
> -- 
> 2.39.3
> 
