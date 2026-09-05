Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A67FF326945
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 01:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788570974; cv=none; b=Kf6+DQmLzt7LGMSW4M7M4pC1XlmUeeR9S4+9i6US2zIddZdGx2Cucj0anUif3RchObvh9w1XxbirjW+IiKzz3HBnFQNPtY4sufTQEn1BsbSXTqeAvkpcE+qNvYDE7VDz0COhUk37ldAq2xTlJ86PZWrggIQY8kw/98IoVmTQePM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788570974; c=relaxed/simple;
	bh=44o5L83IczclB7yfnMXyiOpfAS6soUBWv6nwnzN+OQE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qn4YfO2e7BmxUtoz116CO4zwP6UUQ1FDeWIN+DKafd2kiogZEs6ky99kg/Rs8jDW+f4GAdQiVcmPIDyA7jVckjGmzea9B5MePWDbSNat7H8dXrG2pRixIO3Roe0Iyk0vE/dyLZ4mzkVLmg7MP3nF5PisDvl/2DoVWCUJNliHJ5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Tu/nDrXq; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Tu/nDrXq"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49c5a927a1fso226535e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 18:16:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1788570971; x=1789175771; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jn7XKIWs6Fs0qmRNaN3GYeUgeHyycuW+XViXWerqMTE=;
        b=Tu/nDrXqIB5JsC0p51sBVTxJavX7byixIqfZaqo7OB3GKPSIwcfUlixz2pEkaOBrXG
         wHHt/tVLxjNYVYJ2kjUZM2smjL9hKzq+AdSN5VQSLLQRRPLpbtH5kcWdus2+RgQlmxJK
         esAxKUyj8lPGB5J8lotmBB9jPredKNFakGFE+VAy07otg92l+L09YOh0zPmooKYDJpwU
         3WGr9JYWpq8YXt42Z+YLANyxBEpdqzou3xMiiorHQTthSeOjVRPRusoHGC+fBAgwSrSj
         IMw9B92jaWCDkBBnJIARmrWUPJh26WBfjMSr/NT9nUS3MCLKM6tJnA6XW84ukjnyOe4j
         3V4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788570971; x=1789175771;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jn7XKIWs6Fs0qmRNaN3GYeUgeHyycuW+XViXWerqMTE=;
        b=hdl+AGzbRh9Kg8RWBiM+expZScLe5OCZ/Boor1TV33ezaBZua0oSN2gK1/k2L7bMsf
         57fe5lThOG6KOtPzXIr5JyYjPAGcv72xs7qJFprIj5YO+tA8U3A4dFzhn2j7Ihj83ifw
         tv1IRKuEKqfKaUlxHCRxifa6XrMTYB5cEXxFAcmnU2QxE03RgE8mcmsfhCrsxEJdt/Nf
         DR5+0gyvn76SqLp+hmgKKfWfcL5taJddpnSg+IR26AP1xgNaOiM0/kdd3BbwPpl0GaoI
         kGzrqsJZ9MYNTI6q38Dl5+Y/bSjYpXpb+EwmFwX+uQbvfmnPhT6aL5u7bUWtzHJ2ymmU
         U1RQ==
X-Forwarded-Encrypted: i=1; AKwUvByn5EbPtgw4UkucmqbNYaW7V3Wpt9lSQSwe5SJcjxyjJ+//uHGQBHvEGKPGEB4Xi+pNJCsFKla+2Szu70c=@vger.kernel.org
X-Gm-Message-State: AFuF++lyFHga3ooZ6CwzMoES/4Si2ZKQMD0bOTnbRd1D92+Qy5VEix3n
	0naifUwWW5+yolOhUuTdan0T0ezNIx7XP8tCpNpi1t7S0W+grAFe7misvqhgNtNtKou5di+J4bh
	0hRvSDps=
