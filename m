Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.151
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794410391;
	b=bO8VVql5qYquC/pF8n4y14Gw5yDnpSzOWldl7ePMEPcYsp5o3uKS+uJzvR9pQ70oLjMM
	 jdNt0QQ1E6k5AYMtYOp+Okf6y4/nyW+Jq1Ihs/gjZje8AspIvLQ3v34vOtHgxRwGA8cN9
	 bZdrK4ACv+F2fAJn8lVimH7anWPdfibUSx7B5IuSONlwz8Ylmu4igZAW93DZwrgop5eUf
	 VaIV5m6au1bhyh0BXEf7RmihcT5VCmIDYVVGlkhHRjb8dLb1KIJld3frBc+nvCDQzza+c
	 HsMKrH0JXNA5pzXB+LI7AJZvadDZt2PC1nsiTPRtLJBEfwn7GTABAE/Y9kRBqZ75Xbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794410391;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:X-ThreadId:Date:From:To:Cc:Message-Id:In-Reply-To:
	 References:Subject:Content-Type:Content-Transfer-Encoding;
	bh=Pb3dUF8hb8+jKeT6GQ80T/Y0883Yvvcm+C3dkjMSIP0=;
	b=G80ltz3HtrUj1/g/J81lQ3GGcdLu2XVdgcnG0vWAuXqoNLlyl0m4ltKnxmHNo1jS47/G
	 l92qLza3lKxl/KXX3CTFj6VvuJQS7Fjx0i+Qnh9MGyddENeNf0VxvE0VO9w9vqP579zlG
	 lNVfSSzV/PP6NOX4rpXZZ/VguVqpyfcy7gnL1cWiFsLBOpCU9ulcFFPT1xDYW8TiJ5vKw
	 0FWvhvshfE3J6pWWgwMX1qH+cEPHmYs48ZYhiT/fMcNozbwnPAE7iS/egq3B17LcdxZnK
	 aYdaVSMp/gx9VCG+XARF4XzV7PbuTG9BJKT2F/36bWZUdkjcPXfsYvloubTFsQFFcFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arndb.de;
	spf=pass smtp.mailfrom=arndb.de;
	dkim=pass header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=Opzxc9X3;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=mD2qEWgT;
	arc=none smtp.remote-ip=103.168.172.151
Received: from fout-a8-smtp.messagingengine.com (fout-a8-smtp.messagingengine.com [103.168.172.151])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07D1D606A324
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 15:19:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 07D1D606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=Opzxc9X3;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=mD2qEWgT
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfout.phl.internal (Postfix) with ESMTP id 9F2A6EC0685
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 10:19:49 -0500 (EST)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Wed, 11 Nov 2026 10:19:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1794410386;
	 x=1794496786; bh=Pb3dUF8hb8+jKeT6GQ80T/Y0883Yvvcm+C3dkjMSIP0=; b=
	Opzxc9X3Iv5LUK7NKFrkO4drKQUVNWWuVNNM6BNw4kx6ecjzwMg3ER70iCmcP3ZL
	UBv34gVvddN7a9WbufICSn5KbQtnug9W4gzxi7CYBKLlGNACVLvWr5EH9FfxUKj8
	b8WbJd0raO6UCbt4gDRIvGI9YLj/0TGwwM983CYy3XAnJQuKvShLRaUqfYBnaqFJ
	FCCyjcwnIt4OVJGZtshgnF411iALesA4q25FBwww3gwAad2+dOlaWCcFYClZFPwy
	fw3CtulUIfsWegO+aL/CWQuxnQWS2lCQCc6BfyOUP+/joRHzt7fzTwNx6jfibmQC
	FR/ANfKR5O/6Mazcnzzw/A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1794410386; x=
	1794496786; bh=Pb3dUF8hb8+jKeT6GQ80T/Y0883Yvvcm+C3dkjMSIP0=; b=m
	D2qEWgTuJHhyM26w7zeRxiHME+zhgDZjiDaHpVFR+9+4cIt/K/9AWQJfJnhfSmiZ
	6E1Pw/MNW8arRpuTbdgLamsj3Uupbs5eAi8K+s6amW33r317D8wLd+DKfQGeUROo
	0dfYcG7k942blUYy08oFvEJBBpv3m9u1W0HQS5/aPwwLr6W3uu7lLhWUa0oWQ0ct
	GXMk+8GPid0+ZAdo/DHUPfM/QpSPxGPFIj/UG9bQusrSJRgY5Zvz1YWlG7K1xQzy
	3FfMnZTW/xKFzFW4ZJjZykdSHZ7Cf+M9OWRHVJMO3gcjFOl7mwJS+IXVVLckcPwf
	fYtgj3M1aI8SbUIagEPkw==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=arndb.de a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1794410386; d=arndb.de;
	mf=PGFybmRAYXJuZGIuZGU+;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm2:rsa-sha256:K82c9mbg+Me/hcZpkvq1cIaOULiPY8nl6XwEc10OJEzjZt/
	BW3NmkcdUtvmVlcn+aPjqiMSLJRjR6kH6w5Uo3fKnleIMX0ztJXaG6SxwSwYvcZ+
	nzokWe0X2QE5MeHdOpkL9jbtGLuskxAO78i5xbg3qIBRtuQoEdFE1IKasuzOrpR4
	f1GseSAD/mRFv53v+dXi1bAMDHuAZD3CMJMBzeHm4ym2Tpygn9yCw3nSSyCAoBVw
	lB6++2VvCHd8Vgh2osjmdY7WrO/zf+6T1rMGsEWFE+WxiNiC7Bj71iuccjXWLi4B
	TuwrRFPDELxgO3MyOE+pRrGeveOW2IxhD6q2LSQ==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:XPsa+xg3+P9nThBkm9l6+0YEEti/hzum0Mf8msDw0C4=:ObWjAgat4GouzXMeDmlLqqN7ns2vk9BiVvcOBSOv/2s=;
