Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794757236;
	b=DSSuPg0jUw//cxebQ7fP5JuJlEq60cREej2y203LGESNjSdoVu4LznBFXUt/KZ3ZNP7g
	 I0yCu4Yp6vBZvka+mYdT3E8MMSFS3mpGagIVReY65fq5MLy5n2DDICF8rEwCX2I0UGMFo
	 1i4kXkdv31X4UQ1jcbSkYQYvyTWaA+hkwN6euvTAIeYpcsnaN2GbhsN1mp4v4KOwGNUUY
	 Zw7Zlr0eyU4vyFi6BBjw+vr/If2WuoMpqJceB1LJ3Do91E605rcdvE69PEhTYdN8Tdnug
	 LU9IqywOt56vIzIjeb0NEJAuXIhptL5ZwR0AyEBDTauF1H798PCAK78/yBku2vKE4cQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794757236;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=f5HX+yAVrB8F2pjsF8sji6JVCmbYuW4vsp/eHAbGp4k=;
	b=Eq0U+g+5Ivuqcjxpxvg/U9f2pVnwYNzmOFmsDz1vfFbyBCwE3sNKbadLRnYgjRaC7Keh
	 2bVNTzVHfXZkJieUhBYp73vO4VzFag8b3HIDc4SrhmAAipIjgnUt15nbnJIDMRjyUCyhJ
	 loHOMGIrSCa8abC8ZXThiS6gaYLKJFIEJvvAcU7fu5NZx2qJlViEMr7b9kHtXDQg7DWcY
	 uxs4bN0nxnI+rfsDbgtgFAKnf3uPvgQc5Il9VvLIj+j3Z9BICvSLPA9lzTIDh8dYESYy5
	 zWPEDspRH10XZt5ZypjuS8U4MptnRt7JJcRriyo8FCxz0o/PTEKoMThX+k+t+FYUjTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lunn.ch;
	spf=pass smtp.mailfrom=lunn.ch;
	dkim=pass header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=cS1JMUss;
	arc=none smtp.remote-ip=156.67.10.101
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A2DB606A327;
	Sun, 15 Nov 2026 15:40:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1A2DB606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=cS1JMUss
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=f5HX+yAVrB8F2pjsF8sji6JVCmbYuW4vsp/eHAbGp4k=; b=cS1JMUssqSxKWV6vwCmwUR83He
	Jsx8xh4M4vzCMb/6yylQMHlklJAUypwSNbtrHAHBJnzZ7db4ZV+tvMyZtRHDDxg7uVd6TSTPE2yu4
	22PNv7Mx9rjvj6p/DzTpZ3f4YAroC53FqApVa0OLZPVTctFTNjgGwye9JVNjDywrEnCE=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xScLF-00GdR0-L1; Sun, 15 Nov 2026 16:40:29 +0100
Date: Sun, 15 Nov 2026 16:40:29 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Oleksij Rempel <o.rempel@pengutronix.de>
Cc: Woojung Huh <woojung.huh@microchip.com>, UNGLinuxDriver@microchip.com,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Arun Ramadoss <arun.ramadoss@microchip.com>,
	Jiri Pirko <jiri@resnulli.us>, Linus Walleij <linusw@kernel.org>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Vivien Didelot <vivien.didelot@gmail.com>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel@pengutronix.de,
	Jens Emil Schulz =?iso-8859-1?Q?=D8stergaard?= <jensemil.schulzostergaard@microchip.com>
Subject: Re: [PATCH net-next v2 3/3] net: dsa: forget the port ageing time
 when the port leaves the bridge
Message-ID: <42151227-f088-4b7b-931b-45500943204f@lunn.ch>
References: <20261115-ksz-stp-ageing-v2-0-7af27320033e@pengutronix.de>
 <20261115-ksz-stp-ageing-v2-3-7af27320033e@pengutronix.de>
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
In-Reply-To: <20261115-ksz-stp-ageing-v2-3-7af27320033e@pengutronix.de>

On Sun, Nov 15, 2026 at 11:59:53AM +0100, Oleksij Rempel wrote:
> Clear the cached dp->ageing_time when the port leaves the bridge.
> Otherwise dsa_switch_fastest_ageing_time() still uses the ageing time
> of the port that left. If the port leaves with a shorter ageing time,
> for example during an STP topology change, the switch stays at the
> short value until that port joins a bridge again. With this change the
> switch goes back to the long value when the bridge restores it at the
> end of the topology change. The switch gets the restored value only if
> another port of the same bridge is still in this DSA tree.
> 
> Found by code inspection. Tested on a KSZ9893 with lan1 and lan2 in a
> bridge, ageing time 300 s:
> - kernel STP, forward delay 4 s, lan2 removed during a topology change:
>   without this patch the switch stayed at 8 s (2 x 4 s). With it, the
>   switch went back to 300 s at the end of the topology change.
> - no STP: I set the ageing time to 10 s, removed lan2, then set 300 s.
>   The switch stayed at 10 s without this patch and went to 300 s with
>   it.
> 
> Fixes: 34a79f63bbe4 ("net: dsa: support switchdev ageing time attr")
> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
