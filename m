Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8E4F3D9025
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 07:42:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787902925; cv=none; b=IosmQw9Yq7d3NMTOs6hAGonctOQmDZRdtyQZn1mBa/Qk+AVe4BhTN2+Gg39D5TQkks7T/Z2MEzsY5oEPNr9Op34XChFtqYzKP1KDgsWuCMhilrQbMh0wqfDE59O74SEmNzjMy95Cr2u4rqXi3qVIsypyLLn+xGJgdCIx0LPHuMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787902925; c=relaxed/simple;
	bh=fsiviA7Tyk6WnmoBGpH6H7lFpVkB9xpLinZ8CKeHRZY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mD/SfU+stw5Kv+CpsoOK5lVffiVwwDnjvHeZVLztibeWVbI07IyrTVdO5k4gsVw3XhoOPir5nnPSdL/ZXFsCZYVhTZZAd+AZlJzt5rYSBDI9PZNxtnK1tmOGiad3eHlzA8LnsLCHcCl7A8jxeOIh5FngAxr60bSQBUb+X1nv1Yc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=AyH6xs4N; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="AyH6xs4N"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-47fe45db360so88144f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 00:42:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1787902919; x=1788507719; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QzzPfcrESMmXj4MeD1wijXaEhujYoS5NdXZGJYE9Z8Y=;
        b=AyH6xs4NOd2q1JxclvXy9J8Rz7eGevf9TAQoIg1sRDpv2SQ1dpZUtixUvaOSVJ3LLV
         ZKwDRbAqSWX5J1s+ChVrS+pwmzp0XTFvpS9p/VxKKkg4kt/qxnzv0uVyaU8Ki5Ysa/FP
         Iss4w7yUP/BoB0SFDPdkGcwpZDbILnn0KrSVUKjzhJTvLBoO8lHBRgUMJSIBdnqELCDE
         1hkMXaZnYIky0nZabI6tcWriRcmYLJ8CFRVIDZGWyCU7ds/720L67UPTryQwtKL939is
         Pn6BgVhaM73xO8U1YH3XU8VweSD80VJ91Ft5Va7oX72b60U1QtX14U8KZT+4iBAdVyM9
         l7uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787902919; x=1788507719;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QzzPfcrESMmXj4MeD1wijXaEhujYoS5NdXZGJYE9Z8Y=;
        b=S7yeSVOwoeoCKn/GhD7T2a1dRpaneNBDbKhO965wW9jKyl+6yJK065B6y1DxL1LLiz
         sJ0UC3aESk/zVN4CSbX6ZDRQd6rZSbXTxhZBpIDB6HEli6iJp3SeQbmgBSYOPIZqOXMf
         lHo6/H8lMAy01Ae4zgcPjy8jYbcDhjy1EyVWX9NGeBe+sciECINA4anvEDq9L4+dLVJL
         rMcyJYLBHxNkj3MpIKai5rWEFHgLPwBS/Az1O2HEX5FodtHDXzJdAhIMGe2WhaUD/0et
         RjreBcAW1NmCOy1jAsd9mw0X1l64a2GCoPvbBqE7ud4knIr4y74NXxMK7YT23f3CADcq
         wYXQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr987gwDdvHuqHI+pU7pK8ilrpcgqwFBw5CddzCNF5xf1k0M2e/xA6ZyprQQ+wJ5dRTCRDYO13gbdoOanc=@vger.kernel.org
X-Gm-Message-State: AFuF++m9/BdygOdNewg2JlNKw5I8OSXQwSYoHcJBqjtg9YtiwB8WgJiV
	4WHr2uil0vxykPx0ULn11keEjjqQlmC1WnvrqBd+JjX94Sx2K2cFaMb2ZW4hojj6NM8=
