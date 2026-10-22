Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792673071;
	b=dKEw4WhibxBVTm/O+loM8HKZ27BWFsIVbBBLlD77xhYNMoEzec+RHDnB4W07Halw22v3
	 tHC9f5oa8bErxi8PzjuOsOZZ073l8+bOFJYskN3+ISu2IJUI0QcICFetUzNMZ9sUnGyhq
	 3SRqpIF0f10UB12DvIDOzyucNlNR7WbFoWpXJOk0824v/zGGCLKKTa9KVxwkcw8NOsnHr
	 n5xhyI44P4uItF01do+Is1MQN6K8MgUNDwCl15zMIuyf+dhqeVcvMbQffj/OSxT61hLwm
	 ZdcWqiAaO5jBtsWIwpaeN/Q7eg0bI+f7KBxpsjmr/ID2pNB6t2hCllLli0Lw9oy+xdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792673071;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=pyVn8H5UXt3BLVqfMlIJEvVqPcujqAmn/WVCRP5QjZI=;
	b=kzyDe+kRsfk1CN987/QuP3ToCJkXGijyUUl/S9WC4doGKihASluy87fjXTVxXwxrtNXy
	 qXRwrYkI9UYKk/CX6m7LKhXPks01yWq09hkuNUpAtMlvzWn3kY0Uvkzky9y9cskU6AnCd
	 t7t9xyZydGLJJjnRO1lz8pLJ/swz1zzsi/KnXW+iUP9j+ZhUvGExyMeRFJrUQ1d5+LojA
	 /OzeLxlSh8raJsOdbBxKab+BJztWKV7Y8MN9+4hrjTkGsWLxfi1Sr8gP1CtiZcZ5RQ/qL
	 r32d62Tw2iccXmqQiU4aE0+76pC5O6Ijq27I0YvmijxgoO5yF4/uULtf1BwOTJ3mDug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=VRZvxV1V;
	arc=none smtp.remote-ip=91.218.175.44
Received: from mta0.migadu.com (out-44.mta0.migadu.com [91.218.175.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5563F606A31B
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 12:44:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5563F606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=VRZvxV1V
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=vD/enoTp0wWpkf87JUVBmcvUu/gi1TwgrWzJFcE4+LY=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792673068; v=1; x=1793277868;
 b=VRZvxV1Vptk9DOhqUW/WfhVcwF9APQFsRQAfqq4+lZSoQbnvvVGBVIvSgVy7Z1H2Hw0CpNGD
 8sVwGGJc5UL+QSNJk+bG1DGWmyuCARFySoviegFqwo7CySe9ixYWi5L4U3TNVLuNmr4FJ80Tx9f
 6k0AN06u/QAiXth7SVRg2El4=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 74c2161678412173;
	Thu, 22 Oct 2026 12:44:28 +0000
X-Mizu-Trace-ID: 74c2161678412173
X-Migadu-Flow: FLOW_OUT
Date: Thu, 22 Oct 2026 14:44:23 +0200
From: "Pankaj Raghav (Samsung)" <pankaj.raghav@linux.dev>
To: Daejun Park <daejun7.park@samsung.com>
Cc: Carlos Maiolino <cem@kernel.org>, linux-xfs@vger.kernel.org, 
	Christoph Hellwig <hch@lst.de>, "Darrick J. Wong" <djwong@kernel.org>, 
	Dave Chinner <dgc@kernel.org>, Chuck Lever <cel@kernel.org>, Jeff Layton <jlayton@kernel.org>, 
	Dai Ngo <Dai.Ngo@oracle.com>, Sergey Bashirov <sergeybashirov@gmail.com>, 
	Andrey Albershteyn <aalbersh@kernel.org>, linux-nfs@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Subject: Re: [PATCH v4 4/9] xfs: clamp a pNFS LAYOUTCOMMIT extent before
 computing its end
Message-ID: <atoFF7QhbenJOFUl@quentin>
References: <20261020-xfs-pnfs-batch-v4-0-9230fa2ca4a4@samsung.com>
 <20261020-xfs-pnfs-batch-v4-4-9230fa2ca4a4@samsung.com>
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
In-Reply-To: <20261020-xfs-pnfs-batch-v4-4-9230fa2ca4a4@samsung.com>

On Tue, Oct 20, 2026 at 12:08:47PM +0900, Daejun Park wrote:
> xfs_fs_commit_blocks() clamps the end of each committed extent to the
> file size, but computes the end as offset + length first. A length
> from the client can make that sum wrap around, and the loop then
> passes the client's length, unclamped, to xfs_iomap_write_unwritten().
> The range wraps there as well, and xfs_bmapi_write() maps nothing.
> Before the previous two patches, that failed an assertion on XFS_DEBUG
> kernels, which is a BUG with XFS_ASSERT_FATAL, and otherwise returned
> -ENOSR, which nfsd warns about as a non-standard errno. With
> XFS_BMAPI_CONVERT_ONLY, the LAYOUTCOMMIT fails with -EIO and converts
> nothing, even when every block up to the size is allocated.
> 
> With pynfs as the client and an RW layout for the first 64 KiB of a
> 2 MiB sparse file, a LAYOUTCOMMIT of 2^64 - 4 KiB at 4 KiB got
> NFS4ERR_IO, "nfsd: non-standard errno: -63" and a WARNING, or the
> assertion on XFS_DEBUG. With the previous two patches, it gets
> NFS4ERR_IO and the laid-out range stays unwritten.
> 
> Clamp the length to what is left below the size before adding it to
> the offset. The extent then ends at the size, its allocated part is
> converted, and the LAYOUTCOMMIT gets NFS4ERR_IO at the hole after it.
> 
> Fixes: 527851124d10 ("xfs: implement pNFS export operations")
> Cc: stable@vger.kernel.org
> Signed-off-by: Daejun Park <daejun7.park@samsung.com>
> Reviewed-by: Christoph Hellwig <hch@lst.de>
> ---
>  fs/xfs/xfs_pnfs.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
Looks good.
Reviewed-by: Pankaj Raghav <p.raghav@samsung.com>

-- 
Pankaj
