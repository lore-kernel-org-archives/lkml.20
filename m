Received: from fhigh-a7-smtp.messagingengine.com (fhigh-a7-smtp.messagingengine.com [103.168.172.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9F8B4848AD
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 11:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790939054; cv=none; b=fqkKUTBCWknATU8homHFlPRHBlpYeyGlWzNoPTKxovZPCmIr9X6ZzC3/F4kNlMH80CQTak/KxQz1BLWDPWo4xVJm51/EnolqEY5vwQsPyyjLnLhohnEbU2c64BTkWHLFminMrGGWgeyJZ1a7y5EZ5+jEFFgXDdo6xPVFqGsBbUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790939054; c=relaxed/simple;
	bh=EiDnjZi2h0pRKoiVbnzpkW/8VgM3LAqYOqBc5Wh7GeU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=drHXnll5jkeopoSn0fIHCRFpZ4zrNmCBy0rwTJIt/waw8ZVOQuhwUmnuJNPKrZfZ3iZFGYYTyp052UC2ldkWv7mEOaeXvahNjrH1SQyTY/PmIvLBX7hLAuq2WWYa6GuvpGBSM4muxqgYL4Sqp642jDpn+rI5vzVMrobr8zuDZCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name; spf=pass smtp.mailfrom=shutemov.name; dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b=QekrnzXi; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=es2mM9/h; arc=none smtp.client-ip=103.168.172.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shutemov.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b="QekrnzXi";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="es2mM9/h"
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfhigh.phl.internal (Postfix) with ESMTP id B79141400144
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 07:04:09 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Fri, 02 Oct 2026 07:04:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1790939049; x=
	1791025449; bh=V+CspCPuUrV1DZQwM4VsM3gftFdzU2algsvWjKSKcew=; b=Q
	ekrnzXigrPsPQk+k59ixw7EuVN1vJkDK77wtQ8msXjmm3lG8+09rr8TX6ouMMtA8
	JULVwj9eAOXvr0OZ3cAYjE+4uia6z56O7hCfxB0coS3DL4oTBmt4yEHfoL7WtvZf
	sOKas9LGw01pkIih7srvcZnfb5NNEooy6bAx7yuMBTdv9RBaMzjL9DZdYmOwqcmS
	s0Vj3K9vYbfQJl+9FRA+MJtPppyiNVwmeiuN1qGxvxD+qbJK/n0Xr4yPsCcp/dbs
	Vg/gWyDAWUjpF0a5g19tvgozNnHEOoXf5sVqN/G54INPq9gTFyc/ycJ0S1kCTdb5
	jb6ujMimOx89Qb0k4Z+EA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1790939049; x=1791025449; bh=V+CspCPuUrV1DZQwM4VsM3gftFdzU2algsv
	WjKSKcew=; b=es2mM9/hFxAg6etPPqWoGCLcfup4dLXuAGXaaye1ZDLmnZi/Zo1
	utDYEKOdDqIuCovcHwFBV0XWvnW3g/nlCUEkDVmtydDssblFHXCK0hL7ZDfUbGxz
	mVBFuGPLBqqeNXOiktpNrbdRkmGsAw4x8xbd+CVxg+uCaM3lPwx1QiG183R2350A
	Nnj9yg4pqUKax6tQTeAaMLazgqScEUGku+XVG/2sNLWnUlia7KbS4xErKYfID3PI
	Nx8M3WjFm/549RkEO7lF/N7cTXdKpaYmBuDT5RFT3iu69xZJX+Ir1dB31XTv6CPF
	3Jd2VmruFqzfxKuVKHBqgKha9qGK99snseQ==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-09-30; sw=lmtpprox;
	action=sign d=shutemov.name a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1790939049; d=shutemov.name;
	mf=PGtpcmlsbEBzaHV0ZW1vdi5uYW1lPg==;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm3:rsa-sha256:uu4KNTpeIe4y++MPsX6yUP6v3vMTM4iEZOBsAlzMmN/PVab
	iwZFgJHMTM4aNzP02/fp41jJaB9+PFf90BRRlRKSSGDGahLkSle2kGAfAHL+nS6m
	gqHfPTYCIJFgCIyApW8F7BfqTifNOFIxfuTslyp26e6XvkvDQeWnRicCP+9INAh1
	CsoYNCa9u8gDxehxL1OJKtS9BwdZED83ME81JZRfiUx3gwqXcvEvNCC+SG/ac8rz
	TVCcJMPIz4hEg2fYat5GnBDbDapF5q08y/N4d5TqeOvUG0r9bGMEtDT+DED8iZJj
	Ss3BLPqWbXS7hbRm8yI61Rtl1HjufGGzQQvsgNg==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-09-30; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-disposition,content-type,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:B703GFyu9om6K0t7rMkPEQo13XbBpyozKr1P++By2lU=:EiDnjZi2h0pRKoiVbnzpkW/8VgM3LAqYOqBc5Wh7GeU=;
X-ME-Sender: <xms:qI-_al_XW29hKuV2_QY5CdbR_7-Rnky7igCnrBvkRKcNb9mmPOpDXA>
    <xme:qI-_anXIzSgfEZihc5ZWQSzjw2cekbDaUAZfTGsNzo_a79V1YaSCX2yI9CJEYCBdb
    Ro08lwYBYYRMtXiG0zwfipIygxjiMYNCovxgwusK7Xduj5basbGsPo>
X-ME-Received: <xmr:qI-_aqYJzFIIKnBrwgTgfilLJZnOl8W8L3SofRVEA38IxyXxBMZ1obZ8cmg>
X-ME-Proxy-Cause: dmFkZTELHcSiMMxlJw34NEVhTb/tP/q7rUftRVhStCDqy5afz8mIQLkM5/U6lzTbT7wY1t
    Dubz0b8qAjMVg1fBerCV70MIYPXwjQR1Xz6+u+kNvHS5IrQdijxYHnd4qgJKDCU+uIkK3M
    A63URQ30c7172S1e+9w+Qm3u6+POqC7A6FtqE4x2etFFOPGJrz6rJ98hbHRzwQv29fwAL9
    IPjyzfA8vfYEFs4w8WrH6fofLmF0ER614Rx3E3d9vKsUe+oZtGkLeLSS/bnnjuQWuRXFTN
    5ZhU3Bia6r2PTTckhuHZyDCdJwSMZDSG9+naPwBLIwHKr8medxM4MSNsZ9CZ/AEU1mm8C8
    DpDa4BcIxtRxk31Lvhwnba/kRwh7hZqBGjukZhBOiktQRPseP5nJBqCJoQEOJh6FArRiV3
    0TFoQSip5obzK9i2xEDlmLAS8BLEcxp58c1/w97k9xdD91B2MLNNOqYElFNy2p09CrpdE3
    /mT2CTyZ0ll3n8FFgdNMJvxPO8OeJqHxxO73aQQCtT8ZAHxyheqVwJf/gZQz0+jShj+F/L
    z6BbbHoffeY3ABEmB7vh5+q3bR5aI3g1DRZKI2MYrvVT1osmvjY7CQ5m4IBxOXeI7t/P9f
    MCwzWznWWqeVTdn+agZgcubO+TD9JJZ1+gotwC6gVatu6CFB9TnliCUtvgzw
X-ME-Proxy: <xmx:qI-_ahoMuzxjxda9e-7WWILqqvVQ6OzqIi_j6vp9kffK2nJX1wx6JA>
    <xmx:qI-_ah47Y6ZgaFBM22xfNaCTp1eEivnjXpbLcDQu-mh2pQxmtbY5PQ>
    <xmx:qI-_arWglGbLtLsWf3LLz-Sm9sv-rZsimrjasxCkOY_vibiLudrPJA>
    <xmx:qI-_avtVZV38vE--ZyoG_9VSBELsTtz4DbkeCKUwlql_akeSOXO1PQ>
    <xmx:qY-_alg1zRRH5BVUKeLJX6ccgS3g8IqsybqWkk-BMI3G2z4Vz4N9Ka2y>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 2 Oct 2026 07:04:07 -0400 (EDT)
Date: Fri, 2 Oct 2026 12:04:06 +0100
From: Kiryl Shutsemau <kirill@shutemov.name>
To: Zi Yan <ziy@nvidia.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	kernel-team@meta.com, "Liam R. Howlett" <liam@infradead.org>, 
	Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, 
	Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>, 
	Usama Arif <usama.arif@linux.dev>, Vlastimil Babka <vbabka@kernel.org>, 
	Jann Horn <jannh@google.com>
Subject: Re: [PATCH v4 08/13] mm/collapse: call collapse_file() from
 collapse_single_pmd()
Message-ID: <ar-PTlqz0nq5Z90P@thinkstation>
References: <20260928100630.21870-1-kirill@shutemov.name>
 <20260928100630.21870-9-kirill@shutemov.name>
 <DLRF245BL299.14P8UWBF8SAJJ@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DLRF245BL299.14P8UWBF8SAJJ@nvidia.com>

On Mon, Sep 28, 2026 at 09:41:18PM -0400, Zi Yan wrote:
> On Mon Sep 28, 2026 at 6:06 AM EDT, Kiryl Shutsemau wrote:
> > From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
> >
> > collapse_scan_file() reads the page cache to decide whether a table is
> > worth collapsing and, when it is, calls collapse_file() itself.  The
> > caller cannot get between the decision and the collapse.
> >
> > Move the collapse_file() call up into collapse_single_pmd(), so the scan
> > stops at the decision.
> >
> > Two things change with it.  The writeback retry re-runs collapse_file()
> > alone instead of rescanning first; collapse_file() repeats the scan's
> > checks under the page cache lock anyway.  And mm_khugepaged_scan_file
> 
> So the new version is a little faster by saving a file scan?

On the writeback retry, yes: one page cache walk less per retry.

But that path is MADV_COLLAPSE only, after a dirty page sent the first
collapse_file() back and the writeback has run, so it is rare and the
saving is small. Not measured.

The scan rate change is in the next patch, where a refused file table
no longer costs khugepaged a relock.

Not measured on the file side either, but it is the same shape as the
anonymous scan, where the relock per refused table was most of the cost
of a pass over memory that is already huge.

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
