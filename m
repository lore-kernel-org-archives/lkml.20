Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793730653;
	b=UXaMsMwRBEaYXbrV81FLADKhbOXc5gnckWeWDQzHvtg1rkbDmgJ4RNW1ukbMxOqhVj5D
	 UAni+1fBRj9fNsLBws1PTb28nylHY3HDv8Payeq3acO61oB+tGcckPw5jufiwleDh2CLn
	 hJiITQNBt0/J0kJ4ckdEmbRf42Q2bwdJCTNJ7g37pDh8XQ7ypdwCE44FHJJt17FOMzxhx
	 Hq2KR5cTARHi3RhBMAJNr2N5WSKQbeuz8PrdXWbQ4p9Gt1+yOONSRefNTGzIpLDUq0ghu
	 AqgW6QIvBU9Dz0NaggU9IRYKAz5bwunFecBjIoLqeDM8blaxrxXzUPfX+j5rag/Umiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793730653;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=/iod9oXhgsGpyGcJPFTu5fqKBMIMVHyACTtYwHQfVM0=;
	b=JWqta19YSd5BUZNeeGpCbJyx4APg+WDKCh6nocyxLEyFW9aDAmOrhgSpZ7BhTqoIDEBD
	 zWhZm7RrRdNG4x/zJ2KD5EeDbKuJFAihuB5+EH50e8UO3K4GmNJ4CYZCHSCoLVAK6U+Th
	 kVHUKhI1JpYyKhQMszuOLz97kD6x19xptnYhzA4NNBxYryjCPWiG+0aVqaR2EYkBOyyy8
	 iIdsq4gBZqY9Gq92LpGdaJp/4C8Z3aJlCeQHMYGCFDeimPeK1+SE0HP+tM4mVhnwR0lTO
	 X7bOTyIPY5uhFARdZvYbXftjFr3UMGf0K4Zwgg6jcx1FxC6Y0wpuy17GtOnCnDMMz0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oTE0Ftyd;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 649EF606A326
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 18:30:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 649EF606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oTE0Ftyd
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a214c5c4c0so40944175e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 10:30:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793730651; x=1794335451; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/iod9oXhgsGpyGcJPFTu5fqKBMIMVHyACTtYwHQfVM0=;
        b=oTE0Ftyd1ftHdx/k4ZvP62rvGiEotVrlyVzG8K8lXiQB0n7GOL/Ivt6ERRZJspNbDU
         woWFmaXITSpmezb4vI1eSBO3vKdT1L9ObUomyL6sBzkYAJDTzjhK3NWmArSJdE0pjM58
         nGjaDDgROXLR92862kuVIr/UqW8GGxTErnhpJraKIRKCxjns0+TbHFajys4PwFsp6m4p
         NKlz2SyLsfJKDpWRSTsMHAgbEwrHAwhiWiXCxmfvYmTqqnRwgithsHO5R3YU9o4MU9yO
         RYJhaWzyqaq4HSD1PhvLPXGrnzTnRtnwrqTIcPw3oXyaNKfxaz4HpZC33TGZY0yRmH+p
         4OkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793730651; x=1794335451;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/iod9oXhgsGpyGcJPFTu5fqKBMIMVHyACTtYwHQfVM0=;
        b=CsJSZRCs9AVQuNsWtVi8Dt9r0ERdj1yygRR/uh33bNyDuQjyOE/0aUMUSfuoRuN/2f
         s9YdLCW6aAZ0lJ/YIR6jB8jC6RAtH+DL1/4t8Da/uzf68dw1OCCW+VUEufgfwTNYFFKE
         Iqt8RlBsLpxzle3URIMH8U4MreLhV6ERUmAzogZqm2PA70vHwX+rTYmqhxfYCn5/UuiQ
         ly5DMsK4pvbcVXK9dlTpImy7v6vGgeNZ8Xy1zX0hTCXdOAm25/JTuS/qo4bjsoto+vpm
         Nu0ilbrWUfSyJvLjc0L1hHOylAdGdxYbb3ebcU7DTQNkJ9FFNhR6ADuNBDH7FbeIoQFp
         C4rw==
X-Forwarded-Encrypted: i=1; AKwUvBwPRgkOduP9yFwsNj/DmvKsozzGUXgcCx7kXFQ4GDFZ+LFq7C7OHXukTn6R6ANuJEsR7xeyqbf/lWkrets=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ZYNlcoFWV/8NzabjN7gg5l1eKH9FjVH0XZSMZfu/0UaBITbg6
	xBRLsn0c6koB9xWaXToYgoYI4cjqTwzJDYTwhun1dd0k94nkHd+ZtuMn
