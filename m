Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.112
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794922058;
	b=HM/+z3RCneAWDtx9eaIdQrpyWMPONaRAq2x2GStTMR/dQysomGNo8QnuxOISktwqBJlc
	 Cm5/JQ3Y6wHWqztyisdJvOqBPJ9RlMs1hVJAaKtKyT2t005SDqivy2rnreFsVePfz7kir
	 BVHxQqVkZl4SLXOokRa2/pvungkLwkTluqIKeTPpk7EYdIWJ12lfKW+JFoEGgvTh+j/b9
	 rtSYGiqsnrQwV9rZNk22lzjMrwUHSu385T+H/FM6wegxgNhKPW6zZJUUJPYi/ZKaS7DGQ
	 rcbOu/YyvW/GBSeaSu5P5AmIsiczYQ/MRI/ZptweJcWUObd826khiVpZARlXswUy7gg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794922058;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=hMTRae/7dai+hIUARFlVZIWWrBH0aaFjeRGhcjedEQw=;
	b=i3VpUBKrH6xryN/UZdzFe3okSg2X/GlsxWerJRec6ibhSGD7NezIbomf+cfqXGeXlO4G
	 IYtA51hPBU7Z9fEhrfj8uTgX7+Oj40DGf5AkHhXjmACvlaHKGcWxdMn8jLeGNME0MJDG/
	 MlEzWR/5vkjQ2qSXJ0vTzkvXRCiXrdAuIEDc/5q20qvfynblkBxQl7h3ZnzHE4QeCXBuK
	 2XwUcvFKIG0c0cruOOC7XgcyhxCpGWFKFcJcyf0dphfXuiYI18qJfpBKyDxJPUAFuS7/p
	 IO/7PHPMZw4TpTQj3+WGRy+fThuga5otJ8I59G4xB7qpmVG9BJAVgk4pm85BGCLc6Lw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=gGAZ0XFB;
	arc=none smtp.remote-ip=91.218.175.112
Received: from mta0.migadu.com (out-112.mta0.migadu.com [91.218.175.112])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B6BC606A323
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 13:27:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B6BC606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=gGAZ0XFB
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=hMTRae/7dai+hIUARFlVZIWWrBH0aaFjeRGhcjedEQw=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794922055; v=1; x=1795526855;
 b=gGAZ0XFB5QNCHerJj3LBLNtoVrV23V2S21pAJ3xVsjvinRE3aCVm6i7Oue0MPbAS8TdiFMBB
 NoAsqesw3fDcTdlL8DfzVwdOuj5vEnNQ1qrPKO3i2kTVWAUlnAer4dAaX+fP34/DYa4tRTbWcEr
 6uOXFSlRZBTnQZqz+QDkBA6s=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 07008d2eff61e532;
	Tue, 17 Nov 2026 13:27:35 +0000
X-Mizu-Trace-ID: 07008d2eff61e532
X-Migadu-Flow: FLOW_OUT
Date: Tue, 17 Nov 2026 21:27:17 +0800
From: Peng Fan <peng.fan@linux.dev>
To: Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Marc Zyngier <maz@kernel.org>
Cc: linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH 0/8] irqchip/imx-intmux: Fix and modernize resource
 management
Message-ID: <avxWNZii97F9PZE-@fedora>
References: <20261117-imx-intmux-v1-0-189e7e0ad98d@nxp.com>
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
In-Reply-To: <20261117-imx-intmux-v1-0-189e7e0ad98d@nxp.com>

Sashiko reported some findings [1], please wait V2.

[1] https://sashiko.dev/#/patchset/20261117-imx-intmux-v1-0-189e7e0ad98d%40nxp.com

Thanks
Peng
