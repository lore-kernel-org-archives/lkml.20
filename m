Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.95.11.211
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793864852;
	b=iiOvbezMWdm3ehDKLVJKrdBqLteo5HMDMEUw6A1mIVz3HuJ9b1d5AD5bt0EJfB1VL8+A
	 7vwsBW29Av6vcrU/TFB26fxctAsah7h7dge5XOcAKDSXIV4WaJXXUh4g7rqQi3vU+xpeS
	 qe+Aqgbhq4tVcZIHNjtwngxl8YI3+DxLaUoD7lvdZomgIB0LO8a5GKP3BNKfZtnyBOpaD
	 feGRc40jTP2iDjd/jVdju7Hdm6x/7U0NKI/jnnC9oTRgC8tBIxUHB20D3RdlKpo6eYYjB
	 yW6sJr/pCp0hmczzSVTMNdss2z3cftu++38Q/2GsXO09qLkTkHx1l3vhgkXycOxkJnw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793864852;
	h=DMARC-Filter:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To:User-Agent;
	bh=M7NmYC/Iylm9myghHwqILim55SAUt9QrM+UZYk0eJlw=;
	b=kwaWncAeQe0HX0dS9l5KocudQEzTv1WwpDQXE5xgNVsyRkkP+bAdN1xpeIwfaO+u4sTw
	 jQbfJ00YOWtn9OYzOBXpsZHYwO2jIHnlK3nlyKUTEnlKlH6MEJBIa9GTHsLBAy0RQlMt1
	 oWKZXog1RGyu26OBfDK/zj9OH9mGK5aW13XvycDQpmdaIZut02EIXrcueSYgTzDcum8Lq
	 nggWdeWWhSx6m0Pfa3QkxEAgP4nopICWJclUlVuGnXa4QOkEt+hn1Zttq+0EgDh6d4pTC
	 i85GoStE3O1llc3D9s1OBaJJqkl7fqvWWpC/O6I7s7C9BGtc+aol/I+3seX+Hyn+cgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lst.de;
	spf=pass smtp.mailfrom=lst.de;
	arc=none smtp.remote-ip=213.95.11.211
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2277606A32C
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 07:47:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D2277606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id 7EB3268B05; Thu,  5 Nov 2026 08:47:28 +0100 (CET)
Date: Thu, 5 Nov 2026 08:47:27 +0100
From: Christoph Hellwig <hch@lst.de>
To: shao.mingyin@zte.com.cn
Cc: hch@lst.de, sagi@grimberg.me, kch@nvidia.com,
	linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] nvmet: drop the redundant auth check in
 nvmet_parse_io_cmd()
Message-ID: <20261105074727.GD17781@lst.de>
References: <20261104211446891tN1QRJiKV3CLPQqfb7gJu@zte.com.cn>
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
In-Reply-To: <20261104211446891tN1QRJiKV3CLPQqfb7gJu@zte.com.cn>
User-Agent: Mutt/1.5.17 (2007-11-01)

Looks good:

Reviewed-by: Christoph Hellwig <hch@lst.de>

