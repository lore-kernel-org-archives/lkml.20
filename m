Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794555175;
	b=hpe1awbkmg06DHwxPuUJS6uKWG5GwZ2sj8BwdADmvN1b8qRaUQLutpoSkv44dLNYiaqo
	 qZf7A3XDR2utf/4pe37zoeeQ26KOYzuoxcnwGnJQCUnMz9iClOP3rb5MFHOGWsDRh6ioP
	 OG3pvyQIhcABAJga0cqM3QVH+ZqDgvoA2bB4qNNwtnostolcsVo6PP7teVh1qwPT4kWW3
	 La2iSKAwOHlrjuLZ7LFEVPQIP9R9bj7Vu6ty0q7HPGrf5GwanTgsvwl9lgpU8mEl7e04F
	 A/q03F6T2jze1IhwTu9kzitDDxck7Jjw0chLhFpVvy0g4/Zrw3fRhlW5VpzoicZtEiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794555175;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=+S0kn7e/e8eb1jZgh+ha8xm/Lm8wUpKn755lAIdoRTY=;
	b=MOvf29g4Y+fo27gcO+08jMupFf4RcsOfJq0Y7JK/jlAwqbpj4EcpMVsR+ru/rUCfBT8d
	 PyWUxPHPGF+dHl1rQvAhXK4oDQVWlx+DGW2sSWll0TsHAppRMULmgIboS26KwSjZOhdit
	 jEMEjF5nPkyKK9wamgWjIfXY6k/F9tBi8MCJ1HfkVuq4yPysCdh9AQ1PW1d+nE4BvO6y/
	 k2N51u8VxEz0tE41vKRVyFUGVSc7sHXWAVK7lwDxnkfKkbd6gKqgXdRpwxPypukOrsYQx
	 g/2o7aSYrLllnrvX0ky76/LwQUNYMIm4LMamyKI624U7cW0ozHpYritfJY3KQEZt+rg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Hwj7pfUC;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00ED9606A337
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 07:32:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 00ED9606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Hwj7pfUC
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48e09aa5264so230359f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 23:32:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794555173; x=1795159973; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+S0kn7e/e8eb1jZgh+ha8xm/Lm8wUpKn755lAIdoRTY=;
        b=Hwj7pfUC1dvZhZwvhnfPkIfuostmed7pJJ3l3pdCgBHdzbxhSeTqW70YMzRljyUb9b
         fzoPJnqs+IrGvnb8Ba/sWT2eWDlWqDSPhv9ftqIpii+h7z9CLGRL+wibdC/ijP4/+djG
         jNiTk0s/LpOi7oPteseT+6wF0t9tk12nQ7N14jKypKAge1tabzgNnblOiKMJgG12wAyj
         MnHJ5EBajX80JKPusnBvGB5okYbM9yM2t5SMcml0GQhWTXZWgFepbTciKxDTtuLMzo/V
         n5JYdD0Jtkeh3YYXSvJ1eWeO8vbJLBV0QU5e4CxLHX+o8vFK7HIEojCA9QyLAd6/AqG6
         VCdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794555173; x=1795159973;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+S0kn7e/e8eb1jZgh+ha8xm/Lm8wUpKn755lAIdoRTY=;
        b=MhrVetH52N3ljtkyN1WEr7TBlI5XllQrzD2MY+A8jboOeR91Jbe5IyvXbRnweP56Ch
         gYSnQKWaiKlyKmCt4HXATmOFtW+UySDk41qYIbqOKAJ1vudDWf3AU+yVLPIKt6s8kT3M
         kYpwXnl//P12ytAMHS8IbqvsP5xR3QJMfvsPlR49t/p5XX2yTUm/lq5FdzLZ9Cf7m98c
         Aya4vcfajfpb2xtwspZiDxDtXao7h1f78r6T406pgCAuheyjK4m2WKtMD+Vulf0z+VLp
         2PoU5bv0TNaW/SX+49jMaZRQyO8lNWpWM+q4g5q8XOooHy8QYzhHRgZKpuI9UP4TvPJj
         LuSQ==
X-Forwarded-Encrypted: i=1; AL+hErHPqObDtVJpo3HTF5qApNmyqqJ124q3GstM4PyAWCREop7aUBaE7o8/xgWUuXRGAD6mqpkt+TyyLrZCeBM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+WMyXyvtoblSFUAk/MXfMadhj/nXB/iRTygup9+MAawWwmbiZM
	bOuTZ2+ixlBVbPgP9CslHMCcnFeJM7Gmb2p0XzltYwOlRog4OcnW6Nm+
