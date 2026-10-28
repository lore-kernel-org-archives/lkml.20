Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793191894;
	b=1goouu1ptLTjQzw1RpuycTWT2JXWahyqsElq0wpX5lFPwkcEfZ+Tlv45KS6A5StVAngC
	 A9q5c3N93tgEO4kr+wQIY1RmJIPxWBkeqhRpY+wKsDq6kVaCk/3+4SkIih3C2vewEfe86
	 ocAuN04fORDOn5QswxNH+r/nktdK9/yMi3uH9L5VtaHiSJgsm0CuSS6JBtPeD2E+l2aDb
	 j5e0CLkqlnn44wBGqN9tqv2vmE2VOIQpoecSMZsnfZ4wyFNo3Aef78EdEJGoD+vDE71Hj
	 tppkC212wQlk2UHb781CxhRTvnRoOop+yq+1mXXSAouJo/IlgW0uX7iIPLz9OJia/ug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793191894;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=58mU3YE1A8ySMdmeUGmqkV/ZZ/o0/aVwbVzGIHclv1c=;
	b=KO8yAor0wbje61DKEen3wOHWvagLDdO2iZL9u9hSI+1ygCwPkEg8E5m1V19NCrE+clYy
	 gLm+QE9BQI4KffhV37WymVsXM7SUe3iCMkCMZZ4KpQbmFTii5E0jUBhFlouqMy4yqZ7bd
	 A8OeGfVVpXtQZ8f7SU+fPO43Mf7daD6uJvfTLEgr9NIYsM6i4TyTPu7ZMEjESt4iPkvSu
	 WNEwoM809T8dh4GGv64umXl8QIFxTrMyfAs0U5+Rqto81SED5xoSNs88y7d3qubzHUy1+
	 xYn1SSp0sMbaUBYIYChMnZUQXPozio3mdDGw8d++lianLYWyUzSByU/QUAdnGfftH4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Cxv0F5G+;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6C83606A324
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 12:51:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D6C83606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Cxv0F5G+
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48e00eee27dso681126f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 05:51:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793191892; x=1793796692; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=58mU3YE1A8ySMdmeUGmqkV/ZZ/o0/aVwbVzGIHclv1c=;
        b=Cxv0F5G+jXvHhAayNWRctdZCvgaTHYI7gEQ0bpvPR4tVX0JbRzaa/stQxFjqLVyDZq
         dVq5zYYk67wQJOV4Vm42Ajt0Oq9zH8SAIWqL/DyH8Xz3CsmoYtjnCD4YrUoSiyn3oyQW
         PO/q+P33m3PonZ3LotTCOCRocp1tZWNUdlBUaOYh4vz4pZNr+MYsEkVQ94T6Td7lNSGQ
         Oqg2yXtCOuq6RDfPKelMuVsoEANnthgRjaHoJchsgr/+6fjmTsZhRx03y3qvbUagednU
         tPjRfup1kbyNE7opiQpLOzpFkiQmuILdP2b3BP4dg0FXxoK1f/v4vmzxf4gRnY1HNoaQ
         U8iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793191892; x=1793796692;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=58mU3YE1A8ySMdmeUGmqkV/ZZ/o0/aVwbVzGIHclv1c=;
        b=ZhTUYrOX9Zv0xocbvu+5Qkogo6CK+DzJBOWsFHNBgkJliaE/webjwfh0HqQo54axl/
         fbRns3JhqnmSq2DfaAbd0/rfsgwKeUbT71ikkz36Xu1rJSVHMxAry7irs+giJ3PE4RuD
         Mtl6gOPCXdjAM87ejVLturMz8RdCNDQJD7FEkHQ0N1DP0mRLhO6tijOMGaKqfzXFSmjH
         zjVGMKuMJKVl3PUpRgwvC7NJOsGeCCiJkU2AlM6/MWfH4x/7/iI/2MTDoZSpCbZv3rft
         lOVscXZuvg4pg8DrWQNCsee5tXBg7c7+gWQbg74Ib2cJWy9P6l1LA75kAuSiOdhGzVuY
         58JA==
