Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.149
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793060271;
	b=LrhItmikwQo+tw5bWJmb2cy47WBv4Z0aUVbjf84okmzzOSBGnzkjUcgeSLIYC1Uwg3ab
	 chH+he2HW4kkatdKe8Ra8bHQbHu7+4fbiR0KV5fPUozfmCwrE6bJbPud9hJdeELRrxH5b
	 sISbklDvrsSvYnUkVfRC7bm6ZcXLfBplz6LogWZAkCL+bXQMA3dTWbr35+g6K5U1S75/U
	 AwOtNAy3Pw/u9aGBdjzcNoavOgL8UpheXhzUJw+S0+CdHyR6TtcF18IIvhfTkNeGxC1pa
	 2qKupc9N+kBY5/l+JX4iIhRTA1lT+lq6aaT74zkKJSB4C/dVJzZjWLp3hgA1zFn0oaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793060271;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:X-ThreadId:Date:From:To:Cc:Message-Id:In-Reply-To:
	 References:Subject:Content-Type:Content-Transfer-Encoding;
	bh=E6T1LY56NK4YnaiPSvZ6sEQeUE5jx76fAWKmNZOm7Z0=;
	b=4q/C02tOwY0LOKUXnd/oe+qzg8kCezak62Up6euhte4HoNsp3m1dT9iedFc/dBj8zSFy
	 A5hFRP0PdTiYpzhd6YeP+NRDak7UjfDBYhKepyYTKumok2Q7nTQZVIeKRO3ynGKUCYeD1
	 OKRamg4pkvYQ6pRIniVcUhIfkdaxCg2c53k7FVCBMNA29r3FOFjk4X6HGnKaEtm6YGuvo
	 QJU3Q3o8AdP4dCpa8rvzCEk/28/e2p1fNaHbhapR8CSmYfQIn0gKS+0GitImo96DvqRyQ
	 3DLf88TBZACpGgd2bT7nQECtx0+HB0rrcRDsMNwYS0vKkxDg0KAOwotlQ+D4mV/bJfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arndb.de;
	spf=pass smtp.mailfrom=arndb.de;
	dkim=pass header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=OKgh+ziB;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=HU3ZZON5;
	arc=none smtp.remote-ip=202.12.124.149
Received: from fout-b6-smtp.messagingengine.com (fout-b6-smtp.messagingengine.com [202.12.124.149])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84ECA606A322
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 00:17:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 84ECA606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=OKgh+ziB;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=HU3ZZON5
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfout.stl.internal (Postfix) with ESMTP id 9ED361D003AA
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 20:17:50 -0400 (EDT)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Mon, 26 Oct 2026 20:17:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1793060266;
	 x=1793146666; bh=E6T1LY56NK4YnaiPSvZ6sEQeUE5jx76fAWKmNZOm7Z0=; b=
	OKgh+ziBiAtXXGRYrmwecpKzekFts665019hFII2rgOobYCf4FQa2EYlwwogUs9w
	JZi6R2xjS3geruEIgQai2awPCTQ3v1trkt4aYpkiHzgT5K3W668yYQP0WQbos5C0
	WMIVge5cq5e1wicBZqBW1ILM+9WBTBUoTva7ybUgs4/i1ejmZ3VhpyTEl4vERGHe
	g7TYnwIvtHvJsg3N1R/tYPbWDWqRiIDRdmG1p88KTZqBSq2aoshnUGw3lba/8i82
	Ijjs4bbFzzSYJ3DGH0jli2OJc2PBMm2yJib0G81lOoTivlre7dBPtqDkvlyIFWek
	MxCNtQnsFX8pkcgSZ0ylJg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1793060266; x=
	1793146666; bh=E6T1LY56NK4YnaiPSvZ6sEQeUE5jx76fAWKmNZOm7Z0=; b=H
	U3ZZON5+JRptGKZ24ztVFjVIiOnyu1jGV1Z6wM8LW3ADpcaTvjXZPn01MJFMIK/F
	AhBIz3Ys5kRij/ZU1TxVLsovy6wNmg06/FRHC+9JOvYt8PSbfDG5XVvQ0NfUOVPU
	fs9HxFvw5/BD8zM0n0F8Whh+iQY7GYHRXLLcRotiuMDgg1O+2xK9FWZPZbZV5lCe
	sW9QkFDpBNweNSr9iLjXCQVdzOdViZkelrjHhHalm2SV0DKDPZIFb/DsdCpo5l7r
	42mLzCs6tvAtwfLF2iHBKiLHKJ2Bh8uBHMwZXVmWAmAnZgoz/h/Hn5UOdITZjsIm
	HfgK4QkM5m5iiy26BKPWQ==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=sign d=arndb.de a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1793060266; d=arndb.de;
	mf=PGFybmRAYXJuZGIuZGU+;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm2:rsa-sha256:LJ8wZ9p83imOF4N3pkoVRWLDOpP80mqmHhjwaN6B7tVbw/4
	wkUG/DrO0G72IzjwTvxHGGWkfsj0XFXnsWIxZ4vA2eNvDWjewYjUzmiFbZIHt09b
	sZ23MugApi08CiQSn9eW6vZM49wsA43Dr/GzfB+lzSuf1OKuGjHeR3fPIlnUNUta
	Nsltaa+H/GZYh0plb0179/udIvGhWb+HBWJNEtJyRNuPADXrhC3YIwpVNfz8BC1J
	DHQwzekUrQ+mGk9Aui2OKsdvZEx8LtJMetp6rbBdZq9awoKKrpw9VK8gI6AuC0LZ
	JwUDZWE17hFtta+4A0TM/qg6KRPeG24TxigcDqQ==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:ytxqW8u2rQFedyYJS7WiLBGlEiHnbS8vmciJzHqEdPw=:u36NUg6qJxDleanN9SQByP+faJGoEzUShlpHn6N20uA=;
