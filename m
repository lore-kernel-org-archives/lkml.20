Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.145
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793897605;
	b=HTQNNJQG9Egklt0Tog2mh4IkLewdSdgrTOBJZkEl3Gn4neJdDpclOFqSPqf+e6y/LxnS
	 dNhyevYHGPa+npnTkIAQdtEdDt7JRLYhEk+F+QUFTSBWL6oqTMPbsRuacOf5pTgpMgSNg
	 r79p0bYSmzwpHX2DqYFKIdrpzV3/IdOWMYO5sbL3asrqVf3MgjzOG3jG1O045ocZM5f/w
	 mTH3V+JhgTg9407wpqtYzdHChwQiqUwqV2OqLfaLI90pgbbajDjRMCq/MV7AK/mWQvNA9
	 AUOl1bvOt3LnSKA0gM6q7Hn/+h5F6d1N9WAdJbKQ7qJ1SxPUPzeKJwMDhLcnKw/4ZDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793897605;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:X-ThreadId:Date:From:To:Cc:Message-Id:In-Reply-To:
	 References:Subject:Content-Type:Content-Transfer-Encoding;
	bh=graBa4LhPanpEh1LgOl7Th4Ih+OuVP3fXB2vBQV9/ik=;
	b=LO0+QLfYOc6Z6YgJu1fe1eBSR0gTN4oF4tzwvBu7qVn+3swC/hs58S3ufcY1OHV9m0M4
	 6T0lLvMgykLGQViA92ynSI+RdnJ+ZbSyrmP7Iv+o44+oKH5nl6sdrGliLUyynPsm8VHgp
	 PXsENjRKWuSYxT89Ide10qnBdyngZ1CUV7n8/6dOads1E2afL71ziMTcEGpT6M6I3Z2Cn
	 szaWW53EisBG6M99KzrCOQAHbCaX0zcklJ+ickHjJ0TihgLsTabOZcetxc1Jt3SHY86Qr
	 djDbTPuhjL4IKHzq0ZdUR5B4s8TYDGAOGey1oIV3a2cjxuGll1UX7EJV2jmCxaoKarg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arndb.de;
	spf=pass smtp.mailfrom=arndb.de;
	dkim=pass header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=DauxpK5d;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=YfOfsHLg;
	arc=none smtp.remote-ip=202.12.124.145
Received: from fout-b2-smtp.messagingengine.com (fout-b2-smtp.messagingengine.com [202.12.124.145])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 381D6606A336
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 16:53:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 381D6606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=DauxpK5d;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=YfOfsHLg
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfout.stl.internal (Postfix) with ESMTP id E57FF1D00171
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 11:53:22 -0500 (EST)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Thu, 05 Nov 2026 11:53:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1793897600;
	 x=1793984000; bh=graBa4LhPanpEh1LgOl7Th4Ih+OuVP3fXB2vBQV9/ik=; b=
	DauxpK5d7+qrNCkW9HkZtfmajgQpSCMbhK+v8Z/byUPqAz13snsg2naossus85fI
	E7lF42nAwXvNKpAW1obdUqYgH4LW3wUREgTRiK/d4+F6s6nmphZ83IzRWYNUnWtv
	Te0HVi/N/yeOQ3FLu+hTXyEiJ7dkZTyIVCHuh7+og2P7YcIrTy1H1k/UCTnVixDR
	L6dj8V/bYQw2Vfd6Vm55LnisbH0yYXE+fqYAMEhqOzowuRJuFr6PX37a0NejqRfc
	kbfhpobHKd+4SMFUggjGD9Hu0ZNe/qGWC6nhj/qXGbhIQaOLS8tWB4ZDJd3lV5jy
	kuPxOTdMt+GowgxqnF8ppg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1793897600; x=
	1793984000; bh=graBa4LhPanpEh1LgOl7Th4Ih+OuVP3fXB2vBQV9/ik=; b=Y
	fOfsHLgkKoPiXaPo+jM251bsiwr7DksIal6DBg2Wh8MGZNnuVb1x9MT3B8OA5uQy
	ejp+gFJ/gsqz5BG6h3Os8GCGyT/ljC66NnFnnma4W60SYoE1ud12NzjVxMUioMWg
	YNXO3syNbD5aEdhdwfHcbxwVL2jCo9/i2VQShkB5H9Dcy3Kre5/mTdp5lg98i5sW
	tzOiyyDmOszKTBWnwsF3Z4H/0ix8cqibwzfSxaQJo0YlFRZCRJDa/j1VZZzt41hT
	Q28uyT28Ogg2fyyuCeoTRRxTe+yPfmpDfmIBHJPuvpVoqJYmibkVa+opdzwsMe0N
	Tu013XPHMi0SJdE3aL2eg==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=arndb.de a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1793897600; d=arndb.de;
	mf=PGFybmRAYXJuZGIuZGU+;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm2:rsa-sha256:BfHFvskXoBDSlS1Fw2ClmNMgVpQ0OmaaD/k92lr9kJxzZc8
	0yd6VqODGocvqGp/JeJgFB8LKzagFqLx7CAj57sy8WODfYKRy1DY9fnh55HMJVjj
	7MUgJumQUishUklDqTmBPk0VQG6pGw/OemBrRmIPTWQZfG/AqqPaq/Dc35Q7YzP7
	ex+Xpd0JW3e9qAw5qXsO9kQOQ6EGSRjyUnKg9+Le3CZ0imdx0V+DXUni9JT/CCVv
	16/m/ZylXs1IME37URsmQU8nRwAl9HyYu3qUygSLU4KRP5j/Uha/EoqNc9f9JP/d
	GuWV5640ipvejrEMZte6vVjY+/pN/+Q2B53TPUg==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:PWrfgJWWJTitPfwvL1eSIM5GHj2a1jIaw4pCEtalv+0=:TcZ/SVaWe8SjU/4mY84enYrqD+aUD+B1DYU0+LMAi6A=;
