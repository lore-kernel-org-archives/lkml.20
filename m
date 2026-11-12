Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794519503;
	b=wZFH9rML+eaHVYqjnCQGju3rWzSZPR732IVRwHgrzQ80UasaaQewxyYKtTJC32967k+i
	 YxelcDYSSo0XBewPhyRBajr0Vfb3SgVXzTs7TQ+RdOPX5u2kGg+qXI+TMC6lo5uLcyPUN
	 6uvpskGsYgQd/4TOFU/vWjpzjglvVHBG/RoSa13TMYWAQU5eLehUMT7PFNMzvc2yly5yc
	 pCJaJpuhv44/bxjIAciDeaEOodScFVViR5Hl3bVDUXs3kQ99YHruyx513wwFfV49uT5IR
	 oj35tGopBLibp/QxjYipO7ktWu9LbBbhVATjBIdJYOSt3IzBiTYZJ64ZkX9d3pcpkDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794519503;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=X28tU+VHlLKxUHzEoE+kmXFHhe6QzoTUG/4AO0xtTjQ=;
	b=EvAmNmrGNSS9yAhdkDNQqkKf5WLNk8iT86h1WBWpSwPXHeq4gt0ZG+3vqmy9D5Gg87BL
	 xszdqbmZRIFJUefgcXE7hN6l+Uqq1l+HD3uM4LxSXnqX2+p6EsKC9AGjKmS2QUGJx4Dw5
	 6b1CZfcycmeM7SqVGbSaKszGcNxOvQOdiks+A1LJjMWz2JGhISudurTXblNrXovHCABjk
	 UwTj9ttUCw+sI7SN73R/720sfmwghLmd8WGpL4SZEYgzMmYzB55OZW4hyhVIcwcF/87Ci
	 TBW8WmCBl+SoVDuKZbqyXe17EhFk+VhtJ4uirJ9o0JqTSK/psgeYsaAr7+zfuWFQJYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=FKO85Hco;
	arc=none smtp.remote-ip=91.218.175.43
Received: from mta0.migadu.com (out-43.mta0.migadu.com [91.218.175.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6943606A333
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 21:38:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E6943606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=FKO85Hco
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=wMqUnga3gDuBai4kY377b3ZGs9DrRI4VV/poGtMkEm4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794519500; v=1; x=1795124300;
 b=FKO85Hco90mmUSOELoiXdXNNpY+TfjcqWkGb18zfD3g73pbBt4en/0B+vrkuOB/JprTc03Ta
 NIfpqH4/kkD9qqB4jZ80YjQKatHUe0ZDrU9klvDF7aoHGma5ZWHMYbufA/zZ9y9rKMs47LJ+5yw
 6CrtvfQutcZJV7ogzOrCTDEc=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 23f16d96141c72cc;
	Thu, 12 Nov 2026 21:38:20 +0000
X-Mizu-Trace-ID: 23f16d96141c72cc
X-Migadu-Flow: FLOW_OUT
Date: Thu, 12 Nov 2026 22:38:08 +0100
From: "Pankaj Raghav (Samsung)" <pankaj.raghav@linux.dev>
To: Daejun Park <daejun7.park@samsung.com>
Cc: Carlos Maiolino <cem@kernel.org>, linux-xfs@vger.kernel.org, 
	Pankaj Raghav <p.raghav@samsung.com>, John Garry <john.garry@linux.dev>, 
	"Darrick J. Wong" <djwong@kernel.org>, Christoph Hellwig <hch@lst.de>, 
	Dave Chinner <david@fromorbit.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] xfs: check the disk address for hardware atomic writes
Message-ID: <avYxZRJtyfSR_eJn@quentin>
References: <20261112-xfs-hw-atomic-align-v2-1-c90394805e7b@samsung.com>
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
In-Reply-To: <20261112-xfs-hw-atomic-align-v2-1-c90394805e7b@samsung.com>

On Thu, Nov 12, 2026 at 09:41:56AM +0900, Daejun Park wrote:
> xfs_bmap_hw_atomic_write_possible() checks the alignment of the encoded
> br_startblock, not of the disk address. This was harmless while atomic
> writes were capped at the greatest power-of-two factor of the group
> size.
> 
> Commit ec8f62cc109a ("xfs: don't limit software atomic writes by the
> group alignment") lifted that cap. The block layer can now fail a
> misaligned write with -EINVAL, and XFS does not fall back to COW.
> Unaligned AGs, such as those made by mkfs.xfs before 6.16, and rtgroups
> made by any version can hit this.
> 
> Check the disk address instead.
> 
> Fixes: ec8f62cc109a ("xfs: don't limit software atomic writes by the group alignment")
> Signed-off-by: Daejun Park <daejun7.park@samsung.com>

Looks good,
Reviewed-by: Pankaj Raghav (Samsung) <pankaj.raghav@linux.dev>

-- 
Pankaj
