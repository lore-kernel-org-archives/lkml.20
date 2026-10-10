Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1F6E17DFFA
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 00:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791592380; cv=none; b=pbK69pAETSLyCFo3z2/oXs1i/7Lre7gaKvxYloEx5SGU+XJYE1cA+g13qV2k2ynjYV3zViMxsgZGGEXucX3GqWVE76iAhw4CLT6CgUBfKl7lgqPt9+ARi3kOPa2EpIPOfUR8DkGvO/aTG4FI3kEpXAzutFdpZ6rQA5Do0XQUiMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791592380; c=relaxed/simple;
	bh=Z9c5A0KWw4eEyHNV0VpL5CfVwFi0zcE7dVqmnayp57w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tUE40la++NDmfecPEQfI5DG8/yzg2p0mErt93Mm0EAeMZ7kD2KWkvrt2gHQjEGu6Ky03pX/vWe7GJyLhe7FCVKqm2qnkJc6WWCJ/WJhhOkLE67eP4jVvzFeRl9EX++/+gG1X2Zc5NZ+iidp3EK0LNPFz60l3C92Nz1pK2uRsTvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nLnoEHjb; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nLnoEHjb"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2e8246b13cbso2180985ad.2
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 17:32:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791592379; x=1792197179; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OwfLg4Rh807uF2OxSNOHke3UgsujzzkUZItx+g7Dq4I=;
        b=nLnoEHjbqKvyl0MWdp06b34e2iU3Pl40SUog+78BDQ37eIvuGjNW26yQWQkEOLjA6n
         fkbk7rD7sC8Dmxh9nAx4m0pB4ke8RmgL1papZ+pQy/oKp5SblDENpbqRPlulyuaPW95G
         KgcpCNzQXLK3zp7o5YDhnAOxZf634sFIAKyT6OAYLyGbFc1ZPAHw1wJCZLUEj9CUegRN
         xU+KgsCW0BEBbcM6dT+g9pBqnquiui3aTJ+gPplc6xqIOVxPsTVsJvxaAZqJnwyBrRX1
         Qi4YhzLXjHtoz1M52x5lEkbB4+HJHmK10Bu1R7DFlsR+LKES5lhsAVTDJStXFty3VYNK
         Z07Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791592379; x=1792197179;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OwfLg4Rh807uF2OxSNOHke3UgsujzzkUZItx+g7Dq4I=;
        b=BEngcVKxdGWG8LMXtrv16V/bDO1KtIg5og5dSaR2ez3W4C9toHmzrFCFVmzrio4b0g
         Qg06jd42jiYhFVXDtzzUiuGX8mqPl94NbMT2i0mL4AA2OlGO3B3IuYMXb48cY1qH6wN+
         zf5TECgpW+hxn/i0H+YZiWzZss5gaVMNM6WgHU/TpEj4vicYj7tx1XsmnywAjuWmMjgj
         3AQ6+j8xuRuEpAgI6+UTw9WBS3t4Gsce9C/Z/rCK3beeL169HXsMniyzdW8v846BlIqa
         RJpiK7mK+jO1QCgXhd67gKmG/N2zy+wodCAZ6HQeCBye+bXhGKugfFllIbOnk14gS+c2
         RuzA==
X-Gm-Message-State: AFq9FYLA6iwvuHqLgr67XjXlLp/GLZhluVLOVZhEANVvPT5YiVT/iGqv
	JiCvW99470KtA8dNCt08+VAs1DmocQ5M97wQlrtfVoddkknVD0UEljAgPrk992eU
