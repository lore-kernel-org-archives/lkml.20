Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F322838DC7F
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 04:22:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789100569; cv=none; b=UzdrT9yvtKqOFprI+R+u1df1Cj9rNdYrcWhuS5SM1k/uvvb/QxhDmlUMoLvooYKOBxCrsSn5dvhKvaLGwss34m5BQc0g3z+v+jrcpKe0Kvy9Mv3HAxwaFfgZ0Z0koC8Qb7Ue84qiPc5x1WIPSt2gVLKYa+24byKaIXZpfx3qdsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789100569; c=relaxed/simple;
	bh=cw506hT40S1/moggaqRnPKSAqMT+QXwD3YXuDT5LZ6k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HDtvrq89cFJlSEj1HylwmgXZzMfO1H/0wzwz3991bnXTZp/yY7FTH7gquxiu7Z+PfxnhzWc596fdtmllKbNfYnraQp/OX8GrJIwI1RakflAA2wiBffsr6QFCRlBJcy1QDfDn/gpFBD7aOQNXJGe4ZjZ/cufPXQqfNTeUElgUir8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TMc0LM4C; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TMc0LM4C"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BB5B1F000FF;
	Fri, 11 Sep 2026 04:22:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789100567;
	bh=ebCesLcNaD3EI5S5Z4wZ6FRAvX10PMVJuluVaZzZqzE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=TMc0LM4Cuh/MKjU2F2xFgT+SL4CG9nS+xH528hkR3jnHAM2sy3CMcNvEl/qMq5Z/b
	 77vd1EWCyLeIXeBvf0x8r5clTxscsk8f8yYxS5rpt9p5NTmsXH/OTANv1FDb1zxIXB
	 qnwaji31H6Xb10qmaF6WZDwEtH1t63VH4tovq+BuqJRgOfgNZSgFF4XN6d9cN3Izq5
	 JDRbet6pMUpEtQX2PPxDMm9JUSp7/LX3x/nw7biNIfXn07RSDs+i/LdJXZEYL+YDsr
	 qfQKWITRVXgCziGS4I0L6exMOJ5wG7/PSu9yKcv5GpwL/otMat/qWVqmnce8EeQ7hb
	 wNHGTd5vUTdjg==
Date: Fri, 11 Sep 2026 12:22:40 +0800
From: Gao Xiang <xiang@kernel.org>
To: binglei wang <l3b2w1@gmail.com>
Cc: linux-erofs@lists.ozlabs.org, xiang@kernel.org, chao@kernel.org,
	shengyong1@xiaomi.com, zbestahu@gmail.com,
	jefflexu@linux.alibaba.com, dhavale@google.com,
	hongbohbli@tencent.com, guochunhai@vivo.com, wangshuai12@xiaomi.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] erofs: fix unbalanced buf->off handling in erofs_bread()
Message-ID: <aqOCEK8T209eXwnW@XiangdeMacBook-Pro.local>
Mail-Followup-To: binglei wang <l3b2w1@gmail.com>,
	linux-erofs@lists.ozlabs.org, xiang@kernel.org, chao@kernel.org,
	shengyong1@xiaomi.com, zbestahu@gmail.com,
	jefflexu@linux.alibaba.com, dhavale@google.com,
	hongbohbli@tencent.com, guochunhai@vivo.com, wangshuai12@xiaomi.com,
	linux-kernel@vger.kernel.org
References: <CAJ3C4Kwms2my+y_T0Mx+XM_gb9gs7cVZ7w4v2GRAURF1rRFU0g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAJ3C4Kwms2my+y_T0Mx+XM_gb9gs7cVZ7w4v2GRAURF1rRFU0g@mail.gmail.com>

Hi,

On Fri, Sep 11, 2026 at 12:16:56PM +0800, binglei wang wrote:
> erofs_bread() locates the target folio with
> 
>  index = (buf->off + offset) >> PAGE_SHIFT;
> 
> but computes the in-folio offset without taking buf->off into account:
> 
>  return buf->base + (offset & ~PAGE_MASK);
> 
> If buf->off is not page-aligned, the returned pointer misses the in-page
> component of buf->off, so callers end up fetching data from a wrong
> offset.
> 
> buf->off is set to sbi->dif0.fsoff in erofs_init_metabuf(), and fsoff can
> be specified via the "fsoffset=" mount option, which only requires
> block-size alignment. Therefore, on an image with a sub-page block size
> (e.g. 512 bytes), a non-page-aligned fsoff (e.g. 512) triggers the issue,
> since 512 is a multiple of the block size but not of PAGE_SIZE.
> 
> It can be reproduced by mounting an image that is placed at a
> non-page-aligned offset:
> 
>  mkfs.erofs -b512 -zlz4hc sub.erofs src/
>  # prepend 512 bytes of padding to the image
>  mount -t erofs -o loop,fsoffset=512 padded.erofs /mnt
> 
> which fails with
> 
>  erofs (device loop0): cannot find valid erofs superblock
> 
> because the on-disk superblock (at offset 1024 within the image, i.e.
> 1536 within the padded file) is read from a wrong in-folio offset. With
> this fixed, the very same image mounts successfully and its file contents
> match those read from the unpadded image.
> 
> Fix it by including buf->off in the in-folio offset calculation, so that
> it is consistent with the folio index calculation.
> 
> Fixes: c36ec00d7f67 ("erofs: add 'fsoffset' mount option to specify
> filesystem offset")
> Cc: <stable@vger.kernel.org> # 6.16+
> Signed-off-by: Binglei Wang <l3b2w1@gmail.com>

As I said, I applied a modified version:
https://lore.kernel.org/r/aqOBLWQEkH7_3LSu@XiangdeMacBook-Pro.local

I think if you have some email client issue, you could loop the patch to
your own email, download it from your mailbox and try to apply locally
for self-testing first.

Thanks,
Gao Xiang
