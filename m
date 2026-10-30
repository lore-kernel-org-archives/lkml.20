Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.147
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793379095;
	b=OO21gZxcAyRzAFrtlhodNfAmTtwjCkPaHOYyk9zwtn2fkVHsyTJTqfCIIrFiwd/x2hM4
	 9TvaiO7i5kjTq7cAsUfRj1LdfNCVJ4UbXPujGG5d10C74WN1vLgknbaT6wLhMJPfwKUX/
	 ewGTHKIEBAGC0W6YXfSppdsjtq9SYNkCZwfDH8QAv86q/6CTtuTG1/+EXPeNB5I+9B9Ab
	 WvbEFg3HAK+YNa6FYO4R2bC0EWwpPJXVZTcVx7brBDLt1DAIZ514A7u1tCEJ9F3ByXq45
	 YaGzzkQ+1VYq75QFlbwwTHyBRqT31ogYkhP4qGqOtOqOAiRQ9oNdLZANfThBOADErcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793379095;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:X-ThreadId:Date:From:To:Cc:Message-Id:In-Reply-To:
	 References:Subject:Content-Type:Content-Transfer-Encoding;
	bh=vuzzl1eLEj1tjUym763CORloz9Ci0zL+usjWHpgYO14=;
	b=cLTxvcRSGiRlyLxwui2lMSZpu3sT/Gti6GB6dZRNpNyIlf1luiXfnW/E7IM9ZRTWnEYS
	 gBbFfWXr0/8DHwRqlTX7ae7ExdZlO1EJs4+m+Y0y8g4GlP4zWtIJhkOegp0asCbgE7DGH
	 OF5Iq0J7XvJiQT+wn+Ug3zY4oEMExmTI/CKlyD34azku5KVsg3QSmoCD4DTbvkDOOxFSY
	 XKzkfXotq7jLiGVOVbTkLrhGg3E/NoBrkHwTBJszGZJ4NgF33cyWxFOPZI/p7d37cD9Gl
	 E2uDWLZ5KUiQkLOguDii9X2UOeMDXj8QhixGoAtgvratymDC6T6gSPbKOrpklCT68gA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arndb.de;
	spf=pass smtp.mailfrom=arndb.de;
	dkim=pass header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=MIhgz5Y8;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=cDaeGwAE;
	arc=none smtp.remote-ip=103.168.172.147
