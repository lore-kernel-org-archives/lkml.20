Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794914546;
	b=F7Jr/tSBngzpF+UbEqLw+U09n/MTyw5KT+N8lHC1ky9tcMhJ9K1zZll1PEAX8bzpSwh7
	 UydOsBWUWj0geqfwNpmjcshI+jRIRZ1W7nxMh7rvdMfICYt9ySSY4yH2c85bFLhO92qdS
	 RmZW77C+q9ur8jYJ3i2eGczWPTbIbd6wUeSgZGUuF/NgqVaGi/61YOah0P5UHh9Vd7BtC
	 ZD06D6uC2A0YpbseNaGs7gBHd0+Q8pwkBhtbIk/9zvteCN2IO3S1saJ4Sa/eMOV16EDFU
	 p1ZwvZzrZRrHFADZKJ54Oci1TCQd6T5DYelF87HvE/gadZ9IYchoUv6h9KkN5XYaNDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794914546;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:Cc:
	 Subject:To:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=DBWDdYeJ5KNHUCcYayk7e9to+UqL74ZokWwi2GyVhLE=;
	b=aLq4r9kHG02OznirNvTmCRvaa2SgdMclWDv+CPcw85luM6gepyKukEeJD4hdDgaBqwnY
	 FjJ+OP6eDl80XYJjlVjt3TpDTBuU7t3R6Jvs26u9QBiie07OXEK90KTPsEkLuhI28eiyt
	 g7r4sVfhmqey0CV4phRrgYI9kOd4qe0A3bR48fxgoGx+F1QLTQn+yBmnKHKsI9CR7xZGF
	 /SZsdu3NJuzo+NfUrWgeMvfBO17i7NLAc+Qm7t4V0D7VGGdxPElwK5L1Hc3y9REUVS7sZ
	 u0aacIohZmaxDUZVfTeEDbFFTZ5RIvJN9B2vdvozYHCPMcM+PI6SFu1qDh/wENboTfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BXR+xf2Q;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE2C1606A331
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 11:22:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BXR+xf2Q
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C8421F000C7;
	Tue, 17 Nov 2026 11:22:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794914546;
	bh=DBWDdYeJ5KNHUCcYayk7e9to+UqL74ZokWwi2GyVhLE=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To;
	b=BXR+xf2QWqrPdbYaM7Lh9ObomQVhPJFQxAy5QlAu2VwSzq23RuHbw2ttLRc7fXN8E
	 iEOrgh8j4cpMMS0NJ8n0ZHJmYIG9ObruvGuqD9J1tAQEw3LakbQ29s3dbbLytExbgO
	 Qpq+XMOyVkK2WUoiKpR/qjx757/uAZd6jIOB2UfJDhQJBDVu1S5RnhLSI2nWRze2iB
	 k5rtEx/hQWljZ3zRG8oHMKXtb+EZQggDvtHX/16X3MKXNnwUqxk3suPgjChyo9kw9R
	 rAaru+c7Yo9At8JIVjdO3wxK42ScRy0wAw0/6oE+W8c1f9H+5gIRk+yo5TZBb5T974
	 ogfKmuOnvwUBw==
Message-ID: <fa41d65f-358a-4b8b-bfd5-1e73ed04e723@kernel.org>
Date: Tue, 17 Nov 2026 19:22:23 +0800
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
Cc: chao@kernel.org, Daeho Jeong <daehojeong@google.com>
Subject: Re: [f2fs-dev] [PATCH v2 11/20] f2fs: support subpage blocks in move
 range
To: Daeho Jeong <daeho43@gmail.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, kernel-team@android.com
References: <20261116040851.2849696-1-daeho43@gmail.com>
 <20261116040851.2849696-12-daeho43@gmail.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20261116040851.2849696-12-daeho43@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/16/26 12:08, Daeho Jeong wrote:
> From: Daeho Jeong <daehojeong@google.com>
> 
> Folios at both ends of the moved ranges can straddle the range
> boundaries. Write back and truncate the page cache from PAGE_SIZE
> boundaries, and hold invalidate_lock of both inodes during the exchange
> so that faults and readahead cannot bring back stale data. After the
> exchange, also after one that failed part way, drop the source blocks
> that it read into the page cache, and call pagecache_isize_extended()
> for the gap between the old EOF of dst and the moved data. The page
> cache was not truncated before, so this also applies when the block
> size equals PAGE_SIZE. Remove the -EOPNOTSUPP check.
> 
> Zero the cached data past the old EOF of dst with
> f2fs_zero_post_eof_page() before the move extends dst over it, as the
> other paths that extend a file do. Otherwise data stored past EOF
> through a mapping becomes file data. This also applies when the block
> size equals PAGE_SIZE.
> 
> Signed-off-by: Daeho Jeong <daehojeong@google.com>
Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,
