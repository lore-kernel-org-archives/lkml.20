Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D147EEB3
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 05:01:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791781268; cv=none; b=RfQ1rXjuJ9xITpNoNFhSfdWCNPNB+Z8mAbSiRkdeTHJE6oaqkST9hn5+fIZGlFClywJx45r7pRbpUNZ6pHtZ5vereFfPnFoyUx1KB8vDXydHvbnUXH8N3rK/OFKgq5aGUHYjy+KMIXZNnjVbbIGku8AZOj972iUSag27reVTG48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791781268; c=relaxed/simple;
	bh=BMJJIUo89AHm+KS5JhgtKCwCsLx80MkkhGmJjgjhK/Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sBQdI2gAh8TCvLn1ug/eqwaCHJ0giswszozhYKkPriNnfoW4nk3tTLpMHS9ZQ3JViUqgbaFU7Ok/nnYhhe7SBrmzPt5HwGnqC3DrdYpPzlvodQo8RPUtLKeMYRUOXI0Hpy6gOn5cRQ8JuPk9Re+7X+oID3ieQjTNrFYBqsVaNEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=efX2MOkZ; arc=none smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="efX2MOkZ"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso5311624eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 22:01:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791781266; x=1792386066; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ecf3X1IOsNALR5NxITC6Vc2q5JRAsfQx1ofnyJmbhxU=;
        b=efX2MOkZOwS9z9omEBMCG/5d/juxL8ATpSERoh4y7WOWtoEFp5aXmrT9yWOdZZ2OF3
         mvCFOXu1XJWRUNL3vm3YEfrRnR3QQkd0nVUsN3mMUiDQ3beJFzzydoITZbpeHnf3t+Sx
         GbYAXpspBzuEVSeJL4QiFfnCKlxiIU/LKMOlOf+7hcfXNwBUghn1gR8MzUjnEjzqC00W
         NVcxPcCJD847/3W/qubw323qboY5AwPJJPMdUY//avoXAAz8LXkorOx6Yn6yfls3RX+p
         p0Zl35ned47OKRVI3UtC3g0ittsEcK3hG/gQIs5DW+gc94d7SuCgRabd0iRQnasDnfsj
         VTaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791781266; x=1792386066;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ecf3X1IOsNALR5NxITC6Vc2q5JRAsfQx1ofnyJmbhxU=;
        b=VH66n1200SyW/So85p++oo4gpPl/FW9Oiz7GGCQSYTpG8T6McTlq56gJzcbZzMXp9w
         9D4J4uRMYP0uOQ16Oa5XzYAqU23RN2dkEX3dEb3hlX8Hv463at5ugLSrnJvQ4XbnzRqQ
         nBnvwSYiw6vBT53RQsBRZuQQvSs6KG0vZaPI+U3BctQ6ZF0x/A3nJrTj/2vFX5cjhPtL
         iKEQrToqhDC28AgI/STC/Scz17A4+trKhjMljEgQLZQ7WVmGNl2/oWoiBz27N9n8FatH
         B7li+xaowOkf1AlRGPIcbcO/n5Pz5uynnIt+uq//t+/k19K+4q0hBOtdNSkroR+5jnAf
         E6sQ==
X-Forwarded-Encrypted: i=1; AKwUvBzysM6QzanMHhjMgTlYh3xpCeI5tewv71tr4wBBJpwv2OUT+P3Z2PfsqdquAr9pRoL75Eo6acXX3jbuKCI=@vger.kernel.org
X-Gm-Message-State: AFq9FYLaXkAg2V9W7cI+M+r5ThYYXOpfC88SX1vlu88m4ZbLWO/mETgh
	SJNhJv/+H9CQoDc5Afql/CnCLw3QBDMiyfcEzUdGsRS+PzZf/zafJuPf
X-Gm-Gg: AYBFou1L/3yJPOr0TgYuw7U35LcQJxdJJHnzwXlR3WsACci+JkfLwUEXc/7V1w3L4ZK
	eUa6avTGuL0eAU73M0MpwqWCXrmAxIIp3/ocbFk3RPri+6OUZ+EeWfXOghI5z/XCwHPSRVsF7v1
	rEcEvSWoUuftoQkweAVI7TWpK3CApfDCGT9OnIE2JMGuoKxfabsWF4irZ8bx0ITKNZO3MQYQnvD
	HugXXD+Fmt4qXLpji4ixXVaL7jcbUPkPV3Cmwi+g5sv+RlluTGAmx+QNfv0+j2nXOGVnK/oxj29
	HSo5Z70uZrMkZIZeAfw8dp8jIFySlHW9BEFnH6YMR1x/c0a4OakbpSLHbFlmyo5eSmUli+bg85M
	rqX2Hkti21ZQEl8+rtpzDt3VRyiEmbdMiQ46Ye8ZFfM/N73nQdBxXhcfNVN8znZOhPFNFVYGZh/
	WH89L0quqUb3433GpP66FGjErr5DU0n4MUpbRBvZ+E3vQeql28yPQg2YaRvomSdZbtSzz4u0/y5
	ZO6lzPZQx215DZJxbodV7I9o/Bw3eNNpJUmuGpbi4pPyYhzKJ6nvIG5LhQAVrui9QpV38EO7mTC
	cMR3glIc75oEOfwF8gtvf+G77IhwgnOanuYui7MZ3HymT/2AIc+Ci/r/qfwtEcmhz3TK+aj8B5e
	NZiTrsgKL8GLzNFxFWz8IA2dwI0xs2K57CZ7y9c9Ae1hXat5LiIsZIYTdVSJw2Rl0PA==
