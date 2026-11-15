Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.30.132
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794747751;
	b=gQ9DKqk4CSrHn3h8/kwaesRRQ203SPEhomXG26OLvhtYHc05Z8+EPH4JJnboLTNCutY9
	 +8hGa3rDApWK5Q3yzzdu21D9N1lJVGpdOQ25B4mNziT6Nc8ZS6T/6645y2VlmCXoZw4mG
	 uPEVK4Ay610DxPZr3v2JveTO+UBEY8rXxwOHWNQhoEVvmWYx//AlLCc30hYHYD33FDtdE
	 2ihJ50eWP8+M0hIdFgF79ZJDaMQCryCJ74SyMjDV3dhDpR8w209X/SXF1joWv6bKrzyHZ
	 sYKhXCTQhjriKfmyP8VDitwjUBBQQhvShbvENovVe5oOcASk6TEq4DGXMfl0DFPE+8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794747751;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=+BsOQn9fI2fusV92JgJXST2g12Yg/yq3BHWZFI28LzQ=;
	b=hAufSnDJZd5yHF2yPQ6rXIi2xZceKpMbrYyWd0wNwZgoxTyP++3xQWSjBRzcAJiHa3/e
	 HfwLXVq6bttIYkZUr4w4QFDhRD2PqvhRmKkDuX3svkRytC8m6020a7W+cwSzwTSQqA4lx
	 HLtl4yRqGvEUfJQ8NHEOLNnlSWbVY0/2sfE6qHW4PH12dXo1h16WBfskaQKdIVDufUntl
	 iBvgrDBaPSWn3oDn+Px1VvY0HIWxoVNBS7zco3ijX96S1iHaHIxkMn1sdPogQ2/BO/FZy
	 4y5z+d/elxXWNJUSs8q2uOz+vyWLgvyQOYpPqMeQO+qisA5BsNehyz12stDQVhpFpCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.alibaba.com;
	spf=pass smtp.mailfrom=linux.alibaba.com;
	dkim=pass header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=g2n80qFV;
	arc=none smtp.remote-ip=115.124.30.132
Received: from out30-132.freemail.mail.aliyun.com (out30-132.freemail.mail.aliyun.com [115.124.30.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6418606A31E
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 13:02:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D6418606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=g2n80qFV
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1794747743; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=+BsOQn9fI2fusV92JgJXST2g12Yg/yq3BHWZFI28LzQ=;
	b=g2n80qFVkxRvWRJXVJp1+vqWv1FIeVnWbq9zCyyoGN0a+eulIh5kJlE6N9wEGLtHK8cim82tIvwl3+mdH0tbuf7pMGulIj5OV+uSf8R5TlOHakR9fQD6+1keU8x/T4b+B/GQ+GbwtexVD/1YI0/URCJHMegdx/4tPyKbqIcXDLE=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R151e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037026112;MF=joseph.qi@linux.alibaba.com;NM=1;PH=DS;RN=8;SR=0;TI=SMTPD_---0XEjuDMt_1794747742;
Received: from 30.180.33.101(mailfrom:joseph.qi@linux.alibaba.com fp:SMTPD_---0XEjuDMt_1794747742 cluster:ay36)
          by smtp.aliyun-inc.com;
          Sun, 15 Nov 2026 21:02:22 +0800
Message-ID: <d7c23cb6-5839-4b42-923e-1a1211cdcd41@linux.alibaba.com>
Date: Sun, 15 Nov 2026 21:02:22 +0800
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
Subject: Re: [PATCH] ocfs2: don't reuse SINGLE_DEPTH_NESTING for unpublished
 inode ip_alloc_sem
To: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Mark Fasheh <mark@fasheh.com>, Joel Becker <jlbec@evilplan.org>,
 Heming Zhao <heming.zhao@suse.com>, ocfs2-devel@lists.linux.dev,
 linux-kernel@vger.kernel.org,
 syzbot+3f66416993279938e957@syzkaller.appspotmail.com
References: <20261115104656.210945-1-ngocthang2710.1999@gmail.com>
From: Joseph Qi <joseph.qi@linux.alibaba.com>
In-Reply-To: <20261115104656.210945-1-ngocthang2710.1999@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/15/26 6:46 PM, Nguyen Ngoc Thang wrote:
> Commit c204bf5ac3ee ("ocfs2: fix deadlock in inline-data truncate
> transactions") made ocfs2_xattr_set_handle() take ip_alloc_sem of a
> not-yet-published inode inside the create transaction, under subclass
> OCFS2_IP_ALLOC_SEM_UNPUBLISHED = 1, so lockdep records:
> 
>   sb_internal -> j_trans_barrier -> ip_alloc_sem/1
> 
> But subclass 1 is SINGLE_DEPTH_NESTING, which ocfs2_remap_file_range()
> already uses for the destination inode, and the remap then starts a
> transaction in ocfs2_duplicate_inline_data():
> 
>   ip_alloc_sem/1 -> sb_internal
> 
> Lockdep merges the two and reports a circular dependency.  It cannot
> deadlock, since the unpublished inode is unreachable by anyone else,
> but the warning hides real reports.
> 
> Give the unpublished subclass its own value past SINGLE_DEPTH_NESTING.
> 
> Fixes: c204bf5ac3ee ("ocfs2: fix deadlock in inline-data truncate transactions")
> Reported-by: syzbot+3f66416993279938e957@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=3f66416993279938e957
> Signed-off-by: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>

It takes no runtime effect. But the collision is real.
Reviewed-by: Joseph Qi <joseph.qi@linux.alibaba.com>
 
> ---
> Tested in QEMU (x86_64, syzbot config with lockdep) using the syzbot C
> reproducer on top of 23c62304dde2:
>   - before: "possible circular locking dependency" after ~8s
>   - after:  no lockdep report in 3 x 180s runs, debug_locks stays 1;
>             /proc/lockdep shows both ip_alloc_sem/2 (create) and
>             ip_alloc_sem/1 (remap) exercised.
> 
>  fs/ocfs2/xattr.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/fs/ocfs2/xattr.c b/fs/ocfs2/xattr.c
> index 71e5986bafaa..9f2d5797e4d6 100644
> --- a/fs/ocfs2/xattr.c
> +++ b/fs/ocfs2/xattr.c
> @@ -3867,10 +3867,11 @@ static int __ocfs2_xattr_set_handle(struct inode *inode,
>   * ip_alloc_sem there adds a transaction -> ip_alloc_sem order that would
>   * form a lockdep cycle with the ip_alloc_sem -> transaction order used
>   * elsewhere, if not for this separate subclass.  The inode is unpublished
> - * so the acquisition can never contend.
> + * so the acquisition can never contend.  It must not collide with the
> + * SINGLE_DEPTH_NESTING subclass ocfs2_remap_file_range() uses.
>   */
>  enum {
> -	OCFS2_IP_ALLOC_SEM_UNPUBLISHED = 1,
> +	OCFS2_IP_ALLOC_SEM_UNPUBLISHED = SINGLE_DEPTH_NESTING + 1,
>  };
>  
>  /*

