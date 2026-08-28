Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53EE343B6F6
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 13:21:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787923281; cv=none; b=Yvt5sbLunRE2EIdcoMB3ZwN4xdfXOq3v5dWlleaSEstIuIcPmORBPANYgzt1nguMIPkDMUHoG0Ug4Z/fSr8wk7u6d7ZcKxtAQC74a0nK0BuoFT7pu1JrNyEipgkW99ZmxILXMlkJXVUSIAZIc/CAzCN8NJtfbYQfjXPzSDPRHiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787923281; c=relaxed/simple;
	bh=+QD66ohnt4455myiMUe0r3VX+Y06LKc4EFoNUQ4895w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SFt2E7QPyeEqpiW/pyPeXgolMajiRLLWoA0kUdUg4AHDEmmXOh0ccVc6FqUzQYSo3wWPvhK/3j+hI+1QE2oSD7av264LqBs/jtge+FlOlJmw4woblhJZ3KNCFeQajsezAPklwy9rpIMlQ0YgxT3nwh+b8TLTdchtvMpuNlP5FFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Piu+G5eo; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Piu+G5eo"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-480001972b8so514201f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 06:21:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787923275; x=1788528075; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lNWYppkVSiPppKcj5pQcAVUYrxOSKsES5k6fcIP4yAE=;
        b=Piu+G5eo3IMV7Z7UYX4bDR+4m2xxiXktXBtcmroZkTq+bgzpqlqmtgD8SOJb3K5UBD
         C1/PROj0ylfLYDBMqfPX0JkQiXlOSpCBxe04B+4381DOReKIX13YHM6xDEUUQgKDy5ss
         gseBfYahYdkMK/+Mj3LXAzuKYbq/c51rIik/ZY89uOyhs/j1yG9AENQ8A8+SWLBY6b8h
         iNleWGEgDoLRUgdAr+oMbrbPHePPuj14nPHqQtR6BgBqdhRIrvDfpF+qz+myBUkyYi3u
         j38oEDBaY0uAurVMmRQJ7j+W5IuC5SX8/KmYMn1d+5h4Q+4q+d9NDha7Jdy+IfLQa+eg
         oOLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787923275; x=1788528075;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lNWYppkVSiPppKcj5pQcAVUYrxOSKsES5k6fcIP4yAE=;
        b=VDJHRTlu3TpoBgHS294Fi8iwG5auwow42W/YAAIiNP24QaD+j958LJbYnfryIdoT/7
         H6QFinaT21Gub45oeAFXCE3Bdv2K3yxJyc9xjtvYSSR/3w/A3iBcNzJ3EbNONFH+6Zc/
         4sgKBik9sG1IiHj3gSxMFpb1QYAIrvNnr6PCA4GnlHZWMTsIS8OBbOCz3O0dsbcNXmKL
         oJGfTvu110B9ttES2ekesmZj2xcGHVbk9Gvx4gU6gQdXfEOlV+EGwgpLxS61UZi3EoNE
         5vOWSSPVbeie3VOlhmPdCudGiNQcVQ0V5E1sX79TJ41JzyohrnDNEmA9mUEipMCM0rLe
         R3Sw==
X-Forwarded-Encrypted: i=1; AHgh+RoZxsubEq54e7YEmDQJfPoOCD1Liq2jKSYfLVEKns04OTUmb8AarJiyiU25p9EZM4LSwOpsbANAQXOG2Vc=@vger.kernel.org
X-Gm-Message-State: AFuF++leJHYEzZUDxX7H+NIJ3O5xG7ZKwNhE9P24lHA5rdwAz5NTO2KS
	XFJ/8DZnn+1iM8LIzFDaAWabjAP/zh/iAtNrtHFgSJ/brIzNi3EZaYEJ