X-Gm-Gg: AYBFou3pj0WmZwgA3wZQ/vujIA+YYUSc4YClfj94BbgHzaObagLj+m0gXzCySH+tytV
	tI666EPJ6/x2LoXxLt6xGVqflGVMQ/VW5j/EB+7KToeDdYCwbgrpeZfecFxPFVjvv5Nf9Q+rg+t
	rzDzlsvd3ubZOFxt8dC5QpWrrP9DGy1QeNnB4pPFQb5yy0ZUHF2860nr/DqjQmN9t6Tththlap7
	9QziI32Oq47mTSdrnF6+nUVWkzd2F5/aNcmsmlcchNafZJXaVKEa4GQJaLLyWKqY24BHu2RvxXw
	rem99YG5TO2fLj89Q51OKnBmOBr0ZD6EZ7aJSW8un9YzwmWXTCV+yvcSZWhJfLFoIQrLgH8EKKn
	XWtgHT3eNdsHfUXgh8pj1CtVuPks/I2vd1peUTx/NeWR/0WGPBdfyoS+qdNCdu3hsOPNZW7UiAj
	YU1LAwzw8KiqWER043fqKqrvoiGJza+UR9mXBKkhAWnllH4cY9zYt224kNgra8KC1dCF4dzPArg
	y/DlppbW1IRaWU/+086ANlAgislmODqhytVQSf/d+Rf0kN6N681Kr8+SZEtNBqKbp6Rir3Xs2v9
	D2JlDPkV3nVk/RXqGiKD0uErjba+E3D5+06K2vacxKceZUIF
X-Received: by 2002:a17:902:f612:b0:2e6:29bc:73b6 with SMTP id d9443c01a7336-2e842bbf51emr30098625ad.45.1791592378818;
        Fri, 09 Oct 2026 17:32:58 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e84219f2bfsm18031455ad.21.2026.10.09.17.32.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 17:32:58 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: Srinivas Kandagatla <srini@kernel.org>,
	Rosen Penev <rosenp@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH] nvmem: brcm_nvram: don't cut NVRAM data shorter than its header length
Date: Fri,  9 Oct 2026 17:32:56 -0700
Message-ID: <20261010003256.989752-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

brcm_nvram_copy_data() sizes the data by stripping trailing bytes that
equal the last byte of the region. NVRAM content itself ends with NUL
bytes, so when the region is padded with 0x00 instead of erased 0xff,
the loop also strips the end of the content. Since
commit a67e2c323a47 ("nvmem: brcm_nvram: fix out-of-bounds access on malformed flash data")
the header length is checked against that size, and such NVRAM is now
rejected. On an ASUS RT-N16, whose CFE pads NVRAM with zeros:

  brcm_nvram 1dff8000.nvram: NVRAM length (2600) exceeds data size (2596)

Extend the data to the length in the header when that fits in the
mapped region. The buffer still covers every byte the parser reads,
so the out-of-bounds protection is kept.

Fixes: a67e2c323a47 ("nvmem: brcm_nvram: fix out-of-bounds access on malformed flash data")
Assisted-by: LLM
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/nvmem/brcm_nvram.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/nvmem/brcm_nvram.c b/drivers/nvmem/brcm_nvram.c
index 9f77aee37121..c79d2b081e87 100644
--- a/drivers/nvmem/brcm_nvram.c
+++ b/drivers/nvmem/brcm_nvram.c
@@ -66,8 +66,10 @@ static int brcm_nvram_read(void *context, unsigned int offset, void *val,
 
 static int brcm_nvram_copy_data(struct brcm_nvram *priv, struct platform_device *pdev)
 {
+	struct brcm_nvram_header header;
 	struct resource *res;
 	void __iomem *base;
+	size_t len;
 
 	base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
 	if (IS_ERR(base))
@@ -89,6 +91,16 @@ static int brcm_nvram_copy_data(struct brcm_nvram *priv, struct platform_device
 		return -EINVAL;
 	}
 
+	/*
+	 * NVRAM content ends with NUL bytes, so when the padding is 0x00 (as
+	 * written by CFE) the loop above also strips the end of the content.
+	 * Don't cut the data shorter than the length in its header.
+	 */
+	memcpy_fromio(&header, base, sizeof(header));
+	len = le32_to_cpu(header.len);
+	if (len > priv->data_len && len <= priv->nvmem_size)
+		priv->data_len = len;
+
 	priv->data = devm_kzalloc(priv->dev, priv->data_len, GFP_KERNEL);
 	if (!priv->data)
 		return -ENOMEM;
-- 
2.56.0