Received: from fout-a4-smtp.messagingengine.com (fout-a4-smtp.messagingengine.com [103.168.172.147])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8FB5606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 16:51:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8FB5606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=MIhgz5Y8;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=cDaeGwAE
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfout.phl.internal (Postfix) with ESMTP id AD984EC0584
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 12:51:33 -0400 (EDT)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Fri, 30 Oct 2026 12:51:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1793379091;
	 x=1793465491; bh=vuzzl1eLEj1tjUym763CORloz9Ci0zL+usjWHpgYO14=; b=
	MIhgz5Y89WQ93aQDSiWWUU5OvCQUAW5pcO6H19emOjkSmk+xV72EJTrocxivEEhy
	ycGxUVnTraY3DDci4fUvfd410KcBQ/7iQnc+410kMaP4NUK5GrnNchi5m9vBbfVS
	GeOajwP+s5jn3ykMkRYOFIHIquR4jhXrHPRuvYnV+oEursGajz/0NGBnsO7Mwh6g
	nn3PbUTUQF9uZOgNK/0nTbA2lhfv+//t8rjJ6+PbGg1tTOP14NP3Ep5TtKwpZ1uL
	t02EZ8IYs/Hnnl5lggbuMGBVRotvZkTxk/ZkxQK2nZWQLcwUr2EBtWOcvv7rATtO
	8ym7ou5QZAjqJhdP8Zkp4A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1793379091; x=
	1793465491; bh=vuzzl1eLEj1tjUym763CORloz9Ci0zL+usjWHpgYO14=; b=c
	DaeGwAEFtNGC3aoGZ7abh9DjaDVUfdWrfbhBBNaxQgsaPWZMoRKRpRDCpRfgXC3d
	ZSuz0RXfWyWFe0G167r+TX0VJ4JYhdyg/KkzZ2BP1PTn/6NV/2MY0EyYpCveUqth
	wo1rq8HyRpo9B8q2YWR9iM/DsKU4PfllFtXTc6hJQK8ktozl2Lo9BGQfYgWMJzrP
	IDYLXW8WnzE2oGddg1MmIfHtvKdM9LBbq0qBhLwTNgsvU5dVDrcEYLmeG9heOkhc
	vkVsWWe1Vz2UzSmaZeKgaEwAfDcO/bavDv6ly40SS5nrecfVfNlr9VFyK3nRQgLh
	tEAiHmTTOtj2o81Id//3w==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=sign d=arndb.de a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1793379091; d=arndb.de;
	mf=PGFybmRAYXJuZGIuZGU+;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm2:rsa-sha256:mQTLCaHrjZTwYocOlJ0e4ps5nN1JJHFItBGoFNLiF7a7wHB
	fsfqyWWrYMDNPjEMWOasYJkkcfJa+USXvfdg9C8suFhq3bgfLO0K9I2GHDmcEIJe
	7RvAuE4Zk9GwTt8Z6IhugCywTLnkQecRgsb7LMo8/RU6wWIShB58BcUyP603xFeN
	7ZpX+uQoCxRDakiDKo2cajWkCRiXXFJJyat7LZnCgbMihNhLqPUKomrfCFs0J4XK
	nPth8hEsEvOjyLWrbjNqIbzboz6RpnIc0Gm6mfDjPqJan0D6MZhM/oVRXNMB31XO
	Xe5UXEmvEhADWx2uqMkDcChjflhATjH/seZt6sA==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:L7VjYfoeKPGiOwVXZoqIcRH8bJvd7fOPsz5j8PnO7Og=:uehiCRY9gAxKIiiONLGFkoyXRS2S/Bd6XbXaKGDpAcs=;
X-ME-Sender: <xms:EMvkaoJLB0xFP-VThZAsgNaDbamHSBEvoJkbRboji5v_xThn5P4vDw>
    <xme:EMvkai_GWCBidJsrl2y8aSBTsQ4L1rT8dc_tEXSjQFAYBR13IlliyQCD4-DXg3ppl
    X3HNVSSt47xth6dO8YIEK2nesf4Y16k7oMvyPpnbjkU0Gr1Rdaw7b0>
X-ME-Proxy-Cause: dmFkZTGQCZzltlnZznGv4odyus1RFHavyyrNcKKZeWm7N86DXsbaCILJDt3p/BcQcHkZTI
    Y5+miO+TECYalO+SwPyeUqTn2UEhloWnCIFA2gRayeO9eAMvAp5DtfzhFWO9HsI6j3N0D6
    1quox2DGPVVvqjqT9PbzQbdHrvp55tzRx2zOKut/2Fikp9rwXWYdiNJqLtaLl1jcQHx0US
    FSoid4V27q7YWRaWSbGBNp3o1Q2vyjzwI3Z6eb8+o4Hs/QFH+FmHxiqgMBcocOy4IF6SE1
    NiHfPIbBxVyJtw/vEg8HRCiLXLL7VLVRyvAPMjw8QGtsOyfdPUZENlF+sNMs/4JdG20FtM
    fKGuLL9Ewh5yFRRK7OfB+DO8c51QWBwkayera7Xq0L8o0YmDpA2zNyUp+kL7PC2mRA5b8Q
    sGXEWu/9PYtkm1twSFDYbPaa7i05L1n7g+PyCa/5p2zsEVC9Aj1D2SoF2T0FfHfKev0Y3X
    wfYDn8ZfdNClbUzo7hi8yUZIxZXpfdf6iDqiJXhUQQSBuwB344ciEptYR1gmQzQ72q33+K
    DPvvwZNnvYg5pDf3Kvpws2Ao/6uukUmmPggDqNFv0JK9RNqQNaKAUBbpY/h+iS3hhE8IMJ
    uyQoRXrhZ280gh5LlE/25hu2yOoJOft3aLlEIzA/z93rUWJcDwDiJsEk+PZg
