Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794903924;
	b=JTd1C3dekWMGLmocfaETalL5F7CAgRZkRFvyqR2MbiSUjpTOWhtmpDAvKwEMQKgmjkPT
	 v2DXQhLKpQjghYTGP8JobYKSy/rkmeun8DzVWEtKaDodfRlVlfw99LWghTNs4ksaz9Cf5
	 7UiTSBDP1/addxgR9alybIWzkL8PRC4CUVFR7MWM7gAlhnQHLz8eCYO+kMSLkHycP6/ZX
	 eGYKC0szjRneEHyovo4GOSGtUN8f7uC+/MTVj2jXCn3NYHtQwTCQmwIsCKgMiLFOJKzd6
	 78cOOgXuLJuhGWDYeDBZFfc/62RmoKLi60rQyOAIo1is0dYDwFBXfp2BlD5L++ADAYg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794903924;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To;
	bh=W8X/J5oiJuAlTRNhXCPD1THo1rdeVV7zxn/b41xiVSQ=;
	b=FOFYV9aJQm8SWjEr2515x/vkL9q/4VZggOzJhzez0Pi+ZwaEZzJvB1teeS82EAjE+LAO
	 UOlCitRp8U6ar0e3Y/nj46R1bgu/8OW2PZEUroQKuxd43TiAMgza0Q2zKM7KDWTcrhiQI
	 4tqe1SDktv8F4MZGmO5OkneXD3jhEpHWsjuFD/JWnWmgbp9276tRSQ8EMlmMU1tIiDGy+
	 2aNIre33IDITC5wf9kDv+WbP3gib9L9hLScRqBr/JQptqVhI0D+Ec7QT3zyrZArOwpii6
	 hLzDJ/cSObi6+hW1aREpP+VDLaK1qZzz/Kb7utr7teDlipiHPxxWNPisev4tObIVa2Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=pengutronix.de;
	spf=pass smtp.mailfrom=pengutronix.de;
	dkim=pass header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=DJaUkqiQ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C131D606A31C;
	Tue, 17 Nov 2026 08:25:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C131D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=DJaUkqiQ
