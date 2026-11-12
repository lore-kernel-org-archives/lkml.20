Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.95.11.211
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794518221;
	b=kWxU04jGtxLH9J23NDv2PlP1MIW7YxPSoaZ+QCSuR5OmLsHguDlT/yAVwPQ3U/0qlzqH
	 sw8NGL8AgSGgsFpy3qeOa6uiFodO2e7HG3PAD8qtewj+4mkQvjl0BygQWYzB7mLPC+l9v
	 B3d+mEJbOXtMNRx+LvJUDNwqrOJSrZXICJlAc9fuFdTQhDkFgcElfep3x8CV77EuF98Ps
	 9lwoG02gK51HyY8qGdH95muFvkoG4xrv84WCwbVPgDQZ4Vb6s4+AH4vLUrqd/Q6RKrO6V
	 WyFq9z8canjVxvZ/3SQeQKH7h7Rdkw0GF6tgao2k2gqaiGFFgJgV2qwhX5p2S8wgQTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794518221;
	h=DMARC-Filter:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To:User-Agent;
	bh=M7NmYC/Iylm9myghHwqILim55SAUt9QrM+UZYk0eJlw=;
	b=jiSwnsXCBtEJ5styyCT8xG8px6E2MQn3fiamjpmIKV5JQGHZCnV2REPw7D/AJGZnCM5E
	 YnsZtHOFTUzwAkhnoowZI94GjF0rT1nLJ7MxQ57+63rilHJdIGlkcmIYj8ozLoqgjiTHt
	 +Vx9Xe+Js/tyUEBwcfX0o8dm9TvCt0HvGqkRDNhTg/5RT+E7oJkAhSDEzwpOK85rcCP0g
	 kJyQ6VSJrX2SkzH78RplvnajwVNVsJGuv9PrdnvbM3dKmYSNrVZ3k3EGlt62xbifu4jcM
	 IVF/0OjlJ2bmFH9cJSpzMZyVwR2XvSrULpBUDKNjVO/b5NAiLDb1M517igv0BfvveUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lst.de;
	spf=pass smtp.mailfrom=lst.de;
	arc=none smtp.remote-ip=213.95.11.211
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E3FC606A33D
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 21:17:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E3FC606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id 7BD4068D0D; Thu, 12 Nov 2026 22:16:57 +0100 (CET)
Date: Thu, 12 Nov 2026 22:16:57 +0100
From: Christoph Hellwig <hch@lst.de>
To: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
Cc: hare@kernel.org, hare@suse.de, kbusch@kernel.org, kch@nvidia.com,
	sagi@grimberg.me, linux-kernel@vger.kernel.org,
	linux-nvme@lists.infradead.org
Subject: Re: [PATCH v2] nvmet: synchronize DH-CHAP secret removal
Message-ID: <20261112211657.GA11315@lst.de>
References: <20261110081559.2730-1-sreekuttan2156239@gmail.com>
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
In-Reply-To: <20261110081559.2730-1-sreekuttan2156239@gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

Looks good:

Reviewed-by: Christoph Hellwig <hch@lst.de>

