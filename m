Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AC5943F4A9;
	Sat, 26 Sep 2026 12:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790426434; cv=none; b=LfkAB7Snu2qgMWhDwPxTpuDNxeUunTNvH9uEohk65nap7J7QzCK/iO7HBN45mxaJ7pYwcWoeL/HrvD+BMVCEQlkxsCnmiomfVdkJ4c9hLK5NEtMH0TvGCTM49ffycU6xDZdCHwouMpGtoWuR31OuR4O1/wyRNzknaQXoowxnOf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790426434; c=relaxed/simple;
	bh=IKIueHDGdKad1dbZuuleadx3ptYZIb6DginSe2S+pGw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BaYpv3ZwVYjWUxMXZQTEhrBJC4OrImQKjfLZWZHZXb9V9llLgLDFH4/JfBmP2pJwr7vGPCj2U2X3rqU/iLxgh3nh0jE8taB0ABnpbeiH84dhbMahZHq7LdB/TX95zq4uSZQ78Q5u2yJWMuqGYgDiginNoUqT8QBcG58z5MUkxAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q5g+k5pZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q5g+k5pZ"
Received: by smtp.kernel.org (Postfix) with ESMTPS id A0936C2BCFB;
	Sat, 26 Sep 2026 12:40:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790426433;
	bh=IKIueHDGdKad1dbZuuleadx3ptYZIb6DginSe2S+pGw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Q5g+k5pZt0RL6PzhpUgUlzuqSTJ0oVd0QB5VWm4GVyLaaddzMjjKWJJICkSNUazUy
	 taH9m5x7QuCOH0uvRDi08yB6r7zLi4xXA4WWEXEBy56TqznDJsAMLjGOjiKmGZtERq
	 l7wzWGal49qqP5gQyrDxXWWKXQjsVVpF8CgdTk6uebxN5QfnPGgf5W590d16H6s2Ja
	 No3/MK1+Sd9SC3vVSSg6ayAW07lziby52fXUhH0eflHCHtirgvRx8iZ9s0/3yMFkcE
	 GUAHiG6Bs8H4C9yPRMT+VxzoQw8G+mvR3EsCcUbXhHIVsP2Y5HjBHWG6+l2qfHicJB
	 CxSnbJqit8Bgw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B174C9833E;
	Sat, 26 Sep 2026 12:40:33 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Sat, 26 Sep 2026 14:40:24 +0200
Subject: [PATCH RFC 05/12] usb: typec: qcom: Make typec_port accept also
 different structure
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260926-typec-v1-5-31adc19f32c6@ixit.cz>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1220; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=Rv/C1XQqReAptmVTI+ZJAAlK7aFi13337WHcMdGcM48=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBqt70+EPEh7Pr+laDPW4tWdnCaH47gu2yL7r0Gt
 l2/AzxTDnCJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCare9PgAKCRBgAj/E00kg
 cr+8EACMj0EdXOb53DNNjlp+WWKFSp/7RfbfxhXER7ZgaAxztTLpMF8MUe49qSwIIE7evRvh3U2
 3dtguNMZCawah/9kZLL89nEsaR0piJKrZLC1m6td+zSz0diVBwm22ixLjImzV1w1vkMJdicxH8A
 8QzSC/SsegXq/dZZYXdBEv1N5wKE8WTUT59/4W+JDaYBu7eoB0oG+EcVhfNOrDF7kJxMfpUOZML
 oC8k3IuDvpdPuQ+zY1T+lcOsN8SlkU3HZjzjNY54VeoMz/DCZ0YUhIKnSeOspXgVPMsq82nvJAt
 hpOZosAoeYj4q0R9S9FTqycfx3ZNYdMnJBRaN6+tGK24U7p+8JD67ke/SPgQg3atm/Xnp8cFP70
 m1lKB8rdLu3OHSXEu8qUpi+xuvtFSCFJCWjC85N5cIWTC69oVWqPrb/hcEMkLuWlDYBGAQCIdly
 BtmDFEMkDbc8jcJbOtUnR5RUHWKC1Wv6ffjFCPbwn0Pr0XrL9JhS1U+11XnpgUs15KIpYW2YCqb
 LFMkID4eBa2HMb/cq25zJYFOaXYy12MnmuZcpO+dzIyIS6k9cvX5V80kiNJ7nHQMurJe9MYpgA9
 YWvMbtcY4i74m0sl7u7obrR6Cr1ib1JGhwgcoTcmsZGiQrz4SYGkm/lot/jrcr+3eJfBakNftN5
 MO9GKRI02vmmyFA==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

From: David Heidelberg <david@ixit.cz>

This is needed by followup commit introducing 1st gen of type-c support.

Assisted-by: LLM
Co-developed-by: Alexey Minnekhanov <alexeymin@minlexx.ru>
Signed-off-by: Alexey Minnekhanov <alexeymin@minlexx.ru>
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.h b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.h
index 3c75820c91876..6f89d296ad151 100644
--- a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.h
+++ b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.h
@@ -6,17 +6,17 @@
 #ifndef __QCOM_PMIC_TYPEC_H__
 #define __QCOM_PMIC_TYPEC_H__
 
 struct pmic_typec {
 	struct device		*dev;
 	struct tcpm_port	*tcpm_port;
 	struct tcpc_dev		tcpc;
 	struct pmic_typec_pdphy	*pmic_typec_pdphy;
-	struct pmic_typec_port	*pmic_typec_port;
+	void			*pmic_typec_port;
 
 	int (*pdphy_start)(struct pmic_typec *tcpm,
 			   struct tcpm_port *tcpm_port);
 	void (*pdphy_stop)(struct pmic_typec *tcpm);
 
 	int (*port_start)(struct pmic_typec *tcpm,
 			  struct tcpm_port *tcpm_port);
 	void (*port_stop)(struct pmic_typec *tcpm);

-- 
2.55.0


