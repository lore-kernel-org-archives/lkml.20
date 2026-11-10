Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.156
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794300428;
	b=AmYoEY2OtGQwvEMghsO5r4+tRYDYYcn3rLH4/TyXADHCuptuBzJz6xJGeyZstGQFjwfr
	 Z0hwTu/wmjevQi5/IaR1SGMOLKRTLYCGD6zDx6T1YaBDVFsQufLR69IdWHCv/NbdZfL2m
	 XFjIQ4aJ1A3bW6RgQuH3xdFOL5xK+IOn3NBZPqve8Y/hFEK4yXn3T+NxOLW4ZZP0QyDl4
	 AHxqbbIHVNK6thfn3SWjrbDDxQEIn0wCih0g+g0zfD9ICBjbNcBV/4Qi/c7RCpnFHW3HE
	 l777pSrcpKyvSl6ywNv1T7fKakTIlHcVk6CltGSc8tTgTnCHiu1NavUivZ+/X+BBL3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794300428;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:X-ThreadId:Date:From:To:Cc:Message-Id:In-Reply-To:
	 References:Subject:Content-Type:Content-Transfer-Encoding;
	bh=tb236Dm5vjk3jIJHIZtBKJRyeMEkcz2Hz6AmSpXUM38=;
	b=1zD2GkX//MfKdlZ/BoJj76JEbUkhAYXuE3T5dd+sTTrftn+aS2wFhJbtdnh381U1N8kg
	 ZSL70qttefyY4NEtR8nEjADBwyatFxSU0vXPAka0GoDTp9tXRGjDnNaEB71LErUEiIvSU
	 oRtcSwjpadodAPZYBPiTEXDKO1aoIXPeIaw0gWNAMDyLWJqQXcIKDZOBFjtr0mMaHRuYq
	 Vq/OyRNh9gXMhsPtvPKG++zNbuJkqo+waOr307wxHb3ABQhrG7mx2eXttE13eYc70V1bw
	 H+4YBT2jnsD7qV5DrrIjIQtEgIsU8CVB6WxT3CrMTzAXkquba7sxllbKy5QeyQyV/3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arndb.de;
	spf=pass smtp.mailfrom=arndb.de;
	dkim=pass header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=cgC+Y2WX;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b="kE/mRSPY";
	arc=none smtp.remote-ip=103.168.172.156
Received: from fhigh-a5-smtp.messagingengine.com (fhigh-a5-smtp.messagingengine.com [103.168.172.156])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43739606A331
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 08:47:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 43739606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=cgC+Y2WX;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=kE/mRSPY
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 50DF9140011B
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 03:47:07 -0500 (EST)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Tue, 10 Nov 2026 03:47:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1794300417;
	 x=1794386817; bh=tb236Dm5vjk3jIJHIZtBKJRyeMEkcz2Hz6AmSpXUM38=; b=
	cgC+Y2WXxO/XaImP2Gm48Wap91NQSiNuC5bPDsseRWrORVRfmbbWXNQosdG5qKP/
	hl7uhyaxlhnj2qvg0FJGGYqsrVfkRvwFhB+uz8/ad2rq3j9nrobXhl4bnUUESCSN
	T0U5W6qYyKx2vLFLMMhDYcE5TdpGVsbSeLJxM4JmLQizdUdU3NAuP4VboagSHVxS
	bPWd/LYM0ebOe3n6OZhXv+8KZcVqqCgkO2hNRSoAOmN6nApW8F++nP7OL+Jghd1z
	pv66YhkWVPXQ1emlHL2qpc3rc/c+PvBBIK+qcapDm2uNmPGNxQyZ3Oyd+m+Iad7s
	XuxC1IjAIyaFtuGGL4DoQA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1794300417; x=
	1794386817; bh=tb236Dm5vjk3jIJHIZtBKJRyeMEkcz2Hz6AmSpXUM38=; b=k
	E/mRSPYeLWtnTujMQqC+6MeTrE+UKfjRBdR8AX8oroox+S1B0gYbl08nb+pcRFWP
	dZLPqck94q+klISPxktsroSmqOP7Z/2DLr3haN8K+aTPWurrEXBonJR6JORXcPTS
	ZPswAFAcZLo5kBsg+5vIHkAJitT6sLiq5hgG/L+dmMQzscTiqI/jmaVRRqx2+XIo
	Th9MTu2LiBJhHy/Byeqs1Qx9aN86VSkuvuHEjysASJD5QdzXDdXJKGmjP9zS/qjp
	ijm3wcGvpM95upb80dfIuR9dP7F0hEoCzvypNwmwiRX+k1ig6BlcVu+a0Lb2IdMj
	sAfV6w58gdUr9wsdji2PQ==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=arndb.de a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1794300417; d=arndb.de;
	mf=PGFybmRAYXJuZGIuZGU+;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm2:rsa-sha256:PZh8Tjbnz0mAwcUF6GahOt+0r9Bw538eaTh1RR9w+FhNd0C
	op0mHbvq+k3tkGWsbnTSWfhd4xfNPWmEVixfSDbMD4c4wW7IseJvv4BjunBGg2EX
	6DFILzXPg2J+dNNFuP6+sn6ocYKSwhPvxEGHHymoeFjU8ijxcokaIE+0VkhUCmvh
	+5tMx1j6FuYZPqx9hUdVdFmt/glfE33+bR64mtfgjb4frU+AwBwgjBtBUrdczrnn
	URdLb/gbRMVVMkyiane4TY+mljPGM2ddab74fu8C/Epomji2KhuQvgI6GV6ZSBeg
	3aLa2u0qe5orRqBtLHg/wx5LVtBENfeHDGO20GQ==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:lERdrb9Ixmt/09H167x565OA+x+60OUGjeylKHspBT4=:/J/XjW7Q6CFdj+SNsM8IKlFX81NAeeVIkFwzukOjqaM=;