X-Gm-Gg: AYBFou0LvrV0rrgitFVv6PW03NsyrVjNRYRvm92vfPGMxwVbjOq2u5sUBFruzmV/HN+
	4oKWE/2HsGzW+s0Y38vplDwOOIOtUvGRfOKp/W6brL0V3Bz+vWGM0SLWxiHa4XTpqfRQ0YSvDy8
	obDBqADP96T9CkIIYKLFUV70ysQaVC0wm18TXmifF3i70quqfFWuheynQsRFNUxJaun/DnPe+Ne
	dGyfRHvfHUcY5JUpS+vbgmh3LAXoBaHChS3ukZt9O+Qj0WB/KpbjZ1g8rnEUEjm0YzW0qKpOYTd
	lyOeFwRUH9xPz2Y5hxsY8iwCtR+/+thD76kQcLEnlwVSSaLEZwWtv2MjuedL5y5oj7OTK/jIoOL
	XkVjbHvSRZAoBukrVU4AGsAxxko7Ze/MispRpgSK4KyoPbxFoGEviryDC+Mshv2Zdd/Hy1Ky1+Q
	trufWVtd16KhEB95NahIp1ljl5TOFSsf1CNi84Pv1k1GM5l9veGP1+CpbinBw=
X-Received: by 2002:a05:600c:860b:b0:49c:f9b8:bae0 with SMTP id 5b1f17b1804b1-49d01dd6b62mr15477395e9.2.1788570970872;
        Fri, 04 Sep 2026 18:16:10 -0700 (PDT)
Received: from localhost ([202.127.77.110])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b2612ba2bsm6682976a91.14.2026.09.04.18.16.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 18:16:09 -0700 (PDT)
Date: Sat, 5 Sep 2026 09:16:06 +0800
From: Heming Zhao <heming.zhao@suse.com>
To: Joseph Qi <joseph.qi@linux.alibaba.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Mark Fasheh <mark@fasheh.com>, Joel Becker <jlbec@evilplan.org>, ocfs2-devel@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ocfs2: validate dr_fs_generation of dir index root blocks
Message-ID: <aptshupcOW_f6wma@p15>
References: <20260904111551.371150-1-joseph.qi@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260904111551.371150-1-joseph.qi@linux.alibaba.com>

On Fri, Sep 04, 2026 at 07:15:51PM +0800, Joseph Qi wrote:
> ocfs2_validate_dx_root() does not verify dr_fs_generation against the
> superblock generation, unlike the extent and xattr block validators
> which check h_fs_generation and xb_fs_generation respectively.  The
> field is documented as "Must match super block".
> 
> Without the check, a stale dir index root block left on the device from
> a previously formatted filesystem at the same physical block number can
> pass validation as long as its signature, dr_blkno and checksum match.
> Its index entries and suballocator information would then be used in
> the new filesystem context.
> 
> Reject dir index root blocks whose dr_fs_generation does not match the
> mounted filesystem, like the extent and xattr block validators do.
> 
> Signed-off-by: Joseph Qi <joseph.qi@linux.alibaba.com>

LGTM.
Reviewed-by: Heming Zhao <heming.zhao@suse.com>
> ---
>  fs/ocfs2/dir.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/fs/ocfs2/dir.c b/fs/ocfs2/dir.c
> index 6bb6aa133f01..329680b46227 100644
> --- a/fs/ocfs2/dir.c
> +++ b/fs/ocfs2/dir.c
> @@ -613,6 +613,14 @@ static int ocfs2_validate_dx_root(struct super_block *sb,
>  		goto bail;
>  	}
>  
> +	if (le32_to_cpu(dx_root->dr_fs_generation) != OCFS2_SB(sb)->fs_generation) {
> +		ret = ocfs2_error(sb,
> +				  "Dir Index Root # %llu has an invalid dr_fs_generation of #%u\n",
> +				  (unsigned long long)bh->b_blocknr,
> +				  le32_to_cpu(dx_root->dr_fs_generation));
> +		goto bail;
> +	}
> +
>  	/*
>  	 * Dir index root blocks are allocated from a per-slot suballocator,
>  	 * so the slot must be in range.  Otherwise removing the index passes
> -- 
> 2.39.3
> 
