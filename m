Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.154
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794405424;
	b=PfOvpkqYJgsfCyeDqQ8uzgokcIQra36WFnp6Q7KM5J+ws00s88DmnpAQ7QohyVRGvKTj
	 PdpkERaF89xT2o8amOlC9RqZZBKdo0VeZ1zwHsysOuDL5Z1+FeEwinCiTj2DyPeO6ItSX
	 vFe7nIxGC9B/At9rEvLbDGr9qgPEGw7YIDEqgNIAO1VaoCoGSf1IU9dBf13s9n5pJY5hV
	 IhYJKJ01lp1tROATniDqO4eDzrDFs0cyK2+azU1ZGFMiOYpX5NsCGs+S8XijU9PgQUPD9
	 ilXRlJkvz9dx+s0qVAgibjAPtE/wq0FTFWy1cDn47Sc6gT5Ged3kL9ZSwWu6JZYqD1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794405424;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:X-ThreadId:Date:From:To:Cc:Message-Id:In-Reply-To:
	 References:Subject:Content-Type:Content-Transfer-Encoding;
	bh=Kdk764iItB2tzvrPnSW2o6ljeR7654G7oyKs+MOQe6g=;
	b=NbFY55zKuaUN5KHaBQCZb+PV0dFs8hVC3rizwALBmU0zMS6D3qmvv8WPlpNlVDA6cKxe
	 czpMD7FqNiYhWQu/wl8IcE0pXeWw+auK197ogzpne1LlxP/4fc94cqmVDNNgfzTHrqsfa
	 /K7gGd5qU8WxCJunrFyxRsCfg4CmujdUijtzgDpYI8w6vqb4T8JqcFKBXtPAqAnX5CkO7
	 rskOQUEWWYkhHxuXxa375sZTqPUMjcC+jOXt4075WXfMgaatZwdCV7WykqoIZJ84ZGWYH
	 oPqy1QR6pLObRUSZYkPob0TnfZTE7nsaRxaJMckSCVfbdvYnscwLwOsLGOjXRLm9PhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arndb.de;
	spf=pass smtp.mailfrom=arndb.de;
	dkim=pass header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b="aqmnkLz/";
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=beruM72V;
	arc=none smtp.remote-ip=103.168.172.154
Received: from fhigh-a3-smtp.messagingengine.com (fhigh-a3-smtp.messagingengine.com [103.168.172.154])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF5DB606A324
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 13:57:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AF5DB606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=aqmnkLz/;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=beruM72V
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 79F41140017B
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 08:57:02 -0500 (EST)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Wed, 11 Nov 2026 08:57:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1794405418;
	 x=1794491818; bh=Kdk764iItB2tzvrPnSW2o6ljeR7654G7oyKs+MOQe6g=; b=
	aqmnkLz/fxk/yf/NXuAbKeyAb5QNHI7dAS1DtSTNDZDc+1maiYBg0uJ/1fE7i7QU
	GUpKzND/V6gwXB+9RmZjqOsXBZWGejsmcl7NIn84hn9QH+z6JqMS8urwAN46qebP
	y3DXcd+w0ZRSkLwZsVn5g7NpdvwUjYIx38MQx92vh5qYstOwvCEHQE61X7R3WlFm
	2FrWLTQDSaMUgwri/OaJlEnJtgKPMe2X+CO500a6yXb+lWvIHAVsfFPXeSKVDk1T
	Tr72m+IjR6pcddABnGXgRAqDARUnug59EeC7b7/2BIUQvngsNMgQ/rkGdA9qjgws
	9mVEIZobpE95ZcuBQ43lLg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1794405418; x=
	1794491818; bh=Kdk764iItB2tzvrPnSW2o6ljeR7654G7oyKs+MOQe6g=; b=b
	eruM72Vbk/suiSqJ7+PgkyHJ4OAsc0ZCKqiSFPXfmfNNy0z0HdzqpqgIAYnym4j9
	zkCG/FqByrKTdaDJUBjkKFowkPIlq5demF6jiGLmYshkVKlkjuU+z7Pv2JDc5dyE
	mbslWxOhC5AfimL0qd6vftFWJgbwtPnh9Oz2q8uE42PPY+qfYbejodVl+mF0XbiC
	/pqTMxZMXrZEAIi4bHKOJQIhoqfaGCGW4lZHeKSBjxf1cJqThNaOS/qvlFXe44tO
	2kpE5zpgp9dHv7HuAkf2oOLhY93ND7MAk4TBkZ8o5EqD0z2ljaXh5vO0/9ci742Q
	+XdkhkfZPLAfr6AoJU+nA==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=arndb.de a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1794405418; d=arndb.de;
	mf=PGFybmRAYXJuZGIuZGU+;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm2:rsa-sha256:QZCuB2zUJFEUmZVdQoABnJnoBXul+PzIpaFk+y+73+zK9dX
	DVdVXb3MEYhrnO48KszAIBvkofZXIflsjXsWbQ5erJNxDUtDseF0DaTkcXuarxKI
	/a3VlTA3HG8+KjWsNb5Tu8LA8vskQmNCm5pyKDJti5KfbcfNv4tZDCKFSLVqPIB0
	o1MlIztDZTnm8Pykq8+AnRlTOVajkJfZFBn+83Jh58GcLAeezY4HVcQBQrGvoXrm
	xL5CQ20+6VOYTZHpoTZdb07ORIgYZEPBr236wSOCvm0E3ctPYQ3RhBPTFnpx16A+
	QoTAKkmwxiDVeR3Kn3KmvUm47vPQ3jsdiqdOJMg==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:Toh1YTnD1+dGrAtJ2AuY2/WW/S/YxASsJ+zcEo5XRxg=:+neQ1GDgaggW0c4Lfo/mJB6NE6M1ZJiasN+aoxB7DBA=;
