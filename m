Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=44.202.169.37
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794265263;
	b=Pa5aQvSjaM0T8oTS6pK7ABDBKpTDZie9HlbeZ3nRQKZEX1BxBC2CO8akOcI+JRfAiOz5
	 xIhexLIUR+wFFw7RoFVx2IhwswoqHU8d3QzQ0q+1HLtufo64MHadn6MegNJg5FeKF/i0t
	 e8DPCBiNJ2Nz0rtkTio9ni2mUQEsy6bVTL66wXJ9ENmSnrdk5KOINtqYSMWelbYKrT8FS
	 dOERY8O8AVX5PaV5xH2Dh0YaCy6CI2USFqWXEn0j0/NymZtKIC/qermK7lzIifQbMru38
	 R8BU3PrNWZrsikaayqoAtmCuSNwsckT1cS6pedHnRplgbzY5WYIkhB79frbomxcx1+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794265263;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:
	 X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=zL8FK8P5Vsdfkx0MZ8+/mUpFCsZNRdF7JxzCjScEi5g=;
	b=31UbMJewbJfctRKFzjccBKXfLxXsosv4zeCmXQiL2DfOpjrxLCRzCimEnAOq4lHCYITO
	 ZW2XCRMqXqNBTOC369GCVP0S+MG0QZZCFMri0zjcOo5BiqGrWonN8hxTj4WJ3wBRN1Jlf
	 WvPn3Bq8qeVoPQmIOpxU9jeAyovnKVPcG+Buvbbr+uS0WhaBgIzx7fIueDeY7TjY9s0HH
	 LFV2x294HawUIYjOS77hjBUmW9HfR/i9EJBi02xp06NfIHRb7RcBcpH9yhoRmW5BM4ddj
	 k3wCIqUSHOc4MxI9+OE/6OWrsYPn8CkpHjKFQgR47JToGO69tLi6AKIhm9n5hgdLkEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=oEqpXKT3;
	arc=none smtp.remote-ip=44.202.169.37
Received: from omta038.useast.a.cloudfilter.net (omta038.useast.a.cloudfilter.net [44.202.169.37])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78FA2606A321
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 23:01:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 78FA2606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=oEqpXKT3
Received: from eig-obgw-5006b.ext.cloudfilter.net ([10.0.29.217])
	by cmsmtp with ESMTPS
	id QU78xXWm2JFmFQYMHx7zXQ; Mon, 09 Nov 2026 23:01:01 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id QYMGxo2RLSeuLQYMHx8Dcn; Mon, 09 Nov 2026 23:01:01 +0000
X-Authority-Analysis: v=2.4 cv=NYvm13D4 c=1 sm=1 tr=0 ts=6af250ad
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=VwQbUJbxAAAA:8
 a=pGLkceISAAAA:8 a=XwxYKhIv0tpjMc_zibUA:9 a=CjuIK1q_8ugA:10
 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
	:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=zL8FK8P5Vsdfkx0MZ8+/mUpFCsZNRdF7JxzCjScEi5g=; b=oEqpXKT3wYL1wg/DZ1OCAmn/KQ
	8jKL+gRhBFw50kw3/1IbtF+x3BKxyHO8/ZHuegflaUFp2X23elHmIUyEI0IVUD7Mygm00WsTG6ceO
	JdulNAYghF6uY2e6jDXSkzFEmMkUNdPGavsBr/HVrzI5TO5K6PvbnI/THmShWtqcMHS9lOyBYbyUs
	RWywmG6oBdddctKk8NwopLi1ceUUvqlrfkfydPoOVyqiIWoye4Fs+5P3RD/H4ypAbRDN4ekm+pXZ3
	/z2LXMfAIkRCZJArqkzHeEjxwUsJTCSbqMzWIS16vBnedaTksTU+Lo4KeEvhybi+KVl+gSYZZke62
	u8Musk0g==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:54458 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xQYMF-00000000mLs-46PO;
	Tue, 10 Nov 2026 04:31:00 +0530
Date: Mon, 9 Nov 2026 15:00:58 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Hrishabh Rajput <hrishabh.rajput@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Pavankumar Kondeti <pavan.kondeti@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org, linux-watchdog@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] watchdog: gunyah_wdt: Re-enable the watchdog on resume
Message-ID: <bbff9c33-0647-4608-9cd7-07a6801791e0@roeck-us.net>
References: <20261109-gunyah-wdt-resume-v1-1-fbd84545ce92@gmail.com>
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
In-Reply-To: <20261109-gunyah-wdt-resume-v1-1-fbd84545ce92@gmail.com>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xQYMF-00000000mLs-46PO
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:54458
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 2
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfOrb62qptEqRdWoGWZJrEZ0prCYiPotmVoSiPKTk0x4gas4ttLH087p0I+ikwwa09u79EWCWTtSa65ZQw9NUrQRxrtzaLW0b8trTCD4+3Z9T+Lhqplzs
 IS5XFE1b3IVL2vBOFSnNv69Vcnl7fiURyWv8olD8kA/6R5D3tcZ/vJt2K+JiyNYI9dghmbTbCbk6Cd78Ex9p6tKZENVjaK5DL2Q0lM8vsFkoU8nb4WTsmqIB

On Mon, Nov 09, 2026 at 08:26:52AM +0000, Stanislav Aleksandrov wrote:
> gunyah_wdt_suspend() disables an active watchdog, and
> gunyah_wdt_resume() enables it again with gunyah_wdt_start(). start()
> first disables the watchdog, which fails with -EINVAL when it is
> already disabled. start() ignores that only while the watchdog is
> inactive, but on resume it is still active for the watchdog core, so
> start() returns before it enables the watchdog:
> 
>   gunyah-wdt gunyah-wdt: gunyah_wdt_start: Failed to stop gunyah wdt -22
> 
> So after every system suspend, the watchdog is left disabled.
> 
> Move setting the timeout and enabling the watchdog into
> gunyah_wdt_enable(), and call it on resume, where the watchdog is
> already disabled.
> 
> Tested on the Samsung Galaxy XR (Qualcomm Halliday) with s2idle and
> deep suspend.
> 
> Fixes: ca316e145c35 ("watchdog: Add driver for Gunyah Watchdog")
> Cc: stable@vger.kernel.org
> Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>

Applied.

Thanks,
Guenter
