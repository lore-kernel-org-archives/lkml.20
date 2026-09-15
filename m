Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14F084CCDF8
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 20:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789502406; cv=none; b=uwKS2l966r4LouJR1rDvGgscdMObmbfoZaJyRIMq6MZj6OnrJWPtEwuei0x7OoQlxBBZ+SnmL5Lanf9UKQke6PHh7Y3bJxG3qHu6pkgDmH7AJC++jtY5NOIYDTqhl0KUb2Gj5L4ILmzxTx73enaMr4cPBduyhdRHtV28BKo6ecc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789502406; c=relaxed/simple;
	bh=rU5hn5sFX5suDIgkTWX0l32P4i3XmX0ieDb33aPQv+8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EC8J5k4rr+epKIdL22kVSLqZHvx2pQN7EjZAFAACTVX1ZciqkcreIYTcxCE7N338FdTSMT9HUfkt8TupD3emlUkaiSISisdnHtkWANig5NT7W25SQBCTp+eIuY0D1o2f0k/CVGWXmgq1n4PDc+kg2WdJJMHSk9smTrkY/xRlw1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MbxQOK5Y; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MbxQOK5Y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B5441F008A4;
	Tue, 15 Sep 2026 20:00:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789502404;
	bh=seQNbklDZ9cnV/pz8flhlM+pU6BoKQvQHaVdtXgUDl0=;
	h=From:To:Cc:Subject:Date;
	b=MbxQOK5YsyIK85k1DdBGbY1KCZ4GuqRBN11aZpWexTh+f0AF5z2OyINu8fqTk0/5U
	 Ymf86ehquvAEnWwSiCAipdqws9h/zi5aHeVjkTwg+ez8Z1xDtMD+aUFFaqVDCktCsv
	 mLgfGXvPkjMUxo0+Y2LFUst0SqxeXoWAHKGLsM0muOPLBW0vijbKB3XL/8dPwdOOeQ
	 axu0TfrZYgcBnIOHO0LtTUrv/rBtYPax5hGK/okJrBClwmjjSwvgkapS8lthQ0qZ/o
	 kshRNZw6N4UcwbMty+YV02GU5CnMgKy/hXDQUuHfihE0Gbs5GpA3/qzNIp/YwTn6rY
	 dih8bpBAS59jw==
From: Arnd Bergmann <arnd@kernel.org>
To: Thomas Gleixner <tglx@kernel.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Maulik Shah <maulik.shah@oss.qualcomm.com>,
	Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] irqchip/qcom-pdc: fix linking against QCOM_SCM firmware
Date: Tue, 15 Sep 2026 21:59:27 +0200
Message-ID: <20260915195948.3521662-1-arnd@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

Build testing with SCM disabled or in a loadable module fails
with a link error:

s390-linux-ld: drivers/irqchip/qcom-pdc.o: in function `qcom_pdc_probe':
qcom-pdc.c:(.text+0x18b8): undefined reference to `qcom_scm_is_available'
qcom-pdc.c:(.text+0x18ce): undefined reference to `qcom_scm_io_writel'

As QCOM_SCM can already be enabled for compile testing on non-qualcomm
machines, but is always enabled on Qualcomm Arm kernels, use that
as the Kconfig dependency and remove the ||COMPILE_TEST check.

Fixes: 1b852de05f74 ("irqchip/qcom: Enable compile testing for QCOM_PDC and QCOM_MPM")
Fixes: ad01c2b2f291 ("irqchip/qcom-pdc: Configure PDC to pass through mode")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/irqchip/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index 89805bd0bd3e..039eaf086245 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -526,7 +526,7 @@ config GOLDFISH_PIC
 
 config QCOM_PDC
 	tristate "Qualcomm PDC"
-	depends on ARCH_QCOM || COMPILE_TEST
+	depends on QCOM_SCM
 	select IRQ_DOMAIN_HIERARCHY
 	default ARCH_QCOM
 	help
-- 
2.53.0

