Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EA453839B7
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 05:25:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788413155; cv=none; b=OwR93a9PNyrWFDNgj9N+JtIsYTQ59Ryl00j+FX1zPi+tV33PjvcZeo4ebQcg4gt74Ap4heGZcwADWOrTa56N8G36fnD+K5MuOqdCTpyjy5zFOqHqB9jU1NSXhS+JGi8vkhRA2aWDUmmDnBt0m5uEQilek28OK+ZSuwGn6jjt4Qw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788413155; c=relaxed/simple;
	bh=yIT0njN8zTaKqpnh4YeAXIBkAzc91BYCFPB8BlZBvJ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EqhzEPOy5c6Mj8dgqj2U1B8vJ9LED6QP9YHScl6e+LGfsBwgeQSgq+VlIY9qJ7qILjIo7LWwxr1Lb8dVsbMSxsAAssQrA+j24iATi9UO4jygoyCMQN/XzqA8UAVUlJs6l+ONz9agoK70gN2OkkvtQgayBdSFiq26A71IKzTEapw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XZNGGruR; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XZNGGruR"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-84eb992a881so1723658b3a.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 22:25:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788413154; x=1789017954; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=x6udNag1OXzwdNjMFsjD3U/BpLu/NXX2dA4Ypx91geA=;
        b=XZNGGruROH/4KLemnYgOsXrFYI1iW9SfJ8IplzKBWOmni+uKnRLDxzDgTNYcNEIwVP
         NSPP3kD7SbLd5agoHJVm5cgMW6q+cnrcZc8PewsX3FEkkcwRPgT1bDEAJlYdQJpZBt54
         phnCNPjpo0oSnoeVBNppJzodhkrydj+ySpiXtpIdtceoUPu+jhKhNpWwV81qV7pVb//R
         pHESAmSlVFmOIj5lxd0E61bgsPeCCcSjxwuGna6/VMcZ4/3Vs/9JfnfRm7bf92j94DUb
         iH6F/hdddy1Z2kN+AsVGcxXqv2Rz+TK8cTVuQJwHTwQPjRtHjz9QaQPRVwG2d+CM05jv
         VS/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788413154; x=1789017954;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x6udNag1OXzwdNjMFsjD3U/BpLu/NXX2dA4Ypx91geA=;
        b=CL0br6PH2iQ+wCjlWjaIWlfLkOu+Vb99KA6Zv6rxow4Lv4k5iefzlpISd5fKnfJ+/J
         4Ku9yWNrEdgIloDEBYoi62mqHhwAgmLVFTxB9vK4ToT5i/lB2lbiK1EDVKrGZ8eSOW3F
         FXvjLXBsdRVAbVZ0SqG3uUfFLUZsKktQmFAfkK09HC5dI3QoF/ws2QcSZqLNDabr7fpH
         XWu31Kb2lCeu7ok+UsnoB4O2keLHDHzcKI2rN2WPjTmcdKunanpXaQKW+wPrMLiCgz2x
         s83CthrUAZmY8McxAVsebXkFPZBj3CCUeQjR5/T+iNCPuXP8ohcwrrkE1HZ6d1b1T9Rt
         ET1w==
X-Forwarded-Encrypted: i=1; AKwUvBymWiSoJTqXv/lYXmfIbvo9ckqxituDjsVjWDIljTEP0OjPtXzDfSs5rbnqB+Zr+bvflLjm118tbH2LDoA=@vger.kernel.org
X-Gm-Message-State: AFuF++ni8PwpNi27Q8SqJuwaS90M/Nk9MTdYveWroIHiH3pJg+t8lnZ/
	h5ng0MHhYFqf1BJK0KFhqhwUDkzJaDRjytMt7mHru3DpyxfeVLmuU0Oy3Kr+zg==
