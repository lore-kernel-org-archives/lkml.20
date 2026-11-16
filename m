Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794835823;
	b=tdaThfxglQ+VkCLBBp3mjUOHRT0YWSZlT6DQj9HoDJzpV94ZXrGz6C00bQ3qnZcNIpQW
	 c8C9ZogH7CwITrQhvb+y3jCZ+fmJRlmrH4cNVGEMJT0TjQlaINSCClOFo/PtM+05XrAoZ
	 qY0lICNnrG6mZHuvZF/IuULeiRwIdu7xIV6FG5VHCpE4+6lC0HTmnKNLtXKOSSJZvG++y
	 mJMA7WpvT4MO51WaPOVM0Pnq/Uauc+K/Uo54teC6z2jwdLUMjfBCLeDad5dlxwUmzGCYL
	 hP0MivL+g+H7PBr+fM2SrqvYLi3geFrvXLvG6J1Lzthpja6jMbZP1OqtDKIHd4WuEWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794835823;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=vZaX2J5+vwNpID/DJxwist68NuONiDqxytoCJR8lOss=;
	b=FmDNk6BfNQljEJLvTLkgibG17RKuUQS0FH6YgOOly/bb7pbILAj1mhh1D62ImC0xonjz
	 gINn/hHx6mTg+FyHL3ioEgc7ybd9YFPgF0pH2LfyGCa7BzvR9IpQTvjN5DcBRVd3YnQX1
	 5NP15ftqhyM1idMQ6JPxqzdWPHz/2IOXfd+JkcQJvoEgZn2jiPiSurHnmRF8vi020W2hR
	 S6syRjcB7exJZaUQNANFwTJ5JUv8WBAItQ6xZY9yYTLK2/xX2XNjYgen5I/vITxeY01eM
	 cI3Fj5WbpRd7woqYUE0GAJF22T7G3b/vf/CalLFR8eCpXLXIjhvWotODTfhKwO698VQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lunn.ch;
	spf=pass smtp.mailfrom=lunn.ch;
	dkim=pass header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=ssNDR6M5;
	arc=none smtp.remote-ip=156.67.10.101
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24756606A32F;
	Mon, 16 Nov 2026 13:30:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 24756606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=ssNDR6M5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=vZaX2J5+vwNpID/DJxwist68NuONiDqxytoCJR8lOss=; b=ssNDR6M5Er6lwcsinEhhxBV2Dl
	VRlrbqsrWyVyZDrXmr4nZ4mOt4y6ofWZySGdlqL4phtKd3b77UJ1KmmFn/UGsOPWoY9Qn9UBifekO
	dF9Z6XmE7bxRkF2DB7ghUentNC0n+PvzWjJfnuTfmuKaTtu6oIhjUA2q4FmDlCQj2syo=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xSwmh-00GvAN-Uq; Mon, 16 Nov 2026 14:30:11 +0100
Date: Mon, 16 Nov 2026 14:30:11 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Francesco Dolcini <francesco@dolcini.it>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v1] net: pcs: xpcs: add 10000baseCR_Full to
 10GBASE-R link modes
Message-ID: <2612f833-e468-42cf-819f-148027c22d52@lunn.ch>
References: <20261116101644.83097-1-francesco@dolcini.it>
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
In-Reply-To: <20261116101644.83097-1-francesco@dolcini.it>

On Mon, Nov 16, 2026 at 11:16:44AM +0100, Francesco Dolcini wrote:
> From: Francesco Dolcini <francesco.dolcini@toradex.com>
> 
> An SFP+ direct attach cable is reported by the SFP layer as
> 10000baseCR_Full, and this link mode is missing from the 10GBASE-R
> supported list, therefore xpcs_validate() masks it away and the
> 10GBASE-R interface cannot be used with such a cable.
> 
> Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>

Looks sensible.

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
