Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 009C3391835
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 19:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788377019; cv=none; b=pMLNcA1udYIBgKugJ2QUCEnRZxpU/WFuthVG3nkxD+qqDWKj8PhvD0rnDmknrju/xX8pwZVHaUcGgU/ho4z++f6q3f/Wb6If1ZYsENIHLQOSbOZn/5Yu98SmandNBqbbSbbUF8Mx6XxG8NzZFyHLb9kvYzOuAlLQr504j4yA3zE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788377019; c=relaxed/simple;
	bh=5qoCMFgqJIimoOiblFan0T6yv4nncnJHvwPk+L207Qo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ENNVAoMMeG2bhQ4UxNOYEdxr0IFS8ZSxtdxQsDIbNGXEFmj64KcheWBEcEcIIUWdeyPSRB/C1UN/24b8KMKI/WuK10z+JKgpdNHM0FG1O2METcibIjTIpLzKxtWxPueKYoVkHaQrzU/Ydln9gypZlJsBP0Kptj+mVqkt0jghyGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cb9/Ws4/; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cb9/Ws4/"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-49b8687630fso12198095e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 12:23:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788377015; x=1788981815; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vFqszwfsC0pQvqlUC15Sh1caHswlSgRw+4WeB2DlbwA=;
        b=Cb9/Ws4/FjLRjA7re0l3ibiwwxr5PsY5ZxgCFXYb0S33OQIxmCTtNhC+prGh1n21Ik
         UK/62OqJuIYzqGBV+2WlxJuCxXkECPAmuuQeNAwJPSNSXIZnXxYlloM9DnuvX9XDvMh8
         ud2Y0wGTncsmRa1s9CbpE9mytHOt2ZeyMF2RgxCL8Zyh6dD5p7YJFb4hm16d8BoSOHPJ
         1WFR/spPf88xwFEU97tTtQ1IAz2BiCUSBxzFPT93wZugEwELxNvTsYanfh+Rero09iJg
         wqeMSMJhKULSL2Or+nzoXThgMQ0oFvJBzujrl0hIvetrsLaXx/nrDaqbCBlGgWics8JL
         bAhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788377015; x=1788981815;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vFqszwfsC0pQvqlUC15Sh1caHswlSgRw+4WeB2DlbwA=;
        b=AzAC2h1I8TrMPKDhrdwzCOFsBkPfl0He+Q2ux/8yfcZvy1HULOqF4HwsUG9dchVCV6
         cFcBH/a1zL9tUN6VnnHPzywd42mCIwmDhQ/Qrl1DAyUrHk3GiK97RVWvcD7v0ky/wCEo
         HAgWRAr2+k5NpGsVoVIwa7xnae+cvutaIqcTU+ArSWgoTC++Ki88UE8HvrYO2aC3xQM3
         7VRH8wvr7Ogwpevluh1xiP8ZsfnZwepbPTjptRAV4CMP18QwtnhtGy8jEFiqYrRuHSM0
         rlfryiEUOlqvLz1CXXJdlioC+ruui6zr65leYKVKaa18ViaOV1L2h8FrGlMhU+ZB5zxM
         2waw==
X-Forwarded-Encrypted: i=1; AKwUvBwt9aunmpd/le7CWQdXd6QciIoftfJNDFw7ha+LnG5DUI2su9GqXcueSo1nE2R2NbMzlq1L7nuR8QDXodQ=@vger.kernel.org
X-Gm-Message-State: AFuF++lIyucHc/ca8236yudO8H5oJZG8DNQ5xDwhm6W+JSX5e5hxU8TZ
	6fZ+4EXtj+EuyBzuUd/SxUFYqRTR1ACQVB+Xiw/55ZkQjBqyNC/ZDvWJ
X-Gm-Gg: AYBFou1SI9ZECzUUj3iLF0+9AZCpWrEg+mRzOC2/QV63uBrRsXiPHuslSXgDBkqtbHO
	F9C54tKPWqg48dPBk0NInhWc8iWPZcaV5FxsDueBgC+Wryfn9OTc1BG2HrEzDnl50Dx316gr3/K
	38L7Pnnd84To9riDOC9GFpevq19GTax6mcqS7iufcdnElPe+2L+wr6An5P8Ct+x8adHioWDFN+M
	NYeKUgZ9vdC9P5P/c8ikMzp7tX4A+2UH2ln6yaTts51s663OlPhWpMVR2K53kho0LrJyEpjDAtX
	7bc9484JkunrghCC0iusnlLtgwMgGuDAMdfOMNCBANl3ib3uzQq+STsA1a5Ium5SAyhVXz69zrB
	o/49kNpcvwjNaHXen/eHCxS8lSLiaqe/jChAhe5z0R+yRdYjK0e5ozdq4+GgMbMyB9aEOpHOmZo
	2LP5QQa6RajkwnmhrFelSljrlYLBNiFGE8Jj24Q8021/A/earzOE+EwjhIQgXFbUA+XrTYNH9FC
	iQvcRN0/yaUAmXXntYY05obevabM9R5JuAZZpFrLnu6sg1+H/Kk1gc+97gygR6pUEvVlu1/fdI/
	w6iNZ/Pm7wqA5Q+SMSGabvfKR4tpDBT7MdrIYbqr1uze3RZH6NWyK3f/Kd5j8cFoKA==
