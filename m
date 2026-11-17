Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794916796;
	b=YA0x+76v4DI7vcuHPYB7drhR9gnDT3VJo6CaEZ5AwkqfMplojWn5CsDjNF9YrBWi/Qvo
	 qe7Hx+5vtoCgIUD7/aL8u+QY0+34s1J6ZBCH/4t+puhFywPt/Bh+PUBKFXNjhdWiNafw2
	 a4PmssQvcuQS+bOGTA91ZgcrZDd85pMnje0xS087zfYZ+kUnrGOv2qcvv8O1QO4uYpYzw
	 4FGnUmrVkR/iptzLH8+5DufCLRoDdG/PtJszfMM65SAEmRbuIuL6j5l4J2yAe4S3j3xUJ
	 bOIE0JOZ9PcYKSLKVvqyjBgz24RwyUtHXHstGOFk1XIwR/dWWVirMrmvWDqSW5bRSLw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794916796;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=wvYrkGHaYgq964D4RoetspcqTg4aqX4FpXn0tpmhxz4=;
	b=jisUO84jZOcskHX74/AYNyOXtVPfcxHfZxElUH0LRK5IT1hV+Hj4CyWP6Nc7JrMSOpBg
	 2ilnq2JFwAKrpQSx8yMP6jgJ1GcgjW0UqFc06akf1uz+XCvkHH9z6O/OyTxIzDjhXzJA+
	 yuwR20zY7rWth3+IQPLBVTrDS/WugOgOyK20oFEB6hemAEMRQlNHAM+DobDecn2p/hKih
	 wz1xn3mut6ttLkmrLghnGIAuTOCkp1AaSqjdg1vUDKYbfCMXrYzHZMnCVbqdlJTr0E9It
	 h9XwrLjuHwflqZjyoymrT9ZOjTPw2iQsjiwFRPK5f+4uRGVqv42txLGcWELt7KxrY1w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=pengutronix.de;
	spf=pass smtp.mailfrom=pengutronix.de;
	dkim=pass header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=RXH5n0nr;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5582606A331;
	Tue, 17 Nov 2026 11:59:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D5582606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=RXH5n0nr
Received: from ptx.office.stw.pengutronix.de (ptx.office.stw.4.pengutronix.de [10.9.0.3])
	(Authenticated sender: relay-from-ptx.office.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 669DF205A24;
	Tue, 17 Nov 2026 12:59:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794916792;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wvYrkGHaYgq964D4RoetspcqTg4aqX4FpXn0tpmhxz4=;
	b=RXH5n0nrpC3Q5v32r01na/y230felqkilE/+8+6AbFmqVNKyxuKRcv/u0B8vyJ46m6ZaVb
	xH/HDdh5GrBAxqeqx/a+YdxB7qUW/cOPSrxzyult7RAaXb0cQEuN1uGL+TRzI68yJCLDSR
	/9pzWjw+yCFdyLlL5s/CdRtZxqpRwz2VkjBB9Zj70WN76TlfvJmSG5Gh9Ari0+kHg4aSJR
	t8TAzF11zoQILpGks5BdG7YI3uSaWhul+4aFze+2V+bn8ttLijvRWo8w+pXG0VC5SOXhS6
	vn1YfSq7b9Ow6mCdtmVZR823uDt/yBMOwZVfDkNv/PJs2liBLQ06dZwrjYTpLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794916792;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wvYrkGHaYgq964D4RoetspcqTg4aqX4FpXn0tpmhxz4=;
	b=Qs01rxDu+WqKU5PljSvlvzqYv6X6ehQ7RCRrVhZ7ybEDKM3rlTtZzFL5AFpA1SvaHaZmbj
	n7f/NNCcAyP4+w23TB0hHRRJpyss/8YmCSQqpjpIdF55qankam7Hrwq7ossSGoE09WvQgm
	W02LGcKadj26K9HgoxdCrdw+8HF1RxMc8hU0WwGGK5KGAtl0xCBpSz8JoXDxgekyYxUWbU
	1TRXUzIzzR+Fu5oEY7BM3x4hBVTFDUT215gHUKR/her+lxxTedcKr/r5ZE2SOqhRZp9ry7
	N8RLFPmsiR0ceLB/oP5QqJES6P/lYOugD881GtGMAg3YZMcGPAnl3SjcSdR5bg==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1794916792; a=rsa-sha256;
	cv=none;
	b=S5DU+/+tDjlZGHSwA+CvYnh22vQMK3zLrJXxmippDtrASAacD21LHyFoUCh87jdWcPvJ4h
	LXvgI3X7/4IDKsjJI1KQ0gPftdFVtwCaDyDEmPx9NZULkGNKXfxnzPqauEACLHZW9xxK27
	JpAo5xMYwETeekhDmSte7XyhGz/Q4iGED2w6IZP2+UeJwd2DhWcYDQ2kQZF1uVxdbuitSe
	WiirYrOEmv26ttgaGDVoHbjrikScvRG4SRVQLFJnKL/oJrkahAEfBVoJweMlMxpZj6NWPl
	MccrjqN8ZLbWfOIygDlrdk+F5xkgC8OAomWWzZ6oWbVoYp8Z1alAe473OFsrtw==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=relay-from-ptx.office.stw.pengutronix.de smtp.mailfrom=ore@pengutronix.de
Received: by ptx.office.stw.pengutronix.de (Postfix, from userid 1058)
	id 4C7901BFABC; Tue, 17 Nov 2026 12:59:52 +0100 (CET)
Date: Tue, 17 Nov 2026 12:59:52 +0100
From: Oleksij Rempel <o.rempel@pengutronix.de>
To: netdev-bot+sashiko@kernel.org
Cc: woojung.huh@microchip.com, UNGLinuxDriver@microchip.com, andrew@lunn.ch,
	olteanv@gmail.com, davem@davemloft.net, edumazet@kernel.org,
	kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
	arun.ramadoss@microchip.com, jiri@resnulli.us, linusw@kernel.org,
	f.fainelli@gmail.com, vivien.didelot@gmail.com,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel@pengutronix.de, jensemil.schulzostergaard@microchip.com
Subject: Re: [PATCH net-next v2 1/3] net: dsa: microchip: ksz9477: apply a
 shorter ageing time at once
Message-ID: <avxBuDOb9k8Wrj7E@pengutronix.de>
References: <20261115-ksz-stp-ageing-v2-1-7af27320033e@pengutronix.de>
 <179482683512.3136.850497985215218789@kernel.org>
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
In-Reply-To: <179482683512.3136.850497985215218789@kernel.org>

On Mon, Nov 16, 2026 at 11:00:35AM +0000, netdev-bot+sashiko@kernel.org wrote:
> Does this flush the dynamic FDB entries of every port on the switch?

Yes. Fast Aging is a control for the whole switch, and so are the Age
Count and Age Period. I checked it on a KSZ9893 with one entry on each
user port: both were gone right after the pulse. v3 says this in the
commit message and the comment.

A flush per port would not help: the stale period applies to the
entries of all ports, so all of them would need the flush.

> The pulse can also fire when the ageing time grows.

Yes, that is on purpose. The commit message has this case: from 4 x 2 s
to 1 x 31 s, an entry stayed about 63 s without the pulse. It happens
only when the Age Count gets smaller. In STP use the count does not get
smaller when the bridge restores the ageing time.

> Is a fixed 2 ms sleep long enough on all chips that use this function?

I can test only the KSZ9893. The comment at the define says so.

pw-bot: cr
