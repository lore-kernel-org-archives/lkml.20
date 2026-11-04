Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.150
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793808955;
	b=n1wTq/69LtgmtWy/nggN2d9vE1TCONdT9vgZCJa75pikTzP+pXZmViBhQgo1orV6r8Mw
	 9XOu37kOpcLckPnRm72X7MhG8NEV23y5mZjR6p5PO7vJSVoQPF+D0i2QyI86E6BU/x5BR
	 +Jl9dw3Ce6XBDI8gr0udFcpn8xn607QsMOTzbEAiWOglufkYmL5vTd3TYDRRI8ykXmyc/
	 EzMraty0+/BVGPYj426jU1kV3IjXcTwU8F5XXPT2znYZqdoURF3y2gwpkPrnLnYdU2fIl
	 PgxktOiVpderswYV5pmWuvBQqhhhA/SY+BdIk64KaIFbrSUxa9Mqgon942/vR5UnVWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793808955;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:X-ThreadId:Date:From:To:Cc:Message-Id:In-Reply-To:
	 References:Subject:Content-Type:Content-Transfer-Encoding;
	bh=8e/mss8HflpUPukSo1l7KMk+icGVWWwgbeYpf+2EZ0M=;
	b=Quui6LNL3u6Q3jChzAwSwXp2lCve5ur/HbnqlQPDtmeIYdw7Az3sh2p1DXl8Gvnyidw6
	 8ePUHY8CPXcC2SIwMaoUMG7/Zah+BLV1j5oK02TcTTdASCKfw6ntJUg3Z1K7I6rO2byTY
	 lP1dOP6xDMdzgaNGTmOp8hLxG47WI/3z3Lzut7pGjE5ohliBETa0Hjl6MJorw5kffKHiY
	 oYGC+ZEuSLn1r2NThDjiGVScwSQ78viIclHN5rynac5I9bNwAXJzuK6WSypocgUGwtdGL
	 J8bcKOtX5lh+ru2JBpyxrCJYLIX+oLMqhDbbOG3+ca98cjHkTJqeTLlwQGFWWZ8eKfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arndb.de;
	spf=pass smtp.mailfrom=arndb.de;
	dkim=pass header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=aj2d1zPw;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=v6mnL4cj;
	arc=none smtp.remote-ip=202.12.124.150
Received: from fout-b7-smtp.messagingengine.com (fout-b7-smtp.messagingengine.com [202.12.124.150])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C10BE606D807
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 16:15:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C10BE606D807
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=aj2d1zPw;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=v6mnL4cj
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfout.stl.internal (Postfix) with ESMTP id EEF881D00119
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 11:15:53 -0500 (EST)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Wed, 04 Nov 2026 11:15:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1793808947;
	 x=1793895347; bh=8e/mss8HflpUPukSo1l7KMk+icGVWWwgbeYpf+2EZ0M=; b=
	aj2d1zPw50QYcIlxC/Bxzi2+vTfvUHUMqEboPUsUsilu739JezLAKnLkiMvxO2fR
	sTbZEV1Z4/SC4JP7xL1iN/EpU6eWjLzTNNGAX5IlZgpQnbpj3XmJi92J/XeeIKRX
	NWRVqO+OED9hC3e7QD6o6vVbYhhzBUPtd6Qh6UEvmiL4c4RJQXEk+U7CbC4OV/gY
	RkhC3z9t5+jUaItWbz/G24RS7PPz3wHhLVSvfeVli4OlrTIabU0PY5SVaWu0aXa1
	XPNZ1DyCvcPhflONNE/QLHG0+fTCr0vvkPnBlDG7dAc/jAs/fU80K4yF38SOoLds
	QRdJL0T9Guz+R6yvhx3oZg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1793808947; x=
	1793895347; bh=8e/mss8HflpUPukSo1l7KMk+icGVWWwgbeYpf+2EZ0M=; b=v
	6mnL4cjqtKbQWST2Uyr6CLmgnnJXp0XPmBwOnxGlLSdFhHd247WLSSUCSJQC4d3O
	ylEOErFz8S7enBEEiXnjN28tajihe5SuxSKjIQXzlKMS2PobeKpTKFcx9ZRTI7Dg
	40JlkHF48F28sI8idrRf18tkTHx/AOQSXI/hmdKY8PmtSGzXjbeXpU3Yj/xLJtjN
	Kx3o7Nmoq/9iV+6W9XnESQ3lqysJIhEdIQgYCwcPUpdDmu5DrSs+M12rYHmz40HA
	xH5eWSDaTvYuAAtJsDfq4TEPUhA6a4oKmIODJ/sEH0ApW4y6isS28XoIvgddUPtP
	YW5nlhsFWd7bcJdAuJpnw==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=sign d=arndb.de a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1793808947; d=arndb.de;
	mf=PGFybmRAYXJuZGIuZGU+;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm2:rsa-sha256:lsnlRswBSHqy0UuVzhBNg5CFWyDDvGz7Infsgnz+stg2TsQ
	FdskxQDJ3BrhB3UGRDxcsPU+ht0HqQCSrflJctkwj8KFCI9ZbKnKBohJZ1qfl0XB
	gcJFtQjcZk6jKnKjtz1d5aEfWxEgZcTG1SNJIerEHb4tRl50WhAF2YxOZzzGuS9y
	bXXIIqQp6c/K4/9As/QxArZnTbZG7LLxkZ0XgWUJnRZjIs4B2+0U+Vv9Qum+xT0U
	NkRcZHJ1iLN7Ytho8uhCE3eWx8wes5+WlOUvnt3DLv+FYrwbK+le2+sRJSHVURaJ
	XcI9gdjuvRYwXmuFGkQgaLQkGWGOPFic3gp+O1A==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:4kPFI1pl94svt6FcJI7GTH40I8NrmwpOCYY09r/CUgI=:XtofUmLNSAlOeC+jHYzUkvhsqx26tdVnYTmf0pcPtXo=;
