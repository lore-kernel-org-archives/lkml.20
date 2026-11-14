Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=44.202.169.39
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794674895;
	b=PyIkT3aPe1B1z1Mv/3lZMKPDjYD/0IGkDdaetZvQMJZVcm7kSxnG7Z3tqcyzoT3THkw3
	 4EisGnGZ14TN+1IWJuWwLOPH0qKEa+sE9Inw3MIFN3xhTVICjbZYbWKyQ/rSyj+nKA5Ar
	 /HwAepM8Y9IfDPQi/fH7oDhMAWZoBEL2vKCKhOClRuUJzUw8FtTjAMuuIPE9r4KvGivHU
	 Tg0S50+XAhQZlbeUIMJ1OB1TAhGuB5S/1jcc2a66RTr5nctz3sgs9QoO9I5zVEIWFLGL0
	 4QkE3uqFmw2seRUnZeQrQby/k1aQ2wjOHcLuPBnb6IZT2muE1QKeRA5TEgo5eY21IaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794674895;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:
	 X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=g/WOkBC9oooEcGEsmNj6CUsgiTKwZCs78ZjQCVM3bLg=;
	b=ddbszMVBQqF825iJ0Ddbs7mp0limj+S219dVtefAEPyHN44QeCxI5xt6/XfzfuB9tExN
	 BcT7GCJl/gqZapbXbIRLdLrvnh/Rg5bZHhph5hoB+NbwJq7EO8kkkB7ZMBjzRb4ip+fA6
	 OnQTLJ5RZIShzthSy0m+n0a2IqCcFsIdk3ulL+uUfHOO4aHLkF2pg3EJUhGQvSuT6BMiM
	 i3JBUNhgwqyV+FhcW5K7HMHKoPkE62nivxD/7DxUfEqIhRgNrYoRCU0BdRlWeTQx7yoNw
	 RDZJPWmQaqn9n0PCDwIIKzhzNoRle4qJU5jI99UWQ44pqzfrEKwwvBiXQbhVPuLuu2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=LQef3x9T;
	arc=none smtp.remote-ip=44.202.169.39
Received: from omta040.useast.a.cloudfilter.net (omta040.useast.a.cloudfilter.net [44.202.169.39])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0187C606A32D
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 16:48:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0187C606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=LQef3x9T
Received: from eig-obgw-5003b.ext.cloudfilter.net ([10.0.29.155])
	by cmsmtp with ESMTPS
	id SBzgxa7FkOOJnSGvGxvDhh; Sat, 14 Nov 2026 16:48:14 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id SGvFxzn2QSgq1SGvGxToCc; Sat, 14 Nov 2026 16:48:14 +0000
X-Authority-Analysis: v=2.4 cv=c8KrQQ9l c=1 sm=1 tr=0 ts=6af890ce
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10
 a=am1Lr7bG9l61o50XTrMA:9 a=CjuIK1q_8ugA:10 a=mshYcpSARKEtRsk-hzoo:22
 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
	:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=g/WOkBC9oooEcGEsmNj6CUsgiTKwZCs78ZjQCVM3bLg=; b=LQef3x9TKxEsj/azRFTjtluC2A
	s9zWVsXiEKhkKDKbC3ASHmTxXKKfbbaoJ+ZUcMOvr2ZqpgTb9nr4nvWGPhLh+BOeEoeqna1xX+FGw
	NgZJvmv3rYfMdsIS2IhQe5EWmw1N8jYpZhMT5Y8jYVwKk6ogZri5dPExhkiF8gSKk6tjRshQIpOoB
	qCw/jm8tRvGA+ry2m+378tKVRygHN0vy4bb2osa2DmDP1JSHRvXxezRyNhD/RB0GZBZ5Rd63wClKC
	J72oFY/vTYwoWGWLdzhk18tfR5Bm2+An1vX7YGbaSquAHIF18wdDjGrZQw05x/+BMdtEwb+9O3ZB1
	Pe7HoFLQ==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:34036 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xSGvE-00000000MIg-2pOP;
	Sat, 14 Nov 2026 22:18:12 +0530
Date: Sat, 14 Nov 2026 08:48:11 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Robert Marko <robert.marko@sartura.hr>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	corbet@lwn.net, skhan@linuxfoundation.org, rdunlap@infradead.org,
	nicolas.ferre@microchip.com, claudiu.beznea@tuxon.dev,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, luka.perkov@sartura.hr
Subject: Re: [PATCH v3 3/4] hwmon: Add Microchip LAN969x fan controller driver
Message-ID: <118d242e-6511-4374-acde-80efbe7bbc34@roeck-us.net>
References: <20261111161619.232141-1-robert.marko@sartura.hr>
 <20261111161619.232141-3-robert.marko@sartura.hr>
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
In-Reply-To: <20261111161619.232141-3-robert.marko@sartura.hr>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xSGvE-00000000MIg-2pOP
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:34036
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 118
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfP/mYGvNz8xChfIdZS9+FqJpTFCmuK+Zs/OsAVGGS53JVlNDcAQwLyjMnPVOuqPtQHxqZ7vC4jkt2+L8puXOLfyl5fdA7mHJAoX9WWFN/TfB137WLw7/
 /KBAs4tL33E5uKNDfif4LTumqtKQS1fLSuB4Kho69vhZ/TUwEz39khOeLVUHOKPaIzfxeoAn/bCJ4ki/mtK4OxmbTcHXxZHI9k5omuavCTMtkyK6kX3+Jnn/

On Wed, Nov 11, 2026 at 05:12:47PM +0100, Robert Marko wrote:
> The LAN969x fan controller has its own register block, separate
> from the Sparx5-compatible temperature sensor.
> 
> Add a dedicated hwmon driver for tachometer, PWM, and thermal cooling.
> 
> Signed-off-by: Robert Marko <robert.marko@sartura.hr>

Applied.

Thanks,
Guenter