X-ME-Proxy: <xmx:EcvkaqMZeCiPpKYkLqQk05r-CN3_ANK3vEZDKEx3dqDoBPrh7Kf2gg>
    <xmx:EcvkaqeGEKSv7MeovaE6mcunnqK9aLtDH49jXDEm6igI8tZxp2mN3A>
    <xmx:EcvkahUcDd1hUDiswJugNN3oWsITVXjD0NFvqonx1K116RQBU6fPnQ>
    <xmx:EcvkaqgsKAO6omU8pBYkdkxJEIGsfU4-cB01uO1uTtheOP8aSs2b1Q>
    <xmx:E8vkahv4D3iXshfrhY8RaM_vSW_sRcs0-ct7MD2Hp8EPWMzBTn_rHB_s>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 4C32432A0097; Fri, 30 Oct 2026 12:51:28 -0400 (EDT)
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
X-ThreadId: ABTlmHOvxHY3
Date: Fri, 30 Oct 2026 17:50:58 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "schuster.simon@siemens-energy.com" <schuster.simon@siemens-energy.com>,
 "Dinh Nguyen" <dinguyen@kernel.org>,
 "Andrew Morton" <akpm@linux-foundation.org>
Cc: "Sasha Levin" <sashal@kernel.org>, linux-kernel@vger.kernel.org
Message-Id: <802dd722-fab6-496c-a457-c1533ff96132@app.fastmail.com>
In-Reply-To: 
 <20261030-nios2-remove-usage-of-libgcc-v1-0-4e341c66082e@siemens-energy.com>
References: 
 <20261030-nios2-remove-usage-of-libgcc-v1-0-4e341c66082e@siemens-energy.com>
Subject: Re: [PATCH 0/3] lib: Add software mul/div helpers and use them from nios2
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, Oct 30, 2026, at 16:53, Simon Schuster wrote:
> Recently, there have been linking failures on nios2 regarding libgcc
> symbols that we reexport to modules (in particular __mulsi3 [0], and
> __divsi3_table [1]).
>
> In the resulting discussion, Arnd suggested [2] dropping the libgcc
> dependency altogether, as -- while specific functions might be fine --
> libgcc does not expect to run in a kernel-like freestanding environment.
>
> To this end, Dinh Nguyen was kind enough to locate and extract
> GPLv2-compliant versions of the software mul/div/mod and __gcc_bcmp
> functions required by nios2 gcc and integrate them into the kernel.
>
> As Arnd also suggested [3] that these might be helpful to other smaller
> architectures (such as arc or openrisc), I've further extracted them to
> lib/ with corresponding CONFIG_GENERIC_LIB_* options that allow
> selectively enabling and exporting these as required.
>
> The patch series compiles mostly^4 fine in a nios2 allyesconfig
> without modpost errors; a quick boot test on a regular build also
> completed successfully.

This looks very good to me overall, thanks for working on this.

Just a few minor things that stood out:

- I don't see a need to add the files under arch/ first and then
  move them to lib/, just start with the added files there

- I did not expect gccbcmp.c to be needed at all, the kernel
  should handle the string functions internally. If you do need it,
  there is of course no harm adding it, but probably need to
  build with -ffreestanding to prevent it from recursively
  ending up in bcmp()

> One aspect I'm not fully sure of is whether adding declarations for the
> new lib/ functions to include/linux/libgcc.h unconditionally in the last
> patch of this series is completely clean; but it matches how other
> "optional vendored" functions in libgcc.h seem to be handled.

That part is looks fine.

      Arnd
