Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.154
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792644316;
	b=tXV6veH9Psg38QukNDjpHghJnlF4vm0/lvxayNaSvXVGWXlmEkhdgFMkerBDX7bp4BVU
	 Lz/MI2FK2Pn77lS/6vRDaNq3vEFuxsEeBL6BnpfFF+d+Uozx2BHHhkmNpjUmcJSj71ncN
	 nJImuqmKb5foKV0C5ZcROPebvo+dYFZXU+7pu68FssKVZZVnolWHsUb3rrf5pfDVXUkKD
	 QEIr/W0yEuqzstw+4iwK4uUQa3dZ921UP8eKC5swMZJot1vXyWIX8OXnWm7tTr7nxE/uF
	 j3EtMhvGgAE1sGoTTsDFMwO37OohJ/ZuP84FQoBcDNTz7pzETNICaaszktd2wdo8LXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792644316;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=dRfdmrRzUcc8FBDDR8w5ilifQ7qCv8l38OpmivOBfdo=;
	b=OLutArPiiwJrwJvzeEdnQvyeaM8kd6ZcHyvdChXgvcB3deQF1k9r3kAzhhKeQqZFfeZy
	 a99ZlQS4ZM0vMGP/w9QwXQKB7xgyBD7bhWIQvU28+GGC4ef5SzmgM2yNsRCKXo4hKUjSR
	 8+C3YNkQ6l5S1t6O5/WWkEo1kpFai74jFLZOqpe0j8z3bXYNS+jnlg3ChKU3NHFl5FHT1
	 xh8S9q12umsDCbyT0YACmKT0E2JxPXXjwzaK4yBz/YLteIvYptNsydpuffR1Q1lqF/YRT
	 Kdl687zwsZ8D6etTd7PIcWpnpSOjWgrAp74gj4g6SUFZTTHGJtlUJxrNEAFErXb5Y9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kroah.com;
	spf=pass smtp.mailfrom=kroah.com;
	dkim=pass header.d=kroah.com header.i=@kroah.com header.a=rsa-sha256 header.s=fm2 header.b=MBzYWAKv;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=QNazrkwv;
	arc=none smtp.remote-ip=202.12.124.154
Received: from fhigh-b3-smtp.messagingengine.com (fhigh-b3-smtp.messagingengine.com [202.12.124.154])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BCA2606A328
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 04:45:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9BCA2606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kroah.com header.i=@kroah.com header.a=rsa-sha256 header.s=fm2 header.b=MBzYWAKv;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=QNazrkwv
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 16FE17A00FF
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 00:45:15 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Thu, 22 Oct 2026 00:45:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1792644312; x=1792730712; bh=dRfdmrRzUc
	c8FBDDR8w5ilifQ7qCv8l38OpmivOBfdo=; b=MBzYWAKvABiP6lK/PW5XgkudQ6
	4ik+J7zUoY1tc9gj3yepyRlbj2AqUOde+m56+avYWQ/pkwVKD6GZS8ns4msLU+1Y
	dbtyGvAq43dFg6pSZRMdu37Y/ljY2w10zcUDC5aVnZUKPrUc1Q6PAlYg9UbVtOe5
	aQqHaYRCf2B6uJBljhso4jYb2CJ3T3Scb/bHCTTQk0mbdt2k3zSV1NPtGCoODnlR
	G6PIjAMmTRcQU5gXH6u8eP+3rtD5i/Pr/XejosE/yOpQ71oXsZ33m4aeK4aWgYUZ
	PO5/ACRlAf+J/5ReWzPBiMBgWxg8rK08Sofoi3+PYopPDOijT3ABZt2QNRPA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1792644312; x=1792730712; bh=dRfdmrRzUcc8FBDDR8w5ilifQ7qCv8l38Op
	mivOBfdo=; b=QNazrkwvracX757UGe087SRtqy0IhFi4BaTqGkQpM59hoJBWDyt
	ubi6np0dPw6Fqfo56uiAJh93ugC1CvVSU5vwCfl4hXdbnfwetZhKvg5zjSBnoTh0
	jmXwcytG836mlL+6umar99MRcwYw2AQMBCVynS8EmU3c0+/K7JcS8z8QYRPcfB1B
	Wfz6WDz0ePya9WhpX8aP8jHLFmGcqRJkl5kbWyVWNAd26O/saC0I4tyLrdmCsszY
	Zyic3/Q/wRju53atC8P9mP0bBp9UEDlZzadkeSrHMKuNycVAjeZfBOQcWV2XatDO
	0m6YfjqP2IoE7UL+b1xLoOTHywa2zlnmxnw==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=sign d=kroah.com a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1792644312; d=kroah.com;
	mf=PGdyZWdAa3JvYWguY29tPg==;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm2:rsa-sha256:rOBy7DrI99KqCcFv0qFG28INBrn7t9GIBeUYY4EemKmlnsG
	uxfWgd3SS5Yv7qLrSmwsxbdxWvBPT3NSCZQE92jW2u6BgqVsDq1zDyIkFZk9OORZ
	q4sNITG1CIr7oDr1IoiZPhrli11fvMQaE70lBH+aCubeEXUKrv/Ti0KQibNVvdhl
	q8v/AhKSkt51UVBwkdf6TZn1/w5/SdvQx6jibHb2q+pCpehpltiwqv3om6/4Zv1l
	0CVmbdXHkUydoHKNPsAB5+Q/S55VOT5xqnBXvgC08hSBVHr1jSEOTmrsWgrXNnRJ
	CSwjG70iIIfpF5YPzMfuxNpQJdtonl+UjLBLaSw==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-disposition,content-type,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:anSg47xLwUn3hN5HkxOCR3bSMijeTxQ9konbwJ0+qBk=:dRfdmrRzUcc8FBDDR8w5ilifQ7qCv8l38OpmivOBfdo=;
