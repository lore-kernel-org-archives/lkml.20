Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.149
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792448030;
	b=TB86lu6qmGtUr2OBWsd8Y7q6GAAWr4XimUkyc97Py/7C0EPjJMncKG8d1RQ6HIYRiLA+
	 B42i8vmAa68GqhmBfxf7Ny+LdbS7m2gWv4NiZ/9iBuzd/tJmfjMxc3VBvaVcL6Ai6uT9u
	 H73MaI/mVt4mlgP1/0bHhPGJCztXn0XYqkd9Sj5nq5Tq1sLtfsci1ZmRZs7UMnT4mS9hA
	 omyFf6ShfS0aQDTExD4W+3JGF7PhNZuhybqaFWdi1EV0z8HGe+BmB83nxwVziSkyWGsL9
	 x77DzdDPZRMCOUVJQjRNLkSvr+wlbxzhWM+uwRm4gSDuVijdj8qxBhtxZRmEuQlQJXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792448030;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:X-ThreadId:Date:From:To:Cc:Message-Id:In-Reply-To:
	 References:Subject:Content-Type:Content-Transfer-Encoding;
	bh=b19ke5R8dsS/XvA79kQkYa638+7V0D45xqSFirGki10=;
	b=z8R3/i068ikH4iUaCTZ4q1oJ21VZdByiU4QClm9pTdrE0uPM82xPSXMW0BzO5Oquu5Xf
	 d5TF+j+atWLy3NY56VteBCdDhKre+IYTEDnW6ExyD3inK9Q58vC5SifZCLkvLXow2w2H7
	 J6TGb2XMk9dB+F8/7ZzriGkWeYVd70xFkKLOHfnYZtOcvFPVSP7cAUM0Q39h0D2w/Ys8r
	 MxM+9FarrwtXH/NWKPU2UqeDune2rDvuaq4neaWBDr+clP4+sJuIt8zxtRfW9J71ZMyr+
	 vPHthCgbL00+/Vg6A3Ihqoj6AzCygTRyN/nqo/pV4DbSKdBeudrYGz372yCrpKsO3GQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arndb.de;
	spf=pass smtp.mailfrom=arndb.de;
	dkim=pass header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm1 header.b=YfSPKpsy;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=Q0s3ifmE;
	arc=none smtp.remote-ip=103.168.172.149
Received: from fout-a6-smtp.messagingengine.com (fout-a6-smtp.messagingengine.com [103.168.172.149])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D645606A319
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 22:13:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4D645606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm1 header.b=YfSPKpsy;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=Q0s3ifmE
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfout.phl.internal (Postfix) with ESMTP id 46EA6EC011A
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 18:13:49 -0400 (EDT)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Mon, 19 Oct 2026 18:13:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1792448023;
	 x=1792534423; bh=b19ke5R8dsS/XvA79kQkYa638+7V0D45xqSFirGki10=; b=
	YfSPKpsy28wG3TFLg+0euDTx35bpoCFlYmDe1f+qkBnAzEfRgCd3XIXkxcJbUxBC
	2cUGSEH2YVr+X5z8XhWS8EvfWJPX88VJYz+44BnkpsZLYfGMyPWvoEPa5D4XVmIl
	hFgkWNFdW4HzpkYLj3YrmE0JhpsOPUJw8DAgQN6StDwbPWt3Rgwkko83onEVchcB
	6VnXxoxrLxmebaDFwWbiKbX9OHEV4OV8Lw7dzf3OMs89kUB31JCIuW+RFc+l2xLQ
	FlPRd/WPF0SW1R7Qnn7LKZG/I2+W1nhIbG4lblGRU7T5o/7GZKB7e5m/HXhU0M1P
	5nCOkCR4XhGWfy5DI3zyNQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1792448023; x=
	1792534423; bh=b19ke5R8dsS/XvA79kQkYa638+7V0D45xqSFirGki10=; b=Q
	0s3ifmE/oHQaPCqKxOocoD1RsfWMsP7ugR1iP+6jABBpIIRFUL2Plvx/CVLue+iz
	sL3TAkJrlcP9uAuoHcE/DYKdzqQCIbEmq9+mrP7CETZXrgriY6VNY2tFEbbtVEW7
	dVh9thar0fQtD2rIz72CLitf6QxH3znNPM5Z+hH6epRrTcPUPGaAmgUeQsTwgAfA
	VOpOBOJzh5qFXb82IT1BEEvSNS0LuMjzCu1Ge+QNabLdR7cWZggYeQ8C/w+Qw/Mw
	9lBaigTeDeyRTSjf0lB5iuRaKLTa/1KTuFgdgXfG+nEQsCff1Q9lWI9FdouX/0Fn
	avrA0W8rcDshRUD/PXM0A==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-08; sw=lmtpprox;
	action=sign d=arndb.de a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1792448023; d=arndb.de;
	mf=PGFybmRAYXJuZGIuZGU+;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm1:rsa-sha256:R9A6wa8XrZLRpnTOee1FPdBPfKJ0qzde1k05bIxRm/PyOLP
	AQztYBYQeM1IcHXFX/jmHklwCP1AM97cCTNcrD8Kuv+yAX+JuMtFRMSRUD8g4gk6
	IvDwm2jPfOh/iGiZufSsOT/fRiOjIaCT/mgZa+TEgsBgVBEV7Z/V1v4qGE8rT9fb
	TWbqUNZ9TY160dzKOiUgvq/UW6mi67cKYgiDjQG4xNrdUXjDVZvmefaPAbm/jZWh
	igLo8yPTH6iEj20o7X5sK2VgCGOoAE+a1UxcIgP8MOQk8oStzzaNqh0XtODVU2dN
	cyXOSceu1OUV0BO2/67WqVwIXiT4wqfr23xtJ9w==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-08; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:PMbO2eFK/HngZyDJy5oViV6VfKYFsxy7XE6yeZaEFog=:xrd6C177KUzqVuW8T74lgPOXnZyd81HS2CteGq44Y2w=;
