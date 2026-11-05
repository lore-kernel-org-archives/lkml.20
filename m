Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.95.11.211
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793865319;
	b=BzTV+sJzrjVLBm0bT6gAKTTcW6ryXnY3a0zPMCf/cAslKAF6PGTsh/bz/K9AXZoRHcHL
	 qjNibrO/zE5Q44QZKi4gw0/G8xKT/Y7nwiMAlztv83S6N4tdxnvzHd3HIV8yDTx949x7F
	 5ROJUb4ENIqMjyjBLiH80bg7WJODgffGXJCaoVmB4Zyz1+JOMcpQ4ERxYuw+EVX4g2om9
	 jmi/fekphRHipKU1HDFi72pq4Gcj+o98V3e/lYoQWEprl4kIck9XeqTJRdpOBNyfMzD8w
	 g0LCrt+gN+QRgFyucEKbzhmzRdFURG7CqMIx0kPGgeYvITgjB4AyUlxNEpNwl17FO2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793865319;
	h=DMARC-Filter:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To:User-Agent;
	bh=bk3XFx2IS0BKNitNkjVAjvt/h7+W5thsM39xRsT1eEU=;
	b=stYXIwdeYMi1NoPjg4WmJDc1FWzwrO51a9Jz8TfW29kTX3FB4PwjB8bygdELosoJBUBl
	 ELoK0bihTgHAbhptS4/HOyBcHV2D6RHFi4+ocXf3XhEyz6v9Tpzdiv8a+KawP4+Ls7RWd
	 /D8gBhbT3ICcUgO2e6thdaYa5CU6JwMcXCgKCW+TkYawpQTZHkqU7MhxfRTt63+IPCrtU
	 Rmq3gYmsNG1tVg87WIEJcDUKa7I/Fl5q4B9g9Py+oWxCTbuOEc8NSCEMTcUuPCGiVINpa
	 s3+pxucSAcmW8pHnek+ADd0lmwnKFmLEhLLxAxotcK8lqYMuOf2XwbdyWB7igWFZmbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lst.de;
	spf=pass smtp.mailfrom=lst.de;
	arc=none smtp.remote-ip=213.95.11.211
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B89B6606A31B
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 07:55:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B89B6606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id 11D1868B05; Thu,  5 Nov 2026 08:55:14 +0100 (CET)
Date: Thu, 5 Nov 2026 08:55:13 +0100
From: Christoph Hellwig <hch@lst.de>
To: Yaohan Li <shunsheng1218@gmail.com>
Cc: kbusch@kernel.org, axboe@kernel.dk, hch@lst.de, sagi@grimberg.me,
	jthumshirn@suse.de, mkp@kernel.org, linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] nvme: stop asynchronous event work before ANA teardown
Message-ID: <20261105075513.GA17979@lst.de>
References: <179378587000.73780.18152328009023418065@gmail.com>
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
In-Reply-To: <179378587000.73780.18152328009023418065@gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

The fix looks good, but it would be nice to get the Sashiko nit about the
comment fixed.

