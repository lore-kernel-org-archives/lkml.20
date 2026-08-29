Received: from tabos.org (krueger-it.net [145.239.1.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 446393403EB;
	Sat, 29 Aug 2026 05:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=145.239.1.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787981704; cv=none; b=Ho8m+a5Aa/t09aVthGtdO7wrdAL1q8UNk3GjGOKHr2qhe0kN3UE3iuKxtNTtcGnf2Wyi7RloAxuj3+L6R9ATMxnOZCEOno/zw+M7QCE50msXx9pyxsg3iaCnYO6g9x4WebVQR17oGrsT5dmhnLhw+t9CQgyEinjjs95SefHJKCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787981704; c=relaxed/simple;
	bh=kiOWs/UXNh4Q2jAkgJhrcpDcdpe5ZYBmvEzVJN+Dx7E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=k6cC+Zkksa9yxdkauCxc2GBvz/jYkVBcJNUAPFek53t94H8lXMQGN1kyLmLU4rxl868W1YHxkzB5SQNUGkoDTFhB+DBNv8eLAwYMh3pY6gQWQMCXbHaOsHHsT70yKroa/vwGPscRrKlEr85rpwC3MoU467nhvcnLUy74c3NMb8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tabos.org; spf=pass smtp.mailfrom=tabos.org; dkim=pass (2048-bit key) header.d=tabos.org header.i=@tabos.org header.b=NRUhiPVt; arc=none smtp.client-ip=145.239.1.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tabos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tabos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tabos.org header.i=@tabos.org header.b="NRUhiPVt"
Received: from c0d1ngstat1on.fritz.box (unknown [94.31.74.100])
	by dserver.krueger-it.net (Postfix) with ESMTPA id B747A62E0AD6;
	Sat, 29 Aug 2026 07:25:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tabos.org;
	s=default; t=1787981125;
	bh=Xgp1DRzJ1dvU7mLOF0KWFeKbyW4I1F24g6Fga7/NqTA=; h=From:To:Subject;
	b=NRUhiPVtX0L7p8fmIpO0f8F3V44r+zES1gWDB6SPlo+aiHt9bGzFrSb+ciVSe3ZiM
	 Zl2lrzYiSf+37gTi3Jma4IeI/nfJEcttu08h3b0zSEOVYOdroaI2qS5bPdgSbOWZCx
	 jM8MgO887W1bJ/OzxrmdZNfGl4dbsEOrue2aYmd0yojTCHot2YoJt3nJv7eBaEJAu/
	 JH2Z1/XtTV0mYNqW20cEyGmdiU14qtzNRZSzr9xpDIkVgnazH+6lrrv0/yAZLVssrn
	 MF8esCg+OkbOkglWxgzVbHxxSTtr6ReMAk3YKvQBroikpfNeuEPCJ4YrQ0dMm2JFaH
	 qurAmcVJSLWiA==
Authentication-Results: dserver.krueger-it.net;
	spf=pass (sender IP is 94.31.74.100) smtp.mailfrom=jan.brummer@tabos.org smtp.helo=c0d1ngstat1on.fritz.box
Received-SPF: pass (dserver.krueger-it.net: connection is authenticated)
From: Jan-Michael Brummer <jan.brummer@tabos.org>
To: linux-media@vger.kernel.org
Cc: sakari.ailus@linux.intel.com,
	mchehab@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	tian.shu.qiu@intel.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jan-Michael Brummer <jan.brummer@tabos.org>
Subject: [PATCH 1/2] media: i2c: ak7375: Add support for the AK7377
Date: Sat, 29 Aug 2026 07:25:13 +0200
Message-ID: <20260829052514.18178-3-jan.brummer@tabos.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260829052514.18178-1-jan.brummer@tabos.org>
References: <20260829052514.18178-1-jan.brummer@tabos.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The AK7377 drives the focus actuator of the main camera on the Fairphone
5.  It uses the same register layout as the AK7375: a 12 bit position in
registers 0x00/0x01 shifted left by four, and standby control in 0x02.
Confirmed on hardware by driving the lens across its range.

Signed-off-by: Jan-Michael Brummer <jan.brummer@tabos.org>
---
 drivers/media/i2c/ak7375.c | 22 +++++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ak7375.c b/drivers/media/i2c/ak7375.c
index 9a2432c..4f311c4 100644
--- a/drivers/media/i2c/ak7375.c
+++ b/drivers/media/i2c/ak7375.c
@@ -65,6 +65,25 @@ static const struct ak73xx_chipdef ak7375_cdef = {
 	.power_delay_us	= 10000,
 };
 
+/*
+ * The AK7377 is register compatible with the AK7375: 12 bit position in
+ * registers 0x00/0x01, standby via 0x02.  Verified on the Fairphone 5,
+ * where it drives the focus of the IMX800 main camera.
+ */
+static const struct ak73xx_chipdef ak7377_cdef = {
+	.reg_position	= 0x0,
+	.reg_cont	= 0x2,
+	.shift_pos	= 4,	/* 12 bits position values, need to << 4 */
+	.mode_active	= 0x0,
+	.mode_standby	= 0x40,
+	.has_standby	= true,
+	.focus_pos_max	= 4095,
+	.focus_steps	= 1,
+	.ctrl_steps	= 64,
+	.ctrl_delay_us	= 1000,
+	.power_delay_us	= 10000,
+};
+
 static const char * const ak7375_supply_names[] = {
 	"vdd",
 	"vio",
@@ -331,6 +350,7 @@ static int __maybe_unused ak7375_vcm_resume(struct device *dev)
 static const struct of_device_id ak7375_of_table[] = {
 	{ .compatible = "asahi-kasei,ak7345", .data = &ak7345_cdef, },
 	{ .compatible = "asahi-kasei,ak7375", .data = &ak7375_cdef, },
+	{ .compatible = "asahi-kasei,ak7377", .data = &ak7377_cdef, },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, ak7375_of_table);
@@ -353,5 +373,5 @@ module_i2c_driver(ak7375_i2c_driver);
 
 MODULE_AUTHOR("Tianshu Qiu <tian.shu.qiu@intel.com>");
 MODULE_AUTHOR("Bingbu Cao <bingbu.cao@intel.com>");
-MODULE_DESCRIPTION("AK7375 VCM driver");
+MODULE_DESCRIPTION("AK7375/AK7377 VCM driver");
 MODULE_LICENSE("GPL v2");