X-ME-Sender: <xms:-tnyapZWpF7wmx-xErevIPpESn9od4WYUbneta5UlMF1DyZKOrXa7w>
    <xme:-tnyarN1mrP318EQ7eZAOCEin2fmQvn7aELTkSzMqyVL64lXEQJ2yMdc0iXja-5Gj
    d7-nprKmtLa84fScPVNtjUXWSgO9N11d5RbPOPKdjqQ4DN3wewilaxX>
X-ME-Proxy-Cause: dmFkZTErx1dxoqSf6te9rXHPqp0f1SJG/nfdWjOU7ZalO87A+EP4qML1q0Z0D8gxg/nRWC
    rvfIBrNbS4wqwUNlWo/9KOxDTwGOhlIXs8DwpTnxQBvdJ3XFf8AYcyH9uv5L2alR1WEZZY
    YAOY30rhi9AKJC/pO2DdYe1oePMkSIa3oFgFKmZGPqe1XxtwiCj1GPkRLFipZntZWM+KeB
    //2NuoZILEAf0rhOOLud9ax/noqUHj31GklZ/DeCrl5G8BdmbpNh8Mme3/E7sFzUdMddXc
    gvZ8RE5e+VmIGYI8lt8iNh/6COeH4R247RPHZyeSvx7zMUO4KASDH+ZWhqu71g/24fjEmI
    +VlonHM3LwH9lX8bzfkCxMXcl4KHEfqgf7CE05e5nPpb/S5YEQCcptGJyQg6OZ1igs50+Q
    lcBBM7acbUOoBx+F6ko9cMQJIrV82q7SQ3QikYVWRL2vanSAs5ZHI5ymDoIqZf76vuZG3t
    /6exr7ZlBOE1DMvqyYM0HB4FryKT1nQ3820ZBtrU0/rpK6SivFbfRI4vB8QLKpOKAG3cOK
    NJKaspt85Zu4Gv41H3Tjmv+br8SL1kbryf3eyDw3xImDq2XrkWZASsGdjknHNxOpeEAHJ5
    jWG3cIpSozZ1BvcfbolW73Kdtw2oqERaIbQK3jB9y5sQBDNsFx6WfAGVZXog
