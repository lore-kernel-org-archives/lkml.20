Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.244
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792674165;
	b=tZ89vZvHtuT01Z8YNEsBXY4iao1Rjq0hY/im++7oaMmOdhM6LtSaCx6EBkVySogUsoLC
	 QxPSHt0Hd3jMk5g97aISC8qqKJxuElV7YeJDy7iJFXJgcbIr7Se722Zp7tBP4u0BVPnmz
	 W8i3dpuSXn7tg0FSd1IIgcX42rXv/+7Z/eYy47QRw6d1+qU1ypo93n+cXJl7Tl3peIaMZ
	 YV+cZNF4A2GW+pQ3WYcN82qKUzZPyrbPTYGJJt2z8Szt8gFVi7N5f0uI6oxYkkD3IKbF0
	 H32mi895nQ/TphAh2JJF2Id8H0FxCqtDqIc3OFE7/OIuJkAeUyr3xRMbzU8OvwUvnOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792674165;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=QaSV8A+DkRJxdjBJ52VGx2q6CxzJmPLWhUU+QwPg4ks=;
	b=qTxSvpkyKj/U3pXpn8uW9xrRYKoWv2nm0DN4X1D6w1Jgx5FWzMOOpzPGZZ62ieK/3hpA
	 dCZSY8Ilg+0uxIUOQmbs7WD66ys3yxhoZrVRHIlpXJqsf86Sb/8B9paNjKZ1xZUkDvs7Q
	 OJVUNYirYUPCY9GQY2vH4fuyqf9jj+jm2GZCF8X7IugLEz72gBIVwFDqMvostNBcv3LwN
	 mVUB32i69hglahFrpcRrwbuje/lgT71iD+2cHKAW2wIf48hoYOrZCUK7VLgT2BvgmcMRs
	 5kv+SWxLW6eP87SfG/6ZesW2FK3xgq3cL9xnzePalkjF+tifDyPixVTlNMi93EfumdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	arc=none smtp.remote-ip=95.215.58.244
Received: from mta1.migadu.com (out-244.mta1.migadu.com [95.215.58.244])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07092606A31B
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 13:02:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 07092606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=Blk5PcHa+mtRw2PyDvEKfMHAEAMT011jjsUT7gNzPRI=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792674156; v=1; x=1793278956;
 b=NYiOL2aHwYbhphng9Va624cVzGa0vU0DNgH3SgHqUB+tthpnyr2mLU6qsIBU3yl5atyh+dg7
 TlicbWLP+HDJ9ZOCn1VMmGnk+981CDRjr6QpseqGt3xNC9BOAKxB8FeUP+zQg0fWq0q3crur27N
 0+VjArtJDc1l43XJDYR7qpos=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 9a0127de9735825e;
	Thu, 22 Oct 2026 13:02:36 +0000
X-Mizu-Trace-ID: 9a0127de9735825e
X-Migadu-Flow: FLOW_OUT
Date: Thu, 22 Oct 2026 15:02:30 +0200
From: "Pankaj Raghav (Samsung)" <pankaj.raghav@linux.dev>
To: Daejun Park <daejun7.park@samsung.com>
Cc: Carlos Maiolino <cem@kernel.org>, linux-xfs@vger.kernel.org, 
	Christoph Hellwig <hch@lst.de>, "Darrick J. Wong" <djwong@kernel.org>, 
	Dave Chinner <dgc@kernel.org>, Chuck Lever <cel@kernel.org>, Jeff Layton <jlayton@kernel.org>, 
	Dai Ngo <Dai.Ngo@oracle.com>, Sergey Bashirov <sergeybashirov@gmail.com>, 
	Andrey Albershteyn <aalbersh@kernel.org>, linux-nfs@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Subject: Re: [PATCH v4 5/9] xfs: limit the count of a pNFS write allocation
 to one extent
Message-ID: <atoImJxtg70XcIjS@quentin>
References: <20261020-xfs-pnfs-batch-v4-0-9230fa2ca4a4@samsung.com>
 <20261020-xfs-pnfs-batch-v4-5-9230fa2ca4a4@samsung.com>
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
In-Reply-To: <20261020-xfs-pnfs-batch-v4-5-9230fa2ca4a4@samsung.com>

> With pynfs as the client and a 32 GiB XFS, an RW LAYOUTGET at offset 0
> of an empty file for 16 TiB shut the filesystem down: "Corruption of
> in-memory data (0x8) detected at xfs_trans_mod_sb". With this patch it
> gets NFS4ERR_NOSPC, also with XFS_DEBUG, XFS keeps running, and less
> than 8 GiB of the filesystem, one extent's worth, is left free. One
> for 100 GiB ends the same way, where it got NFS4ERR_NOSPC with nothing
> allocated before. One for 16 GiB, which fits, is granted the same
> three extents as before.
> 
> Suggested-by: Darrick J. Wong <djwong@kernel.org>
> Link: https://lore.kernel.org/r/20261008154017.GO2705364@frogsfrogsfrogs
> Suggested-by: Christoph Hellwig <hch@lst.de>
> Link: https://lore.kernel.org/r/20261015060932.GD14035@lst.de
> Fixes: 527851124d10 ("xfs: implement pNFS export operations")
> Cc: stable@vger.kernel.org
> Signed-off-by: Daejun Park <daejun7.park@samsung.com>
> ---
>  fs/xfs/xfs_pnfs.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/fs/xfs/xfs_pnfs.c b/fs/xfs/xfs_pnfs.c
> index 19eb18e129..401a790299 100644
> --- a/fs/xfs/xfs_pnfs.c
> +++ b/fs/xfs/xfs_pnfs.c
> @@ -224,6 +224,14 @@ xfs_fs_map_blocks(
>  		else if (nimaps && imap.br_startblock == HOLESTARTBLOCK)
>  			end_fsb = min(end_fsb, imap.br_startoff +
>  					       imap.br_blockcount);
> +		/*
> +		 * xfs_bmapi_write() maps at most XFS_MAX_BMBT_EXTLEN blocks
> +		 * in one mapping, so don't reserve blocks for more. The
> +		 * range comes from a client, and its block count may not
> +		 * even fit the 32-bit reservation. The rest of the range
> +		 * is mapped by a later call.
> +		 */
> +		end_fsb = min(end_fsb, offset_fsb + XFS_MAX_BMBT_EXTLEN);

Isn't it better we add this in xfs_direct_write_iomap_begin() instead of
adding it in pnfs?

Something like this:

diff --git a/fs/xfs/xfs_iomap.c b/fs/xfs/xfs_iomap.c
index 329c745e3120..50cf7b0cfc76 100644
--- a/fs/xfs/xfs_iomap.c
+++ b/fs/xfs/xfs_iomap.c
@@ -284,6 +284,7 @@ xfs_iomap_write_direct(
        int                     nr_exts = XFS_IEXT_ADD_NOSPLIT_CNT;
 
        ASSERT(count_fsb > 0);
+       count_fsb = min_t(xfs_filblks_t, count_fsb, XFS_MAX_BMBT_EXTLEN);
 
        resaligned = xfs_aligned_fsb_count(offset_fsb, count_fsb,
                                           xfs_get_extsz_hint(ip));

-- 
Pankaj
