Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62A154EF13C
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 17:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790789257; cv=none; b=Xy2LEeLzqH1Sjf/L0ErO7XEC8JlkPBQWu153uTOceZovP9rRF2XSkR/NoiuloxFputw5irHHa/0sWkECzf4CcFA81BuM9UwrVtmbrR2/YNGvXe+s1YmDgAXenbrOLBQAoSV7vIlZP0DaAXvyqP7g/3y+Qsb+ZQfJ7ZozqYLpzDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790789257; c=relaxed/simple;
	bh=riv0dAnP+WmNZhDp2p0iOVTpSjlSuDe72Jq/YsP2SAw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dlpozucEEYBKQpGZU8I2i5g1hsOXjHnJoK9oYsIX+A39DYNlAtkSC+AL1o8RZMr/EwBmfmzeLtNZkrW07/e3AF7oMaOMFtXeC8BXapPg8mqKX4pQVhSCZHsXHeUT2Xy9kycEUMOKklzYKInoiwWUlz8eqypfWKDGx2QX996uICM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Kitgw0dm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Kitgw0dm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1058A1F000FF;
	Wed, 30 Sep 2026 17:27:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790789256;
	bh=GyghZvqdAdJddV47CNsr4GWT+47Z5Sjzvmlp4S+84dU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Kitgw0dmwDA7N2xe7x+U50g9U6PRpKbzSNL+e14juoONe2XLVbng37H1uto7f3/5a
	 CU9eICQrhQHumGRk1wlISEcw8JXvEKg4OzrmIViQsjhmBv4ofIKqRkl24GqXs8a3Zq
	 PMnbNi0fZ/7xcptp3ofuwoy/nJwhVMDqIBNzq4SevpdWZKMtzU71qyr2XXAK5BLa9b
	 p/iKsc13VKdzW6Os00pVXiw0Tw9hxrOyX1UChJ8kYhlD/HFkY0Pw39VOqHbr4118tD
	 jLJQ4jkQ4PByKmin0459J6PuaYSrjDa6l4rnVbIJUyBbshsFe5TMP80j52l2wRAlow
	 bbxmX3TsitRhA==
Date: Wed, 30 Sep 2026 19:27:28 +0200
From: Gao Xiang <xiang@kernel.org>
To: Binglei Wang <l3b2w1@gmail.com>
Cc: xiang@kernel.org, chao@kernel.org, linux-kernel@vger.kernel.org,
	zbestahu@gmail.com, jefflexu@linux.alibaba.com, dhavale@google.com,
	hongbohbli@tencent.com, guochunhai@vivo.com, liubo03@inspur.com,
	linux-erofs@lists.ozlabs.org
Subject: Re: [PATCH] erofs: fix folio reuse from a different address_space in
 erofs_bread()
Message-ID: <ar1GgGSIZ1h0bBip@MacBookPro>
Mail-Followup-To: Binglei Wang <l3b2w1@gmail.com>, xiang@kernel.org,
	chao@kernel.org, linux-kernel@vger.kernel.org, zbestahu@gmail.com,
	jefflexu@linux.alibaba.com, dhavale@google.com,
	hongbohbli@tencent.com, guochunhai@vivo.com, liubo03@inspur.com,
	linux-erofs@lists.ozlabs.org
References: <20260930112127.27059-1-l3b2w1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260930112127.27059-1-l3b2w1@gmail.com>

On Wed, Sep 30, 2026 at 07:21:27PM +0800, Binglei Wang wrote:
> From: Binglei Wang <l3b2w1@gmail.com>
> 
> erofs_bread() reuses a cached folio on page index match without checking folio->mapping.

Each line in the commit message should not exceed 72 chars.

> 
> xattr.c calls erofs_init_metabuf() twice on the same buffer without erofs_put_metabuf();
> the two in_metabox sources differ, so buf->mapping can switch
> while buf->page still belongs to the old address_space.
> The next erofs_bread() then reads the wrong mapping, dropping shared xattrs with METABOX.
> 
> We require folio->mapping == buf->mapping in the reuse check;
> otherwise drop the cached folio and re-read via the slow path.
> 
> Fixes: 414091322c63 ("erofs: implement metadata compression")
> Cc: Bo Liu (OpenAnolis) <liubo03@inspur.com>
> Signed-off-by: Binglei Wang <l3b2w1@gmail.com>
> ---
>  fs/erofs/data.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/erofs/data.c b/fs/erofs/data.c
> index be63b89f0862..d8b6523bc218 100644
> --- a/fs/erofs/data.c
> +++ b/fs/erofs/data.c
> @@ -33,8 +33,13 @@ void *erofs_bread(struct erofs_buf *buf, erofs_off_t offset, bool need_kmap)
>  	if (buf->page) {
>  		folio = page_folio(buf->page);
> -		if (folio_file_page(folio, index) != buf->page)
> +		if (folio->mapping != buf->mapping) {
> +			/* the cached folio belongs to another address_space */
> +			erofs_put_metabuf(buf);
> +			folio = NULL;

As I said, you could just drop `erofs_put_metabuf(buf);` here,
and folio = NULL will do the correct thing instead.

Thanks,
Gao Xiang

> +		} else if (folio_file_page(folio, index) != buf->page) {
>  			erofs_unmap_metabuf(buf);
> +		}
>  	}
>  	if (!folio || !folio_contains(folio, index)) {
>  		erofs_put_metabuf(buf);
> --
> 2.43.0
> 
> 
