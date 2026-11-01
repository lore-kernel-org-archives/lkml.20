Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793572346;
	b=b9Jj0ZVnZ5DxV91gAVqTUFn2T4t4BYLqUI67gLSgmyGKkjDHxamzpuBOFc1kSxIVTQK9
	 tan/NQ4Mg+dKm3x+x9Y0drSBNE13nnL0lt33fPL3J8DSlmrUFPNtevTmtAA8hJ7IHaVl7
	 H3qSbwid/kwP5FcTMjZHT+S8qyC07tvUlVTuflcj4BD/STTWYoGQ4WP4AMQJZu958t0t2
	 FwIT5yieoLr0cmMWZ33uHzZy8aQFRaIyWfpIw0upkG4T5ct0sz/i8KUU9wi4IZj8NFBCt
	 cmAKMIJNhdQuVv4FIkjHAat2puyKgHc+Qm+oXv/NnlhqioCodYGnqj3VonQRnCWvG8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793572346;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=XRvRDso/7nPZytfvh9i/Caaj8XKSnRZSw/8wKdSxLLI=;
	b=LbX8Mzq0rk9eHvU4qazwsUxfhPk5sWU2FrT1DcE7zfRM/Pd07zyjHlbN5YVEL8SEBHTk
	 lPCkIAGyhLH8LJ5xCKkJXB5GxRmYsFAukSbgFNEXfUwrohrYWH+xL8orS7VJtsTn4KhQ4
	 jklgevxoPXCUv8qFWomwcmiRcaEo7rkZQ7Ygsdzg5hjwLgFpMLNESf+9zc26z8i9A4ZPZ
	 Z6FzK6cmxptC9P+VPyCk3+sDt4N+EUbOm8SIkVKpSCPyaLCa2DXiT2Ahp4jTOn43rWTaw
	 BFOObAckognQ0KkEK5zhyO8yZyK5vWq7v188uaBxAF7XmLgtzjbAYopxDUlyggwyM6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Fl54vXXb;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A277460A2617
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 22:32:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A277460A2617
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Fl54vXXb
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48df0fa43c5so1265457f8f.0
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 14:32:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793572344; x=1794177144; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XRvRDso/7nPZytfvh9i/Caaj8XKSnRZSw/8wKdSxLLI=;
        b=Fl54vXXbi7E+dcc13GUQQb+Dt3ko5u3cnwE6ukPSHWcJjwnTDduv03sCHMmJJ/90zN
         ZhlXtlEeojN6ruH/3mp/8sqcAOLEaN/Rs/nnA9vQIZi0BbGl82GInChE57eQG6p2OrZH
         VYNsR6JnPwDJV2gfeWvzrI5F1CKKDxZu4uOpK5oxlmcasO48mZYdxBEbOJm1LONjrjMI
         G6p0lVpnT8g1wKCLhwy5/3Wc3NHHrRQ3/KDBi65vJEfS4Ggw2K7mNGWtBMgO2KJ1sTNE
         ++yhNigSTKTlG7ssn2e0EwqjQ+b54RbVj7sH6Y/5J8CH5YaS+otLOHHlvFJL5THVMLB9
         iJig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793572344; x=1794177144;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XRvRDso/7nPZytfvh9i/Caaj8XKSnRZSw/8wKdSxLLI=;
        b=IVFroyBYvvcHgTY0inJd7GkRq2vHQHuV9UDQ+xDaniskpoKHHzLEfpRF5nsj3/vQ4r
         mTAV0oF+f7jOlL2vb8lB2k9DWluio5DkX91o+saeG9PfNPVMImeuPyIpgZ/9jWiTmqbd
         MiPe1m9+7Q5tY7/K7pQz+KyS7N47ofDTQq8xHVnPFoiX68Xc2JwXxk49UmNN5JL3YxGq
         OG+HBIM+KLx491NxYFVxzEpwn0d8zvOQZ2co0utsMbcgL707IK6RBXgxve9clwrgoEni
         mRaAJgi2r1UPcM6C+P9rSJSaXqAgTtzL25O49E6Iw8P389RuSvuYviHn8dkWNPnTQtat
         EvuA==
