Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.150
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793365179;
	b=U1htZ/eyd0mabgoCiuyS+v9SA67pQN+Hyd7NekoBeApNL3MNMb8UfGfUnU/r+fAvSRRH
	 We5ld9VcWIVH7ad4z4FcvCuuyhtiDf/Nq1tK3ap7E/AjKDqxT/CU7a60hozcgtgRPQAcH
	 aFxxupOEsnnZ7QyBJo4+wlVrIVf7fSqCS1wBmWE5nWjvx0vFoAhaLsfgnF3ogH1nvz2Nk
	 ymla5MrtEyQh8vgFMxz6xwcHOdYsatxKTrnXp929TIJ6WJYuzpXp+GugUA6kB4GpAfWHz
	 L3JwFu/uRQdYQuz+UiclNq2Uu9hVNjyVn7swFO6u8hX2gF7LanFNnrwjfm/gom+aQFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793365179;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:
	 From:To:Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=T5vOyjmQkdX6CTdipUqsdbTx8Orqo9PvCRWz6qT18v4=;
	b=t4iqWZygzbTdn7iu5UV6bFBvhQmtlqfBb/dauMpaG9S2lj8TQNU53Se56sh0U1Es8RSZ
	 pdsoLv24ysQAZ8gAF8cTP8TyH5hu9UyVPg4h3FdxpBI9G55qpIAQ9bMsFhtvQXhk7ARvn
	 m8uFfb6N4GUvtDZPJ3ASW+6w4Zb4CXgIi90HOTNQhWepkczDWCKLb2ymLS9bSXIQfgK9e
	 antLZnwXhoQS5mu5W2g4UREZRGTy35c/j2XSL/2Zor91ChmPpc2DeLVdtM7MO7DfZFp36
	 +8REpRLf0VX5AE10NJb2iIzj1XdrBourAYQyN3gJcX90cvl1EZSIWRYEazqmM7w2dhA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kroah.com;
	spf=pass smtp.mailfrom=kroah.com;
	dkim=pass header.d=kroah.com header.i=@kroah.com header.a=rsa-sha256 header.s=fm2 header.b=pf4+gZpQ;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=tZkjgE5J;
	arc=none smtp.remote-ip=103.168.172.150
Received: from fout-a7-smtp.messagingengine.com (fout-a7-smtp.messagingengine.com [103.168.172.150])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 984E7606A326
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 12:59:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 984E7606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kroah.com header.i=@kroah.com header.a=rsa-sha256 header.s=fm2 header.b=pf4+gZpQ;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=tZkjgE5J
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfout.phl.internal (Postfix) with ESMTP id CE91DEC01CE
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 08:59:37 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Fri, 30 Oct 2026 08:59:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1793365177;
	 x=1793451577; bh=T5vOyjmQkdX6CTdipUqsdbTx8Orqo9PvCRWz6qT18v4=; b=
	pf4+gZpQcxaEUSOgPgEeCvx++KrIZJIydwoiwkD2gRQSfrF7EvtKsDaUfW66Y9SE
	CrigrjFnK8pHXmphwJyJG5IVO7DEIOO0dfYNb5E409ZCO6aLMkAQD0epcCJCp9x+
	9MWfgcBoGso1Xm4/yguw1gidSXy4QG84MAqnvoz1G3fvf6TqURoJkYz6PWWGAao+
	A2MzoY1Q53duxPGavpIX1PNnJiwG95S7TQ4lsh8flh6TvzxSOm7ebJ9LIILoymbu
	Uz7IkeD7iqgcRkW5AIfPNymyg+sAkzL6tMZseSHSVkppK2AFoihF9VmO5JYGwS9O
	QV2i72WhhCJPXdpHFf0oGw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1793365177; x=
	1793451577; bh=T5vOyjmQkdX6CTdipUqsdbTx8Orqo9PvCRWz6qT18v4=; b=t
	ZkjgE5JcLCp0c4QxkilKh50l0Gn0ELUvdO+A42Fas5efK6JeCovrpuXtUeEVzMs0
	IAkJTQXfXSTlLSFH2tRrBS5H5FvHLAr6ea8O8/A8ECk1XgImTAvQBifjwrDCf02W
	AXR8aU4IGh00P6SrYD/W7/sOY9z/uPU/ZQtUcvFtj7lmcQA7/Zov1AaCYqN1aF8f
	43cosaE08Q5SsoxMWwQR4n3f8A1ai2996v9f1G2vi82AcSC2Ky4+Fxe4wfCzR+BZ
	m4KkglDWxvS//G+xs9oLXkpDTknLItBJColV2YDC/M8RJZ4tL0y37FxjQAwivUzy
	8+lZ7HMe81+u56Nvq4+fw==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=sign d=kroah.com a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1793365177; d=kroah.com;
	mf=PGdyaWZmaW5Aa3JvYWguY29tPg==;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm2:rsa-sha256:pn+K4QKVvdWPSq5osilI0tUuL8XXI+HMGHWq2jFuFQVdziH
	2b8V+NS4deANBrrb00N63JDE19SefB4+TugONku0JhQq4IIXyBboC8OdLX7mhS4T
	+1ImYrQ5btaaYfHN0WDWuUle/hGhETNmwkug8xSq3HuS8q6XtYwpbmjbNS1QqZmD
	vH4E+BOkKOH62EPIcyxcbroa2+C5I2aa0E663bMyphAqllqI35R5jmkx9UhGPdib
	hdXcVtmIS+8eK413oZkGZvIlnux/KLXqK+6cN3zEjbbKJ+UYyzALOyrdieycaX3B
	uA1vElb9F9tvA95aTS2xYVXqVnFVxexu7v9No6Q==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:gAvEzZH/tUYmZXTObsaDG6gX0VQ4Z7C0xR712ksarFI=:PM/e/b4M8eBwqwa4LEXEYBKK3IbDyalnHiqDyIU0kTM=;
