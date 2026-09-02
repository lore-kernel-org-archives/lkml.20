Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A7E0448388
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 10:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788345643; cv=none; b=YFdz2oP7srXCEVWZeb4xOFh/phcJIXo2KcyQPpHlq9a3NqOwAvKZBHMzNVAL336Tgk6BZvbt5oZwd7ZG+9X5o2tXR5QPbSglAazNV1fcIO46Ilikeu/3tX7zBjXVtG8zQBV8GLMQKNP8SEKcnlj4OB699soQhD2h1yQ2MzGS/LE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788345643; c=relaxed/simple;
	bh=M7NmYC/Iylm9myghHwqILim55SAUt9QrM+UZYk0eJlw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=reFWqMbcZXNpuBu2Q477uMhtp+aV5lDyWa2eg0GFyoDkyX7i07BftG9Ov7BIcMHgPBaM8+GxtMhMzMia0aPVWsGE6GBpzPP6O6t7P2cCUt8ZU4Y5ebvL06ulaNgLpZKSlKp1KFGvsKuiRtf93LmaccNIoEu1W8JH/0hzpMNFvE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id A64C96732A; Wed,  2 Sep 2026 12:40:37 +0200 (CEST)
Date: Wed, 2 Sep 2026 12:40:37 +0200
From: Christoph Hellwig <hch@lst.de>
To: raoxu <raoxu@uniontech.com>
Cc: axboe@kernel.dk, hch@lst.de, kbusch@kernel.org,
	linux-kernel@vger.kernel.org, linux-nvme@lists.infradead.org,
	sagi@grimberg.me
Subject: Re: [PATCH nvme-7.3 2/4] nvme-fabrics: add helper for owned string
 options
Message-ID: <20260902104037.GB8206@lst.de>
References: <29BB44C32FF06823+20260821062142.1932160-1-raoxu@uniontech.com> <124D3A0A7C82160A+20260821062512.1936554-1-raoxu@uniontech.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <124D3A0A7C82160A+20260821062512.1936554-1-raoxu@uniontech.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

Looks good:

Reviewed-by: Christoph Hellwig <hch@lst.de>

