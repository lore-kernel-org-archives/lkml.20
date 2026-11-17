Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.145
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794914074;
	b=bn8nfOhNMtSosZ2SwaPqsNzAe17vDOO6NyIp7C8A3veDYsE2nJIDs4CXheODkJf/zFgQ
	 RYeLhpewgZhuxhlEZVIlz5/V1N9RPR965Moa/wgDaRqaZ40+AcHhgq6oZBnuvbcjS8DF6
	 leUn6+BC2tdGeuF2x1NqmWGBhux5v8rPgW4SQH5G6QjB5dHS5r4fsDLrzG1RqsGWBplJb
	 6M+M69PTN5rhiUdQmoMZwtNodEms93UZAj1cz/25cvUhGRcln5YL21hrko153Hic5Iotd
	 j/z7oVGIePv/44c83/7eCeq464SqPMXB/Ixv92vYGUnqwAZuHezrNb9BQ7rKiwK33xg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794914074;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:X-ThreadId:Date:From:To:Cc:Message-Id:In-Reply-To:
	 References:Subject:Content-Type:Content-Transfer-Encoding;
	bh=nyrUSLjckhnk71y6oQ5XcHqO6QktwoFMhNW+C3YVinE=;
	b=qss8NU+ZZyTT39IsdkApQUfEf52coWtVewjwrxR9Csahh5wgwm2dfGvrYiKj3Wm2QuQs
	 20R1lYA1wPOajwDAO9vmdqA5TOk1JqfMy+i5iSzUTVI90QDQG+AAViTu+Tz3iRM+MXkaN
	 N3Bsv9S7e2Z9WMnHDgwOfPBcKRwBiXMX+5/kQShsf5xDTwXYd0NukQWG5RToX0XEGPJmL
	 haKah5geHjGj0KR0iN2By/Jkf1kBXno1oTrvF5f7fbjmkM7yf4TFnGgVIVMRqE6xEnTjO
	 KFiaT5OwngNktnBZUUJ+9FxzuquRijG3uck26jXUyZTL+b3uBEtzSVVZTYN88QWYMGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arndb.de;
	spf=pass smtp.mailfrom=arndb.de;
	dkim=pass header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=KLj5R+9Q;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=ruVZknMn;
	arc=none smtp.remote-ip=202.12.124.145
Received: from fout-b2-smtp.messagingengine.com (fout-b2-smtp.messagingengine.com [202.12.124.145])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C97C606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 11:14:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0C97C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=KLj5R+9Q;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=ruVZknMn
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfout.stl.internal (Postfix) with ESMTP id BCF441D0018C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 06:14:31 -0500 (EST)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Tue, 17 Nov 2026 06:14:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1794914068;
	 x=1795000468; bh=nyrUSLjckhnk71y6oQ5XcHqO6QktwoFMhNW+C3YVinE=; b=
	KLj5R+9QXt6bs4gxiWjxnsiG3H1/LxfTei2NJzMk2A+/zNofzDUf2TpSDz5TbA4J
	BcZoRR5Dnq2I76bJrmREmlouqM4af12jCA+z6SeO/h9tvW+8TIhf0Etz/mEvL4Ai
	gIidMbKyDJZ0nEKh8OwAjuK2gs9j/mTPMwk/R/RR7ycH2gR8oIMuuhLVnZBvNb61
	2lx0T/iVuJTzi+1QE3BVun5TcPRu4qj6fY4buWU2tSX97jpPPGzEYxubspcYSmjB
	5cZA18pnMrdDyIQ0rMNlPtjtRwrHYNJqh3t8d9Q/8DlK5rGCqf7pRhBraoDya4fz
	UPKVWFBCyWLAHVmXBPjMmQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1794914068; x=
	1795000468; bh=nyrUSLjckhnk71y6oQ5XcHqO6QktwoFMhNW+C3YVinE=; b=r
	uVZknMnnPmy6QET5Bb2/X+lw4AVy/ibMwhZs9I7IyBpyQg8FoKLhheitm/Qq5W+e
	bYTJhLRGtDhORQet7cWELUvPxbMRbcb5OySWd4G723gZXFgHi7xoSk6Fx/XlsuKr
	QTEyADtCTJWNooNKp+6wcNWUfaRQJ8/JI0HPE9N2bA2Vu2z4jrVz9w32BgRryBei
	NOLc/v44N8fBSqGf5wu5nRUsp2ZHUz6bJPZEggxnaNQGEDfVSIBbDltb1O3sC1HI
	mR6JtlDeOziGVmp91H1oHY1ULNFLKEjNnCc1m+qw3/2lJaEUC70pkLCow/peFsOR
	uG20ml1Z7DUzmhr8b3DbQ==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=arndb.de a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1794914068; d=arndb.de;
	mf=PGFybmRAYXJuZGIuZGU+;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm2:rsa-sha256:HwSS9ZV8XsRqF53FPagK5WwvmZ2SX3kUmgpUr/dsnV00+Pm
	LqXpHg1ok2ycYhoEBaYQ0Swoy7M+R9jlQTlm+qBeDYsBziSaeZqqqEcqjt5hC2EJ
	gm9bAQxowkLOpsb0XD0I3A3y17PB4qYxNMDiwmW6R8oKLQWirzdnmt738XbHX0NH
	eEwy5XkbGtL91ykjZSF+T7TWo2SJEuptd7zJKNMN7IgLRa6gedol9I1VmeU6WOks
	D9xDfhXHUym5IlXrbRzLFwA6P4yXR8mkxihpJDxcQRduyWVOuLmta29Nwr4b8nyH
	Enbb75xwwO1RFXcfmYhRrF5DqODFda4BikZUB9w==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:7v4/986iFER5S6s7ld8hRw7bcqY7IaHnDM702TwBsw8=:LxReB3JN7kSgWoSI90nSdmU2kCe5+tDQe4dSG3msCoQ=;
