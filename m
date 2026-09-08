Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E4665328AE
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 19:53:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788897212; cv=none; b=UDZZgF4S8kard69u2k1ZNd79WFRcert1RMNqaj8y6x37SraznhCogo9bF8P0XmO3bYzAT6c31hnuIu48ueLMtDQ32tXAh/az4/6akxswUePCeUYBei1yLGNkbKf1Pph/ivFRp+wAaJcjtO02IjXVNCkxdD73E66kkUvGhZI3fYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788897212; c=relaxed/simple;
	bh=NTd2pp5ANgj0lmniIesf6GIajPDFvFvZIKDPSGDqkEY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=UOvo1Kt9+4bKb/gotBLPv+7s4/R9hbu8uGtl5Bv0+ZAbeoPTn3CN13Yhp/VYkafcxhlkFnUXs9hnEANqpBfVweM4EeAtJ8FWUE4N044dpAdHMYB0wHwUZD+6nr6t0W6gP+S3JEZ6o7O2cgFB3Q2dSKsWXWzO6jkLyCpViv14j9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o0jVGLeX; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o0jVGLeX"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4956869750eso45110485e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 12:53:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788897208; x=1789502008; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=d34WrDSCafXYxFFebWg84mmDn+YaaqWAdBrUeMqE4nk=;
        b=o0jVGLeXFM+lkuUdxQ7YjkyrzTQdtuRvHQIUVQFmCBpFCSImOEaxOx1hKNNFH/5Lda
         7RjLKVW5Bv1H5OTu9iPjKlA6FxFyZBco9XQ/pnrTYGutKmF/Bv7hx6fu1S1CyqFpl5cY
         ROHtSGj/aCDcvGkFzXzaC+Qr6i9Sh5EilyIsvplDPxMA/6nBJynUhf+cVRXnRAloEbQU
         wlxqGe1O4LJyA9+rBBOapvL9sD2rtQmtUo9fhkv1vbYXSO9BxIECIsGgdvu20irZOQDA
         /PZJhXJotp9GWyK+BfVraNfBNx3Z07uNK3kxj7cODhypCgeSVbf68AmT/7CS/7hcRoix
         cgSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788897208; x=1789502008;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=d34WrDSCafXYxFFebWg84mmDn+YaaqWAdBrUeMqE4nk=;
        b=o5aI85Dd4a5mXQd/gSJgX3Wa1v/+BdBepnJE+oTQv87CGLFWWnU7LLqFSaBO/19Yd6
         GI35UOwiMiDeXp54ndGetmKm7gGmyZDibYy/dJKntx6F4PKSm9tgSe8+fv/7l68sCFX5
         354iRWHEU760zc+OMV88EbQF2h2kmBvCKDlYvsrQTgUTODNU6hHNmDyjUWHkUIikT3XY
         feJ7Ds/bEay0r14GBJz1E23JZ1b1yw7NVpb8SdD2rPBXEfVthZYFrSQxHALYK8bIB70u
         ZrrK/kyT0DTj9hiQG2iexzDYCoeXg6ORk4YywLBdttjwHCsqTd5mFgZEPgV2qfovUbQ9
         qCSQ==
X-Forwarded-Encrypted: i=1; AKwUvBzgn4NUEAhxcNG+bNdUnr5LT3hKOYRqEOSXk0INNCkQz5raG8YJedy8oLMKiirxitwMVgxscrduKdF0PKE=@vger.kernel.org
X-Gm-Message-State: AFuF++lS1k/xXhO4t4eAaPdl6fyd7p1ul0ED1PZ83IaEFzmzC3FRkQVl
	HvyZy2m72vN80BEOuLSbTCk55lxQktg32iVzZQU8QB/0mivIt3h7rIVu
