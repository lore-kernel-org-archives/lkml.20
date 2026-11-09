Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794253277;
	b=uYEDWYFBb3J+jXT410cuyZE8tapjldxVHbiiQvaEdhA6gXgwV1IXkKDGImcE28Ccmkl0
	 ll9lNAlgiJ5xJH+XGx0AMSzQbuPlkBXwyZEhLRgV7ZnVLjTtJWHXb1JZBrPP/nfVKxj4j
	 dlLVubMYw1FdoF1JqmL4Hu2cEer+e/TCG5GwCGwFEqcuKpj1NPzTTPsK3W0tJ8tEExgMn
	 C0NSHRbsgAn0V5jK/3e2gGU2ewtl7x54y87TsPypfPlLQYwQARah1z7M56615P8kEm21b
	 OCCBvI5ql/XpbpQuKvpf/r28VN7yKAaUlQvywI+RGf2TtXQ49WM8x7hseGR7pw9uFPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794253277;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=qRwbk6U1HajIppxtFUV5odMGeHrOR5vt/U9rXvrWZSQ=;
	b=pXGRixwbUhaG5LrUoJwF4T2p5Lw/ysSRPW4Gs8zb+HWDc2b+dONlOiqzqdpb+cPg17Ur
	 AVowWgbucylbEky/fvlR+aoGTrt6AtkTj09iHow5fI6CMepU5ZQMh2KuPFmG0WsU0iBvj
	 O2eUc6S1+W3PTmF8SFOXXjui1YcrT1IGrzEftWIhoInWKhMDXeDMgDAj+MyeHMXct3K+G
	 1YoIMrvEuky2EjA2LJ4F8y1B/CyaSQi0VHU0TRnn/VRGh7MrleER8+VTVC2fWzWcmm4OT
	 n6wQheaKSwM2tTOVn9UxMlfH0nGlFuCVEHqidjuav+gDtzxRyF33TImwpbia1pHQYog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kYZTUad+;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A21B60A2602
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 19:41:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A21B60A2602
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kYZTUad+
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-492fcbfaa87so833039f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 11:41:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794253276; x=1794858076; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qRwbk6U1HajIppxtFUV5odMGeHrOR5vt/U9rXvrWZSQ=;
        b=kYZTUad+0ITpvkCsdvGJ8/5L3EaxXidV4n6mRWztI4OqbW5rPhDvBgqSkFH+fKDzV9
         TiVcb4hlkxsrJA60HCxhpQSMnsarLaAIPvKA1dt5e1xfEFGPWxZ3LMaslazlR+vXGYLZ
         hlwIGSq3L8dNXn+Qy5usx4CIclN7pHxMdnrj5pyLvT7jMgfY2xn6+ixDVw25n/nASTTD
         UFk1XE9Ul5/PdLFaykLnhkHeu8RK6xvmIdFJuMN/oOuy0lXnmB0tgd+LTqyVoc6Z/sHW
         Uir/HaEtbGG84vTwZiN1iGYlfzw3LsgffY4NHjfpRwWt/9zwGDbl8erXMDwyvrf48HNs
         mZTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794253276; x=1794858076;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qRwbk6U1HajIppxtFUV5odMGeHrOR5vt/U9rXvrWZSQ=;
        b=ySknfQ7AVPMWTMf/AMiqbQcS5Vb0LqzL+SMFlEzqlW7C4QiaeN7SrDHqUXN6S5eh/I
         MhUUAqbL1b0JXzag6WJ9lbuDkoCygJMBSDzjtT0MCnhQWbUFR3la3uE9BXuMus81t/U8
         m3LR2RtihrIp0VaC/CU/0A5tTuY7b1JyPL0KusP4QqYEOjlYjKNorZpz3Vu4rtfgAb89
         ELFvVkLjXxQKdpf6MZKZjVQDzC3W30vEIieYL+BxjSiCoJRnzoIFZloffSjX5yuUdH6n
         gWxc3k62M0FYpJ31UipW4Z6CYnsxFqodXyTjxzcsOehfdyCyIx8ess8CZ7o2xEHfNAUp
         RLpQ==
X-Forwarded-Encrypted: i=1; AL+hErHWZ9viXd13JVC/qolpkT+FiwmSMllI0NPmlI5oXih+VkcgedbU76nzz0jD9bpOc6wFZJc20e2UPpaTH2U=@vger.kernel.org
X-Gm-Message-State: APuU4Z9td3CcTEbdIuapd7nY72vA0IyasV+6bSD0p0lZWvGoEYSgI6+U
	Xd0vBDKYOVM5f1srDVSLSm5fCRg5hzpvEqRiLFjtNuBSQBIuYeptxIvaD//MkQ==
