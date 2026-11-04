Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793800217;
	b=Yk6YFnLRBKV8exyYILJsxz4RBi2zr6ksa8ZgpKP7huTld7/f0sNv2TnnlHqdJYvwH6On
	 7DSoEe3Kx3N7DYVm41nh7sMlAu00H+uWqb2m6Pir2jnAyIN8KWSCbLs5uRwhcpKwCOkmD
	 VKlQ09CsQKeSCiGBt6FgkAjq8P65Upq9c9Pa4L4xfBXgKtdn1g2KaxK/Hjy4a7HfdZHcY
	 CU9FdYb0QC6p6gB6ZQdhzuhaerezT3hUJmoAbBM9nVKPbnQIC0DGwKTPdxo0delwb53TP
	 75vVT9zXISi4R5PtPnoiG2yVae0I+OsHVBxZQCBgSGyo/GdxX1mSk8dUbNdzwnX0LnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793800217;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=gEk6xorPw5gb8yxYwLwtpa5jgaqjVwNrEmfQm53gGBI=;
	b=x3wJ/FhQ/z3aMO1ZkcI3EVf5hm1yQCpvNA6VF5t73DFJjEh294i1vhaJdE9p2utZ8gwV
	 y18v4oVDRZvEPMplhXOYNHVdFFcolUpHHo8iTHlzOxTNR4mQU5N55Z3rQ4Yg7W41Fpwo/
	 Ww4t7MJB5h1NJ5ERhP2zCjR/9I4R/zJCMvkIYHw9vM0/XNWV+Fa4BlFfutnLs++8HwSnz
	 vQ92xRioP/T7VQwJN7LyH/MRs/oXgSUiKLvqKgaEhxEmoyyqSXQWzSoXHEeXCaUKRnIpi
	 SMWUhQoJ97X88PO1wr82z1yHghceRNhz67ldv1EqeOa1hsHOoAruLPwhOCMqDTBu8Zw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=b1Ptw56y;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84817606A328
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 13:50:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 84817606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=b1Ptw56y
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48e04773687so307706f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 05:50:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793800216; x=1794405016; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gEk6xorPw5gb8yxYwLwtpa5jgaqjVwNrEmfQm53gGBI=;
        b=b1Ptw56yq0D5+pQfQTThcCmHYYF9buugspKazy0mbiF/W3Fi23hz06QhEMiy21AhU/
         k1G+CdPi3T3usJmq7eCeSSaJlr98g0TwaWyUJQNSd9nVZrsQ5CAE7YVoewrQ18a7JYnR
         cl9vEXV4K6+G84jlMOQE7o5HQKVAYjq9060+F9OLU/3J4Nn6NwIjXAJ43mvtTGZVH/Q3
         R3/U5mR5fSibifiDXDh83i4HlxM3skcMDrCCia18F2KcK73cb5AgJ2jVIrE78yS0AfVK
         1liLqOe22ipgbYV4I47jnqM9xm/ALXWPcjHTROy6RRIUSZsxnhvLxW3wez1YD315kCdZ
         YcRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793800216; x=1794405016;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gEk6xorPw5gb8yxYwLwtpa5jgaqjVwNrEmfQm53gGBI=;
        b=TPanu3J34o27u+Vr3Z5ggIiyJA+ISiqIp+MJTVjfGoAWUwRT9UDkKiY317LzGKhcnB
         BDyLBkLL1hsT15gQyxvITd8VZjWGtPIBwXEYCAQev0sDq8EA1asRcVJ1GdOvaICcsGq+
         j+Dg0z6TAxO7iFw21sepSYTajCYFjeStDoipZPcr4Pi0DG2Jm8sq5P1VfIzGYmjzrhbZ
         ktCbRYmfUeFspM1rTkW3lgSrxsjUlqFU2mP8KH3DoitU7vaYRdWQUJMjNCXCWOOhY0FG
         GeTe3rPezG/fknrT0IzXBRm4JEIXqxLVDxyIouvlKPVZIP8yCkN//HeXIOeEuEoxw1z1
         jXWA==
