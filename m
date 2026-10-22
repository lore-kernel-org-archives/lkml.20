Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.34
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792673038;
	b=Azl3LoYZFLbup7HYN9CGceOXPTKZyKPqNPXMleObaBWCQCEdrBgdMHNmyaf/dwLymH42
	 iikz2NHFo/HdPOjgwT1yuRwOIrldhtrwrhIv9q0CVXUy9uRMNjdOTN5ycZQAE9ffynjVt
	 kNGo1EH7j36dslM0O2UHmOk0xmBmVP435sHPUMXTrdXO/9jDPN1QesqrOCNnleJ1N6EsT
	 kQ7vyom76FF1SgXxBXI9L58if/XPs5J0yA9uEGAOSHiM0TGxB9l9R4mY41TiWNgm5WjJL
	 ClSsKRyi8ECO2jEgsaEMBMEw6eJhkXyaW4JlGJaw2LQQ5q+lcmfGyVGVF3vx3sxS8Gg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792673038;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=UkGp6BXx3IuoHMShnEhbwsGFOzhfzFScR0VSZnp16i4=;
	b=WH1Arx7F+LPKWRCG94IInjehUtdqwRnAHksyK9/QN7hAEzXtMiKkGHOuBo2rMDbuN0ir
	 zSR1b5QOle2kvkiKQNJtLKEHhwIyZZdGPkxlHxMtizweOCFXa8tUppmLJpiGzzutHnC65
	 nh/3WIh7Ao2xeoQNkqsMS6yv0OYTHAuLap6FytYombpUObxvfC7iK+R3ZRw8KYEmqdX1r
	 k2zjl8uxU2qoGWgkgAQufpiV/7YJceL7DKGsgq5ciTqkRYU/HMa4BqDWYbbsUlMrk0FdK
	 z+qRzAl7i+urH+XmEUC0ep5NdJNYBrowfJVW4xH3JmCtBU4/VHzNyfeu0ivK1NFgULQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=uxw2kJqi;
	arc=none smtp.remote-ip=91.218.175.34
Received: from mta0.migadu.com (out-34.mta0.migadu.com [91.218.175.34])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62455606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 12:43:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 62455606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=uxw2kJqi
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=w2pJzoKE8UHSFd+7kOrW3IFF8LKzi7qBZip0c8TTrbg=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792673035; v=1; x=1793277835;
 b=uxw2kJqiiGGHUBaLnBFDFZyIi/7wwupJu8dX2QV9ndJ0t+zO+9wwx9WcXPmZM3OQ2N4r9X6A
 FUzbHWDTLBQsPZosc7IpvZvBTCxkVF4MVaPqtvv2+dBVAMLmmwCzQiO3qPmjHoZU/dqzNtTmi34
 BFHGSMUG8b4EUoTpOfEWaCgQ=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 5534752695d82903;
	Thu, 22 Oct 2026 12:43:55 +0000
X-Mizu-Trace-ID: 5534752695d82903
X-Migadu-Flow: FLOW_OUT
Date: Thu, 22 Oct 2026 14:43:50 +0200
From: "Pankaj Raghav (Samsung)" <pankaj.raghav@linux.dev>
To: Daejun Park <daejun7.park@samsung.com>
Cc: Carlos Maiolino <cem@kernel.org>, linux-xfs@vger.kernel.org, 
	Christoph Hellwig <hch@lst.de>, "Darrick J. Wong" <djwong@kernel.org>, 
	Dave Chinner <dgc@kernel.org>, Chuck Lever <cel@kernel.org>, Jeff Layton <jlayton@kernel.org>, 
	Dai Ngo <Dai.Ngo@oracle.com>, Sergey Bashirov <sergeybashirov@gmail.com>, 
	Andrey Albershteyn <aalbersh@kernel.org>, linux-nfs@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Subject: Re: [PATCH v4 2/9] xfs: add a flag to convert unwritten extents
 without allocating blocks
Message-ID: <atoEubjhGZgA2WQk@quentin>
References: <20261020-xfs-pnfs-batch-v4-0-9230fa2ca4a4@samsung.com>
 <20261020-xfs-pnfs-batch-v4-2-9230fa2ca4a4@samsung.com>
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
In-Reply-To: <20261020-xfs-pnfs-batch-v4-2-9230fa2ca4a4@samsung.com>

