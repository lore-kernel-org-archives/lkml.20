Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794916947;
	b=cuzBGowFqV2Pz+L8PE1N9qgfX9rkqUlxXRmefumGXLnFajWts4BqYtaT0+hyfRbDvv9w
	 xrMwU8oWcKQ9fEQQ7GAzqJ8d8Ra5IwgcIXr872UkW3lYoJdiKWRCEkUMfb/N0t9Keu2t7
	 SECZfPGLSqod46caaoRmDN7QSlwmhrm1EoXUiEspwdglDpTkgtUJT/LA3NY+ynSh+GBmh
	 otA96kjYaYVg2csFjSC6w4RtimByPdr8LLfFLaLCfXBb4hgxCUfSsfAy7LxDYuq90WPdU
	 bCZ71eUcZE9LKpgGt9HCtFL+vC5OynaHHZOwC60mwrc/5lJ8RirEQbMAamkRSPC7sgw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794916947;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=+sDgkDDfvdGL04ziHdSHTWy/ENbJTsOpz3QHFKDogfo=;
	b=hTOV/n4FMij/VXAtobcx8Na5XBk5wZtffEJX09n3/FEWYvQ/5jZpEBWXFOrNTDS+R3WG
	 UOjXoUXpYrRiPvnjjRNuedEiGjsBXGjnooTli1EtpgnVRrDtfm+Vog/VyymphaKG0bEuZ
	 kDexZNWslFKWVse5XIShJ6UhcHH/xYruQEyW5FLRq/eIkYH4eTqmxStt2oIMMJIqMhvF6
	 nN8O7s8LQcgqIh7cXGheOGITIVbCkXdD2UkfNZ2pfTsyZK+/nd13Vc4R2iL/hNMk3oWH2
	 99zpfeIokiLslf/TmKgY+fkwmfrdmlUdFjJcuDow6wcCCO4Y2cSA7rLXG271+wBCBUw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=pengutronix.de;
	spf=pass smtp.mailfrom=pengutronix.de;
	dkim=pass header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=ORNHkDMU;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DE34606A882;
	Tue, 17 Nov 2026 12:02:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7DE34606A882
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=ORNHkDMU
Received: from ptx.office.stw.pengutronix.de (ptx.office.stw.4.pengutronix.de [10.9.0.3])
	(Authenticated sender: relay-from-ptx.office.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id B8D5620173E;
	Tue, 17 Nov 2026 13:02:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794916944;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+sDgkDDfvdGL04ziHdSHTWy/ENbJTsOpz3QHFKDogfo=;
	b=ORNHkDMUysA4UNAa9iDVT82O/IV9sAgtCGMCMwo3s0GAf3X+kpWgdyWNfLo8UYw9yTMU8q
	HB6ZpAgRWnSi4k0zABeN9SOZ+neeKNtm5umYEjRJgT2xaNVr49WAABaT7yEhNNIfH6IsCb
	MT7dNm2fyl2OJo/wAeV9FQyZfg3IulglskWA8W1CDcJVYU5BOBdi+D5ircO8utnP6sy+tr
	atEYYkQSPcnrhgGmn15dN/Ngm1BMfm0A46abMaW0qkmsm+08QEpHdorDlA8HlgIrhuvtZ0
	Jjrk9bMHEiyDEbNb+y5oYEd1FWkeQ/ri4QO3x3Xk4US4sr0dlQgFDOuLVDqrrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794916944;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+sDgkDDfvdGL04ziHdSHTWy/ENbJTsOpz3QHFKDogfo=;
	b=en8rZXwVcget22u7jWqOoZA5GHUO9IZpsDgpIyvLeG79XXU/rD0QchX16WIfEijQlEoVC8
	9RBkN2twvFhLKKugOF3ML6shYfqAB5ikxHvkkft5YmBV+Gm6fGt8avJyWn/bdHJYWaQqot
	fNNUOuEnY8Z0aFZoM4/pqek0DpNy0ElvsnQRnO/BWUBOjHF1aMHYJol0Hk19RhfDl4fS9q
	tT3mDiRAiLi7Pa+K9js25KVFCWWyV6R8nR1RKWoeW4C27d9AOOvodKEZ+Ca46FQiwAlzOO
	4oL2U6QyOppQQp88zPN31vs3cCgXOnSRoMVOmqY++s57WR/InPI5FLSp/MdlxA==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1794916944; a=rsa-sha256;
	cv=none;
	b=LPj88i/xzneBN5Fl4ba9uiLVFM2oFcgnzTLUEnc3apYhrsaeCpWVYEuyyQxKwg7czjXCiT
	Pd3oWkMUl7qXm/UrFMAz8s+4HxagZUxhmRODjlksEtnbDLC0hprBTXWjRervYkZhqHgo8A
	MbX0+rYJTLdw4nU5gLtq4CfOThUPHZ5e/VqcY96I1ocoLPJaYiAyZ4mSqhHGJu/bHrKtq/
	CvVT+iPbTaIkTjtLdYD+VirPB+bBiA2dd0dP579nmOMETVNfeUFMcnxKe+CMDPaqvzDnrR
	d2sc9G67HHTOodcLVzd/PHaTS4ZtI/s3HeyPNOa3VDvlKKrLfGqPdiubjHb9Cg==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=relay-from-ptx.office.stw.pengutronix.de smtp.mailfrom=ore@pengutronix.de
Received: by ptx.office.stw.pengutronix.de (Postfix, from userid 1058)
	id 973771BFABC; Tue, 17 Nov 2026 13:02:24 +0100 (CET)
Date: Tue, 17 Nov 2026 13:02:24 +0100
From: Oleksij Rempel <o.rempel@pengutronix.de>
To: netdev-bot+sashiko@kernel.org
Cc: woojung.huh@microchip.com, UNGLinuxDriver@microchip.com, andrew@lunn.ch,
	olteanv@gmail.com, davem@davemloft.net, edumazet@kernel.org,
	kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
	arun.ramadoss@microchip.com, jiri@resnulli.us, linusw@kernel.org,
	f.fainelli@gmail.com, vivien.didelot@gmail.com,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel@pengutronix.de, jensemil.schulzostergaard@microchip.com
Subject: Re: [PATCH net-next v2 3/3] net: dsa: forget the port ageing time
 when the port leaves the bridge
Message-ID: <avxCUGkgmY9l2kho@pengutronix.de>
References: <20261115-ksz-stp-ageing-v2-3-7af27320033e@pengutronix.de>
 <179482683686.3136.4297608809022872177@kernel.org>
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
In-Reply-To: <179482683686.3136.4297608809022872177@kernel.org>

On Mon, Nov 16, 2026 at 11:00:36AM +0000, netdev-bot+sashiko@kernel.org wrote:
> Could the leave path recompute the fastest ageing time over the
> switch's remaining bridged ports after clearing the cache, and program
> it?

Yes, I reproduced this on a KSZ9893 with two bridges. v3 adds a patch
that programs the fastest ageing time of the remaining bridged ports
when a port leaves its bridge.

pw-bot: cr
