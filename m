Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794130597;
	b=2Np4/SbH9UhTQBm5wsLc09JgUvL0Situ1JVTMxqGWEHc+3vABI+7jgboDaCJe4QkI53t
	 UiJYerE+wMzDYs7GyyO8TDxEXQqkK/g28zTr/NH7CNmp7K38ZTxvofGFAgiGF/XvlMVlX
	 1utBQXPo/3XRgApyh/n5CqJ6a47IdvWZdPHvdFeoDkCt4WsvMgtYVwcptwYaz+wONs8sl
	 9RARLCwKOtHgpsucE64REVox9cvCHLb8qDe7apgnWbBN2uCs5lZZmJfhI6p0sF6+BkOff
	 WodUX9dCoca25JQCJNyb2grPVjZX/3xGZFu3f4BtaQA6p0cRxzsM60EnkiOwD0s/o1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794130597;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=XRvRDso/7nPZytfvh9i/Caaj8XKSnRZSw/8wKdSxLLI=;
	b=itojgXzQUhXZVZVI0tIRDQ80kNu/Vq/l6e0BO1Ey1vh+Jdgr7oGEgYrANrO8pxvsQZre
	 XTfeI+p7yvutA1sK9aEhbYWprZx8lAGWnLRaqEeXMxYqVo9VKfyStZ+sPoeBOLl/m8ssm
	 AKoQlOp8BKd0+Ogr41TuCEO6raGzRm7XUVe1fyiThLEEPXO6c6FFu2b0gd/WtSIfLFJVF
	 EX7NsnEo3GVs+pLKm5KkUciITwVpjXvnJODRsk+rrSOMZawRLuqczoygfEwRTs8u9Hn5U
	 AvIYH95JhXOjtk9ujr3jIJs0YCU3dGrA8reVRd2l+V9obHX3Vn8h7pvMMwx8sCCumHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="cslaM/wD";
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52585606A33F
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 09:36:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 52585606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cslaM/wD
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a35db1f202so1634465e9.3
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 01:36:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794130596; x=1794735396; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XRvRDso/7nPZytfvh9i/Caaj8XKSnRZSw/8wKdSxLLI=;
        b=cslaM/wDmQUYurehWnCKWgCQteUmGzww/NebubU6YAwLPIx7sXRExXtd/OA6JY7Wj8
         Www/TL0F2che9J7fqwzrU0j1tdN7F8YRyCbdSCZR2LFjzjC01hbuQW/7+ypSGvey4rcb
         +7h5+mkY8hgdBljNdE6LrJty7UR655J4HkMtzdfKhGNVLS8YSZJ7VD4/XMTKpgjt29FV
         ZPqClp10wWcHu4VTG0mjIGfPblY+wyb96Ew21sntRIYzdpvO9EdT8TxEEePr9IODaQwq
         noEAoJ5N5Ra6SFyH7XMoEvfTpHHgT5rjM4Au68mrXtVfqcYcUO3Av1YhDzbF8UMFQOy4
         72jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794130596; x=1794735396;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XRvRDso/7nPZytfvh9i/Caaj8XKSnRZSw/8wKdSxLLI=;
        b=ytOUa00424iK4zixHICPtxbLf63kma8j5rARSl29rguXk5z/fMgmU6CWLFJ4K6roFk
         QxjSnK5BUb0UlcG3l4Tdycgk9/npCTe3S4dZ03UVZVnkyinIHz9H5CGrMakN+PeilRWG
         mxTg3ro67WSFO4LcKcOqy/upZEeievDzWeFW6Q7zM6X7icmuKgWJ70m+Ox0mU5RrJE4k
         9eYiIE2X/GeNUELZRdHuh53JdHffNSBAYqXDHtqFEVEo9QZ89uTyawx/wAjQWcfsBIF1
         WJ7/I8ZUcAaAtimFrgJ2kNyWOroDh46WWIXwioLNxa9R+yxRiY6s17gPKOqK/GNvQOmh
         O/rA==
X-Forwarded-Encrypted: i=1; AL+hErHlcg5a3UgdYiIlaBMHz3XdNPZ1Jh8vj5Apf+WHMvHYA9KPi3thJCVCEifIZeiN5WRMfE+gDjU6nZ+kJXo=@vger.kernel.org
X-Gm-Message-State: APuU4Z/vMdoSafHAo4vfVGNaxsjoUYDVkVHmRduhYW+PTvQS1rH2VULL
	hFU50yaLORBcggDPVgEdSq/jDtaF+WzoPC030MlvUYk/ifG1UtKFk2hp
X-Gm-Gg: AYBFou1afn1wWW93gsrzhkB+tNQoFF+qyCrbKmVUKefn/g+LH4pdMeIsdopLWkXL3UH
	1ldoOSA6S+N2cQXBPTigSu0UzDJHJxmE6Jrmlw3rZXE9FLb0XdXOqNT1PWY38/Qp1qQPdnEm28J
	HG/JQmx8Pfj+Dt14sCZamam5qMSM0Qn5Atx+5uahzi+9IPy3EM0wuGnoeog3sxWpY962IIj+Lzn
	cfeD/rvSb7FLzM6ZkyI+8P2J9eyX9XmeNJ80dgYX73zH4qGztJnlID4QiHpba2irviQ5TtVQ9pi
	0UExEwLDDEA0Xytze/AfD4I5qP9Dg2lEAT0ph2Yj5ar+el1ArbMCNYUWrfPu8F7Xl8SMSYOcIvr
	Rsmpt0TDRuUQB5V/Gk1yHm3qEQnPGXXdYjG5NOD1extNykElq7RGCKjOHK/SVaf1FKzDTRAuULq
	/0zDb4ccuGrfKrnDYN+Fp5HLZeTCwYxObCKY6n32ZPGKZ/maB8dnwNML/w+H+5M6RT67SMhlxVz
	7R54591nLYnGE9Am5Cj7arMFlXmVY4G8Vqmsecck8oPd+mg6Cm9mE7eI2oel3blVX/5xn7WMHMe
	RRN7P7s3IuPUDiQt8U2QVUHlhb3WcDYiaGLKDHwiZ8FnwYeevwBEIy8EjkOuN2A=
X-Received: by 2002:a05:600c:4e05:b0:4a1:d537:1c8d with SMTP id 5b1f17b1804b1-4b963c6d1ffmr18967885e9.19.1794130595723;
        Sun, 08 Nov 2026 01:36:35 -0800 (PST)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7e6eca30asm141650355e9.7.2026.11.08.01.36.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 01:36:35 -0800 (PST)
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
Subject: [PATCH v3 5/5] ARM: imx_v6_v7_defconfig: drop the SY7636A MFD option
Date: Sun,  8 Nov 2026 09:36:02 +0000
Message-ID: <20261108093602.329554-6-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261108093602.329554-1-pmazzini@gmail.com>
References: <20261108093602.329554-1-pmazzini@gmail.com>
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

