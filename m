Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F05A3D6CD7
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 08:19:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788164352; cv=none; b=h7ls3PKxSUWNz3Z+s1ew7m0sj4legGUT3RgljdYhl3/Tg/gnCHLUOGJQrzGLTP9zvJ5sV7+LHvyKkkWcGrCUyVLLckts3xnl+9I8hKKA1EX97wQsuDv72LYVxpwmUGv2SCb1UTEEzAsVLq+/R35X+x7X8s9XH8VYYU8qshSOMY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788164352; c=relaxed/simple;
	bh=mPUNZw9Cy/TOvALNZpoLD3J8ldSTIKvigEF9y+AhyEk=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=NNxPqD/B14D3xO5hm/gN140jOnddxOuLqlJCpeJw3NpRUKqQpjXo2ok3zoLKT1BuzEj/38ulk3UlJMCJT1Z+unwCxKseZwQZWlUgjtzmGOeDHMF3wKdPpVOz9gdPQaNoKL+IujjBDHABxebNR9IYJUXP/f1duJTbYAutUzyXuyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EfPCLmQ+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EfPCLmQ+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF0FB1F000E9;
	Mon, 31 Aug 2026 08:19:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788164350;
	bh=EB7RUR5W520SXZF149cnRfIVevdYFi24n9QrujO/5fI=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To;
	b=EfPCLmQ+GxQUktyh3EMn5OCXN4lFZSBvVLK17bcEgVDbTD9uR51LJ6Em5q1btwLbD
	 ejyo7p8QFxJVipPGHdGTZU9SI9PGaVZO7sOibYD90R1XgKe0nNIxT84+REr90FBEl/
	 xlMjk0lygRepAdmrlqQovrJh/MVFA6fkJtyEEPR6mgXjUiQhOcs2rsnuF+zwEHbovZ
	 0VM4ee/VzF737rk2j/WlsAGpsJOwVIpf2Y19mylFxLI0Df8f0ocu12kMatbOdZaH+2
	 QAW3hh1kIeAA/D7evSUN74PHXIlt+6DKYC46EaWw3y3Y4qpLf6CRfaBIcZA80ticIc
	 nw4bE72+yWINA==
Message-ID: <f1ffd3a5-9fdc-4f26-bd9d-5f55e563f800@kernel.org>
Date: Mon, 31 Aug 2026 16:19:05 +0800
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
Subject: Re: [PATCH 12/14] f2fs: handle block cloning within the same large
 folio
To: Nanzhe Zhao <zhaonanzhe@xiaomi.com>,
 linux-f2fs-devel@lists.sourceforge.net, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20260826082641.2007658-1-zhaonanzhe@xiaomi.com>
 <20260826130916.2231342-2-zhaonanzhe@xiaomi.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20260826130916.2231342-2-zhaonanzhe@xiaomi.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/26/26 21:09, Nanzhe Zhao wrote:
> With large folios, the source and destination block in __clone_blkaddrs()
> can belong to the same folio during same-inode operations such as
> collapse range and insert range.
> 
> In that case, locking the source folio and then looking up the
> destination folio can try to lock the same folio again.  It also copies
> from and to offset 0, which is only correct for order-0 folios.
> 
> Detect the same-inode, same-folio case before looking up the destination
> folio.  Then in this case,we reserve the destination block explicitly.
> 
> Signed-off-by: Nanzhe Zhao <zhaonanzhe@xiaomi.com>
> ---
>   fs/f2fs/file.c | 76 ++++++++++++++++++++++++++++++++++++++++++--------
>   1 file changed, 64 insertions(+), 12 deletions(-)
> 
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index 4272013dbe38..b82acbc3240f 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -1581,25 +1581,77 @@ static int __clone_blkaddrs(struct inode *src_inode, struct inode *dst_inode,
>   			f2fs_put_dnode(&dn);
>   		} else {
>   			struct folio *fsrc, *fdst;
> +			size_t src_off, dst_off;
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
> -			}
>   
> -			f2fs_folio_wait_writeback(fdst, DATA, true, true);
> +			src_off = offset_in_folio(fsrc,
> +						(loff_t)(src + i) << PAGE_SHIFT);
> +
> +			/*
> +			 * For same-inode operations (collapse/insert), src and
> +			 * dst may fall within the same large folio. Detect this
> +			 * to avoid self-deadlock on folio lock.
> +			 */
> +			if (src_inode == dst_inode &&
> +			    folio_contains(fsrc, dst + i)) {
> +				struct dnode_of_data dn;

A lot of codes are redundant, can we add fdst = fsrc;

So that we can replace fsrc w/ fdst, and clean up the redundant codes blow:

Thanks,

> +
> +				/* Reserve block for dst before copying */
> +				set_new_dnode(&dn, dst_inode, NULL, NULL, 0);
> +				ret = f2fs_reserve_block(&dn, dst + i);
> +				if (ret) {
> +					f2fs_folio_put(fsrc, true);
> +					return ret;
> +				}
> +
> +				dst_off = offset_in_folio(fsrc,
> +						(loff_t)(dst + i) << PAGE_SHIFT);
> +				f2fs_folio_wait_writeback(fsrc, DATA, true, true);
> +				memcpy_folio(fsrc, dst_off, fsrc, src_off,
> +					    PAGE_SIZE);
> +				if (folio_test_large(fsrc)) {
> +					f2fs_ffs_find_or_alloc(fsrc);
> +					f2fs_ffs_mark_subrange_uptodate(fsrc,
> +								dst_off, PAGE_SIZE);
> +					f2fs_ffs_mark_subrange_dirty(fsrc, dst_off,
> +								    PAGE_SIZE);
> +				}
> +				folio_mark_dirty(fsrc);
> +				if (i_size_read(dst_inode) <
> +				    ((loff_t)(dst + i + 1) << PAGE_SHIFT))
> +					f2fs_i_size_write(dst_inode,
> +						((loff_t)(dst + i + 1) << PAGE_SHIFT));
> +				folio_set_f2fs_gcing(fsrc);
> +				f2fs_folio_put(fsrc, true);
> +			} else {
> +				fdst = f2fs_get_new_data_folio(dst_inode, NULL,
> +							      dst + i, true);
> +				if (IS_ERR(fdst)) {
> +					f2fs_folio_put(fsrc, true);
> +					return PTR_ERR(fdst);
> +				}
>   
> -			memcpy_folio(fdst, 0, fsrc, 0, PAGE_SIZE);
> -			folio_mark_dirty(fdst);
> -			folio_set_f2fs_gcing(fdst);
> -			f2fs_folio_put(fdst, true);
> -			f2fs_folio_put(fsrc, true);
> +				dst_off = offset_in_folio(fdst,
> +						(loff_t)(dst + i) << PAGE_SHIFT);
> +				f2fs_folio_wait_writeback(fdst, DATA, true, true);
> +				memcpy_folio(fdst, dst_off, fsrc, src_off,
> +					    PAGE_SIZE);
> +				if (folio_test_large(fdst)) {
> +					f2fs_ffs_find_or_alloc(fdst);
> +					f2fs_ffs_mark_subrange_uptodate(fdst,
> +								dst_off, PAGE_SIZE);
> +					f2fs_ffs_mark_subrange_dirty(fdst, dst_off,
> +								    PAGE_SIZE);
> +				}
> +				folio_mark_dirty(fdst);
> +				folio_set_f2fs_gcing(fdst);
> +				f2fs_folio_put(fdst, true);
> +				f2fs_folio_put(fsrc, true);
> +			}
>   
>   			ret = f2fs_truncate_hole(src_inode,
>   						src + i, src + i + 1);

