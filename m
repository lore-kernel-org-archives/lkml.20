Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 137E840BCDF
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 07:09:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792134561; cv=none; b=Vdjf/lFFKV66M3IC9o+eFtS09ROdhNrwOKFH8BQyuiGfKo3EOWootxoySRtKKIspBcNjnsg1EZJvfhPECBaGn+W6Z7EkBd6nVzKhXdH/d/X4tAHkuQgCrz+O9mltuxNrpmC7yz//BsbFFDlZ2tAHPVA5ZIyKdRjnOeGqg/kyMwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792134561; c=relaxed/simple;
	bh=7u5uXFr/kllFPjm0yKvFh4Nh9jNlNzOhyrdlf9hUvZA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ItdCmTOn3DnFroze14rQ/OIPAp6w73JLoz5OrWdL3DpiqYcWumGL26xE8Ec5JfAlCP3dyz7x0AJ44DuLuzTNWvho+SJffn9n7xOG4Y7/QhO2P7p9g7aB4haDIwBa0lyWvdq0FO34lAhT/9vJUNC0zoEDzzNc9kzdzLUHAxqpNVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i+GL2vJp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i+GL2vJp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7AD21F000C4;
	Fri, 16 Oct 2026 07:09:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792134559;
	bh=e1AqkV8YwWc9VSlf9Xpn+R39QPSGxhBbbDZwM6dVNZ8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=i+GL2vJpDOhdsnwP6Sg12Tcwxe5flkkHR+oQC4ah61eOp1XjpcmsIQxpxNChzuDVh
	 g6jELw18psnkiCU5K5Zohg0j+PJHORQmuFq4A5u3dWp7+MHPHAaphks7xlE6O6yyIT
	 842ObtM0ZYV+LtCoWbBr0w2F9I1WjwvSbMirb6jb0IHo4IDrvUiP3XeU42dpAWKtqL
	 9cSvANMVrHXyGWKkJr/K0fiNGJJB2rNy0sj3bjanhT5r/de47t7y9tFwwtucadJNDt
	 trIA9zjhimBxEqZJrqEkW7amizyEebBwM78s73yleLtXvbh8MHce2mY20rCqVsaPCQ
	 PKsHUptJKmB7Q==
Date: Fri, 16 Oct 2026 09:09:14 +0200
From: Gao Xiang <xiang@kernel.org>
To: Liu Chao <liuc63@xiaopeng.com>
Cc: Chao Yu <chao@kernel.org>, Chunhai Guo <guochunhai@vivo.com>,
	Gao Xiang <xiang@kernel.org>, Hongbo Li <lihongbo22@huawei.com>,
	Jeffle Xu <jefflexu@linux.alibaba.com>,
	Sandeep Dhavale <dhavale@google.com>, Yue Hu <zbestahu@gmail.com>,
	linux-erofs@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] erofs: fix unsigned underflow in LZ4 in-place
 decompression
Message-ID: <atHNmmoGa3d3iAea@MacBookPro>
Mail-Followup-To: Liu Chao <liuc63@xiaopeng.com>, Chao Yu <chao@kernel.org>,
	Chunhai Guo <guochunhai@vivo.com>, Gao Xiang <xiang@kernel.org>,
	Hongbo Li <lihongbo22@huawei.com>,
	Jeffle Xu <jefflexu@linux.alibaba.com>,
	Sandeep Dhavale <dhavale@google.com>, Yue Hu <zbestahu@gmail.com>,
	linux-erofs@lists.ozlabs.org, linux-kernel@vger.kernel.org
References: <20261016041143.2293155-1-liuc63@xiaopeng.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261016041143.2293155-1-liuc63@xiaopeng.com>


Hi,

On Fri, Oct 16, 2026 at 12:11:43PM +0800, Liu Chao wrote:
> z_erofs_lz4_handle_overlap() computes the overlap offset between the
> input and output page arrays as rq->outpages - rq->inpages.  Both
> values are derived from on-disk pcluster metadata (pcl->length and
> pcl->pclustersize) which an attacker can set independently, so
> outpages may legitimately be smaller than inpages.  The unsigned
> subtraction then underflows, causing rq->out[] to be indexed far out
> of bounds and the returned LZ4 source pointer to point past the
> output buffer, resulting in out-of-bounds reads and writes.
> 
> The in-place path is only valid when the output buffer is at least as
> large as the input buffer, so guard the branch with
> rq->outpages >= rq->inpages.  When the condition does not hold, fall
> through to docopy, which copies the compressed data to the per-CPU
> buffer and decompresses safely.
> 
> Reviewed-by: Fang Xieyan <fangxy@xiaopeng.com>
> Signed-off-by: Liu Chao <liuc63@xiaopeng.com>
> ---
>  fs/erofs/decompressor.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/fs/erofs/decompressor.c b/fs/erofs/decompressor.c
> index 354762c97..50a5f9ddf 100644
> --- a/fs/erofs/decompressor.c
> +++ b/fs/erofs/decompressor.c
> @@ -117,6 +117,7 @@ static void *z_erofs_lz4_handle_overlap(struct z_erofs_decompress_req *rq,
>  		oend = rq->pageofs_out + rq->outputsize;
>  		omargin = PAGE_ALIGN(oend) - oend;
>  		if (rq->partial_decoding || !may_inplace ||
> +		    rq->outpages < rq->inpages ||

This is not against to the latest upstream, and
do you notice the following commits?

 commit 21e161de2dc660b1bb70ef5b156ab8e6e1cca3ab

 commit a5242d37c83abe86df95c6941e2ace9f9055ffcb

also do you have a reproducer?

Thanks,
Gao Xiang
