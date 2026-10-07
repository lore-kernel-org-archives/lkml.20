Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 284315218A6
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 17:55:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791914151; cv=none; b=co3ETmpAZQc0S6zEs60BYAX3NIBKVyxBmVi0NJSempwXiydfO0JM/XfJaabL+m70sM8OOavDSKfINpd5g9lGXHtMsgkJety8eUTlNfqDkP6xOLtXBD7Bo/oFCLZbkpRosa8gOheVmOF1YwN5DcgFz3bNp0Pf6HgiIREN7m7XpBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791914151; c=relaxed/simple;
	bh=j+zoSRdpxPqIN7Wq5Lo9cK4LMFAPTuaAjwcCvy4HSOQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uLGhwaP+gtMdO5bgaZZ/GTe6wkpP1treu+9klM8gc4vjlVkTdtXNo3HrYGhaOFnsbxYrMCEs8BJ0JLtN62xhBp3ay0/8V2fxnQiuv1RDGuhSkR47j6yhyQ1TBgve7HC+Syx+Xvwei6jZA2W0Q5svbGHZAB+4XO4onW8w1edQHHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=OZNruD5o; dkim=fail (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=BX2s35zm reason="signature verification failed"; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="OZNruD5o";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="BX2s35zm"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 5F67BC653FD
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 17:56:43 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BB0C66075C
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 17:55:47 +0000 (UTC)
Received: by mail.galae.net (Postcow, from userid 0)
	id 3297511D718C1; Tue, 13 Oct 2026 19:50:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791914147; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=6IA45njCs+K8ONeWT2j1aoDtNB0+FUWw9L3He9ST5WM=;
	b=OZNruD5ovXKMIwDgXIEydbjzuffX7P+jOSqeny7xPl3TE5H2dBpx4OjmYeKAlj/mYRoyQj
	CWZ20Y/Vdwo7KsrUl/jBnjefjGhG1CXsfmS9thimSNcDUn4IqTGUHyM7MQXJALwJF4cl2o
	RnXkBGz6EjDy20Zr+hPb7w0NHcD2GJxti+iyI77GAgBDb8578pv4yJdlX9F+Bg9ludcvDf
	rVGq8Vz1jfTZEuMXZSox8I0VAwUjmlsL7w21jqomxyICdWe9+/scuV8hhmg8LGUPylGs5u
	LurNrC6MF2bQ5AXOa3rYlv2MWL7asajvBFSt4unk4JN0Hq0lJXx2zeVJRRx+GA==
Authentication-Results: mail.galae.net;
	none
Received: from mail.galae.net ([172.22.1.253])
	by 9e7fea892943 with LMTP
	id YB3FEpUrxmp1NQ0AtaWaaQ
	(envelope-from <kory.maincent@bootlin.com>)
	for <kory.maincent@bootlin.com>; Wed, 07 Oct 2026 13:23:01 +0200
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 90EDF11D5011B;
	Wed,  7 Oct 2026 13:22:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791372180; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=PvKbS35WCOo741y4COP9Dw8++nPpWhukTi3m3k0URa4=;
	b=BX2s35zmkef7Sd0hozR3MEerPUh9PNugMMxhrJSYacDtHw6B6CaRddr7h/Vj4ELoYsW2PX
	dNfWX5KT0tPIYItO/7rQaJOqTGzOHCcAxzfznmT2WeF8PmBUBNiGlDXCjgSp7H8kba0se7
	bAX0oUvspDTjjIc3zY6v2GBf1PMzIuzoWI/mn7RCgtg7efTOgMYjJDvHqIXA4PLsDrdOnf
	bL/bxb7yDYjl0Gyz4KPA0uLBvD0RfrprksbARuYMz+KXXL+gvZBBDbedjC3D2MHsRrsyL1
	QcuG5IvKuwJPX2GbuKjw74wU7rms2yhkwyB5NYbReYAdv1Lq9dJ9/ugjJqNvNw==
Message-ID: <a259892d-1b6b-4caa-82d3-ba24efd5a409@bootlin.com>
Date: Wed, 7 Oct 2026 13:22:49 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Linux)
Subject: Re: [PATCH net 0/3] net: freescale: fix PTP_EXTTS_REQUEST2 for QorIQ
 1588
