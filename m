Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.89.44.35
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794749718;
	b=KkEharXw8kuoOBn1N7UsZOnIYekuEGPwTm/m9JoXhs5KGVz+GUsumqjpzlRFbSwPFu6V
	 Y20OgyH/vQx2F4ZL8vgOwaW8caQ/IF+VGlb0scA+EOEwbXP6p9eyJFq3vyRnHyoBeyfHg
	 hoxiRGNbD36fbF9dSJAQOX8hOH/Yn4LIdoznN9/b4utEt3Q9TyJaJoYUNZ0DIUgPrvvyz
	 oktPdP5H/qfBweX8ifK4bITtrB22vc7E4aJ9DvMarzT/xDjubtnRZGv2ggIRhqtk/c63h
	 npWhObUfNu2AOQxwDyeDlOWAQ90O97telCBN8rTYZQNaMQlb/1PzvMkY1EsQ6cCqtvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794749718;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:
	 X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=aSapEaH/NuRU2jX6S12LQSO8bYKdhcI+xgkonqmfsqs=;
	b=nig2j5rL8t+5Gf/uu6eYCkHLcH62QDdnM32zHycjQtT2ULcqdBIYfUZhsF6jQkFXM5mY
	 OydcJeyixcQMKG4pOy3cUPnTruKDY05GzSEZ5W8DSkPLoemvTqotvp4CEQkziFBXI+0le
	 H0xIfgtP2ed4IqK2051vyJkJaxjl5S9uFrPxMHigZUjVkFbVetYWzEECmHmYc/9kUeDK2
	 Rp8ehfSd+FqRrYkWdBr+k1Bpru61tRLyph/o4y9dISS/OaflNgDM4zSpasyAJxI8C2asP
	 ousU/58Zc7+jjc1W4XFdImONPWQ96OxOdq7F2aH0MRSNy5/ldHnyRd1IPBo3nAj2cJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=f9WBXsKM;
	arc=none smtp.remote-ip=35.89.44.35
Received: from omta36.uswest2.a.cloudfilter.net (omta36.uswest2.a.cloudfilter.net [35.89.44.35])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24C09606A31D
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 13:35:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 24C09606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=f9WBXsKM
Received: from eig-obgw-6007b.ext.cloudfilter.net ([10.0.30.166])
	by cmsmtp with ESMTPS
	id SPjpxIG52RiNxSaO0xGCxX; Sun, 15 Nov 2026 13:35:12 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id SaNzxt5q93nNNSaNzxJH8x; Sun, 15 Nov 2026 13:35:11 +0000
X-Authority-Analysis: v=2.4 cv=TuLmhCXh c=1 sm=1 tr=0 ts=6af9b50f
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=VwQbUJbxAAAA:8
 a=Byx-y9mGAAAA:8 a=YlH-AGZLenAcjOw3p3AA:9 a=CjuIK1q_8ugA:10
 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
	:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=aSapEaH/NuRU2jX6S12LQSO8bYKdhcI+xgkonqmfsqs=; b=f9WBXsKMx+AxcyyUHrh3/0Gv6H
	n9FaCar2PKDAsnj/XFLBflZL/3lYxXy8UXiYLvlDXOS2wjoyTqV5l2PrODsNaJwyXZ22jcLkXLB6h
	A8AiqA0jyaEpX0HBtdSQj2rS4tQlTzHeeBExazgh63F/ghXq2d7XUubsU5UDLInNlPcraL/cTi30L
	P9/HDY8J0fHyFVpxIr+Sf0Tynf6rJGOVVs3UwnqgXsFPfIYg+WehnpZXerdmeCAfBsGbO8iaWAsI8
	oidN3LeLknD06YHwa5dH6y7ghqaSaYApiXjekQNY9shPMaPRkZV8qxwm357X4ufT95OvuUqVIJ2Km
	KRi5yE5A==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:50512 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xSaNz-000000011nP-0obe;
	Sun, 15 Nov 2026 19:05:11 +0530
Date: Sun, 15 Nov 2026 05:35:10 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Ziheng Wei <zihengw03@163.com>
Cc: Marc Hulsman <m.hulsman@tudelft.nl>, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH 1/3] hwmon: (nct6775) Fix incorrect struct cast in beep
 callbacks
Message-ID: <adcfae11-f8f2-477f-bb4d-4512caa089a1@roeck-us.net>
References: <20261115080203.910033-1-zihengw03@163.com>
 <20261115080203.910033-2-zihengw03@163.com>
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
In-Reply-To: <20261115080203.910033-2-zihengw03@163.com>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xSaNz-000000011nP-0obe
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:50512
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 5
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfOsdBYnzebxY6wWVZXNdqrcvwJxNLmni2l4WKYNXzhtZV/8h1FAgdfM/VQ15Ghsd8WCK+gZ1TvmECMklyr0nHmCiRMraggS+4OAGp/Iw+XiWVBXEDi4o
 2kAuWOFAetyXJfvIqGEpX0StGmBRYK2kHz28RTK06G8rCwQs90T3iwfGeKkTF3DJYx81Yry9qDKpud+LwfrQJpjLcz2JqlTgXXoETvK686LbWavsXWt7hceF

On Sun, Nov 15, 2026 at 04:02:01PM +0800, Ziheng Wei wrote:
> On big-endian architectures, writing the in[1-*]_beep, fan[1-*]_beep
> and temp[1-*]_beep sysfs attributes in the nct6775 hardware monitoring
> driver always changes channel 0 due to an incorrect struct downcast in
> the beep store callbacks.
> 
> The driver defines these sysfs attributes using SENSOR_TEMPLATE(),
> which initializes them as struct sensor_device_attribute (where the
> index is a 32-bit int). However, the sysfs store callbacks
> nct6775_store_beep() and store_temp_beep() incorrectly downcast the
> attribute to a struct sensor_device_attribute_2 (where the index is
> an 8-bit u8).
> 
> Because both structs start with struct device_attribute,
> container_of() resolves to the same base address. On big-endian
> architectures, reading the 8-bit index field from the memory layout
> of a 32-bit int fetches the most significant byte (which is 0),
> rather than the intended channel number.
> 
> This type mismatch causes all beep writes to change the beep setting
> of channel 0, regardless of which channel the user targeted.
> 
> Fix the type casts in the two store callbacks.
> 
> Not runtime-tested: the only big-endian machine available to me (s390x
> under QEMU) cannot build the platform driver (no HAS_IOPORT).
> 
> Fixes: 30846993047b ("hwmon: (nct6775) Add support for beep attributes")
> Cc: stable@vger.kernel.org
> Signed-off-by: Ziheng Wei <zihengw03@163.com>

Applied.

Thanks,
Guenter