X-Forwarded-Encrypted: i=1; AKwUvBxFkrEAgFTURfDvY/NIUau5PsoTYK1pPmtXtMoF3w8gsD06td2VwAtc+skLCP1UrxD4EbpMTyuIBM736BE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Rjz8xglPdq3ddcxtC79xB8wFjW+s14LMuwl/DgQ/vE0IGda0I
	LmiOb8CxJb5cLOywIBUlm86B7iByQbTBoedds/VRBV8uxsAr2sfvGasC
X-Gm-Gg: AYBFou2SFnoyGPksqb4f5C9JVnIwqoJVGfCDG6adxCPnyNV8jJZX/JdFcvZYd/BXdL+
	KQGpFJtr05sRmlvFnS89y5zlHdUu22smVnzRUCTOiHvesWa/3wRXf9gZW1n/TZ9YoYvm3u57kNA
	uPIF+Z5J+JVhIFvpNlQfn0BRFNv80pXI3EfMk+vI5vbYIs/pAqIdjnVt3QBpdqowXEZUNnrlykN
	+Fky7i7Se+i/1UlpdTzpM5Md3l0yVmtCbxUapt0Qi5ARCYRNtsKquP8c/Ns03eGPvMaFT7qEfaT
	i9mcAp8AcXC5Pd4sLBEbkO2KKrcohh0GiHTdtdxzT40mfTFNWyIVdL3I/3itB18hx5lH8mu5ALh
	yo5068g3HI9pdnGTvXs2sTaeAr3ntDHdi3jHT3jEvvn0My2Vl7CHPAlUMgwz0iKsd153QJITG9z
	TrhS6u4pPjddCMOgx89gD6qYYyVEXhhGeEnTz+ZXy97wNwQOjdPx+8bgkMxNhWzumOKB8zbXjmh
	IYNaF1tuCxAMDEhFvr2+3VoNZ4y5xnRCOcqEv1mhSwC/3gLZw0CfsaFkcKuljQRfzJIeL6QQ5ZI
	5GYC+Uh2ww+QtBieZFmcgyhT+jvS7ucmM8sr+ijagKmTkT/E1NXxDYGXqT80T3D2XmCQOcmzZ36
	9xlycqiVfag==
X-Received: by 2002:a5d:6308:0:b0:48e:884:affb with SMTP id ffacd0b85a97d-48e64cd42famr20330228f8f.24.1793572344037;
        Sun, 01 Nov 2026 14:32:24 -0800 (PST)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b78f95sm14904805f8f.28.2026.11.01.14.32.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 14:32:22 -0800 (PST)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pablo Mazzini <pmazzini@gmail.com>,
	Alistair Francis <alistair@alistair23.me>,
	Andreas Kemnade <andreas@kemnade.info>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 7/7] ARM: imx_v6_v7_defconfig: drop the SY7636A MFD option
Date: Sun,  1 Nov 2026 22:31:25 +0000
Message-ID: <20261101223125.302001-8-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261101223125.302001-1-pmazzini@gmail.com>
References: <20261101223125.302001-1-pmazzini@gmail.com>
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

The SY7636A is no longer bound through an MFD.

Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
---
 arch/arm/configs/imx_v6_v7_defconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/configs/imx_v6_v7_defconfig b/arch/arm/configs/imx_v6_v7_defconfig
index ed588add8d31..f02b5605e533 100644
--- a/arch/arm/configs/imx_v6_v7_defconfig
+++ b/arch/arm/configs/imx_v6_v7_defconfig
@@ -239,7 +239,6 @@ CONFIG_MFD_DA9062=y
 CONFIG_MFD_DA9063=y
 CONFIG_MFD_MC13XXX_SPI=y
 CONFIG_MFD_MC13XXX_I2C=y
-CONFIG_MFD_SY7636A=y
 CONFIG_MFD_RN5T618=y
 CONFIG_MFD_STMPE=y
 CONFIG_MFD_ROHM_BD71828=y
-- 
2.52.0

