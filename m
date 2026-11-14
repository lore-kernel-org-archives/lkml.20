Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.89.44.39
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794673084;
	b=FhjPKYifQp3UU/EWXfskUXBxnTytvpcrokHqm3UkoGNssa4qmiNJZo1boHrPVt3oxioH
	 a1OdankkbwxQcu1LfAqhnoTwXl7up8eddDN+KDGbYZLug+7UG2Q4q21m2VcMP2+YKQabS
	 RwLflOA+w4Obvt347V83g6HqaGfyTc4EmHbwIxiDE9bALB/aDoMuLVOkNXnMVeiZ8qUlA
	 zue9PTmnk5mvsuaxRRSTdr9I8gn1IglK4WCLYR8KvqlgSunS1G9c2izKddn7ySS/gfNif
	 fQSqEzF0Gmwog3dbzV50WyZ7rLP8ggoMY/QO/zZL9zL/Yej6i4jU3/ewWNLz43Achww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794673084;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:
	 X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=JXcsaroLu9RYMnyzJa3z1PMc2yacK6h4M122uyvtASw=;
	b=ODtQuFNNeBEUycgNdupx+UA3gJoujADtESk0D7yVtEgMksGTOAx1o5Sz/9XoeZodcaqs
	 ob7ni47izzfOL+iPA1BdnJzEwfYZdliiGeDGf2aaGzjjTOjKAfWdT8EBKkz5Ph3Cp+39T
	 QqvKPxxk0GbZda/Nlmq+znUklTiHWwoFN6uQXLQWt8mxq8hbaNXoemWabGYe5l2C8zG45
	 QyFqo5vQKqpw+vILNWetGEz01Uo4omMSStpNPL7gy8t9fwQKpfv8i0S73lNXJukvKxQYY
	 iGj1QLnMufBUMyQDNBbc2QJEQUzRC8L94ZJq5oPLyq1Jy12mXevr67dcpkUyB4vWBrg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=A6aDyzDd;
	arc=none smtp.remote-ip=35.89.44.39
Received: from omta40.uswest2.a.cloudfilter.net (omta40.uswest2.a.cloudfilter.net [35.89.44.39])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6023606A329
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 16:18:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E6023606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=A6aDyzDd
Received: from eig-obgw-6001b.ext.cloudfilter.net ([10.0.30.143])
	by cmsmtp with ESMTPS
	id SDgWxfHTXyb4YSGS3xgCGe; Sat, 14 Nov 2026 16:18:03 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id SGS3xag9HdRrRSGS3xl6B6; Sat, 14 Nov 2026 16:18:03 +0000
X-Authority-Analysis: v=2.4 cv=LOhmQIW9 c=1 sm=1 tr=0 ts=6af889bb
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=pGLkceISAAAA:8
 a=vOTR-jlet6PWbI2xc1cA:9 a=CjuIK1q_8ugA:10 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
	:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=JXcsaroLu9RYMnyzJa3z1PMc2yacK6h4M122uyvtASw=; b=A6aDyzDd6Ax3JUJnkL5F78YCbI
	nAvlgDYnZBFlh4WGaT352KhB5OzcT0o+JXGnFPKPIFPmE6ZVTFvmR0wjqQG1P6jPqW7tGcmj/4TJ3
	bHTLhHEmVuS0bPt9KRI2Fx5kQ35qLnF8EdADO/FMrmZ1RGafsIKU+DF+hL0BpakShOnLiWq6Fn3F8
	763pZqiWlQDR35dKXpdwQVAd8Jw5FQSxzVFq/4Rqdnf2sTgmzVExdDLLF2BXyYgl8UaWi4TkmRyU4
	J/+kRHsV1ZBNZyqgmIyvkP2jK7kgTiERUftJ7AuEUP5vQax7JqeiP+c8w3ILCEUI8/mZ34J5ZVM8Z
	4ZX9QMMw==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:45104 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xSGS2-000000007o8-2umy;
	Sat, 14 Nov 2026 21:48:02 +0530
Date: Sat, 14 Nov 2026 08:18:02 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Johan Dahlin <jdahlin@gmail.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	Alwyn Kik <alwyn@kik.pw>, Fabio Baltieri <fabio.baltieri@gmail.com>,
	Hamza Mahfooz <someguy@effective-light.com>
Subject: Re: [PATCH v2 5/7] hwmon: (nct6683) Name the sensors of the ASRock
 B850 Steel Legend WiFi
Message-ID: <627ec98c-44fa-4f31-b0fb-ed054b63620b@roeck-us.net>
References: <20261111082838.1418051-1-jdahlin@gmail.com>
 <20261111082838.1418051-6-jdahlin@gmail.com>
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
In-Reply-To: <20261111082838.1418051-6-jdahlin@gmail.com>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xSGS2-000000007o8-2umy
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:45104
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 50
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfFuQn6/jztc6BP9suqzpOxba/WPAB0mcRWdeUsljm9QbzLn3l57/7zox2Yu3VwKWHecwt7Uhcv/6RIZZj95B56vRERXTW5IJfOgyNa7kk60zuMo+O3EC
 I7WIgFliZkST0V6rnI852EhuJtYg5Ui8Ecj7/1sRWvQFwjbg0hspLeaBgsVdFFIygyUfAYQA71LMh5eMY4sOGMPWwXN3ntXQ/fcMPGgN6ReOsoqKKPkFi9ch

On Wed, Nov 11, 2026 at 09:28:36AM +0100, Johan Dahlin wrote:
> The inputs are labeled after the monitoring source of the EC, such as
> "Thermistor 14" or "VIN5", which says nothing about what they measure.
> The UEFI setup of this board names them on its H/W Monitor page.
> 
> Add a per-board table of sensor names keyed on the monitoring source and
> fill it in for the ASRock B850 Steel Legend WiFi. Sources without an
> entry keep their generic name.
> 
> The CPU temperature matches k10temp and the voltages match their nominal
> values. Which thermistor is the M/B one was inferred from the readings.
> 
> Signed-off-by: Johan Dahlin <jdahlin@gmail.com>

NACK, please don't do that. Add desired per-board names to sensors3.conf
instead.

Thanks,
Guenter
