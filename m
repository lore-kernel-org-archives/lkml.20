Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794555176;
	b=AHf9IKhKKn4rK2jwTcgkMMXyqhEeATknJOc9P/Q5DxrUMs33mz6B4Q//6p2k8Oh1EN3o
	 SzmLDmhuslSTIJ+5BStXxqXHoNWxdMyLQxB4JmGuEZrY2XQxyNWrHtt4TygcVBPJHT7Ow
	 incFE2gH9b+sAej4R/HeGs4ihmLNWOVC04TLn4kHt0+ziRNzBS8WHK9/V51tmx+WCo0ia
	 4p+oxEzkXyJUlcBW8QxtalaekUJdjzz8M1lWKzjpjL33/HbEV9mgS38OVcDHzzVhbdJX/
	 eZjS5z8afU6J1OyfA2K5xm/rCoG6AAh+gKrNDq3e61ChfYIk0TOLRWnIRYG+8rIsQng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794555176;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=4ra5/SK4PyEv0el96ww+o2fa14mgOl6L/hKOXN+sF2E=;
	b=4OcDp6/3Rg4fPd3NHT9T2TxXCBGQrISNZyeQMxKd9qgZYuiMo7McVom8QQWNP8fsWHjh
	 9v3P9DEyHP9wPIo2QzD4textVVyqocctENmTAwQYwYk7HvXqwi9ekfr+zco5+eqVezoLQ
	 p5L1NDbHX87uRyoMr5RzY15KB/bWC+44puChEt6huNFnVPvYmWJ+w+M/a5yY7UkqPSLFJ
	 htD/MROnRvH6UhZqWGEHiUh5OWJjSC78JM3yvZNCnbmaQmsLs9M0BanyanfEVM5HXL457
	 eAgTX1z9Wes7HKs5YZoLBg909JTtddvsMdwJfVl339bF5z+jj0HORrNSxw7LUOHyskg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=a6OKct70;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C697B606A887
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 07:32:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C697B606A887
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=a6OKct70
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48dee593f18so815068f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 23:32:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794555174; x=1795159974; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4ra5/SK4PyEv0el96ww+o2fa14mgOl6L/hKOXN+sF2E=;
        b=a6OKct70ZG6eI6DeH5mM5WUBeroQ1w0LP+arZrrCd6Io7STDuWpJP+2n2UwoDDcBnj
         gvjj+Dq2k2hlIoK2bnv0ws2Ia7164VCtjy/qh9ZEKT6KBtL4iVEtMGpE93J1jpxtzGk9
         M+8vafOtIVBHx3DVOtzQCMmJgKuz4knbz+NQlteHSFCkvgxY+Z0oVocE5PDChpiSZkgf
         4YwE/ul1QJ+8iE4u0v2g2gyowGWrZKUqrvpZoWJ1FTIA00BoEUcjnYPXAstvFtX77lw5
         KGOLcwQOcXjj2RZ2yNcD2pc494O/eMebz8dI3vebsZDUr5K3D8zu2WUcrcEcPssftSpP
         1miQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794555174; x=1795159974;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4ra5/SK4PyEv0el96ww+o2fa14mgOl6L/hKOXN+sF2E=;
        b=F1gXS8oR63ioVmXeTrE31WLw/eoTFiLqJyohFhBcCkNBOQeWHcVsBAeFofAvsGOmnF
         t8e/ehvIgxNPyDTVbBI6c09s8hFjPuwJCSNAtzL+Ozo6lQ1fOt1luf5p7V2iPpyuI0/j
         j+t8pKM1v/xyRhF3qWPgN9PAKIBcvuNAh4rsWbpB78femC98KLox5P0AhFn3VmAa4OHX
         I+GjtzKatPX3PMQ1/Pm5j9s3iKw4Ycz5SJCvnRtkAtZ+9nbC2F0ZvwhYqIB/YdjkuSOk
         Gu+5b4UWqK7KeotTagv8nAnCdUdhaAwz+9WWLoLze2odj+uatyuDaYuz9NjdR8rIeaWj
         LW/Q==
X-Forwarded-Encrypted: i=1; AL+hErHMe55zU1XbGEKMkhy01RpbjimqYv6WVEZbicbdbhDHsUInpmwTqUoVGdgPjjw49/MeAO2GSyzlDgXXfN0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+qw61qhwg8wNpG1ci3SKGvLJ/F4LtvWGjb0inbiQI7Ps2mKtXL
	WvgEx5V7Y/W8+e8guCGUA9LzEZBC8gMuNGHHvRNItLfmZbfdDNQyWu8u
