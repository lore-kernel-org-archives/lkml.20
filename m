Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CADE47F773
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 14:03:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788185031; cv=none; b=ZGPUxA8wI61+pjpmUvFncVd1O0j8tcEjaGvAc0rG7VTpoUZWzoCxd5w0NPwDmrbYEH8zlH1ud+Ocql9VlKKttEu8s6nqIpRX3HV/fnA1ea47P6dFfSVUnJE+2K1A3J6MisQoHzxSHuB1SHgwd0hR6huluTnmd3x3dQ7jpB8CYPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788185031; c=relaxed/simple;
	bh=tstv+r2paNW8AO7BDltcvGIkV9VrLmRskx/CX906V+Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XxsaB3qa57okZU0Zo6T4jkgnrBOH+Io3OfmJFmV1a/YH/islK1BcU9L7EnOiXCmI2E0pj/fzvTjhAU3kBEr0OBUOONI9UWYzGUjnQvLkRpdfAryE/n2nwmrAgfUvJp2e7N0pfIC+oM7sqv+VuckEkOsq4WjPKPG8dMD9MTBPDBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=MR+dkGeH; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="MR+dkGeH"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-499dd4900dfso2690045e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 07:03:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1788185028; x=1788789828; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=D4pF9XPfC8+Fsp7YVqDDtQsmYtPC7Lz+HA1yR/JLKDM=;
        b=MR+dkGeHU4sJ/JgDnARefO/Mvigpr3pTVJSolDG7dEPrRIHcjapg76ewx7tCWJcHqX
         md+CBlNqarjYIgJoGOe/cG5iRzyxkRnfC3s3nMTWUZ2OtkSHgwqQmT6JZ2s71VO2GyNf
         i7w5F01+HO3JDqtlEdsKo0vq2RcKTeGKaLWNu3t14uNFDRL5H2+x9QTlFm+KNGnJgH3c
         T+FXTtGyb9CV0n1qyULE+y7NKrpw3S1JbLwNUhkEkCF+6ClJ3QPraLhdICmKQgbTuq+b
         m497dlj3QZ7Yr4M3ntjtmU/jitxijaB3tBj2qeg2EDJqAgi1c0/6TtH6vtcmd0MAUTGc
         f3ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788185028; x=1788789828;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D4pF9XPfC8+Fsp7YVqDDtQsmYtPC7Lz+HA1yR/JLKDM=;
        b=p3dL4JrxMyn7B+L850Z0Y/24HqDKRrId0B2guE/4VnvJt9h1PDjwcM/ZhYACoh/mYS
         9I4fvU7VBIly+5jyzSzZ1o0PsqhY3s03/wdHFMe5Wr09r70Phk14iTprLZZTw19oRrpe
         33rJrjXxiFWn9DjP1pd4/mXQ1MauDqzQRkzkZZ5p25OvrSdsNjWuPak/a65INOHU15lr
         vc4zCJjsfGnZcYmjy9dcS5w/TCuUbnrVhgeCKGFMyxELuEekXpLL94akXMA5hvjVjGto
         LJZOmi9UgMSpGeHHMldmFacRLNKvN2/tSRHTc4X1+wKTzbRFvdAey0q0Nvs1PYj1kQrL
         Ie9g==
X-Forwarded-Encrypted: i=1; AHgh+RredZVnxTVF02UqN8XhhBWoetiZySViRtYO+7J6ZWAIR6F7gVpPHA/0Q50g3Z2BxuZPXWVmDqa5jQFcZic=@vger.kernel.org
X-Gm-Message-State: AFuF++kEobn4xHKibmVo1wWWyQV6Jbb3hf0hEDmyJ+FmZ3YerZV3DRwa
	W8ylFgN+syDNmyANkrTVlfuCEGU151J1Rlb6yHr+xFio2AAPIdUpPvENc2Lu9+JTM10=
