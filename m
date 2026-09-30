Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5434E509EF9
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 20:29:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790800192; cv=none; b=lG/ZrWPfPjwjR7eUVIE93qb8rD14Bx3X6q0A6v7LQhXT2ovzm0lD180WHFhCKUkSMc95ebJZEKG0eK7Etyi+LvkSrIPHWggk93q/jtFKgND5D6BN1LdvxCDIQs8kdCtg3073nglH7odyy6o8ISFP+a+NItHMbM1++1c7a9SXncQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790800192; c=relaxed/simple;
	bh=tBvgO9bL/fItSk7OA6Gh8iu2q5WD8ld/cUNlFKsMnZE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EL5tj+zrbXzyuMM1PY1dK7koIDATVIex6OGCTIeaPXgynqEIlWqo7hiAJLcc4tYr1Xgx7DS1LJNGLcSgZ9chdel0AxSb3Lmj/b8Y9T/SUYzDVQo7Uyg+zVbluTH+iLc/OOukca/zUtReEe9D8RmrRZm2qO9dtI49An3qkfaXbyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hPm4miCd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hPm4miCd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 427141F00898;
	Wed, 30 Sep 2026 20:29:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790800190;
	bh=9XDlwyLLM9YlYefYiTsdeeoH+mG0yq0IxsDgsViQ+IY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hPm4miCdK5AuCUaM3UCFXuqbCNLS9yo/ZBw/UhrxeHXJOAI/s8Lg+aV/D751zutbh
	 qffXqhh+p+byAzEUWqSFCAL2tL5pvfwopIJfEhkhSO4IcN8A2St59sLpi1qB98k7bT
	 R9vnU7t/OkSc4YY2BdzE1LtrY5y1AiC5533YgLNoGTwRKU4SaxaGIJ8Lb550a7WPMU
	 wkASmmGPbyKw8U2Kz102VGm7MC9dWXd/LjGrX5PSVLXz9XUE/GRU4hHI9EbifsteeL
	 9+VwCQRCZ0ckgYDCJh1YimK848nru9TdwhMbwVniaEIjFxPxj90mPZAFB1iA5pCu8c
	 OsVfx1SHN8Aqw==
Date: Wed, 30 Sep 2026 22:29:45 +0200
From: Gao Xiang <xiang@kernel.org>
To: Binglei Wang <l3b2w1@gmail.com>
Cc: xiang@kernel.org, chao@kernel.org, linux-erofs@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	"Bo Liu (OpenAnolis)" <liubo03@inspur.com>
Subject: Re: [PATCH v2] erofs: fix folio reuse from a different address_space
 in erofs_bread()
Message-ID: <ar1xOV3x9ZMGx9XY@MacBookPro>
Mail-Followup-To: Binglei Wang <l3b2w1@gmail.com>, xiang@kernel.org,
	chao@kernel.org, linux-erofs@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	"Bo Liu (OpenAnolis)" <liubo03@inspur.com>
References: <ar1GgGSIZ1h0bBip@MacBookPro>
 <20260930191905.539-1-l3b2w1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260930191905.539-1-l3b2w1@gmail.com>

On Thu, Oct 01, 2026 at 03:19:01AM +0800, Binglei Wang wrote:
> erofs_bread() reuses a cached folio on page index match without
> checking folio->mapping.
> 
> xattr.c calls erofs_init_metabuf() twice on the same buffer without
> erofs_put_metabuf(); the two in_metabox sources differ, so buf->mapping
> can switch while buf->page still belongs to the old address_space.
> The next erofs_bread() then reads the wrong mapping, dropping shared
> xattrs with METABOX.
> 
> We require folio->mapping == buf->mapping in the reuse check; otherwise
> drop the cached folio and re-read via the slow path.
> 
> Fixes: 414091322c63 ("erofs: implement metadata compression")
> Cc: Bo Liu (OpenAnolis) <liubo03@inspur.com>
> Signed-off-by: Binglei Wang <l3b2w1@gmail.com>

I have to tell you that the patch is still broken, and I failed to
apply like this:


Applying: erofs: fix folio reuse from a different address_space in erofs_bread()
Using index info to reconstruct a base tree...
error: patch failed: fs/erofs/data.c:33
error: fs/erofs/data.c: patch does not apply
error: Did you hand edit your patch?
It does not apply to blobs recorded in its index.
Patch failed at 0001 erofs: fix folio reuse from a different address_space in erofs_bread()


Could you just apply locally before sending out a version?
I could make a patch for you manually, but if you apply more patches
later, the broken email client should be fixed.

Thanks,
Gao Xiang