X-ME-Sender: <xms:jof0amI3CS512952q99s7UiU59-GWES_oSJlq7z-cg_IHEntCkwQhg>
    <xme:jof0ao90lcd1FaMBuXyvytvqfASQW0juqPIlQqmgT6qcwVvR_05ESU-L3dDFVD8_r
    sMvYC7qSD2Gb3pKeW89rKFnvbdMEAjCkPx2GfQjl7C5ZOASEZiTAA>
X-ME-Proxy-Cause: dmFkZTGYiwOSwtquZw1u3N1npgk1JyeolpYqhMJ/fjE+ISkmbdJaZbeQGaUySSR36PWQWp
    94oZq6UlR6YWBTVFxDA31nwK4Q18KuH58ddrcwFvDz9U8b3DrvXKFi6gAKqC6wNJNKWO6k
    giQ3WIQ+R/H3B65yMLDHkRhuw2p51YOKNbfxQ0xN3vsBTTJyEJmRk1M0cnAPu1gocKw1nF
    fBqfdFs1K9BVhGexEZDB3LAV/BhwsY1I7560w8VYGHdvYjSXeVyN5oQ9BPYFtateyMiHft
    UynM1pydQ7v9dvBM66i8GYiUa8KBEJGfYi3oKPAe9ML8rlUGY7wpbI72SjeXptbKmOxnFI
    Hd217rcR+ufKbSDe2tX6iAy/f+grzTWay+lnZJszCwPpP1izCJDcbsoGGoHpii695BxYEg
    ArK+pZbx5GMO41lcKhXsiVhMqXmQS7HAeHVqsKIDCyOBFPnFvIibYELPR9i1d3qiClX+iV
    i7v1Dy9ME0zPkExYKTf7IEidn0rKuoxOHB4tnl5Vv4zYlDQSmqudJurjPyqY7D5XwTi064
    gMBjIE3+gGjC5/6Xh+JpGFMOjnv+4E4iZ4p08Nj/eEnlCtSb3oRsadxMlqsCKVwG6LHnq2
    2JXamHZQa8hv52n5QvYv1+mHYTdc21S5IM7DFIBxlCXqW1DQ0x2HMPQH5tsA
X-ME-Proxy: <xmx:kIf0atNxLf1oPHtuxZg-ulymHbQgyR90M1piCGxbE3H8lML_rGFBjw>
    <xmx:kIf0avADiheYRUETX3-YrGjJwLGY-TwwNjjbK8kYlM9dtDbbJ2Ushg>
    <xmx:kIf0aicLGlrDxudzhUdQMA7cIzDg7I95PW8spbzhmLHIokbqVOYOug>
    <xmx:kIf0amPn-FEwHA8qJn4hCWhNpYw_7ttsht6b0yYXqU--fyV-vvk_cw>
    <xmx:kof0agKarChKwFvbWkB7QoehN3XDHRjbA6QMe8GJ9ePDkt2Pj9SvW60o>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 85ABA32A0097; Wed, 11 Nov 2026 10:19:42 -0500 (EST)
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
Date: Wed, 11 Nov 2026 16:19:12 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Agustin Santiago Isasmendi" <isasmendi.agus@gmail.com>
Cc: "Russell King" <linux@armlinux.org.uk>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 =?UTF-8?Q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>,
 "Navid Ghahremani" <ghahramani.navid@gmail.com>,
 "Krzysztof Kozlowski" <krzk@kernel.org>
Message-Id: <76cfcd88-d701-4cb4-81e3-e463ff6a8f53@app.fastmail.com>
In-Reply-To: <20261111151707.2253768-1-isasmendi.agus@gmail.com>
References: <20261111133930.3665251-1-isasmendi.agus@gmail.com>
 <20261111133930.3665251-3-isasmendi.agus@gmail.com>
 <49846243-34ae-4643-9b39-1537947fbd96@app.fastmail.com>
 <20261111151707.2253768-1-isasmendi.agus@gmail.com>
Subject: Re: [PATCH 2/2] ARM: l2c: honour status = "disabled" on the L2 cache node
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, Nov 11, 2026, at 16:17, Agustin Santiago Isasmendi wrote:
> On Wed, Nov 11, 2026 at 14:56, Arnd Bergmann wrote:
>
> If you agree, v2 drops the disable path and patch 1, keeps just the
> early return, and adds a line to the binding saying so.

Sounds good to me, thanks!

If we need it the other way in the future, we can still change that then.

    Arnd
