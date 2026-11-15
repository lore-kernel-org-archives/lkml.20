Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794767091;
	b=Wq8tBjU484WinRCVLI/uhbstqbNbsZ0ZDZnrsm/JJGxJgzS/rhCvwumtSVlz63t8MOWf
	 ABGXyC6lUFO/38b89o4lw5FcF6KuUMfpBrFd829B4+Y6wPRQfFCgHZcsPCmsS/Qu+n2sK
	 P6Hi0FNiZScrdeN8j1kCtu1nH2VRFZAKEb1KQG+wTpv6tfH/I0UgcoGYGpv3C1FlMN7Oc
	 oSd6C2mj7bHMvrMfiQj34pEFLMKbV4WcfdGcD4yz/oZab9KB50qCBDxYnjrYIlWZUX0gc
	 nMmE7PCR5zpRu6Jdpqhyxbw3gStjpvU71ludcdypCsy2jAWZ16TvETyxb6VbcqqqxDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794767091;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=Q7h5sHivOvvnGFN4BWklWRuGzq8WV7a3Iv/4wV30Qfg=;
	b=TjmazPCQswZkjQGnBsym2FGsnI4Y0fBh+TwhF96mtS4offHXckapK2CYHQqFtq/B51dx
	 xMh2NXZoOBBorFpvXdcZ3Wf/oVy1vecjUxIm5XGIcuu3rraEEi7pVV1VuiVJf9yfkovcU
	 YDpwZCtfOuBoDuWHxXX2FYajdWcFcasOFuDEiwF1ZJkZvk50tgjTUR+a4jwFv7Zjb/xC5
	 ox95ye626+0x/1woiTcY2Btq2rErs+2A9J3TFIJrwdLirdJPKEkuSvr7TFwEa8Lt+jQe4
	 yeywtUTbelipCN3sAxKKaa0ZLmIr530Apltc3bnzEDNWkzMLyUTLwICq0FalV4figZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lunn.ch;
	spf=pass smtp.mailfrom=lunn.ch;
	dkim=pass header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=BsEwvHHR;
	arc=none smtp.remote-ip=156.67.10.101
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCFBB606A31E;
	Sun, 15 Nov 2026 18:24:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CCFBB606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=BsEwvHHR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=Q7h5sHivOvvnGFN4BWklWRuGzq8WV7a3Iv/4wV30Qfg=; b=BsEwvHHR/j7zQrShJFQZN8CX0N
	VF4aIrrXv5GXzCJXb+z5GbEB69HbUbCVh/h5Je97NlfAhxolZBlhNwvhPUkrlFpMsm64ekZO8FL1g
	1V4GuSrvJJZTGdjm0ekQcaWP29ccENnSpkq7IJCF53ww6NscIpBCz0U4/U+2z8SYLIJA=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xSeu6-00GePV-Rs; Sun, 15 Nov 2026 19:24:38 +0100
Date: Sun, 15 Nov 2026 19:24:38 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Elias Pukari <elias.pukari@gmail.com>
Cc: netdev@vger.kernel.org, Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v2] net: phy: et1011c: don't write an error code
 to the config register
Message-ID: <81110bc1-865e-4107-bac2-86d5edcd979d@lunn.ch>
References: <20261115180735.649299-1-elias.pukari@gmail.com>
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
In-Reply-To: <20261115180735.649299-1-elias.pukari@gmail.com>

On Sun, Nov 15, 2026 at 08:07:35PM +0200, Elias Pukari wrote:
> phy_read() can return a negative error code. Use an int and check
> both reads before using their results.
> 
> Found with LLM help; fake-MDIO KUnit error-injection tests passed
> (6/6, KASAN). No hardware testing.
> Signed-off-by: Elias Pukari <elias.pukari@gmail.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
