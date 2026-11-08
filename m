Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=44.202.169.35
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794153196;
	b=d4DTfMZjJpGa/BGv+JaT2r2QHU0KDtwJmWU9AZIGAdYM3rr5o6yNu1Ubl1xFR4Cr4VuZ
	 csEc0euvGUfIAxxMS1lUpC800v98VC4NiUGhQbi8jxk3fvFZu1YuH6OaENo0aMjTA+fu7
	 bquLRYzjuQf/Tqh8luQfFbWdmfjPSFGBGPkBF+abmZVOs+5A+SM0gaM3OfvcovXTN9IIf
	 dzvW1W3/9Omqm5JaecXUUeVScKUSkRsJ/X+QxKC4knF5eMA+jwpznA2oGRnGvTGS9K/Zd
	 CwtliCF/OAM8r0x35U82NaJoh3kcO8hMwN5l8K2vIkwWOET7cRJTsfULbkl7FmJFjfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794153196;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:
	 X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=WGnL5Kog7sqXAF5fKDq57AYRRG2h0ncJxBCwhLzWae0=;
	b=jrQX6paQDDPAy97yiDpmOT6S9p1mLvGOlMi1cc7SZN2hyr+xDYowOVxKrKePqPJGtOtQ
	 6qcGPpyH/IT4fKJUMXem6+k6H6LeHYlhJnWa6YV+zVIgg3GUguxZVME2f51XphwSqWzgG
	 YZMyS0sDDzS3ANuBssbc1SL15s0z+evgj78jRiauu87dlquayBOIAfs+EdLj5jWHFh7oO
	 crUI5HQYRLoZOtC0NBvdR9zrV7OiKSjZA2hKxYx+DcnaTkmcimUighy0aCqSHkH23Kkjs
	 V8DVetsnS7oEYWESGptS35QRbI3Ix+CQaXBn+0h7Xq+wLmfMLoR02iWFmBFqWZ2gSag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=PikqJGRD;
	arc=none smtp.remote-ip=44.202.169.35
Received: from omta036.useast.a.cloudfilter.net (omta036.useast.a.cloudfilter.net [44.202.169.35])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E7F5606A31C
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 15:53:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5E7F5606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=PikqJGRD
Received: from eig-obgw-6006b.ext.cloudfilter.net ([10.0.30.211])
	by cmsmtp with ESMTPS
	id PNl1xfw4F4vCDQ5Ckx1JNX; Sun, 08 Nov 2026 15:53:14 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id Q5CjxLJGRFhzrQ5CjxsPSV; Sun, 08 Nov 2026 15:53:13 +0000
X-Authority-Analysis: v=2.4 cv=JY+8rVKV c=1 sm=1 tr=0 ts=6af09ae9
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=pGLkceISAAAA:8
 a=cb46NOgsPMkVhkrRhZ8A:9 a=CjuIK1q_8ugA:10 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
	:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=WGnL5Kog7sqXAF5fKDq57AYRRG2h0ncJxBCwhLzWae0=; b=PikqJGRDivayFIv4yhg6/WUABd
	vx5UBcBJrCnzggvKAiI2Mup2YP+2Ypk+KPVuuykl7VfgWMX20fu6oDNjZHeETqSKH+fWbLNizBnGl
	JN49jG2vNJO+aR4mpPnvqvzpLLhSX2ac73trI8YdSlugeYHM7tuxJ/fo4/Cr8HgmEwCspZxW5hj7V
	fvd0yd6QzyCxUOA2aVmtv9i4jnXDnxVDoYdbOLv6yT+XSo3QNgjr8IizRXA58lNL56PbGRNUgJR5y
	l4uTRx9n/tKX1rYUWWbl8l7k46G7AQ2z5HUk96vGCk05zzp+uhcr6xHwuwTQqE6Fb8arH02zSwJeo
	CRmYzv0g==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:37748 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xQ5Cj-00000000rAD-0YDW;
	Sun, 08 Nov 2026 21:23:13 +0530
Date: Sun, 8 Nov 2026 07:53:12 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Cc: Nurettin Bolucu <Nurettin.Bolucu@analog.com>,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] hwmon: (max31760) Fix the local temperature limit
 registers
Message-ID: <5c7880c8-8b2a-4558-b89e-9d41e8a391b9@roeck-us.net>
References: <20261108-max31760-fixes-v1-0-a61450463059@gmail.com>
 <20261108-max31760-fixes-v1-1-a61450463059@gmail.com>
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
In-Reply-To: <20261108-max31760-fixes-v1-1-a61450463059@gmail.com>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xQ5Cj-00000000rAD-0YDW
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:37748
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 1
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfPqOAW7BbVfPwztpWlbzJhViQmWYvrko4Af6B6mUBDq3YFvhCbjzWc4nMYs7g9kRP3yN9POG8AHekw4UorBH8y5UtdbF5aBVF4H+aDjsDer/ewK1cHx7
 tFjWHiM3EKApyAHlBDFDkLtDGauPihwo1nmdrryHvlaZzml3N46KUBEpsaledg2r9j27eNN8iQH9xDyHB+7MhsTNSjm6l26+pk1SEDuw4TFovnZDzqRakgMN

On Sun, Nov 08, 2026 at 03:59:53AM +0000, Stanislav Aleksandrov wrote:
> temp2_max and temp2_crit use each other's registers, so reading them
> shows the local limits swapped and writing temp2_max changes the
> overtemperature (SHDN) threshold.
> 
> Use the high limit (0x0C) for temp2_max and the overtemperature limit
> (0x08) for temp2_crit.
> 
> Fixes: 38b04ad02d0d ("drivers: hwmon: Add max31760 fan speed controller driver")
> Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>

Applied.

Thanks,
Guenter

> ---
>  drivers/hwmon/max31760.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/hwmon/max31760.c b/drivers/hwmon/max31760.c
> index 8d3be064b025..e3d86dc4257e 100644
> --- a/drivers/hwmon/max31760.c
> +++ b/drivers/hwmon/max31760.c
> @@ -27,8 +27,8 @@
>  
>  #define REG_TACH(ch)		(0x52 + (ch) * 2)
>  #define REG_TEMP_INPUT(ch)	(0x56 + (ch) * 2)
> -#define REG_TEMP_MAX(ch)	(0x06 + (ch) * 2)
> -#define REG_TEMP_CRIT(ch)	(0x0A + (ch) * 2)
> +#define REG_TEMP_MAX(ch)	((ch) ? 0x0C : 0x06)
> +#define REG_TEMP_CRIT(ch)	((ch) ? 0x08 : 0x0A)
>  
>  #define TEMP11_FROM_REG(reg)	((reg) / 32 * 125)
>  #define TEMP11_TO_REG(val)	(DIV_ROUND_CLOSEST(clamp_val((val), -128000, \
