Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9A0C2F8EA3
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 08:44:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791189856; cv=none; b=Cuy7qkszcem8Xp4R/nQCxuSR70j0tojCFQmXB5GxhwrjJ6clMlR5e6b9Q/tibJ9AIfAlR2oxA6FO5lDNqBy+JbdJCAxFmvitR1aa4r69SY6QrzdxJsMWhyM5r95p2bnd7WvRkFz9Uu4pPcw7ga0pJDd4gp56MHQcBB+SdarVMdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791189856; c=relaxed/simple;
	bh=M7NmYC/Iylm9myghHwqILim55SAUt9QrM+UZYk0eJlw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qVwP1qxJTjosEsuvx8usPiKKV0YACzO72p/Czsoh+0y9GBOLtihT7CPkqmOXyw7yBI/zW6dfjlX92T1VLbCLD2DfZ42ZBK7PgX/c7CvMA+tfh5kacrtP6qM5d1j2DiES7efCXJzr1KLWcb1flhHgrQQ5icZrpKziIzMW3bY1jl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id DE97468BFE; Mon,  5 Oct 2026 10:44:09 +0200 (CEST)
Date: Mon, 5 Oct 2026 10:44:09 +0200
From: Christoph Hellwig <hch@lst.de>
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
	Christoph Hellwig <hch@lst.de>, Chris Li <chrisl@kernel.org>,
	Kairui Song <kasong@tencent.com>,
	Kemeng Shi <shikemeng@huaweicloud.com>,
	Nhat Pham <nphamcs@gmail.com>, Baoquan He <baoquan.he@linux.dev>,
	Barry Song <baohua@kernel.org>,
	Youngjun Park <youngjun.park@lge.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm/swap: submit the last readahead batch before
 unplugging
Message-ID: <20261005084409.GC8692@lst.de>
References: <20261001085730.2029773-1-alex@ghiti.fr>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261001085730.2029773-1-alex@ghiti.fr>
User-Agent: Mutt/1.5.17 (2007-11-01)

Looks good:

Reviewed-by: Christoph Hellwig <hch@lst.de>

