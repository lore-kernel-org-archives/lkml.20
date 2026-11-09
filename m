Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.156
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794245991;
	b=UF3lrHWfDD5qqp7K2XOwIAXuFdttY1wncYBuPB1cGJW4C0HCGq9eamYm7xG2pcLU11N+
	 SC9PensKNfCRcqA/AQUpXqOWZOrDnhb5lykZbl27aNtIUgBjpv5rO0iPScGnoBcY9Qmkx
	 wKnCq4YILbDdMUUZ5B56gQhkLPErtCSz4RJwuk0a02rGFK1homsNQ3VvE1AGx8GOwcHv4
	 POyCDHYT3payHN0vaf3m3DLLXqH+mGhYwYicizjoPb1Mh8q+QquDoWiJjrh8x9GWbygrB
	 gbhTyW3I73JlaZwE7HcVy0zdQbrU0qRhxG+1uHMHl0vx95w+2OzM4Ibt4VLNMSU1g3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794245991;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:X-ThreadId:Date:From:To:Cc:Message-Id:In-Reply-To:
	 References:Subject:Content-Type:Content-Transfer-Encoding;
	bh=Jx+orbMdnp1io5imtta1zVEJxS1jmfd2J0ez76Og2AU=;
	b=bSeDSc28DhMOofzjhMZzMvuQ/+g9AA2LH9+XFp3FQ2tPhZ1LEPCnHM6X1y3gXwyBicFt
	 KFjReL9mMeeFGd2WCGc2TvKAwaqaxLO4TpRw1i0qDil5py9Mwgxq1MwTiY/OHzyIQWIkW
	 ZoDb1RwCQ+0ZkP+xTKNtR/qmYmBnthvK/M+x68hMDi+DfAjFB+MejNGOq+baIEKX34q/N
	 8c8WgrmrreSOidRD+uQ56//kfpBDtU478vcxDBCvj4uJevvM+20udIOQYIZsHQOyi6zQP
	 Zgc3D+PHYDaXarclqfdtlOczANUt91TI7rydIbLk+kfdnF9Rgf0pmX2PV7/ZX8iCvqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arndb.de;
	spf=pass smtp.mailfrom=arndb.de;
	dkim=pass header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=Re4t082O;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=JenldR83;
	arc=none smtp.remote-ip=202.12.124.156
Received: from fhigh-b5-smtp.messagingengine.com (fhigh-b5-smtp.messagingengine.com [202.12.124.156])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4172606A333
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 17:39:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4172606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=Re4t082O;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=JenldR83
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfhigh.stl.internal (Postfix) with ESMTP id ED6647A019B
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 12:39:49 -0500 (EST)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Mon, 09 Nov 2026 12:39:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1794245985;
	 x=1794332385; bh=Jx+orbMdnp1io5imtta1zVEJxS1jmfd2J0ez76Og2AU=; b=
	Re4t082Oj3SCzbVFuwjRkHaW97b8pWKY3EHP3FBLQtdQiiVr6AJM0UwPXdG5XbUK
	Otqguc6U7rKfgWKEcPlRCx4uYHldRuXpeMVMyvxXzvVzXj9a4Cvo6HhB1gXPM27f
	FUQp9sVikME3PC904QZcZQyuYZTKn9ZBWVysC47dMalaTYfsC0vjh0a1+05RIKNP
	qpr+yHAyEsyp4Lgv0wKijqooAV9zdwuWGEZfGVxJtHken+6fu5jW3GzIg7WsK1IP
	4vqCJrWGkSVNWVZvGrRapbIveALs1wdArPJYKccwf2uhuwzYxJytWxDjAwl/IIi3
	X/jCETq7dXR7xnhDn6rlcw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1794245985; x=
	1794332385; bh=Jx+orbMdnp1io5imtta1zVEJxS1jmfd2J0ez76Og2AU=; b=J
	enldR83zlu33xvZKcVzcrn5fkrK9bEQdGA6F8Dj3aaAC1s4UHfh8SQaGts253YBP
	Qn2W3RfDIWdGtn7t1a4Fyuv66CuC3nhmGFdiGIeUTI3Uj+O82PA8206S6fb9+nhA
	jVbUgJqZsKFnNvwtSow4+ODHKyMBXemvvsTsR8YPrXnIiKUuHIhSFSUoBqsVbti7
	lF7mWccJolz2EqqV1pvZ4OGGDSfIR09Pwa/mt1pWexMiPCkT4/PutFFn/0M6ZhMg
	jAPIeFB03do6A7haZeibKnBt4SYcME8+wVuC3w5yEc9RVFaURzY2zjmBW/HGX4P9
	LUZby3KwCKdfERCY4rGeA==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=arndb.de a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1794245985; d=arndb.de;
	mf=PGFybmRAYXJuZGIuZGU+;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm2:rsa-sha256:l4/3z9aRzgDFWsyf/c/JZMEMeYFWtZ7BRCGlM35JU+nSGfW
	1Bj/WqRdMril+daDPrCJ97OChcg2LUPSvn2ZLvO4ZC/MV4qIQrUi8GksHSSgRNaK
	z5gg/WG36GQXAVXwaJoWbqXV7m37wKLaW4psjh3fdSHXHFPVdl8ygTKGUUKOeNF8
	OaePmzo/n7NzfWhll7CBv7Js3RDujbmG+qX9suYcFXkCXmPIrJYQN8nKM1A8II9a
	/ALx/oX1Yo+OtqOEmrmm164TyDJMakEYSGynN/NpDnjccOqAUtfBblYMPq7kbI+5
	ELSYInt2MoIkiJ3WPvGfqLgmYTiwGfY3gKzM6Wg==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:A1tymppkxtYGxdRmAfoksCszlJH7VhNGvT5qa+nmSZQ=:Jx+orbMdnp1io5imtta1zVEJxS1jmfd2J0ez76Og2AU=;