X-Gm-Gg: AYBFou0t81h0VeWxeyoJPS4K4iLmQAV6O/aHkyveR7qJ131RjrYRESS4OokLHuDhwA8
	ILp1u5TJciWrFNmjTx0v8pBur1J/gd6NQ4E5XnhZTUpCZDcWtSqyupCcbtQtWbwyOEBo3jQ6uHU
	Mr8q8UMqUBQbc92BsPCr9sHllhCzSAC8GGM/VroKNPMf43IcgApGZ+G4iYvAa9jaQs9JrXnwvqm
	dltSGDEIkaT9I0lc4iRbOWcKdl/k6Yu4ULXf1AA65jhWhjfUDoZL/2+uREpeaWXZI0cQD0tM9j3
	eOJKXjyNPk+yWrHvVD0JrewEoxS8pCc0Ehl3I5f5KeoC1BKMdvLclIENBjB2pFLeOSbJ90kLtMa
	mg1ztoh4CwdUZwfDHzsf20F3tXtEugIqkSi8CeOsVMpxjWYTDMX/h9b9p1agoLzSl/kkLBwvnln
	tndcVgB8bhWVnGAM9u7s4PR0AY6s4EwlgsL1XSMAtC3ZpUeCMoWHvTyEBGwQo17IxjX4lmxLa2K
	lN3Kz/YKigGsxkMcI2pgYFtK2/7FVSMd20F8SwPuJ/xCCFyPmbt6iJhjDtwzks+CvOohgvEttLb
	qhtmEJwqp74DsS+Sh6krOIWyNa5c8flLeGY=
X-Received: by 2002:a05:6000:29d3:b0:48e:7e1f:8cee with SMTP id ffacd0b85a97d-49c73259d1fmr2428976f8f.12.1794555173288;
        Thu, 12 Nov 2026 23:32:53 -0800 (PST)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5d223a29sm3799903f8f.8.2026.11.12.23.32.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 23:32:52 -0800 (PST)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Andi Shyti <andi.shyti@kernel.org>,
	Oleksij Rempel <o.rempel@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Yao Yuan <yao.yuan@freescale.com>,
	Wolfram Sang <wsa@kernel.org>,
	linux-i2c@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH 1/2] i2c: imx: do not carry the interrupt status over to the next transfer
Date: Fri, 13 Nov 2026 08:32:49 +0100
Message-ID: <20261113073250.1037215-2-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261113073250.1037215-1-mehmet.fide@gmail.com>
References: <20261113073250.1037215-1-mehmet.fide@gmail.com>
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

From: Mehmet Fide <mehmet.fide@screeningeagle.com>

In DMA mode the interrupt handler stores I2SR in i2c_imx->i2csr and only
i2c_imx_trx_complete() clears it. A DMA transfer that fails returns
without doing so, for example a DMA write whose address is not
acknowledged.

The stale status stays until the next DMA read. There
i2c_imx_prepare_read() calls i2c_imx_trx_complete(), which finds IIF set
and returns before the address byte has been sent, so the read returns
0xff for every byte without an error:

  i2ctransfer -a -y 0 w20@0x03 0x00-     # unused address, -ETIMEDOUT
  i2ctransfer -y 0 w1@0x54 0x00 r32      # 32 times 0xff
  i2ctransfer -y 0 w1@0x54 0x00 r32      # correct data

Clear the status when a transfer starts.

Fixes: ce1a78840ff7 ("i2c: imx: add DMA support for freescale i2c driver")
Cc: stable@vger.kernel.org
Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
---
 drivers/i2c/busses/i2c-imx.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
index ccf08cd63151..1987a0fd8132 100644
--- a/drivers/i2c/busses/i2c-imx.c
+++ b/drivers/i2c/busses/i2c-imx.c
@@ -1657,6 +1657,8 @@ static int i2c_imx_xfer_common(struct i2c_adapter *adapter,
 	if (result)
 		return result;
 
+	i2c_imx->i2csr = 0;
+
 	/* Start I2C transfer */
 	result = i2c_imx_start(i2c_imx, atomic);
 	if (result) {
-- 
2.56.0

