Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.217.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794864063;
	b=arYBydUEI6qQ7dWUeQcFKQ9u86qe8RUsAoDn/zeQYZPDcpa+kNv1i/bKotF1LXTMkRrS
	 OewlXttPvG16irw3j2Zor90Q6yspntveG2cw8UqEu4ilOIKAZ65AuQ4gz/mI3iq33lvnW
	 yZjSEgWuAviUjGtapvTv+K1eQ79h5KTz/UwByLVum5P/9hU1856s9yOEGOxyLznp03WVL
	 RT0gK6DZ5BXPXWbhK+S50KZ4qmmkzikPzX+TxRvBOV5aF5ft/7IwypApdpVhlElznb2V3
	 htocvg/vlOK+ADhxE6mqZOGGfJZ8zBs4YVhHzs5nyJQRV/koIMa1wKKQCAVt1oOvtPw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794864063;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=1xGZrJjN0Ny2SZfb7cMMUTGUER0EysqnRYr07qyNESE=;
	b=IVo6ydWeFJxWks5pY+9yIfYZTqweLVOs27NN6DTkbaMszaszAAxqKCAn9D0wWOgFcFPv
	 fyMxwyfz/+fkyl6Vi3gkSe9SNpiH4wyMGH/LyfYSn5PuFRaxrJ0SNb+s5I3G9/cW5sPU2
	 FW+IKUFElph57dCWpGWRosbK4l8dCmb8/YCBSHpemHk1b4sB0ss3QX4Ytxkf2xkrPcuE7
	 eOP9JMzeJeIVwK2f64j4xFpRMD2AnZ4zMTk/DwCxULhfEEw2JDfZRZY79iTkwhN8HVEAp
	 WotGtITb1FOPfOcHjbt40xaBcSeCPbGzul7rsXqtDWLVNUeDz/3WdbT7knDhkw+k2dA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qY1lLZWh;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.217.45
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 169B3606A31C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 21:21:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 169B3606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qY1lLZWh
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-7d2e1abf3eeso221257137.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 13:21:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794864062; cv=none;
        d=google.com; s=arc-20260327;
        b=jlTvjlLNDz848a0MRMntE6BeXF7M+SWurUTOQqtlFX5592d7ub1sjm3fW1gT35e5QC
         0jgIYcDIspO89CEPYb24KlEqPObVZwUd9Uj4lNbXxYWVQ/KRlxCwxlQAKZ78XHxvjKNx
         8RSraXXLapzN5enLKMBm3wQxVAM76/21SNIw9O+Qloix5yfd+VWMgu2XLgVs7GWqHq5f
         2JhkRYmzMMHr6pTSgBPXOi1ocenxvgAQJG7rawRvys2Xvd2ijJ+yECyiq5Rn1HA3o8qC
         JWxNaK2ph467n32QH79bYs/6HmWfIpcDgDvYS+1ySrlAbdEtWKmvT6gRg3GHWzaW5iQn
         qLGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1xGZrJjN0Ny2SZfb7cMMUTGUER0EysqnRYr07qyNESE=;
        fh=8A5KZk44jkFppVmGT1TOobZcmvPEpbj6PeB3FOXtfZA=;
        b=a2IbL4vbswzAgcSX5CJ3dxM+UDlj1P+np36dUF0knFJRiclaSh7C2VU1XbSsNKnHpI
         Y0X905NpJxHejqJlajSaqnEFEwfiQRXmgI7y/O6yfInsLS1dY9HSknRgSu8TL8sCyprX
         dyqq5fndrAAMxjOY/JD7jrKrN3IIFzTqHTMZATcbjy8/QfuWh0E9ClOwMIq4Dgle2ZbS
         Q926EDrGGdS4F3clNvqxliF3eh7veuW1GIH4Vfttzs2whGEycQcNibyVt/kCfr1oYLz2
         RgTvq0OAgsq6IJtQq9+y5sl6u+eP5ISlc31bY4w0Uv2+lK/Y5E+4Y09/cmtDMtVTRBSN
         decg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794864062; x=1795468862; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1xGZrJjN0Ny2SZfb7cMMUTGUER0EysqnRYr07qyNESE=;
        b=qY1lLZWh4E2ksVTzSI/w/4gmWXpLiN8e9pCkUuUqbIAlJ1Isr/o8FtS1E9OVUt927h
         8lrZDLehu+xaxCMk4umpQ2y3a8L/lP48x9DxfZm4eilmqgPlTOTF1EtGi/yHOBENX+tf
         znGC75QwsAM9FJZ+T8XfLduHdCtnqqq0AgjxP6cWb5R97HibLRwLPGH8BUornoICNxaq
         aw+0w89WjRVnnLIu0jKpDD55BIpbVpqWwynaxQM89X5sh9+C0EpR1Qa8sNHPhD8uKqFF
         8BPO9HvPBovbQAAb6PaM4jm+UnDrbOrDdpepqLRQmtxRqUNc4a25u4QBb3lyBVmUg7XP
         ofmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794864062; x=1795468862;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1xGZrJjN0Ny2SZfb7cMMUTGUER0EysqnRYr07qyNESE=;
        b=TSWE5MH7F1BmU1DWJchUre/0n30Z2kjZoTyMXzd5dOS5owdgsiSQBET8IL2L1FURhM
         k0wWiCI6oi2e4zkxEIYKcbr7r4Vt93bFCm6yss9Z3wB/miQs35RnCuNv4G/7qI5zgtQf
         2d0WZF1XZ87yAAbokr8wbcfLI+NGJ+kCIcr5CMxn/AbUV+WSu6gUVRUsHbdZroN11lOR
         S/VXMpJZTfNBm1HjNqihyrBXTzxk1Dmus/KpoRXrqLM0N3C69816U9Q+4KTdg2i5zgxh
         YIF3053yh6EnWgjt0u8QKxsjwKb6x5pMfbyKQpMKA1hE4xfr8dXMzGHd/KxthzpF6HSA
         fjJg==
