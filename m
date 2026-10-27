Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.89.44.37
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793114403;
	b=v4ryW7l+tBnONQUhT/qCmQZXAlgB3oOYvKzFmySq+pullZ+EYlz6p0FZ6u7IHmoPrVbV
	 7JbuHqR094umP7ux06h95tRgXYE18ZudWHvsfMfY60g2tilrBxElobb6I0NiV/O6I8bRP
	 89Ed2l+V8HY3kvhvT6ebyiNz55G4inaRbJECZDRuEr/VLE0M0JJGtNQ/JbUeMvgK3JW+w
	 zoZF5HTnSHGE0Is8TeKydn2ZeWS6byAj9hvCH3Jghf2icxduZJnv02E5N10HC0hQEyCO1
	 emUOkDG54qxpO5A0AIf0g5+LCJjq+MgefduJLCOGD5hWLohzm+TbIFmb8jhILto02VQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793114403;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:
	 X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=6uxXCJf6Z+6uxi+Bb07KWhh91qACRzeIvlcY6VrFK4Y=;
	b=sKEajgOsmwfHDMhwV7UrlLqFniYxWEvg8WigTde5OeAA27xCbzzwBEC1t2HPE9gEMw2V
	 6GapyXGnjwbUfEdE22sWSIovdHzG/gqFHWM9i+8NrPum0mrBlsDbONq9RaYm2NnodzS+G
	 u2Bpdkp7D1IGwI+99SZ/rLaJB1n4lHkj05Oddt8Ypclz6yPJto9zmhPNN9A+WPkKz0kQI
	 S+SFQJR8fg9ZCgQQeZyk4nJMVGg7DcvzRFuVGqfbOTmCXIZI0E++9qNh8k7jJHIQIKxGm
	 FGxoZrPdnCtGI+RYftciT6bRreNYmDVLFQT2qXNOFHwOHkH5yEGMfSTvmgiDL/tDh9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=Ke3dnOeG;
	arc=none smtp.remote-ip=35.89.44.37
Received: from omta38.uswest2.a.cloudfilter.net (omta38.uswest2.a.cloudfilter.net [35.89.44.37])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 748D7606A329
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 15:20:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 748D7606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=Ke3dnOeG
Received: from eig-obgw-5003b.ext.cloudfilter.net ([10.0.29.155])
	by cmsmtp with ESMTPS
	id LhidxxkL8v0ndLiy2xL1la; Tue, 27 Oct 2026 15:20:03 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id Liy1xWBfZf4wOLiy2x2r2y; Tue, 27 Oct 2026 15:20:02 +0000
X-Authority-Analysis: v=2.4 cv=db2A3WXe c=1 sm=1 tr=0 ts=6ae0c122
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=M0FbrtG7MMAA:10 a=VwQbUJbxAAAA:8
 a=pYUB3rPNxVkG2UVf4jEA:9 a=CjuIK1q_8ugA:10 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
	:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=6uxXCJf6Z+6uxi+Bb07KWhh91qACRzeIvlcY6VrFK4Y=; b=Ke3dnOeGR18SxaXLgbUo6skakL
	Bp0OyauSisfTmO7J+1mWYyfg/js5ufkMBPfPINyFK0BuJpab8JFEhaeRpmzi3aZdQxR8i6RvyqHjG
	AqTfAWWs3l2Hkt+r0RhgUoeExO88TZlTzLHA6o8xG52JINgY4R4SJ+ijw0181g7UtZwDUtu+YyooF
	xL/fbhlyOJL1QYIqJYo7okLIPpBUAnK274aKp2gdddNXyRriIeOJwlM73JJnxcxW8acqIfy1pSz5L
	Lo+xB7jNLtNEqRxw6GaqnNa1sRI/Si0hGTl+xNarS7Y6/S7pfwivmZRvs1VASb4zdn+9IcIEYQiVx
	v/tjxoCw==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:37680 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xLiy1-00000000C5w-0nao;
	Tue, 27 Oct 2026 20:50:01 +0530
Date: Tue, 27 Oct 2026 08:20:00 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Robert Marko <robert.marko@sartura.hr>,
	linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: watchdog: add reset-from-wdt-gpios
 binding
Message-ID: <fc628fe8-4ce5-4968-89d8-f934afb3af0f@roeck-us.net>
References: <20261013-v7-3-topic-gpio-wdt-v1-0-bc98f05a4578@pengutronix.de>
 <20261013-v7-3-topic-gpio-wdt-v1-1-bc98f05a4578@pengutronix.de>
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
In-Reply-To: <20261013-v7-3-topic-gpio-wdt-v1-1-bc98f05a4578@pengutronix.de>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xLiy1-00000000C5w-0nao
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:37680
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 1
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfO+C1E7KOEivu6NECKpH0G9Q39r2++ow90+lW7E3guQmip5HEULBBd6iu9c3uXVG0TS2+I7fPOk4gKf9uNY3OKIg6BvSgUn2voyYPD2zIOKU2wYYWprb
 yguqwPFoonIr8mI9Ik/Jz8lc3kbzrx3dpD+7gZqwdtUOn1y/swgtzZZCUw1jeVJK3CHRf5An0ErFBj4zzEP4XhG7cx3B9NfVoQ8/aw8qdaR6bKxMYf2xkvvI

On Tue, Oct 13, 2026 at 07:54:27AM +0200, Steffen Trumtrar wrote:
> A wdt-gpio can buffer the reset signal over the reboot, to signal that the
> reset was issued by the watchdog.
> 
> Add support for a new gpio 'reset-from-wdt-gpios' that allows reading this
> buffered value.
> 
> Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

Applied.

Thanks,
Guenter
