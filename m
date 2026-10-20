Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792487746;
	b=Gm0bu+vv90rvU9SUAjs5P1Aqb+3vn05dbWAGEKfnss/ZAgZdLzc3zueJAtxUm062vGrd
	 YaR4ZyWTykqnMONHG2Fo7k/h2bYB5JGCmA4oLFfuCpj+LGLggjFwF/N5tpUxmX+UFwiH6
	 jwVZ7O8uRrlMFrhD8BsMp276P2pLTa8jzJ95R/3wO7/dY3J2KtoPAX6JFGY2OvjhgvnNL
	 Yk0YEMEs+lIdTttEg66NSUfpCDDHQJAJ9hBaeZMs0G8UFzQy97Qy0S+abRISvMHi+Uipd
	 cS8A0q6OhbUWmqMGY8joouTIyduzh91HdWciMMDKnAYTjn/wjlYHjsARGgeC2JZwU8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792487746;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:Cc:
	 Subject:To:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=pPNi6K/q4Flsi+LY1UbUim5BbaMXt4Eom1UfkYRyDKA=;
	b=st+bRZJRVmR+uIf12OCWV1vm5s1AAGo7/mUIPKxbRCUmxFu0DmFsIVN/VMRrZw/w3ooc
	 ha6VJcUpfiT7fR1mO4eFpRLHBCRsROzJkVzXQIz4Ds1JexQW/rMex0h4WuRPgayZCoeMh
	 eycSCSIWuBH2xjtcXOxXGVxA96/rtzISxZgTES0wp8BCYGJsE3uw+BeufH1NwG9cAPeY5
	 1EBc4r7NMZ755eUy7CXAidFq45/3kcd1lOytwe6kT9G1WfhQuDhCMzZVV/MRDHqfdYxsU
	 d0J76FotXGfh5ue17QV3fjfnbgJPCTNXT4HT2DoEUjvbWSXs9s/hxXPFaeYE4z5EIpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=crJexHtX;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E35DD606A334
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 09:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=crJexHtX
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90EAF1F000C5;
	Tue, 20 Oct 2026 09:15:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792487745;
	bh=pPNi6K/q4Flsi+LY1UbUim5BbaMXt4Eom1UfkYRyDKA=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To;
	b=crJexHtXiW28+0ceEd/l7jMkNcWiS4NiL4QSS/g4jKSWFlWD+UzSXpFxEJFBuS6C3
	 iTuUIou+SFLRVl2rZ0eqilA6lzaEoJdBEoZspIm0q5KJS5W/qPoafMD5RqO6B/rH0g
	 ty9Fj8QZfLPxQcNic9YMdwQvTbKgxEwIMQtjxM/TEX5kfLxNfZzh7jAtL1U6s6+H7k
	 gmleBR1bjDwrs1EJcvOCWDSIGoWQQ6R9QcCQNHq6n/82BhuirzgOlMnehj3gTElws1
	 UxF8yDRVuO+N4zMNXQqpVj3k2Bbx+C1nCZJbA1IiMmsyFjT828AreqTfVWeIXeqUY0
	 WeeG87dq4nciQ==
Message-ID: <b82f0168-dcf4-4018-8f51-de39d02a9feb@kernel.org>
Date: Tue, 20 Oct 2026 17:15:43 +0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: chao@kernel.org, Daeho Jeong <daehojeong@google.com>
Subject: Re: [f2fs-dev] [PATCH] f2fs: don't use truncate_inode_pages_final()
 on live inodes
To: Daeho Jeong <daeho43@gmail.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, kernel-team@android.com
References: <20261015161714.1586334-1-daeho43@gmail.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20261015161714.1586334-1-daeho43@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/16/26 00:17, Daeho Jeong wrote:
> From: Daeho Jeong <daehojeong@google.com>
> 
> truncate_inode_pages_final() is meant to be called from ->evict_inode.
> It sets AS_EXITING on the mapping, and nothing ever clears it, to tell
> the VM that the inode is going away.
> 
> f2fs calls it in two places where the inode stays live:
> 
>  - F2FS_IOC_START_ATOMIC_REPLACE uses it to drop the page cache of the
>    original inode before setting i_size to 0. The atomic write then
>    goes on through this inode.
> 
>  - f2fs_abort_atomic_write() uses it to drop the uncommitted data. It
>    is called on eviction, but also on the last writer's close in
>    f2fs_release_file(), from f2fs_file_flush() when the atomic writer
>    exits, from F2FS_IOC_ABORT_ATOMIC_WRITE and when
>    F2FS_IOC_COMMIT_ATOMIC_WRITE fails.
> 
> Other processes may still have the file open or mapped in all of these
> cases. The mapping then stays marked as exiting for as long as the
> inode is in memory. This stops reclaim from storing workingset shadow
> entries for it and breaks any code that assumes an exiting mapping has
> no users left.
> 
> All we need in both places is to drop the page cache, so use
> truncate_inode_pages(mapping, 0) instead. The eviction path is not
> affected, because f2fs_pre_evict_inode() still calls
> truncate_inode_pages_final() after f2fs_abort_atomic_write().
> 

Cc: stable@kernel.org

> Fixes: 3db1de0e582c ("f2fs: change the current atomic write way")
> Fixes: 41e8f85a75fc ("f2fs: introduce F2FS_IOC_START_ATOMIC_REPLACE")
> Signed-off-by: Daeho Jeong <daehojeong@google.com>
Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,
