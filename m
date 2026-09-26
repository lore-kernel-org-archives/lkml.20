Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D750B3A83AC;
	Sat, 26 Sep 2026 12:40:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790426433; cv=none; b=knJ0FK34I0z4RYk3TAYNa4KoknvmFaQpn814usoHJdivRyAQi5Fyw0vFyYNEbixG9Hh7WiPgOHRbnCuvYTTpScyFPUwIBaDNzOaPfywI4qao80EvHkDqf2WrXMflpCr7W54WrfVm0nUe6HBxnP5sFzgGmu38IePeEQISdPs6Ans=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790426433; c=relaxed/simple;
	bh=fbeH1V4vzunDOndyawowxW/6qRCo8v7L07Fr6mvTg5k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=njVzCbOn0asWQIK4Drk2nFyv9JlRqNzZIVXFASO0L3VytE8VWS/Z37me+iZHrLkiXsSVaDJh2J/kiS+Y+nkWvcYWFIYSHw4mWOtQ5TsPqMN1S+Lnw0V4F625mjRTnwZU6KjvQ7TdQA/B0L8mX7vx83Z8LDfXHwFmnoDwFddlGeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pRx+Op4v; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pRx+Op4v"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8A29EC32782;
	Sat, 26 Sep 2026 12:40:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790426433;
	bh=fbeH1V4vzunDOndyawowxW/6qRCo8v7L07Fr6mvTg5k=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=pRx+Op4v7ku1/IUyCHwevHXuHkCucoxQe0N9phyPYaX77lPzoBg9QnjNkn9Bzmf6S
	 NVqz+cOV51xw9OsosZ7AX7cNHMOXzrmha1sx6xhEApB+joZvrTusBj51deDqNeLT5M
	 bRQPU4agF2/JsdW5YK8x6ovFr9BrMUQWPeOU1Tj8hQ0U5l897BEgtUpBAo54y2+Gfv
	 ye3yX+ROPx1AovA2L3AmBZq2s9FrgR4bnArriW3nrIw3i9pOLvrPWPZmw3XXF0u1WM
	 KHJ3Z7bP1+eFsO6rkdO1BRXXSXuqdNmrBFKu0suVoUmCh4m4C9F5FL/Wg8XzBEJPE2
	 /46mEwAj8An2Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78AE1C98328;
	Sat, 26 Sep 2026 12:40:33 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Sat, 26 Sep 2026 14:40:23 +0200
Subject: [PATCH RFC 04/12] usb: typec: qcom: Make PMIC port probe
 selectable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260926-typec-v1-4-31adc19f32c6@ixit.cz>
References: <20260926-typec-v1-0-31adc19f32c6@ixit.cz>
In-Reply-To: <20260926-typec-v1-0-31adc19f32c6@ixit.cz>
To: Alexey Minnekhanov <alexeymin@minlexx.ru>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Lee Jones <lee@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 phone-devel@vger.kernel.org, mfd@lists.linux.dev, 
 David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2776; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=0rBqhoYEUS5e6Dqw7gl8GlLS56lHpFV9ezYYskglvBA=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBqt70+w/f0+R0Sai12heN/MhIh3cfG2zGBplQjT
 Amw5uAyGPOJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCare9PgAKCRBgAj/E00kg
 cq/aEACDASJtuj9XnIaBYYWlfCvYWzdnaO1kkWypCP+jJS9r7zLJAfnX7V+vN5kArhjrFrO46gk
 wHleVtVTSF2vyK8zTICd68HEyjr1rUL0LWxPZwPNiIvOF6oPeg3HuSVxk6WpWm1ySQt2o+L906B
 0GYzUGwdQYDdV23gcLx8/016p1ubedMwj5IE3iSi4UyYZ7QDzVoigcMNXKvWsmjjBb0FpyB487y
 6oFuYyuNPxdcUbO4nj0Y5smop/cVT0RkGwWPBsFSptKftApLgPTJM3pGqXUESqf24d3R1iJc2pH
 hd3EkC7gQvz5tao6GQC4J0W6RtWw1NhGHERO58xe4eiOlBw37j/ajp69Y6yI8kKiWeNOaM5cl8I
 0TW8qnBMuFaxHhK8GrrC5YT/8gdVX1IaMafE8ZzeebEU9euOrUMRUQNBb8SRnjXBn/Q8veANnj8
 k2YJ+O/KPGpJbiWtuYcbHRtyy5+IqIQprLjhJ+MCc6a9jHsMKQz+LYZGv5lzaFi5m8mWtM42ail
 HiBo82MfXe5eaRKoSrEnA3Q73RGDRbLJfGzu1WHkJit5+kfCOoFBPoBpeux6s8wzjWgxEAWm7kD
 ptCg/Ko3aWWfoi0fTd2g9jasGpzv2KKr/4hg6c5jZe/gIp9dMPf1jOaTgKLHO/yy7hloxJVOuHi
 WLyGtBvZK1f26hg==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

