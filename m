Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03D5A34252D
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 09:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789205166; cv=none; b=UOeDXX8IihvJkFHILXCW9VTDIqE85FcVsrQ4CmL5wK7ncCqOr2O597HPWCTs+Z/zIelIzs1bthgxiiKCHT87tuxQvDqQEFyudvtBJnnhYEbDSk3lEYEveeboAyg+csPokWjsHvNuulQmqbEMKffDKxNfmdVXNFPt1n4sYIyHA1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789205166; c=relaxed/simple;
	bh=Au0kYIhFKAbX9DAoangGExUJBBn0fjnDDwdTlUUabPk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G1LroYrKtajUeJvH5J+JUzoi3LiMMx86WPuIM+7gqAUzKqmtCuRpojvwQK6ffeZ/VReb65c872Pkjo+yJljp3cuL3UkM/BJhex7OVsBr/1OC0HShM/dClJ3fVF0d5t5dJ1ofacf05zB6hMvj8ae1SlCz5pUbmYYJC5UtwgxVHVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D+QIGsAK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D+QIGsAK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3F0A1F000FF;
	Sat, 12 Sep 2026 09:26:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789205164;
	bh=RcssxDcliU7vD3F+mu6uXNvjkcF5Kkz6UZoypW6r5jc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=D+QIGsAKeIU3e1n1EgW8EZSrtxXvyZFGHtxApR4t18y5GNG7qD5Mssh8ZLiPlJXNo
	 Xmedjs6S5jVpggf/YrwhL+YwLRzQ5IwTVLsga46jrB9++SqS3JI2EPInYLXY4xSyse
	 p0Iqkshow7wk6rpF+b8CUfbt0UMVFO7u1+ZkmwlAk55xQ9RTnvTnreIwX+BfjP/5qM
	 HJhhNYGr3Molvixaeyb3rCyXlxQw3bftpUgfYRtyTJKh3KdY5UgSmTNLQiH5gX5yPf
	 LrJsIW3rcCFDB+vfLn1ZCBHM1/I/+yWAtaQwjn5+SMOoShHNW2fodCegzj/JTFl5vT
	 tLvQd+XSDLzyQ==
Date: Sat, 12 Sep 2026 17:25:57 +0800
From: Gao Xiang <xiang@kernel.org>
To: Binglei Wang <l3b2w1@gmail.com>
Cc: linux-erofs@lists.ozlabs.org, xiang@kernel.org, chao@kernel.org,
	shengyong1@xiaomi.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] erofs: fix unbalanced buf->off handling in erofs_bread()
Message-ID: <aqUapQtNF7DK-A5J@XiangdeMacBook-Pro.local>
Mail-Followup-To: Binglei Wang <l3b2w1@gmail.com>,
	linux-erofs@lists.ozlabs.org, xiang@kernel.org, chao@kernel.org,
	shengyong1@xiaomi.com, linux-kernel@vger.kernel.org
References: <20260912025709.25604-1-l3b2w1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260912025709.25604-1-l3b2w1@gmail.com>

On Sat, Sep 12, 2026 at 10:57:09AM +0800, Binglei Wang wrote:
> From: Binglei Wang <l3b2w1@gmail.com>
> 
> erofs_bread() locates the target folio with
> 
> 	index = (buf->off + offset) >> PAGE_SHIFT;
> 
> but computes the in-folio offset without taking buf->off into account:
> 
> 	return buf->base + (offset & ~PAGE_MASK);
> 
> If buf->off is not page-aligned, the returned pointer misses the in-page
> component of buf->off, so callers end up fetching data from a wrong
> offset.
> 
> buf->off is set to sbi->dif0.fsoff in erofs_init_metabuf(), and fsoff can
> be specified via the "fsoffset=" mount option, which only requires
> block-size alignment.  Therefore, on an image with a sub-page block size
> (e.g. 512 bytes), a non-page-aligned fsoff (e.g. 512) triggers the issue,
> since 512 is a multiple of the block size but not of PAGE_SIZE.
> 
> It can be reproduced by mounting an image that is placed at a
> non-page-aligned offset:
> 
> 	mkfs.erofs -b512 -zlz4hc sub.erofs src/
> 	# prepend 512 bytes of padding to the image
> 	mount -t erofs -o loop,fsoffset=512 padded.erofs /mnt
> 
> which fails with
> 
> 	erofs (device loop0): cannot find valid erofs superblock
> 
> because the on-disk superblock (at offset 1024 within the image, i.e.
> 1536 within the padded file) is read from a wrong in-folio offset.  With
> this fixed, the very same image mounts successfully and its file contents
> match those read from the unpadded image.
> 
> Fix it by including buf->off in the in-folio offset calculation, so that
> it is consistent with the folio index calculation.
> 
> Fixes: c36ec00d7f67 ("erofs: add 'fsoffset' mount option to specify filesystem offset")
> Cc: <stable@vger.kernel.org> # 6.16+
> Signed-off-by: Binglei Wang <l3b2w1@gmail.com>

As I said, I aiready applied a version before, please don't
send it again.

Thanks,
Gao Xiang
