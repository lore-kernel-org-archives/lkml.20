Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=44.202.169.35
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793055692;
	b=swMik4Tnk4idLasp+wfPx+XwuzvItR09P2DlT1v7fu2YgFQHA//FmYJXn0ihhM1AVuFO
	 vrPIVtyl8WDtN4gzCtVJEL/ki/FMJyGpDNzcPz+RrD7NtWc9GS+zsy39N42q3/juV5Xju
	 k3ivLi0kRuenk4rfsy924agDqRol8WLj+Udxw3EBpD9HViyFptwuyGUOPemuI8pA02ctZ
	 evl9RZqmCMjo/j2GHdRHA7E5wzhu7d5ODEkC0NAZN9q7yVZe+DOFaytor2H8P6+jS68tL
	 P/WoLebi4GPNq3/Z0mJMmGcrrmaQ9loGyNKWREJqtBsR2VLLly1mYqepG7I/306Yjag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793055692;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:
	 X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=zt8lQ3pyBrzAtax8igYb17d+ZOwQEn1FpWIt7R4TXd4=;
	b=OCWSx1StJQxGUqVQy6MzOmehhv36m5h5uAI2z43IsTkGh7bIr3EDhYfhIJcX4rmmeJnN
	 f3fw1M9zqj7YnffSDnTFmZZYw2Murkz1Jrwn339fPOnXzGTejbiR02imwu89d78DuZPKO
	 Us5KoDB1kCLL2ZhiOGHknnERw0vCQvTSfts505WpujGrZplw6ySAJf/LRpRwhX5S1R+qY
	 QZKblsdkZjPwneGrwmkrXH1huTuOTBR143YaFoAt7vRK/6iGUrd10LLgSdGmHyWYxW3Cj
	 nG+Cihgw6wh1T0mIHZDNPPAftNQ/nC02vXgdtfzfXyVwBv7uvyKo1oB1GYr2F1rTEiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=DHFbXVz5;
	arc=none smtp.remote-ip=44.202.169.35
Received: from omta036.useast.a.cloudfilter.net (omta036.useast.a.cloudfilter.net [44.202.169.35])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F5D3606A31D
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 23:01:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0F5D3606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=DHFbXVz5
Received: from eig-obgw-6003b.ext.cloudfilter.net ([10.0.30.175])
	by cmsmtp with ESMTPS
	id LNFFx4O5ZLvgbLTh5xosXU; Mon, 26 Oct 2026 23:01:31 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id LTh4xWUsJ7CfWLTh4xtuMs; Mon, 26 Oct 2026 23:01:30 +0000
X-Authority-Analysis: v=2.4 cv=Z8HsHGRA c=1 sm=1 tr=0 ts=6adfdbca
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=M0FbrtG7MMAA:10 a=VwQbUJbxAAAA:8
 a=pGLkceISAAAA:8 a=wIdtkIOOtEIBfA4DHLMA:9 a=CjuIK1q_8ugA:10
 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
	:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=zt8lQ3pyBrzAtax8igYb17d+ZOwQEn1FpWIt7R4TXd4=; b=DHFbXVz5ap6/m0ye4PVYmP2m9l
	jRuCY6sl5St2n2z7VzTjbRxPHgGrYMZO6+Us1ucuwW22ZTVbcvjKlNM+HG7AQc14O3mwbXK74cSwB
	81yWoz9oJUtrdlCtcSuIJ32K2F/LTEHjrn2ljqfqtYmdgo1W0y98DiY6jCoQdXciSDNPNgT4/YsKz
	624TMXzE37h8Ko5pt0hX+hds0BcGId1rUmMjktWxo+mB04Pulew74+3EQJ5L3ijoL1tMukeX8xygO
	vSeU4kb/Rz9GLuy3CQcH71J7sxGC5EViSegdd8SOUhow773lHn/PwTi6PZN4SLWwSUibJH6jL718w
	ZV3Ax7lg==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:49542 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xLTh3-00000004JhT-48S6;
	Tue, 27 Oct 2026 04:31:30 +0530
Date: Mon, 26 Oct 2026 16:01:29 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Artem Shimko <a.shimko.dev@gmail.com>
Cc: p.zabel@pengutronix.de, Sergey.Semin@baikalelectronics.ru,
	mika.westerberg@linux.intel.com, andi.shyti@kernel.org, iav@iav.lv,
	tzungbi@kernel.org, wim@linux-watchdog.org,
	linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/2] watchdog: dw_wdt: manage reset line during system
 suspend/resume
Message-ID: <4e40ea83-3ba1-4e2d-aa38-31313b367e78@roeck-us.net>
References: <20261024140854.25664-1-a.shimko.dev@gmail.com>
 <20261024140854.25664-3-a.shimko.dev@gmail.com>
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
In-Reply-To: <20261024140854.25664-3-a.shimko.dev@gmail.com>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xLTh3-00000004JhT-48S6
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:49542
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 12
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfCM+o34IB1hlbcXmSjcJarNor8hIxQ8aLK7f4HkWa0KcU9sEIjf3mrmP7/4G2U5bGPiDOOWbUry3LVrp0gTEUxc3kIs8gweaqdOnFVV6/Fs/COFI06Uf
 PlS+RHLlBvO/MC4b720ucv2a2QMCPYKwA0pBwHmaM3SpojwGlUrNfB//Vm8D7Cbn3BIJcGRb/LzrqwTvbM+G+xGgBrix/to4xfYphCpXWxrrf/aCZ2U5m/nY

On Sat, Oct 24, 2026 at 05:08:51PM +0300, Artem Shimko wrote:
> The watchdog controller reset line is not currently managed during system
> suspend/resume. This can lead to an inconsistent hardware state when
> resuming from suspend, as the controller may not be properly reinitialized.
> 
> Assert the reset line before disabling clocks during suspend to ensure
> the controller is held in reset while power is gated. During resume,
> deassert the reset after clocks are enabled and before restoring register
> state to guarantee the controller is properly initialized.
> 
> Tested-by: Igor Velkov <iav@iav.lv>
> Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>
> Signed-off-by: Artem Shimko <a.shimko.dev@gmail.com>

Applied.

Thanks,
Guenter
