Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1803D39B4AF;
	Tue,  6 Oct 2026 23:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791328757; cv=none; b=FnmhORDKMMdwMtn6N5WdvUj9vN863CqLNi5TLBCnbctUOphic69g2qJDNnHD0UTVhBbWWCwUeDQSQI1ai+3ZWKRik2PkBCZHBbBrUVPsDSdQGNnmThqKzev8isCAWKeT6Ekf84f5RbUZDN3HNKdkUVsD0kCwqdE7s4Iqn6hJgYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791328757; c=relaxed/simple;
	bh=wZBCfPgNbNypRqCNqk0EzEZ2zoE5W9Vf8XqQCt4epW0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=N1e4FFr7Zrj0N0z5AWsGO1mRiEbaniDvh4xm7rxdvL8aCdiEQcYZxo7eMUOuhhhFI7ubT1pGxSm96wv5qjTIKsygJvgFaDfKO37T5lwBBXxov1IJvNGiGvk+f3J8yr4BK0Igb1vJVm8E6yA/3kzY1HCUfdDR+Qu7/DTGOM3+cFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=JoIeGJlp; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="JoIeGJlp"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=/kmrwrUGCHwJY++adeitwVAaOx/vl0CuFPe67/V3pnU=; b=JoIeGJlpfKWWGq/3j2MDOVpcSb
	BVG2UMaCgKTb1148s/UnpjvMDgulJk/V4q9FhZ8rLmnF1Xa39zxzV/xHJrMz4KZPcRohia7EI/A5b
	cHi6nMab0rYopcqDir262OAMsEva5hgZLyEOS5EWur104eDBhUygvm6qSqTjCunoxzcJvdj0Y9eIn
	u6hFxzCEFVFK4qLUjmyQdwZjju2DZXcYJLpZALbSVt/Lff4IsSOW3OI4NYojp5b7sUsH7WwJuA+Qg
	k3NolItjIpTULrNLKeTAZYs78iIyMdCbuh/Yr4KlP2n/+KNMllKa+en8MWCtadDgb9ry1/Dm+1/vl
	DqFvC4RA==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEEQu-00000001U9d-3Uru;
	Tue, 06 Oct 2026 23:18:52 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Maulik Shah <maulik.shah@oss.qualcomm.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Radu Rendec <radu@rendec.net>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH] irqchip/qcom-pdc: fix builtin vs. module build error
Date: Tue,  6 Oct 2026 16:18:45 -0700
Message-ID: <20261006231845.461332-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When CONFIG_QCOM_SCM=m and CONFIG_QCOM_PDC=y, the build fails with
aarch64-linux-ld: drivers/irqchip/qcom-pdc.o: in function `qcom_pdc_probe':
qcom-pdc.c:(.text+0x1060): undefined reference to `qcom_scm_is_available'
aarch64-linux-ld: qcom-pdc.c:(.text+0x1094): undefined reference to `qcom_scm_io_writel'

[ARCH_QCOM=y, COMPILE_TEST=y]

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
Cc: Maulik Shah <maulik.shah@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Thomas Gleixner <tglx@kernel.org>
Cc: Radu Rendec <radu@rendec.net>
Cc: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org

 drivers/irqchip/Kconfig |    1 +
 1 file changed, 1 insertion(+)

--- linux-next-20261005.orig/drivers/irqchip/Kconfig
+++ linux-next-20261005/drivers/irqchip/Kconfig
@@ -523,6 +523,7 @@ config GOLDFISH_PIC
 config QCOM_PDC
 	tristate "Qualcomm PDC"
 	depends on ARCH_QCOM || COMPILE_TEST
+	depends on QCOM_SCM
 	select IRQ_DOMAIN_HIERARCHY
 	default ARCH_QCOM
 	help
