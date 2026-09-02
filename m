Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DEDD242D62
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 13:33:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788356008; cv=none; b=ugbGF4ZEYca99U1/MfefrtWbK1JPI+876ltfERLUd1eyXKwgzwIvWTD8beqmeFKlE4x0anwWmRR3KzrJ83kSYJf9MUYMs8CIR28P+MfiganHR5kkaNriW5/+8rLEuBrBT8mg5qrS+gO9LN1Mfd41huZLNUQa3AAN3N7IeXjHHPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788356008; c=relaxed/simple;
	bh=M7NmYC/Iylm9myghHwqILim55SAUt9QrM+UZYk0eJlw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tM3dKbRpyxGMV2riSKIcE2gsy5ao3uN7kjSjjrSToL53ZHqf14aI+wuQs5CEZE8YP7u82JopmAzXLS9RL7SNRVl2KI7N9iqZEOmshvPuiL7NJRr+tXMUHltXm198YhIFFyDaeczRw2o2yvrWmN9mLwJp0KRLGsGtJofIKVZ2vcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id 3001B6732A; Wed,  2 Sep 2026 15:33:23 +0200 (CEST)
Date: Wed, 2 Sep 2026 15:33:22 +0200
From: Christoph Hellwig <hch@lst.de>
To: raoxu <raoxu@uniontech.com>
Cc: axboe@kernel.dk, hch@lst.de, kbusch@kernel.org,
	linux-kernel@vger.kernel.org, linux-nvme@lists.infradead.org,
	sagi@grimberg.me
Subject: Re: [PATCH nvme-7.3 v3 2/4] nvme-fabrics: add helper for owned
 string options
Message-ID: <20260902133322.GB21167@lst.de>
References: <B1A2864319EA3B6C+20260831070557.631487-1-raoxu@uniontech.com> <9910C0FE65DE86BB+20260831071105.638107-1-raoxu@uniontech.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9910C0FE65DE86BB+20260831071105.638107-1-raoxu@uniontech.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

Looks good:

Reviewed-by: Christoph Hellwig <hch@lst.de>
