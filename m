Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.95.11.211
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793962401;
	b=uYHM6Ogeao1kwMiX/ZEPQMxqzduWwrHNYMe0fr9kbdz3Zlxp81nAutzDVN3wlDtH7hGg
	 CMXiweGHhCoorbqgHdDd8mArQXmy8kaBVSlnJXgvxfn9gz5ZUqYXFNxymlUwgwY8k/QL8
	 tXpNqnYW6dB6lh/e5nD14nVIabVW2SAneZdAAnIM0SDbOQQKZhNh4cWysLfd66vGDMZOZ
	 cnZbTYQM2JGiGKrhu5l2OkSVz7KPzlR59VT1jF+z2IOLpeP7r8stHhqdgC9QjZDU2iaLF
	 XZoOuCCaVesbIJlOaj0klcMRPXvkU3W6rKZE0yqttPvoFrk5SXLI+TTkI7UlOUYN+EA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793962401;
	h=DMARC-Filter:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To:User-Agent;
	bh=M7NmYC/Iylm9myghHwqILim55SAUt9QrM+UZYk0eJlw=;
	b=xAQgNxhAIE77QhSeFNYTt0fsRggijFwaynetXxVYkV10scIHwZ/o6X2EMpSV9epBccAN
	 YV+x+v5q9Y/W6QSB2uJD8Yv2rrf+BNu2lHSgPq1EfHaNK4dQdQOQJV5eMvNjEfdt2QsaO
	 AUUxAVhkXzNB3rPvBV0Ww4iYZYFWVQ/DIRZajSOXyyTB8n8T4OpG3zZs5AlXC7KRTQxkl
	 zlZKfivbLzWJUrpcFJMFVgEp6wPpt5KMJkz09v4IutlYb21Tn/FHfnnRelD1M1d3+r5/U
	 Vt6GDbtEY7J5v7toF1IbEPcprzHYlFxO7DVzwzC8J1LdNOHZmwzJtkh9DTvc/A0HKVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lst.de;
	spf=pass smtp.mailfrom=lst.de;
	arc=none smtp.remote-ip=213.95.11.211
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 628B3606A32F
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 10:53:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 628B3606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id A375068BEB; Fri,  6 Nov 2026 11:53:17 +0100 (CET)
Date: Fri, 6 Nov 2026 11:53:17 +0100
From: Christoph Hellwig <hch@lst.de>
To: Chengyuan He <channinghey@gmail.com>
Cc: linux-nvme@lists.infradead.org, Keith Busch <kbusch@kernel.org>,
	Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>,
	Sagi Grimberg <sagi@grimberg.me>, linux-kernel@vger.kernel.org,
	Chengyuan He <channing1ne@gmail.com>
Subject: Re: [PATCH] nvme-pci: add NO_NS_DESC_LIST quirk for SSSTC CL1 SSDs
Message-ID: <20261106105317.GA5905@lst.de>
References: <20261105134526.95382-1-channing1ne@gmail.com>
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
In-Reply-To: <20261105134526.95382-1-channing1ne@gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

Looks good:

Reviewed-by: Christoph Hellwig <hch@lst.de>

