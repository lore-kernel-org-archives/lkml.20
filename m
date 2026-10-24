Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792825990;
	b=RoufamW9ge9M6Q6SAKNOQu4m20wmOmF7vajMhdXyzqlLt6sZXlBIpC0hKTg5OxGxZN3P
	 PrXmj4nX/0NRoIIZkLSmI2uTxHbNzt0snnVPKXNJOXtUMaepsi4Vy81AZOYMz+M5KCJyQ
	 WKkmDZcJcnmsjtYzScoLVganHCmq0c/MwRGeVRKU9BkWT8523swkhxoPZHYzCQ8UR2P9/
	 pSkHYFYB/sFC5A5R/flZ2otEnhD7FviChsC13Y5ndaCwQaCWWkBg1fLmouDef9SZcz8Hm
	 0M4UYl39TX1kYVpEtUO2X4u5J5Y9mvWSValTPhIClQrt3rhS9X3cDc/B3VShMU4z05A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792825990;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=vvVgDb84+ZH4mGzuu/NhPjeDNR0l9LEuFpIELpyf8Yk=;
	b=k/EKUsoDv3/VPXhexTVC/4CbmwOt94IUw6mjYQN3IqXhjejddZPSW37dfwZiGFzcfLJz
	 X6pdFIvSYLnIEZweiOOMkucmXAD2BYdnu9nzxeR5CZs8/ceHPo87oRSBz2O9YXs6bsp81
	 0L0HHEGg463CFo9WdehGkeczZFiiv9cCrwnms6GCV/ZNrG7MbDFEjODxrtu0KuoCqUQav
	 7Tv62QWmtqeqhSBtDbUuoQoQ8a9IXgOpI4g4iCQybwuMB5SmDK2eihZmKC1Wce48/LGeG
	 c2prgxg9VtOWiYLBKXPjRG57MQ3V8TSS9AdP5OS27cikFffsu6aBv4QmqmXyCb+Gi0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=gaaCZKW9;
	arc=none smtp.remote-ip=209.85.215.177
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C915606A31B
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 07:13:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C915606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=gaaCZKW9
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-cd61cef87f1so545322a12.0
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 00:13:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792825989; x=1793430789; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vvVgDb84+ZH4mGzuu/NhPjeDNR0l9LEuFpIELpyf8Yk=;
        b=gaaCZKW97VyVrU/UyqRFDCtRPkmeVHzomoYOSsaSLwy9qc1oyKdXLDd2xNt9iRiBrm
         jqYJlin3hbz/1w0/aFEwX6+jsw8fhFlndilXsXCXmpTi6v99GUKpU6r1zwKe9DBofW9C
         jZXE1bnCoHNLiKq2JXbHDVHQ+U7fNH6piDeQrDCXDnDLzenNUNC4zSn2V3JZkQxD4kL8
         gqhud9Pr3E6yLkmb1+kyoMrftn7P1e0+Keh1aOLv0jROV+YtlW+ck9V/5IptxIjLmSUU
         tNz2VbP9G+Tb7Qa6O5deJtcsWeqD5FbVBif3UG9NlOYJTC6gk7b4t203EYBJCkgPHqEu
         E0Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792825989; x=1793430789;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vvVgDb84+ZH4mGzuu/NhPjeDNR0l9LEuFpIELpyf8Yk=;
        b=Ej8UDjq70zzRMNcoWEJrPZtwvcWysGW432ClJ9WttoBxewAeJu7LMREiKEhSnmUjj1
         xBkExyuYcywDjOcQeYQp5tf7N1UPV2b9mO3rCTSKRye5Qijbsp8i310MmKT9Rqth4YwZ
         8u54P0C0OuX6qDogWiR0ucDdgOzSqeZU+o8P7jDe3zeZnWSDEOSO0BSohYVkvnkmRyKt
         vX67YH8XKIGBbNyZOCGcN/dkg4DwoAO7Y/bWpI5GZVpVGkf5MaWGPgsLSVj2q/QYSg0R
         qWxIsaELYJs5ucbnjmWcEGoWTGWbNio+/+2Ih7Ec09iGPLMTq8rKMwkwBaJTEN47hzDx
         wbFg==
