Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.89.44.35
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793049790;
	b=M/Z3q4zmFjgsPKYahLYkjjtIwA3aFqRxd4n9+iyEou7oZ5WHhUq1Gl8/AkDwXBxlEiLO
	 oN0xcAYNueTWgIqy8OlZP5wM8cwsB764MjNOlIpPU6p9AIyuCJr1DZ7FsSpAQVM481yNg
	 pJ8Rlo0207ceobVzkpuudZ4jPJ87hWdNHnOXhQjNUVQu6UclA6xa9Vfe9si739d32WCvY
	 VF7miyFcW2ctxA+fDDN6SpCHc6nbr6bMEEsE3OZffADCHJy+pFXRS+3DztSZ+SlYVFRVv
	 dIuu3aTqYafyMEQxck1tGj7ZiTYWcmL0561wzUcf3rcXQY9uZsIEUyW6ypu1cPD7TVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793049790;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:
	 X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=Al40yz8zX8CT/g6ZiarLm9qznrROayr99YdGIejOzh4=;
	b=R7V52ygabMTlyNs6JXJ7FFZu53WnaWdbUlvz5azPlq6HCmUyKwemQxvi2LniEAUbHgLk
	 dY9K1J1p+MKiXYbC0o1J7f6kNSmFVxHfa9nj6jX4TGv038ZMe5KRJNwutm5lFWodxpQDM
	 V7ozO1lxjjp6KnxSbU5UbhpkY0yqWZ7aw8xTErKKT3U7yT2BiaYPoR25Tdfbby5YX3rPp
	 1/6VjYVs09DmNF5RbQzY89svxeXcuUCJ5rfTED5JQ+rvzQOkZ2ZBtRF2GF7EsNq1os00V
	 HSdA0R+VpeNtUrxbjipJXuAPHPPC/rMzRc1tisaTTT9HH8XRAgk6iDzmdd4Me3buogA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=nuJTrfl2;
	arc=none smtp.remote-ip=35.89.44.35
Received: from omta36.uswest2.a.cloudfilter.net (omta36.uswest2.a.cloudfilter.net [35.89.44.35])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D360606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 21:23:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1D360606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=nuJTrfl2
Received: from eig-obgw-5004b.ext.cloudfilter.net ([10.0.29.208])
	by cmsmtp with ESMTPS
	id LOWJxjpseusRSLS9txvaB8; Mon, 26 Oct 2026 21:23:09 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id LS9sxgJ8UoYFCLS9tx710t; Mon, 26 Oct 2026 21:23:09 +0000
X-Authority-Analysis: v=2.4 cv=b4Cy4sGx c=1 sm=1 tr=0 ts=6adfc4bd
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=M0FbrtG7MMAA:10
 a=rJ5y2_88ZgdFKM9dSD0A:9 a=CjuIK1q_8ugA:10 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
	:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Al40yz8zX8CT/g6ZiarLm9qznrROayr99YdGIejOzh4=; b=nuJTrfl2cv6HWnm3fhxzkWe/wA
	VRs0DQvGsuWH00LII2CP9tHoiCLQbpQ1gAfDgO3FBNi0UjcPIij5TKwMZQ/8O9Bn90eUZFX2PawpY
	o6mQhUQ2oruu/5lqTVgcG6tHLUaqTs98tswJg7VsyFAoxVYLDXCdKavCj1Us32IyROR6qkD7uzH67
	xdd4qsL9/3MoEIE8y8PrEAsWMIuUnacs27mT2FoT5q1gPdp1hnoBdRE8J1e12Udtcb2j2Vu1P15i+
	etQopKwhHD+6GmUDQutNAX+Ig3VRKBWGqxgpzfGHSol4/LsFBViabi1cWM0haUS09OFpvnO47rnoo
	pt8t2C0Q==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:35782 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xLS9s-00000003SIU-1SbN;
	Tue, 27 Oct 2026 02:53:08 +0530
Date: Mon, 26 Oct 2026 14:23:07 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Aditya Garg <aditya.garg@linux.dev>
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
	Neal Gompa <neal@gompa.dev>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: (macsmc) Allow enable writing to fan speeds by
 modifying sysfs
Message-ID: <2cc7dea9-9a0e-4532-8ed6-74664c621fae@roeck-us.net>
References: <20261018113248.12243-1-aditya.garg@linux.dev>
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
In-Reply-To: <20261018113248.12243-1-aditya.garg@linux.dev>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xLS9s-00000003SIU-1SbN
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:35782
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 6
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfDAbDhJPSQYxLjCb62VsiNb7wpyznojsSVfTyQ9w2GfetmR9l/b86nOfb0lqpylAsPmhwxBg9GgQpdNOgvbi80ZJWraWNShQ6wVOKkGL8A328Q5XUV8z
 cZyC3kQE5DaBVd5LO9/Fe8pKplXs01sJ680+lVhA9mm8oM59ESdmre47DL4BNkffyHUr92n6DMjrsib8lo8pcRVofLzGDGzUmC6FmBDy1kP9XU4XEVrMjrQh

On Sun, Oct 18, 2026 at 05:02:48PM +0530, Aditya Garg wrote:
> The fan_control module parameter in the driver enables/disables the user's
> ability to manually modify the fan speeds. In case the user attempts to
> change the module parameter via sysfs rather than at the time of modprobe,
> changing fan speeds is still restricted.
> 
> The reason behind this is because during probe the fan_control variable is
> used to restrict the user in the following two ways:
> 
> 1.	if (!fan_control || hwmon->fan.fans[channel].mode.macsmc_key == 0)
> 		return -EOPNOTSUPP;
> 
> Here, if disabled, the OS will return an error and will not allow changing
> the speeds.
> 
> 2.	if (fan->attrs & BIT(attr)) {
> 		if (attr == hwmon_fan_target && fan_control && fan->mode.macsmc_key)
> 			return 0644;
> 
> 		return 0444;
> 	}
> 
> Here, if disabled, the sysfs files are with permissions 0444.
> 
> In case a user changes the module parameter via sysfs, due to the second
> check, the sysfs files remain with permissions 0444, and user isn't able to
> change the speeds.
> 
> Since 2 checks are practically unnecessary, and the second is causing problems
> this patch removes the second check. Now, if the module parameter is changed
> via sysfs, the first check will pass and user will be able to modify the fan
> speeds.
> 
> Signed-off-by: Aditya Garg <aditya.garg@linux.dev>

Applied.

Thanks,
Guenter
