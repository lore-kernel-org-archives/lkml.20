Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com [74.125.228.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D17F37EFE2
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 19:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789240857; cv=none; b=CbcgM1se99a4To18Kji/XeRyFwscNQyyXhgGiY0TTvxZ/FQbBS5U8SyBi+No0mDgmMKWZCOH35wSn5TbcKU6gKiRafZjbJ2wCm33Fsu3ygJgX9/pMY6Ua4twK+rm5uqCrarhgolHODRQNTAdcr8Jhh5B12kglDzpfslkWJKXUic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789240857; c=relaxed/simple;
	bh=8UedceBHV1ReG7aNmhHRoGHArSjtWlHmGMhHS9YGRsY=;
	h=Message-ID:Date:To:Cc:MIME-Version:Content-Type:From:Subject; b=t3HZIHU5uUkuRrTTX4ZyNkOvwdkq2hIeq1p2qef11qs2Wgqls7TtOc9brEtKITeUbqpDYZWCXh4slkW84iC44tWtnZQnn1KLo/tGhNgcKITnp1eytkNimly5Pp2szXHz6dgZVYdyGeoCJKweMZA4wKMqMa7Wg2ea39h130chXto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b7agk0Zg; arc=none smtp.client-ip=74.125.228.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b7agk0Zg"
Received: by mail-pz2-f43.google.com with SMTP id d2e1a72fcca58-8692a856865so1155087b3a.2
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 12:20:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789240855; x=1789845655; darn=vger.kernel.org;
        h=subject:from:content-transfer-encoding:content-type:mime-version:cc
         :to:date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OX3Pozv54J9l6Nkqxs8/upeHX+6WfThlkm/5RFYWGow=;
        b=b7agk0ZgWo3R6GCWqtduuT2FJ4xa1vPX4i63Z4h+TZxemh9MJr0KSA0D8lSGlzWc+/
         hMcuKgRKp1rADXsh8ERAQQYQiilE4LDn5qW+crGEMPriA5ZFED/jl4DYBjOxYXBRs0zg
         xkPERw2zGcBht38R88qDfG3k7QvB/B8i7it2Yj3j5kvDgTIXUl2py9VyKrqH8iPT4Gtm
         0a4W+3bsPAzznjJDNRi6iv0S1bV6kX20gWiazTX+NGxbzbPMWtCEU7HOR//+9zWv55nF
         sWwaHNlEPdK3jjBTVX1kyYJB8mwwQd0LfLvWtBt4YZqYT4fKM4GbYwJzFnshyLsqseLg
         N9Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789240855; x=1789845655;
        h=subject:from:content-transfer-encoding:content-type:mime-version:cc
         :to:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OX3Pozv54J9l6Nkqxs8/upeHX+6WfThlkm/5RFYWGow=;
        b=FebU2p+TCbRX8yAih1ATRT0pg6c1g+ibDSH/j/+IEe/rGebDgETqvdqeeQzvJdRB9M
         KhjkoFm6XRUpamkRAFTar7y2sS9dzJYpREWl8DoWFK6YXuTQSRF4b9/DBMeVjQb/rLzv
         betpH4iONjtSVPJ9ZPhasXlvV77+Rne9Y7ayPS/hhqLl/wmP2rSP65TDZwqk2PVRYppj
         iZDE19bWp8UArXvmZc/+l+7VeeP/K4rwfzT3sOCXGrRbWem6nxMiSGgdENn2zctj47k4
         NtUEMmkWb1+6a0VpSWktBGlJuPfW/qRd5J4gX9xHk3TAEQ+OOrAtlB7X95+RHv3THGsp
         SBXw==
X-Forwarded-Encrypted: i=1; AKwUvBwrWooYyIB1CMGBOOUWmsY8FLJhMaMJry+Z4w4fyEyJJTwJQd4CxDfByPJx32b6bGeuS8pn7AN/kNRMfm0=@vger.kernel.org
X-Gm-Message-State: AFuF++mdbYL1TcuEaen6bRJzUOnnBKpKmIlHf+5dpBwejWM3Is4Wn8i4
	w8p3yfm2FSCn0LpwlY6qJeqADuFCzAzcqLuo9Jujspc2a6eBeelzlaeZ
X-Gm-Gg: AYBFou3jAvyV9XVL+LU0fKSvkGlM5IBnoEimyRS0WgW0iCAE8HCvrbNLth4Y14Ymhjx
	HAhVzsh5n6/zatueO0gBNhijS/xxq+URILeTgB5VUm1fm2LhQMkaYojJBaLE4W4UACyQBLFhYQo
	OHeupvxxeagBjyD1l4xIj9529eCGCYiVpbxJeJZgWy4oVLPN9IRhLj1NdK8Ls39Ap26V2HENNw0
	JEa6cdSdWOetmznRpXFy/GveWb+hkYlfY68b0ovyeQHSFhJnjrz9ALeHaGPVN7Rv1vJ6F1RPz+T
	QICtrMetZoSOLNLKrLooG4eiPSKsZAr1kR4t1glsve3sDem7B2mqBs6nXLUg1iJ+OUJkX1H3bg1
	qwi5GxK/wifcZliNFnalOtdAFI6Gk2J18StkeN+Bu8WWVsnHh25v6cR2OWCATuMnmGxxti00Tha
	d/WYE7cjl+5mFEAZyVVMfeGkEi2mvJRJgK9CyebqiafYqVO1XKWjc6JVOGYLv9iomOt6YS0063T
	wqc8akLJ7pw7oqqZMkEJCBoReNGU+U6VoDj9zc1
X-Received: by 2002:a05:6a21:7a96:b0:3d0:f57d:c87a with SMTP id adf61e73a8af0-3daecaa8db1mr20707602637.0.1789240854916;
        Sat, 12 Sep 2026 12:20:54 -0700 (PDT)
Received: from spi_send.eml (61-227-63-170.dynamic-ip.hinet.net. [61.227.63.170])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc4c652ab29sm2693923a12.8.2026.09.12.12.20.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 12:20:54 -0700 (PDT)
Message-ID: <20260913032049.11209.alvinhuang0603@gmail.com>
Date: Sun, 13 Sep 2026 03:20:49 +0800
To: Haixu Cui <quic_haixcui@quicinc.com>, Mark Brown <broonie@kernel.org>
Cc: virtualization@lists.linux.dev, linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
From: Hao-Qun Huang <alvinhuang0603@gmail.com>
Subject: [PATCH] spi: virtio: Use the per-transfer bits per word

virtio_spi_transfer_one() puts spi->bits_per_word into the request
header, so a transfer that sets its own word size reaches the backend
with the device default instead. The SPI core has already copied that
default into xfer->bits_per_word when the transfer leaves it at zero,
the same way it does for xfer->speed_hz, which this function already
uses.

Per-transfer word sizes are ordinary SPI usage. mipi_dbi, for one, sends
a 9-bit command and reads the reply as 8-bit data in the same message.
With a 16-bit device default, a one-byte transfer asking for 8 bits goes
out as a partial 16-bit word, which the backend may reject.

Fixes: f98cabe3f6cf ("SPI: Add virtio SPI driver")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Hao-Qun Huang <alvinhuang0603@gmail.com>
---
Reproduced with a local KUnit test, not part of this patch, that runs
spi_sync() through this driver and the real split virtqueue against a
software backend reading the request headers: 9 of 13 cases fail
without the change, all 13 pass with it. Not tested against a real
virtio-spi device or backend, so the framing on the wire was not
observed.

 drivers/spi/spi-virtio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/spi/spi-virtio.c b/drivers/spi/spi-virtio.c
index 2256dfec5407..3e181bd8bc94 100644
--- a/drivers/spi/spi-virtio.c
+++ b/drivers/spi/spi-virtio.c
@@ -168,7 +168,7 @@ static int virtio_spi_transfer_one(struct spi_controller *ctrl,
 
 	/* Fill struct spi_transfer_head */
 	th->chip_select_id = spi_get_chipselect(spi, 0);
-	th->bits_per_word = spi->bits_per_word;
+	th->bits_per_word = xfer->bits_per_word;
 	th->cs_change = xfer->cs_change;
 	th->tx_nbits = xfer->tx_nbits;
 	th->rx_nbits = xfer->rx_nbits;

base-commit: cba2348ab114391f5b1a00fa65c5b739f13f0563
-- 
2.43.0

