Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3997F3BCD19
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 03:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792122354; cv=none; b=TpKyBtTS9z4VUb9/vcIA9Pzhwzyi9V4ehy903EpRgz4NjHqBnjxrkeMWF+oBSlKwFvn7liR7xzdfcOsbk3/QeqHe/Lmnj3ZQGwq6UViFGgkia88LaOwMoDIFc5qxAQ5iFALGBWaEBnW3AefNz/8bcNvrgsYGna30DC7dhHpIgCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792122354; c=relaxed/simple;
	bh=yG1at5m5QJbhW+ecohWXOpUrfbsO1PE/mD8DPJcdLP0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ns05bQrMKRbMYuCTap/8qkfd747xgeTcYovh6qi8ClmZWJi3LMQO2NefhZ9b+jdWSAy54MhbcY1fqfhykVIG0UFK4/ysppB8eUqzTbtNLVILi6J6rXoW3LuZV9g3oyIThO9gYeI075hKU88ziVG/FMN8XmsJEsep8nQ/4TqQC30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ur4mDt8P; arc=none smtp.client-ip=209.85.210.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ur4mDt8P"
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-7fccba9c675so886169a34.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 20:45:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792122352; x=1792727152; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VzQcb2tw5a4i/pk86YXUJlRkyNKtc4irBMv9ftSpeS8=;
        b=Ur4mDt8P9SOek8AFcP2n6MC8haBtcl/WCGKOTfAmbgyVP3/t5PZiwrFz7+HMGZ/fxR
         SgqWI3G5dWDhAD6bNrqM9s1zxQVO3hstkh9bGgoibyERdhuZsKhUn875mkzG3X4HJfUm
         y12NLPaCBQ7zdHC8b3MaNUonhEIAFjBgO33CkxNE33jeTDtU9/RwsZuxDaxIXBE3/4Bl
         U5zFQYAKUg2Nk2R9IkgL+LVrSvYRKUvBKXFbERCuQoHuqo45PCxMn8CA7P7+Qce5P3Ky
         v6DeZeoG3s9RqhwBqYmxsInQS109h3bVqHd8eu8wkaPdpleJNgFy8HIMvVaUlhwYMZdy
         2USQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792122352; x=1792727152;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VzQcb2tw5a4i/pk86YXUJlRkyNKtc4irBMv9ftSpeS8=;
        b=WIjf6Hr4RImt5Lv49ffvRdW/1khSSzyp/AvUwWOeGhm4C1acursOsbPnfuY3P3sTTM
         s9Xn31msOZhd+sdUXEXV9mmSuI8+UQl4ydTaIYuL77LvfW3Z5Z4rQbfMUJ/CUa2YdwS9
         wsCPSRBLfBD9hT9QIEXeqi4pzvdO63kre59dV29Dp6hNcknQ0MlaMSpa/pYw45y2Bnkf
         RpzhE3WYr1DZKJWREtCmBjWYRr12q1BOk1uxcwL/9IOiYWh+HNpfhila6VdcHGIqDW9Z
         2Z9/adKF+ofoc6g2wN+l+6qv5oy4dsaYDxjw0jfHwbeuqKGhjrE3pmbhGpo+ZN6/gebn
         u9+g==
X-Forwarded-Encrypted: i=1; AKwUvBzheEz9j0QNfuB4RjWjncGGxFXeqH8zixbto7BPkYu6G004Cza2fy+CH+Ws6hsT/+R25urqzY7N/q2GJuU=@vger.kernel.org
X-Gm-Message-State: AFq9FYIFOygmChoWusV8zxbBlmT6hK09pui9nyIAaksLEBRGJ22x5UGB
	KubqedIW769FV/m04R8e0qGrrBb13eO8+x8xvk4jYQ3IDAJ5/8x1rbzW
X-Gm-Gg: AYBFou0H8noVXRvcg7ZLIxs1lXJAtL0yOyU7DTwlmAjhdsaNnXFLMXKbvCfTJ0NNO7K
	RtcFWGqITMsjOTeyW7sGgqr6TlaDrYlVjZqGxXG7ZgHQYf2lCtLo3gVYM5t1Nl2ylNP8MTGT9KM
	Z37lY5bgwHVE85kvuV1f8SDI2L3wDNISmL2LWHh2PI8mf1ZPdrQxfV2cXs05IV89WdqdQOqGQ+x
	111HSlw5ZJ5r4RWI9NubPGnr3SlNEqBhLv3XU6KBKHNwrRSNYJObbLEflnSTI8AlKfGoAVoZpVy
	LtAMWBZgwtvT27GhBRK1NPpW6+WuzzwZopzlun9MtNNVpSvZeaWxy4qg8UwDJ4QdG7xlPpGeJKw
	ipu998co278YRynH5G/O+nptf7o8uGYwx+3Ujm0gQ8wRlbXbCYfvTnXbgeBKKqZXbirf2HvOMwI
	A9UTrDT45NgBTaaJratRjUyC+1wQa1YCMd2ftWrvQEVQbXlJfpbLNWzI1ZxtxDim3ViV3KtGf/w
	hZt5m4QPcTDf/wVNe052SIxDs6EW0L6Q++7VOAR94h//MatDFgJvhWPnHYeIii2CXbMdYR2yX0p
	iC7Ne+oRHTRqiv51BIvS7hOrfOZkvlfbd4vH48jGpVbYr5zS/4nS8MtUvfNzYQHtwDtYogZyVi5
	MB4zQoT7N4LwDYR1o+5sO+Q==
