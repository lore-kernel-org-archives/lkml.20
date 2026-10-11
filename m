Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A23F393DEB
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 08:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791705610; cv=none; b=nBFXYSOQo2zt5POq8EIPuZOSQvtKl9lN7UrsTnrTQB1H4QsgRBo8jy7OEjGTcAYmVsyL4Zkfe0A8HeOW2JnqWUpWNfwMX8RqQRG0UUDKibtP+ka0PJvL66wbf3IfbSZe3Jc/3cvVR3cYMDaoVQoROXU7bwZul+jQ8SvHabfrEB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791705610; c=relaxed/simple;
	bh=KgT+pVBy+KD6tIIJ9Z9VwFVOaoyQmWBVBDs1doE72Fk=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=YuVIVbc+d2Jy92VWJxuOxN/Ta7tblReP3vHUM0zEOfeXRWjglqzrx8JSPA0SlJTOoSKPFH3c3nnLaEenBeNLhhCDlvWfy+ZofnXhBA5xXUT/sqqMMQTV3chj9ZcO9Z3iQYVGkzHGwtiZW6i4CfMzR0XZcM5QJN2U3gA/+vSAkgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ar6eCvN8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ar6eCvN8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19E831F0089B;
	Sun, 11 Oct 2026 08:00:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791705609;
	bh=BldPchgRPYf8807oLd4yoj0+uSTzoKV/uAiOC/vtc6w=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To;
	b=Ar6eCvN8aC/KY4dbcb8yUHCoXAjmrDhgTDtAl235n6kBA69nZzOoYqd5W5wlsEAKB
	 nz3z9u+oXnA0+HfgMos2WsghNQsblZeFPl3x2OHNKNPOBK4zUUspxriYJtBiY2XbU5
	 0Xv1FG+vfw9NM6+KIk1hCIhGjLz7A6pkg5KVLVq64Bphh+7r0RlQ1axiFqzibQvLfd
	 4dfNRn2JSB8Cowkct5lvHdpwy6IEgg+tWbaPZsIzTv7BHK/3Z9dpxphIvA1hhBS13U
	 upe3/EO3S4j18NmqimZ67C+nZj1x2PWuv19xFevjSKvyx0+QXmSha5QUqxE3E/ML5X
	 O7cPeShtfxvyg==
Message-ID: <b76e45ca-b455-4c2f-82c8-abbb596acb86@kernel.org>
Date: Sun, 11 Oct 2026 16:00:06 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: chao@kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-kernel@vger.kernel.org, Zhan Xusheng <zhanxusheng@xiaomi.com>
Subject: Re: [PATCH] f2fs: fix defragment writeback range truncation on 32-bit
To: Zhan Xusheng <zhanxusheng1024@gmail.com>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20261005154954.2097054-1-zhanxusheng@xiaomi.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20261005154954.2097054-1-zhanxusheng@xiaomi.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/5/26 23:49, Zhan Xusheng wrote:
> f2fs_defragment_range() flushes the range it is about to defragment:
> 
> 	filemap_write_and_wait_range(inode->i_mapping,
> 				pg_start << PAGE_SHIFT,
> 				(pg_end << PAGE_SHIFT) - 1);
> 
> pg_start and pg_end are pgoff_t, 32 bits on 32-bit kernels, so both
> shifts are evaluated in 32 bits and truncated before they are widened to
> the loff_t parameters.  pg_end is only capped by the file's page count,
> so for a file larger than 4 GiB the shift wraps.
> 
> For a 5 GiB file pg_end is 1310720 and the range collapses from
> [0, 5 GiB) to [0, 1 GiB), leaving the rest of the dirty pages unwritten
> before the blocks are moved.  For 8 GiB the shift yields 0, the minus one
> makes it (loff_t)-1, and the range becomes [0, LLONG_MAX].
> 
> The matching call in f2fs_collapse_range() already casts:
> 
> 	filemap_write_and_wait_range(inode->i_mapping,
> 				(loff_t)index << PAGE_SHIFT,
> 				((loff_t)pg_end << PAGE_SHIFT) - 1);
> 
> Do the same here.  On i386 the shift changes from "shl $0xc,%ecx" to
> "shld", i.e. from a 32-bit shift to a double-precision one.
> 

Cc: stable@kernel.org

> Fixes: d323d005ac4a ("f2fs: support file defragment")
> Signed-off-by: Zhan Xusheng <zhanxusheng@xiaomi.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,
