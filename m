Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794934296;
	b=lJ8lyrKGUtRXtOAd4LjZSulbazSqakXxhRMEJYfSWQ6Nio+dLBfetk0ryB1JpJk9WFFT
	 oH7BOtC5VUxizwvQ/q9cLtQrGmnuEaR1+L+At0F/zUn5p4VQw5vb9kWVNjVJuiJoFs2ph
	 WHPsNQ2VS/HoqpjcBtWwedbVl4aX9i+msPRSxG/Xm6IVgJ2wifw4HRghmI4k1Qwm5L7+H
	 DbuKOnzvW+HKj6y1D//2O1UBV22jPJTdWtSJMhu/38/9PE6Dyf/A3hOL84FYVemX95ViE
	 SyRvC9K3gSpxq/bITa26Fsu63qi7MtX1NJEdaXiVTkWWhOcxt2NfVAJYLkvPMP655LQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794934296;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=3KbnbVGo+5jELz4RnHBN3fdcKesRiud/qwVfWP3x9go=;
	b=gepyNMSbGtftvGiYkp778R/HPO1a94K+WaDB1YgbEyAHA/cuDzGd/c0QRsJLzuHWRBvg
	 jM6GMUaYXIDSMtctctnFHyUa/sJUfYSP700w18KdqZwCRMVCsMSRGR5VIdZ4dOXNIF4Cr
	 hoHRzSW/8KL31Hcfq47rhJZRR1fB947+ZBrQV7WTsGRd8Uto8SdHuOa8+m9BFCpMVL/vH
	 eKUXX5TN9fftqLL3iWGmV+usn9jGFjZtO70A8Hj7mAEOeTQ1imvCFhJiiznDGnWywaIJ6
	 UnOw5+xv/VZJx2AllxSKQ8n84UzdUyy+cZgIa6A52A1XIYLi9l9IAUmkF7D0HklgSUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Bs39lSpJ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A08EC606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 16:51:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Bs39lSpJ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 435451F000C5;
	Tue, 17 Nov 2026 16:51:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794934296;
	bh=3KbnbVGo+5jELz4RnHBN3fdcKesRiud/qwVfWP3x9go=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Bs39lSpJ8Ea1a1aFOtpNMLgHW61y0xwvtNlSYF3bC+BTgb1noJ+2Jfum2pFYXILpj
	 FozARdl12izT3TaQL+2B+6zupswnN+HU3UbxE4mpupqR47t8QtoW0TBI6a2PMpIimG
	 qgfJ7y/yqV9Ay8u8iRUHoXLSj13q/nJhLB0hzgXrTcYUhEZcPi++TkDeIpNqwN9H+p
	 wOExdBu45ED25QoN3lHWPFrxSJuQxSLZsfM7Ab6qvNttKjbyeUHvlR+RQpyn2H7h0d
	 34//Wb9H42xny4iQvMsr55xclqYqL65CVA/ubKzbUStB8vMDHVQ5Nmw30ycYLoSY36
	 swHjvOGGB5VuQ==
Date: Tue, 17 Nov 2026 16:51:34 +0000
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <chao@kernel.org>
Cc: Daeho Jeong <daeho43@gmail.com>, linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net, kernel-team@android.com,
	Daeho Jeong <daehojeong@google.com>
Subject: Re: [f2fs-dev] [PATCH v2 06/20] f2fs: support subpage blocks in data
 read path and GC
Message-ID: <avyGFkZdLhKIC9Rs@google.com>
References: <20261116040851.2849696-1-daeho43@gmail.com>
 <20261116040851.2849696-7-daeho43@gmail.com>
 <22a8264a-0538-458d-a20e-f1d732aa69ac@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <22a8264a-0538-458d-a20e-f1d732aa69ac@kernel.org>

On 11/17, Chao Yu wrote:
> On 11/16/26 12:08, Daeho Jeong wrote:
> > From: Daeho Jeong <daehojeong@google.com>
> > 
> > With subpage blocks, a folio can be partially uptodate, so reads and GC
> > have to work per block.
> > 
> > - Read only the non-uptodate blocks of a multi-block folio, and send
> >   every inode to this path in subpage mode.
> > - Do not use the folio state when a single bio reads the whole folio.
> > - Implement ->is_partially_uptodate.
> > - Convert block indices to folio indices in the data folio getters and
> >   GC, and prefetch the whole folio in GC so that its blocks are read
> >   together.
> > - Fix error handling in f2fs_read_data_large_folio().
> > - Zero the blocks past EOF in f2fs_read_data_large_folio() instead of
> >   reading them, as f2fs_read_single_page() does. With subpage blocks,
> >   they share a page with the last block of the file and can be seen
> >   through mmap.
> > - Test the per-block uptodate state in f2fs_find_data_folio() under the
> >   folio lock, as ->release_folio can free the folio state otherwise. A
> >   fully uptodate folio is still returned without the lock.
> > - Keep the folio state of a folio that is not fully uptodate in
> >   ->release_folio while the folio has other users. Otherwise a block
> >   that a lockless reader, e.g. a dentry lookup, is using can be read
> >   from disk again.
> > - Get sbi from the folio in f2fs_finish_read_bio() only after the
> >   compressed page check, as nothing pins the inode of a compressed page
> >   once its cluster is unlocked.
> > - Rename helpers that now take block indices, e.g.
> >   f2fs_submit_page_read() to f2fs_submit_block_read().
> > 
> > The read changes also apply to large folios when the block size equals
> > PAGE_SIZE.
> > 
> > Signed-off-by: Daeho Jeong <daehojeong@google.com>
> 
> Reviewed-by: Chao Yu <chao@kernel.org>
> 
> > @@ -5636,6 +5684,16 @@ bool f2fs_release_folio(struct folio *folio, gfp_t wait)
> >  	if (folio_test_dirty(folio))
> >  		return false;
> >  
> > +	/*
> > +	 * The folio state holds the uptodate state of the blocks of a folio
> > +	 * that is not fully uptodate. Keep it while the folio has users other
> > +	 * than the caller, e.g. a dentry lookup that parses a block without
> > +	 * the folio lock, so that the block is not read again under them.
> > +	 */
> > +	if (f2fs_folio_has_ffs(folio) && !folio_test_uptodate(folio) &&
> > +	    folio_ref_count(folio) > folio_expected_ref_count(folio) + 1)
> > +		return false;
> > +
> >  	ffs_detach_free(folio);
> >  	return true;
> >  }
> 
> BTW, we should notice this side effect, dio may be blocked due to it can not
> invalidate folios which is referenced by other buffered reader.

Not from my end. Can we add a bug_on to detect this first with a reproducer?

> 
>     Thread A (buffered read)                Thread B (DIO write, same range)
>     - filemap_read
>      - filemap_get_pages
>      : folio ref taken (batch), folio
>        partially uptodate, ffs present
>      - copy_folio_to_iter
>                                             - iomap_dio_complete
>                                              - kiocb_invalidate_post_direct_write
>                                               - invalidate_inode_pages2_range
>                                                - folio_unmap_invalidate
>                                                 - f2fs_release_folio
>                                                 : !uptodate && ref > expected + 1
>                                                   -> false
>                                                : -EBUSY
>                                               - dio_warn_stale_pagecache
>                                               : pr_crit, wb_err = -EIO
> 
> Thanks,