X-Received: by 2002:a05:600c:8b05:b0:499:b65d:124f with SMTP id 5b1f17b1804b1-49ce5823d9dmr158504505e9.11.1788377014385;
        Wed, 02 Sep 2026 12:23:34 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a1c2-c401-11b2-c123-0d12-6c0f.310.pool.telefonica.de. [2a02:3100:a1c2:c401:11b2:c123:d12:6c0f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee5f912esm12861865e9.4.2026.09.02.12.23.33
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 02 Sep 2026 12:23:34 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Thorsten Blum <thorsten.blum@linux.dev>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] crypto: atmel-tdes - sync output bounce buffer before DMA
Date: Wed,  2 Sep 2026 21:23:23 +0200
Message-Id: <20260902192323.29337-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The slow path maps its output bounce buffer once at probe time with
dma_map_single() and DMA_FROM_DEVICE, then reuses the mapping for every
request.  After the CPU copies a result from the buffer,
dma_sync_single_for_device() must hand the buffer back to the device before
the next DMA transfer.  The driver omits this call, so cache lines from the
previous result can remain valid while the device writes the next one.

This bug was masked by the completion paths calling
dma_sync_single_for_device() immediately before the CPU copied the output,
where dma_sync_single_for_cpu() was required.  For DMA_FROM_DEVICE on
ARM926, dma_sync_single_for_device() invokes arm926_dma_map_area(), which
invalidates the cache lines.  The misplaced call therefore discarded the
stale lines before every copy-out.

Commit c8a9a647532f ("crypto: atmel-tdes - fix DMA sync direction")
correctly changed the completion paths to call dma_sync_single_for_cpu().
On ARM926, that function invokes arm926_dma_unmap_area(), which is a no-op.
The missing pre-DMA dma_sync_single_for_device() was therefore exposed on
ARM926-based SAM9X60 and SAM9X7 SoCs.

With CONFIG_CRYPTO_SELFTESTS=y all four DES/TDES algorithms fail on
SAM9X75:

  alg: skcipher: atmel-ecb-tdes encryption test failed (wrong result) on
  test vector 2, cfg="unaligned buffer, offset=1"

Call dma_sync_single_for_device() for the output buffer before starting DMA
in both atmel_tdes_crypt_pdc() and atmel_tdes_crypt_dma().

Fixes: c8a9a647532f ("crypto: atmel-tdes - fix DMA sync direction")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
Changes in v2:
- Reword the changelog and use full function names. No code changes.
  (Thorsten)

Link to v1:
  https://lore.kernel.org/r/20260829045316.92931-1-kmehltretter@gmail.com/

Tested on top of:

  crypto: atmel-tdes - zero-initialize device state
  https://lore.kernel.org/r/20260829035821.67220-1-kmehltretter@gmail.com/

Without that fix, on the tested SAM9X75 the DES/TDES self-tests hang on
their first requests before reaching this test vector, so the failure
fixed here is not observable on an otherwise unpatched tree.

The two patches are independent and apply in either order.

 drivers/crypto/atmel-tdes.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/crypto/atmel-tdes.c b/drivers/crypto/atmel-tdes.c
index 2756dab3f4c7..ed80423b4209 100644
--- a/drivers/crypto/atmel-tdes.c
+++ b/drivers/crypto/atmel-tdes.c
@@ -370,6 +370,8 @@ static int atmel_tdes_crypt_pdc(struct atmel_tdes_dev *dd,
 	if (!(dd->flags & TDES_FLAGS_FAST)) {
 		dma_sync_single_for_device(dd->dev, dma_addr_in, length,
 					   DMA_TO_DEVICE);
+		dma_sync_single_for_device(dd->dev, dma_addr_out, length,
+					   DMA_FROM_DEVICE);
 	}
 
 	len32 = DIV_ROUND_UP(length, sizeof(u32));
@@ -402,6 +404,8 @@ static int atmel_tdes_crypt_dma(struct atmel_tdes_dev *dd,
 	if (!(dd->flags & TDES_FLAGS_FAST)) {
 		dma_sync_single_for_device(dd->dev, dma_addr_in, length,
 					   DMA_TO_DEVICE);
+		dma_sync_single_for_device(dd->dev, dma_addr_out, length,
+					   DMA_FROM_DEVICE);
 	}
 
 	addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
-- 
2.39.5 (Apple Git-154)
