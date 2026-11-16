Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794834778;
	b=bwzKjnMBVWKPGApshcpcXsot6CsbPOC3aaFMll3KTX8Hd3BEpWAWFos8YKTk+wTO6oyr
	 DcTgBU8pOHwOidteXT5LmVi+mV6CJ2yK9KZD9ujozFpFkibtWhvJfkdRxAfiCsV+9iM8Y
	 lAnkC+qLkrNG9BzTZaJ3vzI40hk8DkrqZwutrE5LC4z6vL6Qkj88sCVLC/3W2jFtCX0Gg
	 AlvnrJD2hB2iOXIpERLG3whPUSV3kA6ht1FW14MydRE6c2c161+FinCt5nOrqK6Tx3Zmh
	 SxdRi0QmjpJ2OvZTkJQ1hbMUe5pCusLLPU60lcWp3dEnPkG3oca+ytWKYiX3dDRuIvQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794834778;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=eR1TAO1KpQ70DB/UKcSR3xzWieYvUaH0ci4hd1NHAfM=;
	b=ddge4pTK2liFoCv2Lr8nMG4niZFN8aNb+uz/11crI9+HMkyQ5tz9QkIQU8cUc5i1luGO
	 +lUvvOTSQ1qcEl4b9zBooMO5xDPbj4OJ5r8t4XczJzB7N0l35rKZSwR1EeKtMaXd64N9d
	 5I5+RYosmTqQjQSlwe40gJOAgkSsmdpjzyEJD3BKqjWC5bd0DJrLqNWsWVFczQOOf8Ddc
	 DWTwjquNUMLilOxjoMqKHysI4L8T5irfJaWW3sb1XiajoT74o0karLlIit06ZPBEgIGzc
	 m2VMc5pQCdm35AB93k6LEyM5Ai5Xv6y3Eo4goFLkmHvP3ngMwXiprMlVPkT2RVi/sMg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=pengutronix.de;
	spf=pass smtp.mailfrom=pengutronix.de;
	dkim=pass header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=An+IqOpY;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED97D606A31C;
	Mon, 16 Nov 2026 13:12:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ED97D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=An+IqOpY
Received: from ptx.office.stw.pengutronix.de (ptx.office.stw.pengutronix.de [IPv6:2a0a:edc0:0:900:1d::109])
	(Authenticated sender: relay-from-ptx.office.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 02A6F200668;
	Mon, 16 Nov 2026 14:12:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794834775;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eR1TAO1KpQ70DB/UKcSR3xzWieYvUaH0ci4hd1NHAfM=;
	b=An+IqOpYbU+o576Et049YNtN9mbpC6N5v0EPVcBdQcTanz9R6TKeTeYTKpkU1Me0oCdEOV
	2ckXJv87mwLysjhWEolcTZ33kgfyuxOb71eXTc2LD08PO+r3hHjDCAc1uP61eJFNGLlBAD
	6+X1E0lJXO6kYBZMCrouCaQgtnfzT/sJsrH5samRki5X9VyPc+H8Mbj0D/1kxGgIG9SZj+
	9MKyQAtvzYI3iKACT72In+qRdsK69K/aNu4rSDwKkW/GBsrzNZRN5yVXT7HSjI+M/CupXs
	baEc6ncSBtci6RAO1zglvnK1/Ql13QEjOatXhDLJ9DXS0MwjYUJXKcRsV4qmiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794834775;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eR1TAO1KpQ70DB/UKcSR3xzWieYvUaH0ci4hd1NHAfM=;
	b=BJRzSYHEeKpts0yand8iusFhlnke0C0xXNkvUSaIqfS2lz1SNCqU1bVLV2XeKXPuyXyxXQ
	/HOaFNDexhkHZonk5oPbd0t82Om2xcHcdRv2CCzQ1UcTvuqfT9wfYJPsg5bCInGLwpgR6l
	WhovWA4//hs86Po5NTh9ODPRe4trkzMYbnkUCwv+x08sZBbYVAYV+p3DbnwHjxuGnym9ZR
	dviKAdRp34yTqDtJm0kM3NU2QFoxuO2YDt3LdUDhfmKjLjI1hLUkfU7yA5vMvpF20wd+Vj
	vdo+40oo4upL0pqRMeSEUza125lWIxkdqKSL5BdzckSRJv4iy5NCUz7Hf2L3nA==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1794834775; a=rsa-sha256;
	cv=none;
	b=eJvB3uuNo3HUQPTW/YTG3qt1Ca6bYP/pYrNpYr68UTxGrCXFhFrhDCfXWGNeqUHYHVmKE8
	t3zlAnUV9BJtvzR13r0tHAw2ZmUeLasBm+NVRQOTtWVsMIfTluQFvsKz19odX53V3if1nq
	qLDSKkcOiatOJZYIMX+94ldSSA95Zm/4od/DlVfn5xRuvuzf+C0ySsXBw0gl/EV7xySEKt
	9lzx8r8VxYk4GMr6N3W2TqMAoiV/dKALSuqGe5B4t0bhnKntPhWFQPaTyxK767TEhuY2Ta
	UGH7TWEFX7ntKazm6g17pO40GsnhKCimdcMLZV5bCe7TQwGyYs3umVI2yYmhpA==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=relay-from-ptx.office.stw.pengutronix.de smtp.mailfrom=ore@pengutronix.de
Received: by ptx.office.stw.pengutronix.de (Postfix, from userid 1058)
	id D15061BFABC; Mon, 16 Nov 2026 14:12:54 +0100 (CET)
Date: Mon, 16 Nov 2026 14:12:54 +0100
From: Oleksij Rempel <o.rempel@pengutronix.de>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH net-next v6 2/3] ethtool: include errored frames in PHY
 receive byte counts
