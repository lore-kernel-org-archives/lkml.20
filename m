Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793783650;
	b=v5JRuZxOh2T3ctfnvwG/MQlQKkTraVfgCezy9d5YMtTsknSGJlQN+YDf+WzFBILHHIE/
	 fCGBMW1HJMDJKzYulFrYgEa+jzfAIsKq7P8hOjLMEX29R2Wh5CQMpT1v9h64WE4EPpcbB
	 OHvzDiajdEBMRDlCoMfPLMCBmM+HlSuv6uHA5QaXCpIaqPr8NwU4Ck9ZSj1JYyDaUMUi9
	 1N2pWH2FgkSpnfxJTMO4EOwc5aaLoxk9KxfS54yDjX0uGf4DFPtqse0NAL8d1TbcEjCFD
	 qFS72pFz/baxmMzCckVnhWVHUHyNHjAYby4Uhdi8noiR9pC0j2cPODWbuFoMCEmCaJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793783650;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=RZxgyHLYpQfVmNKk/t6Xpk45GoPrOkICCosBntPfxgI=;
	b=cnHb3DIMRuk2qrS/p0h8/EKpLZAQv6vWkES5b+RhMjrHqRpy/CKgdJuv05zau7gUt8wj
	 kXm19GmyKNR45DnIso7qbAXhmSaLf2eh4U/FqLmx8OTAWaOykvGHx2jKbrxKVygtXW9gT
	 RWL0/Cp5XgKvry7IQag9k/4A6M/cr4A3qu75ayCrJYTjD11Xvt5bWNox3F0HQL6PZOTAz
	 aDTLLWLIrhlCxqmos80mkR+2UYtqdluY+WFPg+hSkqpOhJNelUMI1Atdd36ravGJKMVeq
	 tQuZggspV8/FXCWC6ti7tchjjeRF/gPB41EtfDA0wuYQs8TM2HJePvodgosItBZC8ZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ovEBdQu7;
	arc=none smtp.remote-ip=209.85.167.48
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0CA1606A326
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 09:14:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0CA1606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ovEBdQu7
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5be3d5927ceso400586e87.3
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 01:14:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793783648; x=1794388448; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RZxgyHLYpQfVmNKk/t6Xpk45GoPrOkICCosBntPfxgI=;
        b=ovEBdQu7mXQSVLjL2PxY7Ip5IROKkDFYz/TXSQWSy4CCdAVh7GRNasKRXcNPzYYmHJ
         4b2hHeO44tbZpLSSutXl89L2djpPTQ3BOyipOXWssnxASfmfGdJVKX7uEA/APWp0sXN+
         ox0avHxpHXESL0o8f1+IHjnBeGunRT1QxpDSzx3BWkHgKke9nFIqdbGV5p8kHXRTsaPe
         xlTDptG3+G0WDaV69gejTKSjGeUU18PudEP/nXC+I+xVNClaJYZhYtV1ZjxjJBJmLlCE
         ESW9CAEd7xLIZcHYlrmE9M2js8cjbvUdZjYt4KoOltUvVRjHO0yYTxnOX5AzwIT9NhVK
         Q6Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793783648; x=1794388448;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RZxgyHLYpQfVmNKk/t6Xpk45GoPrOkICCosBntPfxgI=;
        b=MsZ2Q8bSvw1owFKf0jtMz0lXz5H426H/CUcQ7Kd0ua1OTPrVbipdnGHkLpSA4aoN82
         PGcRgWT31jbR0hVsXQ4D0ZLXaMvHTm8OrjK0vL7cpOlqwLT7+3qJHuB3O6E94BlfLqnO
         KW1UO2YOuCFIcPc5MUwEAw7Q7Dnz6hKTuATK0+C5kwESrpRAhsCHRQxxf/c+E/QIipgW
         WE5B6Wxf3+dQ1Hn0AtDF8jMt77oPfNEE6SDr4xc0OPuNEup1x3CmNoJlxfHB7/sNdnXX
         hJt/f6GBm0KoLtavf04vRzCoefALDofbGjhar1pWwhOmjArY74S5xGR94vy9u9Tgo7mR
         yAAg==
