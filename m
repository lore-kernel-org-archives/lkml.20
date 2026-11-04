Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793801304;
	b=Yjvuk+sT2JR0SuxkOIg+8Febw/nOBurPBgS7QNBhwkSJ/JmF0kJhpm6y9Nv8Xzc30E+p
	 JndEWhYZkM3dLOSj/gdJgIctIq0aG4Ejb40tOvgFULPDPph7xRX3StY6w/oU2INxcz8Bk
	 uGAH6c/mphnXO4Lt6bPLEoXTPPIIMaE8VPlU+FnH9spsLhcCJKHujRiJpbVzvkmtF20Rc
	 Notr8PAB9yXQSI4zsYXGvhRDWyGcw74otw411WxLqWlDixSxupABGaIyk6zC5LuVjRoBU
	 GH867bzNF3kyZChFmHgx+aU3eVBlHpPD8tBqIEOBiQk6uD71IOHE237oB5Oj5Zv1cFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793801304;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=TW/hxeURtpp3wtE8J5o/ixOgIyRnUtxYzzkfTW+2RsA=;
	b=hhk1ocbeNFIkuZBvKDLsjvlvhEDswVhzA7HbGAoeJoQSH58z2UV2CfhFDGetWilTJjtH
	 H3ZWsFmrKGdM/sccLXgMK0P4U/612sMQoPKzzvEeSOxuLw0NLDFDhNr9W15BMupPQHlaZ
	 C/udPRofla1+izRarY08PMMjBdwglHQUj73VBn9Y+p0XOeYmYZNeo667bkOEbTy5pnHJU
	 jz2nQ+9k81fVNMHwl4qagoZVhl9qu5l6O/MRg4A32nEe/+VuigfAOp+hdDHrDhMd9rwVo
	 ID5uGMfHNZEpdqNKL+Ro2EkJTJtN8kP6aQSzdA7nA+9vmkhBV19nW0iEXH+z+Qaq8TQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ShPHvMBB;
	arc=none smtp.remote-ip=209.85.210.180
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1613A606D801
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 14:08:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1613A606D801
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ShPHvMBB
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-89f28c3ac7bso295374b3a.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 06:08:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793801303; x=1794406103; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TW/hxeURtpp3wtE8J5o/ixOgIyRnUtxYzzkfTW+2RsA=;
        b=ShPHvMBB3VjtpfJfJTQ8IuHXhIh8yFv13ZLNON+FrvV3va9f1zQfasBz8WdPV8JkeG
         b7OI9urqDkldm1Tk5pVk62B82np9Q0/IY09KPlnNYAh834Tn9RWFSjJGcrwkmk41sy8Z
         NdKZboI7X8+v8ARS1Qe7FBBd5sqgRGBYZspEf9+z0YhTn0xWgEk5ObJjYuk/q+CXL8Gx
         z6mGw2xgmWx/zEEHzro1ZqeVPvVWYb8m3HDRO4A+bpOHNUfLpR95ml0cnTqN9onj8Tc5
         ES1gycGZK1nSsXudjoqam1Ue2HEtmEmSs3s+xJ0qdFHtaso90y2r07MsszrobrdTV0qg
         Uy4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793801303; x=1794406103;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TW/hxeURtpp3wtE8J5o/ixOgIyRnUtxYzzkfTW+2RsA=;
        b=Tms/Fj/OzTHlyh2dZQMuuOqmcnMR/N+vuacOPpN5C1cRe409/xJ059yh+DqOWN/HbI
         nhF7VGVHAbwqfBsRZMACVA+A5Ri+hYv28t1ESazfd8uirjC1oDIKIv/hMt5wlxg8M0pF
         JMory/m0U5GlPWupvAI9OOs37WZPRGmoz9c7/uZCVeu6Ckqej4ywivWGQ/EHd187REBi
         0Qt25llhOKVYWTzxNdGSWrkWzZWRdJU4naF16/4L44GU2/vn/FO9P8hcNYEuMNhhbiLc
         mY8fR6+vcYDKAqGTOW6fR+j1aCjjx/lE/OKxHyJQWurMLy2npjqjmaCbtLL8U3l6aeIb
         letQ==
X-Forwarded-Encrypted: i=1; AKwUvBxT5Ak7V8Uks39naMb85zzBvS1e/jj4GQFSQDoQGoTv7i+u1rIdCOu1w5Ja6ODY375wknMNkD3tGyuH4pc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+05z4wXhOHWK12+0gWuXsjRpgHZkk4qy4ekYNetnEEDd/H4Enz
	WJB0Rs/vHeOLi7/aHLbNfcrnG+siPYHSXtlvR9LwZmuWUdkehsgVHzNz
