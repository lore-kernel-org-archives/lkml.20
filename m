Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86D7E30566B
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 06:59:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789973980; cv=none; b=CbLDZZ3gfrdRGC1TyrGfo6ZnKV+ChQK/uBvyfpH0LPvIpDb+FUTJivbe3+AtH7yTrl+5+ZT9U0YC0X/Ap9DX5zTKR4I6sWvyow1lifkIPLLjhxg+vgATb8u2KabfWgSeF3/rdSkhqlEORNwVE4/ShMY1FkNSRMWl4lXff5tiWKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789973980; c=relaxed/simple;
	bh=M7NmYC/Iylm9myghHwqILim55SAUt9QrM+UZYk0eJlw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eApjUmOVAFwgUlTSJsPkG62oapW1Vwywyd7srQw0kvKrGeXgMNeFFcIf4q4pKZcz2H7HIgQQDyg7mz7gB8AIB9mog00r1vzLRdwnus7UyYS8d0HmHEs3u/2ZwV24IpWC6x3joeXcr0PmSKgea4pN7pn3W7q0hVekZfsHWliG6Xg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id C70896732A; Mon, 21 Sep 2026 08:59:34 +0200 (CEST)
Date: Mon, 21 Sep 2026 08:59:34 +0200
From: Christoph Hellwig <hch@lst.de>
To: Nilay Shroff <nilay@linux.ibm.com>
Cc: hch@lst.de, kbusch@kernel.org, sagi@grimberg.me, kch@nvidia.com,
	linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org,
	gjoyce@linux.ibm.com
Subject: Re: [PATCH v2 2/2] nvmet: don't allow I/O admission after percpu
 ns reference is killed
Message-ID: <20260921065934.GB14070@lst.de>
References: <20260918162736.802665-1-nilay@linux.ibm.com> <20260918162736.802665-3-nilay@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260918162736.802665-3-nilay@linux.ibm.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

Looks good:

Reviewed-by: Christoph Hellwig <hch@lst.de>

