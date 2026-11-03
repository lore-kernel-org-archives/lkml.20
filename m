Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793703844;
	b=zuFM9efZ2gDeUlEgN9rOovAR83qgKbUnPf28n6r/hltkPY2q7+YdqlWgrb4z9k0XNtkk
	 GhFWvfI66UcP6XeyHm0dAp7UdogeiadmCvfEQeuOls4EpJlWIl+N7FBJw121sTJUl+v72
	 iI54mhlpXZlhP2TLLGVwRKNa8GxGunJJwGr0gIf57kbdzOPuEtf1ZIhUOxIqdDtEMlF+u
	 32CJv4IJ43Sebyb4a6FcioanIQ6wDghewOaxMi45eGD1YRUByLmpE3S6xHI+HZpdVGpwL
	 5BBP/JXeG2h6W/vqt4s8EWJW38L/4K0yF4pyHeXRwfzCXjSuNA/dmu07s+t9IOZV9WQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793703844;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version;
	bh=9+j8TmaWLqssBXOiaemL9Pho6D080LRmzK8roZic8Ps=;
	b=CLs8Ghu2gz4TxBzA1nEoWRHu8vcKDpmXorQzFlCGgXJ4iRAr730lXN7ZM+zGPuJS7PwH
	 I2mKOSiiHcb//C6TwikK9DtGVieTTyQN5sI06EUl+DaHOLD3UEZhGRt9UfN/vQTI+pNXM
	 LyS38K8Vd2nivRrNeHf+VXdbzz2ChXiLM5Mc29PJUb/VzUCU4ll1vTkzMcXssNrczXCi0
	 QtCMiUOKJ42kYFl6WmBXgJaXldrI7ZOI4Dm0PZkzcokxKBQbFXGPRxQYP0YJXBmddFBG6
	 lSh+NklBt22MbLa9tkRaJPqIR8V+BNOpBxtwxJcK7PTIwkZ/EQ5ro7p4VdkHI2RWq2g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=pengutronix.de;
	spf=pass smtp.mailfrom=pengutronix.de;
	dkim=pass header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=Jc90BoPB;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 544A3606BA77
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 11:04:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 544A3606BA77
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=Jc90BoPB
Received: from [IPv6:2a0a:edc0:0:900:1d::4e] (lupine.office.stw.pengutronix.de [IPv6:2a0a:edc0:0:900:1d::4e])
	(Authenticated sender: pza@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 9D3482000E3;
	Tue, 03 Nov 2026 12:04:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1793703841;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9+j8TmaWLqssBXOiaemL9Pho6D080LRmzK8roZic8Ps=;
	b=Jc90BoPB2m09qPV5RCIggu7BdHaigZs6oobU/kkMRjlBvAQQsER36aTYs+0yA4V2viZn0D
	9IOFnm4MB2MrtSWlBawUEn6m77a+pjGsUtPg2Jh9RvDMzHE/FIrmgZNh5h+CYpDwQXX5jD
	PInHrpp2ZdVA0T8XeRSodcB5WlYvLvfZDtqC4XjERA6LUcs94M6GOmBdnbtPMf01xb1r2S
	V8UrXgvcdt1+KL5bTrDQ9HCOKfB3aIuHHYgna2kvUIW/cTkRIOypRpEYFd3t7W1uC7pkbc
	uMoepfkGQ15NlXW9fEqQeZ0YWY55oxNkfj4tjw//OIhvyTq3DQokuzhZk0pgYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1793703841;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9+j8TmaWLqssBXOiaemL9Pho6D080LRmzK8roZic8Ps=;
	b=T49uY6iISswxJGUtAIkUg8wnsDsUJizPUO3sawt1f2O1BXLVCYGBQE0ajEGa2gNNV78NU+
	7L3a7hhs8dGEvBValngCo0hBJiDANqQwMUNJ1m1AuYD/9itxmIJ9QhLLMVvQDAdHhM56WM
	MVAMX3PP6axkRUiLIH5TUYZNaPyO39HTUWYtYzkBD07mnDsNGFM3vPECWf9xl/mKUADZWF
	adW5UMzwDpgvLxEBNSteHJYgrp8V+yBmQ/TKlXu460xSGgZuG+Ee3dT9wBJ5G8XrzUWuWc
	qYsITrrpF3dH6XKzKXC2VhO1fw5Co4qtEMi4ZwghwjGwPcpsLFD85oe0ZYwAQw==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=pza@pengutronix.de smtp.mailfrom=p.zabel@pengutronix.de
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1793703841; a=rsa-sha256;
	cv=none;
	b=Rx6LJC2yTwIOFc6EGkNmrGtrnjTzEvcY++tM/oV8LLfz5QM7h9x9mY4C3Z8S9L588dbilv
	w5jy9BoYMt6EUr0gC+aQLnl4AQnyVCh0BaPd//AMaL9An0sBqQjLfsuv8SyMz/b+3Ww/eR
	ORd0UFW3BHtirreItQZs1ShGIaJeYIj/O2X4sKuiM2G/5OfaQyoVeEH7yHMuuEdyfppaMs
	e6Gded/RTFspCTzgjkOYJSY7invnM7WY447zw7vYzPTRaCrWUNzOc9YNQBk4KVFUiOAPgo
	YlilMSkEuvCt3vgptrFl79cSFb62ExXMV+DvTP9Gm1zdl2L8FrdDFrCSbb/zWA==
Message-ID: <bb3ee3d119d848034fa16943a4df9639b39df98c.camel@pengutronix.de>
Subject: Re: [PATCH v2] reset: spacemit: Fix the RCPU2 PWM reset registers
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Hung-Chun Tseng <alan.tseng.cs@gmail.com>, Guodong Xu
 <docular.xu@gmail.com>,  Yixun Lan <dlan@kernel.org>
Cc: Troy Mitchell <troy.mitchell@linux.spacemit.com>, Alex Elder	
 <elder@riscstar.com>, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, 	linux-kernel@vger.kernel.org
Date: Tue, 03 Nov 2026 12:04:01 +0100
In-Reply-To: <20261021132130.3026998-1-alan.tseng.cs@gmail.com>
References: <20261021132130.3026998-1-alan.tseng.cs@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Mi, 2026-10-21 at 21:21 +0800, Hung-Chun Tseng wrote:
> Every entry in k1_rcpu2_resets[] uses RCPU2_PWM9_CLK_RST, so asserting
> or deasserting the reset of any RCPU2 PWM from 0 to 8 acts on PWM9
> instead. Each PWM has its own register, RCPU2_PWMn_CLK_RST at offset
> 4 * n, as k1-syscon.h already defines.
>=20
> [...]

Applied to reset/fixes, thanks!

[1/1] reset: spacemit: Fix the RCPU2 PWM reset registers
      https://git.kernel.org/pub/scm/linux/kernel/git/pza/linux.git/commit/=
?id=3D168cae7e87463

regards
Philipp
