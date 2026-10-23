Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.117.254.33
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792771833;
	b=Gj468hJcLP9FbB8Sh+FHDwWeY07G5TTOGM+6VJo1+n8s6KSVDg1oU7X6syQ4D6LO7MYu
	 GEM9/bi4y0TDMT5bU/ieiuvouSk3ZhvVHAMH5lD/6Jr2y69ih3F8+O/sctMfPGW0jI9Dz
	 hau6KMpNJnbPjDeIfhvjqVAAxdr3A4XDXCfb1yV3xF1MXPhaSZzckzXVbMhC231q9ljkD
	 fRce6Vs3TxKz9FDNWJWPsSgbultxOiUt9rmJAsKp/JZM392ivzvY33LQXXqCev0nyxbd6
	 Gv6OrZJo8/Gbwt/wTKmJdcQlOgQa6CPil32MOKx/lfGI6qywyJL+qAh7PuGzohJONnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792771833;
	h=DMARC-Filter:DKIM-Signature:Received:Received:X-UD-Smtp-Session:Date:
	 From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=D1FYvY8xa3eBJwq7x98AcaY2jEMwwJvfUgH16tTmAHo=;
	b=LQJUdFOC4IUGz540Z3zIPBvpFSRgzZJgr01uBQtQXbgMLKEQIF4RQP0C5FFbWDPD5frd
	 8ej7BJ04Vlh33CorbcV7hBw9mtlJxTjZxfEwMrFmkkKdb4Nof3JIDv2/oaOgGx1N6v3Gg
	 BDu5oQnkbIejSu26am/zBxuJWVAosQtyS6RHSbVHMUpDuA3dlQ5ADhALTvAY6Z1obtoHy
	 BEYi4ipxf0zDF+7Y8SLwBMgTW9SL9x4LZLtcTcdxXNwAasBHr8oM0dY3FR4DgdnXBtVNe
	 SIn0cMVaUR/NcIeSV6nYblEszFWMneUPeW5H4PM6mdBurBJdi+Su/hOghynmXlzlYbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=sang-engineering.com;
	spf=pass smtp.mailfrom=sang-engineering.com;
	dkim=pass header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=fG5I6Lcp;
	arc=none smtp.remote-ip=194.117.254.33
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36621606A320
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 16:10:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36621606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=fG5I6Lcp
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=D1FY
	vY8xa3eBJwq7x98AcaY2jEMwwJvfUgH16tTmAHo=; b=fG5I6LcpkICQfkXa/96c
	EI/d5h7rE+jrkAiIHrUHVAuQsmTS/MjzudQDzrxUJ1XOcaq/oQrFG7pCZqTtmSlL
	2rnjfYR9TIV0LkVR8Xyeotta6MIPBNK0XOljUhvHKJPVQsDi3doJQhAaeCa+ORcq
	RKeCK6pLl/eM/lLKwsgEMGuKN+IYmSzUeXxDRFlsC8N+cK0dOr+po28HVmnBMaV5
	Qph6Tcj3L325iIDLuVIhBGhRSgZHyHQTGQONdIBsQIdtiB6CSbaQgkbIxsfhjMCt
	A5ACH5mBRcTmPFlFvlh+8sQwaSFcWi9wn2m6xwcUkzOlHjyNH1E5unm/hXpLY64O
	2A==
Received: (qmail 1618328 invoked from network); 23 Oct 2026 18:10:22 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 23 Oct 2026 18:10:22 +0200
X-UD-Smtp-Session: l3s3148p1@s0GZN4ReKpIujnv2
Date: Fri, 23 Oct 2026 18:10:20 +0200
From: wsa+renesas <wsa+renesas@sang-engineering.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: "biju.das.au" <biju.das.au@gmail.com>, Ulf Hansson <ulfh@kernel.org>,
	"linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v24 08/15] mmc: renesas_sdhi: Add
 TMIO_MMC_INTERNAL_DIVIDER flag
Message-ID: <atuG7A2N4GChkQU1@shikoro>
References: <20260820171657.62815-1-biju.das.jz@bp.renesas.com>
 <20260820171657.62815-9-biju.das.jz@bp.renesas.com>
 <aplBTMnnF1V71BDL@shikoro>
 <TY3PR01MB1134610EEF7D300BA8890357A86B22@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <atnXz00Hci6R-7Ux@shikoro>
 <TY3PR01MB11346D961A1F5ACA688B78E3886642@TY3PR01MB11346.jpnprd01.prod.outlook.com>
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
In-Reply-To: <TY3PR01MB11346D961A1F5ACA688B78E3886642@TY3PR01MB11346.jpnprd01.prod.outlook.com>


> See patch[1] has relevant changes.

OK, fair enough, but I don't understand the HS400 details yet. Let's
postpone further potential refactoring to the time when we talk about
HS400 support. For the time being, can we change this:

> +		if (host->pdata->flags & TMIO_MMC_INTERNAL_DIVIDER)
> +			clkh_shift = 1;

to

 +		/* internal /2 divider is always active here */
 +		if (host->pdata->flags & TMIO_MMC_INTERNAL_DIVIDER)
 +			clkh_shift--;

so I will hopefully remember these details then?

With that, I think we have all items discussed for this series, so you
should have everything you need for a v25 then?

