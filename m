Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.30.100
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792482211;
	b=3/EuhVIJGnbg7XFJEN1ev6v5hTdcjwKe/DZWTMVFPRT5uOfZ5uQT1ooDVLmi6R6NTEl+
	 gvBNj+1bzkXbjpEJUHkIkO9K10UEbrxMyU7MF7mAvARg7o3iLRiCNXSS7G7uLNoPfqN3A
	 bfL5EVhLAzdJ1MKFaXjjQuWzKQv/yQr6fjh2MaLmiJFpisqNUBW0EnSie4IfmM8zSXZ0k
	 VflkMzFqSwSNNBaNJR6bMHWbx4GU1HhOVkuEp2UvvPXpHKeRO/ZQjKB5ok4DQFo73b2t9
	 oQkACRnlkUf6WYfpCxakY3TFkb8zXoccV1D9RsUYOAOguXiWJpV1Iz4XtypiqRlLl3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792482211;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:References:Cc:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=uu63qmqNvAJMzzdOPrVRwU8iPV7E/KmddMafoX0Pa1U=;
	b=hYCXSaGFpohlRO7VqWplkSxxxNdYZy+FzHi6baWuZS4C58cmmh+s6S63fO4/6evN0cvt
	 LidjTuTt1wUCRYg9qt65QrJ3VQAsZJ/8jIUcmjWntEV4sRe3G+yefYWUUhP6sYc231MPj
	 E5qWLb8uLDS4QZBbYauC09Xt25eKi7MYM3LVVyHU4RO2LEQaK/KpGJFIi6s4wBhWrWrmu
	 og8mhT7Yq+pjIcNtzVjkFyHEskBZ601Je/mDufARrxUL6BtWiptRcKiI76BIaZtVpkVXE
	 3Y1dReqftibyz6GoIUS+eXAi6UCBQqNCpXR4tKW3rnOKJ+1j0Hun07D2g4ZFdptqcVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.alibaba.com;
	spf=pass smtp.mailfrom=linux.alibaba.com;
	dkim=pass header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b="iS/MJXfF";
	arc=none smtp.remote-ip=115.124.30.100
Received: from out30-100.freemail.mail.aliyun.com (out30-100.freemail.mail.aliyun.com [115.124.30.100])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29C42606A322
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 07:43:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 29C42606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=iS/MJXfF
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1792482202; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=uu63qmqNvAJMzzdOPrVRwU8iPV7E/KmddMafoX0Pa1U=;
	b=iS/MJXfFVANvwkDVNpNM29xZe3bNRcEci6gdLQgFu+kJ8UjrKyrovcXy8sxshB51v+2tcXx8jy8LK7oVqxGHROAIwWkT+5V+fcKG7oqcI06UkFywul8kDGXHCDvR6sxaZRUeNSbfXsfR84slKquwDz21weIx/J8C+MU9Kstsxa4=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R631e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037009110;MF=joseph.qi@linux.alibaba.com;NM=1;PH=DS;RN=7;SR=0;TI=SMTPD_---0XDC9X5v_1792482201;
Received: from 30.221.145.25(mailfrom:joseph.qi@linux.alibaba.com fp:SMTPD_---0XDC9X5v_1792482201 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 20 Oct 2026 15:43:21 +0800
Message-ID: <f4f403bf-efc4-4629-bb7b-2c3b2cc35303@linux.alibaba.com>
Date: Tue, 20 Oct 2026 15:43:21 +0800
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
Subject: Re: [PATCH] ocfs2: validate non-coherent freefrag bitmap inode
To: Jiale Yao <yaojiale02@163.com>
References: <20261018114118.927071-1-yaojiale02@163.com>
Cc: Mark Fasheh <mark@fasheh.com>, Joel Becker <jlbec@evilplan.org>,
 Heming Zhao <heming.zhao@suse.com>, Tristan Ye <tristan.ye@oracle.com>,
 ocfs2-devel@lists.linux.dev, linux-kernel@vger.kernel.org
From: Joseph Qi <joseph.qi@linux.alibaba.com>
In-Reply-To: <20261018114118.927071-1-yaojiale02@163.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 10/18/26 7:41 PM, Jiale Yao wrote:
> The non-coherent freefrag ioctl path reads the global bitmap inode
> directly and trusts its chain list. A malformed cl_next_free_rec value
> can therefore index beyond cl_recs while scanning chains.
> 

Could you  provide the detailed bug report?

> Validate the inode block before consuming its bitmap and chain metadata.
> 
> Fixes: d24a10b9f8ed ("Ocfs2: Add a new code 'OCFS2_INFO_FREEFRAG' for o2info ioctl.")
> Signed-off-by: Jiale Yao <yaojiale02@163.com>
> ---
>  fs/ocfs2/ioctl.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/fs/ocfs2/ioctl.c b/fs/ocfs2/ioctl.c
> index cbe59d231666..8383f900c847 100644
> --- a/fs/ocfs2/ioctl.c
> +++ b/fs/ocfs2/ioctl.c
> @@ -575,6 +575,12 @@ static int ocfs2_info_freefrag_scan_bitmap(struct ocfs2_super *osb,
>  			mlog_errno(status);
>  			goto bail;
>  		}
> +
> +		status = ocfs2_validate_inode_block(osb->sb, bh);
> +		if (status < 0) {
> +			mlog_errno(status);
> +			goto bail;
> +		}

ocfs2_validate_inode_block() only validates cl_next_free_rec when
on-disk dinode has OCFS2_CHAIN_FL set. So a crafted global bitmap block
without that flag still lets the freefrag chain walk index past cl_recs[]
and read out of bounds from the buffer_head.

Thanks,
Joseph

>  	}
>  
>  	gb_dinode = (struct ocfs2_dinode *)bh->b_data;