X-ME-Sender: <xms:ETf8aqUiqOQborDtjiFIJr82Lm3cVtOxo1qmrQ8X5c_LY-G8-ep2Xg>
    <xme:ETf8ahbSYUxE9JWwXZN1U_62sGrSP0t7-_Mog6_-d9mnIWG9Pe2Cj2F7gqlXpsZcp
    2DGfnEh_eNF5aXT50-zKcxR2eUxLtU-HCT3XOJNWrEluxcJtXWamjE0>
X-ME-Proxy-Cause: dmFkZTGXKZ4HeiXVXWIq8P0hv8Ey1J8wMcJYfou/phUQCugD5tQpnrapvVyBtTNtvnU0T2
    Zs/7v60gPN+42RlzAZ4gRA9IBbx0fYCt0Pu4WPd5hBED2NAKnVSP6xakAJtMYojz0hf7WV
    J9gg3/EDJTV0zGMACRseOVpKVZciDdJBoz1yb864pknbX24NwqLZZte9CH7Zm8uZ9CDt7y
    I1FPVTrMgvhQYI9Q9qDcnoLkc48Xf6VIWL3Rwz9Au47AlBj8Guz22NDJAic7FHug5gr/ft
    hW5wS+iyLEHo3FWHdXd2/7waSuqYbM0XRkDhoJ/mrL0IYwpnlM4yZqT6Koan7Pct31EWNj
    vuWgnhPQQEVAPh74PrIpAEfowhQK/afV+2M5T/zMuPm4ErNFi/tZNvU8WLqEv0oT1z38e/
    N+0r9mOmSS3V3G+bs9sBgg1fj7UGXxbGv6nfgcnomvSdJ/zpDhloXsVYGYNq8rlBONbR2x
    o7W3iCpqFif1vKmRIbrYy58JxfV+JeM+EVb3khdPjguPo/E5epNelaNEJcHKxSiWYTpAgB
    KQZyY6YWZJEq6M3RrQSQk/Ph4o144Ugb8HrxCOwWM2ai7+ZgXhPojlyGOP3RDKue77El2N
    06JoxfYLjl/E55CsSDntbavY9koYwgQA7G8BarKtSCHPV2anUQCTFzMcfVIw
X-ME-Proxy: <xmx:Ezf8ahozCqriLkWg3x69SV36Gif3S7HNYcq2mtPqkd-Ph7619w_CVQ>
    <xmx:Ezf8anVfqi-7oJTKTwn_S3UdNGLTvQSxf3zO1kQHCaPj1rRpEoCYpg>
    <xmx:Ezf8aoAd7RtR3C-XdWouhrtQkt98Ngs0kHhNgRVTw9PGuzMNzUYX3g>
    <xmx:Ezf8aj3_YwLg4d21b0ZDTnbUY1jMIIqjw7Wj1PLGYuvlnIjTax-GNg>
    <xmx:FDf8arPCbJzGVEgK7AJ9z-LLKVGz5Rb-W4k4GEoro8FPNlms2En7smce>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id C57A532A009F; Tue, 17 Nov 2026 06:14:25 -0500 (EST)
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
X-ThreadId: AXUpA_0H0_pg
Date: Tue, 17 Nov 2026 12:14:05 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Geert Uytterhoeven" <geert+renesas@glider.be>,
 "Philipp Zabel" <p.zabel@pengutronix.de>,
 "Biju Das" <biju.das.jz@bp.renesas.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 linux-kernel@vger.kernel.org
Message-Id: <44587a7a-e9d1-45bd-a698-69b6bc1389ce@app.fastmail.com>
In-Reply-To: 
 <0b1c87b3173a789f6227f13658e4befdac8e47e0.1794913893.git.geert+renesas@glider.be>
References: 
 <0b1c87b3173a789f6227f13658e4befdac8e47e0.1794913893.git.geert+renesas@glider.be>
Subject: Re: [PATCH] reset: rzg2l-usbphy-ctrl: Permit disabling POWER_SEQUENCING again
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, Nov 17, 2026, at 12:13, Geert Uytterhoeven wrote:
> The power sequencing part is optional, and only needed on RZ/G3L
> (SYSC_R9A08G046 selects POWER_SEQUENCING).  Users of other members in
> the RZ/G2L family may want to enable this driver built-in, while keeping
> POWER_SEQUENCING disabled.
>
> Fixes: eac3b292a26e2210 ("reset: rzg2l-usbphy-ctrl: add power 
> sequencing dependency")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Acked-by: Arnd Bergmann <arnd@arndb.de>