X-Gm-Gg: AR+sD13Gi8B5BCY6HeEk7uBGNBHSrmJU06R72M2LXVnF0SvVNGU3BB3ui48ec9B4MB5
	oSDldGwiM3X/M+u/wFBeNMymwoqqzlzBsGYtmXDzgWK2D90FrcAHSyOL14nkDdcoS4aqjmmUzo4
	/gNVDrmDQayzJ4hyl9XU/yncCYFt+fTruaZFXTVE90EJhPlWPzUtX/c7sESz57sRWI2STdzPxKc
	yNdD34LJsHsKjkNoKHG88lK67BlMWKTcnnYD887XlpqPGNGNqMHntn2n2zuwHNpdeK2ZYFkCUy2
	p5N8lSE/MqBHMKr1NN6b3JnLjwiBY4BX45yjgqca2SAdUJ/INf2CqQ7ybDb+S73HRXKNBSmCpxh
	A5tgnk3TI10equ29QWQ+XDaJC+jCZk+0L0IWANELIx2N63+8BSu58KKtxNEYt5tdX2l/ZBgqIeV
	uUIC4tliZtJTuFs/cbNqIR5UbKqverw7fPSAxhqXtf5pHh5W1CuJaGEC371f2c
X-Received: by 2002:a05:600c:868f:b0:49b:9241:7ff0 with SMTP id 5b1f17b1804b1-49b924181aamr132881005e9.0.1788185025340;
        Mon, 31 Aug 2026 07:03:45 -0700 (PDT)
Received: from localhost ([202.127.77.110])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-856a397c0a7sm3908762b3a.49.2026.08.31.07.03.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 07:03:44 -0700 (PDT)
Date: Mon, 31 Aug 2026 22:03:41 +0800
From: Heming Zhao <heming.zhao@suse.com>
To: Joseph Qi <joseph.qi@linux.alibaba.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Mark Fasheh <mark@fasheh.com>, Joel Becker <jlbec@evilplan.org>, ocfs2-devel@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] ocfs2: validate suballoc bit during inode read
Message-ID: <apWJqcgBV5UPqJYM@p15>
References: <20260831062848.2743436-1-joseph.qi@linux.alibaba.com>
 <20260831062848.2743436-3-joseph.qi@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260831062848.2743436-3-joseph.qi@linux.alibaba.com>

On Mon, Aug 31, 2026 at 02:28:46PM +0800, Joseph Qi wrote:
> i_suballoc_bit of a dinode is currently not validated at all.  A
> corrupted dinode can carry an abnormally large i_suballoc_bit, which
> bypasses ocfs2_validate_inode_block().  When the inode is deleted,
> ocfs2_remove_inode() calls ocfs2_free_dinode(), which passes the
> unvalidated bit to _ocfs2_free_suballoc_bits() and triggers
> BUG_ON((count + start_bit) > ocfs2_bits_per_group(cl)).
> 
> Since suballocator block group bitmaps are contained in a single
> block, a valid suballoc bit must be smaller than the number of bits
> per block.  Reject oversized i_suballoc_bit values during dinode
> validation.
> 
> Signed-off-by: Joseph Qi <joseph.qi@linux.alibaba.com>

LGTM.
Reviewed-by: Heming Zhao <heming.zhao@suse.com>
> ---
>  fs/ocfs2/inode.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/fs/ocfs2/inode.c b/fs/ocfs2/inode.c
> index eda50f13ffb5..a982c99a9678 100644
> --- a/fs/ocfs2/inode.c
> +++ b/fs/ocfs2/inode.c
> @@ -1543,6 +1543,20 @@ int ocfs2_validate_inode_block(struct super_block *sb,
>  		goto bail;
>  	}
>  
> +	/*
> +	 * A suballocator block group bitmap is contained in a single block,
> +	 * so a valid suballoc bit can never exceed the number of bits per
> +	 * block.  Otherwise deleting the inode will pass the oversized bit
> +	 * to _ocfs2_free_suballoc_bits() via ocfs2_free_dinode() and trigger
> +	 * BUG_ON((count + start_bit) > ocfs2_bits_per_group(cl)).
> +	 */
> +	if (le16_to_cpu(di->i_suballoc_bit) >= sb->s_blocksize * 8) {
> +		rc = ocfs2_error(sb, "Invalid dinode %llu: suballoc bit %u\n",
> +				 (unsigned long long)bh->b_blocknr,
> +				 le16_to_cpu(di->i_suballoc_bit));
> +		goto bail;
> +	}
> +
>  	if ((le32_to_cpu(di->i_flags) & OCFS2_ORPHANED_FL) &&
>  	    le16_to_cpu(di->i_orphaned_slot) >= OCFS2_SB(sb)->max_slots) {
>  		rc = ocfs2_error(sb, "Invalid dinode %llu: orphaned slot %u\n",
> -- 
> 2.39.3
> 