X-Gm-Gg: AR+sD13B7FT6NDABw+vlMpnW9hktxBQw3XcxXSIw301Fz8MlQLeAeJVZCdd73U32fmV
	FTStDMyWO7JNhR4mJUVW0pR4D25OYsplPMcLSBTAwAkq4Kj48l+wA5LdBJS5kybCGnFkp8B77tc
	vzinaowWETkWaAXD99oBXM5t7cnFdFRE1XetU/XfMHC6dq9mZKUAFLtAN42uCI6kqNi3Wf2SUzV
	ev59BLoMQkN9R/9uH4oSA2OGxCwxofAmO9/bxlW+TR/YttJZEUC1W/GALXBljXr43CR6X0Pl8Il
	BFRQp/KkjJ9PBiHK+Zkhi7Z0AcqUM5xDiQjneIbXt8eDGJEHs5x0ARbDIuvQCAIQiOY/LVS3doB
	sTC56vzM/PN8yQARQIHv6ktFbjKRF8RinFsthluc3PZeu39AaGpExedLxPxMQF7AfNfpBplrKxG
	1XL/L8kSbqZBkujbYfnEcoSor+nSKLq4sTp71MmkLVYTpysus6vKQBSdyvcI7fZ2pYcLvD13c4a
	lus8obC8f94FpScjBNOmuTb/tuUYHe+arCuYMHij+TeT9z+1WbOXPORkK3N6+2l51eIbRNjWB32
	hNOaiwY2STx8InbYlSJL4qihsA==
X-Received: by 2002:a05:6000:310a:b0:482:c0bd:42a9 with SMTP id ffacd0b85a97d-482f7992da1mr8545056f8f.6.1787923275496;
        Fri, 28 Aug 2026 06:21:15 -0700 (PDT)
Received: from robert-83cx (static-dsl-191.87-197-115.telecom.sk. [87.197.115.191])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbac526dsm3997335f8f.12.2026.08.28.06.21.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 06:21:14 -0700 (PDT)
From: Robert Bozik <robertbozik@gmail.com>
To: linux-media@vger.kernel.org
Cc: sakari.ailus@linux.intel.com,
	mchehab@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Robert Bozik <robertbozik@gmail.com>
Subject: [PATCH v2 3/3] media: ipu-bridge: Add OmniVision OV32C4
Date: Fri, 28 Aug 2026 15:21:04 +0200
Message-ID: <20260828132104.21473-4-robertbozik@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260828132104.21473-1-robertbozik@gmail.com>
References: <20260828132104.21473-1-robertbozik@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the sensor configuration for the OV32C4, matching the _HID the
sensor enumerates with. Without this entry the bridge does not build a
software node graph for the sensor, so its driver defers probing on the
missing fwnode endpoint forever and the camera never binds.

Assisted-by: Claude:claude-opus-5 sparse
Assisted-by: Claude:claude-fable-5 sparse
Signed-off-by: Robert Bozik <robertbozik@gmail.com>
---
Changes in v2:
- Signed-off-by placed last in the trailer block (Krzysztof Kozlowski).
- No other changes.

 drivers/media/pci/intel/ipu-bridge.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
index 1bb3a3e98..7d3c7e09f 100644
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -93,6 +93,16 @@ static const struct ipu_sensor_config ipu_supported_sensors[] = {
 	IPU_SENSOR_CONFIG("OVTIDB10", 1, 560000000),
 	/* Omnivision OV2680 */
 	IPU_SENSOR_CONFIG("OVTI2680", 1, 331200000),
+	/*
+	 * OmniVision OV32C4.
+	 *
+	 * 400 MHz link frequency, i.e. 800 Mbps per lane. There is no public
+	 * datasheet; the value comes from the vendor Windows driver, which
+	 * carries it as MipiBps, and it is confirmed on hardware: the IPU7
+	 * D-PHY locks and the sensor streams 3264x1840 at a measured
+	 * 30.00 fps, matching pixel_rate / (ppl * vts) exactly.
+	 */
+	IPU_SENSOR_CONFIG("OVTI32C4", 1, 400000000),
 	/* Omnivision OV5675 */
 	IPU_SENSOR_CONFIG("OVTI5675", 1, 450000000),
 	/* Omnivision OV8856 */
-- 
2.53.0