On Tue, Oct 20, 2026 at 12:08:45PM +0900, Daejun Park wrote:
> xfs_bmapi_write() with XFS_BMAPI_CONVERT converts unwritten extents to
> written ones, and allocates blocks for any hole or delalloc extent it
> finds in the range. A caller that may only convert blocks that are
> already allocated has to look at the mapping first, and the mapping can
> change once the ILOCK is dropped.
> 
> Add XFS_BMAPI_CONVERT_ONLY. With it, xfs_bmapi_write() stops at a hole
> or a delalloc extent instead of allocating blocks and returns the
> mappings that it converted before it. If the range starts with a hole or
> a delalloc extent, it returns -ENOSR, as it does when a delalloc
> conversion maps nothing in the range. Nothing has been changed then, and
> the caller decides what to do with its transaction.
> 
> A flag of this name was removed by commit 26b91c728b2d ("xfs: make COW
> fork unwritten extent conversions more robust"). That one skipped the
> allocation and still mapped the hole; this one stops before it.
> 
> "xfs: refuse a pNFS LAYOUTCOMMIT of a range without blocks" uses it,
> which is why this is marked for stable.
> 
> Suggested-by: Christoph Hellwig <hch@lst.de>
> Link: https://lore.kernel.org/r/20261013120359.GB2944@lst.de
> Cc: stable@vger.kernel.org
> Signed-off-by: Daejun Park <daejun7.park@samsung.com>
> Reviewed-by: Christoph Hellwig <hch@lst.de>
> ---
>  fs/xfs/libxfs/xfs_bmap.c | 14 ++++++++++++--
>  fs/xfs/libxfs/xfs_bmap.h | 10 +++++++++-
>  2 files changed, 21 insertions(+), 3 deletions(-)
> 
> diff --git a/fs/xfs/libxfs/xfs_bmap.c b/fs/xfs/libxfs/xfs_bmap.c
> index ca49bf4a50..95c0178b44 100644
> --- a/fs/xfs/libxfs/xfs_bmap.c
> +++ b/fs/xfs/libxfs/xfs_bmap.c
> @@ -4130,6 +4130,8 @@ xfs_bmapi_finish(
>   * Returns a negative error code on failure, including -ENOSPC when it could not
>   * allocate any blocks and -ENOSR when it did allocate blocks to convert a
>   * delalloc range, but those blocks were before the passed in range.
> + * With XFS_BMAPI_CONVERT_ONLY, it stops at a hole or a delalloc extent instead
> + * of allocating blocks, and returns -ENOSR if it stops before mapping anything.
>   */
>  int
>  xfs_bmapi_write(
> @@ -4189,6 +4191,8 @@ xfs_bmapi_write(
>  	 */
>  	ASSERT((flags & (XFS_BMAPI_PREALLOC | XFS_BMAPI_ZERO)) !=
>  			(XFS_BMAPI_PREALLOC | XFS_BMAPI_ZERO));
> +	ASSERT(!(flags & XFS_BMAPI_CONVERT_ONLY) ||
> +	       (flags & XFS_BMAPI_CONVERT));
>  
>  	if (XFS_IS_CORRUPT(mp, !xfs_ifork_has_extents(ifp)) ||
>  	    XFS_TEST_ERROR(mp, XFS_ERRTAG_BMAPIFORMAT)) {
> @@ -4237,6 +4241,9 @@ xfs_bmapi_write(
>  		 * that we found, if any.
>  		 */
>  		if (need_alloc || wasdelay) {
> +			if (flags & XFS_BMAPI_CONVERT_ONLY)
> +				break;
> +
>  			bma.eof = eof;
>  			bma.conv = !!(flags & XFS_BMAPI_CONVERT);
>  			bma.wasdel = wasdelay;
> @@ -4332,10 +4339,13 @@ xfs_bmapi_write(
>  	 *
>  	 * To avoid a successful return with *nmap set to 0, return the magic
>  	 * -ENOSR error code for this particular case so that the caller can
> -	 * handle it.
> +	 * handle it. The same goes for XFS_BMAPI_CONVERT_ONLY stopping at a
> +	 * hole or a delalloc extent at the start of the range, in which case
> +	 * nothing has been changed.
>  	 */
>  	if (!n) {
> -		ASSERT(bma.nallocs >= *nmap);
> +		ASSERT(bma.nallocs >= *nmap ||
> +		       (flags & XFS_BMAPI_CONVERT_ONLY));
Minor nit:

The following might be more explicit here:

ASSERT((flags & XFS_BMAPI_CONVERT_ONLY) ? bma.nallocs == 0 :
                                         bma.nallocs >= *nmap);

Otherwise, the patch looks good.
Reviewed-by: Pankaj Raghav <p.raghav@samsung.com>

-- 
Pankaj
