Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55C7C46EC7B
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 10:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788776677; cv=none; b=H+rokMgs5xeEbBEmy48kKrzuyMTGvTNjWtwcZJbXyIKVtahZScjm7jxRAqb58iHNCAi73rx2fHkURM2Iv6dJOwJrr18qb7+01RpHgwqQf3WIaoqhJGta99ah3mk1OgoYiRVH9nV+cvBAybv2PamlJRkOo6eDYUHcrrLQti9vy9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788776677; c=relaxed/simple;
	bh=Sap+g3EOkzHwU6f/oKluEXLzAcdW83UoPmFUKOII4/Y=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=J5xM+zkzkA7DLFih+T+gHEg9auk/l0qLM0Dc1mQ6cvf/eL2ovp6UcpSO+3B7P2pmtxtjadPhzrjyEdzqxKR5guTMnEjtJsO8GuniIRTbZNTbUv3ZCuubkEsRE4zdid8aEEb0Z7xIsxzGk0kUq7VXjqPlnnZWSz2UUkaahHa5eqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FtXN28sx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FtXN28sx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09EF11F00A3F;
	Mon,  7 Sep 2026 10:24:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788776676;
	bh=9BqDLmGnAkMHp9vwRniiZuI/ddgBPW2A/NeBEBZzQS8=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To;
	b=FtXN28sxVnTxLlot/tbGgKn54hYdfQDVpBNPETtLXAunDWU81VOHQTOLlu26rJ8WQ
	 aBy1Zh9dPjbQ2OgxR53PQGQnJIoVSfKdt727BvlCEnKArD8P8/Yo+RQ68sqkxGMa28
	 lgGBGLU+yHp3Tu5zZru6roNOjkq2b94KRXI0D0HW+Su4rY+xjIz0lzaziOZXZ4NY/f
	 K/BkA98SIlMqgtlofTMtwLDBbYwiVgufOcnhPYcXpZqy5H3CJ5ytWYOxumDkkwRFPH
	 QS1OCHzkLfTNoWT6s+6lUxGwFwgAjdYSA0JOKmV0SGHpdV5izJ/V1VSuV1FfYN8fPn
	 FiyIrl8nP5cOA==
Message-ID: <f9839ca2-1554-450d-9e98-72d686a8402d@kernel.org>
Date: Mon, 7 Sep 2026 18:24:32 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: chao@kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 Barry Song <baohua@kernel.org>, Juan Yescas <jyescas@google.com>,
 Pengfei Li <lipengfei28@xiaomi.com>, Dev Jain <Dev.Jain@arm.com>,
 linux-kernel@vger.kernel.org, David Hildenbrand <David.Hildenbrand@arm.com>,
 Bo Zhang <zhangbo56@xiaomi.com>, Kalesh Singh <kaleshsingh@google.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>, Ryan Roberts <Ryan.Roberts@arm.com>
Subject: Re: [f2fs-dev] [PATCH 12/14] f2fs: handle block cloning within the
 same large folio
To: Nanzhe Zhao <nzzhao.sigma@gmail.com>
References: <f1ffd3a5-9fdc-4f26-bd9d-5f55e563f800@kernel.org>
 <20260907095759.2461366-1-zhaonanzhe@xiaomi.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20260907095759.2461366-1-zhaonanzhe@xiaomi.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Thanks, better.

On 9/7/26 17:57, Nanzhe Zhao wrote:
> On Mon, 31 Aug 2026 16:19:05 +0800, Chao Yu wrote:
>> A lot of codes are redundant, can we add fdst = fsrc;
>> So that we can replace fsrc w/ fdst, and clean up the redundant codes
>> below:
>> Thanks,
> 
> Thanks for the review. I'll restructure the else branch as suggested:
> 
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -56,25 +56,66 @@
>   			f2fs_put_dnode(&dn);
>   		} else {
>   			struct folio *fsrc, *fdst;
> +			size_t src_off, dst_off;
> +			bool same_folio;
>   
>   			fsrc = f2fs_get_lock_data_folio(src_inode,
>   							src + i, true);
>   			if (IS_ERR(fsrc))
>   				return PTR_ERR(fsrc);
> -			fdst = f2fs_get_new_data_folio(dst_inode, NULL, dst + i,
> -								true);
> -			if (IS_ERR(fdst)) {
> -				f2fs_folio_put(fsrc, true);
> -				return PTR_ERR(fdst);
> +
> +			src_off = offset_in_folio(fsrc,
> +						(loff_t)(src + i) << PAGE_SHIFT);
> +
> +			/*
> +			 * For same-inode operations (collapse/insert), src and
> +			 * dst may fall within the same large folio.  Detect this
> +			 * to avoid self-deadlock on folio lock: in that case the
> +			 * destination folio is fsrc itself and only its block
> +			 * needs reservation.
> +			 */
> +			same_folio = src_inode == dst_inode &&
> +					folio_contains(fsrc, dst + i);
> +			if (same_folio) {
> +				struct dnode_of_data dn;
> +
> +				/* Reserve block for dst before copying */
> +				set_new_dnode(&dn, dst_inode, NULL, NULL, 0);
> +				ret = f2fs_reserve_block(&dn, dst + i);
> +				if (ret) {
> +					f2fs_folio_put(fsrc, true);
> +					return ret;
> +				}
> +				fdst = fsrc;
> +			} else {
> +				fdst = f2fs_get_new_data_folio(dst_inode, NULL,
> +							      dst + i, true);
> +				if (IS_ERR(fdst)) {
> +					f2fs_folio_put(fsrc, true);
> +					return PTR_ERR(fdst);
> +				}
>   			}
>   
> +			dst_off = offset_in_folio(fdst,
> +					(loff_t)(dst + i) << PAGE_SHIFT);
>   			f2fs_folio_wait_writeback(fdst, DATA, true, true);
> -
> -			memcpy_folio(fdst, 0, fsrc, 0, PAGE_SIZE);
> +			memcpy_folio(fdst, dst_off, fsrc, src_off, PAGE_SIZE);
> +			if (folio_test_large(fdst)) {
> +				f2fs_ffs_find_or_alloc(fdst);
> +				f2fs_ffs_mark_subrange_uptodate(fdst,
> +							dst_off, PAGE_SIZE);
> +				f2fs_ffs_mark_subrange_dirty(fdst, dst_off,
> +							    PAGE_SIZE);
> +			}
>   			folio_mark_dirty(fdst);
> +			if (same_folio && i_size_read(dst_inode) <
> +			    ((loff_t)(dst + i + 1) << PAGE_SHIFT))
> +				f2fs_i_size_write(dst_inode,
> +					((loff_t)(dst + i + 1) << PAGE_SHIFT));
>   			folio_set_f2fs_gcing(fdst);
>   			f2fs_folio_put(fdst, true);
> -			f2fs_folio_put(fsrc, true);
> +			if (!same_folio)
> +				f2fs_folio_put(fsrc, true);
>   
>   			ret = f2fs_truncate_hole(src_inode,
>   						src + i, src + i + 1);
> 
> Thanks,
> Nanzhe

