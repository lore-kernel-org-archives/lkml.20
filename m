Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.205.69.214
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793371630;
	b=mUiEEJfb1W6NGnsGppmZBrBtm4GAFM0dlQifWXdO0saZQVaw3AHI5YsOm1P4mpFxpHwj
	 2NyJg8ptvYyLfH0xQeM3ONeSVgiUKER8Q5O1mJrd3+A+L76dK8AcSUNBq8jl0wcis2GoR
	 RGmeCjMlndbZb6/BniOwNL8gA7oQt8NdqNNJg1O//k5tp9h74pS/ewDKVp9/tsyqdhK6R
	 tkXsoHbiJcukDQJH17X2+6K0tya398Al7OCzxlWMF5d6cTsjA99NRbQm9SNXCzdFrxuPC
	 aH2KHu2NSOf50Sq9S5SFyk+7xTQs0cY9Z7oJuXGXXcKR0woYQs9k2lHC/MivA61PnkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793371630;
	h=DMARC-Filter:Received:DKIM-Signature:Date:From:To:Cc:Message-ID:
	 In-Reply-To:References:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Feedback-ID;
	bh=F9ZBxaI/Z47jKetNWEIW1OlS9G1OaRvxx4Do7WR7EVY=;
	b=l64fS3qHM1m8LzFkaseEiH9ZNxmJKjSwlJdgcyekGwhQvLHrvHE60toZFzhaIfX1JJQ7
	 T5DvUCXO+VuQHNpWV9gIeIFPDBvbjRiikwgJc0EhxqsA+ogF4YVAbErE6HTI0IxwDdRv+
	 7+FtK8GVUECL7n9fLUOyy24OgatY3JnMsAeOda29+SnA2cCWIlgUJ0CnEbtUobdiciXZw
	 2CeXIb61T/zHu96NNwycMHTaRDSEnO/e6vnJ7aYO/iqAD1IUPyXJKtAPhrWxSPA82rwJg
	 hrV0OcDrk0UiLSD50Lct38iTs4p+GbLm9/fRoOPV5LdoAGEic7fgPm9eU/sAmqXKwOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=well-founded.dev;
	spf=pass smtp.mailfrom=well-founded.dev;
	dkim=pass header.d=well-founded.dev header.i=@well-founded.dev header.a=rsa-sha256 header.s=s1 header.b=eoeA92vo;
	arc=none smtp.remote-ip=185.205.69.214
Received: from mail.w14.tutanota.de (mail.w14.tutanota.de [185.205.69.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 376CF606A31D
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 14:47:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 376CF606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=well-founded.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=well-founded.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=well-founded.dev header.i=@well-founded.dev header.a=rsa-sha256 header.s=s1 header.b=eoeA92vo
Received: from tutadb.w10.tutanota.de (w10.api.tuta.com [IPv6:fd:ac::d:10])
	by mail.w14.tutanota.de (Postfix) with ESMTP id 85F8319F60E3F
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 15:47:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1793371627;
	s=s1; d=well-founded.dev;
	h=From:From:To:To:Subject:Subject:Content-Description:Content-ID:Content-Type:Content-Type:Content-Transfer-Encoding:Content-Transfer-Encoding:Cc:Cc:Date:Date:In-Reply-To:In-Reply-To:MIME-Version:MIME-Version:Message-ID:Message-ID:Reply-To:References:References:Sender;
	bh=F9ZBxaI/Z47jKetNWEIW1OlS9G1OaRvxx4Do7WR7EVY=;
	b=eoeA92vogltrWNHgrIR++U+3YBtIicMPZW8ZfJse1BrCRnCSPQ+o5p8uPU/yYU5i
	yuF3QkdWvHtz9uMzDvr2hLpQarand0IKz6QjsxLFqAnZzMGjVFUvd/w+/oSHqNpVNFn
	ITuJw5jVKLilYtRDDoNqUxGsVNDONYDd8tdxPeQIe1n1Tv1I+F7t3jgnk3B7tfRRvjB
	t17BqIWBoDqYvij7nR1MmgBlubwK+PaLK96zmX8JpOmkzKqtOia+Eqg3gcGt+fOKSN+
	0dNc5R7rLRD3vbLnlRfoUkg47HZKMsFofpWUtOXPuuOflYlDmefA2loO8oA7mzWlONf
	t4rxkx6VKQ==
Date: Fri, 30 Oct 2026 15:47:07 +0100 (CET)
From: Ramses <ramses@well-founded.dev>
To: Netdev Bot+sashiko <netdev-bot+sashiko@kernel.org>
Cc: Jv <jv@jvosburgh.net>, Andrew+netdev <andrew+netdev@lunn.ch>,
	Davem <davem@davemloft.net>, Kuba <kuba@kernel.org>,
	Pabeni <pabeni@redhat.com>, Jbohac <jbohac@suse.cz>,
	Edumazet <edumazet@kernel.org>, Netdev <netdev@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Razor <razor@blackwall.org>, Hangbin Liu <hangbin.liu@linux.dev>
Message-ID: <P5CGmHQ--F-9@well-founded.dev>
In-Reply-To: <179336101737.3134.5509394527190638689@kernel.org>
References: <20261028-bonding-last-rx-v4-0-4d8e4cd47467@well-founded.dev> <20261028-bonding-last-rx-v4-2-4d8e4cd47467@well-founded.dev> <179336101737.3134.5509394527190638689@kernel.org>
Subject: Re: [PATCH net v4 2/2] bonding: give a slave that starts UP a
 full
 arp_missed_max window
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Feedback-ID: 0163e381fa67fa966160938ffa017803050e57578bb1735d37cd25d20463a96a9bb3a550250bbc5eaa94bfdfd8cf3defcf1aa43859ae980630826bb8230f264e7f:TurnOnPrivacy!:tutamail

> [Severity: High]
> Does this fix still miss the case where the ARP monitor starts some time
> after enslavement?

Yes. As the review notes, the old seed behaved the same way there, so
this is not a regression. v5 narrows the commit message to a slave
enslaved while the ARP monitor is running. Reseeding when the monitor
starts later will be a separate follow-up, see my reply on patch 1.

