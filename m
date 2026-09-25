Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96FF53E3D9E
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 09:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790327248; cv=none; b=mnVoio6aB0XbIHxyNC0bHM2vedQRVxalbZR0q2V5MCtx6hDr6PlCC0nOJx39eiKQ66+rMg/OZFMLtcrSqkFdbYmEIUX1GIkwSWIdA9rulsNPJpHnZQ2bt4JFakEipc3n4CC3BMD+biRwLUinWQbF6/9T0uzF610Hbxb5bIUqUX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790327248; c=relaxed/simple;
	bh=2Kg/2fVUrR/FnWTt/4h0ndGGym/81OnE+7MHDvLh0IY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c1SrGjWX52cIXB3WQgrngKIsEWgYJ+ORwuFvVLtSpXlbwj0XOId/oK3wWT53wHSUsygIWIyhQ+XfQfIHlIYePa/mt8yQYx4oVeHuMB0RhRY/BCxVJxR10+WE+4xAaqMggfY8j1DnpbNFYVvghHlgZy0bb4xDz/VDVDqkovSaYBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=Jm2UAcpx; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Jm2UAcpx"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=KCyV94oyn7UgoSfgjaYpx+E0zyZIPbxzlpyxYGj8GX8=; b=Jm2UAcpxToTAxr+Svp1O2pM4D2
	ctatdOQnUip7JuJmrAlj1RMH8E1zlPVFjc8sc3mciWWVQmMLyYIHqH6Dt3Ybcu1hVdMkiUxVlKcZm
	vsaiUPmIHUutP2/fkDKowSq04+IjHyu0g+bD0oub1gDqlD1X//vJV2jAxVBwKQ0T7SrSIgZmEuLMA
	TWrMDsdz+q2WtqoY4X5ZhkOHQ+YepDxsc64ieSY1Z6kAa6eKz8J5zGgZ7jQkjjGS9x0Q9gOKNdwBI
	gwaQUDi8N7wC3NC23QU+ZP6EXyWXQMEjCMzpNMlGq0CnJo/u8+RkdqU/1TVMrE2UJNuYHEwRG7tOh
	OmV4cLhA==;
Received: from hch by bombadil.infradead.org with local (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA1ts-0000000CyOj-3qzm;
	Fri, 25 Sep 2026 09:07:24 +0000
Date: Fri, 25 Sep 2026 02:07:24 -0700
From: Christoph Hellwig <hch@infradead.org>
To: mpenttil@redhat.com
Cc: linux-mm@kvack.org, dri-devel@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	David Hildenbrand <david@kernel.org>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Leon Romanovsky <leonro@nvidia.com>,
	Alistair Popple <apopple@nvidia.com>,
	Balbir Singh <balbirs@nvidia.com>, Zi Yan <ziy@nvidia.com>,
	Matthew Brost <matthew.brost@intel.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>
Subject: Re: [PATCH v15 00/11] migrate on fault for device pages
Message-ID: <arY5zKsLuf7f_EYw@infradead.org>
References: <20260924065313.899730-1-mpenttil@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260924065313.899730-1-mpenttil@redhat.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

On Thu, Sep 24, 2026 at 09:53:02AM +0300, mpenttil@redhat.com wrote:
> Add a new flag to HMM APIs, HMM_PFN_REQ_MIGRATE,
> which tells to prepare for migration also during fault handling.
> For the migrate_vma_setup() call paths, new flags, MIGRATE_VMA_FAULT,
> and MIGRATE_VMA_WRITE are added to tell to add fault handling to migrate.

Who is going to use this?  The series seems to lack an actual user for
it.