X-Gm-Gg: AYBFou2aGVsVsr04QaWu+tFyawD/uZN8WzX1b8757YKkNifO9OdHolnzyu5HVOb3WkZ
	mVJh8rEoRh+FjnjpgZM421YVlESkCRJA4jR7ysyDH4xZjpdNF4GareWsDKDYwgMDatKX8nl02VQ
	SIuJ7c08rZPTPKlNM5Cqq4fSFS4TmVUMQzdls+0ZPO8Le0EpeDRxUVqGnl+IRth9gOTkLl+a5id
	aPzfBMYF0tJQiuR9Rs/WEy34sQigjI9+MATGJFw/vvqwPrDmEoRdPDfA7F0R0mClNVzKGnqldc0
	2hdBVgVN4KsAtAV2d9ID0vhMgG3tIH7ZXRG9hf+yUSY9r/q4yatZzgjM9zlh1w8O5PBpxy0p0ex
	Clv0JXc32M8WDphGKrZ3k8O/Ak5S8SbVJOag2NYjQYr5SQb7KxSqKGloMdQ/7s7sFux8JyNStW5
	vASV6h8HT7pdkZt0n3wgcLdkNQYiK3faUR4po9pkkpH4iSdP3H671+fj78bU+NMFE=
X-Received: by 2002:a05:6a00:2e9c:b0:848:2c2e:c79e with SMTP id d2e1a72fcca58-85ed3c7d861mr12889924b3a.12.1788413153492;
        Wed, 02 Sep 2026 22:25:53 -0700 (PDT)
Received: from localhost ([27.122.242.71])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-85db24f20besm2388115b3a.7.2026.09.02.22.25.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 22:25:52 -0700 (PDT)
Date: Thu, 3 Sep 2026 14:25:50 +0900
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Baolin Liu <liubaolin12138@163.com>
Cc: linkinjeon@kernel.org, ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org, Baolin Liu <liubaolin@kylinos.cn>
Subject: Re: [PATCH 2/5] ntfs: return -ENOMEM from
 ntfs_inode_attach_all_extents()
Message-ID: <apkE3nzoVd0raTde@hyunchul-PC02>
References: <20260902073249.3035977-1-liubaolin12138@163.com>
 <20260902073249.3035977-3-liubaolin12138@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260902073249.3035977-3-liubaolin12138@163.com>

On Wed, Sep 02, 2026 at 03:32:46PM +0800, Baolin Liu wrote:
> From: Baolin Liu <liubaolin@kylinos.cn>
> 
> ntfs_inode_attach_all_extents() returns -1 when ntfs_extent_inode_open()
> fails, and both callers propagate it unchanged, so userspace sees EPERM
> from setxattr, reparse point creation and directory index updates on
> inodes with an attribute list.
> 
> Both paths that return NULL here are allocation failures: the
> kmem_cache_alloc() in ntfs_new_extent_inode() and the kvzalloc() that
> grows ext.extent_ntfs_inos[]. Return -ENOMEM.
> 
> Fixes: af0db57d4293 ("ntfs: update inode operations")
> Signed-off-by: Baolin Liu <liubaolin@kylinos.cn>
> ---
>  fs/ntfs/inode.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/ntfs/inode.c b/fs/ntfs/inode.c
> index 5aedc045f65a..747a60ae27c9 100644
> --- a/fs/ntfs/inode.c
> +++ b/fs/ntfs/inode.c
> @@ -3025,7 +3025,7 @@ int ntfs_inode_attach_all_extents(struct ntfs_inode *ni)
>  				prev_attached != MREF_LE(ale->mft_reference)) {
>  			if (!ntfs_extent_inode_open(ni, ale->mft_reference)) {
>  				ntfs_debug("Couldn't attach extent inode.\n");
> -				return -1;
> +				return -ENOMEM;

Could you also fix the error handling of ntfs_extent_inode_open()?
It treats the failure of map_mft_record() as success. If we would 
fix that, this patch would incorrectly convert every failures to
ENOMEM.

>  			}
>  			prev_attached = MREF_LE(ale->mft_reference);
>  		}
> -- 
> 2.51.0
> 

-- 
Thanks,
Hyunchul
