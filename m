Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02ACE3ED132
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 13:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788355978; cv=none; b=grE7G0/rVr1ON2PGkzFdzG0s5mQDhIp9ciBEPzLwJgg4yMcBL/8+AAIkjB0GVTX/H8ByQg6L6/0yGBG1mjKvblSmHBewknlQH7bQAvjIJrfGtEsrygzg2j/ikmTNnDnqJiLfQTcKksZqSMtrUqIjejB1rIaXAySOyfH/x3bXx9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788355978; c=relaxed/simple;
	bh=M7NmYC/Iylm9myghHwqILim55SAUt9QrM+UZYk0eJlw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JK1z1YzQlU8Gdmxk0gABvRilyJmj+baJZwAXxMJeZBfBJB5+LWq7wKZwkksZCrFS04mCmvzEUUnJSST9e1RxYH4o8eytSfN1cxqWiL/6AqSNiwLOyibTPGrnNcxPWlZIPk4Qq/oBBA12+UExUCqabEGXmxvyABR2kG/wXaODYZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id CE8806732A; Wed,  2 Sep 2026 15:32:51 +0200 (CEST)
Date: Wed, 2 Sep 2026 15:32:51 +0200
From: Christoph Hellwig <hch@lst.de>
To: raoxu <raoxu@uniontech.com>
Cc: axboe@kernel.dk, hch@lst.de, kbusch@kernel.org,
	linux-kernel@vger.kernel.org, linux-nvme@lists.infradead.org,
	sagi@grimberg.me
Subject: Re: [PATCH nvme-7.3 v3 1/4] nvme-fabrics: separate option
 tokenizer pointer
Message-ID: <20260902133251.GA21167@lst.de>
References: <B1A2864319EA3B6C+20260831070557.631487-1-raoxu@uniontech.com> <67C2BD21B4A592D4+20260831071050.637726-1-raoxu@uniontech.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <67C2BD21B4A592D4+20260831071050.637726-1-raoxu@uniontech.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

Looks good:

Reviewed-by: Christoph Hellwig <hch@lst.de>

