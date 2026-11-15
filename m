Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=44.202.169.35
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794749920;
	b=FYgyrbxm5CjDaitkna+Crz9uKAf2onDwz0yxbF7qZiQOVid1hGL/9H/F/H75f4GKFpFY
	 woNrbOQB80/UxqMyNlyFzROdFQw+4bqDb8BKn4NByMw1OWoUl9+ozbmmrmJnvsx+MxxGH
	 oIGUCwok1p4tfELSrvoM1y2378m3orp1q404xyGbQso5VHG7J7O8WPHL0CYx+w4LOqkkh
	 kEodVq09nBjX1mC5etsjp//yr432uvxqntkEtad76X6sbF7tiyjVFzXGHeD/ZXl6GOaW2
	 NxmndhHv/xGnMZKHobLvdP8YG5bd5fhWUT1NEoecvVFbsEg2ErhIZFPE5sgxATd5cFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794749920;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:
	 X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=PeNZzg3oK75/b0ly5y0MeZF2YmpGhG/qY/Asr9C+wmU=;
	b=jf8ynzoMEC2nAQ1OH9z9In58KuPL+1w9i0Mpa7JWNCOu9WM/G6946ZjqMAb5Qf7PozvS
	 TL5u/Fytg6jhQElBC69WLbxMT9bwmJnmyDqXqBTAvC50JaoWCxDs/SLxJl7pkjORCmtRy
	 1QRD+25rsKpZXA15SAanFY+CArWinUXJ7Fsol3k8nLy6o9nykB/sWPRkI8Tx0FdD6FoxC
	 YmxAjJ16DCB5sgWyDcd603zUkW2o29V74ZwI6RNDT+8/wA5GP5BJj9VZswpWpwXAT76ka
	 oX0R1PujoHa2mKNDf77F5EIWqQK3678KVeur+xvlIMgL01kUVnlFHawRABW5Gc+iT+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=jaxrtMs9;
	arc=none smtp.remote-ip=44.202.169.35
Received: from omta036.useast.a.cloudfilter.net (omta036.useast.a.cloudfilter.net [44.202.169.35])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C96B606A31F
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 13:38:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C96B606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=jaxrtMs9
Received: from eig-obgw-5001b.ext.cloudfilter.net ([10.0.29.181])
	by cmsmtp with ESMTPS
	id SZSTxKIcK4vCDSaRKx4Mtf; Sun, 15 Nov 2026 13:38:38 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id SaRKxTAyMxmi7SaRKxdWJS; Sun, 15 Nov 2026 13:38:38 +0000
X-Authority-Analysis: v=2.4 cv=KuFN2XWN c=1 sm=1 tr=0 ts=6af9b5de
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=VwQbUJbxAAAA:8
 a=Byx-y9mGAAAA:8 a=p5UCd2gWKyfE8sLfB1wA:9 a=CjuIK1q_8ugA:10
 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
	:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=PeNZzg3oK75/b0ly5y0MeZF2YmpGhG/qY/Asr9C+wmU=; b=jaxrtMs9y5BthYT+TG31FZCnkH
	1OydYFXnDUVdepNvMva0wQ8mn6nli6Z09ocUs+5HmUxPPxolY2vL3bq0NwuWAAe5XJMm2FRNCrZew
	l1uffQvr6WavSMAyyjZO63lHuReAwX3Mr3UX+op7M27Tvkbu9WO8Um21QNS9xPHQQBrW+ncMOEDfM
	pQsovE1uoTy1UKOjnX20r7fX7CVFVXeHj2aX8nidA8hqMb8JO5WVH2bx5RE/lnA4A97fMYkLqEnVT
	Ockz3GyeH8r0rMsVfEsdi48PVqJr/d+x8Ym9GcYdSjYtEZWn3RYsr+aomNz2q+gpZbBqwMDiRnK6o
	SATN2Wqg==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:39426 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xSaRK-000000013mU-0Wu0;
	Sun, 15 Nov 2026 19:08:38 +0530
Date: Sun, 15 Nov 2026 05:38:36 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Ziheng Wei <zihengw03@163.com>
Cc: Marc Hulsman <m.hulsman@tudelft.nl>, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH 3/3] hwmon: (w83792d) Fix incorrect struct cast in
 show_temp1() and store_temp1()
Message-ID: <b54bc0c0-1357-46a9-85e8-2fd38bb41b17@roeck-us.net>
References: <20261115080203.910033-1-zihengw03@163.com>
 <20261115080203.910033-4-zihengw03@163.com>
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
In-Reply-To: <20261115080203.910033-4-zihengw03@163.com>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xSaRK-000000013mU-0Wu0
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:39426
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 15
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfKgVcx6EkkpsjrG7mXHG4sZpZ/nmm5t9DmPakIIjz4qLhyEroxdYtJFQUdVA55XgQ4Yol1mdAjTx4WDtJ6AGJTNsFdeLWjD5JESEdhJ3BW92KVTs3+7R
 wueZ3AWWQE34NRa1+lAjcVS0p0PkoKymkfgI0lSTwXCFWxfnQkSxJyqgdaHbg4cXPNZww9a07w+RmNj1ArWiaTxKy7B6t5mUn31BHCRRwGWxiokzEuDLnIv/

On Sun, Nov 15, 2026 at 04:02:03PM +0800, Ziheng Wei wrote:
> On big-endian architectures, accessing the temp1_max and temp1_max_hyst
> sysfs attributes in the w83792d hardware monitoring driver uses a huge
> out-of-bounds index, because show_temp1() and store_temp1() downcast the
> attribute to the wrong struct.
> 
> The driver defines the temp1_* attributes with SENSOR_DEVICE_ATTR_2(),
> which initializes them as struct sensor_device_attribute_2 (where the
> index is an 8-bit u8). The temp1_input attribute has index 0, temp1_max
> has index 1 and temp1_max_hyst has index 2. However, show_temp1() and
> store_temp1() downcast the attribute to struct sensor_device_attribute
> (where the index is a 32-bit int) and use it to index data->temp1[].
> 
> Because both structs start with struct device_attribute, container_of()
> resolves to the same base address, but the field widths differ. On
> big-endian architectures, reading the 32-bit int from the memory layout
> of the two u8 fields yields index << 24: 0x01000000 for temp1_max and
> 0x02000000 for temp1_max_hyst, instead of 1 and 2. data->temp1[] has
> only 3 elements, so the access runs off the end of the array by up to
> 32 MiB.
> 
> Fix the type casts in show_temp1() and store_temp1().
> 
> Confirmed on a big-endian s390x QEMU guest with the driver bound to an
> emulated chip: temp1_max and temp1_max_hyst read 0 instead of the
> register values. Not tested on real hardware.
> 
> Fixes: 1f8dae31fe8d ("[PATCH] hwmon: w83792d use arrays of attributes")
> Cc: stable@vger.kernel.org
> Signed-off-by: Ziheng Wei <zihengw03@163.com>

Applied.

Thanks,
Guenter
