Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74BB3282F26
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 06:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789973958; cv=none; b=RCQ2r9O0cToUVsz1h51X7Z/Ha49QDhI5sr1M3OHmENDRxTwfyIoe6bpiNZ5XK8WCWKl1dUJ0gmpC6mcSls1KJ2WobHmRKt4GHBHsppD3+DGPx9BTjvbrWrMoVx8nZ3cFUgczwVFWlY4+U6xoYzuf1xyYsgXvOOVn7W4UQYamDkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789973958; c=relaxed/simple;
	bh=M7NmYC/Iylm9myghHwqILim55SAUt9QrM+UZYk0eJlw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IifhnFw/hYLRvvHK5sP2jenYodutdVj5JkjcU9QNIy0CCzAlLNRYrlFy91BjMNe5C9W4u6trBGg8jR72boTyDenmXsI2/YpcyZU9Pf4Qy+ghQrQgK6bc1edUOzR89O7qcYLrjrv9S+4Bnbi1kqH4MpVmwq+jnLnNktV3+bIPZLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id 6C0366732A; Mon, 21 Sep 2026 08:59:12 +0200 (CEST)
Date: Mon, 21 Sep 2026 08:59:12 +0200
From: Christoph Hellwig <hch@lst.de>
To: Nilay Shroff <nilay@linux.ibm.com>
Cc: hch@lst.de, kbusch@kernel.org, sagi@grimberg.me, kch@nvidia.com,
	linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org,
	gjoyce@linux.ibm.com
Subject: Re: [PATCH v2 1/2] nvmet: defer setting ns->enabled to false in
 nvmet_ns_disable()
Message-ID: <20260921065912.GA14070@lst.de>
References: <20260918162736.802665-1-nilay@linux.ibm.com> <20260918162736.802665-2-nilay@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260918162736.802665-2-nilay@linux.ibm.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

Looks good:

Reviewed-by: Christoph Hellwig <hch@lst.de>

