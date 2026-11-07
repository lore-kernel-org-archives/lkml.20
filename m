Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.89.44.33
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794068917;
	b=n4M8AQjPkdYxztf22+bJraLo5IRyxmkBmHJ4MnNb78/wrMWyqRZHQmL1LZNY1WD1oB+H
	 j/qxB4eW4ulw0MwxmUNDL45YhYWdSXbrOwtRKiBSeVG9pJstJAgo89pZbwUCaM01zm6Qn
	 lntY4A7YFzVijA5rfo8RSijgZsgPLYb3iOawa2vXWTLTuSUKA1SiUcmRj7/tAf6zyXMu8
	 TSazg3JdDAECnlZOaAX7RaX/Yr8U0mCcR/RWXTln0W0796S2xThJxWeHCV78XvfyNiEAP
	 24/d8u2Hv9V/QzNjv+sOca2vO79zA96WGbIKQ7JBZVRlxlRPWBm2K98+nH8cKSP2PvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794068917;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:
	 X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=2adKLwCCH4TP3jcaM6L+aOqAWfKa+fYB/l0huExRJ0E=;
	b=pp2vO9NVKFQZZyl3xB0l12FCtZugJ/eZP9zuuBlsUjmg/jUhTDUJu41sv7n5JEzo5RbQ
	 +JosG9LTA8fyIcxfTr/ClXfA2xF+9eYCXj7+XIpt+Wos2tn/a5KwrkOXWb7ohxwNx/KiM
	 nlExM+JcicTrOtzCl+wQ+WvKp6QSTILrbxAFQ9Xpkc5Q0lR8Ys2xc0Wam0JmVusKP2dDJ
	 VE+pmqV5odTBapgCELDZFeiL5jtzeMoRcn0lm3VZAmLjvlXQx2FcfMndHOGf3sOjn2kXL
	 hACY1054SoeVMV5IKYNtlfhN0hXAXktPm8HxBFWpeYizJYuZk0txUyV4HE3dKtSLH7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=m0z2QEZq;
	arc=none smtp.remote-ip=35.89.44.33
Received: from omta34.uswest2.a.cloudfilter.net (omta34.uswest2.a.cloudfilter.net [35.89.44.33])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30CE5606A32E
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 16:28:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30CE5606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=m0z2QEZq
Received: from eig-obgw-6006b.ext.cloudfilter.net ([10.0.30.211])
	by cmsmtp with ESMTPS
	id PNl1xEzRYAR1iPjHRxKfZ3; Sat, 07 Nov 2026 16:28:37 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id PjHPxjGu1FhzrPjHQxQEwG; Sat, 07 Nov 2026 16:28:36 +0000
X-Authority-Analysis: v=2.4 cv=JY+8rVKV c=1 sm=1 tr=0 ts=6aef51b4
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=VwQbUJbxAAAA:8
 a=K08GE0EedfqzNeSu-44A:9 a=CjuIK1q_8ugA:10 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
	:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=2adKLwCCH4TP3jcaM6L+aOqAWfKa+fYB/l0huExRJ0E=; b=m0z2QEZqNUPLKyTSZ7Q3OtbEBk
	+Mpibex5ZtuWQsV5iXNs84GVA4/NNXqrLQGsFPKAWEfIlXAHl7rICzdv7u5pYG2DxAM+x5QRNvot6
	Gux/eNYgpYWUjwjapgJDUXw01BOkikTh/dRYRmnwdhuZF9edAkbc3DoBxXSMneXlNsQ3dJn37ZQPI
	JUNbmK6WVOY6f0o0Fcp07qZj1Y1hvNJCuUZRWvWBEBl3iU2Lubu3TTdu2/egQWIk0cHEcJUAxVdPy
	+ggmQRDbzqxylqLaXDJJzm3ROzT4k/m1U/SAQmsDg3QbhmBU58DY3mscinFKuRCo9Zm1i+hPLrSLE
	APf5zLkw==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:54740 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xPjHP-000000004j5-2WpD;
	Sat, 07 Nov 2026 21:58:35 +0530
Date: Sat, 7 Nov 2026 08:28:34 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Tomasz Bojanowski <tomasz@bojanowski.me>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	Hamza Mahfooz <someguy@effective-light.com>
Subject: Re: [PATCH] hwmon: (nct6683) Remove the 32 mV voltage scale
Message-ID: <6ed8b20b-1c03-45cf-8c0e-70e739a948a0@roeck-us.net>
References: <20261107150619.297999-1-tomasz@bojanowski.me>
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
In-Reply-To: <20261107150619.297999-1-tomasz@bojanowski.me>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xPjHP-000000004j5-2WpD
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:54740
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 3
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfIUBkviV6K+WQ31bXoJWI4tYbYKS+z3u/qjOhuPYHKthWwIBy0Bx1F+Zc59Uiedojh0yEmuq5knKCpvxVIYehDlo38laGJ95s2g9Wp6k5dhL2JgAqELB
 AorngLUQPpJC3z1CIF7+2tY0FEzGY38NNgPJYiQnazR79tB4rm64dGmq1ymaGqSi0D9J/JL4xpFJX7hok0OCxQup1wWgw6UcpZkUz0gfENMaj3T7SKadA55x

On Sat, Nov 07, 2026 at 04:06:19PM +0100, Tomasz Bojanowski wrote:
> in_from_reg() is meant to scale the VCC, VSB, AVSB and VBAT sources
> by 32 mV, but show_in_reg() passes it the monitor channel of the first
> three voltage sensors instead of the source of the sensor shown. The
> 32 mV case therefore never matches, and all voltages have been scaled
> by 16 mV since commit 41082d66bfd6 ("hwmon: Driver for NCT6683D").
> 
> According to the datasheet, there is no 32 mV LSB. On an MSI MAG
> B850M MORTAR WIFI (NCT6687D, customer ID 0x20d), VCC reads 3.31 V,
> VSB and AVSB 3.34 V and VBAT 3.10 V with 16 mV. With 32 mV they would
> read 6.6 V, 6.7 V and 6.2 V.
> 
> Drop the source argument and the 32 mV case. No functional change.
> 
> Link: https://lore.kernel.org/linux-hwmon/20261106144247.30507-1-tomasz@bojanowski.me/
> Signed-off-by: Tomasz Bojanowski <tomasz@bojanowski.me>

Applied.

Thanks,
Guenter
