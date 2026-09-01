Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DD233932E8
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 01:16:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788225396; cv=none; b=sFDHU/7MIgExiNjRvnU9RNsi7sZdbRxmujVNSIfpjqbFZJg5z9KazD03uuBCeVEFsd+hhh3PrgjFcJ+9o1yw7VvdUSApUfCLVF1Ix34eZltSs5T5IWnLQI7irT6sKTV1R/aDMiBR0LxJJwNDD5Z8XuR4EXkeFGiSFW1vdZHqBUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788225396; c=relaxed/simple;
	bh=nPaFhJ5bh81rQnYHWi18R3G/SlBdQwiZJ2sXZwzRAwU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fdkC6cl/Bmx3o/B32C2YB8MCFeuJJE1Qw/GP/0x3+MfvDFQLrfKsT+RR2iSKuVu/FhBOC1wq6oYOLIQiLkkCro5NrfTxuxSj1YXb3uBMYWyUVqVCLDhyxpZ74nFxFRpy3ORhbyo3VDlVeTkubAbv2T8Ld5aRVm9ADbl2UuUuchI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=BZj1JXZu; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="BZj1JXZu"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4956d1d9fb2so1868245e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 18:16:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1788225384; x=1788830184; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=X78DpyuVQCNYSBmXxws/u1WGsj/hOlLkVFIFIGfWSnU=;
        b=BZj1JXZuCTRS2BMKmCTM26b1tKy5zgPqu9j4wmlNWrJJ+bPPZRrVCBcp8HPQilieNB
         Mbu0y6U8Smw6J/BePbC56miy5OaS3q6v9ZU7JpICDd2Dhul2Q+VV9u75XpjI5rnNb80L
         Xzm0JyDylWh5bO0Mw4mOzPU9UIsurwtv6qsAk+eDPmw31GQmQckW+YVjeOf5m5rO1HWH
         87eHMeMfAa1gjduWJPXKUq5G4YCxBi5+UVLwmRUNNUdTF6uZnQo7uvi9P5xIgahDbFqW
         KYkRXCdrZ0N/6HV5+YM9ef3lRHslAjFVHL+CEdL7aHYi4E1xv+vyR/d0fvQ1FdhUEyQs
         uQOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788225384; x=1788830184;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X78DpyuVQCNYSBmXxws/u1WGsj/hOlLkVFIFIGfWSnU=;
        b=bsneCE3UmXSAbPsgmKB+pQLXjllfHhaqvq7rniOYalOOnq0WJPz1Lx8uL4XxVIGgx9
         QlnMd3sqIHV0Xg57Y7jPxSYQbP5+5uiEA9lvVhFwjzW0DtBLZuw/9M8XjAOggpCqfqSF
         ATsZTcId4JABMcSObOvRebVVWx3JJIq0WhMCfvvhfnk3KuKU57QQC1OfqGk+3rqSlcd6
         OmCbs2JWJnmLVxW25mjIsx3M093/2xPxrHBa4x7CgGsa553T1kpEP0oSSz8ILWLDt+dC
         HZL3lUAIoCoYtO5DgsxPN/IGi+A/D8BHxnDVrSM5eweabCpe1FhiBPQdNlb6vZ1JFiC4
         S5eA==
X-Forwarded-Encrypted: i=1; AHgh+RqcdNdgXLejBu8j2nt/YJ3Wt1idYRwMrXrdRwTGwbH0EWSjhySHkRnllarJFLVK5xT08H2z52sCpNXobzY=@vger.kernel.org
X-Gm-Message-State: AFuF++k7e0hc62C6CeRpPmpWuF4fyMv/yoVpG48FOrj3DrvMdCMVfsWJ
	a4Goh/eE7AMUBFlTPBypOKX2JT4YYJuNxdpU5sBJPagJ9n2ci5qUPY9RRujFWaTE0EY=
X-Gm-Gg: AR+sD11raRCP6kBm/x7R6/I2KtC+OsmjDd9yEky5rSaABy6+QK/+vWp1EKQBzERavwU
	vIfbrCUVknz5PvMDWKLbcOr3QH5F75IUlSftCke9hd+lJv6MayzD0+4j2EDhI9cxL3sQ8d5qdA5
	rFSN/jZdbmTdgI+rle4rdbhVpJ3qz4Fms3lCmrs7OlXtOOiGL0Scwm+VR5zYu9it5p+Kw30br5q
	9BCwt31wckKSl+KUh/qDXvPIEGZSV7oZhdlDivoRyGv8PS2BkR2NtdS51ZY2Ohj31g0LvdTQrpH
	RarLhF3M2g4IpA3epzt1f7rRk8VzbaEl8Uqyb+iaI+bMf0CcTG+0dPb/lPFmf2JFp0XFnkGXf/g
	HdtAbDfjXBzZ1/RXdhpJXjIsp+dmzS9s78Jc0gjoeD2j0RZwoSyo8RDqekllXPJeECNNx6TmkJn
	7RuCbIbNWI/VIRgTSaMqRtivXjEjjjA/Zek3EsNxQA2StnaDdcmb0QEGgl6DU=
X-Received: by 2002:a05:600c:4686:b0:499:d95a:41f with SMTP id 5b1f17b1804b1-49b91bd68famr241492125e9.0.1788225384174;
        Mon, 31 Aug 2026 18:16:24 -0700 (PDT)
