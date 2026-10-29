Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793269479;
	b=ki+qbgqaYVDbs3xXgA004VeBLPVRHhxugSUh4sGgtYWMoq8dFsdN3yqgey4vnSguUwhw
	 EqgAPlPsGYyquTPn1V3ogTaavmEkT6Sdg4ZvUQT+Bw+5WTcwAktN60hpu1KVQX1IN4Pna
	 2BqW1Wkp7bRLDvvxmZb3MKvl8AQ5CPpuNzHMEQY225fdA4uWZnq8F1C7+IurnRo9kcPIW
	 iNTJBOFb+IzWLH8Z0J1Z2f5fXG9FCvjKe2JRhfhx4Od/G5YcGVhFZnJQPipGKGF7hLv6e
	 PcYoJ4W1VdogY+CEIvXgVs2ql7KzgVF5wDDz9ypb0EkFk5jywWmYSdY1tO/pELAfcZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793269479;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
	bh=PRGCV9cZ4VthOUaNo51WkRzJnsZvTbLhbXjN4sI6wPc=;
	b=08NIBHb+cQEGMUEdy66yx+FScn3f22ooyuNV7xbmCq7mWrvnLYd1WCu6vjxiBVVyoUFT
	 SG3KVA/bxnHmnzk7GbjmANv3IQB5jygCfuhIkZ9U8QVHlgfyCGFsWf8cuOCWHQGfIo7HL
	 2VzN0dXYfFgiSna/YqwKeDNuHYg21hUbzAI7hDwwr/hMeaQW3lOGyEXZUYj9axEa212F5
	 7+v2RXMRE5ie05y2QowTNqx2jAdDZY3+qbcPEHFiWiEeMamGKZe4/evKPqoEoLxHFam6A
	 mjz5mzmsFO6U7fTN8edJtavrfJLSIztL8XlbFGze1u1wc5Th9pqyhugxwoT7+smZlrw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=uzQ2084k;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55E0C606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 10:24:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55E0C606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=uzQ2084k
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id D2BF54E4137A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 10:24:36 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9CE4B60360;
	Thu, 29 Oct 2026 10:24:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EA873103290ED;
	Thu, 29 Oct 2026 11:24:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793269475; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=PRGCV9cZ4VthOUaNo51WkRzJnsZvTbLhbXjN4sI6wPc=;
	b=uzQ2084kCbRviD1yaE++rtmTpeeSVrFpFtGgZ44sVgqlc/NSZTAduSD2P8eTJVLYSpuR3W
	dl43Tv4/VBfZPBmlz/Fr9EiTg9etCbpRFwPhvgAnyRXdZSsO8hhkXf52VLAwDfjUoVtg/F
	laKAnHBqXupmsHqtakj1Q9yW3B9yUdzQ2+WMRCmO+ZjFuKgXJJdU5XOaXSyhhLAy8R8bUB
	WVULSzjCM37uY38g7v9M+fKlUoGFsnp1LVme26DZ2g0ncjfWOuG9LivnJadfoDim9I0YiV
	dImIPOz+4L0Q9TearVPLef7HKXSxYnJn1iM0b/bkMb41lRYM+sudGFR/hkUytw==
Date: Thu, 29 Oct 2026 11:24:34 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: linux-rtc@vger.kernel.org,
	"A. Sverdlin" <alexander.sverdlin@siemens.com>
Cc: linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/4] rtc: pcf85063: Update interrupt support
Message-ID: <179326945279.872181.7368976629277935202.b4-ty@b4>
References: <20260828164445.3907839-1-alexander.sverdlin@siemens.com>
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
In-Reply-To: <20260828164445.3907839-1-alexander.sverdlin@siemens.com>
X-Last-TLS-Session-Version: TLSv1.3

On Fri, 28 Aug 2026 18:44:38 +0200, A. Sverdlin wrote:
> From: Alexander Sverdlin <alexander.sverdlin@siemens.com>
> 
> Add hardware-backed UIE (1 Hz update interrupt) support to the pcf85063
> driver. The PCF85063A/RV8263 have no dedicated update-interrupt source,
> so chrony and similar tools that rely on RTC_UIE_ON fall back to the
> kernel's software polling emulation. This series repurposes the chip's
> countdown timer (TCF = 1 Hz, T = 1) to generate a periodic interrupt on
> the INT pin, serving UIE entirely in hardware.
> 
> [...]

Applied, thanks!

[1/4] rtc: pcf85063: use devm_of_clk_add_hw_provider() for clkout
      https://git.kernel.org/abelloni/c/a451b6bb922e
[2/4] rtc: pcf85063: do not clear AIE in the interrupt handler
      https://git.kernel.org/abelloni/c/75ba9f3a6a0b
[3/4] rtc: pcf85063: preserve the alarm flag in clkout register updates
      https://git.kernel.org/abelloni/c/09f5d9b8caaf
[4/4] rtc: pcf85063: add 1 Hz update interrupt (UIE) support
      https://git.kernel.org/abelloni/c/45efb584a1c0

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
