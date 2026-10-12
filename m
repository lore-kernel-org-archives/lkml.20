Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23B3D547056
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 00:50:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791766202; cv=none; b=k8l9EdROmbDj82W50WC4Hfky/EteY5tEQObTidgxObIFG+aGVJkesfOmF1qOLvP3zoUwmzgYOMTujl4mJHGce98OKRhIzvpLsUrFjEF0wyRLU//1V0oiYp0/aSu7V7ZFOWRe2VmFyLW6r+PShM8m46Jtk+7VnN9TnFkNZUBsqS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791766202; c=relaxed/simple;
	bh=UTsiobJzqDxR0bFFwFxp55iUFp/NDEWHqzx3SQiIz3U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LZ5VxSM0ppynA8K+K+TJE0tn6DUr8eN+bGg84rmm7mzfWJdtj9QP9luSHO0nd1JloFuIM7Y3XEeLyqch3gyTpRIjiw8BevoWEQZYzdI+F9Wr7lNT456NDhMV4VssYaBmeeREc5yYloa0Jl6QYaRh+EreB9d8WHq64ikm+lDku0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cNOgI7iQ; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cNOgI7iQ"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3ab3260b2cdso515982a91.1
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 17:50:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791766200; x=1792371000; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=b7HXCBjbd0eaxfFgbg/k4v/Vnkzyazq6CMKtLY0TiC0=;
        b=cNOgI7iQCPoMgLwZ+Gpmo3uY6gRNI7kfofKkyUYPNX3jZsFovzQseDH+ahkrJFToK0
         GQwgkJIrCONwNVXxgyq6TzX6jB7sZnl3WIe5iK2nMNjQr6Cv02pVOOVhcD3zUa2KxbmN
         Y1cSHkoFEFw/IQLEtB/mhrJXMpdl5UulKiGqd+zm4C8HO8iE0NyPuyBl/TGS0d3uIhQD
         rwYy1p6je1SOcz+gctqBZQ6Hc+NBIp8ZkKJ9RflUMSNDtTzPq6JIG16qaKMwloSHPmJr
         13x7NzFz2x4WpZKwdnyYnqTMj23wPLtkjJZZ/sdB2DsqBNwtusQfnn7b9SRNtsihTX7T
         kUCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791766200; x=1792371000;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b7HXCBjbd0eaxfFgbg/k4v/Vnkzyazq6CMKtLY0TiC0=;
        b=ce4SpRCWjzOW6Xu4mzoRH6eW0nXR8CdLUZpm2Erf57SEiP4tZVj3W8kMMiBGgbNQAR
         Owyk3exTbEZCfibwIk7t43zi8/NgttA8MWAOveic2xDO2VPSi2/4Y3SS1x37hQnr0zcR
         xsF6VdTnBxTohDj6tTfZoVkIoRLk0cvy5LcxsK4E8SSFPSjBxvAt0IOsZVP9L1e6tM7d
         KQXJi9eUbKo0uQ+pxTsMvhVUJR8T2QrPum3fwBT2d43HoIlNyKQBbLJr91cqWNbH7LD1
         3EYYSWnNLbgmAMtCwe0RAMDQotJRPSjJX7lre/FGe+gm3r9kwJ25xE9fcu4aPOulkIoy
         WL8Q==
X-Forwarded-Encrypted: i=1; AKwUvBxAZD6xTLk+nHUWtOTZbvWhc091XvaB1OkCLAItt/1l5h/PHtl1SCMu765EWb51uPD9V3HSetDB7MTrMpc=@vger.kernel.org
X-Gm-Message-State: AFq9FYJFgQZQvadUWgrsL+wUkSGL4jsd+YHCkJeXaakcaU56UzYKwMTw
	IBdrYcX+nOi7OPRgpJtXLLBLGGnEjT2AoYt40XBJ+0EOJO1hUhGCZU9U
