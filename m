Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=44.202.169.37
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794861379;
	b=ylnYH5+aUQ6COGWPulqPqIog5jLc9V/kbS2+V0s+zJKZOngObmEft0LJu0O9gqieTUTM
	 ++209nNdexoWWMRXKXJ7XeLKHB71jC3NH0c1c6W816TdMkZS2tYl8G1jQ7hSAF1YPRWn0
	 OTiQud1U+mHy6RAF84MFgWkpGz0LDzEmQo4udeirPLyD8c05ayyJ/BNc6ChfCRz+NaocG
	 OD0WgRt0zgCR/UvUwZDf3dFLe6sNfeK7X1oSuo5YiQ2QgFNF/AZpzHxwLOhL7AZ+8EbJV
	 49qgEyVSGv0+jJ8n/eDdqiwldG0lkn7+3XENJOQv4qLznl4UQXiTJa4NOfZl2DjOSYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794861379;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:
	 X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=LR/ENSG1Oy0ZonFJqw+WDSGwM0wFAggM+KWeiz7ZDrc=;
	b=MvXW72OF0aZaPlTARwJTOAfRDDZfifp2nD3UaG9HHk5GSF2QNyni2zOD62pps4m0x7iC
	 3scSLkPPDrwYSrkzFLJQVRvq9houeMteccDvTGRevnVUcLzDakGdxqd5hbOohr1Kz+pe9
	 Rdp4Qyh9sQoPj9NsYVgxsgjha0/rpa7ZiMlPp3nJnBf0LTPMMq3Qza/O5M07tzCZ1sTVO
	 +9d37aSsi+afXJ1xdHVR1m8niArK3JbEPSUFlaoKvs5L7RYxU2Ds+HlSzWNUsj8+5ZFAT
	 YFtD7OE35AjX9ClQxNFT0aDSYj5nB1MtqgK2dHAO2GGmvYppsQzDl7N/pfz20Hj/vow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=Z0UzdlB+;
	arc=none smtp.remote-ip=44.202.169.37
Received: from omta038.useast.a.cloudfilter.net (omta038.useast.a.cloudfilter.net [44.202.169.37])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B173F606A31C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 20:36:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B173F606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=Z0UzdlB+
Received: from eig-obgw-5004b.ext.cloudfilter.net ([10.0.29.208])
	by cmsmtp with ESMTPS
	id T0VXx75xOJFmFT3R3xDW57; Mon, 16 Nov 2026 20:36:17 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id T3R2xQCpeuJrPT3R3x2UVT; Mon, 16 Nov 2026 20:36:17 +0000
X-Authority-Analysis: v=2.4 cv=WLZ/XmsR c=1 sm=1 tr=0 ts=6afb6941
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=c92rfblmAAAA:8
 a=8b9GpE9nAAAA:8 a=VwQbUJbxAAAA:8 a=mZs5ITWgARj6bgJpHwcA:9 a=CjuIK1q_8ugA:10
 a=GvGzcOZaWPEFPQC_NcjD:22 a=T3LWEMljR5ZiDmsYVIUa:22 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
	:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=LR/ENSG1Oy0ZonFJqw+WDSGwM0wFAggM+KWeiz7ZDrc=; b=Z0UzdlB+3hd953Y5/M8siTEDip
	lgctCrYmv6Ow9mBHNRoS2tETGaOcfQTQgQ95EZOflVRGaZdAsRI9YgBCDqsPbg1+8erYm8pgbE0W0
	N0JPEdoEo7kvOfGy3+dbFPE9sL2QkoNTaMgJIBuMgtg8Bfy3C/+VgLhEpcTKgz7eclfB4XRylHV2C
	R5FyFK9moofQKcLHC4kiU/MPcNNJmNWEhxrjbu81+wp6MxZrEzsD8Q1lveTeJ+oVyOISbFZSE9C4l
	uyRELnL1EJ8gNXu+nacu+v529orF5hlGjOMuexFc6+p6/8S/RgFQxJYmU7VIpodJBC9hOnldiSVAW
	mbqYhtVg==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:43056 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xT3R2-00000002IjR-0mCZ;
	Tue, 17 Nov 2026 02:06:16 +0530
Date: Mon, 16 Nov 2026 12:36:15 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Antonio Borneo <antonio.borneo@foss.st.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	=?iso-8859-1?Q?Cl=E9ment?= Le Goffic <clement.legoffic@foss.st.com>,
	Marek Vasut <marex@denx.de>, linux-watchdog@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Sashiko <sashiko-bot@kernel.org>
Subject: Re: [PATCH] watchdog: stm32_iwdg: use managed variant of
 dev_pm_set_wake_irq()
Message-ID: <88ad5eb0-78a0-4ee7-9731-b04916307749@roeck-us.net>
References: <20261116190130.1191501-1-antonio.borneo@foss.st.com>
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
In-Reply-To: <20261116190130.1191501-1-antonio.borneo@foss.st.com>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xT3R2-00000002IjR-0mCZ
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:43056
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 2
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfHL36bLscr0z+XEthDOCoMQzYdqEAgDQNAM5BTnoZyAma3pN8WjA72SA4z+8jGYKfZkizQ7Wqlll2/V2dUCsD8+1i0j+KMJ+DNocaZ9eGJK+GDEyULrw
 8x9rFtbeBNFz6Bbe7iWHZ5apxSKUI67niR+8S3OE+6ixvWKIP+zCbUoQ+YdKIR93ZGWSGkA9ESg47ZusB1w9Wefy6ZffDfn1tsKZa+sJwkNh0hVgVdPw7JS1

On Mon, Nov 16, 2026 at 08:01:30PM +0100, Antonio Borneo wrote:
> On probe failure after stm32_iwdg_irq_init() or on driver unbind,
> the struct wake_irq allocated by dev_pm_set_wake_irq() is leaked
> and dev->power.wakeirq remains attached to the device.
> Any subsequent attempt to re-probe the device hits the
> dev->power.wakeirq check in dev_pm_attach_wake_irq(), triggers a
> dev_WARN_ONCE() splat, and fails probe with -EEXIST.
> 
> Use the managed version devm_pm_set_wake_irq().
> 
> This is reported by Sashiko inside the raw log of another commit
> that touches the same driver.
> 
> Fixes: 3ab1663af6c1 ("watchdog: stm32_iwdg: Add pretimeout support")
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Link: https://sashiko.dev/#/message/20261116132416.1184447-3-antonio.borneo%40foss.st.com
> Link: https://sashiko.dev/#/log/249869
> Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>

Applied.

Thanks,
Guenter

> ---
>  drivers/watchdog/stm32_iwdg.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> 
> base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
> 
> diff --git a/drivers/watchdog/stm32_iwdg.c b/drivers/watchdog/stm32_iwdg.c
> index a8d2db2d3cf8b..f1056f8100cf0 100644
> --- a/drivers/watchdog/stm32_iwdg.c
> +++ b/drivers/watchdog/stm32_iwdg.c
> @@ -298,7 +298,7 @@ static int stm32_iwdg_irq_init(struct platform_device *pdev,
>  		if (ret)
>  			return ret;
>  
> -		ret = dev_pm_set_wake_irq(dev, irq);
> +		ret = devm_pm_set_wake_irq(dev, irq);
>  		if (ret)
>  			return ret;
>  	}