X-Gm-Gg: AR+sD13Em4nOvYWW4lae6+IjZwjUTO6sm84x1YAlVLgzCA383jZ6U5MV+x8cOEDMtGO
	R7Y+ZDfYR7OHUjehCnLcCPF1da2MFFqjvCnvCP28hYantXvg8ZRgwdAkE6cifn784hr8RM/xi7M
	pKI9zGspCiKbHA1Y6njn81TnkEeJOmNVw0dh3+AQyKct5co5s9FOlkof57Nhdk88Ccyw1jpLn1j
	R78S3yyDl9hL3tWzvdLylJc80+8hl5WgFKkTA7HOGh6m+h6oVV2Y3/eZ3A/9TYzrybw8h3k9Y+3
	EZd1D3psfvjZrLlkg17zDSGL0I9ZPioG1VvnMeVSClswYxTu5mlfaYSYWgHNdzBeGgj5vGazboQ
	Qi/PpPV3kGFQJHI11pkNzebNU5VJdBEnpdgKRwrfg9Octjh4dOQ08iWfVko3ggtkZsVANjGR36x
	1O8BfOojmDU8Q1ON9e+FdyQHI2l1o7iSjuCA2QX8K/OcWpkabesClnxP97DyM=
X-Received: by 2002:a05:600c:1f87:b0:492:4a7a:e415 with SMTP id 5b1f17b1804b1-49b91c41ca2mr36558795e9.2.1787902918749;
        Fri, 28 Aug 2026 00:41:58 -0700 (PDT)
Received: from localhost ([202.127.77.110])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d75963a250sm2998305ad.31.2026.08.28.00.41.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 00:41:56 -0700 (PDT)
Date: Fri, 28 Aug 2026 15:41:53 +0800
From: Heming Zhao <heming.zhao@suse.com>
To: Joseph Qi <joseph.qi@linux.alibaba.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Mark Fasheh <mark@fasheh.com>, Joel Becker <jlbec@evilplan.org>, ocfs2-devel@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] ocfs2: exit recovery thread on mount error path
Message-ID: <apE7j-pFxA8iCY7_@p15>
References: <20260828071553.262254-1-joseph.qi@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260828071553.262254-1-joseph.qi@linux.alibaba.com>

On Fri, Aug 28, 2026 at 03:15:52PM +0800, Joseph Qi wrote:
> When a mount fails after the cluster connection has been established,
> e.g. in ocfs2_mount_volume(), ocfs2_fill_super() unwinds via
> out_debugfs/out_super and frees the osb without disabling recovery.
> 
> A node failure event can concurrently launch the recovery thread, which
> blocks in __ocfs2_wait_on_mount() waiting for the volume state to
> become VOLUME_MOUNTED or VOLUME_DISABLED.  As the mount error path
> neither sets VOLUME_DISABLED nor wakes osb_mount_event, the thread can
> never make progress: the kthread leaks and stays blocked on the wait
> queue embedded in the freed osb, which may then be accessed as freed
> memory.
> 
> Fix it by setting VOLUME_DISABLED and waking osb_mount_event on this
> path so the thread bails out, and replace the plain
> kfree(osb->recovery_map) with ocfs2_recovery_exit(), which waits for a
> running recovery thread to exit before the recovery map is freed.
> 
> Fixes: f1e75d128b46 ("ocfs2: rewrite error handling of ocfs2_fill_super")
> Signed-off-by: Joseph Qi <joseph.qi@linux.alibaba.com>

LGTM
Reviewed-by: Heming Zhao <heming.zhao@suse.com>
> ---
>  fs/ocfs2/super.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/ocfs2/super.c b/fs/ocfs2/super.c
> index c62e389d4dd6..f785c39d1fb8 100644
> --- a/fs/ocfs2/super.c
> +++ b/fs/ocfs2/super.c
> @@ -1169,8 +1169,17 @@ static int ocfs2_fill_super(struct super_block *sb, struct fs_context *fc)
>  out_debugfs:
>  	debugfs_remove_recursive(osb->osb_debug_root);
>  out_super:
> +	/*
> +	 * A recovery thread launched by a node failure event may still be
> +	 * waiting for the volume to be mounted.  Set VOLUME_DISABLED and
> +	 * wake it up, then wait for it to exit before osb is freed,
> +	 * otherwise the kthread would leak and stay blocked on the wait
> +	 * queue embedded in the freed osb.
> +	 */
> +	atomic_set(&osb->vol_state, VOLUME_DISABLED);
> +	wake_up(&osb->osb_mount_event);
>  	ocfs2_release_system_inodes(osb);
> -	kfree(osb->recovery_map);
> +	ocfs2_recovery_exit(osb);
>  	ocfs2_delete_osb(osb);
>  	kfree(osb);
>  out:
> -- 
> 2.39.3
> 
