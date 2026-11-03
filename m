Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.95.11.211
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793684232;
	b=rHQg47NTwd1itrVg/op77CTj89ADA+d1/pHXb4ic2zr0BrtnNzJd4KwWQMWjiVPS9OZ7
	 1fCXQvI6myxIHP6vJQZ7n0vC9d4Fz+jG/kM7bdHJgh86XL7S3D61GkNRkvzcYnXGn/XW6
	 fBVcV1+UbgHZfSvVnC6NXFI0zs+956u7ujZ8qh7V6BWou+MkKdO8t4O+3HU0n4Qsjo7md
	 2AZ+ats8FOD8J9TxnyHO35mKJtVu3rQj02g0dHoetVEfV5bvxsy7tQpFRrvizPLkNuWMi
	 BIQ9OrmSOL1Zt79NaDcMTJhHE645cIMs9wWQBmT/8kXwHdkKeA8tvSaapthmACwGg4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793684232;
	h=DMARC-Filter:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To:User-Agent;
	bh=M7NmYC/Iylm9myghHwqILim55SAUt9QrM+UZYk0eJlw=;
	b=ltXxuGTgqn5WhENz8u6rKaYqsBByYCdZHbYch+lUeTGH9TgPwhtzbRfxIvPvShstZSVw
	 iy06HW3JQIYgUt+i4czsSoVGFw9w55KbsHber81T2fUgwb6Xl6wbdAGXAn1MIJX6xYBf5
	 ag/hKtxalw1zCkuoMV4WlGho4brHQbQ4q8blQn5S2/geh00rWVS2Hu5vpDXtL8KsyBJbj
	 9NuIeL3mT/q9PcUA1v4rOQ9j9yTFNwTwup+rMMiSjIfh1slhav5IGIICX0AtYnXJLzJl8
	 8qE0pgiC90KWL0x8H3SzI32Td4GeUtM5fiyrK1nOmxhmgktKcCcPmUrqciv6RdqtEig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lst.de;
	spf=pass smtp.mailfrom=lst.de;
	arc=none smtp.remote-ip=213.95.11.211
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C440E606A324
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 05:37:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C440E606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id 83A3068BEB; Tue,  3 Nov 2026 06:37:06 +0100 (CET)
Date: Tue, 3 Nov 2026 06:37:06 +0100
From: Christoph Hellwig <hch@lst.de>
To: Yingjie Wang <1075151112@qq.com>
Cc: linux-nvme@lists.infradead.org, hch@lst.de, sagi@grimberg.me,
	kch@nvidia.com, kbusch@kernel.org, axboe@kernel.dk,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] nvmet: reject keep-alive timeouts that would overflow
Message-ID: <20261103053706.GE1382@lst.de>
References: <tencent_E7828EAC883D49896E2EDD4FCCFE653E9909@qq.com>
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
In-Reply-To: <tencent_E7828EAC883D49896E2EDD4FCCFE653E9909@qq.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

Looks good:

Reviewed-by: Christoph Hellwig <hch@lst.de>

