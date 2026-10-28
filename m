Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.95.11.211
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793198624;
	b=zZ2d4DGTutpdj5U+2ZP2q0BgfrtG3X5Csb3DrXPopjtLRVXbXAuXnV3YnJ3tgtmjf/k+
	 qTvI8xQ6Nytdf1EWOEnUiFVnj6LawZ5jlmh2D7Yq64udteznPPenxggws8PlT0pJuLVGh
	 FwJ9OfkgKzWw6TauAckoucMmj78deW353kClJRbbcUJNB7jGysHfES6pn4ebijTsxs3dR
	 wWx9CKrJb1RGRZ+NUgIuzppuvugTwgKK5M8fnEwe5jKAzTG6UReb0ZUJjBx7mdYYyET5o
	 eEkb3AEiiyASeB/1COd+pun6qyJz+uiRVfXx0WEPAONvOGP/3ESeAmwrJ+lByB2WG8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793198624;
	h=DMARC-Filter:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To:User-Agent;
	bh=M7NmYC/Iylm9myghHwqILim55SAUt9QrM+UZYk0eJlw=;
	b=wZ9GpobxehfwtsqVSLMQWg4g6NZkJw5sIcgEtkprCk+yZ5O6M52vE1zMcRl3beQay5je
	 WvjNBR6WFPgP1ZRIGu9kj9aMfSJtg3AAyiJ4m7XIcUoryXGUdOuHCqWsb1DXsenEB5dHl
	 dP/SebL6Z0eMfN7TM1E4/nv8nS7QsN7cK8hNRWNajfXWQTGPDVDvESwkvprf0maepb4Jv
	 HRktrlV0WVY4in1MwDciwu7B3HILfbylNWrkB/s/RcC6lvhH7MMsa4bCfvlbd9+kQJ0mq
	 q8MKYqLsEptYzz568TDBUUtxqepJHL5wicWAvUD/id6M1Cr2nFBd23vyq34ycXXLPzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lst.de;
	spf=pass smtp.mailfrom=lst.de;
	arc=none smtp.remote-ip=213.95.11.211
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 737A4606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 14:43:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 737A4606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id C818E68C4E; Wed, 28 Oct 2026 15:43:40 +0100 (CET)
Date: Wed, 28 Oct 2026 15:43:40 +0100
From: Christoph Hellwig <hch@lst.de>
To: martin.nvme.dev@gmail.com
Cc: Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>,
	Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>,
	Hannes Reinecke <hare@kernel.org>, linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Martin Belanger <martin.belanger@dell.com>
Subject: Re: [PATCH v2 2/2] nvme-tcp: skip TLS control records while
 waiting for the ICResp
Message-ID: <20261028144340.GB14099@lst.de>
References: <20261027-nvme-tcp-ctrlrec-fixes-v2-0-9656395ebcf2@gmail.com> <20261027-nvme-tcp-ctrlrec-fixes-v2-2-9656395ebcf2@gmail.com>
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
In-Reply-To: <20261027-nvme-tcp-ctrlrec-fixes-v2-2-9656395ebcf2@gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

Looks good:

Reviewed-by: Christoph Hellwig <hch@lst.de>

