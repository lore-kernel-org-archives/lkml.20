Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794754928;
	b=Etsvv/FtPrH4+6aq64kvDl2pWQgNWbx0hEQz0AGI0Kk/y32VC1dj1KKbjuraa7UuJ69Y
	 uLlJevMo0Z+99ZqRsEPDsOjfJbSmSUUvr2/pkRhzY+5fQ9iONXK9feUqPAWsOq0A0yX4X
	 cQPYaz6FsPTiyb8ov/k6J6A8XeYkP36H3wspVu06Q4O4FJrJPpYDOLhLALGJESffEWt2r
	 CXp5ToUkedGr8tBFBpF54mXYubxsYHMYqdIvhGp9rlNN/Fq5AjGNmtJksPFslBVTp5Dcj
	 v5sOD25rHcBljSBTs0haUZRNN9JwE6CTUZW//C0VUn5G8202Qe+CAyOx18sfvJzbNqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794754928;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=yBTWou2BsHqQNs7uI7G7qLPjBIEQrve1MbCQWw8GcX0=;
	b=ii0f9+L3Wz4juvwd+nBGasExGMjdYOSEeWJ3BhD5axJEHwYwDc8838R7jkpfDWSKCl5G
	 eaJe56nO2jo80nFwZVB4nYVv+wrnhEctJvpDl/fFIrMBeIK/PwPs1uE6vSDdwypNgua1l
	 pFJ0UenBgwaGFFANxum27PHYmCbxJOsefB3qxJifIlDLh9DlRFUz74ZAP338k+DiknmiW
	 2elnuR1v46tSFw0tovIEyZKHbcV/soGdWDTM9FpnTNZvCahPBZphljKByZqiP5MCfQ9GO
	 prRVtfTpnYmlJUfu5UegOS6fZ1QDC8l8AFyuoZXP8zErhcRAiY8LGu2XxHOzOwqDbrw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lunn.ch;
	spf=pass smtp.mailfrom=lunn.ch;
	dkim=pass header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b="l/KJNFj7";
	arc=none smtp.remote-ip=156.67.10.101
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 934DC606A31D;
	Sun, 15 Nov 2026 15:02:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 934DC606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=l/KJNFj7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=yBTWou2BsHqQNs7uI7G7qLPjBIEQrve1MbCQWw8GcX0=; b=l/KJNFj776ASJUjBj3QZDZSPCB
	htL7aX8dhvLlPKpfhW94Wyjta4qRGV/zHIHDgcOLP9Jdjenvr0o3oijqNyFt3aNsymzXtUnaerJNe
	62UWTmyyy2BHWunyLzgp45x3rCiKBLmABwDjquyHUyqjz5lLjziRr6Ctrb/9wAtn3XIs=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xSbjp-00GdC8-NA; Sun, 15 Nov 2026 16:01:49 +0100
Date: Sun, 15 Nov 2026 16:01:49 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Oleksij Rempel <o.rempel@pengutronix.de>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH net-next v5 1/3] docs: networking: correct the PHY
 statistics group name
Message-ID: <21dbbd96-ea99-4c7e-b207-a9c478b97500@lunn.ch>
References: <20261115-submit-acx00-phy-stats-v1-v5-0-ed81a7f54373@gmail.com>
 <20261115-submit-acx00-phy-stats-v1-v5-1-ed81a7f54373@gmail.com>
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
In-Reply-To: <20261115-submit-acx00-phy-stats-v1-v5-1-ed81a7f54373@gmail.com>

On Sun, Nov 15, 2026 at 12:45:45AM -0700, James Hilliard wrote:
> The ETHTOOL_STATS_PHY group is exported as phydev by stats_std_names[],
> but the ethtool netlink documentation lists it as phy. Use the exported
> name so the documented group matches the statistics string set returned
> to userspace.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Thanks

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
