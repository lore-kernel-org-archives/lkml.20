Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794359238;
	b=CITIqu5Wdo8aRkyLS+ikS0E4yF73Z+MbVE47e/ifV0neXmMqTab2SvwimAT4T1w5KODh
	 bxiuct/oR1Hc2lyBzvHMV9OK2gnkxMvVV/mJvN1pz7yiYiOwDy2y25rc8dVUzUePTjGB0
	 sAjaT9HyAJQBv4UzvixvbyrmXJe3sLlPLKOB0sLlL3suzEbqF8Ue4w0HQZymXQ4ouuOYD
	 QvA3XiUTI3q7ooMNrwDbekGutXgd2pyiqVRExbnKqvdRsl6R4+iRLv9v54v9wUpINgGKD
	 0XNV2bOOiglxRj3Iqef/M79PbO3X73D4HGATnLBKT5Jgt1KXZywkcJMesbwtbxtYgQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794359238;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=6LbzmDz7qPraA+XTAGiVYeN9C//rOWw8KeOnHh6tdK8=;
	b=o8rLJPuo94b2cJPg9cNrPUBJxo4MfQoq+ji83tOr/ZO5QLCQBAAhJVr4kdJj1hU38lVK
	 dV0MU8lr3Opil1+T5gRUz4Roe//17Zl7suk9TLgxgR9C+KL+/gerHrfAsC+CdQtDgg9zm
	 FePp9PEbaXluWq6YSpMhxnu6TDy8Xss23h83aXI9bv5ooltA1hrgI8CZDYYk1L9wveIRi
	 nmYXVKsI2EUbqBlgefvL5+yRCKn+jizP5dfjn/c8LDAlXlHMtewCY8WF9Sn9tsrlTRd7r
	 Y4CwCJOkrjD/o8k7LPDf3ewb3Zxwla0ThUS7HXaKTWEvoKupNyiBHLGwmsmCzbpgSiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="eJebg/TK";
	arc=none smtp.remote-ip=209.85.215.174
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DFF0606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 01:07:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0DFF0606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eJebg/TK
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-cd69954c755so1883807a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 17:07:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794359237; x=1794964037; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6LbzmDz7qPraA+XTAGiVYeN9C//rOWw8KeOnHh6tdK8=;
        b=eJebg/TKvg9sXmzHFGcMsw8BxRGn+Xpnifgl0BcLeTAg6afBoa4phoLi1zBN2ow7nv
         Cigr/AilJUn6A7n2WHJ6UavUzaO5qxvQjaqdAWMh9w8PEIlyYmB4tZfP2nLYAGzatesR
         pH+H624g64fCOouYMmsDJEP0K3lC/i8hDHvtj1UbMPMK7kgkSg7A18THNcrqOQrpbVAJ
         rEyLPx+1oUygIwtTkZrbG2m4NiYGAGtz0e758vrdjLHOk88N7PpsNtJzQQF82E0Sm3kS
         fiNAfsUEhF9L9X5GaerDWwVsvhbmxdyAKjygd2mogGPq/KKkUJdPer1vTwiMCZWuXgJQ
         jGhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794359237; x=1794964037;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6LbzmDz7qPraA+XTAGiVYeN9C//rOWw8KeOnHh6tdK8=;
        b=fxEfAsqh2/tD/56vR9ahB3m5bp5YsrRdDRmkK7sv+jM8AYFVzxjQJrTGLr7/TUYLWj
         GXLmGTjbuDFMIgTb2USS3HkyhrCmabVgFfHZrQ2JI7OY1Ehdl6HzTuLvqpvxbc2Af4an
         xzojefNstoDEacFTYbb81d7NwawEeQtATxvjmFEqL67VWNXf5LeGzgbYj4rITUvUQzL1
         VHLjFFTj8fC6c2DsXzhB4ca4JVFwpOYdkFYeWPMIkQ/COnH/z8qryhFwNapnrRqvcZ8p
         2Qcs6+NJVK9ekyrZFieYq5rFpcz1FSTJJ8izYQyKissIznBIrL7wh/LOKuIdQLolK0Xd
         Ndfg==