X-Gm-Gg: AYBFou27Hif0exSxo+vdupG2v3kpS4WoSLvFpm8V+HvSiT1FAmwkdP8M/P/aYwG3nLf
	kpMfxIEIPBQK3yXC1VVqAFG68tdkV62cTOvj10HMzYgBt7230Lu8fkuZVCW9e1fO1jhILI8nNI3
	5NbWGQqJrm7WKGhkOJhd+JwINr8BnIQIJrLuUPWg318t7Sfx6+2UTlWru5P8B3BMF1mfCQ+eSkP
	17ilaC4GRYWDLMk4IdXTdnKMVU+c0B3w2j6+SQE9s9Joqfgx+oDMB0DIBmh6W1mkPr9i1E0l0Ek
	Gp2AOOLAfG22LGBDIzYcOmxyoh1lTFWC3YJGnFbZQn/It2RBPx0CSvk6U7xT7wFP22lwP+lUJv7
	f1QWCBeTPK49B8b6bSU5DPwlaLsNN2eOQz5nAqWgWN9bIg2VNlXSCCzzPekNrzckaPcJZcXmXXO
	Ydho3nev0vofMKnmZLltMPL35WIqEe3lp57BUp1ZNCD2bADA0EMrCY6gx4A6r5EVx6tPeaA4jBo
	nIiwlIsBGBBuExJqRRW7ZimrU4jjTVisqcR4UYuw8IyFs9n7n8lRGrl0o7VwA3S9RGKjZWUrVM0
	rJ7g5c4GJ8KYkAkW9HTWG+5+FVDCgYYF8eE=
X-Received: by 2002:a05:6000:98c:b0:491:49c2:3b3 with SMTP id ffacd0b85a97d-49c71d48644mr3357985f8f.51.1794555174171;
        Thu, 12 Nov 2026 23:32:54 -0800 (PST)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5d223a29sm3799903f8f.8.2026.11.12.23.32.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 23:32:53 -0800 (PST)
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
Subject: [PATCH 2/2] i2c: imx: return -ENXIO at once when a DMA write is not acknowledged
Date: Fri, 13 Nov 2026 08:32:50 +0100
Message-ID: <20261113073250.1037215-3-mehmet.fide@gmail.com>
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

When the address of a DMA write is not acknowledged the controller
raises its interrupt and no DMA request, so i2c_imx_dma_write() blocks
for DMA_TIMEOUT (1 s) and returns -ETIMEDOUT, where the interrupt driven
write returns -ENXIO.

Let the interrupt handler end the wait when it sees a missing
acknowledge during a DMA write, and return -ENXIO. No interrupt arrives
while the bytes of a DMA write are acknowledged, so that path does not
change.

Fixes: ce1a78840ff7 ("i2c: imx: add DMA support for freescale i2c driver")
Cc: stable@vger.kernel.org
Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
---
 drivers/i2c/busses/i2c-imx.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
index 1987a0fd8132..09934f3b13ef 100644
--- a/drivers/i2c/busses/i2c-imx.c
+++ b/drivers/i2c/busses/i2c-imx.c
@@ -1108,6 +1108,9 @@ static irqreturn_t i2c_imx_master_isr(struct imx_i2c_struct *i2c_imx, unsigned i
 	switch (i2c_imx->state) {
 	case IMX_I2C_STATE_DMA:
 		i2c_imx->i2csr = status;
+		if ((status & I2SR_RXAK) &&
+		    i2c_imx->dma->dma_transfer_dir == DMA_MEM_TO_DEV)
+			complete(&i2c_imx->dma->cmd_complete);
 		wake_up(&i2c_imx->queue);
 		break;
 
@@ -1225,6 +1228,11 @@ static int i2c_imx_dma_write(struct imx_i2c_struct *i2c_imx,
 		return -ETIMEDOUT;
 	}
 
+	if (i2c_imx->i2csr & I2SR_RXAK) {
+		dmaengine_terminate_sync(dma->chan_using);
+		return -ENXIO;
+	}
+
 	/* Waiting for transfer complete. */
 	while (1) {
 		temp = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2SR);
-- 
2.56.0