X-Forwarded-Encrypted: i=1; AKwUvBz833G4yrGxUm6S4Nk/VgVtS584JmNqPsWcgWKPtH8nnBQyhoMKVLeWci5VePdRPTk4BnKS/V3QxDjN3Oo=@vger.kernel.org
X-Gm-Message-State: AFq9FYLz6qKsqHphdHqiyTt8FPG5LiYO18VYtwG7h7xGFD2EKLy30F7d
	LWYoFlsTWpWMmjFogsSCsrIRg0Zh6/eubQxGq52f89UN6atirgdogLUT
X-Gm-Gg: AYBFou1XnDDceTM1VsXfwsFX/PNG8Aoyj2gMarR4rKtxFvbUJirVnXkcTY8zkGoNAFR
	aEwZZWwJMfRZHhd/Dmon++l2uXLu1kET8gyoF8K3L3LT26PiIRQAZlfedtyOlsQPnT4fupa/HaD
	DuoW/b3Q9XgmO1pbpZVGklQnC6CmIFh/AKgmWwhmdlhknNKmLffx9/wnbDICEgEhe7H7JvU6ZOI
	hRK3aQjVk2tOEn0sQFQ//Kw600lsgT5/EMokUMkKzfdyv1YgiaWQ3q9C99bdkrxFnkl9hXhcttF
	AzX+OvQ/jSd2AYXiiJDqgmdP7ZxZGO2erZr41lUgR3ptoFHrastjjZyejJ7m1S5/jl38eLcmIvp
	n45z6QpKBUzloz48EkeOodqY9jWjmO5pYBlqFeSo3qcAyoviZWPaXcaeSo4DfoDkzTWQN4EZ+BA
	w4cdD7oPDHPGGhl7o1pO2E77fpc0rzDXhPhybOzZRYXGKe2ZZSN8XUdQONWsIovWprBjQhyWS6B
	xB3JnqcnHUZEtkkG4bwml9dx/iZ//hic5PVoF+bOdxJ2gF8Oy69BEFOweFLa7Kw6Vb4AEjGcVWv
X-Received: by 2002:a17:90b:4acf:b0:3ac:9e76:aa93 with SMTP id 98e67ed59e1d1-3adea0b1206mr1026779a91.7.1792825988773;
        Sat, 24 Oct 2026 00:13:08 -0700 (PDT)
Received: from [100.125.248.95] ([124.70.231.46])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebe6af0dsm1895499a91.5.2026.10.24.00.12.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 24 Oct 2026 00:13:08 -0700 (PDT)
Message-ID: <abcaabca-d99e-4bf2-b31b-5e96e7accd29@gmail.com>
Date: Sat, 24 Oct 2026 15:12:35 +0800
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
Subject: Re: [PATCH v2] ext4: do not advance i_size on a buffered write that
 copied nothing
To: Hengyu Liang <hengyul@cs.unc.edu>
Cc: linux-ext4@vger.kernel.org, tytso@mit.edu, adilger.kernel@dilger.ca,
 libaokun@linux.alibaba.com, jack@suse.cz, ojaswin@linux.ibm.com,
 ritesh.list@gmail.com, yi.zhang@huawei.com, yi.zhang@huaweicloud.com,
 dave.hansen@linux.intel.com, akpm@linux-foundation.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20261023172532.3271348-1-hengyul@cs.unc.edu>