X-ME-Proxy: <xmx:_dnyahLRQ_SqIpxW5ldaasvoRJZw1y8bu-mOJoR4YiYu1EifSHjXGQ>
    <xmx:_dnyaqWHhl3huLu3H0ff75gGpVGetik4mBPIsIQFydiUv_9glx_SSg>
    <xmx:_dnyauN3-clC1hcF9Et2ItV1Eo2XlWhsETg2vEftAmFAa-55UjXTxA>
    <xmx:_dnyaukE-5Vt6vurldhKktgim6GhalK9eXVaAPjAJstnvs7nSAbjqA>
    <xmx:AdryaksipLQyu4Nqkx8C9EgX_qlE2hcaQ_6UpkzGv2xMfKSJ-gW7ioKC>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id F034E32A0099; Tue, 10 Nov 2026 03:46:49 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-ThreadId: A4QaHkHhrVgc
Date: Tue, 10 Nov 2026 09:46:29 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Krzysztof Kozlowski" <krzk@kernel.org>,
 "Brian Masney" <masneyb@kernel.org>
Cc: "Long Zhao" <longzhao@ambarella.com>,
 "Alexandre Belloni" <alexandre.belloni@bootlin.com>, soc@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org,
 "Michael Turquette" <mturquette@baylibre.com>,
 "Stephen Boyd" <sboyd@kernel.org>, "Jerome Brunet" <jbrunet@baylibre.com>,
 linux-clk@vger.kernel.org,
 "Andy Shevchenko" <andriy.shevchenko@linux.intel.com>,
 "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Krzysztof Kozlowski" <krzysztof.kozlowski@oss.qualcomm.com>,
 "Conor Dooley" <conor+dt@kernel.org>,
 "Catalin Marinas" <catalin.marinas@arm.com>, "Will Deacon" <will@kernel.org>,
 devicetree@vger.kernel.org, "Long Zhao" <zl020895@163.com>,
 linux-kernel@vger.kernel.org, "Linus Walleij" <linusw@kernel.org>
Message-Id: <c67939c7-9725-459e-97dd-e104f3b14022@app.fastmail.com>
In-Reply-To: <bbc16906-45e2-4d81-ae81-ad93e87b13be@kernel.org>
References: <20261105-cv75-soc-v11-0-aa6ee0b2380d@ambarella.com>
 <179427375370.1061670.4050288038934218487.b4-review@b4>
 <20261110-interesting-hilarious-shark-2dbfc0@quoll>
 <7eeaf54d-2d7d-420c-a34e-eebc6dd0effe@app.fastmail.com>
 <bbc16906-45e2-4d81-ae81-ad93e87b13be@kernel.org>
Subject: Re: [PATCH v11 0/5] arm64: add Ambarella CV75 SoC support
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, Nov 10, 2026, at 09:27, Krzysztof Kozlowski wrote:
> On 10/11/2026 09:23, Arnd Bergmann wrote:
>> On Tue, Nov 10, 2026, at 09:02, Krzysztof Kozlowski wrote:
>>> On Mon, Nov 09, 2026 at 08:22:33PM -0500, Brian Masney wrote:
>>>>
>>>> - I create a new shared immutable branch based on v7.4-rc1 and I can put
>>>>   the first two dt-bindings patches in that. I merge this into clk-pile
>>>>   (feeds clk-next) with --no-ff. The DTS folks will merge this immutable
>>>>  branch as well.
>>>> 
>>>> - I can then merge patches 3 and 5 into clk-pile.
>>>>
>>>> - The DTS folks will take patch 4.
>> 
>> If the clk driver is required to boot, I would
>> suggest having a branch with the two clk patches that
>> can get merged (not applied) into both the clk tree
>> and the soc/newsoc branch to put the other patches
>> on top.
>
> There is a build dependency - DTS needs clock binding
> header - so it has to be second, unless the dependency
> is decoupled.

Ok, I see. Let's go with Brian's suggestion then.

For reference, I'd also be fine with the alternatives
we mentioned. We've done all of those before:

1. Include the actual clk driver in the immutable
   branch to cover both compile-time and (potential)
   runtime dependencies.

2. Merge the initial clk driver through the soc tree
   alone with an Ack from Brian.

3. Decouple the dts from the binding, using only
   numeric clk IDs for the initial merge in 7.5,
   start using the binding in 7.6.

4. Merge the clk driver in 7.5 through the clk tree,
   merge the rest in 7.6 through the soc tree.

      Arnd
