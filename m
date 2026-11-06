Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.95.11.211
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793961142;
	b=F4mhAnem9sXUDOMcZCJCwncSsLquzLZB3B591dP5UYV8VI1ltUKbWIH5LVRdp73hIBqA
	 W7tom4BfIMpBfyY95/YKnnjzXGdJrM37O07JJA3pRsuY4wRkw8/Wrd4R399vSn5wTURLo
	 Kdg2ud/gByWNi868dzt5SsjZaMbrk4lhmp4oCJB1Xkm8exWClUN9Mmll/ii8vsV7j5lw/
	 y+BSorG+XodYZagXtvW33hhnDXO17Iph/j75ul1Ux/G4NjriyHCtAZ5Shk811k379fP/q
	 y00Sqs51waxTZtt95PLeg11FjUEwF0wr7Kq/dvey0nWPXoUgYEWmjKv36AAN458+qqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793961142;
	h=DMARC-Filter:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To:User-Agent;
	bh=M7NmYC/Iylm9myghHwqILim55SAUt9QrM+UZYk0eJlw=;
	b=DTorJEehvDVCxF+/twwxUMIVNB5/SAtse2nUDyKbvkj1gLFeTNKJ0187yYsu+X/v5wjA
	 S25+Q3P7SRROVOfPzCrXvbMzvaMVAj3x2iud7QGN2VwG9ntQrsTETxfBMKkAqLb/6yBKZ
	 vghwEADYHclbi18kpOeRbP/65sv3/pYGW3RYT/4jfaXOhaatGSoKOLbjAKev8Cx16B8Gx
	 ljPpnF1iyAY73c90MfIUwNuRFqYuxacQWjDkfm/IIKJ8eZAJmfuQSYQPCksB5+eUglrMH
	 rHrutdBFgoe+w//tz0D3XECLw+5N1oY81raLXWv0kz/9SDWoJtbKOfau1MEGna8/huA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lst.de;
	spf=pass smtp.mailfrom=lst.de;
	arc=none smtp.remote-ip=213.95.11.211
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54FF3606A326
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 10:32:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 54FF3606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id 3629668BFE; Fri,  6 Nov 2026 11:32:17 +0100 (CET)
Date: Fri, 6 Nov 2026 11:32:16 +0100
From: Christoph Hellwig <hch@lst.de>
To: Yingjie Wang <1075151112@qq.com>
Cc: linux-nvme@lists.infradead.org, Keith Busch <kbusch@kernel.org>,
	Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>,
	Sagi Grimberg <sagi@grimberg.me>, Marc Olson <marcolso@amazon.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] nvme: avoid wrapping admin_timeout and io_timeout
Message-ID: <20261106103216.GA5453@lst.de>
References: <tencent_1B8D08FB52E404EC3FE4933548D6CACB7305@qq.com>
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
In-Reply-To: <tencent_1B8D08FB52E404EC3FE4933548D6CACB7305@qq.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

Looks good:

Reviewed-by: Christoph Hellwig <hch@lst.de>

