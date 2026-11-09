Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.117.254.33
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794245162;
	b=AxKB7o7npUymye1e2UZChqxHkWsPsRwsj3WDIfhA/AqEbP2ykhXj03U5ZM1fXOK+OaEw
	 uMgueo+Z7D8X/yyitd5/cm8bYqkzN4PlM3n4X+sS7U6xo5C2uCOBmr/S2TLurBSX2WD5G
	 FMvhUk+KVXb4SpELO+AXNMg4EZ4qeIrlpWEWjo853EdQoDfUmNFqFfBwgm8WOJ8uSOR3n
	 ay0q08ESygXazkwvAiHG4fjexsVtnI3PU3REoln11Yomw4l2jUPjl6WL20zlY3L8AFtK/
	 WjaPtyR4ryCsYStrvD/y8a3II49/oJsy85+SQVThPBpGT6wmxjuioH0WHFebgfOOgrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794245162;
	h=DMARC-Filter:DKIM-Signature:Received:Received:X-UD-Smtp-Session:Date:
	 From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=prHiXuru41hVkUX5fnZU03et/s/IGkiTy36rSJ7ufsI=;
	b=W7y9jF9IZ/1z9tCccE+JCGDC2iOR2unnFbfxYrIf/dKh6iBodGsIp0KmdBPzT9n498Su
	 7BGuohddsO21KghBnySEAf4+byylvDYwb0o2OShilDoEAvRPK9dJ/HR1aQrl5u+wcWWlD
	 DRZzv70igQfN2LTCO9nlL4vawvFN4HhLJ0D5ScS3QwHvvatCa+K0tuzdVLI/s0QNB8z/Q
	 E+gM8eFad3fh8EFV7nDme0HGr3dpyaEKgEPcNLXvqVaJUx9nOdqH5+1OiDmLbjBKGfqv3
	 yw6HLs9thHthqI69cSoCxtrXWU3u1ptkwmbq/SgC1Txq1a0iouilPjvJhh/yInP3S1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=sang-engineering.com;
	spf=pass smtp.mailfrom=sang-engineering.com;
	arc=none smtp.remote-ip=194.117.254.33
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2359F606A325
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 17:25:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2359F606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=prHi
	Xuru41hVkUX5fnZU03et/s/IGkiTy36rSJ7ufsI=; b=Q/+hLAi9A/0VV+uNQhBK
	n0bPmntU30t/U0COCCzqZMSC/rlitJlFKFG2SXYrHqU2jgKsxlQtfWCyKxcJWE4Y
	xu7Qggw59mp+WLvm05LwlnsjtYRrSBqftBr2jTOc0/K61EE4ioRHaLW+XTajzU2Y
	5IXRaBlZ5AwdKluqquJXc7jQ0ry7UJaQjmSPgZM32XTgaNDV9+NwqroM6qumwaIV
	7z3V4nj5vsV//4dbfA6MLR6b7odTv6kTRlPnqArBBNv2aBrrbLJlBMt0lPJaXVpF
	hagmWLe0TN8ZNMx+SpwOBTPP8tsOsMs4IkdwEKSs0D+4QECy+QnKJGTDz49y2OXH
	Bg==
Received: (qmail 3345140 invoked from network); 9 Nov 2026 18:25:42 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 9 Nov 2026 18:25:42 +0100
X-UD-Smtp-Session: l3s3148p1@xY5UQNtf4OUujntg
Date: Mon, 9 Nov 2026 18:25:40 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Dmitry Guzman <Dmitry.Guzman@mobileye.com>
Cc: Linus Walleij <linusw@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
	srinidhi kasagar <srinidhi.kasagar@stericsson.com>,
	Ben Dooks <ben-linux@fluff.org>,
	Andrea Gallo <andrea.gallo@stericsson.com>,
	linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6/8] i2c: nomadik: handle pm_runtime errors
Message-ID: <avICFAh07d7XrAIY@shikoro>
References: <20261103-i2c-nomadik-fixes-v1-0-655c6af2cb70@mobileye.com>
 <20261103-i2c-nomadik-fixes-v1-6-655c6af2cb70@mobileye.com>
 <avFwLctRcnJHtINQ@ninjato>
 <avFzEaxgam-UuZH0@ninjato>
 <20261109100606.493ca48095bcc3527be18573@mobileye.com>
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
In-Reply-To: <20261109100606.493ca48095bcc3527be18573@mobileye.com>


> This solves both the positive return code issue and the usage counter leak.
> 
> Do you agree?

Having a leak less and cleaner code? Yes, I am sold :)

