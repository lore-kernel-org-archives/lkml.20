Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794346032;
	b=xSZKRsqv31rRScG+P7q8vbbVZ562kfka3ECX3aMGkeFe3tWYoh4JARZFYjPA9lcC5Sqx
	 qeXdanc2oADPMzROwIux5lsZdtEGXO5VUx720X+sXO2dmxau9VQUhMPG5rFHjc9bHhSSq
	 o6GCKYfpiBYW0umztC7Rg57CNJkOtBA/svDwA+OUfhXWRkjeKa+AWYHt/+s6WnsCLvbi5
	 sE6yqywsNkJGJGLaJtDBnsMmuFFQdohiS3P77epX/sUaWz8Gm94IZHuR4yJUoEhN7dAf0
	 Jbw8a7WlEbdF+4R4dn5dsdru0njm2qkhgJlWSWyoJM3UnKecaGe5D+LD8/RSnRmkh/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794346032;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=5lRnygMPL37LT/U1h1GwWLM1wiQJoQWWISQxj/piPRc=;
	b=lYLqKpQdwfOPtiIpgcJr0vgxMA8+XQL5xOiRoXiCP6FRf/Z4Qi4TpxBlt+3f+wT+Qgee
	 yg4bJ1UICLLKw+9GCvrH+G3jzeoTldLAcWvuNIdus6janGgRql2n1kyAqzZOLLvH9rRq2
	 TksckTKeqLaZ1SPngO3cYp5k1ZOqWh4+u1X0XQbt9XTvrDv1redvxHLNLNjM2II9di/N/
	 JZWouhECFaJ/ze+cc26rhmfjAhL8cVYkn/HxSpLplwFldqIU19sEyx1y5bNoZiCzmpAgm
	 W8lCV+CjusG/jXazDxhj6WXfuhB/npQRh7RkfiPHKhvUvOyuXXaGZHu+ZkCLzh8gFVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=fqxpl+kR;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99E66606A320
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 21:27:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 99E66606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=fqxpl+kR
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B9A161477;
	Tue, 10 Nov 2026 13:27:06 -0800 (PST)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CD1F63F673;
	Tue, 10 Nov 2026 13:27:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794346029; bh=sxcPfql1N3xVcqWU8TH8w94Ji0cp6OS4jMxTRUR6E18=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fqxpl+kRaKkn+omwmLFy08Y6NXzhACs9nkKnj+Q8sJnDL6tsD3ekN7gX8l5qIWazX
	 W5YsZ046yWWnKh9+uEB7RzolyEq05SZrLjdpziAXUpV8fS2MvNyORawcRBocGduaIZ
	 ZOc1UTurMRsYhCgJW5pcfmrTtadb6szzQzh/CG4U=
Date: Tue, 10 Nov 2026 21:27:05 +0000
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Rik van Riel <riel@surriel.com>
Cc: Yeoreum Yun <yeoreum.yun@arm.com>,
	"David Hildenbrand (Arm)" <david@kernel.org>, linux-mm@kvack.org,
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
Message-ID: <avOMKWJe3wwNb2sW@e129823.arm.com>
References: <20261109-refactor_gup_fast-v3-0-2aaef02df0e1@arm.com>
 <20261109-refactor_gup_fast-v3-5-2aaef02df0e1@arm.com>
 <7627c0d90188b581e7740bf8d17c8dd07b460f89.camel@surriel.com>
 <avLqwIWHa5CAbHO2@e129823.arm.com>
 <aa227fea-d22b-4c0f-bd11-bf9ec36b0767@kernel.org>
 <699499e46ace0875fd0f32052399e665c8209ea9.camel@surriel.com>
 <avN8WISVUF7u4bXl@e129823.arm.com>
 <5db7a358c293393a93984ac3c3cc58e810edd75a.camel@surriel.com>
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
In-Reply-To: <5db7a358c293393a93984ac3c3cc58e810edd75a.camel@surriel.com>

On Tue, Nov 10, 2026 at 03:23:15PM -0500, Rik van Riel wrote:
> On Tue, 2026-11-10 at 20:19 +0000, Yeoreum Yun wrote:
> > On Tue, Nov 10, 2026 at 02:21:18PM -0500, Rik van Riel wrote:
> > > On Tue, 2026-11-10 at 14:04 +0100, David Hildenbrand (Arm) wrote:
> > > > 
> > > > So it's all about "number of pages that don't need unsharing".
> > > > 
> > > gup_no_unshare_len() ?
> > > 
> > > a little awkward sounding, but it describes
> > > what it's doing?
> > 
> > Hmm, Wouldn't this name be semantically much the same as keeping
> > the existing gup_unshared_page(), since both essentially convey that
> > no unsharing is required from GUP's perspective?
> 
> The function measures how many pages in
> this current interval do not need to be
> unshared.
> 
> I'm happy with any name, though.
> 
> I would really like to just see this
> code go in, so I can post my two
> GUP series on top, first the batching
> for the GUP-slow path, and then the
> series that allows access_remote_vm()
> and friends to work under the per-VMA
> lock.

@David, If you don't have any strong comments for original name
-- gup_unshared_page(), May I post next version with resolving other
comments so that Rik's series be posted soon?

Otherewise, gup_skip_unshare_pages() works for me.
-- 
Sincerely,
Yeoreum Yun
