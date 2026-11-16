Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794836223;
	b=CMUsqvDniDTXNQuGfIHZvk+tstznyOpfGMufTwPL4pHDFVPXEgOqjzw9B9t2e2W1obsK
	 UPU42wfkYRYzt3VL6LDgdirWHb4U628xafI6P1eZKCzX/J27Z02glOWMPxl+lZQQMwpR2
	 Zs9VJRb/QQzSM8QB/wUtzY4jYjQ+yNfw3snBG78Lg+zPD82N1Z6jCJJz8GEPb92da2rRc
	 omxllMPMFZ2BqPBIMDhlFglz6/hIYDdsdOjbkfu4736lttkzTu5UWGr9rooxZbjRlOVAz
	 CEBXXz1JYujEouKIuqdBWU1VKxwPM9sjrNE6MG3S2ZdTqPLmdkLyfwKwqkPkjqRJkFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794836223;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=OdBeaXUT7gswKZvG3iji3iJuFk7SxZNRLeboJrH80cY=;
	b=GE7yOTNd0P7OmiSMvKZMXWLGvyyIxUZNqHYygzH7uUcdEEBZZyzZ703i87kBS6h8UQWx
	 SmlEyoPwreq4goO6N+dUK35zz0aT+88eQDjkE5BJ9R5yYJ9wCH/f/xYJV0q6/DAqp2rDj
	 DZNezWKn5nw15bCFQP4dZWFB43L030E1nJANdtAuNpWbUYEd9M8TPpbwX/C6qzn5mLErQ
	 UtbA7IO1yJyHjCsciDzdSFh+tAyCfZhgZJzR9Hrac5fSTSC6KegpfMxCVI+7iud0iFlST
	 Vx84gnrRp0bxCgKg9lRrHVKMug2OX+q9Q9wWze70POW0GyAkeOwvuY455ir85lwMCXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lunn.ch;
	spf=pass smtp.mailfrom=lunn.ch;
	dkim=pass header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=d+v4n57E;
	arc=none smtp.remote-ip=156.67.10.101
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BACBF606A31C;
	Mon, 16 Nov 2026 13:37:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BACBF606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=d+v4n57E
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=OdBeaXUT7gswKZvG3iji3iJuFk7SxZNRLeboJrH80cY=; b=d+v4n57EvTSzy1nxKqUYnrph+P
	e8FLcNMurUtuiwQj+eBAEBt2U1gS5tnVsTFq59Ew2jPyKe0cklIbd+s30pLJKXBIyrtrC4NJ3Vrv8
	hLio4UCftuzUnI5CnwW5nETp3FVow4f8uOGL34XiD3DfMmpu1Zi6YyaS0v6WZtYXWoJs=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xSwtE-00GvEX-FX; Mon, 16 Nov 2026 14:36:56 +0100
Date: Mon, 16 Nov 2026 14:36:56 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: David Yang <mmyangfl@gmail.com>
Cc: netdev@vger.kernel.org, Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v5] net: dsa: motorcomm: Add devlink info and
 resources
Message-ID: <1c51b9de-a6be-4996-a0e6-1438eab8a069@lunn.ch>
References: <20261116121627.1182631-1-mmyangfl@gmail.com>
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
In-Reply-To: <20261116121627.1182631-1-mmyangfl@gmail.com>

On Mon, Nov 16, 2026 at 08:16:20PM +0800, David Yang wrote:
> Expose the ASIC model via devlink info (ASIC_ID), and register devlink
> resources for ACLs and meters.
> 
> Signed-off-by: David Yang <mmyangfl@gmail.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
