Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.95.11.211
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793198612;
	b=cqTGEflMdEbNjKF3d4DDAudnFEmupjHgIlKRR6hVXTqzRdGfC/jrFBHUnPgN0kMNGe+q
	 lECerKdgwIcxLpVplkhAT7/6AWXyUh5QtUxGY1XNP+3jLdzk/3/hfGpJ3sgqSO0f9RnO6
	 dYfXPRuD7e17y8RH7qu5utqGWw2RbgJIqO2v5L+i5Y8Ieh0AOTrv+E/9UeJq0hH0DrQUo
	 243lnB3eiUEjwA1W5UjMiXxOxVIM+Jm+v7ZI27j5L7wcZgVHFct9dDLmu4XfSeXqRssgT
	 CTHoKzPga+dsUjp8r5wtd/QfkGApJj5nHWCsuYqN5c0391a2EfK5fl7ZuCWDMb91+/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793198612;
	h=DMARC-Filter:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To:User-Agent;
	bh=M7NmYC/Iylm9myghHwqILim55SAUt9QrM+UZYk0eJlw=;
	b=H6tjSBgw3xheuMGJGlzZ0ILAkEjbb5VS0pewsmgtvPZk1qBjowa+EGkBbVQMWd6R5+3I
	 7CtlevlsCxK2zi3jAFrVuOJc8OXubMOjuBNqiVg/h094HTldoCDZb7iuTM5m42nP91+m5
	 UKZmZRdVUpcHu6YdsIFF94lEzYIs8+XqJ+f2Rvs8TysStzG+cTdLywNp+KOPLWEJMCgVm
	 fpRfGBE+tNppwGCiZl5nSdDUU4v+QP3mByQO8BTp7UcKJr3dd/lGHII+ptHv0jhKTlRyf
	 r67AlH7Q3r90GaVS8ddLre+tGeFQxw9op7Xt1KVwm7eDtLQlLj13eZ14iz+D1gHYaPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lst.de;
	spf=pass smtp.mailfrom=lst.de;
	arc=none smtp.remote-ip=213.95.11.211
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2371606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 14:43:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D2371606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id 5CB2268BFE; Wed, 28 Oct 2026 15:43:28 +0100 (CET)
Date: Wed, 28 Oct 2026 15:43:28 +0100
From: Christoph Hellwig <hch@lst.de>
To: martin.nvme.dev@gmail.com
Cc: Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>,
	Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>,
	Hannes Reinecke <hare@kernel.org>, linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Martin Belanger <martin.belanger@dell.com>
Subject: Re: [PATCH v2 1/2] nvme-tcp: start error recovery when read_sock
 fails
Message-ID: <20261028144328.GA14099@lst.de>
References: <20261027-nvme-tcp-ctrlrec-fixes-v2-0-9656395ebcf2@gmail.com> <20261027-nvme-tcp-ctrlrec-fixes-v2-1-9656395ebcf2@gmail.com>
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
In-Reply-To: <20261027-nvme-tcp-ctrlrec-fixes-v2-1-9656395ebcf2@gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

Looks good:

Reviewed-by: Christoph Hellwig <hch@lst.de>
