Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B97BA54704A
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 23:25:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789773953; cv=none; b=ZoLbqIjjDbk4RDmeP7pDDY9/0mqIMTsgJRNFgx505fka1yz5Bu7hmrEKEW0HaVn7PRQQO5xIu82UDZhmrFU50iNmFhHDUpNUVxxTGWsba0yWDanFJcxMpNMsXmxEk0UekDnSsN4hixz+4LW6pU11cMe6tpG5JuyInupay2cfJSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789773953; c=relaxed/simple;
	bh=mozxaWzeQSTf+AjlwLSlCums2lVIvxk1d3n3QIpfoSM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uqig+DmlQnQBS1qjAeAOKXHOkjunQOVMqK+AwnBaMH7gMvq4DVAZD1JXjAvx8r2FIPP08Y4HB+OXvcew9OSxmNsWK0gsodUTbb6E8PGtd8bKQeh75hL0dXwMcxtoCSh9AwQxhokSskbqkbI2pMDJCtQnhFGNive78tHqvTW2cjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=n8BoP8UU; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="n8BoP8UU"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id CCC534E40658;
	Fri, 18 Sep 2026 23:25:47 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8036E60649;
	Fri, 18 Sep 2026 23:25:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8C16810329084;
	Sat, 19 Sep 2026 01:25:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789773942; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=USxaILco5raa3NmA/VsBziY7iG/PgANTyDl6+4eSBZY=;
	b=n8BoP8UU2UgqXaqxWJQe0+95itZoZV1IsM4sTOx4je1wmh5DjqQX8K/f1UK0XgK6QF1lC7
	At2O0xrcVJdI/HR81QkUF1IZEJWaAbN7fyLXQcPLqQ0Zg2N7gl0l985foPR/4edjciRgKn
	oG+ZN851pOAxGgq2GeWW/mbsEF7cdhge/X6eQwiQi3/tZ2b0A3c4SZJYis44cBgCQYjv5M
	/ANZpi1LhBaI6bcQIYH4CzNOr4olMvO9C2Y2WFKfXNwwHGcGYpJ44Lizq9ofsJSjK3C6M3
	gbL0qFITdhX0hqiQd9GviN+Y/LoiXhCPTI5qwkficePhDNYuozpIuE5j/ikO0Q==
Message-ID: <e0d76f75-28fe-4699-bc5d-cdb929691e5b@bootlin.com>
Date: Sat, 19 Sep 2026 01:25:35 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Linux)
Subject: Re: [PATCH net] net: don't require the hwtstamp NDOs when a PHY
 provides timestamping
To: Nicolai Buchwitz <nb@tipi-net.de>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>, Richard Cochran <richardcochran@gmail.com>,
 Vadim Fedorenko <vadim.fedorenko@linux.dev>
Cc: James Clark <jjc@jclark.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Doug Berger <opendmb@gmail.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260918095540.34286-1-nb@tipi-net.de>
From: Kory Maincent <kory.maincent@bootlin.com>
Content-Language: en-US
In-Reply-To: <20260918095540.34286-1-nb@tipi-net.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3


On 9/18/26 11:55, Nicolai Buchwitz wrote:
> Removing the legacy ioctl fallback made both hwtstamp NDOs mandatory. A
> device that only timestamps in its PHY implements neither, so
> SIOCSHWTSTAMP fails with EOPNOTSUPP before anything looks at the PHY and
> PTP stops working there.
> 
> The check only ever picked the legacy path. That path is gone, so drop it
> and test where the NDOs are actually called.
> 
> SIOCGHWTSTAMP is new here, not restored. The old path went through
> phy_mii_ioctl(), which only handled SIOCSHWTSTAMP.
> 
> Such a device now returns -ENODEV while absent instead of -EOPNOTSUPP,
> like the ones that do implement the NDOs.
> 
> Fixes: 5062245a5a7f ("net: remove legacy way to get/set HW timestamp config")
> Signed-off-by: Nicolai Buchwitz <nb@tipi-net.de>

Reviewed-by: Kory Maincent <kory.maincent@bootlin.com>

Thank you!
-- 
Köry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