X-Gm-Gg: AYBFou33rEDshpHbp2Cx9IPBrJ2C/ndzARaOynf2zF6y5RZml/YPSO6kHEQHYAiQnK5
	0Az5EknRvzQFA3YGTYR2m1v3cMHCIxwPkTAtDUsdBxec/Mm8fbORj0A0h4elg3vKNAa+EF2Cw4D
	bzdd5flwfqPpdw4SKX7wcjan7QmMLGS44fPZjxCHEGzHR4idVOGtkpXGMIhGvNace9nKsDsQ4Up
	6tcS6MDWEIiu/OZCnmiyy5iYPP7//elcqbyb/acpknL2xzPWYqPoRWdxuK+yezr+X5k0XIIaAgA
	DBVg1G1JUf+Uq0hPCOw1MHtQnMpmzVE2tPh4cwlJHC4/vKZjEjdq45uzyiHvVFbE5zUJPm0dApH
	7fIcYCGGb3SNDplEVOkuH26H0otP+qKACcXl7dp1U8NuXdFZD1p4+LZPN26GuIj7xplInmn/UJF
	AQdUzW7flSkWVlGSve3/AUSLPMV0LDKJuHSSOpic+1/lqJYfP5jUjcprgFTuRcCmxGBiaGIkXuV
	u4ZIAS3JVPPuUdkCaUWlqcuaQ5RonfC4+9/dvddoYnQbctaEro8S7aghPqIlYMHofL1JPpF4vAP
	uyvBoykoNnTwrm8TN4tZpBLguuVkx3/XhC1KUAI7wBDnA5P8pEWc3fZK0ulQbJpUZ0OqNSPoKET
	TTmi1MKl00xxPKCbqSx9DCy0=
X-Received: by 2002:a05:6a00:3987:b0:886:a737:e0fe with SMTP id d2e1a72fcca58-8a9bea67183mr12951149b3a.23.1793801303196;
        Wed, 04 Nov 2026 06:08:23 -0800 (PST)
Received: from junjungu-PC.localdomain ([223.167.147.108])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-8b09ba508fasm990259b3a.48.2026.11.04.06.08.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 06:08:22 -0800 (PST)
From: Felix Gu <ustc.gu@gmail.com>
Date: Wed, 04 Nov 2026 22:08:10 +0800
Subject: [PATCH 1/3] spi: ti-qspi: Remove unbalanced runtime PM put on
 removal
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
Message-Id: <20261104-ti-qspi-v1-1-c286943c22c3@gmail.com>
References: <20261104-ti-qspi-v1-0-c286943c22c3@gmail.com>
In-Reply-To: <20261104-ti-qspi-v1-0-c286943c22c3@gmail.com>
To: Mark Brown <broonie@kernel.org>, Felipe Balbi <balbi@ti.com>, 
 Sourav Poddar <sourav.poddar@ti.com>
Cc: linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Mark Brown <broonie@linaro.org>, Felix Gu <ustc.gu@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793801296; l=745;
 i=ustc.gu@gmail.com; s=20261030; h=from:subject:message-id;
 bh=rUZ7lB9Diy8GMB+evfnbtdI5k01dQ9R1OHte5qzvqtQ=;
 b=UbAF4Ylfdn+C9/aGfW5/nYX4rzwIsUGVlbiVyB2b2DstMfkY5rGmk5BOkok+gZah58kCTRxI5
 c9uU6vc/HZ0BzzzQ6o0z2NTr/oz5epG130rTHbwQ53PHf3ogrTSq1xm
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjDJtbnSeysEBjmOfNYqYUUDS6g7Tfov9W5oGngTBfo=

The driver holds no runtime PM reference to release in remove().
Drop the extra pm_runtime_put_sync() to avoid usage counter underflow.

Fixes: e6b5140b7066 ("spi: ti-qspi: improve ->remove() callback")
Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
 drivers/spi/spi-ti-qspi.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/spi/spi-ti-qspi.c b/drivers/spi/spi-ti-qspi.c
index 6908dc3621fd..0cc8c2d52226 100644
--- a/drivers/spi/spi-ti-qspi.c
+++ b/drivers/spi/spi-ti-qspi.c
@@ -913,7 +913,6 @@ static void ti_qspi_remove(struct platform_device *pdev)
 
 	spi_unregister_controller(qspi->host);
 
-	pm_runtime_put_sync(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
 
 	ti_qspi_dma_cleanup(qspi);

-- 
2.53.0