X-Forwarded-Encrypted: i=1; AL+hErEM/cGInOC6aAO1DFYs2K9P5cWKDbl3e+5t2OmzPLtcXrxaImjLjaia5cAWqlyMEN33nS/ZDx83Ww5CaP8=@vger.kernel.org
X-Gm-Message-State: APuU4Z95BevtD8YTE7o5MZTwBwDl2HmLI0VIm0CJ2E80jHrWMCkKI2ad
	vBvf/+QIwwNrkZyJGRJrSt6IyNr+sxfCdilJbBdE12gnEIrIVZ4emmTUCcScZHRF3N8=
X-Gm-Gg: AYBFou3RJJNYw9IMt90REF0ss+IZAPCNbhNBFi6ZXlpybGU5THF5YdVJokOp0NGQA56
	AAVtguna18OaExMJ+qqFYF38NwkiR6z3h4d9q9YrzU//SvDWMCdXXci2rOMDfVZ95wtFynIdEkj
	HDozoVL4Zn6HV7lDayZ0XlWFwoeIqTQsje/7vCLJ/ylBEYhsO/cSyeooIU/x3xKpDnwo99kBZGu
	RglJaOZ7Qg3ZMB/Fr2eMWQKoWWluqEIMkFFVXwpINaw07kmdC0RH9q6ZP7o530kO7egktcup4Re
	dodLStdiWr8v3aIV0/oW3aV/7Zu+3CARO7OLkB9I5PGrxWSnEZJDKiGvAq7yHFEeuFvuSlne+Bv
	P3ou0oWBBxoa+Q/uz5T08m6t2DRH19W4mSgGEVwiaZrbmVUJEiLw1LNt6pT9bp5i/HFVWKTqrpc
	jUURt5eLgLChgzx0uw7hzBlsi/bfpj91uOWWG9YfM5IiXTO02SulGoinn2DzKmA8AwSh33TIiTS
	zXLaZr8USfOjfAYDIMURpSqGrQyGhHk19hNGTFt/AgMANe/kK4Z5gCIttXri/JKvNHVYTj6UcbI
	YfUY9VT03PyqMdGxslhm14dYUk/RPVJ/obDGvGp6gHUyha3alzGZxCZCXZl2WgQ1
X-Received: by 2002:a17:90b:4f42:b0:3ab:b39f:41b9 with SMTP id 98e67ed59e1d1-3b182f1f60dmr736828a91.61.1794359237411;
        Tue, 10 Nov 2026 17:07:17 -0800 (PST)
Received: from fedora.lan (d173-183-236-7.abhsia.telus.net. [173.183.236.7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b181f8fd59sm701711a91.1.2026.11.10.17.07.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 17:07:16 -0800 (PST)
From: Artem Novak <artem122novak@gmail.com>
To: ysato@users.sourceforge.jp,
	dalias@libc.org,
	glaubitz@physik.fu-berlin.de,
	geert+renesas@glider.be
Cc: linux-sh@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Artem Novak <artem122novak@gmail.com>
Subject: [PATCH v4 0/2] sh: sh7305: add TMU0 clock support
Date: Tue, 10 Nov 2026 19:07:12 -0600
Message-ID: <20261111010714.227429-1-artem122novak@gmail.com>
X-Mailer: git-send-email 2.56.0
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

This series adds Common Clock Framework support for the SH7305.

The existing SH7305 clock implementation is converted to CCF,
including the master clock, CPU, bus and peripheral divider clocks,
and the TMU0 module clock gate.
The legacy CPG clock framework is then excluded for SH7305
to avoid enabling both clock implementations.

The series consists of:

sh: sh7305: add TMU0 clock support
Convert the SH7305 clock implementation to CCF and
provide the TMU0 functional clock through clkdev.

sh: sh7305: exclude from legacy CPG clock framework
Exclude SH7305 from SH_CLK_CPG_LEGACY.

Changes since v3:
 - Split the legacy CPG exclusion into a separate second patch.
 - Keep the SH7305 CCF clock implementation and TMU0 gate
   together in the first patch.

Artem Novak (2):
  sh: sh7305: add TMU0 clock support
  sh: sh7305: exclude from legacy CPG clock framework

 arch/sh/Kconfig                        |   2 +-
 arch/sh/include/asm/clock-sh7305.h     |  11 ++
 arch/sh/kernel/cpu/sh4a/clock-sh7305.c | 262 +++++++++++++++++--------
 3 files changed, 196 insertions(+), 79 deletions(-)
 create mode 100644 arch/sh/include/asm/clock-sh7305.h

-- 
2.56.0