Content-Language: en-US
From: Zhang Yi <yizhang089@gmail.com>
In-Reply-To: <20261023172532.3271348-1-hengyul@cs.unc.edu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/24/2026 1:25 AM, Hengyu Liang wrote:
> Commit 665575cff098 ("filemap: move prefaulting out of hot write path")
> made generic_perform_write() call ->write_begin() and ->write_end()
> before it finds out that the source buffer cannot be read.  In that
> case ->write_end() is called with copied == 0.
> 
> However, ext4_write_end(), ext4_journalled_write_end() and
> ext4_da_do_write_end() set i_size to pos + copied without checking
> copied.  As of now, a buffered write() past EOF that fails with EFAULT
> grows the file to the write offset, and the new size can reach the
> disk.
> 
> The issue can be reproduced on an ext4 mount with:
> 
>      char *p = mmap(NULL, 4096, PROT_NONE,
>                     MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
>      int fd = open("/mnt/ext4/file", O_CREAT | O_TRUNC | O_RDWR, 0600);
>      pwrite(fd, p, 4096, 1024 * 1024);   /* fails with EFAULT */
>      fstat(fd, &st);
> 
> Before that commit, the result is st_size = 0.
> After it, the result is st_size = 1048576.
> 
> This patch will leave i_size alone when nothing was copied, as
> ext4_write_inline_data_end() already does.  The delalloc path does not
> trim after a failed write, so when such a write reaches past i_size,
> it also drops the folio and the delayed blocks that ->write_begin()
> set up there.  Otherwise that folio stays dirty past EOF and writeback
> never cleans it.

I feel the last sentence isn't quite accurate. Dirty folio past
EOF will be cleaned up during writeback. In mpage_process_page_bufs(),
when lblk >= blocks, if 1) there are no blocks to map, it will
directly call mpage_submit_folio(), which clears the dirty flag on
the folio, and then mpage_submit_folio() will shorten the writeback
length, so that ext4_bio_write_folio() will also clear the dirty
flag on the corresponding bh; if 2) there are blocks to map, then
after the required block allocation is done, it will likewise call
mpage_submit_folio() and do similar cleanup. Am I missing something?

