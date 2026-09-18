Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EA334E535B
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 12:29:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789734573; cv=none; b=Ht+sKeGLIXy1WSmjS53WIU8eGkbOSwCT1lwe53eVqBwTMfY2TZvZ1m3uUHeHM0vvmCr6PZYbMkaAotzy1Qxu74Bqo4izCU435PTzEnSOEKYpt/3CVVjT9wW5cjA17dIo69Qih0e7OTubq0qwC2py4emu4hfkJXS2qvjwnhJNOWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789734573; c=relaxed/simple;
	bh=M7NmYC/Iylm9myghHwqILim55SAUt9QrM+UZYk0eJlw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ozZZoy260cnTB95eVEK/pmMnKyF4IMo6FdQ+/IZuVrwQ+ApGtQzT8l1cRo/FL0YMATY+Z5U+3ebS4PiYTlnBQmUxDMxECzmnxCl4eu0OLtwZN/motVcGWWUI9EfH/sGsSbH0z8fnqFWP1xvpUhpRETaTmaFJrTdJKdDxYZrcmD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id 50EB868BEB; Fri, 18 Sep 2026 14:29:27 +0200 (CEST)
Date: Fri, 18 Sep 2026 14:29:27 +0200
From: Christoph Hellwig <hch@lst.de>
To: Daehyeon Ko <4ncienth@gmail.com>
Cc: Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>,
	Chaitanya Kulkarni <kch@nvidia.com>, linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] nvmet: pci-epf: reject too-short SGL segments
Message-ID: <20260918122927.GA17028@lst.de>
References: <20260915035123.3792935-1-4ncienth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260915035123.3792935-1-4ncienth@gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

Looks good:

Reviewed-by: Christoph Hellwig <hch@lst.de>

