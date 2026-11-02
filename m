Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=45.157.188.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793650982;
	b=ih7UoB6cIryaRojqW77guwpVN3TvE4Prr8aqdGKFbrJbstsxAaxCvOz+iMYLPE/azUT6
	 9Wm1tm9dtky50RjyUUCKMLXnRulQKCFkviAoHe+PENorbkeWzB+/5HCQtzA+jdLnp9YDC
	 +P085WpPN+iX6DCdxA02vXIeG1IHHmr5iguFbVP9LfOGSyb25qhWl9w6inVmzhmbnrgIL
	 9OnIIItQXnxdJTsDftjn+JsGIx7552qnHSUNWPvmyk1sRTqRopEdoIFgiqM/QyXQEQmg7
	 Jah224r8UXEWbUNvJKxX7PBi9oopZhSBNyIHNMeYSobTsytOBjlMT2WyT0WE1V2V0cw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793650982;
	h=DMARC-Filter:Received:DKIM-Signature:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Infomaniak-Routing;
	bh=EDgvLGh0EsgZZ6Jjp0KRVHOntBTitbUy1XByH4rUBAw=;
	b=2OT+QGAwW5Y1zVI+gN9v3AJnqci2zw2sGRmmEL+Zbg+kFQUvkpxItzFZwKy1ts9XHWUX
	 REZEQZDnfgfpSjWpcxdAwTi6DxlYI5grSRTOf0NbBDho8okgPthGwUl2svkA41yP55udt
	 lYSPxec1IED6ILUMSZ2ybkt4a+RwYrvr8FrN6FGTKFXG10fRhK6+Mdi1XHisUXtqPJazF
	 PiLZZLNKlJGda42DcY2XRkj08Go3UjUVTP7U6OJm5HMEyUTk9ObWlJRMo2uJlJ5vELYLI
	 MMpWhITOB0WdDn+nXQwoeqSVRSgbLAqwfEa1x4eGLKcW/a/EeL2vaHI16lLAv+zXeUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=0leil.net;
	spf=pass smtp.mailfrom=0leil.net;
	dkim=pass header.d=0leil.net header.i=@0leil.net header.a=rsa-sha256 header.s=20231125 header.b=f3JgYF6j;
	arc=none smtp.remote-ip=45.157.188.10
Received: from smtp-bc0a.mail.infomaniak.ch (smtp-bc0a.mail.infomaniak.ch [45.157.188.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D890606A33A
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 20:23:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5D890606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=0leil.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0leil.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=0leil.net header.i=@0leil.net header.a=rsa-sha256 header.s=20231125 header.b=f3JgYF6j
Received: from smtp-4-0000.mail.infomaniak.ch (unknown [IPv6:2001:1600:7:10::a6b])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4jJNRy0TQGzTt;
	Mon,  2 Nov 2026 21:22:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=0leil.net;
	s=20231125; t=1793650973;
	bh=EDgvLGh0EsgZZ6Jjp0KRVHOntBTitbUy1XByH4rUBAw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=f3JgYF6jRTzxLGaYDh4ADs2tAlTJxXnU+6vZeIeK8tWUrYG/MDhCADWF1xphk79qK
	 Y/eADuyyhibUT+mGJZuNOe/Fvg6t8qasmnBMpbZcnV32CsGPssgv11Aco3h5ynIMMV
	 vdWvA1BhEjhU+zqNCWEYgfoQHcn4my+nwZ4O0JPluQldAfuwkXtGv3yABvOglTOu4I
	 HS8esLUTWijLvb77VSQCEXnWXzaHdPCfeqSS6Tc6OsKOTQHMRAksQ5kvwc1itpWjbA
	 qYF8J4jbB18hd8atVMmCs6TJfz1D4DESfoU58Sf43kG6u4tgxiZwTO1exT13oCV76C
	 5iX6/THiGPJMQ==
Received: from unknown by smtp-4-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4jJNRw6W05zqwr;
	Mon,  2 Nov 2026 21:22:52 +0100 (CET)
From: Quentin Schulz <foss+kernel@0leil.net>
Date: Mon, 02 Nov 2026 21:22:44 +0100
Subject: [PATCH v2 3/3] media: synopsys: csi2rx: add support for Y8 and Y10
 bus formats
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
Message-Id: <20261102-v4l-y8-y10-csi-vicap-v2-3-0a4149d96dae@cherry.de>
References: <20261102-v4l-y8-y10-csi-vicap-v2-0-0a4149d96dae@cherry.de>
In-Reply-To: <20261102-v4l-y8-y10-csi-vicap-v2-0-0a4149d96dae@cherry.de>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Mehdi Djait <mehdi.djait@linux.intel.com>, 
 Michael Riesch <michael.riesch@collabora.com>, 
 Heiko Stuebner <heiko@sntech.de>, Bryan O'Donoghue <bod@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.17-dev
X-Infomaniak-Routing: alpha

From: Quentin Schulz <quentin.schulz@cherry.de>

The OV9282 camera sensor driver can output in those two formats, but the
CSI2 RX controller driver didn't advertise support for them yet.

Suggested-by: Michael Riesch <michael.riesch@collabora.com>
Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 drivers/media/platform/synopsys/dw-mipi-csi2rx.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/media/platform/synopsys/dw-mipi-csi2rx.c b/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
index b7247d597c9cc..9e99947a15252 100644
--- a/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
+++ b/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
@@ -198,6 +198,16 @@ static const struct dw_mipi_csi2rx_format formats[] = {
 		.depth = 16,
 		.csi_dt = MIPI_CSI2_DT_YUV422_8B,
 	},
+	{
+		.code = MEDIA_BUS_FMT_Y10_1X10,
+		.depth = 10,
+		.csi_dt = MIPI_CSI2_DT_RAW10,
+	},
+	{
+		.code = MEDIA_BUS_FMT_Y8_1X8,
+		.depth = 8,
+		.csi_dt = MIPI_CSI2_DT_RAW8,
+	},
 	/* RGB formats */
 	{
 		.code = MEDIA_BUS_FMT_RGB888_1X24,

-- 
2.56.0

