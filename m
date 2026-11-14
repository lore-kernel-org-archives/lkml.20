Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.89.44.33
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794674623;
	b=h5l57GdhWE3VoeXjPRWcFRwOBDrcq8aFe/h7HPJ2B4wFwNvVlkZ9PBYTJuD0OvolebU6
	 tcX8E/W0j3rLuY/iqu8sL7JncGXPTnAtkufHkGt99whMHjlbJfU9KJog7GPtN9vWNgBZn
	 hmHkOyI2cOMaLGx1xtqTL94xniGxVeiD/ob4aPGVikzO77AfZlPM9f1Klnxi/OoWhJZ3i
	 jxjn8K8DHG0UIBPlZql5i7Bw3weigM9MqWaUQFbvYnSSpM3H+XGnyAkgyzeQ3gEctzZxE
	 CRYiJKRPeTPyUCK3QJB/Zfi77UAfMh8GdXoj0AKyp1GydELYkqJXWwIGDQorhVaQnBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794674623;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:
	 X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=oxoLWz+FF4cPmOqHhBP22dzL/yz794wQWR3uP5yvWcs=;
	b=FI+1V15oTySFxxtCdoPF6iYRTGdcIvnp6WcofqcfmdTondSz4E67SWklebL7Lmv6NKJP
	 GDJn7UQicyRTM0NEchqZBhdkXz5ykfgqh8jo1TcJvgSexvMT2VXBrCpwddUkda1Gbyj7R
	 HKuttrplX6bd5WP++8FtojEPffEFyTFs1BXiVBukXPGcMhI+c8JTo2pBOSCdZ3k081gUF
	 nRF1NLR1kUzvHXNT1AK2EvUrxsy2FX42mjjK0yI4lcVsbXKik87IQI24BLi2nhEFYHniV
	 mjiTAr/mrVxkARf3kKtNA4RibO9ZJPuGSnCt8MTuWiWwgYfvnhgG8WmVAWZUEYWqlyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=SVxCG2kr;
	arc=none smtp.remote-ip=35.89.44.33
Received: from omta34.uswest2.a.cloudfilter.net (omta34.uswest2.a.cloudfilter.net [35.89.44.33])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0F28606A329
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 16:43:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F0F28606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=SVxCG2kr
Received: from eig-obgw-5005b.ext.cloudfilter.net ([10.0.29.189])
	by cmsmtp with ESMTPS
	id SBUJxqLBHAR1iSGqsxODxR; Sat, 14 Nov 2026 16:43:42 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id SGqsxwpeFYskhSGqsxZPso; Sat, 14 Nov 2026 16:43:42 +0000
X-Authority-Analysis: v=2.4 cv=CKMqXQrD c=1 sm=1 tr=0 ts=6af88fbe
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=VwQbUJbxAAAA:8
 a=epKNRfmuhR7F8Vwm0QkA:9 a=CjuIK1q_8ugA:10 a=mshYcpSARKEtRsk-hzoo:22
 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
	:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=oxoLWz+FF4cPmOqHhBP22dzL/yz794wQWR3uP5yvWcs=; b=SVxCG2kr7z5DKmWxqdACAVC8tT
	TzjxGc6gS2U69moDMvRhuy6WnbXByk0ENPHIIbUQgYgQ6Er1IqMT9Qaam8hV/MmHhySBk/CLDoiJ6
	r7L+w4voiV/7kzlIKAx0kTxHye5lNYscZ3wL6vug7TA+mtpM8+it9LTXzpfx+lyJgobvyXsswna8Y
	11PTvsi4K8fV+F6d6Ug98pxwPQicoYTxIjI+Tjn1HiKvTR3uMqNWP/AJPl8nRQYO8n8aBRojvQlGy
	eIvYQSdnMPPvXkxPKCQrPjuNXAfZkDk1Kc5ySLpoI8B0zKyVIiQJhZBC04qm8GskMGCdKO2pWaDwf
	fBHA2VQg==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:34420 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xSGqq-00000000JsV-3dMt;
	Sat, 14 Nov 2026 22:13:40 +0530
Date: Sat, 14 Nov 2026 08:43:40 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Robert Marko <robert.marko@sartura.hr>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	corbet@lwn.net, skhan@linuxfoundation.org, rdunlap@infradead.org,
	nicolas.ferre@microchip.com, claudiu.beznea@tuxon.dev,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, luka.perkov@sartura.hr
Subject: Re: [PATCH v3 1/4] dt-bindings: hwmon: fan-common: reject zero
 pulses per revolution
Message-ID: <ce3ad183-3940-40a3-b4bb-c92deb8a7ef8@roeck-us.net>
References: <20261111161619.232141-1-robert.marko@sartura.hr>
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
In-Reply-To: <20261111161619.232141-1-robert.marko@sartura.hr>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xSGqq-00000000JsV-3dMt
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:34420
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 87
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfCBzmDVXIS9qmHnL5UIBeUERo9EfZ8IrybVwyq9tt+sLS+KZCdZX2V7QUsg1rgv0RLLhPXJhcS7Gi2EqQfmnawf1TWQxQPJyIC/dAPRyC3rgdxhxE0W/
 AxatYc0nYY2O6fR8ArQPMrqig/Uz0SyRtNw5HsUiubAkSavkNbm01vIrLy9+yBg0xruKPtqafDI+hk0PZbR1wX/werr/ao5AUVIw4Ma8Juf5dXdgenrwNEJ2

On Wed, Nov 11, 2026 at 05:12:45PM +0100, Robert Marko wrote:
> A fan sensor cannot produce zero tachometer pulses per revolution.
> Add a minimum of one to the shared fan schema so every user rejects
> this invalid value.
> 
> Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

Applied.

Thanks,
Guenter
