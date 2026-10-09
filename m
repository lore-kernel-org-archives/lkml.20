Received: from fout-a5-smtp.messagingengine.com (fout-a5-smtp.messagingengine.com [103.168.172.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4079E1D47AC
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 14:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791557769; cv=none; b=Gyik2fkx9PAQ2uCYja7Hjh+o6FdA3xTYauJ+ee09jPXMPqWpg+RpbicOldk4fse6f9Bbw8qk0N+YZtXNaXn+sWyg9Uz+MJfCVyc2/NqGLX0+PLxO/+3VbxCKBzuGt4nR1XWCeEagmz0CoML85P7gV51QOBoQEddBZbPtyG3YOsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791557769; c=relaxed/simple;
	bh=YofAd0oLdISy5ffEbw6L2vXkCkMZJJQFjD9dwQ/xgDE=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=JsF4NRTmJXg1KMqc0LLCyyjtib2d/DB84ZLmlSUwPq6E02Er0ijv3Ywu+ToSlfy1+gugWS59RngpH7/RZ6rsG6SL2grIErjADNuorbtA3EDsqeXHV4ZHHHN4LgBbpInr3tVWO4cssuZPrmHWM3D0TcA/5p526T+iccyxn6Rg+Co=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=XSpv85Fw; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=HusQy3kk; arc=none smtp.client-ip=103.168.172.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="XSpv85Fw";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="HusQy3kk"
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfout.phl.internal (Postfix) with ESMTP id 02D82EC09A7
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 10:56:06 -0400 (EDT)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Fri, 09 Oct 2026 10:56:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1791557753;
	 x=1791644153; bh=ysNHmMEub3nXV2fVbbKoB7BvmncFWa+ykTnACh3vKVY=; b=
	XSpv85FwVpj6f/Q123Ku5snZB6f6DXKHLcLllrg1WVIjIXtmJX63Bu6IlYbPwcZR
	rD1SAuDyR6CFQILJzzy/EpD4lYPmvXL7thwvaRNDfUgZkr9IyNx6Fe06VqGEr+W4
	IiDC4hTulQAj65rDWX/mDnVx1L2/A2rAmpNjp2RtSDwvKmpVuTVcx83cKDINlgo7
	FWrJSLc/+yHFw9uEGvvhN+n4/FtSps2JJAG+9xDCnv2cbgFfqbYf14oMBbLj/KTj
	HBdpgaaYGDoLbe1k78F55mQk/52CIXWeL+n9VK7Sdbkg7x4pjzEc3vO7ddDu/G81
	8yioTfhBtUQJKutKaWgP5g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1791557753; x=
	1791644153; bh=ysNHmMEub3nXV2fVbbKoB7BvmncFWa+ykTnACh3vKVY=; b=H
	usQy3kkp3yHPLp8UUYQm4okPWAy7mOFAPRsxDi2xsT2QJXudvfxPg3aBpxzV8L7k
	F22+CD42He7CO+FbOjHn4vfOaQVFhVIfIc44FDqR947J6a6mj6IJbnUpXv/K+Ped
	ZchWQk3HWUf9qQZpyBPley5llnWA7XSiL/e9xgPbfN+406nEFpw3R/aou9L6MY4R
	IHin8/ETQ94yyp8kvB3YzNvdMNVDXTLjSysljJb/pWj0v+8NzwKTXoNgwSHVd3HK
	f62ZucmfyUI078es9FcKgToOI3lqhEF62VseGVzNF0+PxLcmqfQc4vWufjPgQ3/O
	kM2fvZkQjFZ1rrZEJ+Dhw==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=sign d=arndb.de a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1791557753; d=arndb.de;
	mf=PGFybmRAYXJuZGIuZGU+;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm1:rsa-sha256:iqv0cnkstrco8n9fXy62uUsMFN6X2gG1xvLfb8x6j8YChPk
	/b9thqK7heeQ2AJp4fcBjPat/0LC778hP981Oczpk7KP85eGrHdV084aF2gU6LqI
	+QZqs8ukFQB0sGDGg/JwqgAK9FIJVkqtGcYsO4hBTBBcykrhCMAcWGTCR9o7Ew4U
	YPox7wzaE3C6xKt9T+54V3X6v+kplte32+uecw3fNOUFfUBneH8bJteKpKErT+Wp
	RItY6OWK8p4tyOfUUWioqs1lUMOR7Ecl5EfX0V7Frf16U5571t8fbjwJ/t/lnnQu
	j3MV50cxgbs614BJvmLC8Qs3tfH3ep2zyC3U+9g==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:XXGpeO/YmQwCKf7M0XVPtgOpG83veHWzCgaYuUnnDhk=:YofAd0oLdISy5ffEbw6L2vXkCkMZJJQFjD9dwQ/xgDE=;
X-ME-Sender: <xms:bADJakCZIqprAk-Cfkgd8oKVpTmcXORv_0L0iSLeZZBYxIepxqPnnQ>
    <xme:bADJahWU-SgG_CUcigw6KQAtRJ5oPXyyQN-bPFk_H4EQ4vQNiavjBVQ_SaOLHUVm5
    US1addiYFR-qdCd9CjNqAsQSg6CSemYH4VwvzH6fnHu_vGtWV74Ge50>
X-ME-Proxy-Cause: dmFkZTEJayRhQxc0vKpBsdIsSAVWjFwdChche+mtH1Jx0kOIH/5Zr/HdLbAB+GR5Gedxcf
    vLt+01ODtHppZjY4Rzuf2BnBd9wb7qZwkArWQjyrPorOQQBCvxKONcF9Fo9bmV31/oecRk
    gzALbeQ7+yrnzGNRMw2MH1yC4RWP6fa6dtPxV2Joc7KnIVHMNyOpalAsWMsmX6ETwYGwd6
    AndjR8ne3hlxTHDCay9AW5D9D/PCdYRBca6upRYxRXRBMGgZmsBWk0UvYJl8ejSjRiDtIn
    kgWN61zC4V4v0W2r7ZypxB+9vuznUpUgHnQXtSeaVqgodADkAeMWwCpXIrQ14KAREl5Eaz
    QhkS0wymOQFto9XhzbJEiAsaJrYVDbyIRf66e5gURh+fOVSv9oFTgncmR6D8IhUPc/WqUh
    YvNYf2uttdcZ6w+nmSL7NyDT3Wf2IVzbE+3DdmdjjfqH8vgBnq6GL8pVYNqVLQjdqWz2Zp
    RJRNiTCmzEbxS/ownyPb2XHnKm4Hjfips/Qzs0qt6Q5dwv3blGmEFEYdeHGTPjZxEF7opB
    frh+GEATn0Thv8xRSyLwWIY7bMOvjY5RPZZW/W22KlUiwa/QpxGtUp9DPqwn+SwjuBEUwV
    3PGb4hyeYjZprznkD5hESsD101g/qRsDLmBhhmEKLJCO5uxDrP3yCH+mUjPA
X-ME-Proxy: <xmx:cQDJajmB0Wm94rXyVUq-HO27gEdKVAOQoF_YYPsy3_XslvuWHByLxw>
    <xmx:cQDJaoea6BqZtZ7PzR42N9GIyzoECk1C_nwdRZH4Mqq2rv1J_UQm1g>
    <xmx:cQDJaoW_RJpIfJeZYSTZnWC0ZhVMZnGVfn5_8V7vN5jonGOH_GeICA>
    <xmx:cQDJakFh6g9dtce22r8K4rMHk97EvLg5OU-37cxkPJgoWBH5eN6cgQ>
    <xmx:eQDJaraZnKcjGo9k3CHjRLLST4BziwMhZO_yWxaLrHvknhv6syFIWZrv>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id C6CF732A008E; Fri,  9 Oct 2026 10:55:40 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AKEFTclLsUFV
Date: Fri, 09 Oct 2026 16:55:17 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: soc@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 "Aaro Koskinen" <aaro.koskinen@iki.fi>,
 "A. Sverdlin" <alexander.sverdlin@siemens.com>,
 "Alexandre Belloni" <alexandre.belloni@bootlin.com>,
 "Alexandre Torgue" <alexandre.torgue@foss.st.com>,
 "Andi Shyti" <andi.shyti@kernel.org>, "Andrew Lunn" <andrew@lunn.ch>,
 "Daniel Baluta" <daniel.baluta@nxp.com>,
 "Daniel Mack" <daniel@zonque.org>, "Frank Li" <Frank.Li@nxp.com>,
 "Giulio Benetti" <giulio.benetti@benettiengineering.com>,
 "Gregory Clement" <gregory.clement@bootlin.com>,
 "Kevin Hilman" <khilman@baylibre.com>,
 "Linus Walleij" <linusw@kernel.org>,
 "Nicolas Ferre" <nicolas.ferre@microchip.com>,
 "Nicolas Pitre" <nico@fluxnic.net>,
 "Vladimir Murzin" <vladimir.murzin@arm.com>,
 "Vladimir Zapolskiy" <vz@mleia.com>,
 "Dario Binacchi" <dario.binacchi@amarulasolutions.com>,
 "Kyungmin Park" <kyungmin.park@samsung.com>,
 "Ralph Siemsen" <ralphs@netwinder.org>,
 "Russell King" <linux@armlinux.org.uk>,
 "Sebastian Hesselbarth" <sebastian.hesselbarth@gmail.com>,
 "Stefan Agner" <stefan@agner.ch>, "Tony Lindgren" <tony@atomide.com>
Message-Id: <e4da2f9d-d3b9-4267-9b64-b0f2cb43402a@app.fastmail.com>
In-Reply-To: <2afd5f78-0174-4955-8c1b-be18aea3800b@app.fastmail.com>
References: <2afd5f78-0174-4955-8c1b-be18aea3800b@app.fastmail.com>
Subject: Re: [GIT PULL] soc: deprecated platform removal
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, Sep 28, 2026, at 23:46, Arnd Bergmann wrote:
> The following changes since commit df2908090cda368b01ff43709f51890076c56157:
>
>   Linux 7.3-rc2 (2026-09-06 15:07:20 -0700)
>
> are available in the Git repository at:
>
>   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git 
> tags/board-remove-for-7.4
>
> for you to fetch changes up to 1b200c44654d654bd0d04cbf55823b9e275b2a56:
>
>   ARM: axxia: remove entire platform (2026-09-28 21:43:31 +0200)
>
> ----------------------------------------------------------------
> soc: deprecated platform removal
>
> In the 7.3 kernel, I marked a number of platforms and features as
> deprecated, with the plan to keep these around for the LTS kernel, but
> remove them in 7.4, see [1].

It was pointed out to me at LPC in Prague this week that 7.3 is most
likely not the LTS release after all, so we should wait another
release before actually removing the code in order to keep it all
alive in the 7.4LTS kernel.

I'll rebase this on top of 7.4-rc1 and resubmit for 7.5.

      Arnd