> 
> Fixes: 665575cff098 ("filemap: move prefaulting out of hot write path")
> Cc: stable@vger.kernel.org
> Signed-off-by: Hengyu Liang <hengyul@cs.unc.edu>
> ---
> Changes in v2:
> - Rebase onto the ext4 dev branch.
> - Also trim when a failed write starts before EOF and ends past it
>    (pos + len > old_size), as suggested by Zhang Yi.
> - Keep the Fixes tag and the new helper, as discussed on v1.
> - v1: https://lore.kernel.org/r/20261009044656.1993196-1-hengyul@cs.unc.edu
> 
> Tested in KVM with KASAN: the reproducer above and failed writes around
> EOF on delalloc, nodelalloc, bigalloc and 1k block filesystems.
> e2fsck -fn reports no errors.
> 
>   fs/ext4/inode.c | 42 +++++++++++++++++++++++++++++++++++-------
>   1 file changed, 35 insertions(+), 7 deletions(-)
> 
> diff --git a/fs/ext4/inode.c b/fs/ext4/inode.c
> index 6ede3644a738..e96321ce17d2 100644
> --- a/fs/ext4/inode.c
> +++ b/fs/ext4/inode.c
> @@ -1578,15 +1578,18 @@ static int ext4_write_end(const struct kiocb *iocb,
>   	 * it's important to update i_size while still holding folio lock:
>   	 * page writeout could otherwise come in and zero beyond i_size.
>   	 *
> +	 * If nothing was copied (e.g. the source buffer was unreadable), do
> +	 * not move i_size up to pos.
> +	 *
>   	 * If FS_IOC_ENABLE_VERITY is running on this inode, then Merkle tree
>   	 * blocks are being written past EOF, so skip the i_size update.
>   	 */
> -	if (!verity)
> +	if (copied && !verity)
>   		i_size_changed = ext4_update_inode_size(inode, pos + copied);
>   	folio_unlock(folio);
>   	folio_put(folio);
>   
> -	if (old_size < pos && !verity)
> +	if (copied && old_size < pos && !verity)
>   		pagecache_isize_extended(inode, old_size, pos);
>   
>   	/*
> @@ -1697,13 +1700,13 @@ static int ext4_journalled_write_end(const struct kiocb *iocb,
>   		if (!partial)
>   			folio_mark_uptodate(folio);
>   	}
> -	if (!verity)
> +	if (copied && !verity)
>   		size_changed = ext4_update_inode_size(inode, pos + copied);
>   	EXT4_I(inode)->i_datasync_tid = handle->h_transaction->t_tid;
>   	folio_unlock(folio);
>   	folio_put(folio);
>   
> -	if (old_size < pos && !verity)
> +	if (copied && old_size < pos && !verity)
>   		pagecache_isize_extended(inode, old_size, pos);
>   
>   	if (size_changed) {
> @@ -3349,6 +3352,24 @@ static int ext4_da_should_update_i_disksize(struct folio *folio,
>   	return 1;
>   }
>   
> +/*
> + * Delalloc counterpart of ext4_truncate_failed_write(): ->write_begin() only
> + * reserved delayed blocks, so drop the page cache and the delayed extents
> + * beyond i_size and leave the blocks that are allocated there alone.
> + */
> +static void ext4_da_truncate_failed_write(struct inode *inode)
> +{
> +	struct address_space *mapping = inode->i_mapping;
> +	ext4_lblk_t lblk = EXT4_B_TO_LBLK(inode, inode->i_size);
> +
> +	filemap_invalidate_lock(mapping);
> +	truncate_inode_pages(mapping, inode->i_size);
> +	down_write(&EXT4_I(inode)->i_data_sem);
> +	ext4_es_remove_extent(inode, lblk, EXT_MAX_BLOCKS - lblk);
> +	up_write(&EXT4_I(inode)->i_data_sem);
> +	filemap_invalidate_unlock(mapping);
> +}
> +
>   static int ext4_da_do_write_end(struct address_space *mapping,
>   			loff_t pos, unsigned len, unsigned copied,
>   			struct folio *folio)
> @@ -3386,12 +3407,12 @@ static int ext4_da_do_write_end(struct address_space *mapping,
>   	 * checked, we need to update i_disksize here as certain
>   	 * ext4_writepages() paths not allocating blocks and update i_disksize.
>   	 */
> -	if (new_i_size > inode->i_size) {
> +	if (copied && new_i_size > inode->i_size) {
>   		unsigned long end;
>   
>   		i_size_write(inode, new_i_size);
>   		end = offset_in_folio(folio, new_i_size - 1);
> -		if (copied && ext4_da_should_update_i_disksize(folio, end)) {
> +		if (ext4_da_should_update_i_disksize(folio, end)) {
>   			ext4_update_i_disksize(inode, new_i_size);
>   			disksize_changed = true;
>   		}
> @@ -3400,9 +3421,16 @@ static int ext4_da_do_write_end(struct address_space *mapping,
>   	folio_unlock(folio);
>   	folio_put(folio);
>   
> -	if (pos > old_size)
> +	if (copied && pos > old_size)
>   		pagecache_isize_extended(inode, old_size, pos);
>   
> +	/*
> +	 * A write reaching past i_size that copied nothing leaves i_size
> +	 * alone, so trim what ->write_begin() set up beyond it.
> +	 */
> +	if (!copied && pos + len > old_size)

Why do you keep the '!copied' condition? AFAICT, if copied is non-zero
but less than len, the excess delalloc extent allocate by
ext4_da_write_begin() should still be cleaned up.

Thanks,
Yi.

> +		ext4_da_truncate_failed_write(inode);
> +
>   	if (!disksize_changed)
>   		return copied;
>   
> 
> base-commit: 8c4f6e3376348fc3162eed86a05b933921c8f9ed

