Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794668063;
	b=AleSLr2s8u8tKcc7AcW01EGyk+VMRmYAiwxNOp+Mq9eJ3IO5hZ8muHThAmDmXMr7Oao/
	 rR1NaUhXmpN4yqtgprEnx3mOUIXayvjdzrc5DXzujeTaCXQzV9wue7KozQBJQuuPQf412
	 yPeRmtGKvTFfvUMM8qG2xCneQW1kGtP6wkhDQLcFM/NRFabGcs74MeEgaiOSVAhHgTh3M
	 EovgXfUg/ym4Qy918JIFhNaVO2ycnKVpOxdDS4e2Krxwh3yKyO6xbmg22BJL9+mbTg7vj
	 Xwn9+poybO51Bb+zTnCoI+lgzB68PucBU/Sv4YL5sIiJXJPW882CUmtFNGEc5p0ZsqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794668063;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=kgDRQFvvfjQZkPMqc9sNVxcY05Fagrbh4c9pSkoSO9I=;
	b=eibhdGEovxg6lWEHnV6qY+pjLpSHb/gdrDbmASShx1UNhizkY+JMyJTKJrR4q4r6yagL
	 cS2KA9H2yyyqYj85ejOxMKY0PRl9CSrLL2udOCjN4hT0ayoXrl4g3dA2z+5VD98YdGb5S
	 0/90uY7Hd5H2Q3icwdXZ2kZF/TS8Yn6Lv0PdMBPdhMtR8TRLIfjXVPOg8TGr5yJI5hJOm
	 bVKcofDeEdJ07IipQED6WGT8pHYfx0v8DFS6qeiwvkPTjDnSIrlBbcTwGJ2ttAKWAuzqe
	 aGOnVqn9O6cVzZN89BmZTAWkdwjDJp7erVO0GurpDIY3sb88jKbX6aNoernNLy2d4hw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lunn.ch;
	spf=pass smtp.mailfrom=lunn.ch;
	dkim=pass header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=FeuXP+eq;
	arc=none smtp.remote-ip=156.67.10.101
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E447606A323;
	Sat, 14 Nov 2026 14:54:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1E447606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=FeuXP+eq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=kgDRQFvvfjQZkPMqc9sNVxcY05Fagrbh4c9pSkoSO9I=; b=FeuXP+eqev/PzBKpj9mW8d8W2x
	eE8bX262SZsAL7oYIZDoFl3Zd/rYunoXDBny8KscRvGel99rtMr9g+dznWsWh/avO7t0kC3CKdfmb
	HZSNMKG1zZuBQ9+/XwGvfcXEqQqWcT7yaZ5FkvGIoRzVLzgkYKeI7w9X4AvB44kwX8Wg=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xSF8l-00GVVx-5i; Sat, 14 Nov 2026 15:54:03 +0100
Date: Sat, 14 Nov 2026 15:54:03 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: netdev-bot+sashiko@kernel.org
Cc: s.trumtrar@pengutronix.de, andrew+netdev@lunn.ch, davem@davemloft.net,
	kuba@kernel.org, pabeni@redhat.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, afd@ti.com,
	hkallweit1@gmail.com, linux@armlinux.org.uk, michal.simek@amd.com,
	edumazet@kernel.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH net-next v4 4/4] net: phy: dp83867: support setting
 output-impedance
Message-ID: <f484a5cc-7283-4bf7-88ee-da68ffcc7647@lunn.ch>
References: <20261110-v7-2-topic-dp83867-v4-4-a268f83b1ec1@pengutronix.de>
 <179465553811.2199510.12732274072788992215@kernel.org>
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
In-Reply-To: <179465553811.2199510.12732274072788992215@kernel.org>

> Would a raw register code property work better here?

That goes against DT best practices.

> Another option would
> be to document the ohm value as approximate

This seems more reasonable.

     Andrew
