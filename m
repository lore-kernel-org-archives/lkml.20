Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=62.210.214.84
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793243426;
	b=3cUHukSDMC/Cf0EdM0olxl2F6YjG9FPJqSHc0qZZZxztaoxKUV19LGrNpz3fHKO1bkM3
	 rxsHnlgRU5faed96NRJzchpX5n26XLn++BthHql7uU/uyTcHmKL7JdbZSyJgJIvxKuR0S
	 meIB0c5iCerQpSsaESs+OELGdHmU3Dho6c5GDst9Ftypvq6Sfx+oK3vDwXSlZBfb2iZpu
	 9n3HnbswDCXQedJQzmfObtZqpLLJRsDXXOh+TwSiC7VaG8zUOGLVnebXr1Hp1ggoB4L60
	 iuniEULjw4r4zm4KjqZ7bD+VZNhhEjMEQa06d71k8yvqmvNzpnM5Qict4svXBpw+EJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793243426;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=Hnn+XSsK00XAAHUyElKxTpv43aVdKWCxhzx8Lt6Vo0c=;
	b=qzPFl1gDfiFJD4no3j04oC5ln6QsppaGmssp3bBc9w/yfNVm3kv+ud8GGHe+5lKyGzI3
	 TjcxNbFyNkDrtaD8axIFrl8vTbLR7Wt3tRyd2jlJOQwoj55oAt5JjXDcChLUkr9mCU1Fu
	 aa1l5cZ2Z+nKQjoD3zOZZ5HdLYQJ8JNqM+RC92+FEujILwm5CuKHzU85umF5HAgl6XROV
	 E/clpDNILYwpers1Vk9z9cdq9FI/IYoUgkuzP00TbDej/fImwkNw/tAQQrZpm/jSfkU3G
	 pBQxkNgdjPfGNnkvYjn+oHzZ+nVmaQDSjvzfi/TMgkmgPG/IrQpG7NkYP4OwLH/6DZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=codewreck.org;
	spf=pass smtp.mailfrom=codewreck.org;
	dkim=pass header.d=codewreck.org header.i=@codewreck.org header.a=rsa-sha256 header.s=2 header.b=cMR+2lEK;
	arc=none smtp.remote-ip=62.210.214.84
Received: from submarine.notk.org (submarine.notk.org [62.210.214.84])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0A0E606A322
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 03:10:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F0A0E606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codewreck.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codewreck.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=codewreck.org header.i=@codewreck.org header.a=rsa-sha256 header.s=2 header.b=cMR+2lEK
Received: from gaia.codewreck.org (localhost [127.0.0.1])
	by submarine.notk.org (Postfix) with ESMTPS id D655514C2DE;
	Thu, 29 Oct 2026 04:10:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=codewreck.org;
	s=2; t=1793243422;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Hnn+XSsK00XAAHUyElKxTpv43aVdKWCxhzx8Lt6Vo0c=;
	b=cMR+2lEKtXOsLFLqlERdy5zBSngHlk26guVQyW6eXEz3xVHbs1oU7uthPE06wRq5UY8B7W
	4yw0quqKKkFY6pmUequs0pzSQ5C5AbCmdlNSmjAdLra6YAmf5GdSvJUrUCb3GSi3QmFORn
	huY48+/ImEK7OJTeFVWeqnkqOQS2caTCT46dPpbjLg6SbT04NTuBFf1UPViv7nmd0zXJmy
	62WQMlTBvZ5uUDQcqUGSyaNM0xdSoOFQ/YfKAHxc+jkEKe4DjX393StflqnCX1T8+CJcq7
	6t9S5u6DCvGw4J6KfDV2jWjDOai9hKRRzm5n5haWuLxHwIXpVRDRIxZfVLqOOw==
Received: from localhost (gaia.codewreck.org [local])
	by gaia.codewreck.org (OpenSMTPD) with ESMTPA id e9ce229a;
	Thu, 29 Oct 2026 03:10:19 +0000 (UTC)
Date: Thu, 29 Oct 2026 12:10:04 +0900
From: Dominique Martinet <asmadeus@codewreck.org>
To: Yuanfu Xie <yuanfuxie@stu.pku.edu.cn>
Cc: v9fs@lists.linux.dev, Eric Van Hensbergen <ericvh@kernel.org>,
	Latchesar Ionkov <lucho@ionkov.net>,
	Christian Schoenebeck <linux_oss@crudebyte.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] 9p: do not store the create fid on special files
Message-ID: <auK5DISBP3Nmls1I@codewreck.org>
References: <92377346-29E9-46D3-96F5-AABA8A64CD57@stu.pku.edu.cn>
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
In-Reply-To: <92377346-29E9-46D3-96F5-AABA8A64CD57@stu.pku.edu.cn>

Yuanfu Xie wrote on Tue, Sep 22, 2026 at 09:16:22PM +0800:
> v9fs_vfs_atomic_open_dotl() always stores the create fid in
> file->private_data after finish_open().  FIFO and device inodes
> already have type-specific file_operations that own that field.
> Overwriting it with the fid makes later read/write/close treat the
> p9_fid as a pipe_inode_info, which corrupts the fid and can use it
> after it has been clunked.  The non-dotl atomic_open path does not
> assign the fid this way.
> 
> Only attach the fid for regular files and directories.  Special
> files do not need the create fid; leave it for the existing
> p9_fid_put() on the out path so it is clunked before return.
> 
> KASAN report, linux-stable 4982d3552a3b:
> 
> BUG: KASAN: slab-use-after-free in anon_pipe_prefill_and_lock+0x376/0x3f0
> Read of size 4 at addr ffff88800ab30538 by task repro/1
> 
> Call Trace:
>  <TASK>
>  anon_pipe_prefill_and_lock+0x376/0x3f0
>  anon_pipe_write+0x127/0x1600
>  fifo_pipe_write+0x24/0x300
>  vfs_write+0x659/0xd00
>  ksys_write+0x10f/0x200
>  do_syscall_64+0xdd/0x4a0
>  </TASK>
> 
> Fixes: 30d904947459 ("kill struct opendata")
> Signed-off-by: Yuanfu Xie <yuanfuxie@stu.pku.edu.cn>

Thanks, also picked up

-- 
Dominique Martinet | Asmadeus
