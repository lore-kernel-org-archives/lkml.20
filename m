Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.117.254.33
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794133166;
	b=FsGWfpscvL4vOL+8mQ5M1m4NHm6AcQ8sXwlxS9RwZX2LFlg038/HgQKVlqYjQ2bEIKaA
	 l7Yp71YJQx21W54aQ9xMWOY581qJIp6fvr3T2QcYlRaVmsLbUP0rDz5pJ/SN93lnpVmE4
	 HeZTEMBJy1WrTje29Fg7C+P2sjCmIJ5RSUN7Txy6vFaonGjauZ0Sy7WkD0yIv2086hhHt
	 vuNMGx2yMEWGYFnKM7LFXpdGqyhfy/YckMhcUWFww2jy/6D4PA2orxXk1J4UqF8Fb1kL3
	 9J5qUZxohyx/HV9CWjP5MQIlrnRWDPF7O5qZmGa6+CGlU72KQv0RR85t2yRKnGzczhQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794133166;
	h=DMARC-Filter:DKIM-Signature:Received:Received:X-UD-Smtp-Session:Date:
	 From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=PpQxkPSco3s1l1g6k6xE1/ySXul2oC8Rp3+HSn9NQlY=;
	b=RQxIG+lYH0VrdYfELVlNyaxDATlUGHj0J+PSmDFISGRxs8SegZD0hjFEVrcSAV9BZkTc
	 SNpoRu7A+Q5mS0YR6k/Z+3o45jV+J1xKgvf5NSOonFLvDN3zPim+rzDvVE6DLgkBGqtjj
	 H4OcfBgYD0sYH/IdAd1BVmihXpuMGlQQ9PSW6UVC03Wrv95G/epnnShUG+6DF22lvoSRU
	 De2uBnunXbBmmjfeMvWCO+1hsU6ZazmX05pmpQmqUTpma2HLaWg5VGEHIahTKXvGGCvzk
	 mp0fMiRiblD+uDsU0Q9A858q7qR+Ued+ExRx02Gi6CWymbw+SbfRbsfZaCNbzRVMpBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=sang-engineering.com;
	spf=pass smtp.mailfrom=sang-engineering.com;
	dkim=pass header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=IEXWQ+mB;
	arc=none smtp.remote-ip=194.117.254.33
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2C85606A320
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 10:19:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E2C85606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=IEXWQ+mB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=PpQx
	kPSco3s1l1g6k6xE1/ySXul2oC8Rp3+HSn9NQlY=; b=IEXWQ+mBbOzgPIY6Y0BP
	ZC+Rj3HVGsEhuIT4uLC5vLLpint7+s+KyHTzqEwiM4s+dO57XeMkGHIkmD7zXwjv
	qDZXOEu/RwvoMIfW/ujClr1XI608mbUOYUy3oCwrysSWTO6pgSvy8FkW/AkpEiaz
	c7gcdTdqgI0ND/KF9EXbtHZ2b/5+ph5jJvFOuL0eyCIkskt18I+zAL49UDjfFPef
	gqGYYjdSyH9iyb78JFAzM31aLy8aUq0hI8CQA3z8opONaISgcwH7phqTwBITlJps
	IQY9rebsBJxdRGnOGU9gffEMQtZ7Gti5JX4Bd+qHEhpGzysZbB+BHtAOblUfH6a6
	QA==
Received: (qmail 2808556 invoked from network); 8 Nov 2026 11:19:22 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 8 Nov 2026 11:19:22 +0100
X-UD-Smtp-Session: l3s3148p1@CH2rLcFfwo9e20rG
Date: Sun, 8 Nov 2026 11:19:17 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Linus Walleij <linusw@kernel.org>
Cc: Dmitry Guzman <Dmitry.Guzman@mobileye.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	srinidhi kasagar <srinidhi.kasagar@stericsson.com>,
	Ben Dooks <ben-linux@fluff.org>,
	Andrea Gallo <andrea.gallo@stericsson.com>,
	linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 8/8] i2c: nomadik: reduce FIFO flush timeout to avoid
 long interrupt handling
Message-ID: <avBMpSKHPnsz4vMR@shikoro>
References: <20261103-i2c-nomadik-fixes-v1-0-655c6af2cb70@mobileye.com>
 <20261103-i2c-nomadik-fixes-v1-8-655c6af2cb70@mobileye.com>
 <CAD++jLnLz_Y_W3Yg13WNntN=iy8tzxAWN4Z0rr5YnO2QfYdrCg@mail.gmail.com>
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
In-Reply-To: <CAD++jLnLz_Y_W3Yg13WNntN=iy8tzxAWN4Z0rr5YnO2QfYdrCg@mail.gmail.com>


> > In flush_i2c_fifo(), the driver sets FTX and FRX flags and waits until
> > they are reset (these bits are self-clearing). If after the first read
> > one or both of these bits is set, it waits until both are reset. The
> > timeout is 10 * I2C transfer timeout. I2C transfer timeout is by default
> > 200 milliseconds. 2 seconds are much more than needed: as stated in the
> > comment above, the flushing operation takes just several cycles before
> > completed.
> >
> > flush_i2c_fifo() is called from init_hw() that may be called from
> > interrupt handler. So, if the I2C controller is stuck and the FIFO does
> > not get flushed, the CPU may spend up to 2 seconds in the interrupt
> > handler and cause watchdog timeout or other unwanted consequences.
> > Moreover, if the interrupt is handled by the same CPU core that updates
> > jiffies, the loop may not finish at all.
> >
> > To avoid too long waiting, reduce the timeout to 100 microseconds and
> > use read_poll_timeout_atomic() instead of relying on jiffies.
> >
> > Fixes: 3f9900f17cdb ("i2c: Add support for Ux500/Nomadik I2C controller")
> 
> Is it really "fixing" that? I don't know if I agree that this is an error
> in the initial submission in 2010...

Removed it.

> > Signed-off-by: Dmitry Guzman <Dmitry.Guzman@mobileye.com>
> 
> Surplus newline above? Maintainer can remove it when applying.

Fixed this.

Thanks for the reviews, Linus.