Message-ID: <avsBVtVgsluPNpVY@pengutronix.de>
References: <20261116-submit-acx00-phy-stats-v1-v6-0-8feef8e76cd5@gmail.com>
 <20261116-submit-acx00-phy-stats-v1-v6-2-8feef8e76cd5@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261116-submit-acx00-phy-stats-v1-v6-2-8feef8e76cd5@gmail.com>

On Mon, Nov 16, 2026 at 01:59:58AM -0700, James Hilliard wrote:
> Some PHYs count bytes in all received frames, including frames with
> errors. A successful-byte count cannot be derived by subtracting a frame
> error count because the lengths of damaged frames are not available
> separately.
>
> No in-tree PHY driver currently reports rx_bytes. Define this existing
> counter to include bytes in frames with errors so drivers can report
> their hardware byte count through it.

I do not think we should change rx_bytes.

Comparing PHY and MAC counters, for example to find frames lost between
PHY and MAC, only works if both count the same kind of frames.
rx_packets counts good frames only ("Total successfully received
frames"), and so do the 802.3 MAC counters aFramesReceivedOK and
aOctetsReceivedOK (30.3.1.1.5, 30.3.1.1.14). With this patch, rx_bytes
would also count bad frames, so two counters in the same group describe
different frames. A PHY without a CRC checker cannot fill either of
them. A PHY that has one, like ACx00, should keep them consistent.

A separate counter for bad frames, as in v5, does not solve this either,
because "bad frame" is not one thing. 802.3 counts symbol errors at the
PHY (30.3.2.1.5) and FCS, alignment, length and frame-too-long errors at
the MAC (30.3.1.1.6, .7, .23 to .25). A symbol error points at this
link. A frame with a bad CRC can also come from the link partner.
rx_errors already means different things: mxl-gpy reports its RXERR
counter, qcom-phy-lib and dp83tg720 report CRC errors.

Strict definitions would need a counter for each combination, "include
everything" would make the counters useless for diagnosis, and moving a
counter between fields breaks existing users. Also, few people have the
hardware to confirm what a counter really counts.

I suggest metadata for the existing counters instead, similar to how
ETHTOOL_MSG_MSE_GET reports the scale of its values next to them. Old
user space can ignore it, new user space can use it, and it lists only
what is confirmed for a PHY. Andrew should agree to this direction
first.

For this series: keep rx_bytes as it is, report rx_packets and rx_errors
as you do, and keep the byte total driver-private for now.

@Andrew?

Oleksij
