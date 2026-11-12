Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.95.11.211
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794518142;
	b=IoX+SSRrBUXU37VzHEApUIP83IdhoTrB8pj8H/D8H/OgeIunA+6Gwe/4K6n5ZzoVOLIm
	 2b3sjB9V5U+Gij+kFnq2xuKXQa3Nt3sPXg1X82b0ZjPSJZKVtvGwFmssq1kJj+jV9NbHh
	 1+a8IuN5a7Z6HHmEcMtOAVj+nDS1+vgghUModqZtKiEakIzVSJ3NpLaT2dND/Kv0ah7Cv
	 zRFM2/BRAxCD0YE1wgLvfbP+vdkJoOeYkp5yl7rxSXSeIWDeB2rOnp+Hp+1PFOz+jTlLp
	 KzzPfObiw58MW/DwiEdM4j6emeAvODcOHXKR4F3qMpiSA1i6DwcbhBoHQp5NWtnH70w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794518142;
	h=DMARC-Filter:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To:User-Agent;
	bh=M7NmYC/Iylm9myghHwqILim55SAUt9QrM+UZYk0eJlw=;
	b=WX0mGPDUSITdGD4hxEPHgcq1OI+ug0PeqidLAJ63CHFyw2d+UPcWKhWA9qdBuvhM1dJA
	 Qsooxz+aC7zPsLChQiwUaHDpO7LttGlb8QTK4qBjhlR1jrdgPKnjDWqD9sPXmZ13L2fJq
	 NoKe0cpMwtaQFySYKi/XVn93wBQjoj5L+E8/YgJVzWBy6PAWbAbsEonrjTrsNg4GwYxz9
	 pwiuwOaZcjSIx8/TD+rRctZWK1suvEQaC4LEa0EJApEybj5YVm+3jkFtYitsLJc5Xx6yW
	 xJzkvDAnL7rtW8wxCCXpYjc73if2VMVs5/smtSzvVeX6Zuawy9TWgbgMMYEoQ12q3lA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lst.de;
	spf=pass smtp.mailfrom=lst.de;
	arc=none smtp.remote-ip=213.95.11.211
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4872A606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 21:15:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4872A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id ECFF868D0A; Thu, 12 Nov 2026 22:15:38 +0100 (CET)
Date: Thu, 12 Nov 2026 22:15:38 +0100
From: Christoph Hellwig <hch@lst.de>
To: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
Cc: hare@kernel.org, hare@suse.de, kbusch@kernel.org, kch@nvidia.com,
	sagi@grimberg.me, linux-kernel@vger.kernel.org,
	linux-nvme@lists.infradead.org
Subject: Re: [PATCH v4] nvmet: clean up DH group state on initialization
 failure
Message-ID: <20261112211538.GA11278@lst.de>
References: <20261110113502.3235-1-sreekuttan2156239@gmail.com>
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
In-Reply-To: <20261110113502.3235-1-sreekuttan2156239@gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

Looks good:

Reviewed-by: Christoph Hellwig <hch@lst.de>
