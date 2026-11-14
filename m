Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794670361;
	b=nbt+JixghfYEp4gwWc2eDIRF9Es3+uHFvqGjZygkdbbVOdR9seDdLV/g/WyUlPaRfW9n
	 +cJPjByTEGkFv0JZtkYdvv2d2KDSqhanftO3YS6pwBIRWAqW6BxtLvH03G2CWvI78Lk6G
	 Qz63Sq1jx5VDg1r73pW3AVDWBnnMtTE8tLUIq2UKfTRpIlaM6m9ZdeLdGGYAKJzqmZ5Fp
	 j1FFyhVkNN39ofpxYnjvLNVNj8BpN8N7u3Z+7DXHiILuCQoNFjIZyDrHLqRWm/ay1n/IP
	 zOPiIxjlqp8BdoshDXtvh+0ZqE1iacQRUVt4SoteHOCpYoA+nOhd75YWuNYGc3unvhQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794670361;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=OObaiReGgzbiBlX9zLflu3sKpD5VzXBlItf6A41YB84=;
	b=HjXe5bnK1JiuyZ4t9VnLVCnl9fRTIoaf6zu9uma34pOJoYuYMPa083s3ZaR2fXoNcSSw
	 QXkx9jVFtkf0FnljlKaPJmRPDS7uia3v3Cjq8kK6bviu8STO+l/SiwS5cLMik3yf32sFk
	 h64wZJ7zbAV8C4R94+/bc69nKMQI5sA9MZWlCmOSsiroDS9HjKnGJbWJ7Qf5vqz1ZX/7+
	 pjJO3W8YhP73QggR4IqtQprYWI15hnad79Nyj0pBalXkEzr9OgbD/dhsLjXIZr1/y7FRc
	 Dm/ci0fzqliAW3XOymc75oAdj//rXg6De0rkcunzVePx7Jod1MnyVUnALQyQj2rAoPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lunn.ch;
	spf=pass smtp.mailfrom=lunn.ch;
	dkim=pass header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=ZvM0rG0n;
	arc=none smtp.remote-ip=156.67.10.101
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96369606A334;
	Sat, 14 Nov 2026 15:32:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96369606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=ZvM0rG0n
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=OObaiReGgzbiBlX9zLflu3sKpD5VzXBlItf6A41YB84=; b=ZvM0rG0nU2ysVQlLru6tyytZNP
	bxxyTnEwECh783UGOcMJ45MFt8zYu2kBsy8eqN1o0t/xuB/mg+MZEpNZnG2Tokkfzt8gDlTwVLS+9
	981mF2n6ecE/MpoNJ0AwVYi7FNVO+iO9o19urjYBJDepVY/thc9Ot0jt7rKCdtSD9S2U=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xSFk1-00GVpB-5b; Sat, 14 Nov 2026 16:32:33 +0100
Date: Sat, 14 Nov 2026 16:32:33 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Elias Pukari <elias.pukari@gmail.com>
Cc: hkallweit1@gmail.com, linux@armlinux.org.uk, davem@davemloft.net,
	edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next] net: phy: et1011c: don't write an error code to
 the config register
Message-ID: <57352e98-4a9b-4476-9ed6-974b1533e17d@lunn.ch>
References: <20261113221917.3542509-1-elias.pukari@gmail.com>
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
In-Reply-To: <20261113221917.3542509-1-elias.pukari@gmail.com>

> Discovered by an AI agent (LLM) inspecting the code. The issue was not
> seen on a real system.

MDIO busses pretty much never give errors.

> 
> Fixes: dbb7a95d810a ("phy: Add LSI ET1011C PHY driver")

Please drop the Fixes and submit to net-next.

Please also make the commit message less verbose. Assigning the return
value to a u32 is an old problem. Look back in the git history to the
pre LLM age and find a similar bug fixes. What do those commit
messages look like?

	 Andrew
