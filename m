Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.152
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792569666;
	b=DiPvJwZnVPkPArAW/qrk7sRFM0x/yZIuhFnZrKSAjDN2ttsk2JxErDE3vafoUbKS1Z+7
	 vWsCr8bcAyHpLfzyU4BsP3dwf5BLbLSoUfWhpFBSjyJnO3aPgUQPQ+skz65pNpWg1FpKg
	 TshSE4ki7JafBQpOxqdrK8G+C6VOkeCBsKaAO6AcNMjGc6KtyKXj6USSKg7jMFHE+4SSk
	 Bn7uTswr61bc4RhAvIhl/OHYmcTX9K9UmP3tkVVtfmjB2Eyx//TIF7apDe1y1NaYfMu+H
	 iFM3jXclgmtykwS0FkIUBvIEYCl0gKe8fHeYDrpRGuOlH7cvU0B1339F18o73nvYIXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792569666;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:X-ThreadId:Date:From:To:Cc:Message-Id:In-Reply-To:
	 References:Subject:Content-Type:Content-Transfer-Encoding;
	bh=mXtnHWeFI2nqcr68YIxLUB5RqIz1avVYUcmeyXomMCQ=;
	b=MePP6q61A02epvF+hhMT/+LuZ/g9Gp3z3uMXtFDi5fB0j2wDV/0s8Vug0OcwVBao1n3A
	 06ibOHHpQC1c0vDhbZDnTg/fm++zo1oRykfDuIZcw8p7sxOGiB45Us50I3dOnwrIHs+JJ
	 I8ibgVNQSqcLknsa83CrGN5/Lru1VGF3Z3rkPmTG+VxscgwbAyyWNdv7ulYK6kigmVgYH
	 4iODg7F441I9fC1KUic7oyGB15nnb8sLSJHKizegJ1q4PRA7CFVEWhkMxGxhN1EOprf/7
	 1JP9AlCO+kw0nuOkAaGFP+Ma+LYzH4mHn+xb71iVOb0FxUR0rfFkFw2w+id/uXmYpTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arndb.de;
	spf=pass smtp.mailfrom=arndb.de;
	dkim=pass header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm1 header.b=lSK8qZme;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b="QQEwR/fm";
	arc=none smtp.remote-ip=202.12.124.152
Received: from fhigh-b1-smtp.messagingengine.com (fhigh-b1-smtp.messagingengine.com [202.12.124.152])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B636F606A320
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 08:01:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B636F606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm1 header.b=lSK8qZme;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=QQEwR/fm
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfhigh.stl.internal (Postfix) with ESMTP id E12DA7A0122
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 04:01:04 -0400 (EDT)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Wed, 21 Oct 2026 04:01:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1792569659;
	 x=1792656059; bh=mXtnHWeFI2nqcr68YIxLUB5RqIz1avVYUcmeyXomMCQ=; b=
	lSK8qZmeBGpJGPlc/XeW+VPW6pu64qPRIK0PoBrX8JZFFmsk2DYNg04PBvbNC6Uc
	6xv73olf2dUNMfFqTWjQhBfMOFUdD3kNmDHyTXNDjPZJHwUQr7Wv+xVaUnTpEelZ
	xClUVXYK1IHOFQOnfSK9p3wqMgGr9NdHP7f2D52uiJj2HamWj8vpiTO1sgWJakoY
	jovRd+KodG8ncZXeLWcCepjlIwH03Ygu7+ehTbwGw3flwJJ1d3xaffLxCMr9FmhL
	ogusmr4qSjkmOgc5DfAuGCi2O3owImhzMDV/5kaJbsbEbjglsoQU+L9oBvArzCzB
	kmxCK+cqJ2Euf5ZhM67PzQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1792569659; x=
	1792656059; bh=mXtnHWeFI2nqcr68YIxLUB5RqIz1avVYUcmeyXomMCQ=; b=Q
	QEwR/fmOCn8fh1Ua3QAY4qIjpOmGoeBjh+91z6R/KHlSu5/ofzbVwt9mVOvvg0ir
	T+0NGVuso3o0OeXoZPBi5HTCz3TdeCLbWrdN1wCGMc56/343akZ8QFECRWtELyxD
	E5V2RAN5Vj7+kOR3Na8d0agV5T7RNljjVunQPlWKGoeboTFYwv9rPdFXU7NcyZKP
	k3tyr59Y47vECvg3sjanUZaWWGXcpw3ZPS81SnSMLIEA64zVt5i0DV0VX1kReDFn
	T5SCpG0UIFv0fcTSnv/AaLCS+M275DIqu5Vdn9YSuQc/R0J8IadsTZ5Sh8P/S4Rf
	MtDIjXbjrFFNy8hHulL6A==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=sign d=arndb.de a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1792569659; d=arndb.de;
	mf=PGFybmRAYXJuZGIuZGU+;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm1:rsa-sha256:pEg8juFjSErG2xYRo/aHwHrGJ1muhUcIQ4ZLT8r7cUJtfC4
	8uWmbXLqXe5LNlbYFmcVpEmaFrzEfOVbT5ZPp50+Hz9IDpMn+9maTQ9GlLstCnz2
	IQfHr4mZtF2qwmXmUdP1yLXrp6DDg9XL1+BE/XstVlQd8qyoYKlfthbxnXOdexs8
	3B/v1GUdT3MlIWNS6//elPnw71Vp+8iIIBLRLyuE4N4gKHFwXQRYGBB5GAxd0CX0
	VgAS3MnL3qRWb80YUzwTcn3c3LgP3c/KHUhwVyQwBHriWE0fp1Ukti0SPu/wlSMv
	7PW/v+ivB+cHxdqrVgDGQRGzflUavhKiNs1RrHw==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:XGsxpd5fhTCnTHS7xvQuUkgcvlVtB2AQBojdHqr+x44=:40eixq9bulumP2agI6JxJ7zqu4SL7LZ/k0PEmggBmFU=;