X-ME-Sender: <xms:MFrrap-1uafiamLHhvCFmcoS4CUnt4Bur8aaBT7rExtfg328FFqatw>
    <xme:MFrraogCYm9ARQueCpMSAm5L6Q8RIRSsoE7aCr_GJnTAoGg5JUuggYEjpjpPl75SN
    LYX6z-dG5QOhFYZngw6ymDok9GRsMc-K5FnkkT9lGFjSzDMFOxLNQg>
X-ME-Proxy-Cause: dmFkZTF81vXp6AjtNjpU9fMobsGT/c5iTkulkiDk5XSLgAmxn4T8gi5LrjTCSom++OOSJp
    S2tulKct1nDA+/4XskQ6V0zYzSSj4jJO9hqiWWuJfTvGas4k/fHo47PZRKoymKbR3PQgML
    2dTuv/53dVjIAqnKBA5IkbPhcmZf/oSRTxjvhPJ2gpIxG2dOBOSW4TxQwj5cWS14Knfquj
    K9ScKr/Bg+CXlr64X+IJQ/qM79dWbgPcAoxxCoq6KU+EVOAJ3N4tLM0yQMk9/hNa07GdMy
    59Nhj+ZBwUTZEH10vlXr+FFQrKeV7DXhD+xT3yKq3v5vVzj0mvPVmURRtfEXBOPWMN0trS
    ZF//I2WkPtCi3Qulh/5asCXoNTc8gRzqwkvujCOTyY4xORAFUMw9P7mPEzXCMXnkqK0Z4q
    sMNGUvmi1qFFW2M8afJio7TiobOd5/m2b1aeUZvufIiruyVNPVhqsmgPSHrvO1HJIT46AZ
    w8d1RK6CVYTkmH6sLW6UjCZOeuVxd9/XJpxR9NzVNguu2q8fUuTFZdL9Hm05FpqLTIJ1Y7
    460Kp475z4B+lqotzzthqkfj1zOo5Hy1QzvhJd1iSPwX6GXApUFZB4jxMs7o/iQsxHpDgO
    pXQ/gfnLMc3iEdzdm4nXUOTfdJNfkpc0PCQBJotvn/hoCGUO6nVGhHbTDu0Q
X-ME-Proxy: <xmx:MlrrapJ6W8L3Jsa2QGHNLYu_3Q5gPZkIcv347ZF-LLTQXzh1U0ilIg>
    <xmx:MlrrarLTrGTisFewbQlMo6yPl5XT83csYL-j1jODSVOOa-UmGOLy3Q>
    <xmx:Mlrrash3oDteop0DiCdnKUwlJ5SKHiqdKA8rzfP3tjhWNB6HjrTwrw>
    <xmx:MlrratPAwi1z_dXfsxwU0dawiR3Btr_9Hts7mrM1VN24OcWAyUHYvQ>
    <xmx:M1rrao3geqTf4E020kt9bow0G8d85W2NCqAnl3n-W2SlxB3ti3ygPajU>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 5CB9832A0093; Wed,  4 Nov 2026 11:15:44 -0500 (EST)
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
X-ThreadId: AsZFqsyIu97-
Date: Wed, 04 Nov 2026 17:15:00 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Thorsten Blum" <blum@kernel.org>, "Mike Rapoport" <rppt@kernel.org>,
 "Pasha Tatashin" <pasha.tatashin@soleen.com>,
 "Pratyush Yadav" <pratyush@kernel.org>, "Alexander Graf" <graf@amazon.com>,
 "Andrew Morton" <akpm@linux-foundation.org>,
 "Changyuan Lyu" <changyuanl@google.com>
Cc: kexec@lists.infradead.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
Message-Id: <6c67f712-fcdf-4d80-b212-5847ba57283d@app.fastmail.com>
In-Reply-To: <20261104160931.137174-3-blum@kernel.org>
References: <20261104160931.137174-3-blum@kernel.org>
Subject: Re: [PATCH] kho: Remove redundant 0x prefixes
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, Nov 4, 2026, at 17:09, Thorsten Blum wrote:
> The %pa format specifier already includes the 0x prefix. Remove the
> redundant prefixes to avoid printing 0x0x.
>
> Fixes: c609c144b0e8 ("kexec: add KHO parsing support")
> Signed-off-by: Thorsten Blum <blum@kernel.org>

Hi Thorsten,

The change looks correct, but I see another problem in the same line:

>  		if (err) {
> -			pr_warn("failed to mark the bootmem region 0x%pa+0x%pa: %pe",
> +			pr_warn("failed to mark the bootmem region %pa+%pa: %pe",
>  				&area->addr, &size, ERR_PTR(err));

'size' is a 'u64', not a phys_addr_t, so the pr_warn will print the wrong
on some platforms. Can you change this to use 0x%llx instead, or change
the type of the temporary variable to phys_addr_t instead?

     Arnd
