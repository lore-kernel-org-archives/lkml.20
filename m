Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09F9D37C0F8
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 17:17:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788801456; cv=none; b=OHuwA09WkgmKTYiJecKeS0pkoig4oHdg8RgALdROZIkE39KfTDKf0Rt3h4LOOpmr6jC3zdtQqbypQ4Uigb21fXTVWmU0tB2x41svaRoVxFTRXhVx3R440Pdc5miAfXbmFOE4Rb0q/KCEDU/1dCf/CkWOIL3QLGzw8+U78wSTsHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788801456; c=relaxed/simple;
	bh=cATq4vwZ6kLRCUU8BG4OBSNaQEf77GBYSF37WTOJhuQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RqnTq0XaKGCENmw1A3RuhEOpCB3YDifhsvSv1I8cEOUfOcATNUpHDGZYIAGkqaZhusN+quTbL6md0a58TCoW+Nx5SscBt0/2moqWYhfgnKGxamHFWbFO10CcY0JtjKl6i5ugv7Edmk4CY+s62+V36lXx2nBdxB4pWx6gFhxE5C4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gTijYtAe; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gTijYtAe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53BB31F00A3A;
	Mon,  7 Sep 2026 17:17:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788801454;
	bh=0KJSFaY8RpRUnGL7KM81yLVk3CH1pm35hqoFS3pUZkc=;
	h=From:To:Cc:Subject:Date;
	b=gTijYtAeZBeBB8iMo5FW02jkmvq2daebNWPf4uDIwRda/4XIRibxQA9spqKe7j4G9
	 N8+/eCCPZlOFJMakM1rQcY8sGbuG6EUo1PkG28IbD12JReDi6EMqFUnEi7xfwOOUvA
	 x3XQmQ8uzCUP73OsdpBdxXvFze6XPh+2+LTxYHoaif7PRKK5ElTHWkIGv622CszizN
	 kKJXlM6ymj68SmOXhTkDKpA+WXmNCJ3Yeq9QkMbZRu3GE+dIoMCmEGeTwqoAkyGx+X
	 bYrV7YzPKtgck6wRg32MYlymFqE0+tk9zll+2E+hjpyQnRDAQb1fp+Zu8vGpCXXv1e
	 SiFNHJya9lb7Q==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1x3cyK-00000005sy6-1G9c;
	Mon, 07 Sep 2026 17:17:32 +0000
From: Marc Zyngier <maz@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Abel Vesa <abelvesa@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Mostafa Saleh <smostafa@google.com>
Subject: [PATCH] interconnect: qcom: icc-rpmh: Add opt-out parameter for QoS settings
Date: Mon,  7 Sep 2026 18:17:29 +0100
Message-ID: <20260907171729.1735641-1-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, raviteja.laggyshetty@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com, abelvesa@kernel.org, andersson@kernel.org, smostafa@google.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false

Recent addition of QoS configuration to the X1 variants resulted in
systems that spontaneously reset at boot time or under load.

Given that this is both very unpleasant and hard to debug, give the
affected user the option to survive such event with a module parameter.

Passing "icc_rpmh.enable_qos=0" to the kernel command-line will skip the
offending QoS setup.

Link: https://lore.kernel.org/all/apgeBNSiP01YfNcs@google.com
Link: https://lore.kernel.org/all/86ld9d4h4n.wl-maz@kernel.org
Signed-off-by: Marc Zyngier <maz@kernel.org>
Cc: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Abel Vesa <abelvesa@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>
Cc: Mostafa Saleh <smostafa@google.com>
---
 drivers/interconnect/qcom/icc-rpmh.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/interconnect/qcom/icc-rpmh.c b/drivers/interconnect/qcom/icc-rpmh.c
index 3b445acefece7..3a4743c364dac 100644
--- a/drivers/interconnect/qcom/icc-rpmh.c
+++ b/drivers/interconnect/qcom/icc-rpmh.c
@@ -224,6 +224,9 @@ static int qcom_icc_rpmh_configure_qos(struct qcom_icc_provider *qp)
 	return ret;
 }
 
+static bool enable_qos = true;
+module_param(enable_qos, bool, 0660);
+
 int qcom_icc_rpmh_probe(struct platform_device *pdev)
 {
 	const struct qcom_icc_desc *desc;
@@ -308,6 +311,11 @@ int qcom_icc_rpmh_probe(struct platform_device *pdev)
 		struct resource *res;
 		void __iomem *base;
 
+		if (!enable_qos) {
+			dev_info(dev, "Skipping QoS (command line)\n");
+			goto skip_qos_config;
+		}
+
 		/* Try parent's regmap first */
 		qp->regmap = dev_get_regmap(dev->parent, NULL);
 		if (!qp->regmap) {
-- 
2.47.3

