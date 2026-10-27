Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.89.44.39
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793114832;
	b=nKCqMlzEz21UT5K8bNBXuzv4Udu/liFYVtUDV7K9OlfDCefMNPieJpy5dhdalls8o9Y1
	 FpaGtvbI1A09Wbqs5qXkWNe4YBm1X74VVktnfIiOGvkFc9p/nQVwIJTeLYB07GHoz/H0a
	 zbu3pkjjmr7rYfGAYbStu8p679EYkxfuY+YH6Kv14M5ijqwkqsEckH2JPV5Nxzf9exknR
	 CEeM6yDNd4whc1lTitIBN+d7jV07DxSLvn9HtBfpYtB+ZuyBwwzLQ6AbSHhGs8HEL0Cug
	 ZZ6FAnoJVPB+PklYWqVyakKU0/jkIH4V5awHuuCFJc88XPmdksK4B9Gz7ym5+o+jnCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793114832;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:
	 X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=hcVetJ3j4Yw0L4vaeF4Sin3e+Kqt87+IIjhgJbDSvlc=;
	b=qptztRuj5LMPhhapzzmW6Vj9B5CGRn3yyFTbwAdI08+BExY4l1Gxv1ExdSypdoP/YCM0
	 Ol+xmRkHdDY1b3W4eDVKUXnJyyL4Vsler68xdXCap6OuRrtfP2mEx/6ugwa0KWpLcrtHg
	 RLoErCNWspvj9/At+DMcdKl0k7zBafIVFtr6SM8pbhHsRo9EUzYquwkmPCTCO7XFqYhDG
	 UxsqnghAGVyUAVVt8h4j4txi/Q+hLhleCQUntlIUN3vqKci7dcCZBQEIjsbsLguawhv8s
	 WQmGMr1gRcQ8NGfizNXsVUdnFo/gclJqIhgeH0fUMB43Tga2kW8Qq2e+CGYu9GewuuQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=FmxUwmAs;
	arc=none smtp.remote-ip=35.89.44.39
Received: from omta40.uswest2.a.cloudfilter.net (omta40.uswest2.a.cloudfilter.net [35.89.44.39])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E9D8606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 15:27:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6E9D8606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=FmxUwmAs
Received: from eig-obgw-6004b.ext.cloudfilter.net ([10.0.30.210])
	by cmsmtp with ESMTPS
	id LhouxGAtDc3XsLj4yxhQPw; Tue, 27 Oct 2026 15:27:12 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id Lj4xxRI5VH2S8Lj4xxH8IU; Tue, 27 Oct 2026 15:27:12 +0000
X-Authority-Analysis: v=2.4 cv=Mfxsu4/f c=1 sm=1 tr=0 ts=6ae0c2d0
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=M0FbrtG7MMAA:10 a=xkLUNt4dAAAA:8
 a=zk4-lHRcAAAA:8 a=X3a0BiUdAAAA:8 a=_jlGtV7tAAAA:8 a=OpKgjLFNguK3uynLL7kA:9
 a=CjuIK1q_8ugA:10 a=A2EApc-QTtVVSfvlwUcc:22 a=7cv85riZL9-k45RWW8P6:22
 a=aWu3muFgq6otJbhCXpL5:22 a=nlm17XC03S6CtCLSeiRr:22 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
	:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=hcVetJ3j4Yw0L4vaeF4Sin3e+Kqt87+IIjhgJbDSvlc=; b=FmxUwmAs7mF4dF4b3MQBl8bdVb
	tiCn1dYzKJ0/5zMuy3Dkl5KtJ1CdWrSMhaagLq87Gx1uPeduOFJAZZReNPm7krFrp0E60KhUlLIDc
	70bByHiXUwq6iK+SuZfP+qFgtQERObuDjcXRMpBCSrAB+a4BQNBCvwyL7kA0dqv78KyQ6qQWLmyRA
	Hq42mLTB+P7mkwhAHTZEbxhOIJ8RQ+dr6VZLeMOToBzgTx990t+r2R8igmo3YeZYI720aXTIoEzEs
	LnG2PVoLpX07aKgbwkJl8Q9l2uD8LdzNHoRsOylbfZGPe9Q4HIZozVgI9EWjY8N/Ouib2/Lj2x8ET
	IhcPGRCw==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:41180 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xLj4v-00000000Fjr-01VO;
	Tue, 27 Oct 2026 20:57:09 +0530
Date: Tue, 27 Oct 2026 08:27:07 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Primoz Fiser <primoz.fiser@norik.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Support Opensource <support.opensource@diasemi.com>,
	Lee Jones <lee@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	mfd@lists.linux.dev, linux-watchdog@vger.kernel.org,
	upstream@lists.phytec.de, andrej.picej@norik.com
Subject: Re: [PATCH v2 3/4] watchdog: da9062: Add support for dlg,wdt-sd
 property
Message-ID: <2365680e-3319-4ee1-90f4-33041e8f701b@roeck-us.net>
References: <20260924065044.368341-1-primoz.fiser@norik.com>
 <20260924065044.368341-4-primoz.fiser@norik.com>
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
In-Reply-To: <20260924065044.368341-4-primoz.fiser@norik.com>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xLj4v-00000000Fjr-01VO
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:41180
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 24
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfGhzR6xUyZ+ePq2eSulS87LI0UKYqs0phodhnXAO2q6hn9AHtwEun8d692MEBunGx/vK3RBjqjOA0SxcPhiSI+NdAVAs8gX3qrb9pPezUpYpb3OWjDr5
 CGjkf6DXSkLcB7rrcVo9Am94pjvogHjDvG2im75HdorJqEHEvFNQqAIlypWzyypBDH6CqvoYXQ5UUXS4dKbj+lEJf8lFGjVNOLXC6HqYgGTyLzu/KW2V/9MU

On Thu, Sep 24, 2026 at 08:50:43AM +0200, Primoz Fiser wrote:
> From: Andrej Picej <andrej.picej@norik.com>
> 
> Implement a method to change watchdog timeout configuration based on the
> "dlg,wdt-sd" devicetree property. Setting the WATCHDOG_SD bit enables
> SHUTDOWN mode, and clearing it enables POWERDOWN mode on watchdog
> timeout.
> 
> If no devicetree property is specified, the WATCHDOG_SD bit stays in the
> default configuration, not breaking behaviour of devices which might
> depend on default fuse configuration.
> 
> Signed-off-by: Andrej Picej <andrej.picej@norik.com>
> Tested-by: Christoph Niedermaier <cniedermaier@dh-electronics.com>
> Reviewed-by: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
> Acked-by: Guenter Roeck <linux@roeck-us.net>
> Reviewed-by: Guenter Roeck <linux@roeck-us.net>
> Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>

Applied.

Note that this depends on the mfd patches making CONFIG_I writeable. Those
patches have been accepted but are (as of this writing) not yet upstream.
Assumption is that both this and the CONFIG_I patches will be applied
with the 7.5 merge window.

Thanks,
Guenter