X-ME-Sender: <xms:uZTkaqEgaIfA0sEcS7teRio5Obxf6YvscBdL6aQ66F_rfA0vA6240Q>
    <xme:uZTkasD4wXVQt5gXw3ah_6NHa1GaUdw3QvW63PN6dLdJ5yddW169Fw-d5-kBy7C3a
    Vn3qU2n8aj-hN54O_HModWN38HHIG7BAPFUh2BX6a8uSwqnfGw>
X-ME-Received: <xmr:uZTkaiU-yIGncJUDAL_KNgnyOJilpV5mYy0nTyIjZ64GsHeuDYNUFqXvuT8mE-MekqI>
X-ME-Proxy-Cause: dmFkZTE6aoNwjf6q1XwVFOYDqWVswAbbvhU1MKKOEhiShWipsIvaUQavqwUjb0Okah/mrN
    sjjnkd5fvo34Q296/sSgCQV2qOetxNcBfpbzKV9zvLml/TY48d4fqtgMlGJopmC3Y7j+xK
    dI+JSqyeXMUVVx8psGINqkP5jiuL8lJyDPXEcw5opUdah41wZa4o+w4YdfUf87k3ASdy88
    Db8UP1fNSzP+2Ay86VCBj7xJzo6smN9f7jOwroIk9xxbT5ouM81S+geP4cyvadkDjy36y6
    ByybOio/fPvJqn5h6exOYSvWASLoCsLjoibu0VzIFDQfA9zwe3V3FBYBlVETZvhNysfJlv
    0YYdlJnQdUSl8EVD9ydj2C86giIBhti8/WgWBhEDiuBuFFLOYpXk2er5xjqA7cqQ/PLnQW
    1Xr9EeEFf270QCyYugCixkdSBTmyKzmaC6thnPMgqE3hniGIDdHOSMkN5egdVQZPhnRqm3
    dRjlIEXFgqqNW2X/L2sra3QqqUHac89leVv463as4kXLgTYeYU0/kMV5ySiZ6DuhOVKGGs
    DykmE1OZ/O6NOeKWSi6iq8Dhju5OkU5DfTFXtA1ToRXq1OtbGgIYOdnwH0WGcwgCzytMLY
    faaniqoZcbT6scdweWlNJ/E+tJ4hY5xaGxTjwvnc07phVn0Txe31ExBq+A2Q
X-ME-Proxy: <xmx:uZTkaooTgdx1Jxqn0gMRhI7omLWs0fxcXiqcKQdaZBzhlO5l5lqn0g>
    <xmx:uZTkamSplf0w58-xtrpGqffWZzhTqHTuKHMJRskaiAmcPqgQy2ywQA>
    <xmx:uZTkaq3ygd2EOIGoqz-YgmYQY71eh33iA2lfcu-ozuulaa9xpzaeSA>
    <xmx:uZTkaqB_ZGGwTS5XgLSVuMLIDaEN_NTcIc31G9Ev6PBrNPfoUcz3XA>
    <xmx:uZTkamRkhqvp79Ii0DvLUSWQO5sYqMqUZ4u7_xyBT8i660208Bn_vwUQ>
Feedback-ID: i1d2843be:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 30 Oct 2026 08:59:36 -0400 (EDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v3 1/2] leds: lm3532: Propagate enable GPIO errors
From: Griffin Kroah-Hartman <griffin@kroah.com>
To: phucduc.bui@gmail.com
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jacek Anaszewski <jacek.anaszewski@gmail.com>, Dan Murphy <dmurphy@ti.com>
In-Reply-To: <20261021045832.16356-1-phucduc.bui@gmail.com>
References: <20261021045832.16356-1-phucduc.bui@gmail.com>
Date: Fri, 30 Oct 2026 13:59:26 +0100
Message-Id: <179336516658.10571.6179012095955411428.b4-review@b4>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793365176; l=204;
 i=griffin@kroah.com; s=20260910; h=from:subject:message-id;
 bh=PM/e/b4M8eBwqwa4LEXEYBKK3IbDyalnHiqDyIU0kTM=;
 b=/XKjlZ71JhvylRx+RKE7ErF6/5PSFUEMi37foiC1pP2d70eSAreNHJY6p29DZ72VYWXuapM4D
 zIuapbBw3WFBjXNoWYVU2bOzRnrtwDMOBwqLoKzOC6U55CZNFOdd/ZX
X-Developer-Key: i=griffin@kroah.com; a=ed25519;
 pk=HlyUkuZAN9I5qlPbOHN5N9xxdQ5sT6AbPgC4TsLCxzA=

On Wed, 21 Oct 2026 11:58:31 +0700, phucduc.bui@gmail.com <phucduc.bui@gmail.com> wrote:
> leds: lm3532: Propagate enable GPIO errors

Reviewed-by: Griffin Kroah-Hartman <griffin@kroah.com>

-- 
 

