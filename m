Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793237591;
	b=hjfNT9tJd6qAW1fd52TGnef4s9XBMDJu75EfitFshaCkUy4L2taIR977O6cL1zfwEsHg
	 JhjBcE45a1usqNXDGsqkgZ9zp5SxxT0PpFXCq1tGSmyGtD7X4sF+IzpZUjhgtJEZJbjOy
	 W1spucPe2BHfgeMDashJ6Ozz0G9Qw8HqXbTm1cxFeYKkSdOMg66M4UZmjMbORy3TFh470
	 tEYO+JFDVq7sSrqZ46F8SGJR62sVvd7f+Gx6jC9jz6ZvhuLdNZSrznhD3irxScqSp+g23
	 We44QyOGEkravcc5AzRDjPiHb/kQ6Q1NCy2ToIL3eU4BCAS0uDRdyF1fX7KMjo4TwKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793237591;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:Cc:
	 Subject:To:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=Az7JCfLfZ+BUrkAqrJOQQPIHKHXzY3tnCWu32RhZFdA=;
	b=si0V8/Vpehoo2XVX5lAeUZRVudEzRx9XxU316nn/wOAcSuuUcXv6cqYDgzTacmGiaHPG
	 PoxAfHFiQkVqa0i48BTbNbmdpb2PXMmGnKylBGp8pACPA9id4EqPv0GHekMRh3pkqLmBk
	 67TF47rBQm+PGmP5+SVXMk9VMnQbRRooVCh0Mmdpp8lDVcS/fN6ETYu34MjL6jAoX+vOq
	 XrpHGJgwgAiYbVkt+wl7HTljMx6ljpIfRegWPSiJz90KZY+Dk9dKxbFVSqMVpB+pzvo6F
	 diDvFl1UzpcJibZ1Blfi4k6ErFQAZRiuspf9O5r+piYfuZqI/mSdAJi2Shehjixbatg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mCamjkp2;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D904E606A31D
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 01:33:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mCamjkp2
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 198521F01825;
	Thu, 29 Oct 2026 01:33:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793237590;
	bh=Az7JCfLfZ+BUrkAqrJOQQPIHKHXzY3tnCWu32RhZFdA=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To;
	b=mCamjkp2l7wg6XK7uFZGSQ6QwS8VrYErQ7adiYQPz7LrssZRHNT0GfKwULiWA+/R6
	 uBWkPHQD7LmKwrv9tZVVpUFEyjyxYDMjASGIc/2av8U0iG4Sa9rM2mmo/swBTI6Yvj
	 rpI+X6gne+zg7/Up5R5vJNMLaMLaS+xvOmvuY/0y/yGUIkhMGGYTPFJvyAZMAq6gax
	 r7GgJaOkp0CLxkqQhiwRfNw8tKL4+m3t1f7/NbUEgugHnI6GVPqqvUIXSSA64pAm6b
	 QORCQ+EkdeN0OqjFQf9tNxbPJAhwwZtH7sFzM+noRdB+67NdKjQlNF46tpKtb6U9oI
	 z/3OvolordVSg==
Message-ID: <156f75fb-fdff-4863-9ab8-5c0c5b1d72c9@kernel.org>
Date: Thu, 29 Oct 2026 09:33:06 +0800
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
Cc: chao@kernel.org, Barry Song <baohua@kernel.org>,
 Juan Yescas <jyescas@google.com>, Daeho Jeong <daehojeong@google.com>,
 Pengfei Li <lipengfei28@xiaomi.com>, Dev Jain <Dev.Jain@arm.com>,
 David Hildenbrand <David.Hildenbrand@arm.com>, linux-kernel@vger.kernel.org,
 Bo Zhang <zhangbo56@xiaomi.com>, Kalesh Singh <kaleshsingh@google.com>,
 Nanzhe Zhao <nzzhao@126.com>, Nanzhe Zhao <zhaonanzhe@xiaomi.com>,
 Ryan Roberts <Ryan.Roberts@arm.com>
Subject: Re: [PATCH v8 09/15] f2fs: optimize small block size large folio read
To: Nanzhe Zhao <nzzhao.sigma@gmail.com>,
 linux-f2fs-devel@lists.sourceforge.net, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20261028154407.1601430-1-nzzhao.sigma@gmail.com>
 <20261028154407.1601430-10-nzzhao.sigma@gmail.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20261028154407.1601430-10-nzzhao.sigma@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/28/26 23:44, Nanzhe Zhao wrote:
> From: Nanzhe Zhao <zhaonanzhe@xiaomi.com>
> 
> The original f2fs_read_data_large_folio() implementation has limited
> benefit with a 4KB block size, mainly because updating
> read_pages_pending greatly increases the number of spinlock
> operations.
> 
> Use len_blks to batch read_pages_pending and iostat updates for
> contiguous mapped blocks.
> 
> Signed-off-by: Nanzhe Zhao <zhaonanzhe@xiaomi.com>
Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,
