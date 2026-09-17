Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E93E554A7F2
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 14:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789656708; cv=none; b=QrinqbsZ4JS9+4KtpxQ7coCWT1dij3QgLHkLaqAQ/7LUSLxpffwMaY5tMjAmiTpzFz8v8jcNvNzXr+k7TChMGmuRM4vvVDAIu7yVX7DLFJ3gxA977wPDWjEtA2YCT+sfOwerLi3e7ea+GLbte4N6J2SOwl1F61/5qSaw6kA8XjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789656708; c=relaxed/simple;
	bh=9GN59YSkpcx4uErNtZbygVcGcUIIqwAE3bUrdECbWQg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=teO2o7TxWenoHFIQ58eMeKjWZNTkDRdmUVKXaR+ybqGR4wMqY9VxOhwNRRQCfS6oAcKjPZvoIpy8exknz4YsgVuA/8mNO0eyo7pxRcE7lAyr9EqhizINzWTgGsfG5zy83fSPNTMVNI6837+K5Id5Q45k5BE6Fytf/n58ricj/6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=xLt2syJC; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="xLt2syJC"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id E2D104E4079D;
	Thu, 17 Sep 2026 14:51:31 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B619F5FAA3;
	Thu, 17 Sep 2026 14:51:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4FCDE11C7B064;
	Thu, 17 Sep 2026 16:51:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789656687; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=POrtOuCOqjCiA6BJvL08zu5a4W1N+HThsgVOKIk8bsE=;
	b=xLt2syJCCOC0U58WArMxRSpRADdyj7imBISw9+zTCGs+KuD3U42mJG1sZ2OEQVxEolhlai
	dTJJBuPkxbkv5buRNTzAkq+iKw+VCBgy9rvw1/mhXBLWAUqKHLtds/ddxnh+PjmkWCMUlR
	mYCX9RC9JiJ/pJwwhMqYPVOYMdjQXZLV6du8x0CfboEiR2bwV2oJZeL/02EXKl23IZulLX
	8VOleOTKyd+ey+6qIgPvWyIbtt1n9IZtwW41wRF9O49oOX2F3qDcXeaDRnOQbtU3xL5CD4
	yWeUpSb91I0qmbRDJ+9Q92456G7NPOCuEDqWsGFKDC+QBYgrc4v+XFq8WGokSg==
Date: Thu, 17 Sep 2026 16:51:24 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: frank.li@nxp.com, miquel.raynal@bootlin.com,
	linux-i3c@lists.infradead.org,
	Stanley Chu <stanley.chuys@gmail.com>
Cc: linux-kernel@vger.kernel.org, tomer.maimon@nuvoton.com,
	kwliu@nuvoton.com, yschu@nuvoton.com
Subject: Re: [PATCH v1] i3c: master: allocate IBI workqueue with WQ_HIGHPRI
Message-ID: <178965667891.3018556.16752833200317059806.b4-ty@b4>
References: <20260810013059.3055787-1-yschu@nuvoton.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260810013059.3055787-1-yschu@nuvoton.com>
X-Last-TLS-Session-Version: TLSv1.3

On Mon, 10 Aug 2026 09:30:59 +0800, Stanley Chu wrote:
> The IBI (In-Band Interrupt) workqueue is allocated with only
> WQ_MEM_RECLAIM, which places IBI payload processing at normal
> worker priority. This is inadequate given the time-sensitive
> nature of IBI handling.
> 
> In the I3C protocol, when a target asserts an IBI, the SDA line
> is held low until the master acknowledges and completes the
> exchange. The IRQ handler (top half) ACKs the IBI, reads the
> payload, emits a STOP, and immediately queues the payload
> processing to the per-device ordered workqueue via
> i3c_master_queue_ibi() — effectively the bottom half of the
> IBI interrupt path.
> 
> [...]

Applied, thanks!

[1/1] i3c: master: allocate IBI workqueue with WQ_HIGHPRI
      https://git.kernel.org/i3c/c/591980aaaa46

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