Received: from ptx.office.stw.pengutronix.de (ptx.office.stw.4.pengutronix.de [10.9.0.3])
	(Authenticated sender: relay-from-ptx.office.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id AE19D205A22;
	Tue, 17 Nov 2026 09:25:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794903915;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=W8X/J5oiJuAlTRNhXCPD1THo1rdeVV7zxn/b41xiVSQ=;
	b=DJaUkqiQJcMPWk/vHA31r9KflvyGttdgURkEUfeEEq0RVhcYi2RTYIvOS26V1y+WbQVb7u
	CnQyIsLtp96daLy01/sdBGnx//4zhy9cmWmmyf3AbXO52sFBOE0Q0shAUAQIMz7h02HR3P
	9ea6EOuqnm0HA1GvBKynFB23F5paTPw7LOUvZ/H2Hl1Is148KR8kkSObh9tepvXMdJsJgg
	B06T0ieP820UXum+lcw0XJz7dde3ev5aJSeAJ+4gqUtyXhOmuajd/TUpvb0QYX1I2fd3rD
	zLZMtFOWaNBMQeqJGPIQBMCJrDSf+rsJq8AmgN3QsEm1Vh2EnRvenMCpn7vpuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794903915;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=W8X/J5oiJuAlTRNhXCPD1THo1rdeVV7zxn/b41xiVSQ=;
	b=Uz3dw86zwwis9NVuqV8NgCbeXd69jWYUGabiJ+cYCRbv8R6dVEGZPwMLrxWK+s0lyZknLE
	xzEZy1vBEz1okfKvChWmLBuZJfEDQQOW9Jft40HawKQfQVJt/bz/E93yxUpfG/FONHcltb
	/XBl5yDmmhY3ResMPXKteyB7mOhxyVYlFqau+YuPhE8otjPp2rQWaP/kod12KK/MwXSc9N
	Eav0VBwxHKE8awYGljSs5LAaQRGyxRcg7liWEqqkAfISVJBKITAK23idT7nYTlWK5EGMnN
	7SiWlm4TbeVoEeWTMO6Zw22InfYUGcQQcTxT++lag4NJHI2kGARchfNTZIdPEw==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1794903915; a=rsa-sha256;
	cv=none;
	b=d6z/8mr9UjNhScuaaVvEtHEvXHgNVpOXth0uo0nc6dZOwc7NQ1QQBm632uRIg5TdyqcVxz
	uSygcj5lVKOh+alViKW5qN7gJipLGY1P6M8Cj8cuCAhpEbASxYaKUi0TJd1i25zTKE0uiu
	jTpjDnlafKsaxFFoPvZ/2hrUckYyeHq+rb0Tb7c0Lwr01Kq54Z1rq3JgmLoogsnxhdEo8P
	h/qpJU2U2seWj+Fs4rLwh4xlxrRrNZ3k1F6GXAMP3rOCA+obpVX8tPYqun1VsI3Nz9L195
	ahhZW2UV+4HtZ6DUnXGJAKRzOAuhDenKCrZURUxS7MvAnCzO/5gaP3kOLjRzUQ==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=relay-from-ptx.office.stw.pengutronix.de smtp.mailfrom=ore@pengutronix.de
Received: by ptx.office.stw.pengutronix.de (Postfix, from userid 1058)
	id 8F6B01BFA5A; Tue, 17 Nov 2026 09:25:15 +0100 (CET)
Date: Tue, 17 Nov 2026 09:25:15 +0100
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
Subject: Re: [PATCH net-next v5 2/3] ethtool: add a PHY receive byte total
Message-ID: <avwPa1MTMjf53lWN@pengutronix.de>
References: <20261115-submit-acx00-phy-stats-v1-v5-0-ed81a7f54373@gmail.com>
 <20261115-submit-acx00-phy-stats-v1-v5-2-ed81a7f54373@gmail.com>
 <37e4b9b8-d381-448f-a2b3-b92d7bd9033d@lunn.ch>
 <CADvTj4qh8Pvss+xEwcjshodwv-yN6haP-9aaeRXg1ydSu5ibVg@mail.gmail.com>
 <d3f2dc1c-9daf-4b5f-903b-657ae3f32647@lunn.ch>
 <CADvTj4opiu_vhat12BRzk61b7ymG+g12c2aoK+rcZHjpWZjL4Q@mail.gmail.com>
 <b84021aa-f843-4668-8172-0afcbb97c27f@lunn.ch>
 <avtHbulALsI61uVr@pengutronix.de>
 <CADvTj4ocz9_rMDbDG1xOPALNw1yx9ypXp0S59sh04wSv_YMyrg@mail.gmail.com>
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
Content-Transfer-Encoding: 8bit
In-Reply-To: <CADvTj4ocz9_rMDbDG1xOPALNw1yx9ypXp0S59sh04wSv_YMyrg@mail.gmail.com>

On Mon, Nov 16, 2026 at 02:20:50PM -0700, James Hilliard wrote:
> On Mon, Nov 16, 2026 at 11:12 AM Oleksij Rempel <o.rempel@pengutronix.de> wrote:
> >
> > On Mon, Nov 16, 2026 at 02:14:38PM +0100, Andrew Lunn wrote:
> > > > > Think about it.
> > > > >
> > > > > If you don't have a MAC, you don't have FCS.
> > > >
> > > > There are existing mainline PHY drivers exposing this functionality.
> > > > The QCA807x/QCA808x drivers use qcom_phy_counter_config() to enable
> > > > CRC checking, and qcom_phy_get_stats() reports the RX CRC-error count
> > > > through ethtool_phy_stats.rx_errors [0]. The IP101G driver also exposes
> > > > a phy_crc_errors counter separately from phy_symbol_errors [1].
> > > >
> > > > This demonstrates frame-aware diagnostic functionality within these
> > > > PHYs, rather than something every PHY necessarily implements.
> > > >
> > > > The generic byte counter need not require that functionality. My
> > > > question was whether rx_bytes should count received bytes without
> > > > conditioning the count on FCS validity. ACx00 could then report its
> > > > hardware byte total through that field, including bytes from frames
> > > > which its separate CRC checker identifies as bad.
> > >
> > > Read 802.3. What does an 802.3 defined PHY actually allow. That is
> > > ideally what the kernel should support with these counters. Lowest
> > > common denominator.
> > >
> > > So i would say RX bytes does not differentiate between the frames the
> > > MAC will later throw away because the FCS is wrong. I would say it is
> > > also O.K. to include the preamble, and the FCS, any padding up to 64
> > > byte frames, etc.
> > >
> > > Since this counter is not actually defined by 802.3, i would also
> > > allow some flexibility in its meaning. Different PHYs might have
> > > slightly different meanings.
> > >
> > > Look at it from the other direction. What is your use case? Does the
> > > exact definition actually matter? Does it matter if a different
> > > vendors PHY counts it differently? Does your use case require cross
> > > device compatibility?
> > >
> > > You have not actually said what your use case is. For new board
> > > bringup, debugging broken networking, the exact definition generally
> > > does not matter. The PHY RX counter is going up, the MAC is not,
> > > something between the MAC and the PHY. Neither the MAC nor the PHY
> > > counters are going up, something between the RJ45 and the PHY. The
> > > absolute values don't matter, its that they change which matters. But
> > > maybe your use case is different?
> >
> > I agree that for bring-up the deltas are enough.
> >
> > In the field the question is usually: is the board broken, or something
> > outside of it? The MAC counts FCS errors both when the line is noisy and
> > when the xMII corrupts frames. The PHY is the natural place to tell the
> > two apart, but only if we know whether its error counter checked the
> > FCS. Without that, the wrong part gets replaced.
>
> For ACx00, rx_errors specifically reports Ethernet FCS failures, not
> symbol errors. We verified that with PHY loopback and MAC FCS insertion
> disabled: a software-generated valid FCS did not increment the PHY
> CRC-error counter, while flipping an FCS bit did.
>
> That establishes what this particular counter detects. It does not
> distinguish corruption on the link from a peer transmitting an invalid
> FCS, but comparing PHY and MAC observations could help locate where
> the frame became invalid.
>
> > I have seen a board where MAC and PHY both provided the xMII clock.
> > Frames were lost only when the clocks drifted into a bad phase, so
> > production tests did not catch it. A PHY that checks the FCS would show
> > a clean PHY side, while the MAC counts FCS errors from time to time.
> >
> > So the meaning has to be known, even if it differs between PHYs. I am
> > fine with that, as long as rx_packets and rx_bytes describe the same
> > frames and the driver says what they include, for example which errored
> > frames are counted and whether rx_errors counts CRC or symbol errors.
> > That is the metadata I suggested in the v6 thread. The ACx00 byte total
> > also counts frames with a bad CRC, while its rx_packets does not, so it
> > does not fit rx_bytes.
>
> In the original v1/v2 implementation, rx_packets and rx_bytes both
> reported the inclusive hardware totals, including CRC-bad frames [0].
> They described the same traffic, with CRC errors reported separately.
>
> The packet count was later changed to subtract CRC errors to match
> the existing "Total successfully received frames" definition. That
> introduced the mismatch: the hardware does not separately count bytes
> in CRC-bad frames, so the equivalent subtraction is unavailable for
> rx_bytes.
>
> Should we revisit the original approach, with both rx_packets and
> rx_bytes reporting inclusive totals and rx_errors reporting CRC
> failures separately?

Before we decide that, I have one question about your test setup. In
your mail [0] you wrote that the MAC drops the 63-byte bad-FCS frames
without creating a descriptor, even with error and runt forwarding
enabled, and that MAC-internal loopback shows the same. Which MAC is
this, and does it count the frames it drops in hardware? If it does, I
would expect the numbers in the ethtool rmon group (etherStatsFragments
for bad-FCS runts, etherStatsUndersizePkts for valid-FCS runts, per RFC
2819) or in ethtool -S.

The answer tells us whether a PHY/MAC comparison can account for these
frames. As you noted, a difference between PHY and MAC counts alone does
not indicate a fault. But if the MAC does not count these drops, nothing
tells a user whether the difference is such a drop or real loss between
PHY and MAC. The same holds for your valid-FCS runts and length-error
frames. The PHY counts them without an error, and the MAC discards them
or reports a length error.

Could you hold off on v7 until we have this answer?

[0]
https://lore.kernel.org/r/CADvTj4qMgKrRZ_uq3K4t2+w_3eai4dwuCPod_vhEKEOsO85_Wg@mail.gmail.com/

Oleksij
