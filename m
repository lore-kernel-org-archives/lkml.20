Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=44.202.169.35
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793069968;
	b=FzZkk1IdKz69/QAWksCBVNx2+Wy8HlVS/3t+ExvFNJ0gyN9p100YnrXd1TEx28W7TB95
	 hQIty8w+ku3rnh7dfDxryovYuPSJq8vUzAi0ILrGAIPWbPMCGHNmAiLGWb9OIq+jrf7Wr
	 e3OONZ905HfLxR00t3EFoMjIsItFcIbyMdtD2jVKuJUv5NECaj4Tdm3Y6p8Sr/dwY5wDr
	 rukc2XXUsqrN/xKpJISr3zR8sqbToyP6GXllatxgyxKmvw40soQZL/BhTL8xQaNtLq53N
	 Fx0o/Nq36odUizRM9hSJmEVgyhyAeIOQ+fLhyXN4Ini1ifSGntRFmmGSQg7g50/G2Ug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793069968;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:
	 X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=DVZYAzp5y3OZA2PjGNx37RsXlUC5F7cYH3MmvY5PMVk=;
	b=EXMUCQ0RotMa1FXi14YpqaOGy4WINZhHylr9gUp6BPCouBPlnBDRIrFR41CK+x8yosC8
	 p3UvtjeMsJ77dXfcLqzBqzWLAWlVPkxrLF7GRzFG4Aom4UM/xRpsKNSFrC4FcQcw79/8i
	 Cda4B595Zf2C0CKm4HrP+hKMrKIZ0oKrW9Xe/z65ZTx3atYoARiIky3YGatQjCg/AsIbR
	 U7a8MCysu/kcekPHUqktY2DJxXHaGawdlarFPk74s7LdTYlFqxloUJ5xHgKiw5YGuZtvg
	 L2uHujdP3WVGFrFlZjM6prxUpqAOLmXe/f7k9x2hSFG6fd6/zEtbw9Lead9ax6fAusA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=GxUj9QwG;
	arc=none smtp.remote-ip=44.202.169.35
Received: from omta036.useast.a.cloudfilter.net (omta036.useast.a.cloudfilter.net [44.202.169.35])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5853D606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 02:59:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5853D606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=GxUj9QwG
Received: from eig-obgw-5006b.ext.cloudfilter.net ([10.0.29.217])
	by cmsmtp with ESMTPS
	id LSk2x5puwLvgbLXPLxq1O0; Tue, 27 Oct 2026 02:59:27 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id LXPKxxCFnVnUjLXPLx9V0W; Tue, 27 Oct 2026 02:59:27 +0000
X-Authority-Analysis: v=2.4 cv=AMDybF65 c=1 sm=1 tr=0 ts=6ae0138f
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=M0FbrtG7MMAA:10
 a=mitAZJTLCVS27zc7Mg0A:9 a=CjuIK1q_8ugA:10 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
	:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=DVZYAzp5y3OZA2PjGNx37RsXlUC5F7cYH3MmvY5PMVk=; b=GxUj9QwG56pBayE0cKAJfw7cw+
	Wk73qh/ugxciGuEcKJvE39S+9pEZnrcM95ki2IDBrqYdx+kprmRMNxrloLsdQXR0aQs87VTPMtcca
	7kG91AWECmiiPHhfZDbOTMf1tmpc2Z+03QU96mSDIwDUk9ZelIPxkyOF5x+zZDSiQTtgpl9pOv62N
	R10DRSTq4g7LptaXSbZgEl9V6PSPVQffYosI8wWNeKgz8Ru7iYMtIGPUNIgEjtDmaCglhfmI0rAL1
	IN7IEZynP9YMYZiPBBIgHkRxKyFNL9COZb4BPfJELtJ4V+GP5qxB1Fuqw7nuoqZ4dpEvxvU+bjqxR
	rckPkmag==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:45506 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xLXPJ-00000001xoi-2zHC;
	Tue, 27 Oct 2026 08:29:25 +0530
Date: Mon, 26 Oct 2026 19:59:24 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Igor Velkov <iav@iav.lv>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Philippe Boos <pboos@baylibre.com>, linux-watchdog@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] watchdog: meson_gxbb_wdt: fix suspend/resume handling of
 HW_RUNNING watchdog
Message-ID: <5e77e129-f822-4134-afaa-1a0cc088978e@roeck-us.net>
References: <20261020-meson-gxbb-wdt-suspend-v1-1-d5abe4340008@iav.lv>
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
In-Reply-To: <20261020-meson-gxbb-wdt-suspend-v1-1-d5abe4340008@iav.lv>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xLXPJ-00000001xoi-2zHC
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:45506
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 1
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfJia7nfFoVWT0QWGZ5g5SFIRxdLjWgXpl2BRheNxRHTO0j3S171zoiR/XlyAvPL0C3TN18TnDM2yumBt/jLAX4eqQI6Xvhqs1jg9kYuLLTmonmj01rb2
 9RvGxGAtt7AmzULkG1kFONCy7jIJ0LSO1IafS9wrdFyDE1JbePychae6QCtGGQ8pCkFqH/PRJShU7vm/FaRrAH6fQh6RGzWR5n3R/EynqrEMs0MeJ2PPCgKR

On Tue, Oct 20, 2026 at 08:28:37PM +0300, Igor Velkov wrote:
> From: Igor Velkov <iav@iav.lv>
> 
> meson_gxbb_wdt_suspend() and meson_gxbb_wdt_resume() only check
> watchdog_active(). Since commit 6adbfbab0f03 ("watchdog: meson: keep
> running if already active"), probe keeps a watchdog left running by the
> bootloader and sets WDOG_HW_RUNNING. If userspace never opens the
> device, WDOG_ACTIVE stays clear and the timer is not stopped for system
> suspend.
> 
> On an ODROID-HC4 (S905X3) whose U-Boot starts the watchdog, with no
> userspace owner, the board does not wake from deep suspend
> (rtcwake -m mem -s 60) in 2 of 2 attempts and needs a power cycle.
> 
> Stop the timer on suspend and restart it on resume also when it is only
> running in hardware, as sp805_wdt does. With this change the board
> wakes from deep suspend in 4 of 4 attempts, and the kernel pings the
> watchdog again after resume.
> 
> Fixes: 6adbfbab0f03 ("watchdog: meson: keep running if already active")
> Assisted-by: LLM
> Signed-off-by: Igor Velkov <iav@iav.lv>

Applied.

Thanks,
Guenter
