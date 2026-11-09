Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794241254;
	b=GO65PHZz+mh/kLsic3RXwePWnrzfmn1isGBpHt7KpnGbnP1GALSMaHNOpHev54Z0DU80
	 KCWdYhy2HytmzCd7PtSVa5J15X07UjZlOYuGzg/l6LR5TcWH0sGHDw5QMbHaTlKXBF08C
	 cY2H9GJNPJ02cG3Z7Vyun4wNQCq1iArNIkG2YGEczT6SErkd/PUdT7xlOvzGMjXdNgz/s
	 huc9uaq6zzXkQOn83qAlFtY327HRwsegIhZh+vFrlHI5hLPul9qy43wUoSfNmtkSLorM5
	 Npe/hephleTb6tg6RZV+5NuZEZCLPYR9y/RnwxXVTicPjzUfORsEFiYB5E3Rd765gfg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794241254;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=3unQo8WlkCpFMzh/dOetPGuf+DaxLLVXBYgvviJEGVA=;
	b=Ak+Gtxxb0Ts+5oQuTCeXqwfXlL4hS9v4hhalKfxcpq//Cq3tJQJeCNF42QwLlScFlwRv
	 KVKTITC/PWIlGKK3cJC28gpyGVj0iF5O/q47gfP5LVyJVUAMCfzOyoe4/ukCk3yxw7ilb
	 M3F17CUOMDn/NUieSCPIt6vDrLbl1oKlOCpoyxsInrhhAmCezvlslEytYhDhdPkgDpYdg
	 itsFyp9LrPyiQacIElsXGSFqMSaFnppLW/AlUnfQdegDhmRbzRezyN1aqroO5A7yqiBWA
	 Wf6mR4ni1cXXR5hlqh5XzrYJ/mkvYa15ZR3bw7E+x43s86GvAp9QVjvWc1EbmcXDpgw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=pengutronix.de;
	spf=pass smtp.mailfrom=pengutronix.de;
	dkim=pass header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=P9KcMmX6;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CCBB606A330;
	Mon,  9 Nov 2026 16:20:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1CCBB606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=P9KcMmX6
Received: from ptx.office.stw.pengutronix.de (ptx.office.stw.pengutronix.de [IPv6:2a0a:edc0:0:900:1d::109])
	(Authenticated sender: relay-from-ptx.office.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id B196720062C;
	Mon, 09 Nov 2026 17:20:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794241245;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3unQo8WlkCpFMzh/dOetPGuf+DaxLLVXBYgvviJEGVA=;
	b=P9KcMmX65ZjtvR9i/6ts0xQ4fBJR8NUyNsRGaAnLchg+oWiQnwyhtW4GCt04sOe6yalih6
	LryAPynYC1gDKrDibmqe+D1jpH1bh3oIseStQkztYgq6D5djAa2nMw0C8WZ1RCCYPCWQPg
	nXbZ3gxjxnUte3uNDBa3yZ1i8WrLvl/dSQ4T+dgMLXNNFCwOhF591K1+uMDI2A3s+wUumw
	qVZzwPiW+xBWXcCFWlyvvcYq1RQvDCCOmfgUxHPyYujLGwn1L8tN9ijJFGV8T7zUcmF2Bc
	d27ItT5AgmkUNOwJ+9zOh0aXVCkoqsNWxx6duzA9gPDQa084nHnrUmfNgb4MQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794241245;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3unQo8WlkCpFMzh/dOetPGuf+DaxLLVXBYgvviJEGVA=;
	b=Pw1IIp3Z32rUuuXL2Sq/cW0/Fi9adMQA/hYp17pKFTQkswpnYtXBSvUlRyopHC2iBV+IHj
	BYvUCmnKXPOd7TtRtNCrvfmOPmZXmdVKqtlRgrGw9rnk3cbDj76+PEdXeF/v16+me4RePC
	W44+n/mcvg1DZ8W60lBv8x4d/poqqiR7piJ7YZwhLVPG8R45C5EFLKfNs9sZbecW2KVgpm
	PK0RuAGYdrrA2k5MU80Yxh4uuTCs4MClKyopAA0Xqr092iulpn2Gij8TX0Wy6nnHs361lg
	fsESRoITjU3TinZKIIdOZTezCWiAK2s83p7IfmmfGXGiMpaZNZXe8tr8qftjVA==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1794241245; a=rsa-sha256;
	cv=none;
	b=Zo9ReRp1D/g8eNY/8B5OdRpwZbO2YnZMWzUtnqrLN3rx9PYfX8Olh/7/jn6jL9oMFfUNZp
	Ci1Jc/+35FaoDYse0tmRnc+1cpJ7g6VTw/xv143XkxjUpn+s/x5zWtGYoDhJFvLIqEKi6u
	ap0347JwZZWKpDlSIQ2qLgVaRYjGVX1qPepzmInS6LAzoW7vyb6OAAXhnVVj8CfpYODdz0
	i3BrxgpoI2buRW7umeWZ5HveSv64kgOheXErFQrKQQ7zeURq0yIeaBHA25IAnHrrVbXIBz
	kE94w08E7EkS19wF4Jjn+LHtrcUKTlS96LHcpmARSSAc2clets5jY/7aCk+ghA==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=relay-from-ptx.office.stw.pengutronix.de smtp.mailfrom=mfe@pengutronix.de
Received: by ptx.office.stw.pengutronix.de (Postfix, from userid 1064)
	id 9A94E1BF632; Mon, 09 Nov 2026 17:20:45 +0100 (CET)
Date: Mon, 9 Nov 2026 17:20:45 +0100
From: Marco Felsch <m.felsch@pengutronix.de>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] ARM: dts: nxp/imx6: Drop unused kontron-samx6i .dtsi
Message-ID: <q5fzh5ay25uujgbhztuj4rhf6d2lypxqeqely6jx7uyt3mivg5@a7yxcdiubv4x>
References: <20261109161713.3618477-1-robh@kernel.org>
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
In-Reply-To: <20261109161713.3618477-1-robh@kernel.org>

On 26-11-09 10:17, Rob Herring (Arm) wrote:
> These 2 kontron-samx6i .dtsi files are not included anywhere in the tree
> and can't be tested. The kontron-samx6i support is already in place in
> the imx6(q|dl)-kontron-samx6i-ads2.dts files which just include all the
> necessary .dtsi files directly.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Reviewed-by: Marco Felsch <m.felsch@pengutronix.de>
