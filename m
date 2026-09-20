Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D7D9547066;
	Sun, 20 Sep 2026 23:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789946021; cv=none; b=Gi1sYIGh+bgDTc9BLMu81fWBgf4MWCKmQf7DsXs9UTdrmSUNYcg3UETD09qsnbbEudlq44yMZlRBWX1/Ph03btL5ux5RtfnE78QJuCik/8EldnjLnYPfj6uWs8Dr+I/y0itXO+Z67OmjsrJuCNLLXRrNxbrHoC3RIsyHJksSS58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789946021; c=relaxed/simple;
	bh=ac0PDjx2CF9tr/x+wiRBEjO0MaCdDwRbdhwCEBHROfY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sQxzbmKOf3kZ/SCZu6IsK/L1AXsi56Wxb/wAkJSOVLzhPCd+0npyJpBgvQ61Jz7y39xs285K+SP9qJBjMzyMPD3xwD2rjnagTX71tEgxIAt9zhoTgYOCE0oJZrd7nWw0BqbtNkckDLeMHkoDfMV9Y5dC/bL8mM6mDNvlYUOaGKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=Zzo2IZ+7; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="Zzo2IZ+7"
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4hp2Gk6LC4zMl2c;
	Mon, 21 Sep 2026 01:13:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1789946014;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PYh/AD6nS8laDFlVoK9osQ5yY8ZdUZ4VHdWngoSYgg0=;
	b=Zzo2IZ+7qi6H7xWvC3tFER2/ngqV5p+JrH/HN5SMSwbt+09kAzn4P0waANcyPWJIe/GXvG
	HbN2h2ZC+R77nXVxhx1usLtN/2DzB1fy6e44dj/6u2/8ckLgWPGpr18J6iipSxr8XRbx24
	DJWcp14c+bg2jeR3xUE1d3Q4h5irBl4S8qwuYYEugG4P6xrSOXqR2OfM1CS6Ef3bM8PtWK
	Q2p3eEg1O8lhSNtKRDlc3Wt6wk3BHd5qk4dugourPKZwz9+nvc5Sgw9aV6HTq4f88rwwC3
	DNaDQhg1wrJ0lM8YHwz8fYTvt59+gMPv+YjXqzwV++Xc8yJMWfWiCnRQDCPWOg==
Message-ID: <797c63bc-b759-459c-99f2-d5c3146cbe67@mailbox.org>
Date: Sun, 20 Sep 2026 19:17:09 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] media: dt-bindings: raspberrypi,pispbe: Fix example
 indent
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Conor Dooley <conor+dt@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org
References: <20260917002554.362516-1-marek.vasut+renesas@mailbox.org>
 <20260918-amusing-rat-of-nirvana-cda3f9@quoll>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <20260918-amusing-rat-of-nirvana-cda3f9@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: 2c0fc8c46b5874c426e
X-MBO-RS-META: m9q3hrijtsm5o47hjkr9iw4k9kpo396q

On 9/18/26 12:44 PM, Krzysztof Kozlowski wrote:
> On Thu, Sep 17, 2026 at 02:25:18AM +0200, Marek Vasut wrote:
>> Fix two spaces before { in example. No functional change.
>>
>> DT checker reports this as follows:
>> "
>> ./Documentation/devicetree/bindings/media/raspberrypi,pispbe.yaml:56: example 0 [redundant-whitespace] extra whitespace before {
> 
> I already posted this for more files:
> https://lore.kernel.org/all/20260801195528.235230-2-krzysztof.kozlowski@oss.qualcomm.com/
> 
> And doing such changes file-per-file is quite a churn, so better to
> combine commits.
All right, please just apply yours, thanks !

I noticed it while running the DT checker, so I fixed it and sent a 
patch, hence single file change.