X-ME-Sender: <xms:2JTZasuzUh28fkm4pqMMx7I60Qwls6DSpZZo1JHUfw14KJAmRnqDqQ>
    <xme:2JTZal1vw9NNZp-XaZsBQWKGWRnZ_K2k4Zpxm3uUaHMuhxMJ32OAeHYQlNe2GLsEq
    nwfLJiEL9dnu7QvEpSlId58c56tRa95yGaRikz-yqZ57nf5Qw>
X-ME-Received: <xmr:2JTZasOJu1LUfZV0sFg1w3PB4heOin-u_cRs344UuihYZgtDAnzHA8_Hj8lIY-koGxwrlEa_sIlPURUq0gs>
X-ME-Proxy-Cause: dmFkZTEMJ8jUayE0SkYB60BWWXFMhYpucllnxsu4phTjqCCNrJeQuSu8elHsUInL677RtU
    cwdERPrgcA42kg0PHszTja19jS0ahLyGEJdpJnCh8a5bbhcWzIt0O2UhSYoOdXOC2WEhlF
    NvByIgS2LziD0NBL763v2GR7nCG/Nfh0LWK2FGcplIUwLtEd6T5Dzqf6xPhr7P+NReKlDc
    yV4n1mniu4z9ohJqo2lXjBwNeb8xjHQbaHz0DxzJFGusD1NFyy6u6HteMhWMmLXEYVJurz
    7wMHwLJAPXBIXUDxDw1EFKUOlLXX5hVYkbtFIfkCpLHKSIQt9EbgisIcaybmMcU54cgst0
    IyZHMmzKmVptB1hYyoH0y8U3RD8O4x7M+LYUhMslZyZ7TIdtPPnOsQUX0jkmangUsRqRcD
    G405wfyoSxQ45FTl+tek+Y/VF7cAYehNloImN0UsMYbxtbPCQxBs817jVvExv4IegpqZwn
    dwht0ET35xcjz3Qaya8okS7MyTzaqAx3nXaExgFOHnwkJBGndM/qod1kqTuCV0HaeXhbml
    e6MeII7+eSRFLfVuiL2sOYx/+MYAU8V+KePkl8VS8x7mGFdZVeFsBzrWQEseift6RXVpon
    yg0CAzN0ObiwUW4tcRPK4g7NdIoc18E9C8gWMbBBmw5z7vUQapS/S81MH93A
X-ME-Proxy: <xmx:2JTZatXul1hneuVJWhYY2enNfcSZAd19KGPYPakrIfha9pd4fZAbgA>
    <xmx:2JTZapauZsgoRC8ttv9h07QwHWIwrowMPOPpH0WxDJ6ofYEJHsVpfA>
    <xmx:2JTZav09QrZxEAmdadoQhvuuyUm_CxMTnw6dCBztpCFJOEF4HAvrUA>
    <xmx:2JTZatC3TD0tFx1A2WtSx8vVYB-If6hOm28_ACBSIcMPZRUZmK8-ZA>
    <xmx:2JTZat6269rAKQNxPGOPY_kfbHNOpVIao61S6u94K7dFmjfPpjpdoaGJ>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 22 Oct 2026 00:45:11 -0400 (EDT)
Date: Thu, 22 Oct 2026 06:44:40 +0200
From: Greg KH <greg@kroah.com>
To: "zdi-disclosures@trendmicro.com" <zdi-disclosures@trendmicro.com>
Cc: "security@kernel.org" <security@kernel.org>,
	Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>,
	Chaitanya Kulkarni <kch@nvidia.com>,
	"open list:NVM EXPRESS TARGET DRIVER" <linux-nvme@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: ZDI-CAN-34076: New Vulnerability Report
Message-ID: <2026102226-duly-imprison-a2c1@gregkh>
References: <BYAPR01MB3830CA9B77EC6FF73C27C2AF80662@BYAPR01MB3830.prod.exchangelabs.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BYAPR01MB3830CA9B77EC6FF73C27C2AF80662@BYAPR01MB3830.prod.exchangelabs.com>

On Wed, Oct 21, 2026 at 09:27:25PM +0000, zdi-disclosures@trendmicro.com wrote:
> ZDI-CAN-34076: Linux Kernel nvmet Get Log Page Use of Uninitialized Resource Information Disclosure Vulnerability

Again, no patch, and sent to a public list?

Please fix your submission process...
