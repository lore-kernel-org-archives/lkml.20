Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA5F836B93C
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 17:52:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791913962; cv=none; b=rRs78QEJZgIkAwZSYnCdxmnvcPjEWG9RQyYSRD0FAMw+wfoTeZqbX46pFclCCQldF8IJXl/XRvgSJqr3Z3iGsy+sz8KEErPQkyWFHQQhC1YoKpbAHn9ZOLioqOtmHdgn781mz6D1e9cPC3GnwogRkojD0RVdkd/JSbxqLjz4wCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791913962; c=relaxed/simple;
	bh=UWPvnjOv63k2n4GV31aTm5MT/9h1TqVy/TiyOQxup1w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=b81uqkCewuamFNKj3k3iDq2t77hoUmf8CcJ+LqEVOA9zcvGaN7Fc30zUjFWCZV1+usYCOgdXoQkiqmwZoMzaOgFa/XCkZpzvtpcpLyIHaed/6dL2a6d4quVISqF801fSd3Byw7X4bCG1JkI8f28ENGdunjyB5YYGQmms59B4W/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=p3MLEQKd; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="p3MLEQKd"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 7E945C653FD
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 17:53:34 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DCF5260362
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 17:52:38 +0000 (UTC)
Received: by mail.galae.net (Postcow, from userid 0)
	id 1870A11D718A5; Tue, 13 Oct 2026 19:51:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791913958; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=2KrY5bcaWM/iCHC3nc2lc6IZhhlnFZhRjcHEfSOffhc=;
	b=p3MLEQKd2RENBBYIUxos3QRP8gItVkIAnZyi/Z9LPAZPYB59Vk+Deqx3ceeP0F+ELBVUOx
	iupqS0GTPEmTBxZelymLcl5HZApqQfRFmYEzRubuu8J+7T56/BnJPjTv1sFiOt5gtZjvdy
	NpdwBa+qNG8sM7ReRt/CZTpsb0Cmi6DuYyOKtlUxp2gmYph7ERDwonMA8PQbcnCbqsyEYz
	MP6HJimAxRgF1DH1M3pdxNfwClsz6hDhC99fp9TlusgEfmW51b8YrWcPrWtC1w+Ww+Swx3
	Y8ET05bP/oO0C7qiY64dIDTNDRpzueuqoYJW4DndC081Q3X/12if3ARzDO3J+Q==
Authentication-Results: mail.galae.net;
	none
Message-ID: <bfc0027a-932e-42f3-93b3-49ab5474abd6@bootlin.com>
Date: Thu, 8 Oct 2026 11:04:44 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v3 1/3] net: rss: Require indir table size or
 hash key size to support RSS
To: Jakub Kicinski <kuba@kernel.org>
Cc: netdev-bot+sashiko@kernel.org, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
 horms@kernel.org, mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 linux@armlinux.org.uk, lorenzo.bianconi@oss.qualcomm.com, nb@tipi-net.de,
 jitendra.vegiraju@broadcom.com, thomas.petazzoni@bootlin.com,
 alexis.lothore@bootlin.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, pbrobinson@gmail.com, joe@dama.to
References: <20261002142806.1299041-2-maxime.chevallier@bootlin.com>
 <179121059086.434549.5364767976780818051@kernel.org>
 <d6e61c8b-cd3d-43fe-b4ac-19ff5d790b0f@bootlin.com>
 <20261006163349.61c738e8@kernel.org>
Content-Language: en-US
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
In-Reply-To: <20261006163349.61c738e8@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: None
X-Rspamd-Queue-Id: 1870A11D718A5
X-Spamd-Result: default: False [2.39 / 30.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DATE_IN_PAST(1.00)[128];
	MIME_GOOD(-0.10)[text/plain];
	BAYES_HAM(-0.01)[44.09%];
	MAILCOW_DOMAIN_HEADER_FROM(0.00)[bootlin.com];
	URIBL_BLOCKED(0.00)[bootlin.com:mid,localhost:rdns,localhost:helo];
	DKIM_SIGNED(0.00)[bootlin.com:s=dkim];
	ARC_NA(0.00)[];
	BCC(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,lunn.ch,davemloft.net,google.com,redhat.com,gmail.com,foss.st.com,armlinux.org.uk,oss.qualcomm.com,tipi-net.de,broadcom.com,bootlin.com,vger.kernel.org,lists.infradead.org,st-md-mailman.stormreply.com,dama.to];
	TAGGED_RCPT(0.00)[sashiko,netdev];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_ZERO(0.00)[0];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[]

Hi Jakub,

On 10/7/26 01:33, Jakub Kicinski wrote:
> On Tue, 6 Oct 2026 09:59:29 +0200 Maxime Chevallier wrote:
>>> [Severity: Medium]
>>> rss_get_data_alloc() is shared by RSS_GET, RSS_SET and RSS_CREATE. Does
>>> this drop flow-hash reporting for devices that have ->get_rxfh but report
>>> 0/0 sizes?  
>>
>> Yes it does, that's the intended behaviour here. RSS bits are all optional,
>> but does it make sense to report hashing params when the indirection table
>> is size 0 and key len is 0 ?
> 
> Not sure if there's an implementation in the tree but 
> it's possible to implement poor man's RSS on strict
> power-of-2 queue set with some hashing built into the
> Rx engine, without a key. We'd still want to control
> which fields are hashed in this case.
> 
> In the Netlink API we combine the two so we'd break this?

Hmm I wasn't aware of that :( I guess the safe choice is to check on -EOPNOTSUPP
for .get_rxfh() + 0-len indir table / 0-size key and skip the device during the
dump instead of returning early ?

Maxime
