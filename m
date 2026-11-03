Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.95.11.211
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793684089;
	b=FSyHQ4GsM726Fdx0MPeyekVgufLGvmaDpeGHNmwP7lEmQwC2f5jkdpwnplnC/yqa4EVC
	 ONXf9wKh+5d92t8lwMQDEdjzL/Zz0ThNIKFVVHtL+S5hYHxQZrf2hdvu6qNfFZEGdQNti
	 9b/Z1jfAtu3FvbZ/1v+fcci18C/ULKyPK30L2aPjPEkBV33LxTXtdzev7DkL6RIl71QY1
	 TmffhKxTpfAn0QhNo87jrU3GNDl9XKqpfwSacCLppiMti+PDUXNwanlAFJRG4L5Cv/XOJ
	 xkVBvPdR5su+ZG4typLtELhvBeaY3Wn1MWevbLtTc9aBevmQdmuyJDbitPbKdMEgDCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793684089;
	h=DMARC-Filter:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To:User-Agent;
	bh=M7NmYC/Iylm9myghHwqILim55SAUt9QrM+UZYk0eJlw=;
	b=OcqKQz7yOaVvItscTaPi65O4C4cA6OGq+ha8gX4pgizBivXF6/uXk8W8qpq8EcpOrxkR
	 mJSNOlouyC08bmbMYUuQF4YJe+JltuF59eUBEx1Pn3FWRepogRPKbCWJnwW7wLIDGELJH
	 YTRKSChVeILO9VadjimkNrrAIcIxKOeeB23SKsFF96QY4o2S67ce9WBcLq0WVod+WCZ4a
	 qs8VLgMhRmOZgEgY1Su2XpMiCEyk8KruNV0qjtTOX+vnVR4tH4S8/P68R0Ur2VBdkk19s
	 Tb4geXGEVjz2uig0rWp/8STo2tnFImentwk4nbgxevy263D5XMKZlYaryi14f6zHmxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lst.de;
	spf=pass smtp.mailfrom=lst.de;
	arc=none smtp.remote-ip=213.95.11.211
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19123606A324
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 05:34:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 19123606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id AA2D668AFE; Tue,  3 Nov 2026 06:34:45 +0100 (CET)
Date: Tue, 3 Nov 2026 06:34:45 +0100
From: Christoph Hellwig <hch@lst.de>
To: James Fantin-Hardesty <james.fantin-hardesty@seagate.com>
Cc: linux-nvme@lists.infradead.org, Christoph Hellwig <hch@lst.de>,
	Sagi Grimberg <sagi@grimberg.me>,
	Chaitanya Kulkarni <kch@nvidia.com>,
	Damien Le Moal <dlemoal@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] nvmet: fix arbitration burst field mask
Message-ID: <20261103053445.GC1382@lst.de>
References: <20261030191853.1777683-1-james.fantin-hardesty@seagate.com>
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
In-Reply-To: <20261030191853.1777683-1-james.fantin-hardesty@seagate.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

Looks good:

Reviewed-by: Christoph Hellwig <hch@lst.de>

