Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.151
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793863559;
	b=vYEyXLREbgSKLLmyRJcSTBlfraRAylY/KQPEomx0f0OSN+v9TO4jxfnA/KywWCO7B7kO
	 4idXBJ/A4NkjOIpggh/dYPZAatKD0U5Fb13fc5LVSjtkX3GL60UO5lpMrg32DXpteYCgE
	 /hVoZmrzu96pN4TYKg0lpQKNy/z7nvxeZoChTG1covLKMCW/Qu+63WwJRBuU/XI/8Edj+
	 vtkeTzwYRSb8jcAf0ByZTZaxXTh+6Mq+yv4vbLm24LYwHaeRvmcXBy1NYA0lMt12DAAW5
	 g3esSlqlO3rF6pAkBLU4kBSue2cO7b5pFZE+GJEHXYqRmFsCHnDigKICohZpbb6ewDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793863559;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:X-ThreadId:Date:From:To:Cc:Message-Id:In-Reply-To:
	 References:Subject:Content-Type:Content-Transfer-Encoding;
	bh=fLVEQk0hS5HfkSkcmYM3DgslMzFvkqZc5clFbFHYi0c=;
	b=ACp03vwag/ngGCENw8/tBLnfonp9cW/zzrexkBK7ntTWjvzywDn4eJm25nUf9tkaQtCk
	 9/zQc+CtSnQ+eHyiltUjoRUp/BGpL4sIY7TiDWjeoTPO4QPUy+Ev4lvjO9Q0/SNa2SX0g
	 7J5hSyArTaTx1fflNBtKU+uqoYE8oAjITo1Wi0j9hPSvo5PTRyGMKIaQ6GJr4rx1vOxEJ
	 uoHgdNePaUR8t89rrDx7JGbfVBBOxlC+2TaeRbfSGmzWpRI9eAs/aZZaPYjYbpiDjrznm
	 Hq1cqBAZ17gDZIJBPDtdHXVvs/e78iUgWbUMb1UlgSIbuEVC+9Ti3PHceUuqI8ZowsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arndb.de;
	spf=pass smtp.mailfrom=arndb.de;
	dkim=pass header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=C8rnAbHe;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=GlvcHZTd;
	arc=none smtp.remote-ip=202.12.124.151
Received: from fout-b8-smtp.messagingengine.com (fout-b8-smtp.messagingengine.com [202.12.124.151])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 699E7606A31B
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 07:25:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 699E7606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=C8rnAbHe;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=GlvcHZTd
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfout.stl.internal (Postfix) with ESMTP id 27AD51D00120
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 02:25:57 -0500 (EST)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Thu, 05 Nov 2026 02:25:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1793863555;
	 x=1793949955; bh=fLVEQk0hS5HfkSkcmYM3DgslMzFvkqZc5clFbFHYi0c=; b=
	C8rnAbHetMlLyC2UGaYtDc4+2U+83f2vkjS+ErL9v8eg3ON86BkeceNPGFOIuezi
	WUWQ4CAHX2j5tqxU5F9ePdx0zB+xpvURJPdZ41csfDRLquMelFkMYIpoBPj8pUio
	y2jmemu6/MwEmEd2WBHWN9YjvEDwoq3RO2cOIPkxQwcGKmEEtixaDnVXqHNBaD9z
	TBGy39yC+vx5dDSRgyhID14eLDgCm4dYA5YlmV9ZEEk3OBaJ4Vhg7PhH/I1vz1yz
	vNvHormnjSWe+HE2wHGoICsPSTouD5MOKx2j8tdjXXTFaIoJK//f+gqUtnenGN9U
	kurnz6vAqMwYTkndnY85MA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1793863555; x=
	1793949955; bh=fLVEQk0hS5HfkSkcmYM3DgslMzFvkqZc5clFbFHYi0c=; b=G
	lvcHZTdeFc1TX7rmf5TXmKS9BZqOxK3JJ+DGagkdIpTW95S0jXgZuZJjXTvXgpja
	LGvn0iykW2UzNMd/mdOMUBTTcRyCHzA2GACk9yo3XCuPXbUFBN+x2ikVAexJIwLD
	swaF7rxpwV5edQFgpPALk/0O0FsEqI2LfWTCYRffB0g5xk4XoC0J5z6dpidHcIJc
	Sjz89VoB6CjhqGdho+IyFzxnj9SYyFK6EejLkLjpiK69sG7k96nw+8KHEjsAzK2f
	BLYSR44M0vjT8A9iP+D61DUnDF+LEo/LN34O8EHWZKxZUrs+okcagE7KdoAITHBt
	jgoBY0p4g8PAcO0WOy14Q==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=arndb.de a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1793863555; d=arndb.de;
	mf=PGFybmRAYXJuZGIuZGU+;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm2:rsa-sha256:OgCferr5Dzf3CoYlBSaOel/5NYMn9qSNTeDnz1gbjlV3O86
	o6K3c36QSTXq5Ues7MagDF1oDuq/VYqcz4ShklcOGCFKW9HA2lZRkzplZhOTn5RP
	4WnZSfQEMIXcp4X+9ygECODW3kLdEDaqb0gfdE3Feazmvl1RozOxC+iwC6e+/Vl2
	LHDRr78CC63FpxcGYvqIz2Q6LiVGbY4rRyv+3Ex8FuxGiH5iEGzgzxeaEQA9YtL0
	0JDrPFTbn/qNqeL9GnMOdT4SPTwXKI7AzMrgrqABX1LE/RIzdh6PaHz8TDFdT+yB
	jiHPhvrIcBT4ZhrnJXk7AFumYqdSfiVrV3yXUfA==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:RLtFaELyqyHrmLvCtsl/N6MpzlrMXPMj6zfpABJoxWY=:gdhvQ7jGBaj4lJ4ajK/Jbl9XXFFolpp3cQMI7oWH8aw=;