X-Received: by 2002:a05:7300:e9c6:10b0:35a:c54:f446 with SMTP id 5a478bee46e88-35a0c54fcadmr4140505eec.40.1791781266170;
        Sun, 11 Oct 2026 22:01:06 -0700 (PDT)
Received: from FT6N242TWK ([223.181.119.248])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-353814b556esm31804877eec.18.2026.10.11.22.01.02
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 11 Oct 2026 22:01:05 -0700 (PDT)
From: Shashank Mohan Jain <jain.sm@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	bui duc phuc <phucduc.bui@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] iio: magnetometer: mmc35240: leave cache-only mode before the cache sync
Date: Mon, 12 Oct 2026 10:30:54 +0530
Message-ID: <20261012050055.48850-2-jain.sm@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261012050055.48850-1-jain.sm@gmail.com>
References: <20261012050055.48850-1-jain.sm@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

mmc35240_resume() marks the register cache dirty and calls
regcache_sync_region() while the regmap is still in cache-only mode.
It calls regcache_cache_only(false) only after the sync. This
ordering has been wrong since the resume support was added; it happened
to work until regmap started rejecting a sync in cache-only mode.

Since commit afc8e3ee8307 ("regcache: Validate cache_only state in
regcache_sync_region()") a sync in cache-only mode is refused with a
WARN and -EINVAL. Every resume now gives

  WARNING: drivers/base/regmap/regcache.c:536 at regcache_sync_region+0x1a4/0x1c0
  ...
   mmc35240_resume+0x30/0x70
   dpm_run_callback+0x7d/0x1c0
   device_resume+0x175/0x270
  ...
  mmc35240 1-0030: Failed to restore control registers

and the control registers are not written. If the chip lost its state
during suspend, it runs with the reset value of CTRL1 while the cache,
and with it the sampling frequency attribute, still has the configured
value. Writing the same frequency again does not repair this, because
regmap_update_bits() finds no difference to the cache.

Leave cache-only mode first, then mark the cache dirty and sync it.

Reproduced in qemu with the driver bound to an i2c-stub device: set
in_magn_sampling_frequency to 25 (CTRL1 = 0x02), clear CTRL0 and CTRL1
of the stub behind the driver's back to emulate the power loss, and run
a suspend/resume cycle with "devices" in /sys/power/pm_test. Without
this change CTRL1 is still 0x00 after resume and the warning is
printed. With it, and also with the regcache commit reverted, CTRL1 is
0x02 again and there is no warning. Not tested on real hardware.

Fixes: 553a776b7908 ("iio: magnetometer: mmc35240: Add PM sleep support")
Assisted-by: LLM
Signed-off-by: Shashank Mohan Jain <jain.sm@gmail.com>
---
Prepared with Claude Code (Anthropic), model Claude Opus 5.5
(claude-opus-5-5).

 drivers/iio/magnetometer/mmc35240.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/iio/magnetometer/mmc35240.c b/drivers/iio/magnetometer/mmc35240.c
index 6f40cba4b1..7f028d7f1f 100644
--- a/drivers/iio/magnetometer/mmc35240.c
+++ b/drivers/iio/magnetometer/mmc35240.c
@@ -532,14 +532,13 @@ static int mmc35240_resume(struct device *dev)
 	struct mmc35240_data *data = iio_priv(indio_dev);
 	int ret;
 
+	regcache_cache_only(data->regmap, false);
 	regcache_mark_dirty(data->regmap);
 	ret = regcache_sync_region(data->regmap, MMC35240_REG_CTRL0,
 				   MMC35240_REG_CTRL1);
 	if (ret < 0)
 		dev_err(dev, "Failed to restore control registers\n");
 
-	regcache_cache_only(data->regmap, false);
-
 	return 0;
 }
 
-- 
2.43.0

