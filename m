Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.89.44.37
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794249188;
	b=swxrTN3XCZk9kOQrSIo35kWv54VDu29ql0J333u36+tIVQs//vdvoRK1p08ZOkVXvdMd
	 tts0cYcBzyva8K9kt8SsR5ZwOr/iZRJmDj6w3cDuflh1zjfKcgx2xtx6Us2fcWYWPHCRm
	 E9omcmB7rd+4+NAYnvq442lVNkeBMJ/6Ver//fHzWAwsW5wDXqjirWasosfj0HRfoCeAe
	 /TPoMM/x8FiVv6wzaR5w5eVjuHLJwhVrjj5u1KQ9MwkMVPmv3tPI61mTUHjviybor4ctD
	 sKc0P/rWMtIC8QGXKGBGEuu61E8Am+46jdLq/T4if7S/SFWyd90YI+K7gkGxqV0NuBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794249188;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:
	 X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=CNCUrfub2jnQwknJISxmpd3RnPi6PE7iaN89BAV2Gng=;
	b=xT7I2RNGvEMGGaTr8LeopLDYr2Sx3Ji6LgikKcrQ2tVRclBlEbBHQspXCQq6dFPZSC//
	 6aINFq/Mucw3Vtd7o2t6GkE1nZjsAR/klH3i5Y2SD3DLFN1lR4rLxU7wxY+V3ssEMEPhX
	 JBf2QBINg+B/hiUJqFubSYYwn8yieB/1usbtzt5vGmIHWF3jjpE+NkEdtW9w3z9FRubaZ
	 7IFO+BI0kk+D9mF4OlfbKh3CxTdcUvljVDhiDtwWg24+M9u3R2uVNcYsWzmsCHOYXKHtc
	 080FJs2Cg6gB680ZCi1iVkZbaUlEqQBF43JSBZgFM8lCKwNYa+bbJdkTFqe/UUl88dw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=BGlMXX5L;
	arc=none smtp.remote-ip=35.89.44.37
Received: from omta38.uswest2.a.cloudfilter.net (omta38.uswest2.a.cloudfilter.net [35.89.44.37])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D05D0606B5AD
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 18:33:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D05D0606B5AD
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=BGlMXX5L
Received: from eig-obgw-6004b.ext.cloudfilter.net ([10.0.30.210])
	by cmsmtp with ESMTPS
	id QPeAxrTE4VK9UQUB1xtSMr; Mon, 09 Nov 2026 18:33:07 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id QUB0x9UwVlaNKQUB0xwYN3; Mon, 09 Nov 2026 18:33:06 +0000
X-Authority-Analysis: v=2.4 cv=UbpRSLSN c=1 sm=1 tr=0 ts=6af211e2
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10
 a=K6s_-0DHPOfA-GDsQU4A:9 a=CjuIK1q_8ugA:10 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
	:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=CNCUrfub2jnQwknJISxmpd3RnPi6PE7iaN89BAV2Gng=; b=BGlMXX5L9OlYS/p8u7IJ3wrSPS
	Qx/EtaBx6FY+rs/DK9s7PfVShd5x2gr/x+r5oR8HBTPksF1oFhh/Gq9JEKi2mooSWzSNwJIPbIrMW
	OG58vie+u9YFvDCC0m/6i43PbRi6v6sXGq2to6wqRy8RgfIAtoA9owkVbzpDEEe1VIiIrbLDZ/zNe
	0donE0NSTZeTvRTtymNEWxhjnK287qjshT4PeteJ1Ib5qzYxzMtLIuu+RPVBgqfhSliwwxVjZNijv
	MQGEBAz+dHkWR5JuNiXJofKGBDaEg3yDt8BbVb1O8VDaSVkgjl/Y0ZTr6thEp3P7iNuFda1earBg7
	n0WNL6MQ==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:52656 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xQUB0-00000002u67-112K;
	Tue, 10 Nov 2026 00:03:06 +0530
Date: Mon, 9 Nov 2026 10:33:05 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Vincent Jardin <vjardin@free.fr>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] hwmon: (pmbus/core) Add a vout_command debugfs entry
Message-ID: <309198ab-f3a1-4155-8c7c-55e09f72a192@roeck-us.net>
References: <20261108-for-upstream-pmbus-vout-command-debugfs-v1-v2-1-b19d6cd18aae@free.fr>
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
In-Reply-To: <20261108-for-upstream-pmbus-vout-command-debugfs-v1-v2-1-b19d6cd18aae@free.fr>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xQUB0-00000002u67-112K
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:52656
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 14
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfNQZl7H5XpoYDsCZrej1R4/lqerbUzl20YDLfHZnh1iHraSlsS79QItizB/8adp864SMucOKY4ACQr5Lbc8ML9bymHhzjFVn9vk5DDcWM/1CNybZtw37
 v4jAYuDfkbj1qbP6Wax1z0dzGZ5r/HXJ6ttzkkmZeqzVsOu7AQ2ncAffwK8qTxpPDsKiOPgXwr6nD3pYsoMcjDvkGUFEk4crhkc6vYdXo2mwxedAUpuo6TlG

Hi,

On Sun, Nov 08, 2026 at 08:56:36PM +0100, Vincent Jardin wrote:
> From: Vincent Jardin <vjardin@free.fr>
> 
> The vout hwmon attributes and the regulator get_voltage() callback
> both report READ_VOUT.
> 
> On a regulator whose configuration applies a load line (droop),
> READ_VOUT sits below the setpoint under load by design, so user space
> cannot see what the regulator was actually set to.
> 
> max20730 already exposes a driver-specific vout_command entry. Add
> vout<page>_command to the PMBus core debugfs, for every page with VOUT
> and a readable VOUT_COMMAND, in millivolts like the in*_input attributes.
> 
> Signed-off-by: Vincent Jardin <vjardin@free.fr>

This patch no longer applies to the upstream kernel due to commit 4dd10fbbeb9c
("treewide: Convert devm_kmalloc() family to the devm_kmalloc_obj() family").
Please rebase and resubmit.

Thanks,
Guenter