X-Forwarded-Encrypted: i=1; AKwUvBy4CYZuKqVJVFIHxDKuuiAC1xyxoh9qLnqkIhwZ/pgK6vEMrW6wE0JLauY2Kdi5N34oLIvD3ESusRal78o=@vger.kernel.org
X-Gm-Message-State: APuU4Z9OQbkFLxsXKY7MmFEunLRG9IVxQ46JjgFQFHbjqoMeTkXjibf+
	a3Yfu6RFuAsm1xJoXcAZRuJM8U+hLz8GMLu4YoNKOjSf1iJepmHSEusW
X-Gm-Gg: AYBFou1mZQF9tk6VlsJK/vzukUbi27cp7wSbzp2p6hEydMO+BXSWz4X8fzeClKtInJO
	gvBlGaBhPw/mgoq3xnnWZRiIJJzdMr+pW05fa4N6k/SN4Xjpu1NJeNOfDtzoaiKfngHwqWYcYdn
	tBWgdLq2bKU/+IOEaKJ4Cuw1V8IEtQejqykSR1hInexVHuhURhjTnG8gQUe2BCJWH/1cNQ3D59s
	u7XB1fHcSljAX56zwndRiepvzo4UiwMR2A24xsYfh9QMaZoMkYGYFqF8GGfDKE4sVmnx7aljgCI
	h5vByRhdXmGYMvgnXNoL/nlniA+L05xBfYi1oZLTCuHds8ZFq8ZKvbYJO4ug/2smMrCz+knlOMJ
	XtySxLUkLSp8T+xLE9a/ZcPClJ2WmTLrZA1QM1JpfwJqD8+7E48dklJljg1FfdV6UPGmU+mLQ5F
	UOsd76MH/MRjTeywdFr4mSzmFGDh/TZ9lyJSdd7+dLLPPxlLL38H4UD4Wie8NbamPMLa5B21Dx2
	QoBc4gIs7SHTCA87l3qU8xBmRLJfvmuyAaxqHJxN7R5g+9MmByrtGX3tqt0AvIolp/F2SBLdYH8
	jd5C5iVjzQThlWpEZ0AP3rLUnaH2lkFFoxln+gA8YQ6vw1qUXeWW5ZLtJx+6Es/VokImVAiOqG3
	P9EHCY7gCpbB1m7S0qUjrex8B+NuMyVqfvvzDRCFv2dA9xfD8I5MJqRHfIg==
X-Received: by 2002:a05:6512:3c86:b0:5bf:b27b:635f with SMTP id 2adb3069b0e04-5bfd957b6e8mr5587275e87.13.1793783647544;
        Wed, 04 Nov 2026 01:14:07 -0800 (PST)
Received: from M-K2012N0113010.localdomain ([88.119.128.229])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bff38ab170sm313037e87.16.2026.11.04.01.14.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 01:14:07 -0800 (PST)
From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
To: Rupesh Majhi <zoone.rupert@gmail.com>
Cc: Paulius Zaleckas <paulius.zaleckas@gmail.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Andy Shevchenko <andy@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Eddie James <eajames@linux.ibm.com>,
	Joel Stanley <joel@jms.id.au>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] iio: pressure: dps310: fix input checks and resets
Date: Wed,  4 Nov 2026 11:13:50 +0200
Message-ID: <20261104091351.710582-1-paulius.zaleckas@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261103223008.12675-1-zoone.rupert@gmail.com>
References: <20261029220635.18816-1-zoone.rupert@gmail.com> <20261103223008.12675-1-zoone.rupert@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, Nov 03, 2026, Rupesh Majhi wrote:
> Jonathan is holding this series for your Tested-by. Could you give it a
> run on the ZTS8032 when you have time?

Tested on a ZTS8032, on iio testing backported to 6.12:

- 0 and 0.5 are rejected for both rates and ratios.
- 64x at 4 Hz survives a timeout reset forced by putting the chip in
  standby behind the driver's back.
- A warm reboot during a FIFO capture: FIFO_EN is clear after probe
  and reads work.

Tested-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>

Paulius
