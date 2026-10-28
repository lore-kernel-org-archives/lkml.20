Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.95.11.211
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793198148;
	b=4Gnn4F/HzMC6ztl11RPa1GLfLteaTFnNrxLLwvTm50X8qVLN7dKF8HLF9I3W3DW5CfXH
	 4W1C0K7iQVflM6HSuAOcKP/SxsBDZrUUMZd+6F+5hwXLuK/KbXCwVXa3f61whr4Q5eOVJ
	 HiQlbSSIi9ggpOZKx59o+PDrP8vEBNHvJDLuNUvx0lzU6aC36QGb9pLbEk7cfgLzpmUvE
	 yBAmwMq7diVmAKzFu95KBwTlJjD4r2TO2mzhdJaRPMAU8wxNXku956vHWON/rMYkOZv+g
	 qeBzvIzxSXsKwIsaaDq22CDtN7evKajAVEBh0Uqqrh4/X0wwHchxOb+Seh/SH2iTZfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793198148;
	h=DMARC-Filter:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To:User-Agent;
	bh=M7NmYC/Iylm9myghHwqILim55SAUt9QrM+UZYk0eJlw=;
	b=UQwwuzRnxd6JIHkKd8UdBLh0irPVeY9tQ63Ihpgwck2B97vjxvPv7uMBjm9Fe8rxiCWp
	 4dmr1MSWAwJ9cvEHf4niBEgxRir42BreFHMcOE1LQCQSdXazQ2OJaotltjBFgas0AFNSD
	 tGtuVm2ktmxMlBnoBsWtvmRv4FhUwV64HsCXmIy0CV+1QimyUlTwvJhsiF+cfqToF4EkK
	 zQRS+IatxM6KNV1BSssJwV12bh5X9RbWWHGnx6sGaiposkTlLqbtsFRSb1hRn0sgsf5+/
	 nw3Ls+EDSYVevRPDUpGS1P7H7BMOteXdOHMKJD7zRIIq0DG1KPhgwvFiUsWLB6IOe9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lst.de;
	spf=pass smtp.mailfrom=lst.de;
	arc=none smtp.remote-ip=213.95.11.211
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BA37606A321
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 14:35:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4BA37606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id 7421168AFE; Wed, 28 Oct 2026 15:35:37 +0100 (CET)
Date: Wed, 28 Oct 2026 15:35:37 +0100
From: Christoph Hellwig <hch@lst.de>
To: Christian Aurich Zanettini Martins <christian.aurichzm@gmail.com>
Cc: linux-nvme@lists.infradead.org, kbusch@kernel.org, axboe@kernel.dk,
	hch@lst.de, sagi@grimberg.me, hare@kernel.org,
	sgogte@purestorage.com, wagi@kernel.org, kanie@linux.alibaba.com,
	nilay@linux.ibm.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] nvme-tcp: fix NULL queue->ctrl dereference on
 reconnect
Message-ID: <20261028143537.GA13429@lst.de>
References: <20261028143343.221936-1-christian.aurichzm@gmail.com>
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
In-Reply-To: <20261028143343.221936-1-christian.aurichzm@gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

Looks good:

Reviewed-by: Christoph Hellwig <hch@lst.de>