To: vjardin@free.fr, Yangbo Lu <yangbo.lu@nxp.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Richard Cochran <richardcochran@gmail.com>,
 Jacob Keller <jacob.e.keller@intel.com>,
 Claudiu Manoil <claudiu.manoil@nxp.com>,
 Vladimir Oltean <vladimir.oltean@nxp.com>, Wei Fang <wei.fang@nxp.com>,
 Clark Wang <xiaoning.wang@nxp.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, Ioana Ciornei <ioana.ciornei@nxp.com>
References: <20261006-for-upstream-qoriq-ptp-extts-flags-v1-0-b4a161b92832@free.fr>
From: Kory Maincent <kory.maincent@bootlin.com>
Content-Language: en-US
In-Reply-To: <20261006-for-upstream-qoriq-ptp-extts-flags-v1-0-b4a161b92832@free.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-Last-TLS-Session-Version: None
X-Rspamd-Queue-Id: 3297511D718C1
X-Spamd-Result: default: False [2.51 / 30.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DATE_IN_PAST(1.00)[150];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_NO_TLS_LAST(0.10)[];
	XM_UA_NO_VERSION(0.01)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	BCC(0.00)[];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[kory.maincent@bootlin.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[netdev];
	RCPT_COUNT_TWELVE(0.00)[17];
	DKIM_SIGNED(0.00)[bootlin.com:s=dkim];
	FREEMAIL_TO(0.00)[free.fr,nxp.com,lunn.ch,davemloft.net,kernel.org,redhat.com,gmail.com,intel.com];
	MID_RHS_MATCH_FROM(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	URIBL_BLOCKED(0.00)[linux.dev:email,bootlin.com:email,bootlin.com:mid,bootlin.com:url,localhost:rdns,localhost:helo,galae.net:url,intel.com:email,nxp.com:email,lunn.ch:email,davemloft.net:email];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MAILCOW_DOMAIN_HEADER_FROM(0.00)[bootlin.com];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000]



On 10/6/26 15:34, Vincent Jardin via B4 Relay wrote:
> Since commit 7c571ac57d9d ("net: ptp: introduce .supported_extts_flags
> to ptp_clock_info"), the PTP core rejects every PTP_EXTTS_REQUEST2
> request for a driver that does not set .supported_extts_flags. The three
> users of the QorIQ 1588 (dpaa2-ptp, enetc, ptp_qoriq),
> so linuxptp ts2phc cannot arm their external timestamp inputs.
> 
> The timer timestamps the rising edge only, since ptp_qoriq_init() clears
> ETEP1 and ETEP2. Each patch declares PTP_RISING_EDGE | PTP_STRICT_FLAGS
> for one driver.
> 
> Patch 1 fixes the failure seen on an LX2160A board.
> Patches 2 and 3 are build-tested/code review only.

Reviewed-by: Kory Maincent <kory.maincent@bootlin.com>

Thank you!
-- 
Köry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

text:
Message-ID: <a259892d-1b6b-4caa-82d3-ba24efd5a409@bootlin.com>
Date: Wed, 7 Oct 2026 13:22:49 +0200
MIME-Version: 1.0
User-Agent: Betterbird (Linux)
Bcc: kory.maincent@bootlin.com
Subject: Re: [PATCH net 0/3] net: freescale: fix PTP_EXTTS_REQUEST2 for QorIQ
 1588
To: vjardin@free.fr, Yangbo Lu <yangbo.lu@nxp.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Richard Cochran <richardcochran@gmail.com>,
 Jacob Keller <jacob.e.keller@intel.com>,
 Claudiu Manoil <claudiu.manoil@nxp.com>,
 Vladimir Oltean <vladimir.oltean@nxp.com>, Wei Fang <wei.fang@nxp.com>,
 Clark Wang <xiaoning.wang@nxp.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, Ioana Ciornei <ioana.ciornei@nxp.com>
References: <20261006-for-upstream-qoriq-ptp-extts-flags-v1-0-b4a161b92832@free.fr>
From: Kory Maincent <kory.maincent@bootlin.com>
Content-Language: en-US
In-Reply-To: <20261006-for-upstream-qoriq-ptp-extts-flags-v1-0-b4a161b92832@free.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 10/6/26 15:34, Vincent Jardin via B4 Relay wrote:
> Since commit 7c571ac57d9d ("net: ptp: introduce .supported_extts_flags
> to ptp_clock_info"), the PTP core rejects every PTP_EXTTS_REQUEST2
> request for a driver that does not set .supported_extts_flags. The three
> users of the QorIQ 1588 (dpaa2-ptp, enetc, ptp_qoriq),
> so linuxptp ts2phc cannot arm their external timestamp inputs.
> 
> The timer timestamps the rising edge only, since ptp_qoriq_init() clears
> ETEP1 and ETEP2. Each patch declares PTP_RISING_EDGE | PTP_STRICT_FLAGS
> for one driver.
> 
> Patch 1 fixes the failure seen on an LX2160A board.
> Patches 2 and 3 are build-tested/code review only.

Reviewed-by: Kory Maincent <kory.maincent@bootlin.com>

Thank you!
-- 
Köry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

text:
Return-Path: <netdev+bounces-342316-kory.maincent=bootlin.com@vger.kernel.org>
Delivered-To: kory.maincent@bootlin.com
Received: from mail.galae.net ([172.22.1.253])
	by 9e7fea892943 with LMTP
	id UHMYGtM3xmrHxw0AtaWaaQ
	(envelope-from <netdev+bounces-342316-kory.maincent=bootlin.com@vger.kernel.org>)
	for <kory.maincent@bootlin.com>; Wed, 07 Oct 2026 14:15:15 +0200
X-Original-To: kory.maincent@bootlin.com
Received: from smtpin-01.galae.net (smtpin-01.galae.net [51.159.2.148])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.galae.net (Postcow) with ESMTPS id 01B0911D50173
	for <kory.maincent@bootlin.com>; Wed,  7 Oct 2026 14:15:10 +0200 (CEST)
Authentication-Results: mail.galae.net;
	dkim=pass header.d=bootlin.com header.s=dkim header.b=BX2s35zm;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1");
	dmarc=pass (policy=reject) header.from=bootlin.com;
	spf=pass (mail.galae.net: domain of "netdev+bounces-342316-kory.maincent=bootlin.com@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="netdev+bounces-342316-kory.maincent=bootlin.com@vger.kernel.org"
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com;
	s=dkim; t=1791375311;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:
	 list-unsubscribe:list-subscribe:dkim-signature;
	bh=PvKbS35WCOo741y4COP9Dw8++nPpWhukTi3m3k0URa4=;
	b=0yhkHEgiICxNRjk62IuxxGjduWVV1wN4wVmRxRNSohv5Tm63DkwFV6mLaZmimr8/NnRP3+
	9la/FkwEEVyKpi91bVAhTiFutd/7O7yWZ7MuPCC2ZiHJNuJlMn60x/ahU0zM+757o0Oymt
	a2ltDrPBJpYtAwpy0mMStZXV+pOBzRvk6XRdSzrLDBTobSyJYaqJHANkEDfM170w4c+hBR
	CpOeBmV5Xs5s5Bl/kRuOrguDZxSZ62RvUm1IPHEb650i+RcwH9f4o70uxKwqjj6PJRsRX4
	GBmasQBpvbwSQvFlSny0OlQSAS534krbzSLbmgn3AZs3Qp9qC5u3ox9HPuI3sw==
ARC-Authentication-Results: i=2;
	mail.galae.net;
	dkim=pass header.d=bootlin.com header.s=dkim header.b=BX2s35zm;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1");
	dmarc=pass (policy=reject) header.from=bootlin.com;
	spf=pass (mail.galae.net: domain of "netdev+bounces-342316-kory.maincent=bootlin.com@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="netdev+bounces-342316-kory.maincent=bootlin.com@vger.kernel.org"
ARC-Seal: i=2; s=dkim; d=bootlin.com; t=1791375311; a=rsa-sha256; cv=pass;
	b=DeCJhqJTpIlMrLrjUHS+c9rAees+Ku6qXSBBl7kjqZw9oWLDbdFe1wEDJSamfAX+HK13tr
	r61x0ZUJTVB4NFoRkcTUp1MLnL1FYwQ5g+t6W9GcvVQBmxMPOErpI6QhO8ZOklbLDvf0EZ
	ICAf0HPvIfk5QJQ75C9suU8f4MFSlZubV4UrTLeHD70Xc5N0Hx2F+8HJ8nkdV/DMgHOqPa
	hAw/eVoYE1Y+RmUM1lI04+Le14rkkbqomeykMUWVviKsPu0XFu+U6Dh3iF8gKqEEVyc0gZ
	m+e3q7GpivRcAF5Df7apnn0efZzmUbRKgj+EKJPBt25W6AzRZsuXeSKOfw3iow==
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by smtpin-01.galae.net (Postfix) with ESMTPS id 5F46C340C98
	for <kory.maincent@bootlin.com>; Wed,  7 Oct 2026 12:15:10 +0000 (UTC)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 32EB863063
	for <kory.maincent@bootlin.com>; Wed,  7 Oct 2026 11:30:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 316384908DA;
	Wed,  7 Oct 2026 11:23:28 +0000 (UTC)
X-Original-To: netdev@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C68CF48D864
	for <netdev@vger.kernel.org>; Wed,  7 Oct 2026 11:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791372205; cv=none; b=rxSepAA7qUBkIoBbeR3yfPw5CGNxeyTi4VaHLMb/luddLdifsv+NVMBXRj1BrZeTPV8UG8iuikbimTP8VpgZJSSV5jUzsa0Gw2YRtaPGC81aWsnfmYhvEcCK1zKpYu5pz4vrZ7MhE8x9dk5/EcmOBKER9pPVm6qh7imhUyX9YVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791372205; c=relaxed/simple;
	bh=h8d/UDxIiosp7oKyeZyf8gbt0wo0wMFoYO35PxF2CZg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pGNWxW2ydr/TsctW+3e5qKMSINpTJ6qFNnVYXe0bd0Zduu+AdTm2JdiZWFWWvzIkB2+s/xeKfXjU1ONio6bqRhuNLU969dVLEvkLLXcXRPphbSGXEsKnSqApSKQXUPOhL1ALs+DqJrlFSR/E7yS/TXyWv6GiQTIUBTjfacJ2ftY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=BX2s35zm; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id CE30C1A1152;
	Wed,  7 Oct 2026 11:23:01 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 91A8E6074B;
	Wed,  7 Oct 2026 11:23:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 90EDF11D5011B;
	Wed,  7 Oct 2026 13:22:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791372180; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=PvKbS35WCOo741y4COP9Dw8++nPpWhukTi3m3k0URa4=;
	b=BX2s35zmkef7Sd0hozR3MEerPUh9PNugMMxhrJSYacDtHw6B6CaRddr7h/Vj4ELoYsW2PX
	dNfWX5KT0tPIYItO/7rQaJOqTGzOHCcAxzfznmT2WeF8PmBUBNiGlDXCjgSp7H8kba0se7
	bAX0oUvspDTjjIc3zY6v2GBf1PMzIuzoWI/mn7RCgtg7efTOgMYjJDvHqIXA4PLsDrdOnf
	bL/bxb7yDYjl0Gyz4KPA0uLBvD0RfrprksbARuYMz+KXXL+gvZBBDbedjC3D2MHsRrsyL1
	QcuG5IvKuwJPX2GbuKjw74wU7rms2yhkwyB5NYbReYAdv1Lq9dJ9/ugjJqNvNw==
Message-ID: <a259892d-1b6b-4caa-82d3-ba24efd5a409@bootlin.com>
Date: Wed, 7 Oct 2026 13:22:49 +0200
Precedence: bulk
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Linux)
Subject: Re: [PATCH net 0/3] net: freescale: fix PTP_EXTTS_REQUEST2 for QorIQ
 1588
To: vjardin@free.fr, Yangbo Lu <yangbo.lu@nxp.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Richard Cochran <richardcochran@gmail.com>,
 Jacob Keller <jacob.e.keller@intel.com>,
 Claudiu Manoil <claudiu.manoil@nxp.com>,
 Vladimir Oltean <vladimir.oltean@nxp.com>, Wei Fang <wei.fang@nxp.com>,
 Clark Wang <xiaoning.wang@nxp.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, Ioana Ciornei <ioana.ciornei@nxp.com>
References: <20261006-for-upstream-qoriq-ptp-extts-flags-v1-0-b4a161b92832@free.fr>
From: Kory Maincent <kory.maincent@bootlin.com>
Content-Language: en-US
In-Reply-To: <20261006-for-upstream-qoriq-ptp-extts-flags-v1-0-b4a161b92832@free.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-Last-TLS-Session-Version: TLSv1.3
X-Spamd-Result: default: False [-2000.46 / 30.00];
	MAILCOW_WHITE(-1998.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	IP_REPUTATION_HAM(-1.41)[asn: 63949(-0.40), country: SG(-0.01), ip: 172.234.253.10(-1.00)];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	BAYES_HAM(-0.39)[71.86%];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	XM_UA_NO_VERSION(0.01)[];
	HAS_LIST_UNSUB(-0.01)[];
	MX_GOOD(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[free.fr,nxp.com,lunn.ch,davemloft.net,kernel.org,redhat.com,gmail.com,intel.com];
	MAILCOW_DOMAIN_HEADER_FROM(0.00)[bootlin.com];
	RCPT_COUNT_TWELVE(0.00)[17];
	TO_DN_SOME(0.00)[];
	RCPT_MAILCOW_DOMAIN(0.00)[bootlin.com];
	MIME_TRACE(0.00)[0:+];
	BCC(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	URIBL_BLOCKED(0.00)[bootlin.com:mid,bootlin.com:url,bootlin.com:email,bootlin.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	RBL_SENDERSCORE_REPUT_BLOCKED(0.00)[172.234.253.10:from];
	ARC_SIGNED(0.00)[bootlin.com:s=dkim:i=2];
	DNSWL_BLOCKED(0.00)[212.83.136.155:received,185.246.84.56:received,212.83.139.233:received,100.90.174.1:received,172.234.253.10:from];
	NEURAL_HAM(-0.00)[-1.000];
	MID_RHS_MATCH_FROM(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kory.maincent@bootlin.com,netdev@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-342316-kory.maincent=bootlin.com];
	DWL_DNSWL_BLOCKED(0.00)[bootlin.com:dkim];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[bootlin.com:+];
	TAGGED_RCPT(0.00)[netdev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	EXTERNAL_RELAY_AUTHENTICATED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 01B0911D50173



On 10/6/26 15:34, Vincent Jardin via B4 Relay wrote:
> Since commit 7c571ac57d9d ("net: ptp: introduce .supported_extts_flags
> to ptp_clock_info"), the PTP core rejects every PTP_EXTTS_REQUEST2
> request for a driver that does not set .supported_extts_flags. The three
> users of the QorIQ 1588 (dpaa2-ptp, enetc, ptp_qoriq),
> so linuxptp ts2phc cannot arm their external timestamp inputs.
> 
> The timer timestamps the rising edge only, since ptp_qoriq_init() clears
> ETEP1 and ETEP2. Each patch declares PTP_RISING_EDGE | PTP_STRICT_FLAGS
> for one driver.
> 
> Patch 1 fixes the failure seen on an LX2160A board.
> Patches 2 and 3 are build-tested/code review only.

Reviewed-by: Kory Maincent <kory.maincent@bootlin.com>

Thank you!
-- 
Köry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com


