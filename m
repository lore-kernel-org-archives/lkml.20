Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=44.202.169.39
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794153366;
	b=ZIshcSuNGUgw1/VokxGrseYivdcbtzJ/6uxrSOIL8yGLFKAxuVF/lYmskp81uPX5J7e/
	 1rfJfGi3/MxhBr39ZrIlKeWoyKUNlkf5kMh9TTOQ3ebYCnZ88890Nv/u3VZilBJ7nLoAO
	 E7l6Du6LQGERCg7D1RaOMf6hVnjdK1ydcFjezD+xKBuju1jo7jabB17WiSHbT5XRHMITu
	 51Nb/YdiHO6dv85Irmo+gZBbLkZa52BzWfUb025vA8SbyCg8GEHjWehEBHzYx5FYo3iOq
	 br1qlRy95RTdy6l24cNRaTeRMUslNik3l86TX94YEkbhzjPqolKOIji/msICqeHNXmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794153366;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:
	 X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=4WgcMk+6Df3kqXCDJbQ0XiMNyOgOuU3OMHCZqmnKHCw=;
	b=owrpQZEDHOSC+Rp+dTsvpDRxiuE+Frr2Oceeq1iL32+rHB5sBy34oNdrSj1uY5HJo9ZT
	 G9QY/B750DPRbeYPMCQKxpGTNOWOjEIf0K6w38Iv0Y+OgbMMeLEsqPOp/HNvBMlp4gzwV
	 MbFPl+14Xjbxqs22AT+y0gXp20VrtSP6u8IGeQtpVA0r8SqAXEtMZqkq/7LqjIYJhWY30
	 OjUZ+8MEq9PUOXJCKKWn2Em4+YLms1lhZCw+TfvbeQDXlWOWDB2iU9Yhj0RScLdYDG63o
	 2NN7JqXlfcj2NXiwwzbn/c249VqdYrFA/w4+78ab6KrhE+AHsLdXfpXZxKq6hoVatKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=1xcvbC9O;
	arc=none smtp.remote-ip=44.202.169.39
Received: from omta040.useast.a.cloudfilter.net (omta040.useast.a.cloudfilter.net [44.202.169.39])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6BB7606A31C
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 15:56:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B6BB7606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=1xcvbC9O
Received: from eig-obgw-6002b.ext.cloudfilter.net ([10.0.30.203])
	by cmsmtp with ESMTPS
	id PkhwxypyNOOJnQ5FPxwHht; Sun, 08 Nov 2026 15:55:59 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id Q5FOxCgXM8cn4Q5FOxUjOH; Sun, 08 Nov 2026 15:55:58 +0000
X-Authority-Analysis: v=2.4 cv=Qrde3Uyd c=1 sm=1 tr=0 ts=6af09b8e
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=pGLkceISAAAA:8
 a=LzFtcxTfFVD5gEon9dMA:9 a=CjuIK1q_8ugA:10 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
	:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=4WgcMk+6Df3kqXCDJbQ0XiMNyOgOuU3OMHCZqmnKHCw=; b=1xcvbC9OmzhzJzOI85flk0cWO2
	WEftoNyIILHCFmlT0XPX7bHCkSfIhp7HRKp6V0ZIl9h6GwUSCHai5t2UsgcvXSfT6eHn4KWRCRRdk
	lQB3i7nitDmRpRSuRWlUJ7qiJ7IQqeGWg1BvQzktSBcqzq9Z8g96YLxTbRfOYx335fJYFmqLgc8Ec
	764Fap7AN5qcxh0JHTZs7OceSmqdiG+grDeaNYuAQ9bwfsSltR2GfILa8w5vhE4JXTSGz5W5xAHzD
	ETVYUfyCbayriSCnLZR2QaTOGnmk4S48oXaLl3Ly72FOsXBUHQ/IdNJ7Z/42hm4f04ljD3nRjU7h8
	6FZkhVEQ==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:47254 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xQ5FO-00000000suh-0bYw;
	Sun, 08 Nov 2026 21:25:58 +0530
Date: Sun, 8 Nov 2026 07:55:57 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Cc: Nurettin Bolucu <Nurettin.Bolucu@analog.com>,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] hwmon: (max31760) Report 0 RPM before the first fan
 speed measurement
Message-ID: <8596262a-7670-489c-824b-11fdf9500b3a@roeck-us.net>
References: <20261108-max31760-fixes-v1-0-a61450463059@gmail.com>
 <20261108-max31760-fixes-v1-3-a61450463059@gmail.com>
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
In-Reply-To: <20261108-max31760-fixes-v1-3-a61450463059@gmail.com>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xQ5FO-00000000suh-0bYw
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:47254
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 9
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfJaC710AaxyfdqJ1ji14T5LO//pQbfLwrjKarVMdyBKloxR9DuyFESVWU5RIBrQPIadPrK6PpdSQ9jt94F+kIEuRbK8x/yPFx/9pRmuv0SEWcIXqjh27
 LGdVc3owp0+R4RVs7oP0dN+U4xMWGxH3du6sNXKHgymR8tfRBLe1x6prXrsVI0xid0T7ZIXG81o5h+rB59A4KwzozusDM3qd/BFBNVItfLR0saHuzQxZhwZK

On Sun, Nov 08, 2026 at 03:59:55AM +0000, Stanislav Aleksandrov wrote:
> The tachometer count registers initialize to 0 until the first
> measurement cycle completes after power-on. To prevent division by
> zero, tach_to_rpm() clamped tach == 0 to 1, causing it to compute
> and report 3,000,000 RPM (60 * 100000 / 1 / 2).
> 
> Return 0 RPM when tach == 0 instead.
> 
> Fixes: 38b04ad02d0d ("drivers: hwmon: Add max31760 fan speed controller driver")
> Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>

Applied.

Thanks,
Guenter

> ---
>  drivers/hwmon/max31760.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/max31760.c b/drivers/hwmon/max31760.c
> index e967555a21af..896bd0326b8c 100644
> --- a/drivers/hwmon/max31760.c
> +++ b/drivers/hwmon/max31760.c
> @@ -68,8 +68,9 @@ static const int max31760_pwm_freq[] = {33, 150, 1500, 25000};
>  
>  static int tach_to_rpm(u16 tach)
>  {
> +	/* The count is 0 until the first measurement */
>  	if (tach == 0)
> -		tach = 1;
> +		return 0;
>  
>  	return 60 * 100000 / tach / 2;
>  }
