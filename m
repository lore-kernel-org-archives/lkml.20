Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=44.202.169.35
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794857219;
	b=K3uO3elM4atig48W6uneXSLhPQGSLtEB/OSAt3hUOZGxEG/UFufUJv6XeJ33WeW7oEzS
	 z5BYixcY/cD0ihIFOHaU6c10NJQdhSNOHPLrw8KPyMJclbUqwUprnR3Er2jNQbIjJo/VW
	 AMVrIQnEf2C23oQyWtszgVjQv2OLUYvLAPxWAe5UZZ7BrrevKMLAbaF+e7ki52lfT8p32
	 456UTbmhDz3EzPmwc9yHZukOIJf9jL3eMPpOQZNXgQ39Tmt+nqU/C7GTX4o/B3e9ymab1
	 qQN+rO8qDTcFWIYCCHkKDuPog9PIxABFu3lEPxPghc1mWkVJA8j1VVBXEyKhT1fmc1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794857219;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-BWhitelist:X-Source-IP:X-Source-L:X-Exim-ID:X-Source:
	 X-Source-Args:X-Source-Dir:X-Source-Sender:X-Source-Auth:
	 X-Email-Count:X-Org:X-Source-Cap:X-Local-Domain:X-CMAE-Envelope;
	bh=IyXavZCsJO8DHJmxq796s3KiTcfdivwHJjL6XAijKZM=;
	b=WXjm3QUBypjzlYFNW6ydMFVbFjwzxl28YB8+s6//jXwJyaC6aFaViT6N9qrFuBlAiwUW
	 B88IvbpQihSIIPr52ac1xE4/YqpmXBtAdvTG0a/pZDIE7H8FEResSqXFKwuTf5eJ3OGXd
	 pWTX8ux2C9J47F4L0YjqmBnrfyYn9ASLCLGyOYlnmKpXEZYJDEQrhDXaxXRqB0Uy+4Hwu
	 8VPdBLizXi/AyyoLmVAHpnaOpqKorNvwe6XdJAJVOflX8A3f2rlcZFzMTkA5AHVe6ju9s
	 i/VE8un5zCzDQ1cD3JGUpVIHNolp4lJfWyAiHIC8aWXdVSZHvJYa7sVtFJvo1d8vYgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=0UHLp60W;
	arc=none smtp.remote-ip=44.202.169.35
Received: from omta036.useast.a.cloudfilter.net (omta036.useast.a.cloudfilter.net [44.202.169.35])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0BD2606A323
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 19:26:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0BD2606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=0UHLp60W
Received: from eig-obgw-5003b.ext.cloudfilter.net ([10.0.29.155])
	by cmsmtp with ESMTPS
	id T2CgxPWwr4vCDT2LxxEfmO; Mon, 16 Nov 2026 19:26:57 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id T2LsxMMabSgq1T2Lsxi7va; Mon, 16 Nov 2026 19:26:53 +0000
X-Authority-Analysis: v=2.4 cv=c8KrQQ9l c=1 sm=1 tr=0 ts=6afb5901
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=IpJZQVW2AAAA:8
 a=2bteIYZuzBj_oPBnypAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IawgGOuG5U0WyFbmm1f5:22 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:
	List-Archive; bh=IyXavZCsJO8DHJmxq796s3KiTcfdivwHJjL6XAijKZM=; b=0UHLp60WQIVA
	ISPv/Z+pQlcXUU6yUS9Z8/exmFUQbFEpUq5x4yPaZAT+QctuyX2C+O7RzS0gw8/f8jKo/amYQao/M
	svGHkOHu6fHZBXRo7TYVEX8c9RELkXa7Iu+1+1b8cEfjTERHbe4sl1yMMpD8nuJwBwYh4TeWPZxih
	Xpc72wicV24A8OyYqcF05TgOFA8BQN2qGGsFiXFFgAk3sA2EhQ9ehM75myAGElFan+fsodvBGC3YB
	bcs6dELxWf9tGRL7ijcvdbmiCdIGIw/PXbNqXVaJ2NXX4dFRfX4cwLfO6JGKtScRC/DfG3LpXf6l2
	+K5fWSFeXoDxtHFtoLqHNQ==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:40034 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xT2Ls-00000001m6I-1U2o;
	Tue, 17 Nov 2026 00:56:52 +0530
Date: Mon, 16 Nov 2026 11:26:51 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Cc: Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: (ltc2947) Make ltc2947.h self-contained
Message-ID: <5c2f14c5-1313-41a3-8655-d9a3ae97d9a2@roeck-us.net>
References: <20261116180950.3894659-2-u.kleine-koenig@baylibre.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261116180950.3894659-2-u.kleine-koenig@baylibre.com>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xT2Ls-00000001m6I-1U2o
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:40034
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 3
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfDA8htMtajfOMf5R+wtcL9U6FTJC0hKLIeMlOtVC1n62QR15oK2ruO0IJKc+vO9Ys48VooeVhNuZQpcKAa51moqzJsZn2f0lHe7dJolagSn827z5PxGT
 z2yHOlwXvzSTQUthUY4zsen/W6qR6hWJcreDcBmSzG91LSh+0UKj+l6i9XqpdOiScsAC8zjrGLOOYEHPkyLfr2dY1vwHlJsI2gLBavUlg0UAP/+KcI8eJc/L

On Mon, Nov 16, 2026 at 07:09:50PM +0100, Uwe Kleine-König wrote:
> When ltc2947.h is included without a previous definition of
> of_device_id, the compiler wails:
> 
> 	drivers/hwmon/ltc2947.h:11:34: error: array type has incomplete element type ‘struct of_device_id’
> 	   11 | extern const struct of_device_id ltc2947_of_match[];
> 	      |                                  ^~~~~~~~~~~~~~~~
> 
> A forward declaration is not enough to fix that, so include the header
> providing `struct of_device_id`.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>

Applied.

Thanks,
Guenter

> ---
>  drivers/hwmon/ltc2947.h | 2 ++
>  1 file changed, 2 insertions(+)
> 
> 
> base-commit: 84abb955b1015477aa11a96e2f3ac1b938b77f48
> 
> diff --git a/drivers/hwmon/ltc2947.h b/drivers/hwmon/ltc2947.h
> index 5b8ff81a3dba..eb3613f4d4cd 100644
> --- a/drivers/hwmon/ltc2947.h
> +++ b/drivers/hwmon/ltc2947.h
> @@ -2,6 +2,8 @@
>  #ifndef _LINUX_LTC2947_H
>  #define _LINUX_LTC2947_H
>  
> +#include <linux/device-id/of.h>
> +
>  struct regmap;
>  
>  extern const struct of_device_id ltc2947_of_match[];