X-Gm-Gg: AYBFou2SDnHALI2bbjNK2E7eApSGXaEN+wxnS28iiReql4RE1nM9nIyW1ljMU1pcsx5
	3gCA1Ye0E8fkILMVuRcHYKlDUoqViXFE04pVc2VJ6ZIv6jfihmAKZ6/MZKDdK1iFw7PTpVCLNyj
	qoUgECTeAC4Ln79/vLxjArGLuUpJhuQ4o/gRXDc/U+0mTrZBYp61bvN/ALNSdxwbdXzePw076cm
	rn+Q7lrmtxPYq+lA4Lu6wZNLcpdUrIYveKcQEbrXmhLCLxQ9DtrPZb7AraAWdF7SYb40ahFcIXL
	kAlniczom2aJ7B18gqbru2AZ6EkjIAeFTL+twbtaCAwbxh6+4JZIBK3gVX/AvduDDnv4OD/qLs7
	Acvb3FgYhQNVeTNaNkJBmlhJWUhm/oCr8SVyp6lQ4TF/lkb2+iZWMillwGMgW5A/Nn6G81BMl87
	8sEi3heojGUYRcaqcdGq0prvYaKl1G6/bPpIyWm4Ifo6BHmNpV114/RU/ys2so2k3tU+OxuREOc
	LVuVL9t6rSmqzSW3+bZ6ErSU8csnK1ZwLL2xdOBiqEDI1aL/QWBrh18c6+0EOFgKzf+l1kFhElZ
	g0oIRitzfBq0sj+7dke4bZnOUtMNM2e21LEkspsFBxCHbGn5TJT5N7ofzQBakuK0VSTTYDeib3N
	J8B4=
X-Received: by 2002:a05:6000:25fa:b0:492:e1a6:90eb with SMTP id ffacd0b85a97d-4982f1c0674mr682603f8f.10.1794253275742;
        Mon, 09 Nov 2026 11:41:15 -0800 (PST)
Received: from [192.168.0.253] (5403F394.catv.pool.telekom.hu. [84.3.243.148])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-49836b8eb11sm714822f8f.57.2026.11.09.11.41.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 11:41:15 -0800 (PST)
From: Gabor Juhos <j4g8y7@gmail.com>
Date: Mon, 09 Nov 2026 20:41:02 +0100
Subject: [PATCH 1/7] spi: spi-qpic-snand: use the common
 qcom_nandc_check_flash_errors() function
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
Message-Id: <20261109-qpic-snand-use-common-functions-v1-1-1e8601e2db84@gmail.com>
References: <20261109-qpic-snand-use-common-functions-v1-0-1e8601e2db84@gmail.com>
In-Reply-To: <20261109-qpic-snand-use-common-functions-v1-0-1e8601e2db84@gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: Md Sadre Alam <md.alam@oss.qualcomm.com>, 
 Sricharan Ramabadhran <quic_srichara@quicinc.com>, 
 Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>, 
 linux-spi@vger.kernel.org, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Gabor Juhos <j4g8y7@gmail.com>
X-Mailer: b4 0.14.3

The common function from the 'qpic_common' module provides the same
functionality as the locally implemented counterpart.

Use the common function and remove the local one in order to reduce
code duplication.

No functional changes intended.

Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
---
 drivers/spi/spi-qpic-snand.c | 20 ++------------------
 1 file changed, 2 insertions(+), 18 deletions(-)

diff --git a/drivers/spi/spi-qpic-snand.c b/drivers/spi/spi-qpic-snand.c
index 41685a286e38..981e16221b59 100644
--- a/drivers/spi/spi-qpic-snand.c
+++ b/drivers/spi/spi-qpic-snand.c
@@ -592,22 +592,6 @@ static void qcom_spi_config_single_cw_page_read(struct qcom_nand_controller *sna
 	qcom_spi_config_cw_read(snandc, use_ecc, cw);
 }
 
-static int qcom_spi_check_raw_flash_errors(struct qcom_nand_controller *snandc, int cw_cnt)
-{
-	int i;
-
-	qcom_nandc_dev_to_mem(snandc, true);
-
-	for (i = 0; i < cw_cnt; i++) {
-		u32 flash = le32_to_cpu(snandc->reg_read_buf[i]);
-
-		if (flash & (FS_OP_ERR | FS_MPU_ERR))
-			return -EIO;
-	}
-
-	return 0;
-}
-
 static int qcom_spi_read_last_cw(struct qcom_nand_controller *snandc,
 				 const struct spi_mem_op *op)
 {
@@ -651,7 +635,7 @@ static int qcom_spi_read_last_cw(struct qcom_nand_controller *snandc,
 		return ret;
 	}
 
-	ret = qcom_spi_check_raw_flash_errors(snandc, 1);
+	ret = qcom_nandc_check_flash_errors(snandc, 1);
 	if (ret)
 		return ret;
 
@@ -819,7 +803,7 @@ static int qcom_spi_read_cw_raw(struct qcom_nand_controller *snandc, u8 *data_bu
 		return ret;
 	}
 
-	return qcom_spi_check_raw_flash_errors(snandc, 1);
+	return qcom_nandc_check_flash_errors(snandc, 1);
 }
 
 static int qcom_spi_read_page_raw(struct qcom_nand_controller *snandc,

-- 
2.56.0

