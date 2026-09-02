Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0C7325782D
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 10:35:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788345317; cv=none; b=ueBBjugpph+kWr2X9TZZYtBbO2OXcsJjjF1QLmv/fj2DT0Z26/sFjCoNvqiux+TW6vcZxwKJQaZfnFoVFwktirFwLDp7LCySvoj36Q2N7LklYAp4SACz5LJd7v8BnrbVatzdsCogCcSXKfVJf/q/yEiMEB3TyR+z+Ok/1LwO+bM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788345317; c=relaxed/simple;
	bh=M7NmYC/Iylm9myghHwqILim55SAUt9QrM+UZYk0eJlw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q260b6MIZmSA8qg0QZfz0ryLnuE73hFLTDfJ4KQ2QTIszjox8tM8pWnunEnuvgeZirQStx5789cyTNZDSlDEViqXz81hG6NxszA3C0ZcMFyHBe1WT1V01wcU2D9Qu2qn6uIrk1TM2g3dJzAqS/ziql81UwzYuEnwIPqYjbWKv54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id E352368C4E; Wed,  2 Sep 2026 12:35:08 +0200 (CEST)
Date: Wed, 2 Sep 2026 12:35:08 +0200
From: Christoph Hellwig <hch@lst.de>
To: raoxu <raoxu@uniontech.com>
Cc: axboe@kernel.dk, hch@lst.de, kbusch@kernel.org,
	linux-kernel@vger.kernel.org, linux-nvme@lists.infradead.org,
	sagi@grimberg.me
Subject: Re: [PATCH nvme-7.3 1/4] nvme-fabrics: separate option tokenizer
 pointer
Message-ID: <20260902103508.GA8206@lst.de>
References: <29BB44C32FF06823+20260821062142.1932160-1-raoxu@uniontech.com> <646894DADB73C91B+20260821062457.1936240-1-raoxu@uniontech.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <646894DADB73C91B+20260821062457.1936240-1-raoxu@uniontech.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

Looks good:

Reviewed-by: Christoph Hellwig <hch@lst.de>

