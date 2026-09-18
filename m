Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5BF94E9C0E
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 12:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789733313; cv=none; b=p7uz/19o/PPKhDlEDGTkQkecw1fULg+7xaJYO0HCoCdpUWmr4hk+DmNM9TwrVEpUXL+LC0HCYa6IFPvyc98ZhLV8pCoLGhHmigx9AlIwlbhP1fBGIrkD1bY8AHwSeBeaw947niKYV6dRR3aG8MA5rdVt8gB1Q5VFjNNpaAPDYnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789733313; c=relaxed/simple;
	bh=IyHQhhtBW/xXuMdUpr+WJrwDcpG8BeKtRMRvIs7SLQk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KztVY3dER1aWPekwx94uHpqnk2JMg+ck77CGRmqXAMBgLu7ppv02bBVJ1CuXKZq6KgOv+E+W1P8OzKrjzjfmWV+npPRH/IDPucdWOpv4hJ6G5fLC+LWo7/uVgxfiVgq1tjUOhHPIxX9w57y5xWkXsvQhQvSbsZ/o0vGa136QOZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id 1D0ED68BEB; Fri, 18 Sep 2026 14:08:26 +0200 (CEST)
Date: Fri, 18 Sep 2026 14:08:25 +0200
From: Christoph Hellwig <hch@lst.de>
To: Nilay Shroff <nilay@linux.ibm.com>
Cc: hch@lst.de, kbusch@kernel.org, sagi@grimberg.me, kch@nvidia.com,
	linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org,
	gjoyce@linux.ibm.com
Subject: Re: [PATCH 1/2] nvmet: defer setting ns->enabled to false in
 nvmet_ns_disable()
Message-ID: <20260918120825.GA16547@lst.de>
References: <20260916151012.3702896-1-nilay@linux.ibm.com> <20260916151012.3702896-2-nilay@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260916151012.3702896-2-nilay@linux.ibm.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Wed, Sep 16, 2026 at 08:39:59PM +0530, Nilay Shroff wrote:
> In nvmet_ns_disable(), keep ns->enabled set while existing namespace
> references are being drained, so namespace configuration remains blocked
> until all in-flight I/O has completed. Set ns->enabled to false only
> after the namespace references have been drained and the namespace
> device has been disabled.
> 
> Since setting ns->enabled to false is deferred in nvmet_ns_disable(),
> use the NVMET_NS_ENABLED XArray mark in nvmet_req_find_ns() to
> determine whether a namespace can accept new I/O.
> 
> Similarly, use the NVMET_NS_ENABLED XArray mark in nvmet_ns_disable()
> to prevent concurrent callers from starting namespace disable.

This does look sane, but have you looked at profiles if getting the
xarray tag might touch a lot more cache lines vs the flag?  It might
make sense to turn enabled into an atomic bit mask and just have two
flags in there.