X-Forwarded-Encrypted: i=1; AKwUvBz2mXVfEY/8mLjBP7lHgQ9vhWYPSJ2gqSVtQjIjWS5Jr3p108cpg5wra/I0lgcuvVa8XZCWN+FMLUmOUYE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+pIgSQRc4J6vhFC8G2IziOXlVTKsyh4YMoFtbZaXFfsY+E/Axq
	q57KYc+eS1DeXnRHQiks2bHxc1BV5SXu9uK81r/e3/DLI4OxyJTlHnIps1OvJzM8
X-Gm-Gg: AYBFou2n42Fq3TyUMMgoqU0BSxuV23nTz+OsN/0NeUyrvsVuPltfMiOORPbhgA6Blm3
	Y62VQsobJGpelyxp4f/NPXu32bXFbixZRccuxXXClb3S1f8BoyU6TdlthGGv/MRPBhR2/Fs4vDR
	yIPlhdaAFB5YhslfWgTsBk3pamG0gcDpELsw4x5fXwhqJO94bLwQnbYFCG3sSl/qAwuAVhoPKEc
	DbPkqX6MZNFkyahgxMQ6PHemX7RXBkQXM43v6qXGt0rThr4INtChbXTL8ioBkOGNxaDw+V45d1z
	32kmo724XFaGm14CgkCEOVGxH0QkD2E/BkfZ26nWJEfMZl2VPbtDilnfxArO1XyKAVSt5Udmkun
	+dBzL6AsK225d9fhP9kMB5k4vJwJq+ALUeOw3SXJFzaazLcx/3MPQZPr+xpCMKMunnWUtchG9lL
	QHuECR5P8elIisl9m1YfNtceLRmSZNA+vUMqX1J+2KPcvyYyCCiKXN9yOfseA3H9yttxd9DU1Y+
	2zucAv+guHAS6t87v3501ZbMBjxRpJGrnqPmIjGIIRohLx8BgUghahLTC2INnHdNjMmkHleOAqT
	3jDl60Y0QoGQfmLj6EqSxhGwLHrgUmIkYQIOZmQrklX0JWYVUY/kHlIdsYr3fzMkgBMJFKJJvKY
	aWA==
X-Received: by 2002:adf:edcd:0:b0:48b:f08:8159 with SMTP id ffacd0b85a97d-48e6e502fa8mr27675362f8f.40.1793800215622;
        Wed, 04 Nov 2026 05:50:15 -0800 (PST)
Received: from kreach.multipass (nat44-21-238.net.ruhr-uni-bochum.de. [134.147.21.238])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48feeb5196esm3701024f8f.58.2026.11.04.05.50.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 05:50:14 -0800 (PST)
From: Jude Gyimah <jude.gyimah87@gmail.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com
Cc: chancel.liu@nxp.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jude Gyimah <jude.gyimah87@gmail.com>
Subject: [PATCH 0/3] ASoC: fsl: fix missing GENERIC_BITREVERSE and REGMAP_MMIO dependencies
Date: Wed,  4 Nov 2026 14:49:57 +0100
Message-ID: <20261104135000.3723017-1-jude.gyimah87@gmail.com>
X-Mailer: git-send-email 2.43.0
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

Each of these drivers can be built into vmlinux while the code
providing a symbol it calls is a module, which fails to link.  The
same shape in 3 drivers, so they are here as one series.

Affected: fsl_aud2htx, fsl_xcvr, lpc3xxx-i2s.

The fix is a select rather than a depends on: the providers have no
prompt of their own and are only ever enabled by a select, so a
depends on would leave these drivers unselectable.

Each was reproduced on v7.3, x86_64, by a vmlinux link that failed on
the named symbol, and each links once the select is added.

Found with kreach, a static check that compares what Kconfig allows
against the symbols the compiled objects actually reference.

The checker is at https://github.com/JGyimah/kreach, and the
reproducer configuration for each finding is published with it
under results/.

Jude Gyimah (3):
  ASoC: fsl_aud2htx: select missing dependencies
  ASoC: fsl: lpc3xxx-i2s: select REGMAP_MMIO
  ASoC: fsl_xcvr: select BITREVERSE

 sound/soc/fsl/Kconfig | 4 ++++
 1 file changed, 4 insertions(+)

-- 
2.43.0