X-ME-Sender: <xms:J3T0aomwmPS2KPcejDvDlhMjjj75Xiq8goYrcG8tyEwCu0OdHbLq3g>
    <xme:J3T0aioUebuzbfJf2HscvB9X9Vgg4Fg7P29eNGyueyyYhAC1dupGX1auwIuaySl2b
    4-jfV1DInX-NSpYbYOKkdPJ_RlkvPRg67RZ_pb6ZXIh_Vw_QBgPnGw>
X-ME-Proxy-Cause: dmFkZTEjx+im0ead3mBwASswY9eNoBZhB5G8zMcuHOYkywMLGJWGf4Wb1ah8yOfNc5a8GJ
    e5M5dRHf282PROUCybONhJ+HMu59oeSOzQFQ/RA02sSyjXNLm47s40PoPE+rZrSqt7zTwI
    IW5/kkUl0Na9JgfDH3OoxOgo9B/WiXOkC01Eew9958VILo6y9+iIf6WKv8WshncaDvKJrk
    FnM3YZ3jdpXvMt8yfs0xYfPQAe5PkQq615IvLQzCu1awFO5Rjss9iQAzijmfzqT20mmGLw
    Bpi8mWV1UJf1yWK30OxwsXQghdZrT7GBop09LZ7tCacRgH/1bJnqa6fx5+OxMA70utbhYd
    rZOa5Tro8N+6BnxViklk3IMkUm+l9m+edp/2pupZ6lm9F0KgbCB9jUB+3pMlSDVoDbN/Ey
    SlWROoPoHujFG1BLtNZsxUBMrMJ9EQIAMkYrai00ORKeOMKrTATL3JmaeWpQc8xiUTq84Y
    7g7jVhKdw3zICtikOv2m3+Zpzvidub+EGUj0WzdKU1IWzk2cucJS2goPu6TtxdUyVl6PAM
    uhQQ7fBnERrDkIao0IvJB96/xSwbfz+rZtuj2DvF/5uza7dwaeIGTOJmcRYnjKzcMn65fV
    Ji8QTVg+HqS+bWg6UmjHgXPCLFU1dXsp6amBh+KL6amiRchT5AaVNOlz6wVw
X-ME-Proxy: <xmx:KXT0ahKyVfzaxbAMLlNC7VeycNkkctLNG5sRSzMDEdbAR5v9CPpfDg>
    <xmx:KXT0asP4ecEsYsalAV6y0Dsx448KtTxWiujoNFKjH4zE4nso9Hm5Dw>
    <xmx:KXT0av7avvcy5NPEu98Dg2ioNafWBMi-5Luhpjiprioxb4tg9DQiAQ>
    <xmx:KXT0au6PFJA7nsF5WH_qpKeXY2nsfNjXv3_HvDPDghLXSKyaZpLV0g>
    <xmx:KnT0atq7m-0CfksC8jaLrq6DIlV9xDBZXHECOUagz1sZJk4rJr0RfvbR>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id BD98632A009C; Wed, 11 Nov 2026 08:56:55 -0500 (EST)
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
X-ThreadId: Arg9H_lZnKn7
Date: Wed, 11 Nov 2026 14:56:34 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Agustin Santiago Isasmendi" <isasmendi.agus@gmail.com>,
 "Russell King" <linux@armlinux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 =?UTF-8?Q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>,
 "Navid Ghahremani" <ghahramani.navid@gmail.com>,
 "Krzysztof Kozlowski" <krzk@kernel.org>
Message-Id: <49846243-34ae-4643-9b39-1537947fbd96@app.fastmail.com>
In-Reply-To: <20261111133930.3665251-3-isasmendi.agus@gmail.com>
References: <20261111133930.3665251-1-isasmendi.agus@gmail.com>
 <20261111133930.3665251-3-isasmendi.agus@gmail.com>
Subject: Re: [PATCH 2/2] ARM: l2c: honour status = "disabled" on the L2 cache node
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, Nov 11, 2026, at 14:39, Agustin Santiago Isasmendi wrote:
> l2x0_of_init() looks the L2 cache node up by compatible and enables the
> cache whatever its status property says, so a device tree cannot keep
> the L2 cache off.
>
> On the ZTE ZX279128S (dual Cortex-A9, L2C-310 r3p3) a PCIe read on one
> CPU deadlocks against an L2C-310 line operation by physical address or a
> Cache Sync on the other CPU, and the board hangs within seconds of WiFi
> traffic.  Running with the L2 cache off avoids the deadlock, so a board
> needs a way to say so.
>
> Honour the status property, as the newer cache controller drivers
> already do (drivers/cache/ax45mp_cache.c, starfive_starlink_cache.c).
> If the firmware left the cache enabled, it cannot simply be ignored,
> since nothing would maintain it: clean, invalidate and disable it
> instead.  No in-tree L2 cache node is disabled, so nothing changes for
> existing device trees.
>
> Tested on the ZTE ZXHN H3600: with the node disabled the cache stays
> off and the system runs normally; with it enabled the cache comes up as
> before.  The firmware-enabled path was exercised with a test-only
> change that enables the cache before the check.
>
> Assisted-by: LLM
> Signed-off-by: Agustin Santiago Isasmendi <isasmendi.agus@gmail.com>

Hi Augustin,

It is a little strange to use the MMIO registers of a status="disabled"
device to turn it off, and it would be nice if we could require
the firmware to leave it in a consistent state instead, but I assume
you can't do that for the one device you are interested in because
you don't have the firmware sources, right?

In this case

Reviewed-by: Arnd Bergmann <arnd@arndb.de>

but maybe add a code comment that explains this to the reader.