X-Gm-Gg: AYBFou38IooUOSlT+ujJIR8ExQUccZamY5AWraYRpest8I8eD+m2Sfv3W3+wJnGI3M7
	k2dk9GPEMTjc+DQmwLoqdzUSoam5ELF57ol1EVvTp+CpNytHrxFgAgKVuDh6LLFx7Ee7/6c4/29
	qIvCowcP42t+S1l+VYLjj3G1kuyI403zQI8TXIXB9GTAs3tOmN7TJn7EwNZ49VaaFjVsqij/FK9
	MXdtdFf0c70UEoC4RUaMrsolCK2lZ+ChAe71EC7r0kd61JjaDk+jN+3SP+wPaRcdg9jr6AtyGmF
	9OrEOW4EzumSyzIKHslMZfvFaT5LeLSujwAc78AnnTfbR/DFSUObuKe9YBG1C5KR0qX3tGuTUah
	X1tPwM08Etb1NRwQFH9k/htfh1Pg5XsIwiG7WpB8E2OWhKZpA/cJz5aK4JVFTEVuQgTEB6f65/N
	rWk1KK1DIKMK+c9QrgJgNOh2a0U1G2faButhjJ8kJz7XusV2oBUuJDyxV8OwJx
X-Received: by 2002:a17:90b:3c8e:b0:3a6:fc30:ce16 with SMTP id 98e67ed59e1d1-3ab3ae696c8mr5407929a91.51.1791766200345;
        Sun, 11 Oct 2026 17:50:00 -0700 (PDT)
Received: from localhost ([27.122.242.71])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab3371f748sm8775454a91.1.2026.10.11.17.49.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 17:49:59 -0700 (PDT)
Date: Mon, 12 Oct 2026 09:49:55 +0900
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Zhan Xusheng <zhanxusheng1024@gmail.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>, ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org, Zhan Xusheng <zhanxusheng@xiaomi.com>
Subject: Re: [PATCH] ntfs: widen the sub-block offsets in ntfs_decompress()
Message-ID: <aswus4M5zs8OxMPG@hyunchul-PC02>
References: <20261009075523.3135206-1-zhanxusheng@xiaomi.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261009075523.3135206-1-zhanxusheng@xiaomi.com>

On Fri, Oct 09, 2026 at 03:55:23PM +0800, Zhan Xusheng wrote:
> ntfs_decompress() tracks where the current sub-block starts and ends
> inside the destination page with two u16s:
> 
> 	u16 do_sb_start;
> 	u16 do_sb_end;
> 	...
> 	do_sb_start = *dest_ofs;
> 	do_sb_end = do_sb_start + NTFS_SB_SIZE;
> 
> *dest_ofs is an int page offset masked with ~PAGE_MASK, and
> NTFS_SB_SIZE is 0x1000, so do_sb_end needs PAGE_SIZE + 0xfff of range.
> That exceeds u16 once PAGE_SIZE reaches 0x10000: the last sub-block of a
> page starts at 0xf000 and do_sb_end wraps from 0x10000 to 0.
> 
> The zero-fill that pads a short sub-block then computes a negative
> length:
> 
> 	if (dp_addr < dp_sb_end) {
> 		int nr_bytes = do_sb_end - *dest_ofs;
> 
> 		memset(dp_addr, 0, nr_bytes);
> 
> A sub-block made only of symbol tokens reaches this without consulting
> do_sb_end on the way, because that path just does
> 
> 	*dp_addr++ = *cb++;
> 	++*dest_ofs;
> 
> and is bounded by dp_addr against dp_sb_end.  With do_sb_start at 0xf000
> and eight literal bytes emitted, nr_bytes is -61448 and the memset()
> runs for 18446744073709490168 bytes.
> 
> Getting there is cheap: fifteen sub-blocks of eleven bytes each advance
> *dest_ofs to 0xf000, since the same zero-fill pads each of them out to
> 0x1000 while do_sb_end is still exact, and the sixteenth one triggers
> the wrap.  A compression block is 0x10000 bytes with 4 KiB clusters and
> the fixed compression unit of 4, so all sixteen fit with room to spare.
> 
> Phrase tokens are bounded against do_sb_end and so return -EOVERFLOW
> instead, and the
> 
> 	if (*dest_index == dest_max_index && do_sb_end > dest_max_ofs)
> 
> check at the top of the sub-block stops firing for the same reason.
> 
> Use int for both, matching *dest_ofs and dest_max_ofs.  The narrow type
> came in with the original import and survived the removal and revert of
> the driver.
> 
> Signed-off-by: Zhan Xusheng <zhanxusheng@xiaomi.com>
> Fixes: 1e9ea7e04472 ("Revert "fs: Remove NTFS classic"")

Looks good to me.

Reviewed-by: Hyunchul Lee <hyc.lee@gmail.com>

-- 
Thanks,
Hyunchul