X-ME-Sender: <xms:EpbWavz21F8CPXkV9s1zVBW5cctnPSTHwVquOeXHgQYx2HPc9xU-Ow>
    <xme:EpbWaiFlcjdTdTUORFb6JweVGllk4uKi1JmxD7qiQ7gzgBDP9mkXQJMTOPaorXpbb
    TrokS-B5G1dlIe3HY2SXT3eaiFMJP02rssP6JSMy7h83rcQMzNHclo>
X-ME-Proxy-Cause: dmFkZTFqEN6muZMP935NXiz6bee41DbPaDd3QKT7ALIBuCjhUqNg6fjgGeljhBZXjYGp8J
    J3MqyqGWNLoJaIvhncl8GHxQDbt7zaEwqLtI1LllcSEZ/6WS9gLFbrveIe+jvsEeH4oOxG
    eSzuZDyopzds7gyUF3K7ozIa/9o4Yb6M7SouyW/tR5X39yUj+kSFZEvBhT/hZWAmTvhA8J
    bp7pUhzNma+oDlvkSAUSxoC14+8TtrpvwpcaYTDNZ0CbxZGtjKQFwmhtp7vRELtKGLYdlh
    +fq0Wh2JzLhiVuR6BtAh/SrSPS//ZopfKmXaV+Pa5sfOf8KILTU4E2sH+MQTi+6zRf9UX6
    fmxZfNCMdDhe7xPGhjH/TdHnWg1xdqXFYOMbxAQPhc213Wpfb934S/po9g7FL0qCUUM9Zj
    VVJ31SxqMY9cVAFqBJ12CEL6RFvOjAqsrOuuVAvVm4fwVWcJeopiJQ/z4XxTiJSG9Er9Dz
    Tc9Mcxartx9TD2qs4Hbro/EK9AaSqKKOoKObOLPsbizjQjt10M4aRhQ59gaO13LSUNiJQG
    MfrUwvSlb7n8DYHb7BuvOiIXl15ugTDiEjfbfc+RX83RyuZbjI0OHodm73zMAQH6bnscJ5
    D5fEfFtAZMkwywpvwDeo7mYGryOY/Jg4jvQqJLympfdZd4ObYkhzZ9kYGNkg
X-ME-Proxy: <xmx:FJbWap5k8bN2SMBFs8IdvVOmrBhxJwVOkCHk8r38rkqGehsJY6SSbg>
    <xmx:FJbWan1JDoBolQinX_DgW37FZjMPS6eTarhhjuM34GOs9pccLEL2xw>
    <xmx:FJbWagyeBGA1OoGG-Oec87-zJpvl3W04nbVrvQ0pBqF2H2mU4p489w>
    <xmx:FJbWagndh9BgCbQ0J_iDF8Z_11WZj1UJw0sns5uRTX6BX6-0FyRRhw>
    <xmx:F5bWaptmWhiXVi-ZrWLqf8jmrWtrODkpFDkK9Y1HlXrb1hii7Pw1E5dx>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 0ECF532A008F; Mon, 19 Oct 2026 18:13:38 -0400 (EDT)
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
X-ThreadId: ATLhSvAouVZo
Date: Tue, 20 Oct 2026 00:12:57 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Ian Rogers" <irogers@google.com>, "Thomas Gleixner" <tglx@kernel.org>,
 "Andy Lutomirski" <luto@kernel.org>,
 "Vincenzo Frascino" <vincenzo.frascino@arm.com>,
 "Stefan Kerkmann" <s.kerkmann@pengutronix.de>,
 "Marc Kleine-Budde" <mkl@pengutronix.de>,
 "Christophe Leroy" <chleroy@kernel.org>
Cc: "David Laight" <david.laight.linux@gmail.com>,
 "Arnaldo Carvalho de Melo" <acme@kernel.org>,
 "Namhyung Kim" <namhyung@kernel.org>, "Eric Biggers" <ebiggers@google.com>,
 "Alexander Viro" <viro@zeniv.linux.org.uk>,
 "Jason A . Donenfeld" <Jason@zx2c4.com>,
 linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org,
 linux-kernel@vger.kernel.org
Message-Id: <31fe09f6-0a14-40fc-8ad8-c03998fb1f5c@app.fastmail.com>
In-Reply-To: <20261019201257.3805356-1-irogers@google.com>
References: <20261019201257.3805356-1-irogers@google.com>
Subject: Re: [PATCH v1 1/2] vdso: Add VDSO_UNALIGNED_PACKED config option for ARMv5
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, Oct 19, 2026, at 22:12, Ian Rogers wrote:
> +
> +config VDSO_UNALIGNED_PACKED
> +	bool
> +	default CPU_32v5
> +	help
> +	  Use packed structs rather than memcpy() in include/vdso/unaligned.h
> +	  for unaligned memory accesses. Enabled on ARMv5 where GCC may emit
> +	  out-of-line memcpy() calls instead of inlining byte accesses.

As explained, I think this misrepresents the problem as Arm specific and
isn't the correct method for -munaligned-access targets on Arm, which
include CPU_32v3, CPU_32v4 and CPU_32v4T along with CPU_32v5.

I still hope we can use a version that just produces the intended code
on both -munaligned-access and -mno-unaligned-access targets like the
old version did.

     Arnd