X-Received: by 2002:a9d:6241:0:b0:843:39a0:7a8e with SMTP id 46e09a7af769-84339a08521mr158641a34.21.1792122352163;
        Thu, 15 Oct 2026 20:45:52 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8429b57870fsm834402a34.0.2026.10.15.20.45.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 20:45:51 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 15 Oct 2026 21:45:29 -0600
Subject: [PATCH v8 14/17] mtd: rawnand: sunxi: avoid duplicate chip setup
 before page commands
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-submit-sunxi-nand-vendor-oob-layout-v1-v8-14-8ba4881fbee8@gmail.com>
References: <20261015-submit-sunxi-nand-vendor-oob-layout-v1-v8-0-8ba4881fbee8@gmail.com>
In-Reply-To: <20261015-submit-sunxi-nand-vendor-oob-layout-v1-v8-0-8ba4881fbee8@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Richard Genoud <richard.genoud@bootlin.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Masahiro Yamada <yamada.masahiro@socionext.com>, 
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev, 
 devicetree@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

sunxi_nfc_select_chip() programs chip selection, timing and the
spare-area base. The page-read callbacks and PIO page/subpage writers
call it directly, then immediately call nand_read_page_op() or
nand_prog_page_begin_op(). Those helpers dispatch through
sunxi_nfc_exec_op(), which performs the same selection before executing
the command. No controller access between the two selections needs the
first one.

Remove the duplicate calls from those callbacks. Keep selection in the
DMA writer: it accesses registers and prepares DMA before program-begin,
so it cannot rely on the later exec_op() call. This removes redundant
setup only; selection still runs for each executed operation, with no
new cached state to invalidate after resets or chip switches.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index dfb2a64c6b50..2a9fe89b1ba5 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1650,8 +1650,6 @@ static int sunxi_nfc_hw_ecc_read_page(struct nand_chip *nand, uint8_t *buf,
 	};
 	int ret, i, cur_off = 0;
 
-	sunxi_nfc_select_chip(nand, nand->cur_cs);
-
 	ret = nand_read_page_op(nand, page, 0, NULL, 0);
 	if (ret)
 		return ret;
@@ -1677,8 +1675,6 @@ static int sunxi_nfc_hw_ecc_read_page_dma(struct nand_chip *nand, u8 *buf,
 {
 	int ret;
 
-	sunxi_nfc_select_chip(nand, nand->cur_cs);
-
 	ret = nand_read_page_op(nand, page, 0, NULL, 0);
 	if (ret)
 		return ret;
@@ -1704,8 +1700,6 @@ static int sunxi_nfc_hw_ecc_read_subpage(struct nand_chip *nand,
 	};
 	int ret, i, cur_off = 0;
 
-	sunxi_nfc_select_chip(nand, nand->cur_cs);
-
 	ret = nand_read_page_op(nand, page, 0, NULL, 0);
 	if (ret)
 		return ret;
@@ -1734,8 +1728,6 @@ static int sunxi_nfc_hw_ecc_read_subpage_dma(struct nand_chip *nand,
 	int nchunks = DIV_ROUND_UP(data_offs + readlen, nand->ecc.size);
 	int ret;
 
-	sunxi_nfc_select_chip(nand, nand->cur_cs);
-
 	ret = nand_read_page_op(nand, page, 0, NULL, 0);
 	if (ret)
 		return ret;
@@ -1759,8 +1751,6 @@ static int sunxi_nfc_hw_ecc_write_page(struct nand_chip *nand,
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
 	int ret = 0, i, cur_off = 0;
 
-	sunxi_nfc_select_chip(nand, nand->cur_cs);
-
 	ret = nand_prog_page_begin_op(nand, page, 0, NULL, 0);
 	if (ret)
 		return ret;
@@ -1804,8 +1794,6 @@ static int sunxi_nfc_hw_ecc_write_subpage(struct nand_chip *nand,
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
 	int ret = 0, i, cur_off = 0;
 
-	sunxi_nfc_select_chip(nand, nand->cur_cs);
-
 	ret = nand_prog_page_begin_op(nand, page, 0, NULL, 0);
 	if (ret)
 		return ret;

-- 
2.53.0

