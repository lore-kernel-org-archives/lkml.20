Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793811929;
	b=GCPOtACDYFTXJiRLwidc8Fr75NMUFhI2JbjJP4L3TRg0/Vt1XRUZjbc3uCREA7Iqm98I
	 xxSSh4Z9AypgT2dcsx6+72HDmS3CeYbmuMa+7qLCx2Q/jaxDi1fDq1p06wl2Xji1VMApi
	 dJ423jvn49RpAXxqOGD8fMgzY9dgLr4/y/h1GphEbz3WLuVEy4f0J0JWad1CFQQH0XrlW
	 xGRiWQ91l0Nhv77+EAdhAENQ0aTr+sWNpniGyxwBBCE5PKfV1in7G0G2HzQhEO6JdalZx
	 Fi+bF/4B49rgTq6PFTurkStd9D2q52/V+6KjPFXkHVFilSumYxcXIpWkRX2qMiMdi/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793811929;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=3kGc/TdTlhAna5c/XIOgSyLjkq7Couqao11uc4WOjTg=;
	b=PKxCEjbhVErhJKeGf4J7a4d5y4vWmtwoZfoh+kh+HzmoqU4JNDc1TYRnwDBAOC9ziunB
	 1o9D5TQGXIZHzd91C24M21E5BAh4q7EBk9T/gfGPSDOuarG+5u2lz2AAvwiktVtC4UTNE
	 80/XwTePvIcd2K87pS2BjCBCVehvoh/YJR+sMpz2ryI5nmPPorf7IKEy3QGbJ16Nb/YDO
	 zcvv6NWCa7aFd3fOcbEdF/2EObPBgT8sBoJKhMacjZOXxqFudln1jSTMlcX4tYO6E8vBY
	 azPwzEJNTCAnlXr8JMeb/3wLNwAiEHfkLTow/I9oUxGiJPa/3/YbWPic78LyrIEYC8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IUQJStB8;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87AFC606A326;
	Wed,  4 Nov 2026 17:05:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IUQJStB8
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E48671F00A16;
	Wed,  4 Nov 2026 17:05:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793811929;
	bh=3kGc/TdTlhAna5c/XIOgSyLjkq7Couqao11uc4WOjTg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=IUQJStB8ZjzvNZVLPPeWp5Y7uiS5eTbo6dCqqwrFKLwoYkaTF9WqGfqx09Kv0s9cB
	 1XhX3bj6IpEB2ZF/TTHyWBz+Db6hmDjHOKOQ6oUH0FK9I9ZniLR0oNi913PW82jqPi
	 uVfAdrqi9KuWkxojbDGlick8bdWZHKCIRPfFSxHD+g56tHmrcYVNfO/ik225CcwDNR
	 qsINv46jOBuzi6Xc981oeLegIsbQLoSYlfgje1QkzhNP+mEILtw8eliChTVaDWwESs
	 JbuXej3F8dMVI6Su6taznVPzvOV7YheIIk+8BnU1pAJsod8ZvPYArrs0iqOFImr0N0
	 q/Fj544IgSGJw==
Date: Wed, 4 Nov 2026 11:05:26 -0600
From: Rob Herring <robh@kernel.org>
To: Shashank Maurya <shashank.maurya@oss.qualcomm.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 1/2] dt-bindings: regulator: rpi-panel-v2: Add
 vcc-supply property
Message-ID: <20261104170526.GA2198175-robh@kernel.org>
References: <20261104-rpi_reg-v4-0-3578e794ff45@oss.qualcomm.com>
 <20261104-rpi_reg-v4-1-3578e794ff45@oss.qualcomm.com>
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
In-Reply-To: <20261104-rpi_reg-v4-1-3578e794ff45@oss.qualcomm.com>

On Wed, Nov 04, 2026 at 01:40:47PM +0530, Shashank Maurya wrote:
> Add an optional vcc-supply property to the Raspberry Pi 7" touchscreen
> panel V2 regulator binding. The panel controller MCU is powered from an
> external power rail, which has to be supplied before any I2C
> communication can take place.
> 
> The property is optional so that existing device trees which do not
> describe the supply remain valid.
> 
> Signed-off-by: Shashank Maurya <shashank.maurya@oss.qualcomm.com>

Missing Krzysztof's ack.