X-Forwarded-Encrypted: i=1; AKwUvBwDj8H0b/DhsHvugT6LddFy3cQN070itOLGdC3gubqpHsJZPWVfzHB7m7Y0VrXU4w384g4HFLzB3Wl99v0=@vger.kernel.org
X-Gm-Message-State: AFq9FYJe4RpF0fNSIwUGv6F1q9Lpbe0Y8dq6pbZw/MIsim/wJCdY5RqB
	YA5W87G/anu3cV2wTayWqoIjAvYxo6QzxFEcU/tu4RmpaXW0jMpD3oIo
X-Gm-Gg: AYBFou37k1OKp3wIg7W0/4tzw5bBsARqg4SZBWseXBkZiwU6+FxkDAMS+CaplhoS3iT
	+Gakh7AJwKn0jgyoiv0xLXOU2whBnatNj7gsQmm2JaTd2kS2pbzasesIoltzYYjYcaKkyj/Y2mj
	f0nm2sQsQwz/+1SL2b/3yG8eJ+2Q7kf8wO/cc3mKLycUZA1uYW3MLvIJLGd+p74123Y0repI/2x
	pTmrdvWtd28ZtcL+ARjFbN2ha+0P8EDlQ8VIFl2ZXqykvuUoKH8H5iSoKicsCHSqiukQF1j5UF+
	5AAgB/C3K+f9LIAvQ5EkXB8M9Ag4kmqotxVTUUqiQwStdgvF0zs03fPFGACJH+X3duHzreW1+nA
	b9CUhWTz67YyrP/DUZeoEiEleD7w0oerWpQmnfabCIVsNfM6Cwu7C7y/je4Q1vRfICIhiWHN9V3
	xKK/O/zbYYzFW3N6aUQYtAmAOOEsxIZ1AiTnfFSSiDPNO2aVdgCGeMdiOibI6SdLNreUXsXmupB
	xCRrlYplHykzwhMCyqRXAAssdXu7x/7AHUUpRfqSPUnHFuSgsnIUKLHPj7nVhiTf6Ijitg/v7uI
	KBzTBLFMiljJbIv5dAKXyAuH7YHNXfsAY+/556UbkaHc9ixWZsLahVDbO8FHSgmM6Uo=
X-Received: by 2002:a05:6000:3102:b0:487:13f:f612 with SMTP id ffacd0b85a97d-48e5d5d802fmr5596555f8f.37.1793191892168;
        Wed, 28 Oct 2026 05:51:32 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:23c4:a702:d301:6bf5:6c0a:cf99:c9f2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebc39b3sm29275016f8f.10.2026.10.28.05.51.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 05:51:31 -0700 (PDT)
From: Biju Das <biju.das.au@gmail.com>
Date: Wed, 28 Oct 2026 12:51:27 +0000
Subject: [PATCH v25 10/11] mmc: renesas_sdhi: Add write32_hook for
 CTL_SD_CARD_CLK_CTL register writes
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261028-rzg3l_sdhi-v25-10-57f16691c2ed@bp.renesas.com>
References: <20261028-rzg3l_sdhi-v25-0-57f16691c2ed@bp.renesas.com>
In-Reply-To: <20261028-rzg3l_sdhi-v25-0-57f16691c2ed@bp.renesas.com>
To: Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 Biju Das <biju.das.jz@bp.renesas.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793191879; l=3693;
 i=biju.das.jz@bp.renesas.com; s=20261020; h=from:subject:message-id;
 bh=ltWOzQvnXnaIZzBe/fnpRtSR9lOqq9Os7KYKzujgEKw=;
 b=/gBzy0L2P6XiAi0r9ZxYLEERTAZkDff5ULocuimlZsTKkG2n7ba8hs/euuypHKf0FdLK17Omi
 3yeK/f6kiHYCk4b98wHwfG7nArdFyebiNldvD+asBE2Fp3NDdeoVdUB
X-Developer-Key: i=biju.das.jz@bp.renesas.com; a=ed25519;
 pk=yzD2T1OLS3lEYflbk64xhLlxhk75lZ+NoOtkTOqrlVw=

From: Biju Das <biju.das.jz@bp.renesas.com>

Add a write32_hook, analogous to the existing write16_hook, so that
sd_ctrl_write32() can wait for the SD bus to become idle before
certain 32-bit register writes.

