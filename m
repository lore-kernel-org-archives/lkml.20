Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0D0733DEC8
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 10:01:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791799266; cv=none; b=LMM3V6N+eHxu7X+KvxKiVkt3KHqC7suXnOtT13lb86uD+9qgvmHc+fTSUMt+THxDsZlTQNLl7rgrd29cnJREB9lCNZwizBJYxW3O0hpWZ/tVVyed+GX4FqiJ/FBS8DsT1k5qG/omsGJC66AjJt/054Pvc+f/7WCAOAWsqOrhDNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791799266; c=relaxed/simple;
	bh=wixS3oHduGmXaXx1QCURZVkYo4rRgH2HUCv85ZKvaNs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qrh2pfmgJGhoSOkcjaDgfvWes/kSINN5cyl0amfEAGaZBMTMTiHdgALNSs6X9qMvPQ9k+Vk+HeWvKGIyTA6FCwuJRJNmfGVU3ICrIDyNF70nTgNcAfxvFSF1gq8I0MSIcOcbXUF6kwScgRg5jZpN5ycFcjDrrukxHrmIkgHpSTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B3Sn9Xkp; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B3Sn9Xkp"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3a0aaa0fd13so1180094a91.2
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 03:01:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791799265; x=1792404065; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HugyZ/37YBIlGXyBPom5LHKMhfm/UdMpEclB1nn3ivQ=;
        b=B3Sn9XkpjwVqrAizxYHhOIhgD0X7GTI6xL5l3KTkbnTUezs+nkOGxAN7EySwKGj97p
         Ohv3i7stfxZtJGGKfbCaxBLvHgnVi9M1V9qnatkMquXr8eaIK9RrsXN/wc1gMGkABz2p
         MMOzzMStc7jefeIqy/1Zkde7xjaEVcb2TuU89fIxWCfYKXrSy5puEvQfJM2//BMjYlmX
         bDpyHM4lg3Oz4LAxP6GT0GhNW8t0s65m8Pj3GKwdIwBjxKVdHJPtceGUEY71C2fI1P14
         GDQy7omXrnnjOHu5kpGsTHRqaN7QUb/aEbdzFoHwxXd+zxYUZMdygGIpPdeKLJ7QRDsb
         nzcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791799265; x=1792404065;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HugyZ/37YBIlGXyBPom5LHKMhfm/UdMpEclB1nn3ivQ=;
        b=0FdRur3y4tLt1G8+DKDONgBWGT9uRsldlxEknEqBOjPukwLQdQdcVhoQw9H+P4/foO
         NJblOAsz3pNGalzILghQc6IHFXCzCiDBn1UMJk3VC5+w6ea3a0KdDp4RnobFc3ZCrIQg
         Qgg54SiKbtrRDpMGiqJEQEnVp9Ogyv6vPygS6iLPiACrLjRcj9S0Tw0nL2n2MO+SS8eR
         v6Bs/gVeC8lhlS3ZkJhJyYgQDIOrcMsaqImf+QGIGHQ60WPDiLP/IuncC0aeAwob8gTv
         +2KCJxwZ/MPq0zF4XfJdLc/CbjPBQED0zb01hdh6r7bjdwPagWrzs+xDo9liW/3rsJL0
         GzQg==
X-Forwarded-Encrypted: i=1; AKwUvBwOdAoc7qORwNoQ6HTz3EQ5JHx749kK1tyhwURyDaW4L3ePsue48xFbFrxf0HSypZtFm/ipXk7nNUeGNrU=@vger.kernel.org
X-Gm-Message-State: AFq9FYIIaPfwoAsUzaziJ5vTXc3Qmr2G/5NjvIubXB39DbrRnzZ2DDrD
	d3HIkQfc0IrVukQCtIn+hF6h5zDdO54oxQKXXrzY9Mwkv0hjznQQunZn
