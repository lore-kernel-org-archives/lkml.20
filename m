Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793612209;
	b=Xh604nMWBcZY8WvYPfoxfz61sY5GfyzjQMaFD+opFT+spXqqJz0Jm045Hv2aEGup3UI/
	 w1sh2JoOlt2ilPyrfvDr1N/Tiit1ImCINFA1Ggt3W7nIeEhY2tcIPdCaIVi+6qmVx0FeH
	 ay2x+kfJ7R/ntqCgzkwixHM6sksk41soChd1r0GFT9fBbcq+v1+asVoqj//bIX6Hh34rK
	 2z8MooKr6YKRVhTDaKtbs4N5PDkRH53JWSZ8U5u3Z6u98AemfwhWz+i8be4hnnd2SHONa
	 1gz2hghHcYr4ZnWWymmgFdECrKWssS349oUhoxwCaWGR9fvofyKKURQyrFkP28eRIzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793612209;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:Date:Message-ID:In-Reply-To:References:MIME-Version:
	 User-Agent:Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=R662JnnZXAv+1ADEOp/XUIUO/2DvMXkgRXTUkhoS1mo=;
	b=hbJsTk9ogRYm448h2R7cOfqDnJLgpdIg8fd6yvUm2bKvfNBw+aXA9tnUI0UTAT9X1q3G
	 ebDBOpOjyVf6/YrXzo7FdOYI1cpAw7kd83QN3d4L5SCKlsKqycAXvh3YaxFw7ds9AelRW
	 wgDHVZPyuoBP7lVRGS1P2UrS4DeimVhuGSh0BMMXWURCaxY9plVBcvdJFQYEjd9PNctts
	 R+1yYIXssV91UdrhrErqUe5eDwIEz0cudJMJAdDgbSzL63oFr7vAyauwDp3RZwb0xXOTi
	 +vJ+FBmjZrubqCbuJogY2ZpUAnd6b59hv17PAaWOLOjTT9jYiq2k1l3ICw24jsuC0bw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A109E606A32D
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 09:36:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A109E606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id E7839C8F44B;
	Mon,  2 Nov 2026 09:37:47 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DD3E960750;
	Mon,  2 Nov 2026 09:36:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 87A5A10329134;
	Mon,  2 Nov 2026 10:36:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793612202; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=R662JnnZXAv+1ADEOp/XUIUO/2DvMXkgRXTUkhoS1mo=;
	b=ENSWRpj/pGztgPota4D/jbkoJd49rS9LxSmaJdiO6AJbVkCmy85VNFuglYm7CF6xQga0dY
	yuU4gkNhkSkv32sAd6EUl4kyutT58hLQxDE39jJVqgdLYxYQU+scUvyTWvqSMrs8CbiC6p
	JQKhDHaGxFdtVCh3ymHQPmqXBheTc2VjxFtJXnAbkaJ6enJJdYj3BOSLcc+6x+b9901lqB
	T37DOu2OLMjVLP/HSpBD4XaPCt1TbjJLeo1kI9iY0Bm0z5OSTU/nevYC2FOZ3pGy94KyXM
	gERyuUElRPNTwKqSe6YXgpTlTMLR0dz9vLgSbnYEXk9kli8+aHRbmFdgzTQcuw==
From: Romain Gantois <romain.gantois@bootlin.com>
To: zhangjiao2 <zhangjiao2@cmss.chinamobile.com>
Cc: andi.shyti@kernel.org,
	dumitru.ceclan@analog.com,
	sakari.ailus@linux.intel.com,
	luca.ceresoli@bootlin.com,
	andriy.shevchenko@linux.intel.com,
	gonglinkai@kylinos.cn,
	rosenp@gmail.com,
	stable@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	trivial@kernel.org,
	Romain Gantois <romain.gantois@bootlin.com>
Subject: Re: [PATCH] i2c: atr: fix race condition caused by static local variable in i2c_atr_map_msgs()
Date: Mon,  2 Nov 2026 10:36:24 +0100
Message-ID: <20261102093624.17510-1-romain.gantois@bootlin.com>
In-Reply-To: <20261029070818.639-1-zhangjiao2@cmss.chinamobile.com>
References: <20261029070818.639-1-zhangjiao2@cmss.chinamobile.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: koshi/0.3.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

On Thu, 29 Oct 2026 09:25:26 +0100, "Luca Ceresoli" <luca.ceresoli@bootlin.com> wrote:
> Was this potential bug observed on real hardware? I'm a bit surprised
> nobody noticed before.
> 
> Also, if it's a bugfix, it should have a Fixes: tag and possibly Cc:
> stable.
> 
> Code-wise it looks OK. Not sure a bug can really happen but I don't see any
> reason this variable should be static: it is always set before being read
> by this function.
> 

Thanks for the Cc Luca. I agree with the need to add a Fixes: tag and
Cc: for stable.

Apart from this, the change looks valid to me, as there is really no
reason for this variable to be declared as static.

-- 
Romain Gantois, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
