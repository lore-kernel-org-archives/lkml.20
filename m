Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793011247;
	b=Gmq8fDoV3ouZf6Bb9MpAcONHa34ArYZY4Y+To3ZHRbQN9ZBvv0/xSWwpLPoF7V5JUJML
	 CiRXPwXessHfrCgzjd4OI/0oAx5rwudcS2CZqGN1fvirQ25cp8iKonm7nbhiH8S+P+2ri
	 sknEgb0fPLDtyDreUDs25tI1SGtOaWe26rh1vEue1iGDBwzxVtRlNPM81qLvo2cDgYIWE
	 2WSqyDzZFsXcFht5AmSI689tsxWTuml0eGHUkg1SJ3bMiCA4KSyMd+k2T5dO0E9n17X1F
	 jmNip767zSHcZy+3qz1d8LcmYtSLdt7E2YcMVboO1THGaG4i4Lutrm/1JTA2Sqj4pfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793011247;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 Mail-Followup-To:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=EP4HK2sAGEG6Sk9+NnIgjZnlbU/DTAHtGnb+M3I0RHo=;
	b=XeZpMVtZHPIUGWFgj1zKijIgxcsLvBO+OBwMmqamk8e9UxHJ5x9rlKmUF+zLlwVI7L2i
	 1WNqS09uOlzBUqJyuo2ybTz2lbuUjkTMWHw7euESV7QBQcgIk1KLXoHVnav36BTXjcM/p
	 KhFwN8t4cR+BczHZk3Wmw+4Zx1DDAXu3dRI4kmnS2xbdIdT7GmRtW7/Pagr5VLCpsWM/m
	 8lcgcgxDjaGXEJ7RFaGqhVUTP4jtiZCpqsaJY7VEKLMs8j/dS/RRFIvhIYaGlTaii8Ho+
	 fu6aMG1WuGRpt8GZfPykfYqckt1Zbl+8QdRONPcNuv9cNif9s2xaGf2bTqqqgyI2HJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="ojG/I6nA";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41EB1606A32D
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 10:40:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ojG/I6nA
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E67D1F01828;
	Mon, 26 Oct 2026 10:40:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793011247;
	bh=EP4HK2sAGEG6Sk9+NnIgjZnlbU/DTAHtGnb+M3I0RHo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ojG/I6nARC+3zNB6Jjc/jmbjIcDZSvlgu9MpO8czPyyVpMlw/KnmvJ8TE4BnjY+Hn
	 6XknwjXP+TIpYh9goWlaatrny8u2RobcbspIIXWMIsnDIT/IvbMf3Wac8s64gRZQe5
	 NjJf0VkaT+DmzoH4zyorAxT3yQhgjYLstjrkN3YSJnhmki9x0WjG+01iaWzq/46qh3
	 LNTc/mDsxGmuWcpa/EdoTY/Nb0IsG9zv+lH3qT+ZRuHUGl0QzdUOAvylwYxbLlhplD
	 9H3Qqs5njDSCGn4tWYZGhos4V/WNA/SXY8C+yR4xUnjqNSX/B+uzbgkwgAAZIImtqn
	 kHyKsZ2islK3A==
Date: Mon, 26 Oct 2026 11:40:37 +0100
From: Gao Xiang <xiang@kernel.org>
To: Zhan Xusheng <zhanxusheng1024@gmail.com>
Cc: xiang@kernel.org, chao@kernel.org, zbestahu@gmail.com, jefflexu@163.com,
	dhavale@google.com, hongbohbli@tencent.com, guochunhai@vivo.com,
	giuseppe@scrivano.org, linux-erofs@lists.ozlabs.org,
	linux-kernel@vger.kernel.org, zhanxusheng@xiaomi.com
Subject: Re: [PATCH v2] erofs: don't reuse a superblock for a mount that
 passes device=
Message-ID: <at8uJdaEhdkZVsfY@MacBookPro>
Mail-Followup-To: Zhan Xusheng <zhanxusheng1024@gmail.com>,
	xiang@kernel.org, chao@kernel.org, zbestahu@gmail.com,
	jefflexu@163.com, dhavale@google.com, hongbohbli@tencent.com,
	guochunhai@vivo.com, giuseppe@scrivano.org,
	linux-erofs@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	zhanxusheng@xiaomi.com
References: <at8UCyjlHgxxBAaf@MacBookPro>
 <20261026092217.2129604-1-zhanxusheng1024@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261026092217.2129604-1-zhanxusheng1024@gmail.com>

On Mon, Oct 26, 2026 at 05:22:17PM +0800, Zhan Xusheng wrote:
> From: Zhan Xusheng <zhanxusheng@xiaomi.com>
> 
> superblock_share together with device= is rejected in
> erofs_fc_fill_super():
> 
> 	if (test_opt(&sbi->opt, SUPERBLOCK_SHARE) &&
> 	    sbi->devs->extra_devices)
> 		return -EINVAL;
> 
> but extra_devices is kept in sbi->devs, not in sbi->opt, and
> erofs_sb_share_test_super() compares only the backing inode, the
> fsoffset and sbi->opt.  So once the image is mounted with
> superblock_share, a second mount with superblock_share,device= matches
> that superblock and get_tree_super() reuses it without calling
> fill_super() at all.
> 
> The same command line therefore either fails with -EINVAL or succeeds
> with device= quietly dropped, depending on whether a compatible mount
> already exists.
> 
> Refuse to match a context that brought device= options, so that it gets
> a superblock of its own and fill_super() decides as it does today.
> 
> Only the incoming context can be tested: a shared superblock may have
> extra_devices set itself, because erofs_scan_devices() fills the device
> table from the image when no device= was given.
> 
> Fixes: cd4108319bb3 ("erofs: reuse superblock for file-backed mounts")
> Signed-off-by: Zhan Xusheng <zhanxusheng@xiaomi.com>

Reviewed-by: Gao Xiang <xiang@kernel.org>

Also I will update the subject as "erofs: fix disallowing superblock_share
if device= is set".

Thanks,
Gao Xiang

