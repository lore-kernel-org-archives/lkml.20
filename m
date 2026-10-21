Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.152
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792572663;
	b=M+xp9w/Q41HwqesHDmRFHzdn5FLvCwa/jeJnbVM30aDb5M3T0/fwFf3e+58S2AS1qwFT
	 3BQVdP1ZncsaztUt/MFpk7U+fApIT+W466A0/OgXEevqEh1WwmZTgK8zGBZMfljql+ela
	 2V6H+Cys5/9nqWPG3JIrkNPCloPuXw51bVWKdghHSibEym5z/zI5lqlY5X9WcO+kZXjWm
	 FhpWjqgSuMD+qSzTgZVBBqydPYWL2qjFotq1we0uMFlIBFnQRJVldaOu5pLJh2Zgc2RgI
	 ZI3z3eh/m1zpq8ZpkzqEKiSKEjvOdl+otHRElpgOrdsWTaEfrp7LOzy7SFYNyetASyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792572663;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:X-ThreadId:Date:From:To:Cc:Message-Id:In-Reply-To:
	 References:Subject:Content-Type:Content-Transfer-Encoding;
	bh=wgIiq5RT/nZgAIyYQ2ujULwa2nKkHZmUGJ5t5RRdwwE=;
	b=d3tVvWpFjlwGkmMtrgPUJUMmP+igUQZgrxzSwpVHD6XtmTV9MVVikJxb8BpZweJq4zPr
	 YNR/A6CYzjEJMjN0w4ZZrG5g9vDkFTCvXedqP02B3GGYYBpbDCUnYKihOVlZwutg66ry1
	 mr6kOGdG0531rU86iBbV80tDtoLm7DCT7wLjKHk8UBBvbfqnS09xssuX4lO+dehm4eN1R
	 AELI9NhTU4TbK0E3POHOOzbaklJbfFf9KV9EJCLuQDC6NOkVdvj4+Nk4kg1GB5WGXAaUu
	 wz7MEJR6/IqZOuoEnNUyjVv6hJ0nlWyy9QIAQ6VsrbRff9BViURo98H9LaCfq/qvqug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arndb.de;
	spf=pass smtp.mailfrom=arndb.de;
	dkim=pass header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm1 header.b=Qmg36ft7;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=K5sdBRm5;
	arc=none smtp.remote-ip=202.12.124.152
Received: from fhigh-b1-smtp.messagingengine.com (fhigh-b1-smtp.messagingengine.com [202.12.124.152])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32D03606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 08:51:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 32D03606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm1 header.b=Qmg36ft7;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=K5sdBRm5
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 4DEA17A00FF
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 04:51:02 -0400 (EDT)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Wed, 21 Oct 2026 04:51:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1792572657;
	 x=1792659057; bh=wgIiq5RT/nZgAIyYQ2ujULwa2nKkHZmUGJ5t5RRdwwE=; b=
	Qmg36ft7orezyryCOBDZFyLa4lTQ+7ZNglUfW/bu7BPdnXyse777cwZSw39UoUfc
	QZjPZK8Wadoo9xbuB5JxTO+bHVytxvfaEL4ETphzQVMcNrINcLK3C/oCfNvgTUIK
	NhA+vdI5FSgCucLiB+jviRp/ES3oXpW/nV3MpR3dmfLAmBJxfQ0oGiwEz2EDnpJl
	tct6OvD1P1riW99m57q4pTAVU2LCy9SL+e3GZHyVOHIypQA6A/LnPsCr4Pod56A9
	ufdByBK0PbXEjC2L5tiXlBOYpSrhuXXWos6y7MpIdX1Mude4Y0g5i7OWwK8+68Ih
	JPI/MZqCfnZAeQJJc58SNA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1792572657; x=
	1792659057; bh=wgIiq5RT/nZgAIyYQ2ujULwa2nKkHZmUGJ5t5RRdwwE=; b=K
	5sdBRm57KOHhPN+U3y2jnqXVXqTGX97AK5y4bVuV0mPIvqtP0Y6bf1jXNwW6QHO0
	/k076eWNvm3RKGFLfI6Fgi+Awr5X4xjauXyM204oZ21wSwPYIYRhPniBSpqibPSL
	FfDEE0HUh+/lkgOOw3Jg6mFxWzT5jOebn2CB5CUneg6MbF4UXVO/LbHCtoZ5HaSJ
	prpADbkqXxN43WcXW36Qq+weOuqImNRvubN2G8o0UNeNPBZi/q9Fh9EFq9NYfzkD
	CMh4qqFttTdHe0GjclxoKfdQxVWd/cPI7ewRe6Vy2AIeBUA7/wSMaNKMF8fqTly1
	YYUUed6BKn7HA1xIuLRsg==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=sign d=arndb.de a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1792572657; d=arndb.de;
	mf=PGFybmRAYXJuZGIuZGU+;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm1:rsa-sha256:RJQc/pCdA/gVi7OSqgh5FEVn0shIFChO+k/Qlk3PBTo+K5w
	tj7xI5rxwZwkXxw+1zpefQyRtdLicWDdAP9NJ1acsg5Gj3w2Sc0VdVD3D/4dEy1u
	htONogAmpuTMycmsaSMeGsGN/+/nurym8IwinLo2ps9nq564Sv4Id+vAU0plcItF
	6k8uej+uMsRHJHwcabczG5YQyIGieUBZp/5zAo2t3UzciD80bIEuyKtJjPkkBpiT
	uUzWxTuIFzcnfLpgZ/XVYFuSDsINkixzJDyRFkYIpZMtA+a71kf0TJuonFF5r4+h
	YH7JHeCWsMszUhIHlbxh8mpCMvp0XSJB+G3A4lA==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:WFASHPt45fMOBEtxbfckL6KRzoGLz0hjNWWx/FVUrfA=:pPRoxuWZnimtvhAvl70gUGlGCC52UlrCXY8h1LbF/Io=;
