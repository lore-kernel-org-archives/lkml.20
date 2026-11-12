Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.95.11.211
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794518323;
	b=K2mukot7CyLn+1+x8C0BHjVLxF1xHVCBZ8GNllv/of3hVd1rgf16FDcqEGJ4dNaPcOD1
	 gk0a1czaW7uy76fQze0JemGOvbvXJmDba4VJTQJ28CP/UtrEitXPKeRAKAdfIIcKfpqOc
	 dTGLQ3m4CcOfaiiaNqnb6DcasWwcn7VuXA2RQRleP4aLzmGcaaT1Y+xYnO7lGw5rC48EF
	 lVj6/LhzT/RmBlvjtbVzXCMewkLFgMp7bscGqw2vC2acz1ZcMQqCEJ7jVFbGMhTgbo9U/
	 Dmqv+nTbUWir7OviNtHnwsBep38wqUrjHnSJHxhbSIJP3nOx3xT1zzcoUq1vZ29AhKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794518323;
	h=DMARC-Filter:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To:User-Agent;
	bh=M7NmYC/Iylm9myghHwqILim55SAUt9QrM+UZYk0eJlw=;
	b=HwGHu0fUfB0xblC99td1u20YE56BDwq2cTHv1Ozs/s8W9ccVbSdSUw9FBE8BndKVCkuH
	 CcZMhbtWBt2+fsqydDhY0acy6snqqk66oEByNJQlP0l6qLvl5c0joE453tRuUKyiiwYGi
	 dupMKUKwae5t6SdUsBGMY6IcCpZ3CEZnbeBi1FVTzL0h1d6YDLUofPJhdRoKkMmZlJ9DS
	 CCjyV6ZqrKajzwDPq8cOjgm8ocB40T0cSq1igQoUXjoar+HsInDoqlN1HoRGBvH48kURr
	 sHrhyB6twNGsPmt5/xZ7k3k4HUd87CecBCWsYEJmQ0hsG2Kzt/Y4mFvcDhns2BIYhmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lst.de;
	spf=pass smtp.mailfrom=lst.de;
	arc=none smtp.remote-ip=213.95.11.211
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 102C3606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 21:18:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 102C3606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id B9C1368D0E; Thu, 12 Nov 2026 22:18:39 +0100 (CET)
Date: Thu, 12 Nov 2026 22:18:39 +0100
From: Christoph Hellwig <hch@lst.de>
To: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
Cc: hare@kernel.org, hare@suse.de, kbusch@kernel.org, kch@nvidia.com,
	linux-kernel@vger.kernel.org, linux-nvme@lists.infradead.org,
	sagi@grimberg.me
Subject: Re: [PATCH v2] nvmet: reject invalid write-protect feature values
Message-ID: <20261112211839.GD11315@lst.de>
References: <20261109135536.2772-1-sreekuttan2156239@gmail.com> <20261109142428.2612-1-sreekuttan2156239@gmail.com>
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
In-Reply-To: <20261109142428.2612-1-sreekuttan2156239@gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

Looks good:

Reviewed-by: Christoph Hellwig <hch@lst.de>