From: David Heidelberg <david@ixit.cz>

This is a preparation for extending the support with 1st generation
Type-C.

Assisted-by: LLM
Co-developed-by: Alexey Minnekhanov <alexeymin@minlexx.ru>
Signed-off-by: Alexey Minnekhanov <alexeymin@minlexx.ru>
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c
index d770e58bc16cf..41aaae6bb3724 100644
--- a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c
+++ b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c
@@ -13,19 +13,25 @@
 #include <linux/usb/tcpm.h>
 
 #include <drm/bridge/aux-bridge.h>
 
 #include "qcom_pmic_typec.h"
 #include "qcom_pmic_typec_pdphy.h"
 #include "qcom_pmic_typec_port.h"
 
+typedef int (*pmic_typec_port_probe_fn)(struct platform_device *pdev,
+					struct pmic_typec *tcpm,
+					const struct pmic_typec_port_resources *res,
+					struct regmap *regmap, u32 base);
+
 struct pmic_typec_resources {
 	const struct pmic_typec_pdphy_resources	*pdphy_res;
 	const struct pmic_typec_port_resources	*port_res;
+	pmic_typec_port_probe_fn	port_probe;
 };
 
 static int qcom_pmic_typec_init(struct tcpc_dev *tcpc)
 {
 	return 0;
 }
 
 static int qcom_pmic_typec_probe(struct platform_device *pdev)
@@ -55,18 +61,17 @@ static int qcom_pmic_typec_probe(struct platform_device *pdev)
 		dev_err(dev, "Failed to get regmap\n");
 		return -ENODEV;
 	}
 
 	ret = of_property_read_u32_index(np, "reg", 0, &base);
 	if (ret)
 		return ret;
 
-	ret = qcom_pmic_typec_port_probe(pdev, tcpm,
-					 res->port_res, regmap, base);
+	ret = res->port_probe(pdev, tcpm, res->port_res, regmap, base);
 	if (ret)
 		return ret;
 
 	if (res->pdphy_res) {
 		ret = of_property_read_u32_index(np, "reg", 1, &base);
 		if (ret)
 			return ret;
 
@@ -132,21 +137,23 @@ static void qcom_pmic_typec_remove(struct platform_device *pdev)
 	tcpm->port_stop(tcpm);
 	tcpm_unregister_port(tcpm->tcpm_port);
 	fwnode_handle_put(tcpm->tcpc.fwnode);
 }
 
 static const struct pmic_typec_resources pm8150b_typec_res = {
 	.pdphy_res = &pm8150b_pdphy_res,
 	.port_res = &pm8150b_port_res,
+	.port_probe = qcom_pmic_typec_port_probe,
 };
 
 static const struct pmic_typec_resources pmi632_typec_res = {
 	/* PD PHY not present */
 	.port_res = &pm8150b_port_res,
+	.port_probe = qcom_pmic_typec_port_probe,
 };
 
 static const struct of_device_id qcom_pmic_typec_table[] = {
 	{ .compatible = "qcom,pm8150b-typec", .data = &pm8150b_typec_res },
 	{ .compatible = "qcom,pmi632-typec", .data = &pmi632_typec_res },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, qcom_pmic_typec_table);

-- 
2.55.0


