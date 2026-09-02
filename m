Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8A5D46A601
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 10:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788345958; cv=none; b=R8yQuH29jgTg9ZEOJp+OXGhfRWB+4nU4SZKQrJJOImoL09mNDLHFAubaR3VlnWo5k4qvw/2xmnPCY4lK5OD6Gum1r4gdDYyDd5ArlROA1z+BeRWVClr6SGGU5KXnDRAO5etuuDdJElsBK4mSRQRUVvhTxf9Q4QV6SiwB3YQjToM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788345958; c=relaxed/simple;
	bh=M7NmYC/Iylm9myghHwqILim55SAUt9QrM+UZYk0eJlw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KVB4cg2yAnS5WERtqFIAgl1ipPb/tQVdCiMBTV+li9uFOxkG/HNcsr6tLsS0HO+75S/EQWZVHHivlnbsISEsGv+UVdtEIm4k7W/m10kwN8AOuDkWrbedGVOYjBWmStZtZNEGtjZYU3x0MNdRi1PDRg1/8TCedVjB5ezTvm4XhCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id 890BE6732A; Wed,  2 Sep 2026 12:45:44 +0200 (CEST)
Date: Wed, 2 Sep 2026 12:45:44 +0200
From: Christoph Hellwig <hch@lst.de>
To: raoxu <raoxu@uniontech.com>
Cc: axboe@kernel.dk, hch@lst.de, kbusch@kernel.org,
	linux-kernel@vger.kernel.org, linux-nvme@lists.infradead.org,
	sagi@grimberg.me
Subject: Re: [PATCH nvme-7.3 4/4] nvme-fabrics: add helper for DH-CHAP
 secret options
Message-ID: <20260902104544.GE8206@lst.de>
References: <29BB44C32FF06823+20260821062142.1932160-1-raoxu@uniontech.com> <A5B62A1BF62A33C2+20260821062545.1937266-1-raoxu@uniontech.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <A5B62A1BF62A33C2+20260821062545.1937266-1-raoxu@uniontech.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

Looks good:

Reviewed-by: Christoph Hellwig <hch@lst.de>

