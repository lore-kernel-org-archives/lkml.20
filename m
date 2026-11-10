Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794341983;
	b=nOfIl6tnPis2Uaz+XZAR2HzDg3O/bDxCj1+vl3IVNlONMv+Kn6snxq4t0ULta+aE394T
	 +XlpT5L+dbfiG7iOyet/1F26hFcbd+8UKdr7mkyLAbXjf8e2VdNB4v3P4Fyq2Oek6OX2I
	 bTyc4s8DS7HGkGNpWTJMASXTiaQpu22pJaQnkPRDneu9fYYy20+evbCZPJfyMa/OyiNeq
	 K+QZRh5dBrXmnrW/YR9MBawrwDC2JagNhdj0zQcgoGK3IwVWriJEtjUvHwnqrhsoIZM2A
	 4ZIDi48cgszyoAZ0rsNtP4q1bxlwdAjk9i/6u5BjqJEQtZeaMa5ZUSXw/RuFPdHM8YQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794341983;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=Rqy05NhlUV5BjanU34c5iOE+GBzU8rBDGQIQzRYoUdc=;
	b=cvqdQsHec/B0YKTWwNK5xQ5ltfCgC+RDu3a0biiHxYfcLWC4T8sp9quLO6qAWj/2RUtq
	 DgShRwRxu7h8HNOQYn8RhEEIh5+e/xrhRNnN37qH6UkVgN7TpqicufFPuKjkCf8bjZLDq
	 vK19ifJlH2OgouGLXXF4QRzSehV5FRCmFLABWvrYwPMPYvep3WRtbq1lwCPZj/I8e3iF6
	 UBxc1o4vGABNoxilX9HLt4vyTtmuBOMS3MdgfNRA1X43mHhWNVqOBXPl5lbtm3tosCnx8
	 uX+5qcnLXfeB2g6u5dN2S/CTf2ziuRhgSPQHOJAVZ55o6THr1bPPfWDiyUJnDuMQh4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=K1lUGFZH;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCC8E606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 20:19:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CCC8E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=K1lUGFZH
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AD0591477;
	Tue, 10 Nov 2026 12:19:37 -0800 (PST)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C22FA3F85F;
	Tue, 10 Nov 2026 12:19:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794341980; bh=YcUtf8s3nEe4c07U3pzR0x25fAU/uZ4ZSOAodtFGIC4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=K1lUGFZHGwG996BA9mqSWjm7RkxTjcA7UKIzyNKKoscn95BhhfZEQevkP0Ts6799j
	 prdxvNx6p3ReV9oKcpz1q/0x7bK/EGQhE0O92mz9H5+v6yV2aZOAW9f/eyGD2SsAJD
	 AAUHLa6OpYFXKbl5a9W1rpf3d9isIhoWnNuuE05Y=
Date: Tue, 10 Nov 2026 20:19:36 +0000
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Rik van Riel <riel@surriel.com>
Cc: "David Hildenbrand (Arm)" <david@kernel.org>,
	Yeoreum Yun <yeoreum.yun@arm.com>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, Jason Gunthorpe <jgg@ziepe.ca>,
	John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Yuan-Hao Hsu <aa9736195201@gmail.com>
Subject: Re: [PATCH v3 5/6] mm: gup: introduce gup_unshared_pages()
Message-ID: <avN8WISVUF7u4bXl@e129823.arm.com>
References: <20261109-refactor_gup_fast-v3-0-2aaef02df0e1@arm.com>
 <20261109-refactor_gup_fast-v3-5-2aaef02df0e1@arm.com>
 <7627c0d90188b581e7740bf8d17c8dd07b460f89.camel@surriel.com>
 <avLqwIWHa5CAbHO2@e129823.arm.com>
 <aa227fea-d22b-4c0f-bd11-bf9ec36b0767@kernel.org>
 <699499e46ace0875fd0f32052399e665c8209ea9.camel@surriel.com>
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
In-Reply-To: <699499e46ace0875fd0f32052399e665c8209ea9.camel@surriel.com>

On Tue, Nov 10, 2026 at 02:21:18PM -0500, Rik van Riel wrote:
> On Tue, 2026-11-10 at 14:04 +0100, David Hildenbrand (Arm) wrote:
> > On 11/10/26 10:58, Yeoreum Yun wrote:
> > > Hi Rik,
> > > 
> > > > On Mon, 2026-11-09 at 12:32 +0000, Yeoreum Yun wrote:
> > > > > This is preparatory patch to make gup_fast_pte_range()
> > > > > batchable.
> > > > > 
> > > > > Introduce gup_unshared_pages() to count consecutive pages
> > > > > within a
> > > > > folio
> > > > > that do not require unsharing, and use it to implement
> > > > > gup_must_unshare().
> > > > > 
> > > > Could gup_exclusive_pages() be a better name?
> > > 
> > > Yes. This seems much better for me. I'll change it in next-spin.
> > 
> > Not quite the right semantics. For pagecache folios we simply don't
> > need
> > unsharing in MAP_SHARED VMAs. That does not imply that these are
> > exclusive.
> > 
> > So it's all about "number of pages that don't need unsharing".
> > 
> gup_no_unshare_len() ?
> 
> a little awkward sounding, but it describes
> what it's doing?

Hmm, Wouldn't this name be semantically much the same as keeping
the existing gup_unshared_page(), since both essentially convey that
no unsharing is required from GUP's perspective?

Anyway, naming is always NP-hard problem :\


-- 
Sincerely,
Yeoreum Yun