X-Gm-Gg: AYBFou2hObNHak258EiC94H3SJLCnW3r3v+IgWzdQFP9NKNTTGMegt/U0QQnL9OEAPQ
	r3KpKt+PT4yzC+8EbZRd+BbqjkFi8XGzg30oYNEUAbgbrK3/H0MC36I6SYxpAmF4Bie76/ZkTF3
	iTLxKgywiKJnNvvyPOCt376mflruMXZ+XeW7hbJhbTMqXMScFZiHSM5XOuW0ZNjh4rnBXCL8Qai
	GmGwsWrrJlgVg9dzexaRHzXRTWJChsoIz7Wf4DmfjQCfetZ6WwPdPFwAyzun5xKMvjN8nPP2+Ry
	wkPkQMvCNbroCTb04NXC7JzqhhwlhV0SQ4P3TumahrEcDkzMHkawUPiVcS4VUVBiwC4Gbn+ZY4M
	eLxCjCGBZvf01gKTl94zTWSTRLLKJnjo+9Rd+YzoJqREwhJeL7Oc1F/V7j6nfmQjPFBZqNPd3su
	ID96oLRuQcIq+FPf/MN8Qv5Yo8KUZFZsMaP32IB5ULC9v30sucbGAYoiN9PY6cvtooM3jaPdgfM
	xa2gsArw3RVIO1CIlZqhvFSd4AAOHHS6I4JHwvLI/G/dOgqPP4aGupegYZehU+aVEAkKhehZuyB
	pjRZyMKiOW2plxNuMQzUF5v6QS8/hVGkUWZd0GFdIi5Eye95ayOeAjRIk/KJpMMRW+2/WCOYJTO
	rHR35Ki/t5VOvxwWY9+d6jaG73TwUwjVZFJb+qH18arvVv+RLOaoJ7g/CrnTlQkt9xIq5OQ4YdH
	yoFcOH/bVV3SBzIijDmxhsn7BxIr/SjWOV+2xH1qwshHwmIq0X7cUbWIbMFgXKSs6GzC79fYtOW
	mv+R/YE4on/u/+vpSWtMoubrhBZHWefogwZ986P6Rdglu9KKm+//WjA+1+7+CozdqxRmxs=
X-Received: by 2002:a05:600c:3f10:b0:4a7:9025:5c3b with SMTP id 5b1f17b1804b1-4ac1889cc2fmr303664565e9.19.1793730650716;
        Tue, 03 Nov 2026 10:30:50 -0800 (PST)
Received: from jernej-laptop (194-152-27-116.dynamic.telemach.net. [194.152.27.116])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2ab00ff3dsm146339785e9.14.2026.11.03.10.30.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 10:30:50 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Ulf Hansson <ulfh@kernel.org>
Cc: Chen-Yu Tsai <wens@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Andre Przywara <andre.przywara@arm.com>,
	Anfernee Cao <anferneemelokc5@gmail.com>,
	linux-mmc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH 0/4] mmc: sunxi: fixes and preparation for A523 UHS support
Date: Tue,  3 Nov 2026 19:30:26 +0100
Message-ID: <20261103183030.81078-1-jernej.skrabec@gmail.com>
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

This series fixes a bug in the sunxi-mmc driver and paves the way for
SD card UHS-I support on the A523, which will follow in a later series
together with the A523 clock phases, delay-chain tuning and the PF bank
supply switch.

Patch 1 fixes the manual stop command error reporting: a successful
manual stop command is still reported as failed, while a failed one
stores the error in its response instead.

The remaining patches improve the DMA setup and error reporting, which
the UHS-I work builds upon: a DMA mask matching the shifted IDMA
addresses, IDMA descriptors built from the mapped DMA segments as the
DMA API requires, and CRC errors reported as -EILSEQ instead of
-ETIMEDOUT, so the MMC core can request retuning.

The series is based on mmc next, but depends on commit 5e32202f532d
("mmc: sunxi: fix clock and runtime PM leaks on probe failure") from
mmc fixes, which adds the error_disable_mmc label used by patch 2.

Tested on H3, H6 and H616 SoCs, on multiple boards, including Tanix TX6
and OrangePi Plus2E.

Best regards,
Jernej

Jernej Skrabec (4):
  mmc: sunxi: Report manual stop errors correctly
  mmc: sunxi: Set the IDMA DMA mask
  mmc: sunxi: Build IDMA descriptors from mapped SG list
  mmc: sunxi: Distinguish CRC and timeout errors

 drivers/mmc/host/sunxi-mmc.c | 122 +++++++++++++++++++++++------------
 1 file changed, 81 insertions(+), 41 deletions(-)


base-commit: fd9af27f6c2319713bb23832066585f8a59a1771
prerequisite-patch-id: 8d600908a2eb84acfcd034482dd6e345242f1464
-- 
2.43.0