X-Forwarded-Encrypted: i=1; AL+hErG1R05SqYCP5RiCHEQT0fIhL1iwGq5Tm+H0ZWoVKQmVGHHLUU5xIraTTW4k6x3qj3AYjgHWKowfac8x1jA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8G5Dukt3I734dwmom8UeyroyVsICaw0KT+MpR21bkDUyAz2Cuc
	fZJYGwPpa1hVQYOaOmcShWWwsAaBVz/52i8OSeM8zBi9+ZcMx2BeSpwjLp28FsXxVqE6pgjBJnN
	LQ4YLAgi/r/2if9+vHPLsptvoPWGFtSw=
X-Gm-Gg: AYBFou2NEvGuXPF7WCnj5ekG/DCipL1LOUjdd7DpB660JwgRP7LsPeez95fe/7pQ3IS
	tM19PTe29KLahAJfflYP0I9ImWci9d+T6RbmCMvFnnIJdFLWOfrBqokzCxT9zbLdB4QKnNp9tWy
	d3+Kjir1vyOrnVd0XZ6wuC9fQXz+AiNMEldlSZt5Z1Ybrl0ME7EVy3NX/3YdlzU7VMhjRSISWm8
	icoBQdcCyqZJBJJD730ym5AFbzWFl6nQqnRmNPLH8QIJ2SabK8NVV8fZjeLZm3uPfdrskBFlWB4
	5lBrie/1dvacbj0T4fSDMm/v5mscJA66z/j3aXBG/IQEBqTRKNpUMhWCKwRX//pcVjW1wolbL27
	WbmI88nGIOwZy2WwAZpXVlgKITYFHPJJSj3WlNkSOEYe/UmNc6EBteW+VK5yNxUAa05aQTsXN1d
	TR1BuTlJwetD/3H0LZ5KMIex4jdhj6KbJYUj2cbDFSwoXSB9v+03ruvKBNBZ2gNnVWQvCVFyYUn
	XjpBrWLBipFh0CAcZ4tmoy7qPG+OA==
X-Received: by 2002:a05:6102:5cc1:b0:7c2:b741:2391 with SMTP id
 ada2fe7eead31-7d69f80fb58mr226923137.30.1794864062032; Mon, 16 Nov 2026
 13:21:02 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261115-submit-acx00-phy-stats-v1-v5-0-ed81a7f54373@gmail.com>
 <20261115-submit-acx00-phy-stats-v1-v5-2-ed81a7f54373@gmail.com>
 <37e4b9b8-d381-448f-a2b3-b92d7bd9033d@lunn.ch> <CADvTj4qh8Pvss+xEwcjshodwv-yN6haP-9aaeRXg1ydSu5ibVg@mail.gmail.com>
 <d3f2dc1c-9daf-4b5f-903b-657ae3f32647@lunn.ch> <CADvTj4opiu_vhat12BRzk61b7ymG+g12c2aoK+rcZHjpWZjL4Q@mail.gmail.com>
 <b84021aa-f843-4668-8172-0afcbb97c27f@lunn.ch> <avtHbulALsI61uVr@pengutronix.de>
