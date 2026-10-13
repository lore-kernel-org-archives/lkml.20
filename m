Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA359502567
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 14:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791901762; cv=none; b=ixGxMIYKwDQh6Q1TSBhlfj7kqV1PBkhHr1ilVZYzL3XMPvyr/TEGrrQKjvPeEF8LgUoy3/Vsxosfzc9qNTkKD4VVf4wqOHbKjIvu1ZjoakHoS6z3Ml270PV8H0E1t729CoqPocVXFWQPWigkY8IbMkUX3k5LP3N/rSx/tNcFYP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791901762; c=relaxed/simple;
	bh=M7NmYC/Iylm9myghHwqILim55SAUt9QrM+UZYk0eJlw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TJMbJK3UacDDa6xeCTNLC7EC/NohCIMc0a8yv9GozqbSd1XUU/Tq0TFlIZ51iqV3d86SaipTWAGAlNXSPlBTu6ZOYeTJwgoGBGUESc/LWyzMwvMv676DnppgZ9NAiHdgHF4u4FZxgv9A0+v8ZtxRsU5iVYm4Qrfki0ViaXZ3VvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id C7FDC227A88; Tue, 13 Oct 2026 16:29:16 +0200 (CEST)
Date: Tue, 13 Oct 2026 16:29:16 +0200
From: Christoph Hellwig <hch@lst.de>
To: Krishna Iyer <kiyer@crusoe.ai>
Cc: kbusch@kernel.org, axboe@kernel.dk, hch@lst.de, sagi@grimberg.me,
	linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org,
	nilay@linux.ibm.com, hare@suse.de, saravanand@crusoe.ai,
	sjpark@crusoe.ai, Hannes Reinecke <hare@kernel.org>
Subject: Re: [PATCH v5 1/2] nvme-multipath: fix path state evaluation for
 failfast and ANA
Message-ID: <20261013142916.GA15192@lst.de>
References: <20261008141407.22992-1-kiyer@crusoe.ai> <20261008141407.22992-2-kiyer@crusoe.ai>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261008141407.22992-2-kiyer@crusoe.ai>
User-Agent: Mutt/1.5.17 (2007-11-01)

Looks good:

Reviewed-by: Christoph Hellwig <hch@lst.de>

