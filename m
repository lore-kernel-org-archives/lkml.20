Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0AC33624C9
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 08:46:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788166020; cv=none; b=oBi6nBBfmQYC6RHmvDfk+ibR0aTABInicnWfDzgRGS2e22XfYwtXm76eIZLwzP0I9PEZl0bj3sQyUQZPqAXHpPrjggZw8S7KBz/Pryz1mIN31vOKZnvwO2FKbOtzJq2Ka8LG9D8oy8zf99UXOk4dLCWc1/iL82onfGq1OorUGpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788166020; c=relaxed/simple;
	bh=OdEwtXoaK0wQpbmQjTEb8ammK3pxk+2Gp209pH8fp0o=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=bL4uWJ+ds1onBYy5qRFcTJ90681lgcaLaLUv+wSyRQdL50T8/nVMT1PcPxPoTeOx46idZluEyxMsB1ug4ehP3e+ACiUmcE4XGa0E/dJ3DPtPAm8vPATVdL5Tm6PCy+F5Xh6d+QtfhhKPVgT/OWejEaBrFgq5GXRp8jbFyX7ksJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VarKxufO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VarKxufO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27E401F000E9;
	Mon, 31 Aug 2026 08:46:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788166019;
	bh=VQnyeozED9KENp5fLCfASXjgZw48Aez7/KG7ZHlPB6o=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To;
	b=VarKxufOjF6BHqCh8Z40QAsdJqNubO50wawp61Z3JBQ3BhuO/DENJ4jsFiEzOJVvQ
	 ldLi5gMiXYx0vR7ofVe6PNpVHoSva48bt/tHrRSoOg4ZKaR2mt0tM7eXNg9BCaEaMf
	 1ySy9kqreXd4mWNkRqe0tHmjqiX+UKEkIJ2lF7BP/vR6DVirLU65l+nqfcR7VAdVYi
	 VPyjzM0J8x3HPNeZYmOZ+6+y2AYOx3EdvsfTPzDt1N9MBcD5jex5JxNClTyq87VxMo
	 NusHTTXOYJ8OA84ILSET03FrZ5KILZBBTi2H03GYTrSDvgWIOBxS6gCuw5OeKxJhJc
	 GT9090PLkflAw==
Message-ID: <bd032f33-01ec-48e0-a214-cd1e04cb466e@kernel.org>
Date: Mon, 31 Aug 2026 16:46:55 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: chao@kernel.org, Barry Song <baohua@kernel.org>,
 Nanzhe Zhao <nzzhao@126.com>, Juan Yescas <jyescas@google.com>,
 Dev Jain <Dev.Jain@arm.com>, linux-kernel@vger.kernel.org,
 David Hildenbrand <David.Hildenbrand@arm.com>,
 Bo Zhang <zhangbo56@xiaomi.com>, Kalesh Singh <kaleshsingh@google.com>,
 Ryan Roberts <Ryan.Roberts@arm.com>, Pengfei Li <lipengfei28@xiaomi.com>
Subject: Re: [PATCH 14/14] f2fs: make compressed files compatible with large
 folio
To: Nanzhe Zhao <zhaonanzhe@xiaomi.com>,
 linux-f2fs-devel@lists.sourceforge.net, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20260826082641.2007658-1-zhaonanzhe@xiaomi.com>
 <20260826130916.2231342-4-zhaonanzhe@xiaomi.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20260826130916.2231342-4-zhaonanzhe@xiaomi.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/26/26 21:09, Nanzhe Zhao wrote:
> The compression flag is the hint indicates that the inode can be
> compressed, when the inode is using large folio, we expected it keeps
> using the large folio read/write paths and its data stays uncompressed
> on disk until the inode is evicted and re-read
> 
> Let f2fs_write_begin() skip the compression overwrite preparation for
> such inodes and remove the compressed-file gate in
> f2fs_read_data_large_folio() so the data is simply read/written as
> regular blocks.

Can you please elaborate more about compress policy in doc as well?

Otherwise, user may be confuse about compressed inode behavior, e.g.
for the case we enable compress inode via ioctl, but due to large
folio flag is set, content of inode will be kept as raw before evict
and reload.

Thanks,

> 
> Signed-off-by: Nanzhe Zhao <zhaonanzhe@xiaomi.com>
> ---
>   fs/f2fs/data.c | 9 ++-------
>   1 file changed, 2 insertions(+), 7 deletions(-)
> 
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index 2e20833c6417..befcdc3742f6 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -2955,12 +2955,6 @@ static int f2fs_read_data_large_folio(struct inode *inode,
>   	int ret = 0;
>   	bool folio_in_bio = false;
>   
> -	if (f2fs_compressed_file(inode)) {
> -		if (folio)
> -			folio_unlock(folio);
> -		return -EOPNOTSUPP;
> -	}
> -
>   	map.m_seg_type = NO_CHECK_TYPE;
>   
>   	if (rac)
> @@ -4935,7 +4929,8 @@ static int f2fs_write_begin(const struct kiocb *iocb,
>   	}
>   
>   #ifdef CONFIG_F2FS_FS_COMPRESSION
> -	if (f2fs_compressed_file(inode)) {
> +	if (f2fs_compressed_file(inode) &&
> +	    !mapping_large_folio_support(inode->i_mapping)) {
>   		int ret;
>   		struct page *page;
>   

