Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.54.127.151
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794626751;
	b=gJZOGTdLErAqqBo+gY+reGo4xc09NRetltxcn0siEB6Qpk+QrZlBTGzugpUQ5aDGhnWq
	 6B91Yun/tfqFToK1o+qthAjoUq8bDoHQXqyX+JjJdJoz8wKTKdRmEJ44f8foOemARSXEu
	 oAXWuZydT+iTp427BV9lxby+ulsGkaP3g97Rt9Bduer9/bXRjZDC+aw5SPwXupyy48qaP
	 CioPWr+q9MJD+Hmteb953Us+j5UI3joM67h/iOVKGZALFjefVFgVNHSuUmwXKt+JWgbop
	 GsqvaYGOs+S5YUhEy0fmkF2ZIAONAB2w7ecvB8YH1caFq0o7/ITzKivtqKTb3MrN8ig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794626751;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Envelope-From;
	bh=3Nxm9FZZhwQSOqcgrWRIzaG/kBVu7mlpp5pRc2EJUiQ=;
	b=0rOFQQrrXgoMi+SK18fAs303SAL4TX/h3zrPQ4cS1CSm3EJnLICuNLt8mf2NpjtGVccs
	 CoHJ93jfWetw9xCBumqnpqYjtH4T2if3ij/sYSxnR+1+JAgOFroSuAi686hFg9HVMxKlU
	 5/5I25SGmqkFoh/gz1JcBkephJazzs1lFPS4d6oDFJ/XNQa4ZsPOMX2eBRGeTDsk8mabe
	 iFVX4QPAd3NQ96xK3RFyWAjRPRI+QKo6BC1cHlpiwtsX3xfLIxgfInPWchcTY2TvyQ7Cp
	 OpVP5yI6sjKM+ReToffOp3T4VCJmIhSA8m6LtTE6iSTwx0vaq9w+dHYBVUK7l+kPRXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrispinetinega.com;
	spf=pass smtp.mailfrom=chrispinetinega.com;
	dkim=pass header.d=chrispinetinega.com header.i=@chrispinetinega.com header.a=rsa-sha256 header.s=default header.b=bBAgQl02;
	arc=none smtp.remote-ip=198.54.127.151
Received: from out-2z4y-a151.jellyfish.systems (out-2z4y-a151.jellyfish.systems [198.54.127.151])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DD49606A32D
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 03:25:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5DD49606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chrispinetinega.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrispinetinega.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=chrispinetinega.com header.i=@chrispinetinega.com header.a=rsa-sha256 header.s=default header.b=bBAgQl02
Received: from mail.privateemail.com (unknown [62.8.90.37])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.privateemail.com (Postfix) with ESMTPSA id 4jRKJR4R7PzyNf;
	Sat, 14 Nov 2026 03:25:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chrispinetinega.com;
	s=default; t=1794626735;
	bh=3Nxm9FZZhwQSOqcgrWRIzaG/kBVu7mlpp5pRc2EJUiQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bBAgQl02WnTFSaHImU3GaP2RCrcFfwXpg3HUJSRO77zJLBtyuLEW7HgzV5EFRnc//
	 eueomcAwsIPPfI10ByZmHP5R0AObP2SByGbWAt4CFdmsZsL5HVXJYDdZI+s0tJFFVF
	 RPAQuNAhpG+KnY1hX+N+yoYgBZVL5Xmy5aLe1HTnkz3i6I8gFM6HtBefIqDWK1yOiq
	 XfxQmvT8NfOInUHxLhfXBQAASrESZKrSD/kBCrF6Ca5kvltCjk1EgKHoiBe0L8T7An
	 SfH6O0U26qqgecbcxTmm5YPBf+FcUne8of4na+ooE8SRx6jq0/tLMgPIIJv90ZRdn2
	 j+1E4vVsjiqAg==
From: Chrispine Tinega <dev@chrispinetinega.com>
To: Lee Jones <lee@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>,
	Tony Lindgren <tony@atomide.com>,
	Jerome Neanne <jerome.neanne@baylibre.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-omap@vger.kernel.org,
	mfd@lists.linux.dev
Subject: [PATCH 1/3] mfd: tps65219: Correct the MASK_EFFECT field of MASK_CONFIG
Date: Sat, 14 Nov 2026 06:24:54 +0300
Message-ID: <20261114032457.3434248-2-dev@chrispinetinega.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261114032457.3434248-1-dev@chrispinetinega.com>
References: <20261114032457.3434248-1-dev@chrispinetinega.com>
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
X-Envelope-From: dev@chrispinetinega.com

MASK_EFFECT is bits 6:5 of MASK_CONFIG (0x25), per table 7-46 of the
TPS65219 datasheet (SLVSGA0D). Bits 2:1 are the warm masks of sensors 1
and 2. Nothing uses the macro yet, so nothing has written the wrong bits.

Signed-off-by: Chrispine Tinega <dev@chrispinetinega.com>
---
 include/linux/mfd/tps65219.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/mfd/tps65219.h b/include/linux/mfd/tps65219.h
index 3abf93719..5a6be84e2 100644
--- a/include/linux/mfd/tps65219.h
+++ b/include/linux/mfd/tps65219.h
@@ -198,7 +198,7 @@ enum pmic_id {
 /* MASK Config */
 // SENSOR_N_WARM_MASK already defined in Thermal
 #define TPS65219_REG_MASK_INT_FOR_RV_MASK		BIT(4)
-#define TPS65219_REG_MASK_EFFECT_MASK			GENMASK(2, 1)
+#define TPS65219_REG_MASK_EFFECT_MASK			GENMASK(6, 5)
 #define TPS65219_REG_MASK_INT_FOR_PB_MASK		BIT(7)
 /* UnderVoltage - Short to GND - OverCurrent*/
 /* LDO3-4: only for TPS65219*/
-- 
2.53.0

