Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.95.11.211
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793961011;
	b=jqNcKqXzWBM/x0earc1WKRH+bOHGNpJeBbakWX1r6HFCphVswcCHSEbtkK9Mi8zLaiYN
	 MQ69tpT48SOKosSGLarVYtYNQyI4UsMgFPAPB/qR8tgSUlrM/bmwdY5X2qpa6yKn3kVwk
	 i0Kqb9u1mB8d6J43OfwxWp2cD10B+Hc3hJgwfMwIFTvWVu6qyAHcOP8z0vbEvD3uXm0ED
	 AxtgTVHCo2NpidJCv2uSJlwTFwzxqZvIQaQQc6V3SPLpKO4GliRweXuNaTIYCicqMqQVT
	 GfMUFMup7luMUvMr5uzX+qGCtEEJU315t3YChxGL9b9UZnO4z33Gu83lJM1G55nGkgw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793961011;
	h=DMARC-Filter:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To:User-Agent;
	bh=M7NmYC/Iylm9myghHwqILim55SAUt9QrM+UZYk0eJlw=;
	b=a3Lk0LuAkMuBEIL8LmSlIJoa0+UXT9jiOq2VpAd4jCH8PNVR5vBh9lXL3WzQ4R1mCS8h
	 khxMzPWQq4hVXAixSZZ/tKqfJyamx3eSVfpCTC1GeE77yiR+VZ33dOYZX+N1frdoU7yPY
	 9jKEx01lH1cVasfgogdYS/xUG9e2DJiOUrFh6/HjyqH9qB8n1Xv+qZJjv7KDy+TXfPl2m
	 zLqCMbP1NoeDGZvKhOjGvGYSAaddXVbHiUlqDNTQ8qFUazyoZGr6KdbZN7aSAQosDwJBI
	 GliPW1vpEM/27KdaEDqrEYjqYBEvuYUOtObXblDW6HP0HU+A9sv7lZtB071vcsVPl7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lst.de;
	spf=pass smtp.mailfrom=lst.de;
	arc=none smtp.remote-ip=213.95.11.211
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E21E606A32C
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 10:30:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E21E606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id 8A76E68BEB; Fri,  6 Nov 2026 11:30:06 +0100 (CET)
Date: Fri, 6 Nov 2026 11:30:05 +0100
From: "hch@lst.de" <hch@lst.de>
To: "Smith, Kyle" <kyles@hpe.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-nvme@lists.infradead.org" <linux-nvme@lists.infradead.org>,
	Keith Busch <kbusch@kernel.org>,
	"axboe@kernel.dk" <axboe@kernel.dk>, "hch@lst.de" <hch@lst.de>,
	"sagi@grimberg.me" <sagi@grimberg.me>
Subject: Re: [PATCH] nvme: Fix potential gendisk leak in nvme_alloc_ns
Message-ID: <20261106103005.GB5391@lst.de>
References: <DM4PR84MB1590C08CB556D28CBA707E74A0772@DM4PR84MB1590.NAMPRD84.PROD.OUTLOOK.COM>
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
In-Reply-To: <DM4PR84MB1590C08CB556D28CBA707E74A0772@DM4PR84MB1590.NAMPRD84.PROD.OUTLOOK.COM>
User-Agent: Mutt/1.5.17 (2007-11-01)

Looks good:

Reviewed-by: Christoph Hellwig <hch@lst.de>

