Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A65CD4334C4
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 14:03:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788357796; cv=none; b=noLyd6nAoMpaLxGKD4VdRxtpY9m8InEBHrVCYFoBtO2VYsWK+2MBQShD+Xwtmsrxrv5CsUxmln1/UCiBBjHlWLhFKqhLLnEbkW4+2SNFf/RJ9qtPhoJ7+PF8TZRC2PZHQqXrMRFsQgPf7kc5HFed5rMbhckNTetkKPT3dB7iUks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788357796; c=relaxed/simple;
	bh=M7NmYC/Iylm9myghHwqILim55SAUt9QrM+UZYk0eJlw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MWSXk98L4yVNDwJhqsEE8RiUtHreZcxJZHd2j8l4+t2gmYO674Nr5XPYC9drbLUYBvvXwvebh/9EewXILlU5908n23k5F9rYvKWYryonMuzX//3xKX8GjbbD7FVU26HDrCIzDMjdZhuTjSf95lSxm933vmDgrA7uJlhJ0qAW2WA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id DD2C768BEB; Wed,  2 Sep 2026 16:03:09 +0200 (CEST)
Date: Wed, 2 Sep 2026 16:03:09 +0200
From: Christoph Hellwig <hch@lst.de>
To: Seokgyu Choi <tjrrb0313@gmail.com>
Cc: Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>,
	Chaitanya Kulkarni <kch@nvidia.com>, linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	syzbot+f613f9f010ec98eb9d86@syzkaller.appspotmail.com
Subject: Re: [PATCH] nvmet: reject namespace enable without device path
Message-ID: <20260902140309.GA23598@lst.de>
References: <20260827075221.312935-1-tjrrb0313@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260827075221.312935-1-tjrrb0313@gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

Looks good:

Reviewed-by: Christoph Hellwig <hch@lst.de>