X-ME-Sender: <xms:XwXyaubw-kVgz9epbL9-xOWPAxANnmHszK92x_iYOdi94DT3Zj9j5g>
    <xme:XwXyasMJ3qMN6ZNpi9tDd2eQ28bKWdP3ih6Zv7YlvZE_NdTM6fk4Iec1e0DEMEANK
    j0PT-cbEuaoO4OE6aeu08aUCN-VWVkSJ-QMZPIzNrF4dH6xIFHPSKy9>
X-ME-Proxy-Cause: dmFkZTFCba5vHOiU0quAZlIU8gcXbWVrl1Aue5yXTlgx8eW3A4Ki/+kjByw8NuI+qVDcIQ
    3xZ4bU8ek1NxnMdYpiMZGXCEEsTwPZEg4ZIOd3KQxqcrW7a+ROfmitmGRSyeMMyjV8S+w6
    4/AjXNKAEpr0XhdOjpKEkz8TTtBACR8doEzfIJcBZ1obVi/G1ptOTNe68h8Iy+aCIYqmqH
    JNFV9VMilDbul/U+9JoxDMM7oalvzjsg+pJ3kdaAKhcqLdyabiJ7AYWAsaEbL8pi5HomP2
    VK3tuuGFl7LjRJKmZQVSy+hKuw7il1Yky+laHdSrZIT5/0lOGyXipwNx+kjoOnXPoGkPS9
    8eI978Xjm9OCIf2mWy2u+Pky3sIpC2k5wmTgRxP7OaCV4mg1Df2TvM9uPsSa+AfhlGIBHH
    PhqldA4THXHoRmIEFAs1dfQ9WhyTxwXESAy1R7MEaH6O24VbB3PAyn89D/td4JiVsmibQp
    5TltLZxkVNW5i1+P5IYX1CQGSVgm7k0b5M+9YHUW4X2nZsxVgfycdgwvFQZt6/rEXfbR97
    +xVmetF2G9W+ThsdNT+gWEvgoJSPNyQmDocmPdRFnV25OfgZA3x1p+iXhIlQ0z3RYwI428
    GRRSW3UgvK1WLf3m7Ki1XqltfcoUBdw28OqIB40/Zh5tO/bUP0jKe6MKEjQA
X-ME-Proxy: <xmx:YAXyasDjfSRK8xBcSeCNgUAZpxxL2W98Vs-9zqg6rNhzzifo_XcRGA>
    <xmx:YAXyaonYhWv_zkPUvlC4UjYIuxN0fOaR79fGK2gBOzA57ghncgYnFA>
    <xmx:YAXyavejrujzb3dHlx1jHI1h39P7v7CT6HdKGEW6-Hfm3RK7Elcpvg>
    <xmx:YAXyakS1yOFqVTO4sKgWC6hdjcOI2bvoZORnLwGWfHVWMt6Bp1zYoQ>
    <xmx:YQXyauLiWYxEtEFDAAMyjD5n0OBSWE_TwqgmSWV_0MFIF1igIH7fQOox>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 5102532A0097; Mon,  9 Nov 2026 12:39:43 -0500 (EST)
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
X-ThreadId: A4tRjBaEslZZ
Date: Mon, 09 Nov 2026 18:39:23 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Dmitry Torokhov" <dmitry.torokhov@gmail.com>,
 "Wolfram Sang" <wsa@kernel.org>
Cc: "Felipe Balbi" <balbi@kernel.org>, "Tony Lindgren" <tony@atomide.com>,
 "Hyunjung Ko" <hj351016@gmail.com>, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org
Message-Id: <1e74165d-7c7e-4ef3-9684-747e1a7ab9cb@app.fastmail.com>
In-Reply-To: <20261109072950.3474308-3-dmitry.torokhov@gmail.com>
References: <20261109072950.3474308-1-dmitry.torokhov@gmail.com>
 <20261109072950.3474308-3-dmitry.torokhov@gmail.com>
Subject: Re: [PATCH 2/2] Input: lm8333 - remove driver
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, Nov 9, 2026, at 08:29, Dmitry Torokhov wrote:
> The LM8333 keypad driver relies exclusively on legacy platform data,
> has no Device Tree or generic device property support, and has no
> users in mainline. The BSP board file it was originally written for
> was never upstreamed, and the original author Wolfram Sang confirmed
> in the mailing list discussion that it will likely never be converted
> to Device Tree and agreed to dropping it.
>
> Remove the driver and its platform data header.
>
> Link: https://lore.kernel.org/r/Zr6I9RB5mibU_12N@google.com
> Link: https://lore.kernel.org/r/Zr6PnlsdoyLoX261@shikoro
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Reviewed-by: Arnd Bergmann <arnd@arndb.de>