Received: from localhost ([202.127.77.110])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3990d471e75sm2506061a91.8.2026.08.31.18.16.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 18:16:23 -0700 (PDT)
Date: Tue, 1 Sep 2026 09:16:20 +0800
From: Heming Zhao <heming.zhao@suse.com>
To: Joseph Qi <joseph.qi@linux.alibaba.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Mark Fasheh <mark@fasheh.com>, Joel Becker <jlbec@evilplan.org>, ocfs2-devel@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] ocfs2: restrict OCFS2_INVALID_SLOT suballoc slot to
 system inodes
Message-ID: <apYnADntUmNwIgcj@p15>
References: <20260831062848.2743436-1-joseph.qi@linux.alibaba.com>
 <20260831062848.2743436-2-joseph.qi@linux.alibaba.com>
 <apWJLyCNwqfdiRQb@p15>
 <fdd373d2-0c70-4a64-b2da-50f2dac194b1@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fdd373d2-0c70-4a64-b2da-50f2dac194b1@linux.alibaba.com>

On Tue, Sep 01, 2026 at 09:08:26AM +0800, Joseph Qi wrote:
> 
> 
> On 8/31/26 10:02 PM, Heming Zhao wrote:
> > On Mon, Aug 31, 2026 at 02:28:45PM +0800, Joseph Qi wrote:
> >> ocfs2_validate_inode_block() currently permits i_suballoc_slot to be
> >> OCFS2_INVALID_SLOT for any dinode.  Only system inodes created by
> >> mkfs.ocfs2 are allocated from the global allocator and thus
> >> legitimately carry this value; regular inodes are always allocated
> >> from a per-slot suballocator and hence must have a valid slot.
> >>
> >> If a corrupted regular inode with OCFS2_INVALID_SLOT is accepted,
> >> ocfs2_remove_inode() will pass the slot to ocfs2_get_system_file_inode()
> >> and get_local_system_inode() will hit BUG_ON(slot == OCFS2_INVALID_SLOT)
> >> when the inode is deleted.  This can be triggered by an unprivileged
> >> user unlinking such a corrupted file.
> >>
> >> Reject OCFS2_INVALID_SLOT for non-system dinodes during validation,
> >> while still accepting it for system inodes.
> >>
> >> Fixes: fe7a283b3916 ("ocfs2: add suballoc slot check in ocfs2_validate_inode_block()")
> >> Cc: stable@vger.kernel.org
> >> Signed-off-by: Joseph Qi <joseph.qi@linux.alibaba.com>
> > 
> > LGTM.
> > Reviewed-by: Heming Zhao <heming.zhao@suse.com>
> 
> Thanks, sashiko has some review comments, I'll fix them and send v2 later.
> 
> Joseph

It seems sashiko review comments only go to the patch submitter/author.
In my view, they're also sent to ocfs2-devel@lists.linux.dev, which is nice as 
it lets others on the list see them."

- Heming
> 
> >> ---
> >>  fs/ocfs2/inode.c | 19 +++++++++++++++++--
> >>  1 file changed, 17 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/fs/ocfs2/inode.c b/fs/ocfs2/inode.c
> >> index 180107a11046..eda50f13ffb5 100644
> >> --- a/fs/ocfs2/inode.c
> >> +++ b/fs/ocfs2/inode.c
> >> @@ -1520,8 +1520,23 @@ int ocfs2_validate_inode_block(struct super_block *sb,
> >>  		goto bail;
> >>  	}
> >>  
> >> -	if (le16_to_cpu(di->i_suballoc_slot) != (u16)OCFS2_INVALID_SLOT &&
> >> -	    (u32)le16_to_cpu(di->i_suballoc_slot) > OCFS2_SB(sb)->max_slots - 1) {
> >> +	/*
> >> +	 * Only system inodes created by mkfs.ocfs2 are allocated from the
> >> +	 * global allocator and thus legitimately carry OCFS2_INVALID_SLOT.
> >> +	 * Regular inodes are always allocated from a per-slot suballocator.
> >> +	 * If a regular inode with OCFS2_INVALID_SLOT was accepted here,
> >> +	 * deleting it would pass the slot to get_local_system_inode() via
> >> +	 * ocfs2_remove_inode() and trigger BUG_ON(slot == OCFS2_INVALID_SLOT).
> >> +	 */
> >> +	if (le16_to_cpu(di->i_suballoc_slot) == (u16)OCFS2_INVALID_SLOT) {
> >> +		if (!(le32_to_cpu(di->i_flags) & OCFS2_SYSTEM_FL)) {
> >> +			rc = ocfs2_error(sb,
> >> +					 "Invalid dinode %llu: suballoc slot %u for non-system inode\n",
> >> +					 (unsigned long long)bh->b_blocknr,
> >> +					 le16_to_cpu(di->i_suballoc_slot));
> >> +			goto bail;
> >> +		}
> >> +	} else if ((u32)le16_to_cpu(di->i_suballoc_slot) > OCFS2_SB(sb)->max_slots - 1) {
> >>  		rc = ocfs2_error(sb, "Invalid dinode %llu: suballoc slot %u\n",
> >>  				 (unsigned long long)bh->b_blocknr,
> >>  				 le16_to_cpu(di->i_suballoc_slot));
> >> -- 
> >> 2.39.3
> >>
> 
