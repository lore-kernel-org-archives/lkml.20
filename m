Received: from fout-b8-smtp.messagingengine.com (fout-b8-smtp.messagingengine.com [202.12.124.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11346399350
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 21:55:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788990936; cv=none; b=ZVyO4KRYpblrH4jygX8FbMwkdRGg3gK6X2NqUHIosOO0MKyQaxL+eE1tXlP0q2Mw9nScmCM91J9VcIcfpK5tDJm8h5WDeAI63qzTm14p7VMb4ohd2qHrhsAiohtymGUqACPvNwq+pAYjpoz/RGD7fsxypd24Y0r5ANYYcKV1urc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788990936; c=relaxed/simple;
	bh=3fwFTDhNek/GSpkwqwdXpYMsFjzp30LmlCzmpbJvPs4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ez5P+RLD8FyV0uQ96uYFcwuc+Z5KZrvpACwsH9Blu104DYt3U75UZzvLFfqsz8FWOv70TKJulghjGUgpOcgrHOLBkZTJN+AGvfA/kjfY25x/mfm6RtHIYhTTtD/VEHcCAjsExTjO1ubp2wi+/sIFcJP/rT++XxWx3QcYFkJLoO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=LGhucswn; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=GR4B4aBh; arc=none smtp.client-ip=202.12.124.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="LGhucswn";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="GR4B4aBh"
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.stl.internal (Postfix) with ESMTP id E0DAC1D00106;
	Wed,  9 Sep 2026 17:55:23 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Wed, 09 Sep 2026 17:55:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1788990923; x=
	1789077323; bh=TN1pyOzQRZnfF4nZL1fVv+Tel7R4vloilYX+YZHHOgc=; b=L
	GhucswnXLQYrX/1Ber8cz2+69LyI2FidOKpv2gCNnu3XVbBVEuSX4W1KkHHCA6KT
	PTVmfBunakkOZk8Uk8+gf5yx3C7f09/RnoO02Cjv776nDcBm0CP5AcLI9kgzMjl/
	NsLGfa02rWD0Je+YRbAQzZkS+L+zThWhZz1WL3hcpEFExFvTgJFHzS5spukXUp9C
	iVbtJfSkhRtkU4RTaadcWYlMppZ1XHl/EMKAhEDsokuVmhwDeghkBEKVM1gj9D1r
	uKA7w6DpIdyAM1ZdgIf66YFpRqzOh8JLEVv2IpkGtPmPCH1GSno5lbPFjrCpuBVB
	mXF+4OKB1LEiSpVRUPtGA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1788990923; x=1789077323; bh=TN1pyOzQRZnfF4nZL1fVv+Tel7R4vloilYX
	+YZHHOgc=; b=GR4B4aBhh7XCtzJaGWsuugdXZl7iyElkuODoOF6tS+vFhGy0Y4o
	z321bg+fZWUpFnLJ8NBEVj+RvT2oIgjFw5OjnpaObIbFKm38Lw6NHxq49OrskNc2
	oLXDhZXswKJzkh37tV0oZb6a+bEFKk3WonJkqFzAsYiKD6zphGaySsVBuhXJUQM6
	csr8F8tfoKs0/4nOIpEfsTyK0WV7aBxFq/hZvjvEI2Wkuq3lSu7o8OP7Q0Sg97lS
	qJ8Ce8uFzg3dS/6sSoRRUNGs8Ffzt0t9feE1kG+BkG25PoBkR/4TlCFRyQXGkgqf
	tJykHpswGbUSFiPxkoMMq1+RZAoI69T8A3A==
X-ME-Sender: <xms:y9Whaj-vr7ch51Fdj_X-q5-6qhVRPo-7bPEG6sDwH5iTIFLcs9AEVw>
    <xme:y9Whane7HiZS165afhD24fBHCZK2tbQU1Xy5I28lZoY43VPQVgsgbMxr09oTKGgBO
    Cjf-mOln0EyuNZPfXRJNGRtttH1msiJswoFgK4shiY51LIplz8SJRtU>
X-ME-Received: <xmr:y9WhakE3mEX1kTcTQpvOmssPcwBs47VUpVariAw5qhCEc9ylYnwJhZMIXppNYAPw2jGBcG69iscPfopbIpK3O6THNl8Lpg>
X-ME-Proxy-Cause: dmFkZTF91JdF+XDau9R/lJ7ErOGNdyshi+siK6Tc/Zz4hSJhe2u1KlD1UvV2kpBTXWB1Z0
    zAd2GwBf/Fs+zxj0pkYpMLwwWNPi17QaXdVWLhi5GbaxiJGB+cDn4uq55oG4w4SCRYHZLA
    bSzTNQKz4OVxHoY6bJCVyC+qpJPJng389+jXyxnjF6Qcz+wVMFy/lwuTRPJfanlyRwt74X
    D53UxwgglEo86n02elILiJc7b/LgpFEYaRgrKqEZkZMxtZZlKUd8dOdT6BM4DdEj6M52GD
    YV3zCyaqyIgVr/U3UtzM2EgwIp5cQEkvQxpy0401+b7NVy2ZGrgLs1F++kas3hN9aLAPWF
    TB3rcxsudQiyEOuDiFlqJLvdhZUEVHVML4xgTw5Bh595Mt10wDOdanU3VunmAdzfkg65p8
    9qnvAUNMR/xGGfDkoGpki61MjfvyHh47q++N2Lwkt/tJFqKTs2GRrPcPBhy53lCuNl2twQ
    lGgZ/2RV5vadlJlS4CRsg2o4G3e4jDSaJ+hXJAnST6fpmBRTvAUc3Z4Rs5UOZ8WK8iOWX9
    4n0iK4lvw/aNy/Dl8XzSMOfefgV6zQrA0KH8oSX3xOQp38TxGSf15Cmog3aCZ8wZJ1FqrM
    x5Aje2sLV1ZtWEezEFdtgREnhOXzPHK5iP+grhQZxjjulZO9A8i3SkB626YQ
X-ME-Proxy: <xmx:y9Whatdt8bunCy-UpwYzkuJZoSDX1qkL1giWuu_WgwgB3fwTo6zhbw>
    <xmx:y9WhamH4gRBif06zM_TRveqkRIBKA08Gy0IPgFToyG63jbb0NYK0MQ>
    <xmx:y9WhauWnGEcbkzeMIQMtP3C1e3fsBHfwr5sLvdg6FQUWTaItEjOYLQ>
    <xmx:y9WhalJIXTd2NiTCx4XwRAawPynrcFX7V3pcpab0crWYLayjcTypHw>
    <xmx:y9WhapVG2YjYV7zu2JL4eF_2WG_jvTizuX2xGTqnow4_zksBKJnVXoob>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 9 Sep 2026 17:55:22 -0400 (EDT)
Date: Thu, 10 Sep 2026 06:55:20 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: linux1394-devel@lists.sourceforge.net
Cc: linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] firewire: core: fix type of hard-coded image in config
 ROM generator test
Message-ID: <20260909215520.GB2981831@sakamocchi.jp>
Mail-Followup-To: linux1394-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>
References: <20260908122900.2886661-1-o-takashi@sakamocchi.jp>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260908122900.2886661-1-o-takashi@sakamocchi.jp>

Hi,

On Tue, Sep 08, 2026 at 09:29:00PM +0900, Takashi Sakamoto wrote:
> The type of the hard-coded configuration ROM image should be __be32
> instead of u32.
> 
> Fixes: ee9a8c9afb57 ("firewire: core: add test for root directory generation in config ROM generator")
> Fixes: 996096154e7b ("firewire: core: add test to generate with AV/C unit in config ROM generator")
> Fixes: 7bd19bbed9ea ("firewire: core: add test to generate with IIDC unit in config ROM generator")
> Fixes: c3b64c7d752c ("firewire: core: add test to generate with both AV/C and IIDC units in config ROM generator")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202609060630.rC0Zz88P-lkp@intel.com/
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202609061023.GbWS6Skb-lkp@intel.com/
> Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
> ---
>  drivers/firewire/config-rom-generator-test.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

Applied to for-next branch.


Regards

Takashi Sakamoto
