Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.148
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793835870;
	b=YsBcvV1fdVbBYDI4UAI1dGoFKOEsrxf+m7JohjU1jY0rIbQL9YYH8zL3nleA5Zmmqmkv
	 ntpmaeAMuPtZigkPwihNLcO1ShvfT7XQgYzvsYZfSi3Vg2wjpJAPV62ZLSyQ4PM9kzHmm
	 sxEYPpVS4mqZ+QWPFTVxmR5NtvdvFbWw2QC6p6uLQRge/Is2sUHqLD2VC+5i+WhaqwzTj
	 +pAnXvru2j49vG44w9TDHG8QNhpA95BSItgAj8Q3zxNbHJi423rTs9F6xypWUeNZo4wZo
	 IdrbMP1TIQm3yIU1uohP9iWTZ5bz8YmERnRXRKoySPcGFFpTKfHjJjhK2Qlbfkt00qA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793835870;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:Subject:
	 Content-Type:Content-Transfer-Encoding;
	bh=JSn6tGbEe2l/YwyMHe7oKDNEM47p+rgBBvGJghBcSp8=;
	b=CtXJVCMESLGtxX8N3NdjUtH0fuVgvUb9DdWXJhvGr2v0CP2cX6a2CBxFu6HRnkY2oSFy
	 yB9mwQS8/CitoRL4hnjLUYsrNXbwr2sULmhKZggTg5H3lTy2xMNFRqyr18xAu13Rm65/+
	 1Y+fVM8QaHPUB0tMo3g4SlxtX/5CzxIUuHbWTn9XtfEYpmr3YDCpE6ThSLsWijbpF/eKe
	 ECepaoJXey4XvapgzbJTmKFz34Jvew2KlI1ut9leopQC6y+yJx39Ve040ZTdEfqnZeMu6
	 fH5AMCnNkJjLDHKb/OnORVYNQ8reYcThDOL/rPeGaX1CW72PkdhKrG6/waG4UvndVtA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=johnericson.me;
	spf=pass smtp.mailfrom=johnericson.me;
	dkim=pass header.d=johnericson.me header.i=@johnericson.me header.a=rsa-sha256 header.s=fm2 header.b=hztbExy5;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=rFvJDc+v;
	arc=none smtp.remote-ip=202.12.124.148
Received: from fout-b5-smtp.messagingengine.com (fout-b5-smtp.messagingengine.com [202.12.124.148])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD725606A329
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 23:44:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CD725606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=johnericson.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=johnericson.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=johnericson.me header.i=@johnericson.me header.a=rsa-sha256 header.s=fm2 header.b=hztbExy5;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=rFvJDc+v
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfout.stl.internal (Postfix) with ESMTP id 383601D001BF
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 18:44:28 -0500 (EST)
Received: from phl-imap-16 ([10.202.2.88])
  by phl-compute-05.internal (MEProxy); Wed, 04 Nov 2026 18:44:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=johnericson.me;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:reply-to:subject:subject:to:to; s=fm2; t=
	1793835866; x=1793922266; bh=JSn6tGbEe2l/YwyMHe7oKDNEM47p+rgBBvG
	JghBcSp8=; b=hztbExy5VtfW+SIcUUiS8g67kpv1wJ+7Tcw5jU0fmQjUpbAIOmE
	gBbcswuOemelVa/OEoRCJxbaTBl+N3zq3d25mEEM9vNCTMYXgi+pPQZYJYv3FQAx
	FsyNMWpA6szlHmzPsZXq+2h+b+spXAWlu9aXzlvUBIeSLW+J4eor6bEMu0w/LP5k
	8qQdV9vYoncxfZtGEJNA2vB3rtX3CoTuHA0d/afGvRiHO5l74vO/yEk+GDe5AxZy
	v+kBrPqimqQoXrmuxFxK3JNa83cw1sAqhCrg2iN85FKHBMPzays10h/kTcT6+n+b
	TiSZLz2v+9+BWnN606Sue5Izbi59Qi4FOng==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1793835866; x=1793922266; bh=J
	Sn6tGbEe2l/YwyMHe7oKDNEM47p+rgBBvGJghBcSp8=; b=rFvJDc+viVQL5qGJA
	wYQiDTGtCDHPjDX5cvmHMZQ7vTkeqVaZodHBmUWCLoYq3msHtF33QAROM3dg/OgN
	mmQnLeqDS7M/xU4t/u6i5xNQDHhQw+BeHK9OvXRE1SJQy0B47D7ojYQG4b0koGPT
	+ALoKsYBtrkDKopov+kM/Y2MwRygdLDvjYrIZfcy+Ko38BGD6+IGi7SXrnw4cvTv
	SZndc+j3p9K63/vHwMZd8Eb9wsrxiJn3G8Ne1bk3EoNt8+wuNrHVgp5+TrZymtkH
	F4emXuqdtr9GYP5rsa1mSmkDQew8Y0aqDqyz2R7Ylog+OmfFzdSKHzxul1qlEq/J
	hRkzA==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=sign d=johnericson.me a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1793835866; d=johnericson.me;
	mf=PG1haWxAam9obmVyaWNzb24ubWU+;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm2:rsa-sha256:NLSjKmj/iwN7TQ0sBR5fPCAl2L7OIPL8/h9cvnXgoYqGrmt
	Qtd6ft7K4d9IhxWV/bmbvNwADywRBOTceqDRvJ9TzkrlMNZuC8jvHyEWg+4jWL41
	MHWPPBB8zU/MsLhoB7J/7XwBctsVX0jOH9DzM0aoHXdLlukGNViUPa5JGk2GO9bi
	nnLeP8ZoUtXRCZC7Zul/xNhDL1RapTLZRkvuG/jKziKKinBvhcsAgLq5FNSd6I3J
	Rp5hojAXmyNeW5fE1rel+4K0PqrE3spLeciZUQzxOL5S5h+HqUYby7bxXxb+KUZg
	Y5MWJpPmuscRc5pXmCPMU99FuQQVdPb3Cr75n3Q==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=mi-m=1; hc=11;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,subject,to;
