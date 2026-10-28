Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.95.11.211
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793198184;
	b=lRVOD4rNRM+OC1Ozi03FiWo19Mujj2eVnhDN4KodS6Q6yEE0sbHBhVjA1l5tSyia5FRQ
	 tTbT62MCo4y2phbjO/cmqPFR6El6Qv5X8HaTu3j7QJ+BsoxK2jsvHYGNfUnXWtbabMfoG
	 0xUe3OAqR0RLNsZRFPnHQq+Pk1CBPpry1Y6mBdHSzdGa4/jY14vJPQXbwnUgws/+7UccQ
	 4TZblY1ryP2y6XZlKBGKVjGCUrs7UBtNNzQlOUbSkXmpTB/gjwu6yvTcsDsQ0OIVq2rp5
	 XInyLVIKNHRcq7fladnR3bvfJ+xwyxGiqE+S+6ynmJB9sZoqYtbwLUh/2S38++bk7WQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793198184;
	h=DMARC-Filter:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To:User-Agent;
	bh=M7NmYC/Iylm9myghHwqILim55SAUt9QrM+UZYk0eJlw=;
	b=iA/TjbTCtSI+z0qNYJhqc2D3oRARLveSNztGrJx5CkNvY4vFOlvT0EhaPI2eCLLhEJe0
	 TJfV92wBKCATz5s6NDa5WbYniOuMKdx0EhFO5TbWELjLBZ+d2eJmhzkgXz5g0s9Vme29h
	 Fd2aeExT72vstFYp7o1pYraPR6I0BFCT2Rtllv7c5zadSjCFefMmc2NKm+pRcoZbkSTET
	 W/kix0ozURpb5+dJrvc0DSf3p1NAxaoH3bPt4YKpvLvJ9RVDq1HfKxfuXZphenFPzhOcv
	 W/LSsBuTCWYJngbDa9eWtyUfa2WwwWgtBPETxgA/ndZmvDkKe8BC14JpNSsjgVRE0pQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lst.de;
	spf=pass smtp.mailfrom=lst.de;
	arc=none smtp.remote-ip=213.95.11.211
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5275060A2611;
	Wed, 28 Oct 2026 14:36:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5275060A2611
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id DB83D68AFE; Wed, 28 Oct 2026 15:36:18 +0100 (CET)
Date: Wed, 28 Oct 2026 15:36:18 +0100
From: Christoph Hellwig <hch@lst.de>
To: Yingjie Wang <1075151112@qq.com>
Cc: linux-nvme@lists.infradead.org, kbusch@kernel.org, axboe@kernel.dk,
	hch@lst.de, sagi@grimberg.me, kch@nvidia.com, hare@suse.de,
	corbet@lwn.net, skhan@linuxfoundation.org, rdunlap@infradead.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] nvmet-tcp: validate the TLS handshake timeout
Message-ID: <20261028143618.GB13429@lst.de>
References: <cover.1793188633.git.1075151112@qq.com> <tencent_39D5138228F932E024F79FE1733CC8CDAA05@qq.com>
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
In-Reply-To: <tencent_39D5138228F932E024F79FE1733CC8CDAA05@qq.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

Looks good:

Reviewed-by: Christoph Hellwig <hch@lst.de>