X-ME-Sender: <xms:N3HYan4WTSXyObvna9JaAHjScIPRCkoRefjo1q5nSg3NvA-CTeaoyg>
    <xme:N3HYanubvv9AbR8SGUTvIN3LCD5HhhCbyVufr78c0HuzcSc_kpKMqEl83Op3viFOV
    dmm5HXZFuGyNSgQLBX_g5JjUdOtEvPkjTTpppb-N1ZX3ufpVHQ5I5ul>
X-ME-Proxy-Cause: dmFkZTFC00xTKtma736U9LyfKuKd+yzspG73qeHgeNKB3WqhkqdCw4/dYTA8tS32LfeL8Z
    RYOLJ94laBQObAtel9Ek8qHRkUBu699m2FShfOxTJxhjcF3cPTvVN4Lix/PxiNzc5WcdEX
    XSzi5mMMl6ljR08luWb0ffbaOp20XDH9B/Oph58h/CFZkP9IvUB9SdpW6GM+W0sZrnwEAP
    wDkAHZ41X9YR9c8ry2q71q12Kb5y/P/K147K2Ln0US/kx0x8Vluatc6I/NlqVtgQm2qKWx
    juW8Wor+XgK+IzSf21Zr++V9I62Zwo8JpkvuaGRCwHZSeSudE1d8RIeINnlyAY3jVCTPQ0
    zhTyYC1PMcraSrLA6Hz54Qldt3uUe8AL6NytoV9a3o78JjFl57usZ1qi1HR5s3Rilk8Es/
    eMWzeCFu2CF6tKXqDob3iFtP5DvHXrLarHbLaOrfAudJdRHJ1RObliA9i5PMrlnYNYUEWF
    h02eATlMrdCMBnWD8i78P5wrZz8iXQVRI50YI2e9PNJtncjpVvhues23BtKfYAgkkb2+IO
    p2ga5xF0BrBVMkMGhnQrRkLGAziovgYI8Mmv376zOVe6r4J4zc8AfaCKnqcqbnZqKserzO
    dKJ8/TDvVBMK6hjUypGgwjdUepy+qMnrtlJO+hjz3cUZlLpQ2Vtw9RRfkZ9w
X-ME-Proxy: <xmx:OHHYajbo8OIiDc8SYbs2CdKpa_ZP2A7Ce6UwOE46xtDcu1wQyF4Znw>
    <xmx:OHHYaldkcCdiJ9_0DgK7u83_MhnlHynSc9wTZoQddM3daJK3Ziia3A>
    <xmx:OHHYagm7UhOfpOE4N3N9yQdk0_L1Rsk5by9O_dVGfI2j6hYCCSdOmQ>
    <xmx:OHHYal0wkqGS9GU_CK-d7VT5bFYInQNderAm57OheWg0EWQ7GpxJ8A>
    <xmx:O3HYahkbKRGPf90DmVaxhqgl2Ubw-YH1B0_K4aDs0KvBMKY_rLWIM0wo>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 203C432A0097; Wed, 21 Oct 2026 04:00:55 -0400 (EDT)
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
X-ThreadId: AsT4sEkvhRpB
Date: Wed, 21 Oct 2026 10:00:34 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Maciej W. Rozycki" <macro@orcam.me.uk>, "Arnd Bergmann" <arnd@kernel.org>
Cc: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 "Jiri Slaby" <jirislaby@kernel.org>,
 "Andy Shevchenko" <andriy.shevchenko@linux.intel.com>,
 "Hugo Villeneuve" <hvilleneuve@dimonoff.com>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org
Message-Id: <215c694e-bb97-4c21-ae5b-308c03e21611@app.fastmail.com>
In-Reply-To: <alpine.DEB.2.21.2610210500560.22065@angie.orcam.me.uk>
References: <20261019090017.430425-1-arnd@kernel.org>
 <alpine.DEB.2.21.2610210422160.22065@angie.orcam.me.uk>
 <alpine.DEB.2.21.2610210500560.22065@angie.orcam.me.uk>
Subject: Re: [PATCH] [v3] serial: 8250: remove obsolete and broken PORT_RSA support
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, Oct 21, 2026, at 06:07, Maciej W. Rozycki wrote:
> On Wed, 21 Oct 2026, Maciej W. Rozycki wrote:
>
>> so the only peculiarity is that the 8-byte region requested is actually 
>> below `port->iobase', presumably relative to standard ISA serial port port 
>> I/O locations of 0x3f8, 0x2f8, 0x3e8, 0x2e8, possibly not to clash with 
>> conventional ISA serial port devices where also present in a system (for 
>
>  Or, to self-correct after a few more mind cycles spent on this piece, the 
> region below `port->iobase' is an expansion of one above, where standard 
> 8250 registers of the onboard serial port reside.  Which makes even more 
> sense, to me anyway.

Good catch, so it should still work the same way it was originally
designed, though I think it still requires a modified setserial to
set PORT_RSA, or a boot time argument for autoconfiguration with
UART_CONFIG_TYPE.

I've updated the changelog text accordingly for v4.

    Arnd