X-Gm-Gg: AYBFou1M/HdmECadfEOJtgd5+7jUKGiY+VPojU9X+WTe+TwrPwba69VQrNDiOJ+PvcR
	A1AO0mjhUJyX/aaDof8XTMcKhRndQ7an6FWzapmJKD/vTnzAhL9GTdopO63mjPGIF+25AM0tkXZ
	UaIOPaKl5FKvGZvJA/EprRS1jORwVrdrWStS0TwZRrF77H0c0Hec6fTpe9xLdnB6UTBvLxC1KRa
	wxR0AexU8UiLw0qRH52Om2GK3IOTA4YKVH1T+eelzCvu8gdX35LhM5i/94L/pHqr46I7rtSzA+F
	XAWlljZWBeyfxDJzTPFvnQxZjYD88hpfM0e/hz7XwzVhFxefGbGYN6o0uCeYE5++5m5IBCgb70B
	b6J3Uu9qM1D78j42IwAD+/sxFPvKn3C3WHWfxOp3DN0/N/evFINBgP9ccTAI4bZOFvLI7YcCZ1D
	wLTZ6tvY9AB4/eNSRjxT9rfS2FNJ20dc8ATtSn2sHdkl7SydV0GzHUyGAoY5vg
X-Received: by 2002:a17:90b:3c04:b0:3ab:c80:936d with SMTP id 98e67ed59e1d1-3ab3a735ffemr7677500a91.19.1791799264703;
        Mon, 12 Oct 2026 03:01:04 -0700 (PDT)
Received: from localhost ([27.122.242.71])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab38dd5864sm15527715a91.8.2026.10.12.03.01.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 03:01:03 -0700 (PDT)
Date: Mon, 12 Oct 2026 19:01:01 +0900
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Zhan Xusheng <zhanxusheng1024@gmail.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>, ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org, Zhan Xusheng <zhanxusheng@xiaomi.com>
Subject: Re: [PATCH 0/2] ntfs: enforce the encrypted-file policy on the read
 paths
Message-ID: <asyv3dcrnMUlisTp@hyunchul-PC02>
References: <20261012062040.3826828-1-zhanxusheng@xiaomi.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261012062040.3826828-1-zhanxusheng@xiaomi.com>

This whole series look good to me.

Reviewed-by: Hyunchul Lee <hyc.lee@gmail.com>

On Mon, Oct 12, 2026 at 02:20:38PM +0800, Zhan Xusheng wrote:
> From: Zhan Xusheng <zhanxusheng@xiaomi.com>
> 
> EFS-encrypted attributes are refused with -EOPNOTSUPP in exactly one
> place, ntfs_read_folio(), because decryption is not implemented.  Two
> read paths get there without passing that test and return the raw
> on-disk ciphertext instead, so the same read returns either ciphertext
> or -EOPNOTSUPP depending on which path serves it.
> 
> Patch 1 is readahead, which marks the folios uptodate so ->read_folio
> is never called.  read(), mmap(), splice() and fadvise() all populate
> the page cache this way, so one test closes all four.
> 
> Patch 2 is direct I/O, which bypasses the page cache entirely and has
> no such backstop.
> 
> Both commits are in v7.1.  I have not added Cc: stable; returning
> ciphertext rather than an error is a correctness bug but not a
> privilege boundary crossing, so that call is better made by the
> maintainers.
> 
> Found by reading the code.  I have no EFS-encrypted NTFS volume, so
> there is no reproducer; the paths were traced in the source.
> 
> Zhan Xusheng (2):
>   ntfs: do not read ahead encrypted files
>   ntfs: reject direct I/O reads of encrypted files
> 
>  fs/ntfs/aops.c | 7 ++++---
>  fs/ntfs/file.c | 4 ++--
>  2 files changed, 6 insertions(+), 5 deletions(-)
> 
> 
> base-commit: d6d3455d8751854e0d1820f14184682e23ac4475
> -- 
> 2.43.0
> 

-- 
Thanks,
Hyunchul
