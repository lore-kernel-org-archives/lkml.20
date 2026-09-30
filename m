Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C43C3409277;
	Wed, 30 Sep 2026 06:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790750570; cv=none; b=YmaT5pZz7Z8jBwpNB7IhY8+CVUoxJnTZSeaxY666I5o38J/5fKGzgTZpV+EEXDzRBT4/R6jMJo1VU7Q5icc+xo/tUEnxK3/G5GBYmuTiMfp8zS+IlP7HGfeN3Lq0zhLbSWxuN0L9cvTC/GLs8DgUTyIFFVG0KwqjWMgF62ewaUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790750570; c=relaxed/simple;
	bh=rabnibdH5kXYA81PaPtE69C2V7n7q4d3cKSbvdsFa5E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=W/EDYkzLzSCGi6ZaGR9wp/2zTnxRyvcyPBm4MymBjRIeiyG8wCreJOCeB00eUXAzosTsMcLLkCCLF3/568xpdQrFXdRY3ToxeIErdpDmuCJwh+x/M1BbzBsh6nzia3T1HVBQVbxVA1BYgarZI1M2QomypGBpCPtdd4Q0Kz8GJok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=p9AAs8VT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="p9AAs8VT"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 80139C4AF17;
	Wed, 30 Sep 2026 06:42:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790750570;
	bh=rabnibdH5kXYA81PaPtE69C2V7n7q4d3cKSbvdsFa5E=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=p9AAs8VTWr2LWm7xet81IFJZiOlucBDKQ9E9Bf1kE1KxKxLCo4HaQCGEKuSKtEkZY
	 fuB6fQUQbZ4QM1YldG6wdoxDSBySHSjVblUTgP3fYGNldftioXndnsQUKG5p+jfyhm
	 JRf6roQWPSH1/Pqp3wIdwK4P9DxiOmcvdeo1fvmmJ0Ugl6xkNSblmNkOakVZ9JmnaZ
	 lvMcs0hiwhypnDRDFbqmX2ZfnBPnP2f1Mwwf70Mi15g+Opd/pgmKR5jkBsquTRVM/2
	 8bJfQ4ePubizSLMMcm1Rd67V+hMgPTKwYWbd5tDbY9HPcjUvys//Z6mpLMr1d4Iu4l
	 aYpVJyfZHsuNw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DE0ECA5FB5;
	Wed, 30 Sep 2026 06:42:50 +0000 (UTC)
From: Hermes Wu via B4 Relay <devnull+Hermes.wu.ite.com.tw@kernel.org>
Date: Wed, 30 Sep 2026 14:41:29 +0800
Subject: [PATCH v2 11/21] media: i2c: it6625: use unsigned int indices in
 EDID read/write
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260930-upstream-it6625-follow-up-patch-v2-11-e353f887e7fa@ite.com.tw>
References: <20260930-upstream-it6625-follow-up-patch-v2-0-e353f887e7fa@ite.com.tw>
In-Reply-To: <20260930-upstream-it6625-follow-up-patch-v2-0-e353f887e7fa@ite.com.tw>
To: Hermes Wu <Hermes.Wu@ite.com.tw>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Hermes Wu <Hermes.wu@ite.com.tw>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790750567; l=1460;
 i=Hermes.wu@ite.com.tw; s=20241230; h=from:subject:message-id;
 bh=H4tTudaZ/V3Fw+p5D+FrrGl/z9LR5FCnwEu09cC2kB0=;
 b=uRd984NkKhBHDMRn8JRNYlDfA+2ItxE2AwMxrwYPOxS6gCHwHgZ/KBc82UA35EayUM1B1/134
 0Ny33+l0LSEBwDJKovSRKsZBV/yevtAOBIo5JPZ1hm+ukh2a7PobgMz
X-Developer-Key: i=Hermes.wu@ite.com.tw; a=ed25519;
 pk=qho5Dawp2WWj9CGyjtJ6/Y10xH8odjRdS6SXDaDAerU=
X-Endpoint-Received: by B4 Relay for Hermes.wu@ite.com.tw/20241230 with
 auth_id=310
X-Original-From: Hermes Wu <Hermes.wu@ite.com.tw>
Reply-To: Hermes.wu@ite.com.tw

From: Hermes Wu <Hermes.wu@ite.com.tw>

it6625_read_edid() and it6625_write_edid() iterate their block loop
with signed i/bank_ctrl locals holding only non-negative values; make
them unsigned int and keep err signed. Reorder the declarations to put
the pointer before the scalars while these functions are already being
touched.

Signed-off-by: Hermes Wu <Hermes.wu@ite.com.tw>
---
 drivers/media/i2c/it6625.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/it6625.c b/drivers/media/i2c/it6625.c
index 7bf008a3ac311c09e17ef7dc25adbed893d25137..b72b1fdc8f6b96c807bf767b82a953a89b08120a 100644
--- a/drivers/media/i2c/it6625.c
+++ b/drivers/media/i2c/it6625.c
@@ -660,8 +660,9 @@ static u64 it6625_get_pclk(struct it6625 *it6625)
 static int it6625_read_edid(struct it6625 *it6625, u8 *edid, int start_block,
 			    int num_blocks)
 {
-	int i, bank_ctrl, err = 0;
 	struct device *dev = it6625->dev;
+	unsigned int i, bank_ctrl;
+	int err = 0;
 
 	if (!edid) {
 		dev_err(dev, "edid buffer is NULL");
@@ -699,8 +700,9 @@ static int it6625_read_edid(struct it6625 *it6625, u8 *edid, int start_block,
 static int it6625_write_edid(struct it6625 *it6625, u8 *edid, int start_block,
 			     int num_blocks)
 {
-	int i, bank_ctrl, err = 0;
 	struct device *dev = it6625->dev;
+	unsigned int i, bank_ctrl;
+	int err = 0;
 
 	if (start_block < 0 || num_blocks <= 0 ||
 	    start_block > EDID_NUM_BLOCKS_MAX ||

-- 
2.34.1


