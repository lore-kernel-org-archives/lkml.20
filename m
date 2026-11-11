Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794385852;
	b=4aSJYYGPkcSucWAM4IdOCZ5IcZ5F23+Jxy46I+apgkMIi1TV+QHSMel1qVcU4zvMELFw
	 0zG8pyq8zuMIMjIXWIrpAkZUUnCVdCSHjyN909TzXY04BNKQ4vb3VDCbIo9VTYvB+hnLI
	 LAZkrBv9C4X59rntWlUUD2XaPVGXmV44SVKPRywTVvV/tfGZ1NwurC9A+LexEJgWWJqfr
	 0MG/FqV7xY89FpIk4lF4UM7Jq1znV1niWMMVKl1NWUsMyrXrtI4rKixXxPOVH5rdX+qTn
	 d8ouK1EAikgvalYbPo/cjZ08BiWuNw40SDEgRpI7G6LnWg6TMSDyE7gekD+BkRC5f7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794385852;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:Cc:
	 Subject:To:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=3H9/gKfZON35QpEehuN/02KH/4m7mFFGWW7NINuD4kU=;
	b=GSSGcfHbnQSq1Unk4Bd9Qnyx+9PeqnEw8/KT3kEm1BD6772g5CF9H1ZCeAduyvWEbL3c
	 MfYsok3Ru/PP0yOuF8p3GrcCBoY3utSQ/IH/2hHEGLiXXn31iznLX7emE/1T6D8sOET70
	 R5Wng8PqgLtfdW3fYm/gnjJZdy/wYELY4hgf6EDKQw6++4MgkS3KDfjjqd1SMMUzH8+AP
	 iCM9ZYQEJagLpm9QN+LlPtjpAFb+8XjLCkzTdFYhHeQCntgMh5dddCFHs4CvQCbisvZ2K
	 Z4WqHcLzOnxnvQaIUDnBLS/v97ZicSGpr8Eq1YwXj270GuS+30crAyRKha/0OK+H/4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="Jd+/4Zzd";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AD80606A32E
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 08:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Jd+/4Zzd
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BB251F00A09;
	Wed, 11 Nov 2026 08:30:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794385851;
	bh=3H9/gKfZON35QpEehuN/02KH/4m7mFFGWW7NINuD4kU=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To;
	b=Jd+/4Zzd33jg0xiYr4KG6ZMv59DluJdGvQyECHxm3i13QwhLqQWkZwdB5PZ0Voh4G
	 WVxnnG/fkglmxPtRB+yt7tsBPO7jzV9/W+JAuQAvTHS1o3N2ODBtuuzKDcMZ5HNNED
	 m1LOSwhLVJ/t+o7H59Jw6s4YCf8074TJpF5QhF4HW2xHInDxyz/tiuwjE+v8iSscvO
	 A0LmkdBZvfroks7lh5TuLAOkivp/waxGUzTDO6PxRfujIQOrNkrdqpkohwGH2lRCv5
	 Y34bHBjnU3u9aHiVI6KU+aGbtyeLX7/9hHVlKhk+IPmgVGLpxIhIwQS+jIUjV90Fmd
	 B/ypaXGto/hYg==
Message-ID: <acb8e08b-4a9f-4419-8b1b-b1933800311b@kernel.org>
Date: Wed, 11 Nov 2026 16:30:48 +0800
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
Cc: chao@kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-kernel@vger.kernel.org, Guikun Yang <yangguikun19@qq.com>,
 zhanxusheng@xiaomi.com, stable@kernel.org
Subject: Re: [PATCH] f2fs: don't BUG_ON a missing orphan inode at mount
To: Zhan Xusheng <zhanxusheng1024@gmail.com>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <tencent_B30A444DF94444D1A63A7D6F8E2039F1990A@qq.com>
 <20261105034419.2701443-1-zhanxusheng1024@gmail.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20261105034419.2701443-1-zhanxusheng1024@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/5/26 11:44, Zhan Xusheng wrote:
> From: Zhan Xusheng <zhanxusheng@xiaomi.com>
> 
> recover_orphan_inode() treats -ENOENT from f2fs_iget() as a kernel
> bug, but the ino comes from the on-disk orphan block. An image whose
> orphan entry names an inode without a NAT entry hits the BUG_ON at
> mount with CONFIG_F2FS_CHECK_FS, or a WARN and a failed mount
> without it.
> 
> To reproduce, unlink a file while it is still open, sync, crash,
> then change ino[0] in the checkpoint's orphan block to an unused
> nid and mount:
> 
>   kernel BUG at fs/f2fs/checkpoint.c:967!
>   RIP: 0010:f2fs_recover_orphan_inodes+0x6a3/0x9a0
> 
> Treat it as corruption, the same way the entry_count check does:
> fail the mount with -EFSCORRUPTED and record
> ERROR_INCONSISTENT_ORPHAN for fsck.
> 
> Fixes: 8c14bfadeac2 ("f2fs: handle error of f2fs_iget correctly")
> Reported-by: Guikun Yang <yangguikun19@qq.com>
> Closes: https://lore.kernel.org/linux-f2fs-devel/tencent_B30A444DF94444D1A63A7D6F8E2039F1990A@qq.com/
> Cc: stable@kernel.org
> Signed-off-by: Zhan Xusheng <zhanxusheng@xiaomi.com>
Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,