In-Reply-To: <avtHbulALsI61uVr@pengutronix.de>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 16 Nov 2026 14:20:50 -0700
X-Gm-Features: Aa3M54pcMPyc2OFOg6Y0wv-UQ8kqAdneoXXulLAwNvDypq3EhsaVTtW6oHSJWpI
Message-ID: <CADvTj4ocz9_rMDbDG1xOPALNw1yx9ypXp0S59sh04wSv_YMyrg@mail.gmail.com>
Subject: Re: [PATCH net-next v5 2/3] ethtool: add a PHY receive byte total
To: Oleksij Rempel <o.rempel@pengutronix.de>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 16, 2026 at 11:12=E2=80=AFAM Oleksij Rempel <o.rempel@pengutron=
ix.de> wrote:
>
> On Mon, Nov 16, 2026 at 02:14:38PM +0100, Andrew Lunn wrote:
> > > > Think about it.
> > > >
> > > > If you don't have a MAC, you don't have FCS.
> > >
> > > There are existing mainline PHY drivers exposing this functionality.
> > > The QCA807x/QCA808x drivers use qcom_phy_counter_config() to enable
> > > CRC checking, and qcom_phy_get_stats() reports the RX CRC-error count
> > > through ethtool_phy_stats.rx_errors [0]. The IP101G driver also expos=
es
> > > a phy_crc_errors counter separately from phy_symbol_errors [1].
> > >
> > > This demonstrates frame-aware diagnostic functionality within these
> > > PHYs, rather than something every PHY necessarily implements.
> > >
> > > The generic byte counter need not require that functionality. My
> > > question was whether rx_bytes should count received bytes without
> > > conditioning the count on FCS validity. ACx00 could then report its
> > > hardware byte total through that field, including bytes from frames
> > > which its separate CRC checker identifies as bad.
> >
> > Read 802.3. What does an 802.3 defined PHY actually allow. That is
> > ideally what the kernel should support with these counters. Lowest
> > common denominator.
> >
> > So i would say RX bytes does not differentiate between the frames the
> > MAC will later throw away because the FCS is wrong. I would say it is
> > also O.K. to include the preamble, and the FCS, any padding up to 64
> > byte frames, etc.
> >
> > Since this counter is not actually defined by 802.3, i would also
> > allow some flexibility in its meaning. Different PHYs might have
> > slightly different meanings.
> >
> > Look at it from the other direction. What is your use case? Does the
> > exact definition actually matter? Does it matter if a different
> > vendors PHY counts it differently? Does your use case require cross
> > device compatibility?
> >
> > You have not actually said what your use case is. For new board
> > bringup, debugging broken networking, the exact definition generally
> > does not matter. The PHY RX counter is going up, the MAC is not,
> > something between the MAC and the PHY. Neither the MAC nor the PHY
> > counters are going up, something between the RJ45 and the PHY. The
> > absolute values don't matter, its that they change which matters. But
> > maybe your use case is different?
>
> I agree that for bring-up the deltas are enough.
>
> In the field the question is usually: is the board broken, or something
> outside of it? The MAC counts FCS errors both when the line is noisy and
> when the xMII corrupts frames. The PHY is the natural place to tell the
> two apart, but only if we know whether its error counter checked the
> FCS. Without that, the wrong part gets replaced.

For ACx00, rx_errors specifically reports Ethernet FCS failures, not
symbol errors. We verified that with PHY loopback and MAC FCS insertion
disabled: a software-generated valid FCS did not increment the PHY
CRC-error counter, while flipping an FCS bit did.

That establishes what this particular counter detects. It does not
distinguish corruption on the link from a peer transmitting an invalid
FCS, but comparing PHY and MAC observations could help locate where
the frame became invalid.

> I have seen a board where MAC and PHY both provided the xMII clock.
> Frames were lost only when the clocks drifted into a bad phase, so
> production tests did not catch it. A PHY that checks the FCS would show
> a clean PHY side, while the MAC counts FCS errors from time to time.
>
> So the meaning has to be known, even if it differs between PHYs. I am
> fine with that, as long as rx_packets and rx_bytes describe the same
> frames and the driver says what they include, for example which errored
> frames are counted and whether rx_errors counts CRC or symbol errors.
> That is the metadata I suggested in the v6 thread. The ACx00 byte total
> also counts frames with a bad CRC, while its rx_packets does not, so it
> does not fit rx_bytes.

In the original v1/v2 implementation, rx_packets and rx_bytes both
reported the inclusive hardware totals, including CRC-bad frames [0].
They described the same traffic, with CRC errors reported separately.

The packet count was later changed to subtract CRC errors to match
the existing "Total successfully received frames" definition. That
introduced the mismatch: the hardware does not separately count bytes
in CRC-bad frames, so the equivalent subtraction is unavailable for
rx_bytes.

Should we revisit the original approach, with both rx_packets and
rx_bytes reporting inclusive totals and rx_errors reporting CRC
failures separately?

That would keep the packet and byte counts covering the same frames,
but would also mean revisiting the documented successful-only meaning
of rx_packets, rather than changing only rx_bytes as proposed in v6.

[0] https://lore.kernel.org/r/20261102-submit-acx00-phy-stats-v1-v2-1-3c8a6=
64407c1@gmail.com/

>
> Oleksij