X-ME-Sender: <xms:gS_sahGmGQ1yXIKC_-kyPgqQnwe7dFgGvbWXU0fteKSHueUvUczGxQ>
    <xme:gS_sahLPWVAx2hOLEiyhVM9PJQ812vAaFczMd5pkOoDP5CvcVeyt2ugFhrEFc7HV3
    _mwnL0-iQt82DiYeNC_5M1k7nfUR3qwiaW2QgnixMtUKN8iOT9fix46>
X-ME-Proxy-Cause: dmFkZTE4XiMNPEH3qllwxGHArMFKay38wxcjRetWzwnXiiZ4kAEJnxqeBZkwDnnfwGDkXE
    FwrXC0U/eqzyZiYEQV4pBdDvkGI6d5FhlvTDC3sTiWawlH+t9Jvga4uxJVFQvv3lOfn8Pi
    G7S1oRvxT+RlO+jHIEHs2VUMRqwbUZGAEAcR97PoxypRHAwf/3/Di0yr+Xi+O9MQGc0UgU
    fKKr44ic51EblFnNlpTsfqDdjmoXiO2vPCKBOFjxmysAr7tvH1/nNw9H1hDHM+PdC5Ee17
    wPuacZi9nWhjyCG1sMi7tkbvQOT6h62OeDtogEoXhGHeUhd7ixsOnOF2hzlGYr/uXqqdXs
    zhz0mIRzsAvdxSgHysy5piMQ0q6dxgHjoNON5v+uEqgX5lY26epfFc5t8oFA9ehpvPCo+e
    d277yV3zYPtFp8o009b1e5dyG2T86PdLotHtTm4Mgx9046wMs/C93aHLAhHjMm6X6w5Bom
    SaTU+7b7VQcOmnW9J4LEtely+a9izZsEh9MWT4CdGjO6lPTsGbwaW7PFIPxI69Gv7FGLTB
    o1QS98wYazsT9KZNeXXep31jjWE1jlQLcdtulNA53NmAqqr/O4IJSbDyt4FZu6A7qybFcH
    Y5e1b0m9lr+/vLp5YJqIDFU0bjUEHA6yadjPXzd/yxpgDQnUTjUnKMzckECQ
X-ME-Proxy: <xmx:gi_saiB_-0_ochfGW56kEAKypmEIE6uW2PH3SIE8npuBXWGTBc7JUQ>
    <xmx:gi_sakRkltwHAWDcxoQnj9kwAVSEGPQlz4BgRiYFbq9zJ9Zp7UgCyQ>
    <xmx:gi_saopEL9siPjqCLWuklIYT6yo8C1rAkkFT09XuopLmHTqkqZ47rw>
    <xmx:gi_sauyrfbD4H4SMbG_SVAb-Z3jWzGdfRREBJHZE4tulr1Tbzf6_UQ>
    <xmx:gy_sam1YNE1WyIla6nql1EvvDcSfG36zdvknP40Sgxx7kmZCAYMqMNPG>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 8B16B32A009B; Thu,  5 Nov 2026 02:25:53 -0500 (EST)
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
Date: Thu, 05 Nov 2026 08:25:22 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Bradley Morgan" <brads@mainlining.org>,
 "Andrew Morton" <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org
Message-Id: <7e655d9c-d38d-49a6-bc51-73f4e65383c9@app.fastmail.com>
In-Reply-To: <20261105003129.3130709-4-brads@mainlining.org>
References: <20261105003129.3130709-1-brads@mainlining.org>
 <20261105003129.3130709-4-brads@mainlining.org>
Subject: Re: [PATCH 3/3] compat: make compat_sysinfo() scale far enough to actually fit
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, Nov 5, 2026, at 01:31, Bradley Morgan wrote:
> compat_sysinfo() checks whether totalram or totalswap is too big for the
> compat struct and scales the values down to fit, but the loop stops as
> soon as s.mem_unit reaches PAGE_SIZE.  That caps the compression at one
> page, 12 bits with 4K pages.  On a 64 bit kernel do_sysinfo() always
> hands it values in bytes with mem_unit == 1, its own overflow math runs
> on unsigned long so it does not bail until 16 EiB, so the loop runs its
> 12 turns, the values come back out as a page count, and anything past
> 2^32 pages still does not fit.  Storing that into the u32 field then
> just drops the top bits.
>
> So a 32 bit process on a box past 2^32 pages gets a wrapped number
> instead of a coarse one, with 4K pages that starts at 16 TiB:
>
>   ram      old                  new
>   8 TiB    2147483648 x 4096    unchanged
>   16 TiB   0 x 4096             2147483648 x 8192
>   17 TiB   268435456 x 4096     2281701376 x 8192
>   32 TiB   0 x 4096             2147483648 x 16384
>
> The 17 TiB row is the nasty one, a 32 bit process is told the box has
> 1 TiB of ram.  Keep scaling until the values fit instead of until the
> unit reaches a page, the unit then says how coarse the number is, which
> is what mem_unit is for.
>
> Nothing that works today changes.  I ran both loops side by side over
> ram from 1 MiB to 2^56 with 4K and 64K pages, they disagree on exactly
> the inputs where the old one dropped bits and agree on every one it got
> right.
>
> Signed-off-by: Bradley Morgan <brads@mainlining.org>

Makes sense, thanks for the fix!

Reviewed-by: Arnd Bergmann <arnd@arndb.de>