X-Gm-Gg: AYBFou03WGbOpNMiVpINTNP6fnD5hJGAp/PCnYMUQf4fkDSM7AnVhCV/b6DnEAlRq4Z
	nZsN7t4t9yhI0OeiW6O7uxVFeA2oGvXIzOzgVMtghTY/SYo5LZKjL/7F+PbWK09nRvCMW6XqqtH
	8b974UX2RrfIYmwpDE9MQuoJbExITULB5KGE7aWMt+cFdirQvdh57hwXyVc4fkGteDZk3a5QPfC
	J9R5LysJFy9j4nZNf20bgsfFdHm+WbwffBsewmlF50ppx0lnMtFWSU4gQ+FZggp/43vVb2lOD9d
	RkvdcZLqjNK92soYj41vwh4/bwjTdj+BwAiB3YMJkwRMp6bn+YFXsbqOx/c8ZmMVpFut/u6MxY6
	EXXg3oReCZQ1myy7UaubibWdOKACEkEquv7QXJIPYQpn+tf3Pe/RUEmSt24qAA/jNoUezJqhQGB
	z3Ki2IPmwBioMhuLTOIDpoFGMzBH9wa5RrAM0pD4kjLY+I3PQwq0KwWo4O6bB2k6BATn2T14MnK
	r5WDtU5kS1huUh2
X-Received: by 2002:a05:600c:620b:b0:49c:fa20:cc07 with SMTP id 5b1f17b1804b1-49cff19cbf4mr255212345e9.30.1788897207627;
        Tue, 08 Sep 2026 12:53:27 -0700 (PDT)
Received: from [192.168.0.253] (5403F394.catv.pool.telekom.hu. [84.3.243.148])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49cee5d476esm547748475e9.1.2026.09.08.12.53.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 12:53:27 -0700 (PDT)
From: Gabor Juhos <j4g8y7@gmail.com>
Date: Tue, 08 Sep 2026 21:53:16 +0200
Subject: [PATCH] spi: spi-qpic-snand: remove unnecessary cast to '__le32 *'
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-qpic-snand-unnecessary-cast-v1-1-26df1cdd4bb6@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MQQ6CQAwAwK+Qnm1SiEHWrxgPTbdqLwW2SiCEv
 7vhOJfZIbSYBtybHYouFjZ6RXtpQD7sb0XL1dBR11OiAefJBMPZM/7cVTSCy4bC8cV0yzTwtZU
 kBHWYir5sPffH8zj+2d2XPm0AAAA=
X-Change-ID: 20260908-qpic-snand-unnecessary-cast-97d08a41c9c0
To: Mark Brown <broonie@kernel.org>
Cc: linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Gabor Juhos <j4g8y7@gmail.com>
X-Mailer: b4 0.14.3

Remove an unnecessary cast to '__le32 *' in the qcom_spi_io_op()
function. The 'reg_read_buf' member of the 'qcom_nand_controller'
structure is defined as '__le32 *' already, so the cast is not
needed.

Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
---
 drivers/spi/spi-qpic-snand.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/spi/spi-qpic-snand.c b/drivers/spi/spi-qpic-snand.c
index 61b1f2eb19ce..4bee26b06ff1 100644
--- a/drivers/spi/spi-qpic-snand.c
+++ b/drivers/spi/spi-qpic-snand.c
@@ -1485,7 +1485,7 @@ static int qcom_spi_io_op(struct qcom_nand_controller *snandc, const struct spi_
 
 	if (copy_ftr) {
 		qcom_nandc_dev_to_mem(snandc, true);
-		val = le32_to_cpu(*(__le32 *)snandc->reg_read_buf);
+		val = le32_to_cpu(*snandc->reg_read_buf);
 		val >>= 8;
 		memcpy(op->data.buf.in, &val, snandc->buf_count);
 

---
base-commit: cb2ad3c020579bf51fb0d702db9cf64af9698377
change-id: 20260908-qpic-snand-unnecessary-cast-97d08a41c9c0

Best regards,
-- 
Gabor Juhos <j4g8y7@gmail.com>