renesas_sdhi_write32_hook() checks whether the target register is
CTL_SD_CARD_CLK_CTL and, if so, waits for TMIO_STAT_SCLKDIVEN via
renesas_sdhi_wait_idle() before the write proceeds. Other registers
are unaffected. As with write16_hook, the write is skipped if the
hook returns a non-zero error.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v24->v25:
 * Updated comit description.
 * Updated tmio_mmc_host_probe() to set write32_hook() to NULL if
   TMIO_MMC_HAS_IDLE_WAIT is not defined.
v23->v24:
 * No change.
v23:
 * New patch.
---
 drivers/mmc/host/renesas_sdhi_core.c | 9 +++++++++
 drivers/mmc/host/tmio_mmc.h          | 7 +++++++
 drivers/mmc/host/tmio_mmc_core.c     | 4 +++-
 3 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
index e897328d5b70..cb41f38ec80e 100644
--- a/drivers/mmc/host/renesas_sdhi_core.c
+++ b/drivers/mmc/host/renesas_sdhi_core.c
@@ -965,6 +965,14 @@ static int renesas_sdhi_write16_hook(struct tmio_mmc_host *host, int addr)
 	return 0;
 }
 
+static int renesas_sdhi_write32_hook(struct tmio_mmc_host *host, int addr)
+{
+	if (addr == CTL_SD_CARD_CLK_CTL)
+		return renesas_sdhi_wait_idle(host, TMIO_STAT_SCLKDIVEN);
+
+	return 0;
+}
+
 static int renesas_sdhi_multi_io_quirk(struct mmc_card *card,
 				       unsigned int direction, int blk_size)
 {
@@ -1199,6 +1207,7 @@ int renesas_sdhi_probe(struct platform_device *pdev,
 	}
 
 	host->write16_hook = renesas_sdhi_write16_hook;
+	host->write32_hook = renesas_sdhi_write32_hook;
 	host->clk_enable = renesas_sdhi_clk_enable;
 	host->clk_disable = renesas_sdhi_clk_disable;
 	host->set_clock = renesas_sdhi_set_clock;
diff --git a/drivers/mmc/host/tmio_mmc.h b/drivers/mmc/host/tmio_mmc.h
index 3ab8c0d8a2bd..e29a2fe06ef6 100644
--- a/drivers/mmc/host/tmio_mmc.h
+++ b/drivers/mmc/host/tmio_mmc.h
@@ -189,6 +189,7 @@ struct tmio_mmc_host {
 	int (*multi_io_quirk)(struct mmc_card *card,
 			      unsigned int direction, int blk_size);
 	int (*write16_hook)(struct tmio_mmc_host *host, int addr);
+	int (*write32_hook)(struct tmio_mmc_host *host, int addr);
 	void (*reset)(struct tmio_mmc_host *host, bool preserve);
 	bool (*check_retune)(struct tmio_mmc_host *host, struct mmc_request *mrq);
 	void (*fixup_request)(struct tmio_mmc_host *host, struct mmc_request *mrq);
@@ -283,6 +284,12 @@ static inline void sd_ctrl_write32_as_16_and_16(struct tmio_mmc_host *host,
 
 static inline void sd_ctrl_write32(struct tmio_mmc_host *host, int addr, u32 val)
 {
+	/* If there is a hook and it returns non-zero then there
+	 * is an error and the write should be skipped
+	 */
+	if (host->write32_hook && host->write32_hook(host, addr))
+		return;
+
 	iowrite32(val, host->ctl + (addr << host->bus_shift));
 }
 
diff --git a/drivers/mmc/host/tmio_mmc_core.c b/drivers/mmc/host/tmio_mmc_core.c
index 4116c4d29c63..4fe98b437121 100644
--- a/drivers/mmc/host/tmio_mmc_core.c
+++ b/drivers/mmc/host/tmio_mmc_core.c
@@ -1169,8 +1169,10 @@ int tmio_mmc_host_probe(struct tmio_mmc_host *_host)
 	if (mmc->f_min == 0)
 		return -EINVAL;
 
-	if (!(pdata->flags & TMIO_MMC_HAS_IDLE_WAIT))
+	if (!(pdata->flags & TMIO_MMC_HAS_IDLE_WAIT)) {
 		_host->write16_hook = NULL;
+		_host->write32_hook = NULL;
+	}
 
 	if (pdata->flags & TMIO_MMC_USE_BUSY_TIMEOUT && !_host->get_timeout_cycles)
 		_host->get_timeout_cycles = tmio_mmc_get_timeout_cycles;

-- 
2.43.0

