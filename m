Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0CEF371885
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 06:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789973466; cv=none; b=TCmvchnTa+kUnVur3FCqU3eWz8F5oyxsKeh+o7iHeybyl5tP9ITD4wbslF50BQEg9jVn+x1gef6s0zYMVQnlZZcjvUC79Jfqn6FQZBH/5K7Nc7yBY7sJ829ur+m669/D9va3tUB8UON4VSbThaPkp853xC+T23sfHwIlRQ+YVF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789973466; c=relaxed/simple;
	bh=M7NmYC/Iylm9myghHwqILim55SAUt9QrM+UZYk0eJlw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z8xh1Lh6Jbnsd/p5zpaW5FWY6ycKfG3EtKPUqtDpkLCrMzNOjixHMlM++lgE45WGX/Ldhi8PU9wQGUrgYYIbos9MjmXvT5dYLFQO+IRCMZGDgcgIhrWcSa+pE3K8zAuObwOYi480UNAj9eW7HDmpMGqaho98B0kMSbnD3LD8jPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id C2C3C68C4E; Mon, 21 Sep 2026 08:50:54 +0200 (CEST)
Date: Mon, 21 Sep 2026 08:50:54 +0200
From: Christoph Hellwig <hch@lst.de>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>,
	Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>,
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>,
	linux-nvme@lists.infradead.org
Subject: Re: [PATCH] nvme: use assign_bit() where applicable
Message-ID: <20260921065054.GB13667@lst.de>
References: <20260919130820.3041544-1-peng.fan@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260919130820.3041544-1-peng.fan@oss.nxp.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

Looks good:

Reviewed-by: Christoph Hellwig <hch@lst.de>

