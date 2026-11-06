Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.95.11.211
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793962338;
	b=JyScBfWH5PuCPiwBmnwzqlCIv85rM/g3P4RbRNXuaewmT+SJJdtpTGu7ZI9HEVewyHNj
	 sDV+8N3XlhPsc5tO5vH/zxp2WuZEY3k1hpbT4a8RdmNw5ClidjqZHPIP2G3c0Jv0kGfKh
	 TuaiFIYmt0u1bCyd0onqHUwRJFqZcBMqzwHmo59PtRwOCdjxWm3z9lpNUdApypFq4D0yT
	 CVB+JAUMz8ULUf3PP3ZaYP3y3mSXYiLW2ZD3zwHSWJ1HqWJn5dt6BUjwMhNIAj5BHz4ob
	 pfVf4RgWIl7LAFAxIWF8bkemIbdTCo+52uFpFCXYsYQRPskXtSwljBDLCUkEuuZsImg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793962338;
	h=DMARC-Filter:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To:User-Agent;
	bh=mDVydUmGj6EymxfHi9Cw3ENPwSNdO/hARLLpYkWQtHA=;
	b=2u+/dLdENY5frAt3DSp0YiP2jeZ7cE3qX3/StTtswHsyxzFBK9SMwCxanD+Yd+b5MRSt
	 rwf7T2Icud8k3OhlFJbNgCjU6vbz4FOkYcSbgpjqDEBp/r+FJ57XG5mnzbzhRjyhDj//x
	 21V5YJEHr3Hm5R5NzIKE9mUpDDtqbd0vBLs73oq3zluGCQjxqbSZYsiFV5bzVaXhF7QbI
	 V83KslG2YLEyKAF6+1xG8zvA199DEj3te54LXOk0O4yK7kmDSCqPsj3aYmnORg80lvy77
	 Eo72tP5SioNr7s59a9nGsc8p1+PN+vLN0Tae4jLiFE86gyuBSloQWKIB3pp0wmTInPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lst.de;
	spf=pass smtp.mailfrom=lst.de;
	arc=none smtp.remote-ip=213.95.11.211
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9638D606A338
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 10:52:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9638D606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id 467C968BEB; Fri,  6 Nov 2026 11:52:13 +0100 (CET)
Date: Fri, 6 Nov 2026 11:52:12 +0100
From: Christoph Hellwig <hch@lst.de>
To: Heming Zhao <heming.zhao@suse.com>
Cc: joseph.qi@linux.alibaba.com, mark@fasheh.com, jlbec@evilplan.org,
	hch@lst.de, ocfs2-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v5 3/4] ocfs2: switch dio write path from
 buffer_head to iomap
Message-ID: <20261106105212.GC5746@lst.de>
References: <20261105071930.16399-1-heming.zhao@suse.com> <20261105071930.16399-4-heming.zhao@suse.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261105071930.16399-4-heming.zhao@suse.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Thu, Nov 05, 2026 at 03:19:27PM +0800, Heming Zhao wrote:
> Converts OCFS2's DIO write path from the legacy buffer_head
> infrastructure to the modern iomap framework.
> 
> Key modifications and designs are as follows:

That's a not very useful style of usually AI generated text.

If a change is not key it should not be mentioned here.

As should "modifications" in general - what is changed is pretty
obvious in the diff itself (and if it isn't it should be made more
clear in the code/comments).  So what should go into the commit
log really is the high-level considerations, pitfals and not quite
clear bits.  The rest is just unhelpful noise.


> +static int ocfs2_lock_map_blocks(struct inode *inode,
> +				 struct ocfs2_map_block *map, int flags)
> +{
> +	int ret = 0;
> +	struct ocfs2_inode_info *oi = OCFS2_I(inode);
> +
> +	down_read(&oi->ip_alloc_sem);
> +	ret = ocfs2_map_blocks(inode, map, flags);
> +	up_read(&oi->ip_alloc_sem);
> +
> +	return ret;
> +}

This pattern already showed up in the previous patch, why isn't the
helper added there and used for reads as well?

Also this and the next one have a very similar diffstat.  It would
help reviewers a lot if you merged the two patches and did any pure
code movements in a separate patch, so that the actual changes stick
out instead of just adding a wall of new code here, and removing
lots of old code in the next one.