X-ME-Sender: <xms:p-3fatMTtFNEAngb68naqfsnxiXxXZEYWyjRMZhgG3Ity9lYASmPwA>
    <xme:p-3faqzWjolJnjFxtKHPgGXCRyOXNXo96a9Li5HiNQc7m3j3mCNurYg8cw825gkcr
    x9g6PQx_klqTULgaBBiGQ6a8hrbTPI3kgLellGmWd7Qw3th9zUUDRs>
X-ME-Proxy-Cause: dmFkZTGDC7SVPGEUGz6hJCmZIpHAreNlStA4WdNKWdO7V2JRCKeHyCOZJxduRY47Eklv4o
    DTTwoQOWgb6gpXb6vgBOmPzronxNzDIquzhiUo36Yo+rjMHQIPSbZWoe3MOFmz1kRJvuYw
    Jjrx0p9vHoNlnSUAAgmJ/fkywKvFSl5zZwnHC/ihMAeHUCkuzZWHyyrSOC/xvAS+WJSVke
    yVy1JqrodYhr/dmYf4QYvNfKRG88rbOugkAzXJ82qi5iG1oX1AWZYSaaeyy8TWQnj4OKah
    LTyZnPZjvblABic2G1+VYzkbZJmAA/pIALmgaTtRJAh2rZp8g3n1+J071OHo36fVMCQjoO
    7Xid9C2LHODLueJ1wCA0YzTpMhUHow/DO1NvlpRxPrEtySECwazCmqj09zMhSFepd+Mqga
    0cchawNsZKrJAFuEe6Y70yce8s9VUFJOsZnQUYwI5Vrh2gGUs0mMI5IBHPPAca6w9g1Huv
    YqIYvRXWuMtNvSbXv8p3AC43BoGD2+EwhVZHpwyq94rjrLPUczKEvZbDENMBNPS6UHsmUw
    v3nviECejP4Oe9A0DGC9phk4TALLT7pFSlCKVD06/8L+SYEn3Cgpdm+w1RzyrBEnb9rHTg
    SrBDHexTdCmnAArLE16dnIlgZqg6ajiwJdSkNaX1EPwJeu0oKHX8h/SSWixA
X-ME-Proxy: <xmx:qe3fam7VRZwkHDhHwqmRLzpYY12-S5Age4AxeGKc8Kx75CtO3Nc5Zw>
    <xmx:qe3fapMj0lA6vt47nJzTtOcEzNcAow04fmLWRJaJ2Lnz_7iErfOFDg>
    <xmx:qe3fassGaeEFQnerylserue7yLZbHf9F6jY26VMzV-equuWx8D1BkQ>
    <xmx:qe3fakZlJjK9psC2P2ByUFUqCZhZ1s4ThCwNqSqsBXNCcj0QUujsxg>
    <xmx:qu3faq3EHLYZ9F5Sxi2Dy8Ymh55j5EHBAvXvnquTWfMiUJ_jmFheBC23>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id C0EB932A0097; Mon, 26 Oct 2026 20:17:43 -0400 (EDT)
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
X-ThreadId: A1RZS2Xmz9Jw
Date: Tue, 27 Oct 2026 01:17:20 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Sasha Levin" <sashal@kernel.org>, "Dinh Nguyen" <dinguyen@kernel.org>,
 "schuster.simon@siemens-energy.com" <schuster.simon@siemens-energy.com>
Cc: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
 linux-kernel@vger.kernel.org, "kernel test robot" <lkp@intel.com>
Message-Id: <1d3a81cc-9b76-4097-b9b3-07e62277aced@app.fastmail.com>
In-Reply-To: <20261026234452.1086974-1-sashal@kernel.org>
References: <20261026234452.1086974-1-sashal@kernel.org>
Subject: Re: [PATCH] nios2: ksyms: Export __divsi3_table
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, Oct 27, 2026, at 00:44, Sasha Levin wrote:
> lib/lz4 is built with -O3, and at -O3 GCC enables -mfast-sw-div, which
> expands divisions by small numbers using __divsi3_table, a lookup table
> in libgcc. Without CONFIG_NIOS2_HW_DIV_SUPPORT that leaves
> lz4_compress.ko with a reference modpost cannot resolve:
>
>   ERROR: modpost: lib/lz4/lz4_compress.ko: symbol '__divsi3_table' undefined!
>
> libgcc is linked into vmlinux, so built-in code finds the table, but it
> is not exported to modules. Export it next to __divsi3.
>
> The error predates commit 2180d11e06fb ("nios2: ksyms: Declare __mulsi3
> export"), which only made it visible: before that commit, modpost used
> up its ten unresolved symbol reports on __mulsi3 and suppressed the rest.
>
> Fixes: 2fc8483fdcde ("nios2: Build infrastructure")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: 
> https://lore.kernel.org/oe-kbuild-all/202610270503.NGox5O6j-lkp@intel.com/
> Signed-off-by: Sasha Levin <sashal@kernel.org>

I hope we can address this using a copy of libgcc like the other
architectures:

https://lore.kernel.org/lkml/20261020123149.cyjzz4uo25oiiu2m@dev-vm-schuster/

Your patch is otherwise correct of course, but it may end up
clashing with the other fix.

      Arnd
