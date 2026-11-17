Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794905908;
	b=KEr6TVvFROZ955vyxlhdnc2viXnP3JGCw953mEl+OF8fLb1uCsmFdHCeJRVURHVELj4X
	 ZsEh8RitFvlT5TomRjRvXInSTX2qENlXcEkSC5pG4gKuDiSQwtodjBdWimK4dZN5deXmF
	 Q+dgNYPcAzOYlwHjxi5WxTokb4JBaqT2YXokwBJgov7BQL9AYPzKTFpnWq7bmNWZxsHeq
	 SClK36blnoK8eQ9H5/Viwj1wUUDN+VjtiNahjq4jx0F2Va3X8KnpnrSd47ETvb0jji8r9
	 jIA+Ex2Uqc8NftHH8V2xZY/qQOBL9hLkxSz3hIjh/xqNLaafSoiL+uZx3wmWPXL7PsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794905908;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:Cc:
	 Subject:To:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=UfPUXhLHv7nnCZ879aEk2MvKrIm4Y4NVkVAkXD0d6Dc=;
	b=fm09TPJewvXhaPlU+k9D25kbqyRv0gSUDdBY9uKksEnmxyoUOkm3/w5jIg+kuAUMkKsi
	 qQ+yJ8k3F6IxtQ7Dx9xFP2zFmURck1J+HD6MG5McVdAlpZFDvOf4KA2iCqPrQKjenqg1M
	 DYwuLKJWdSrGSabs4LgPHlJqqFZNozIMmxppATHHHV2VEqv0ZpZK3N1d+6q2JL/18J4z+
	 QCuX/6Mrp3YvgjejEsA+z1/SbB5U560OC0SSBrjZNjUqEywMoxUs5CfRZsB4Dhy2ExKV/
	 Sm//9a+EokkvKnipIbLWhYkCTkKn+nS2A7g5OGGJdLKLhOMUsuKqH+zQGtUnyTwLDgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KlF6JON1;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09625606A891
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 08:58:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KlF6JON1
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DF4F1F000C4;
	Tue, 17 Nov 2026 08:58:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794905907;
	bh=UfPUXhLHv7nnCZ879aEk2MvKrIm4Y4NVkVAkXD0d6Dc=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To;
	b=KlF6JON15E0+mBMT4+PSoVdxw4TlOTma4T0Sd6oknoY8gAh9oxyLNBb2j7rPTLBMT
	 nXdwrrIyacqm+NubmtXeLPTLn437MaQfsOSwzQbg0YnMqnfA1HyfXQ9O+ZwBi/t8O8
	 gbPqCOZHNliGTJB0oMeQM2G2WzIRdNw/Z0J1aZIrG0eSEcCnDCDGjcwR6Ort3l/nUZ
	 61WXWiP/wiQpfNydePaIasG/hH0eIbUcbAYbNqhDKR6i3zboJTHKFgThmuSeKG5WHh
	 PvJJTxCVIZz84YjE/5+Up0hIlgJLqT830jWHChwNWLO9sjmHXcX9erTm8XfMQ5qOl3
	 Nhrgqkw0JWnuw==
Message-ID: <22a8264a-0538-458d-a20e-f1d732aa69ac@kernel.org>
Date: Tue, 17 Nov 2026 16:58:24 +0800
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
Cc: chao@kernel.org, Daeho Jeong <daehojeong@google.com>
Subject: Re: [f2fs-dev] [PATCH v2 06/20] f2fs: support subpage blocks in data
 read path and GC
To: Daeho Jeong <daeho43@gmail.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, kernel-team@android.com
References: <20261116040851.2849696-1-daeho43@gmail.com>
 <20261116040851.2849696-7-daeho43@gmail.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20261116040851.2849696-7-daeho43@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/16/26 12:08, Daeho Jeong wrote:
> From: Daeho Jeong <daehojeong@google.com>
> 
> With subpage blocks, a folio can be partially uptodate, so reads and GC
> have to work per block.
> 
> - Read only the non-uptodate blocks of a multi-block folio, and send
>   every inode to this path in subpage mode.
> - Do not use the folio state when a single bio reads the whole folio.
> - Implement ->is_partially_uptodate.
> - Convert block indices to folio indices in the data folio getters and
>   GC, and prefetch the whole folio in GC so that its blocks are read
>   together.
> - Fix error handling in f2fs_read_data_large_folio().
> - Zero the blocks past EOF in f2fs_read_data_large_folio() instead of
>   reading them, as f2fs_read_single_page() does. With subpage blocks,
>   they share a page with the last block of the file and can be seen
>   through mmap.
> - Test the per-block uptodate state in f2fs_find_data_folio() under the
>   folio lock, as ->release_folio can free the folio state otherwise. A
>   fully uptodate folio is still returned without the lock.
> - Keep the folio state of a folio that is not fully uptodate in
>   ->release_folio while the folio has other users. Otherwise a block
>   that a lockless reader, e.g. a dentry lookup, is using can be read
>   from disk again.
> - Get sbi from the folio in f2fs_finish_read_bio() only after the
>   compressed page check, as nothing pins the inode of a compressed page
>   once its cluster is unlocked.
> - Rename helpers that now take block indices, e.g.
>   f2fs_submit_page_read() to f2fs_submit_block_read().
> 
> The read changes also apply to large folios when the block size equals
> PAGE_SIZE.
> 
> Signed-off-by: Daeho Jeong <daehojeong@google.com>

Reviewed-by: Chao Yu <chao@kernel.org>

> @@ -5636,6 +5684,16 @@ bool f2fs_release_folio(struct folio *folio, gfp_t wait)
>  	if (folio_test_dirty(folio))
>  		return false;
>  
> +	/*
> +	 * The folio state holds the uptodate state of the blocks of a folio
> +	 * that is not fully uptodate. Keep it while the folio has users other
> +	 * than the caller, e.g. a dentry lookup that parses a block without
> +	 * the folio lock, so that the block is not read again under them.
> +	 */
> +	if (f2fs_folio_has_ffs(folio) && !folio_test_uptodate(folio) &&
> +	    folio_ref_count(folio) > folio_expected_ref_count(folio) + 1)
> +		return false;
> +
>  	ffs_detach_free(folio);
>  	return true;
>  }

BTW, we should notice this side effect, dio may be blocked due to it can not
invalidate folios which is referenced by other buffered reader.

    Thread A (buffered read)                Thread B (DIO write, same range)
    - filemap_read
     - filemap_get_pages
     : folio ref taken (batch), folio
       partially uptodate, ffs present
     - copy_folio_to_iter
                                            - iomap_dio_complete
                                             - kiocb_invalidate_post_direct_write
                                              - invalidate_inode_pages2_range
                                               - folio_unmap_invalidate
                                                - f2fs_release_folio
                                                : !uptodate && ref > expected + 1
                                                  -> false
                                               : -EBUSY
                                              - dio_warn_stale_pagecache
                                              : pr_crit, wb_err = -EIO

Thanks,
