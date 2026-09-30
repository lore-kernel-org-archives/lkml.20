Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19359466B72
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 07:52:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790754761; cv=none; b=CFfTZKXG0X8DUCY0PFdMU0BHjCOcW/aCzeGqpeW5YsOaKf5udf3QkigaFgVEV+00xfIdjRf1IPZYqkhuuE63occigfMRCTC+2AL9143i3DcZd1TYvLSnzWtyGQo4sfHSHcvj01e0lYYLBcBwJ/2VTFfQs9yaLdsJ7G3MhpFlJtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790754761; c=relaxed/simple;
	bh=8mga/9C1gJYjL3j4DkG9JzXt1zTEVnD5TgTAH+DV0hY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LljMzFktITU79qvG/FVwJl7yHbhbn0nejeqepijb7HRJ/m9BcPdKYIJBgI5/ysUTaOwySR46EDTZ1Xayolbp2xI+/fcxHSjlOfOpjW1xviyOadBJeD37NsM46Df0ecz3XQ/Ey3L5TLLRULC843iWmkwGRe0r+K30koPjBS2jRFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bRIKRrc9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bRIKRrc9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D3F81F000FF;
	Wed, 30 Sep 2026 07:52:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790754760;
	bh=HG+Asrw3g/mWMsN1/SOW/UfriJ5U+pNGLQlihCs8RCI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bRIKRrc9r7IyEvc70N95JxUAf3/OCQjvHIGE5ymmxMkyFfC/BqladvJwSTZ36yOJO
	 oJlzgtvgll/lEgsAjORo9GbQvs44xf/xOaIke2peIw1qQuQjX9BPgM+VYvwyaJ+rhk
	 h1bGgbQEtmVfAUZDwSRKljHDvD6vT0l8fxzjZ4YW8UzOjtQXTgr8n/JnJ9NXKrKLrR
	 TpVW4wbOkO9pwcIpZONL3ZN12b3cA7wTQ+BRJlmUTtRDQfUakf3QjtCoN2wPbahjcb
	 r5GYJOgabEQlHfNFjAxTiDg1G1a6ZOZHVYsQaarbwWClFtjww6bDt4+l70YA4P0FVp
	 ZueLzRsbFmw3g==
Date: Wed, 30 Sep 2026 09:52:34 +0200
From: Gao Xiang <xiang@kernel.org>
To: binglei wang <l3b2w1@gmail.com>
Cc: xiang@kernel.org, chao@kernel.org, linux-erofs@lists.ozlabs.org,
	zbestahu@gmail.com, jefflexu@linux.alibaba.com, dhavale@google.com,
	hongbohbli@tencent.com, guochunhai@vivo.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] erofs: fix folio reuse from a different address_space in
 erofs_bread()
Message-ID: <ary_wjlpYNWbqaHU@MacBookPro>
Mail-Followup-To: binglei wang <l3b2w1@gmail.com>, xiang@kernel.org,
	chao@kernel.org, linux-erofs@lists.ozlabs.org, zbestahu@gmail.com,
	jefflexu@linux.alibaba.com, dhavale@google.com,
	hongbohbli@tencent.com, guochunhai@vivo.com,
	linux-kernel@vger.kernel.org
References: <CAJ3C4KySUqKevOBn=CROzsWkaLdK_X241oLFXO26FKBVq73QJg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAJ3C4KySUqKevOBn=CROzsWkaLdK_X241oLFXO26FKBVq73QJg@mail.gmail.com>

On Wed, Sep 30, 2026 at 11:37:53AM +0800, binglei wang wrote:
> erofs_bread() caches the last folio in struct erofs_buf and reuses it when
> the next request lands on the same folio, but the reuse predicate only
> compares the page index; it never checks that the cached folio still
> belongs to buf->mapping.  Correctness therefore relies on an invariant
> that is nowhere enforced.
> 
> fs/erofs/xattr.c already breaks it: erofs_xattr_iter_inline() and
> erofs_xattr_iter_shared() call erofs_init_metabuf() on the same buffer
> with no intervening erofs_put_metabuf(), and their in_metabox arguments
> come from different sources (per-inode vs per-fs).  When the two differ,
> buf->mapping is switched while buf->page still holds a folio of the
> previous address_space, so the next erofs_bread() can return data from
> the wrong one.
> 
> This is observable with METABOX enabled, where shared xattrs silently
> disappear on the mounted fs, while the same tree built without METABOX
> reports them fine.
> 
> Fix it by validating the address_space in the reuse predicate too: if the
> cached folio belongs to another mapping, drop it so that the existing
> slow path re-reads from buf->mapping.  Reading folio->mapping is safe
> here because a reference on the cached folio is still held; if the folio
> was already truncated, folio->mapping is NULL and the slow path is taken,
> which is the safe direction.
> 
> Fixes: 414091322c63 ("erofs: implement metadata compression")
> Cc: Bo Liu (OpenAnolis) <liubo03@inspur.com>
> Signed-off-by: Binglei Wang <l3b2w1@gmail.com>

Thanks for the patch.

 1) The patch format is still broken as your previous patch, please
    check your email client again before sending out a new patch
    (as I said, you could send a patch to yourself and try to apply
     the patch and see if it works);

 2) the commit message of this patch is too over long (mostly
in the LLM-generated style), I think you could simplify a bit since
it's more friendly to human developers.

> ---
>  fs/erofs/data.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/erofs/data.c b/fs/erofs/data.c
> index be63b89f0862..d8b6523bc218 100644
> --- a/fs/erofs/data.c
> +++ b/fs/erofs/data.c
> @@ -33,8 +33,13 @@ void *erofs_bread(struct erofs_buf *buf,
> erofs_off_t offset, bool need_kmap)
> 
>   if (buf->page) {
>   folio = page_folio(buf->page);
> - if (folio_file_page(folio, index) != buf->page)
> + if (folio->mapping != buf->mapping) {
> + /* the cached folio belongs to another address_space */
> + erofs_put_metabuf(buf);
> + folio = NULL;

     `folio = NULL` is enough?

Thanks,
Gao Xiang

> + } else if (folio_file_page(folio, index) != buf->page) {
>   erofs_unmap_metabuf(buf);
> + }
>   }
>   if (!folio || !folio_contains(folio, index)) {
>   erofs_put_metabuf(buf);
