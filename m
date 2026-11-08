Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.89.44.33
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794153589;
	b=ngvXNXZH+E5dSMkjxox5khtu/j5XA3xUK5zAGiremwclE4vuRQiuXpF8Dh0unglbgOR+
	 swbRhgbnSFX7XLzulufCS3bsiZvUfVRecrT/hhKmQMEP6gOGPO9s/QUE79bGYb2xd9snV
	 SYFw1f6Rva+X7SBFguJ1CZI6PHb1KweSlBXb1s9j7nqX1DnSfo44jsiLDLm5kXKhnaQEu
	 105QHOEa17+iie1BiA6N4Uf7cptlB60HbVdbvaBhJy/7Up1ZnIxUC15KWRPzeRT1JT7HG
	 uAsMglMRu1kqisq7mO3oK1S23VKvTlW/MNW+6I+vGwnW7Ja8eE7FVrptzlrQUWUcnAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794153589;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:
	 X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=wJgyCAyvj7YTOSlpBKo14BEy9QzcafBRIPg74gOQeAk=;
	b=DvJixQ1GDQOoOnoqTvDcds+D7HXen8UPAzs/xtlJEmQ+PVVza14pi1sOyAJ8SBcNDZ0x
	 e4VuOxqaIeYSCDJps9x32K3GEok3voJrq+yIk+TP6sxfHCQL240kYcLShhc2N7Xj+Fc1+
	 tBxbIGVRVHAFChUgddXDQSBoE0OTuTaeC5kg4wP0Ep14I8DajJNxSPNfXPIhvC39M1ui3
	 eIATGJQnWO6C9RgJ41fguMh7fyIgPZt4p9sNStRTkCCR+FO3C7+jLmHIhPEsjkdVXDCrL
	 M07ZTYZHuP/9+eYNTITVRzQlOjG/GeJ38lDghS3+JxrgFQp06w71nD9LZAXLs0VrEVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=lAKuAKF5;
	arc=none smtp.remote-ip=35.89.44.33
Received: from omta34.uswest2.a.cloudfilter.net (omta34.uswest2.a.cloudfilter.net [35.89.44.33])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF584606A320
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 15:59:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF584606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=lAKuAKF5
Received: from eig-obgw-6007b.ext.cloudfilter.net ([10.0.30.166])
	by cmsmtp with ESMTPS
	id Q0ByxK8g1AR1iQ5J6xP5Wn; Sun, 08 Nov 2026 15:59:48 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id Q5J5x9OVo3nNNQ5J6xMHiE; Sun, 08 Nov 2026 15:59:48 +0000
X-Authority-Analysis: v=2.4 cv=TuLmhCXh c=1 sm=1 tr=0 ts=6af09c74
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=pGLkceISAAAA:8
 a=0Rnfn9UPV3KAHZwQQh0A:9 a=CjuIK1q_8ugA:10 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
	:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=wJgyCAyvj7YTOSlpBKo14BEy9QzcafBRIPg74gOQeAk=; b=lAKuAKF5Xs7EID0KSxVv6aj+O7
	uJG2eF5dSTNqLH3w70o6YuFgAfS32M5ZmVd96uFirxrW9oyuK/crvZHV2rlsuPqHCdh5PT30VPSlb
	xy4BLUCzeB2QMs+fTpaziCd6kDH2k/Ziqs2CoKORrvrfLgbaYZ8+++49iIsR0cKNOjoC4dKAz+WAE
	n/eZii5XJF28D+0akBZwFZZrSdX1zk6F8cmhDYE3TmftIj245yczrmez4TwCuclDe0zpw1udKURm5
	e2pcrjmWHf3PqsbNa0ZalTCbsR2XmnbggwK8jUQQehKst0pIFrFLL9WKtmk52Q92fG9mo4hikkmch
	0bE8LLmg==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:35160 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xQ5J5-00000000vol-2aiz;
	Sun, 08 Nov 2026 21:29:47 +0530
Date: Sun, 8 Nov 2026 07:59:46 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Pablo Mazzini <pmazzini@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Alistair Francis <alistair@alistair23.me>,
	Andreas Kemnade <andreas@kemnade.info>, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/5] hwmon: sy7636a: fix negative temperatures
Message-ID: <d8cc9a82-eb55-46fa-8632-c6ced9cb8d9c@roeck-us.net>
References: <20261108093602.329554-1-pmazzini@gmail.com>
 <20261108093602.329554-3-pmazzini@gmail.com>
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
In-Reply-To: <20261108093602.329554-3-pmazzini@gmail.com>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xQ5J5-00000000vol-2aiz
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:35160
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 13
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfADjoIxja1usWZ/W8m9cz0vSlUTRaBYkm9zhB0h1B7zBQzYtDOkGz6XiBbhdzCRBb0gL1IAbDkCtdWYPcHfgltVnNqxx/0r+mMDO+pbWjNc1+z64ckOk
 D4XRdGOuLt0QCMxF6UqsSovFaG1vRPPUHKF7iD4PEdyWhywDo+h/dk9MPjEHlTUN6NFjFySPmITXodrB+P3WvD+esyEA3WojAdchyAx7PG+fow9nThqWfK37

On Sun, Nov 08, 2026 at 09:35:59AM +0000, Pablo Mazzini wrote:
> The thermistor readout is a signed 8-bit value in degrees Celsius.
> 
> Fixes: de34a4053250 ("hwmon: sy7636a: Add temperature driver for sy7636a")
> Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>

Applied.

Thanks,
Guenter

> ---
>  drivers/hwmon/sy7636a-hwmon.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/sy7636a-hwmon.c b/drivers/hwmon/sy7636a-hwmon.c
> index d51daaf63d63..f01f368d68e5 100644
> --- a/drivers/hwmon/sy7636a-hwmon.c
> +++ b/drivers/hwmon/sy7636a-hwmon.c
> @@ -29,7 +29,7 @@ static int sy7636a_read(struct device *dev, enum hwmon_sensor_types type,
>  	if (ret)
>  		return ret;
>  
> -	*temp = reg_val * 1000;
> +	*temp = (s8)reg_val * 1000;
>  
>  	return 0;
>  }
