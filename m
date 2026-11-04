Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.95.11.211
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793776491;
	b=oacGfDiwz7sJ4LSKrUaRU3Bw3c+K96iLzQ2NdSdiPfw+z+doS0IwoaVquYbta1Byn6BQ
	 RiK/GeXITkbor2mixoBXmzvylAO3/KTrQJr4ztdQ3jlmnP34hezi6RKSCnOVbaruEmLT5
	 MaLRn3vs44090r9eShW0czErSjyDNtyhzzmfXru5oXbDNvtSzVvaFBnYUVfok0FmcyG2u
	 H+QQjnJMpvlkOFe2cEuPdBbWLcDU7a8gkOKrn+jHi45H2KKKwb4olqu0uEs1xFLekMHMf
	 PrEouGyUIF0A9Ct1j6Yi940BkZu5v3Kwkije6pbwRTu9jyq1eXHFEB9fVw95uX3ngNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793776491;
	h=DMARC-Filter:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To:User-Agent;
	bh=M7NmYC/Iylm9myghHwqILim55SAUt9QrM+UZYk0eJlw=;
	b=YtLhkgSVZTMN6YI/9hiXeV5Ya7DyJzVnGk0eJzifQxYPqockEuwbKXTlPIoqZgP6Qwmg
	 epFyqcVz0CvKhyD3dEjN/GPUEQeq8TrVk9VDmQBvvtosRB8Vti1P3aJwBvYOrLKRB9MPx
	 +XGxY4dZfQdBgaT4sn28HEDG2hQgXaeWWaGcaVqyeYvr/RdyhekcaNje6uvGmxL0u7A+Y
	 xuB0BEmswd+4raYFuZzYESz/uTIBXBlgT6Mr0kalQpNPKpLfLWLO0r2wmTW4X+hDOVChm
	 DYNjx9+eFt0aFGYbTyr8fljejFcgjB8YB1wYuZnHddllpy1crtS2zAQN6VupxE7kn3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lst.de;
	spf=pass smtp.mailfrom=lst.de;
	arc=none smtp.remote-ip=213.95.11.211
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0387A606A31B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 07:14:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0387A606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id 5B7FF68C4E; Wed,  4 Nov 2026 08:14:46 +0100 (CET)
Date: Wed, 4 Nov 2026 08:14:45 +0100
From: Christoph Hellwig <hch@lst.de>
To: Qiliang Yuan <odys.yuan@gmail.com>
Cc: Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>,
	Chaitanya Kulkarni <kch@nvidia.com>, linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] nvmet: drop the extra RCU grace period in
 nvmet_ns_disable()
Message-ID: <20261104071445.GB28939@lst.de>
References: <20261104-bug-nvmet-ns-disable-rcu-v2-1-b158a59318ad@gmail.com>
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
In-Reply-To: <20261104-bug-nvmet-ns-disable-rcu-v2-1-b158a59318ad@gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

Looks good:

Reviewed-by: Christoph Hellwig <hch@lst.de>