X-ME-Sender: <xms:frTsasBNXkRxcjoNzIBmW2F-_W8Vc8HcXQyEE-KTMRNj7sFg1BTELw>
    <xme:frTsapVukN4lFc_aLDdrKK2g1w7w6w0OuZb6_yxgDvjFIs1Ad8cWRb6lReBpMGI65
    vUwS0AIzPugqEzXS_YlqekD6SdRY_uhny8zjVneDa0vlbT0VtDuhA5V>
X-ME-Proxy-Cause: dmFkZTEa9YGCtec5EL8aoLclwKPats5cyq2bLbwfMCRCq5iHi7+BrRzwfeCIbYfk5EPxim
    dQYRhgpEL3W0QplEPv5/aIjRop82VmkVuDFQ8A7/YwJCOdpnbEasieftzoLFkN07AIIjJo
    NyHlk6dyApG/657U5wvi9PI+RAtUTLD/eE1tp74Anw+JkEUm0rPnLimDe7EI6Qb6l+Anw5
    ayKrcZVPPGju/wPA8w+L+MSG9S50KHoVNBIO6Lh5gU93NqqmojisX4ZoDurPXpeRA+pend
    s3dWHHemznbMOA4rv++AmtNoyan+1w5Cx+A9JQyRczt3nIur7xAmBDtPpUiczF/ngPe8bz
    nmpBkbGc0pacBtZN116HHlU79JUkcbF/Gt4Jb8JwwGC1iyEJVlFxb4k9ZnmELIGoc9O3fa
    itP7UyDuebGufQQ7LznF2zW35TwkTTJoJeJ70nFOW2X/5v1DJgR0DHELwij0hdbGQHEsbl
    NFJzpJwqdB0EJBly/yt8FnEsn3yY9fHeE4hHy80xIQGzkT7LuGPp1aTOX07IviusQpOEug
    PnZ2GvMALysod3DBa7l1iNjZU62C01vK9yMS6QiH5czLqGEmLOP9VLrgXcdL2P3BcklV4T
    3SZIVG6+Hw9+t0u1qZPhUJKMVq41cSGbOij6Rvuh/bpa13ot8bCjvt2YBvVw
X-ME-Proxy: <xmx:f7Tsahe9zUw2EXwCnzXKgrUXDGDa3HPLV76pSZlINhggjrSeevHfFQ>
    <xmx:f7Tsam-were0EpHDin9EmCUYbFA4rEDNcuPgJdCoOLzShnD7Mj5MWQ>
    <xmx:f7TsatlUdqw4Vp6ZBmoPIWp0T4fQuhA-j-vixcUpk_bXrIJyx_zpgg>
    <xmx:f7Tsao-XOi8Dr7jJEm6RJC9uj5h_jbvJmH7ltOZ73NDDABUZhy-ZkQ>
    <xmx:gLTsakTtFKXwoLGv08L571sPgFvQfloOQssFzun2Qou_pRB7wPpotW2H>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id B423B32A0097; Thu,  5 Nov 2026 11:53:18 -0500 (EST)
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
X-ThreadId: A0tJ2p7xI-y-
Date: Thu, 05 Nov 2026 17:52:58 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Bradley Morgan" <brads@mainlining.org>,
 "Andrew Morton" <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org
Message-Id: <5916f576-ba52-4836-b2fe-84d30677e767@app.fastmail.com>
In-Reply-To: <41718958-62BB-488D-A95D-E23411B97195@mainlining.org>
References: <20261105003129.3130709-1-brads@mainlining.org>
 <20261105003129.3130709-4-brads@mainlining.org>
 <7e655d9c-d38d-49a6-bc51-73f4e65383c9@app.fastmail.com>
 <41718958-62BB-488D-A95D-E23411B97195@mainlining.org>
Subject: Re: [PATCH 3/3] compat: make compat_sysinfo() scale far enough to actually fit
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, Nov 5, 2026, at 17:47, Bradley Morgan wrote:
> On 5 November 2026 07:25:22 GMT, Arnd Bergmann <arnd@arndb.de> wrote:
>>On Thu, Nov 5, 2026, at 01:31, Bradley Morgan wrote:

>>>
>>> Signed-off-by: Bradley Morgan <brads@mainlining.org>
>>
>>Makes sense, thanks for the fix!
>>
>>Reviewed-by: Arnd Bergmann <arnd@arndb.de>
>
>
> Do you want to take this or do you want Andrew to?

I don't usually merge patches for syscalls, I think it would be
best if Andrew can take it.

    Arnd