X-ME-Sender: <xms:7XzYarA1_QyaumOcSdaZC3T9Z2SBzNUBKRGNvnyxV1joH14BoW-byQ>
    <xme:7XzYasXP2v9JgxkE8dlry8rMttsfKFsjIcyQH1bo9M6LxPwJEHLimPJrA6QJnwivA
    k3d05a96DR8N8xn2tywscYusZv192o_42roCT1BE0iJHBna_Yq-Z_Cd>
X-ME-Proxy-Cause: dmFkZTEsRI9vmqUL/hdVLFbDwn/W5DQOKWAPYSXQPG2rYbV24v8bFHo0lhnsEUCbLQCk+k
    frJE4c75sCZYN5vcT9iyMhWZ6fw2kN47ZCLO3FCP6kv7LQIKHB3GiS6fsGg9caBfzaJORT
    r+OvPv7sKBe8B6aSeK2NbpunoFpVDFND3U7C/zcq1D9ZqJCuWDYWVlhqgp/RIysVyRC1kX
    WDPRbiiHrCa23lfIAo52tLFy8bR56YD0LBz25eP33O5apvH7rvVjT6CI5r6kPCfmEy0rIF
    ctgEwCv6QWuQHoMNhouNhorvzjUuDytfFM9a24GF+JXcjKhlzVyEoupdZ4pxaOSTIVfhcn
    7UH8ieu+/nkDJ8YtVLamKMCtrOP+7m/7Podd3yOJBJD8Kb6u6uYPYuAB0EXxLi60k2Rpgi
    8r7l9deyFOSU5jqbkO75Ip2vTj/sQUoBk6DxYvr0p6IA8zIqQ/xMdU0ckJ0jNjC4ptoCat
    JhcqmZ37pQwJHyyaM2EiMLs0sVTJCYZuAnjKjyYZqQ8lX8Qg+0UQQQ4b4FQgscUwVq7Gbn
    C+npkH3dmnZw17sJwMZIxA+r4AMI+1k/eXqJiJFPD2U9SbeQCXXIh1UNtCTKS8dzgQF1kl
    /LIeX9yzq06rw81lLHc8/GH03TxrrcY6hWjCosHoTkT2oeYnUt7Xgq7CflvQ
X-ME-Proxy: <xmx:73zYalw43FNg3sUgv2YZIO5bCSElISNgRAVCDFK5llF51GnY5Go82A>
    <xmx:73zYan2H6n5o9NjzugzQtXI3F93f-LpAv82TbKSPODVEViYCdiSKZg>
    <xmx:73zYai_T75NQp8BFPE9vu31_R3YuhFu5x6bmgNoDEpv7Nwpn-ukiYw>
    <xmx:73zYanraufNpIUzxFgMWttVMpvdQgp1ZJ5KMN1NOOUoCq9hMrdjdsA>
    <xmx:8XzYaqhW8v3I6nQi42rNNSfcakcb8qZKuF_oPeAiHbDb1SfNgZzsNI79>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id CD53D32A0098; Wed, 21 Oct 2026 04:50:53 -0400 (EDT)
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
Date: Wed, 21 Oct 2026 10:50:33 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 "Arnd Bergmann" <arnd@kernel.org>
Cc: "Jiri Slaby" <jirislaby@kernel.org>,
 "Andy Shevchenko" <andriy.shevchenko@linux.intel.com>,
 "Hugo Villeneuve" <hvilleneuve@dimonoff.com>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org
Message-Id: <01553430-c8b0-4adb-8f3d-555f969a14d0@app.fastmail.com>
In-Reply-To: <2026101952-wham-earthly-c149@gregkh>
References: <20261019090017.430425-1-arnd@kernel.org>
 <2026101952-wham-earthly-c149@gregkh>
Subject: Re: [PATCH] [v3] serial: 8250: remove obsolete and broken PORT_RSA support
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, Oct 19, 2026, at 11:39, Greg Kroah-Hartman wrote:
>
> Any objection for me to sneak this into 7.4-rc1?

Sounds fair to me, and it looks like there are no objections from
others either. I've resent this as [v4 1/2] now with the
patch description changed and rebased so it does not depend on
the hub6 patch, which now comes second.

     Arnd