Message-Instance: m=1; h=sha256:e9bONw3MRf9SzX06zssGZu9oETjbbTvInwt0yOfdmtg=:JSn6tGbEe2l/YwyMHe7oKDNEM47p+rgBBvGJghBcSp8=;
X-ME-Sender: <xms:WsPrapFBcuZNzbW7_q2GEcohMWvE_0vsKO_Hoy6UB1DAEuBW6j7Dag>
    <xme:WsPrapIEydC03wZCtaIJmuHHtrvP9ptIA12diz4HFT7sM5_SgExth3jogCuHYLu19
    AyA04sxZLiupfyGmT6IVi0X4FuZKsm9ydSOX8-RaiR9MdWMo78dljo>
X-ME-Proxy-Cause: dmFkZTGmBhiTB6NW2pRO4Oy23IbcsNWJSLAy/B9oFNmJXBTspDmHHO5IVR4fWN8elj7VvZ
    9BksVcd7rCrGKpGDyrC9B82MdgT3l7QKffuaH4J+zdjAvULxx/nvX3FPEo9g26FKlAjlZ8
    hyNvjMi99gnzYH6L9l3rhyTw/J7awpaPDi2dpoDn6n3PRF5w4seoxZ4BA2M6HrvL17vsPh
    88t+8l1EEbvg3s4a0wYR6UnFGW1qtOPOnQyqJ0j6HWPPzY84jsOqehts0mzzlLLSYshItM
    sLQIOWy2fioZNy79079jZt1zfLBVr7Gk2NSaPipYJ6Fx1jm9bt4lyJ8Jx/lrvW3NqEZTit
    Eit3x/IaXPNTFe30Yso1GvByekA3GyV5xyPLh9q/GlItEpUurmGDdh7S+hl64aU/D9DTBk
    QMNPq6ELkl8ApANuz+guc29p50D6Y6dEu6oNFQuSJBsiC9eeovpoctC91v1QVT8MNehBEk
    /EoGXEDqpgXfOkUgG5heBJVSpjW/CyTezdzKfDyp7A9/xDLw2JBy2HnorUI+WOTDZYgiRA
    3L2QWozzeXa8h3EgyaWdDa6Mz32zK7hfvxY00bdDuEmXH7G99vgtCXl0LTJFwV2N0Wbpjq
    OI2tTad1ZktaIYRjIQBKgGnXcfzfeC030pJM0P7oupUqajMNZBTNBuaF3SVQ
X-ME-Proxy: <xmx:WsPramCSgVQjfz3zBmYCgdQw9gRLM8-dLODCBCuAJURWOY9Zollg4Q>
    <xmx:WsPralvarcWoQh95dhRMxz6_syqgll5p2knZdi55xL9p6RObb2Hxrw>
    <xmx:WsPras9CgrJOw8aLHkfoXgn6HQ_6d5Oz2dUaghYReGFD64QSct_R1A>
    <xmx:WsPrakSrbsAgb7IyuPl0CPzKgKGBtYYdkwf0_YPT7aKc0J9mcr4bfg>
    <xmx:WsPralNawoNkqGZ8fgkJ5IjOXFk5sBTNKaLgpnDelKRjXm2U-FrOUyYw>
Feedback-ID: ieb4144f1:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 0EB7A2CC0083; Wed,  4 Nov 2026 18:44:26 -0500 (EST)
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
Date: Wed, 04 Nov 2026 18:44:05 -0500
From: "John Ericson" <mail@johnericson.me>
To: jkoolstra@xs4all.nl
Cc: amir73il@gmail.com, brauner@kernel.org, cyphar@cyphar.com,
 gregkh@linuxfoundation.org, jack@suse.cz, jlayton@kernel.org,
 linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, neil@brown.name,
 shakeel.butt@linux.dev, tj@kernel.org, viro@zeniv.linux.org.uk
Message-Id: <4cd50893-5d70-4a2d-bdf8-63d3913fd398@app.fastmail.com>
In-Reply-To: <20261024213539.1307600-1-jkoolstra@xs4all.nl>
Subject: Re: [PATCH v8 00/12] vfs: add O_CREAT|O_DIRECTORY to open*(2)
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi,

I am chiming in belatedly, I see, after the concept is well-approved.
But I just wanted to add anyway that that this would be great for Nix.
See https://github.com/NixOS/nix/pull/15244#discussion_r4474714305
where I was just happy to first learn that this was in flight.

Cheers, and good luck getting it across the finish line,

John
