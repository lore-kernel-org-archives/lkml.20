Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AA0D311C15
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 03:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789011007; cv=none; b=GsyMopG+SJldtN9FRMAyKUa+pKvGHQaEOZTJfHq1GBArtlZGeRYpT4e+la43itkrSfFvdROCDXu2AT7zqRM8QbjQULuaQMXjCbBZYBFSOVtmxbCWztiw1IyDzniFWuokefGWHiLABxq+bj5nt8sPhQqVUlH2gQiDBfQIVksoa6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789011007; c=relaxed/simple;
	bh=/uY6JZ4dPGadrWONYZhC35t/6sJOFFSTHBE7n8OXDs0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ftle0remLD0W+H4EV+50L/z21ZbQlsvOEJNZ4kyGAK0k8LVrD22NYM/n2SqR/aD5NTdv77KCFZ9n2mO1dAZ2+dOOV2evwXQ1Im7nQCsnNke4B2ZjgC92AOFvCWi8I0f0asUrovTOYfxt9I7X/r+vJDipZPmtbDwMxvHTg0zwmR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BXbaRAAJ; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BXbaRAAJ"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-482ea739de2so4468303f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 20:30:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789011004; x=1789615804; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YKJjaLrDLwATiTkeesDmHnGi32ozSCfkATjDcADW814=;
        b=BXbaRAAJE9YB5jpHVoHeJ4441JJN3X8Zpm9pmOARNWfVxbuvaA4joOvYrg8pOgQAto
         sPNQKnWmK59liiLIUPfhNoOikWX1edpO6a6oyi7k/cNVKrtwwF/hAPEJWueLD/o8+dpf
         ppq6tpP2uPu+sVpAdoURZmLBVpBOCBitbFOaqds13diiHtf7PEytXFXd30B+al7zvDLc
         iYmGDcGMwOdInl8bILUqtgR0KCUkqk5cETNsQPXapRo/e+qrSseMM0DGUp9tP+BlTQSD
         f5p+pKYCDaBn+URJU5FSzI2VdvROFfW6J+XXAk2FzBRB59h3//ArJpUJ4wbvNLZKq6E6
         +QDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789011004; x=1789615804;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YKJjaLrDLwATiTkeesDmHnGi32ozSCfkATjDcADW814=;
        b=I98+D+ct1w6CKzB1R0LKHSEMC0lm12zYn6Bw7y6Iidz1Tk2cGPyMIrIdn4dNgEBzRq
         V6FgHten5xHQJMcGKG7wnvMtSJPsrkC4bSYaWyb9lsyW6poSaKZeQaRlof5mFzCjnysu
         TdOMsvuYxHfRFd4cHZvLd8eiyRAU0TCS0a2dhfPF/Jk8k1HVdzifVBxEfs4vl58EMvIu
         7AFXviaXWMC+98lJ4dl/3Dcr1LvCq7otFkkaLAyr9emRvAsFtoQIkzLtdoVITrbRRRss
         /bxaknvlp3TQS6wDk1GALvqxrCLRwb2FB9238DGYfdy+rwaVA5LGCjsZOrUrQ3LSMwv/
         6i8Q==
X-Forwarded-Encrypted: i=1; AKwUvBw3BgFUg65ZM5k7A/KC/Q1eoqPBD0aVGnIk2gbaTKNoH5djfPvQdCockLRg60L/r/muaEcOAR4bU2Go43s=@vger.kernel.org
X-Gm-Message-State: AFuF++kWzeddxj3gusQtIEzyb6XV1AgQSwFN+065DHnFU9PvInECRVcV
	rrABYpiwVTR233hZMBCYPKNf3N2VDtjY4ld65AGxJ+4Z6Ge2FFg599N+
X-Gm-Gg: AYBFou02wJIbN2j44ExdSgYr7UO5c3kbatV5lnyfYLg0s298dRsfKne+V9u5qUgWLQg
	qbCPSEe0Fj3Zdc91TKRD9ETv6ZHuWzAImJg+VREKRXQwFqjdY5eQELwUT737VDyMvK4Z6+lrabc
	XGjxkKO3zedLxxaii3/NapQXBnj7NEuDmsuevoy6MkAWLa5fq+6IJmP8dnf6WSO/ioD8L56HUjw
	uJHTyMLtxijgB5J41F9pQO9ZeierD7xX4ATOCdS3BVxn7mP3XeKLQLhfRWeyjtF53lkAsLIkhrU
	Sk642roBKEicbgKzUySp2iFPopotNofTl3Ru3YHIJ+DYrTvQQsuuqMOgg/J9pGejgBzD6GAFJJ8
	CxnBrIwV3bc/Hf7CGzlFVp2ajg02fda0fh1b87I1rli2OBmCln9owZC1T3yLCSlsI26oM6NveUP
	7lZz0bB3GyRZI8KxIvjwYUPcj+4TRnPouxfEox8/7REcFV5hMhIDwy9m4bEs4YhlnUzhn033v8n
	J8/zq/UWPUNjiLTLLzdx9Vv0+m7epKPeO3iz83KTIlsziUIdtA+WoPjZg2+FtaIxUKenAVVtKnG
	MEiLK5T1D0qCUvuNzzNaabqdDKF3EhbiFAwXBFTlGI+yLFzwuH7j7SslpBnXZWmN4zACOBb2pbA
	=
X-Received: by 2002:a05:6000:46c2:b0:484:4769:18a4 with SMTP id ffacd0b85a97d-485872cd677mr30353937f8f.14.1789011003718;
        Wed, 09 Sep 2026 20:30:03 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-b3d9-b901-0402-5aad-0ef4-88ac.310.pool.telefonica.de. [2a02:3100:b3d9:b901:402:5aad:ef4:88ac])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4858e239862sm42468266f8f.9.2026.09.09.20.30.02
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 09 Sep 2026 20:30:03 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rex-BC Chen <rex-bc.chen@mediatek.com>,
	linux-clk@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] clk: mediatek: reset: Fix device registration kernel-doc
Date: Thu, 10 Sep 2026 05:30:00 +0200
Message-Id: <20260910033000.15926-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The comment for mtk_register_reset_controller_with_dev() names the
older helper and documents np rather than dev. The new helper takes
a struct device and obtains its device node internally.

Use the actual function and parameter names and clarify that failures
return negative error codes.

Fixes: 761bc64003e3 ("clk: mediatek: reset: Add new register reset function with device")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 drivers/clk/mediatek/reset.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/mediatek/reset.h b/drivers/clk/mediatek/reset.h
index 562ffd290a22..b09cdcab0c4b 100644
--- a/drivers/clk/mediatek/reset.h
+++ b/drivers/clk/mediatek/reset.h
@@ -60,11 +60,11 @@ struct mtk_clk_rst_data {
 };
 
 /**
- * mtk_register_reset_controller - Register mediatek clock reset controller with device
- * @np: Pointer to device.
+ * mtk_register_reset_controller_with_dev - Register a MediaTek reset controller
+ * @dev: Device used to manage the reset controller resources.
  * @desc: Constant pointer to description of clock reset.
  *
- * Return: 0 on success and errorno otherwise.
+ * Return: 0 on success, negative errno otherwise.
  */
 int mtk_register_reset_controller_with_dev(struct device *dev,
 					   const struct mtk_clk_rst_desc *desc);

base-commit: 50d05c7c76c96b90462f24debacca971d2e86713
-- 
2.39.5 (Apple Git-154)

