Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=62.210.214.84
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793243391;
	b=r86xm0Q1E3FXeIJwsqKGBYvtKcRqzQRUwxPBJmlYBRKFZ0hJagsaPY/Ripz3Yenf80CE
	 7K02sLQ8it7ok3uPtew1eApY3Py/0abNmb/qlrUzfTW7TKMEZKDCMhZw66ngh7NIdSJbM
	 u11KCfY4vpj6e+DKticETiG7tUWqg/L4z13fghAtIZLD0hE/aQ9WTKLmRnu7I8p4RxX7A
	 EhGJkEzkA/igkMYJ1l4MEGMi8Ssm5SFj12PX2chyD2TFMbPDFIgE9SGlt8Pu8JCGF/k7X
	 q0Vw45dFDoK6RTs3zHrpOqkiGtw0rSxBSLnaljBsCOj+AA8wYhJs6QoETJyJXM6zO/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793243391;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=MJRVYapJx4nbwT76nv618mDu68+p05gA77AZl7Oc3T8=;
	b=ScWohAor+28bZW/pUfwawTNBVRwDP7F0TkZ6H2PbESuhRmmQy1ZOy2FsaC42QZP0m3EQ
	 KRmaQ0/o0VG/y0lTmWxYTbNcArUfeWuQhtOIs7h2iGfSFVnbebBbuGYkahK1CO7xrE3ND
	 sv2FCDuKRwTwvC0sBr1dreYYOIyCIZuSZuwBs9i98LOzM0dSK9UfU+K4JOTrBNQE9+WaU
	 7aAK7qH3lnThu4VEtbXNZQ2CtjDSAS8FcdrhPPHRTS79k1JSAgIzO/aKZ3zcgwKz1Agdh
	 D8QHnaw0dWUyY2K+hHx4gvsSa+ptqNb/ru3M8F/8aSt41VcfK1yy/5+RGVnVnJFDZWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=codewreck.org;
	spf=pass smtp.mailfrom=codewreck.org;
	dkim=pass header.d=codewreck.org header.i=@codewreck.org header.a=rsa-sha256 header.s=2 header.b=o++yEMxs;
	arc=none smtp.remote-ip=62.210.214.84
Received: from submarine.notk.org (submarine.notk.org [62.210.214.84])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2767606A31D
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 03:09:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2767606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codewreck.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codewreck.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=codewreck.org header.i=@codewreck.org header.a=rsa-sha256 header.s=2 header.b=o++yEMxs
Received: from gaia.codewreck.org (localhost [127.0.0.1])
	by submarine.notk.org (Postfix) with ESMTPS id AC50914C2DE;
	Thu, 29 Oct 2026 04:09:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=codewreck.org;
	s=2; t=1793243387;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MJRVYapJx4nbwT76nv618mDu68+p05gA77AZl7Oc3T8=;
	b=o++yEMxskNnDGwaYaFTVQC5iiqAkfh/Az4+lIZwvSK9qpjo/biNZ8q5OOb6jzzkJE6/VHn
	jQfV5qn/uP7w9TthIKa3n3J09aBk1jrwdMUJGI3C1R48AprZALFYMdjU5tu4DLTR8CC9TV
	qHQXp3ZyN1dui6arOB4r9t/PtWErRTsEv80FS70t5RtqGUQLyhJLD7N00H1AxEz+aSu/Jt
	p6ZLoxfc/yerA9TAPcPQYbyGl2t2cky2eCvespdyDRdQKh8YeJOoTtO8xj+kqZ2mpLazO8
	Du0+9a+BbSzZBpRZF7b5T1JJSBsbtk1vr7h2RfsnihjyI7I1+WWlcN9XDonNtQ==
Received: from localhost (gaia.codewreck.org [local])
	by gaia.codewreck.org (OpenSMTPD) with ESMTPA id 46211ad8;
	Thu, 29 Oct 2026 03:09:43 +0000 (UTC)
Date: Thu, 29 Oct 2026 12:09:28 +0900
From: Dominique Martinet <asmadeus@codewreck.org>
To: Yuanfu Xie <yuanfuxie@stu.pku.edu.cn>
Cc: v9fs@lists.linux.dev, Eric Van Hensbergen <ericvh@kernel.org>,
	Latchesar Ionkov <lucho@ionkov.net>,
	Christian Schoenebeck <linux_oss@crudebyte.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] 9p: fall back to the normal open path for non-regular
 files
Message-ID: <auK46EAL4VU4JV4a@codewreck.org>
References: <908FC420-EC1F-46FC-8526-698F646961A8@stu.pku.edu.cn>
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
In-Reply-To: <908FC420-EC1F-46FC-8526-698F646961A8@stu.pku.edu.cn>

Yuanfu Xie wrote on Tue, Sep 22, 2026 at 09:15:36PM +0800:
> v9fs_vfs_atomic_open() and v9fs_vfs_atomic_open_dotl() call
> finish_open(file, dentry, generic_file_open) regardless of the file
> type the server reported for the created dentry.  The supplied
> callback replaces f_op->open in do_dentry_open(), so blkdev_open()
> never runs for a server-reported device node: an open() with O_CREAT
> succeeds with f_op = def_blk_fops while f_mapping still points at the
> 9p inode, because the bdev mapping swap only happens inside
> blkdev_open().  The block file methods then derive their block_device
> from that inode with I_BDEV(); the loads land at the tail of a
> 656-byte v9fs_inode_cache object (offsets +624 and +632), which KASAN
> reports as slab-out-of-bounds, and the garbage they read is then
> dereferenced, so the first read(), write(), ioctl() or close() ends
> in a NULL pointer write and a panic.  In the ioctl(BLKGETSIZE64)
> variant the value read this way is returned to userspace.
> 
> The server controls the file type reported for the create, so a
> malicious server can crash the client this way.  KASAN report of the
> read() variant, on a build of linux-stable 2709dd5ae32f:
> 
> BUG: KASAN: slab-out-of-bounds in blkdev_read_iter+0x3cd/0x440
> Read of size 8 at addr ffff88800828ceb0 by task repro/1
> 
> Call Trace:
>  <TASK>
>  dump_stack_lvl+0x7b/0xa0
>  print_report+0xd0/0x630
>  kasan_report+0xe5/0x120
>  blkdev_read_iter+0x3cd/0x440
>  vfs_read+0x718/0xa50
>  ksys_read+0x10f/0x200
>  do_syscall_64+0xdd/0x4a0
>  entry_SYSCALL_64_after_hwframe+0x77/0x7f
>  </TASK>
> 
> The buggy address belongs to the object at ffff88800828cc40
>  which belongs to the cache v9fs_inode_cache of size 656
> The buggy address is located 624 bytes inside of
>  allocated 656-byte region [ffff88800828cc40, ffff88800828ced0)
> 
> A plain open() without O_CREAT is not affected: it runs blkdev_open()
> and either maps the device correctly or fails with -ENXIO for an rdev
> with no registered device.  When the created inode is not a regular
> file, clunk the fid the create opened.  The unopened fid is already
> on the dentry.  Set FMODE_CREATED and return finish_no_open(file, NULL)
> so the VFS keeps its dentry reference and calls the inode's ->open.
> Regular files still use finish_open() with generic_file_open.
> 
> Fixes: be12af3ef5e6 ("getting rid of 'opened' argument of ->atomic_open() - part 1")
> Signed-off-by: Yuanfu Xie <yuanfuxie@stu.pku.edu.cn>

Thanks, looks good to me, picked up
-- 
Dominique
