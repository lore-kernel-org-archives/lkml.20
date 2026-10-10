Received: from fhigh-b8-smtp.messagingengine.com (fhigh-b8-smtp.messagingengine.com [202.12.124.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82F6D4A2A40
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 14:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791642545; cv=none; b=Z+l4d+2/nk2pl2KiAsK2lesDodQtpoj5rsbCMWZTiV3jxBsPhfFIf5YB57WpN8ozYP4HNrR1WtbZDFnUSNY57+H9zB72w2VlELdufObd6Wr9iDOeXyAoWH/2/V9XSh7zUuc4Dn7TSe0HNKm5MYRlPJR1FCnonbs2p5lLprQOxZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791642545; c=relaxed/simple;
	bh=9yZoRXmQQtglkDC69zeTXeUUkPPxdHTFbXEWw2qChQk=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=GWIuE7crfPiOdzT2yBRGlayLCMzfrDLJZHNPrzdz2IIWXwAp2LqHLGDIua2AgndsK3suuhyjIdR+1tYQVkm1OZkyKYOxVtDB3RI4K6T4WWsoVVvfQpiTI/hbPL3vCGslE2TbwlDHwp2TdpaBFlflZofYx//aVZ29RIlaA15qGfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=jFWomILQ; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=sPU0NwE1; arc=none smtp.client-ip=202.12.124.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="jFWomILQ";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="sPU0NwE1"
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 9BEA37A0090
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 10:28:58 -0400 (EDT)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Sat, 10 Oct 2026 10:28:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1791642533;
	 x=1791728933; bh=9v+bgPkySBzc0aLhhX4V+5q7OxZcccocW4BaJrDdLNA=; b=
	jFWomILQ5a23kATKxV5opHvM6kxextElXZNIoC5bV5Kd9IuRR/QlKjpx0lZ+Dzmq
	sCB+9MDrSkClNP2VC5yF1n8F9TSfBkLlys7Wu8bDS71XK648H5QuH/+Pxnz+SYVU
	DZ1dEdS4+I7AagBW24ENQ0T1AnkyKVXm+aqvitC8m1KVNbpTZXgXNzTc7zHrfhQp
	W1I6v0HDPp8V58qJBef2shx9cQvbo0RC6hEMtPLz5pJGSzgVY8hnmEHMuG9TAfYD
	xrdhYw9t6gELVazbbwdvOnPcf/xKiMyvnUpEU86nD4CmTLwN163L5kZOZ3y3jjbp
	fwPxFcLthyJlq8TspW5Nhw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1791642533; x=
	1791728933; bh=9v+bgPkySBzc0aLhhX4V+5q7OxZcccocW4BaJrDdLNA=; b=s
	PU0NwE17zIyVoH4vRdF06XvdJJ9o4RoMUHru7INjE0f87mtHAeO/MBk2c0XvNZWh
	R2Hn3pzkxaNMUHcBrPbq7+JU/9IBTKkwB9VyJZ2SScLzQxMmKG/oRwBcPQn9SHtC
	fuOUr0vKI5MH2/oXdGEgARDat+FefA9aYWO05ZnEdr5HDv2bpngpsbBtVlBLggRs
	8MlmeMlcor70aes4jtGOkhILxg5wSG52Pdw+ko3nOAxHH14lxWv0VMYJaRx9bNAb
	9IW4jlbCn+8R/Hv75Bme8ht9T9VT6YCEIgLZl7Z2nC7wkMEuMQLBbrcr5Ti3fd8i
	lVzrLz6GYNGWQS8dSTuFQ==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=sign d=arndb.de a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1791642533; d=arndb.de;
	mf=PGFybmRAYXJuZGIuZGU+;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm1:rsa-sha256:XYNY23RjHw1rLdBpSMh+Su0iltSOkJ2XE0wn/dRXzYaMZ5A
	R+5sg+pxSNUMeaiM2ixHKiXzpAst7MluaId9+jAHmM+TIDByRG62oOOI+TrfSs0A
	L7e4Hf2dh+j34hqz5nZNrUyI4ZsVaOJ7y9Wn3wquKVce/Q+30xnCckpqCRgW9641
	lnmr8lyZZes9hWW8k7HE1jetMDdiP1TyRrRpOBZt8yzvW+k0ctyW0zYqYriNho0w
	2zaOwW9a7aonLCAmJIVcfPE0JJltZkvkIVB9CMrPRFD/gIdZXMTIUbLxJdd7ZLlI
	t2K9Eh2rkxjPPWo5fcoxE082QHMa0pHDUTKftAQ==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:aV/xq7C55QCQ+urKH1wwNiqvUZ1gUoGK8FiRVFhcd4E=:9yZoRXmQQtglkDC69zeTXeUUkPPxdHTFbXEWw2qChQk=;
X-ME-Sender: <xms:okvKaqyg97e7-Vw-xxh6O5sQLLuZB4t0F58vf7v30ctQpSC9YXEI8A>
    <xme:okvKahHF6PAwhJ6geqQ6v-psLzO7fKZDuOkpJQSC2zK60HJuDpu82-rTJNklTxLSd
    5DkpOCERy4NknhHJRwIWM_b20K_lpxuQ-nbuqqWYUn3mh46o7DLvds8>
X-ME-Proxy-Cause: dmFkZTFLAfDTpiHknNrFYZyTXrnw2i7hwBBvDA63p8pgRb0WqT4uwmaQRp4EGcR7ukfzJZ
    f5CIWh9gOF/Amyiux4ODBvMo61U3Jc3UVC5GH6RgDDma1/7U3/zzszVYlVvovFRGCIWGfw
    eR0FSHRyq4KfzGqSx38fm4/+TW33xsPGI0rRkMb8YT6JNiQiB0og8o6tMyILtVOpdB9RB0
    zL63lotg/Pa36txTSqrKwJsHfmQOBBnEV+R4n5wWq6ZzX4w2ZfLeDfVp9XMY/u31sGf8Gs
    Whd8/WU38AX11634PqkCCV1/inETB5YkcD7XCwm1ixzjvsWeZGHscx93x8ujbNSijxNinv
    u75MzmtoXKTjx0uYl2UonLYOjm9KuibX5/QW+3j1SPnStE6injzas1NPUy5IjKbmSuJQFA
    tp0f+a353JAcAO1vvtgeNXIZgxzNy0oFndBlHzwws0BdrSJUtVsMAo+PDsMaa6+6ixeUnS
    KP+USiRioKp1FxX+T30cSsenqYrbTyrooIyngSwlyzxVoP2KQGwhfqmOnaAbsaahHBbZ3l
    5/Fqrxg5RMkmgsFuUSN1yduGzA7KAlLpo3lQb0Y/onn2Gf4Vd2KNcGNdlJ3IcpAti2qnzN
    9PlzKsKehkw9K2vPJ2iJrAV/ELh0VNLY+3xIpl7IBCMt6kDO44LlSaAc2biA
X-ME-Proxy: <xmx:o0vKaibRRskxJAQolID_pv514I4fc59uswnhRmocoHEZo9tOxMDGCQ>
    <xmx:o0vKagBhl5ewb5h9G_jLpYArwRvG0s9MIZQbqkcH_xDn4B5mtk7MGQ>
    <xmx:o0vKai8DPArrHyVOkViLOl_Zu33fWakIveqcbGms-vm8Je2d3d-FRw>
    <xmx:o0vKakSRxMCigSa3AnPIAEwGBUB_Aq0wvTzrPGKdqSbhySj0DUUr6A>
    <xmx:pUvKarbo-f_iLqF0lL3-SNQiSPItyOwqkVjEuDIN5GeCsZVBW_CaHrQ9>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 4017232A008E; Sat, 10 Oct 2026 10:28:50 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: A-dXEK1mihoo
Date: Sat, 10 Oct 2026 16:28:29 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Navid Ghahremani" <ghahramani.navid@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 "Russell King" <linux@armlinux.org.uk>,
 =?UTF-8?Q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>,
 "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk@kernel.org>
Message-Id: <5e78f63b-9479-49d9-8474-fa408135f325@app.fastmail.com>
In-Reply-To: <20261010130024.177503-3-ghahramani.navid@gmail.com>
References: <20261010130024.177503-1-ghahramani.navid@gmail.com>
 <20261010130024.177503-3-ghahramani.navid@gmail.com>
Subject: Re: [PATCH 02/24] ARM: l2c: Serialize device reads with cache maintenance when
 requested
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sat, Oct 10, 2026, at 14:59, Navid Ghahremani wrote:
> Provide the optional lock used by the tested ZX279128S workaround. Lock-
> off experiments hung the board; the proposed API remains subject to
> maintainer review.
>
> Assisted-by: LLM
> Signed-off-by: Navid Ghahremani <ghahramani.navid@gmail.com>

Hi Navid,

This seems like a very invasive change and at the same time does not
look generic enough as it requires changes to each driver behind the
PCIe bus.

Please describe how you ended up with this version, did you copy
the from the vendor BSP (where?) or did you arrive here by
trial-and-error?

This looks related to the CONFIG_OUTER_CACHE_SYNC workaround,
though I can't tell whether that means it should be connected to
that, or if the actual symptom you see may be caused by that
workaround. Do you have any more information here? Does the
problem appear both with arm,outer-sync-disable enabled and
disabled?

      Arnd
