Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7682400E1A;
	Sat, 26 Sep 2026 12:40:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790426433; cv=none; b=pqSVDfYIpnygU1r0pnTLOSy5B2crUhU0XYN4iI63QBd8FaQS5IGETduHGBczfxwYv/UquS7n+5u47I/DzwR0ayJKGp//sIVVBtJp1TTWAfxmMMe0je2ovF0EDzi1gXm59eZg2FbR7i1/PtVGWjpl0obp/8W90d/izv183XxkpSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790426433; c=relaxed/simple;
	bh=Wm00DSBMr6EfgVkcczqvzn2AVo/mF8S/ysSMiR8UkJE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bU64CUqBmyi6c4E9MnbNu6G6bKi4Q+7DCK5ooB+O0n5owO2oWaRJMdfcb/Hm4WR3hH5VOQqV7ANJhrIaLT8eaK6fU2G3FtxpQtgxOsFzDawP/KDXt2K4r2YR7jt0FgQs5tm5UPEPA6m4ewXKfMD9xO5BRZl/rqBuUOVkgCo5VBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jwKg2N5J; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jwKg2N5J"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 731C7C2BCC7;
	Sat, 26 Sep 2026 12:40:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790426433;
	bh=Wm00DSBMr6EfgVkcczqvzn2AVo/mF8S/ysSMiR8UkJE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=jwKg2N5JKPiRYhX0ATAttN/0CXdvm/F8GIeU1cmDrXH9/OZTGW4/XTvfb4fp0uBhv
	 xMz+cf67/fGE4ZStEeppP1Itj8YrGKLAt4JyZNarpsP8tGQXK/pq1sppwVoDJ5dos0
	 TbkY8XWg/aPR9ehZwdcmZ8kSbMSTCVrm2NUe08gIqWAqM6KRXZXAoL+WEAhGSl/RDB
	 f1T1/ZuWn4/MXaxJbneDvOlHaBTql1KsPz2mttL5aODQJbSHmKddPQ6XmsGzGI952e
	 fjXcWDsWZEjYkujj2ArWE10EzNBdtF0Bfjmapav8yInxD4XV48WoS0bwTcWK1b7ehX
	 hlP/tiNoyTf/Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53388C9833A;
	Sat, 26 Sep 2026 12:40:33 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Sat, 26 Sep 2026 14:40:21 +0200
Subject: [PATCH RFC 02/12] dt-bindings: usb: qcom,pmic-typec: Update
 example with vbus-supply
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260926-typec-v1-2-31adc19f32c6@ixit.cz>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1765; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=7QxiOjoeKoKXk9E1eYNDmLj4wCbThDkI+aQOFIPL5J4=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBqt70+CmH8mks/No9E70DNtIUe2Oyb2BRrsAJrO
 zIOZWkLvYuJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCare9PgAKCRBgAj/E00kg
 cj9oD/45Iu4qrkMFD6bJMFFFI+9sFnJQItwzRXrXXjDhtFmPmkTbBGk2laRKDf8SoADb+9svKar
 tkwt14EQTr/yQ8WW8J+yj7BRma48NuFHbq9B3qnRMHgP+ajfzkmkOTRhsH6G/k1w3epSzf/w280
 OgATA0T5SKEeaYDBsSWppMR5nFHdtjfcLBEaXRTOCTiUFsQvIevKrc+5GE7565G3OgbKqVVo25F
 VN/PdYZCpYyC4PzYIKRvuEyl2kNJBIs88pAsGlfVJ/UgFa/YFhdheGSBvDZ/AReYW5ey9Cke0Yy
 UZtQr1sM/OYF8O1WyOzH78xvUGPQrwqkuTT2/sviRXR2uaIMnRUn6hHY5XZYSFdUzEhUhNKc1kS
 XX4703ejTpsvJjc283T/nfQxb+/iTlFrPqts4vLjsHyfIccc4F1UPsGUMFEc9ruBAwxzUbqJbDx
 xZw803J/P7SHHE8JeMgGA8LTdPVmRNmc3uMeQ2Jv7mSbdem2krrO2ggxQYtS4DWIEqJ2+mHWQEl
 +L/C3JMilG96SXWNB6WRWyA5J6rm3XPmf7X1PLlYBx1fN6LytJusruQ3DczH3VotFQANZnPmDk0
 Ev9Ih0rc8Mix+txBeZTEyxS+oYcfDh2JVWhjpRnUa0nN7dCPDi8gfrbphIAktfAyl/Uhc06Ln4e
 YfmTlKkhb70RslQ==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

From: David Heidelberg <david@ixit.cz>

The vdd-vbus-supply is deprecated, thus don't suggest deprecated usage in
example.

Assisted-by: LLM
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml b/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml
index ba790c4488b76..2c8b11e92fb28 100644
--- a/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml
+++ b/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml
@@ -163,29 +163,30 @@ examples:
                               "sig-rx",
                               "msg-tx",
                               "msg-rx",
                               "msg-tx-failed",
                               "msg-tx-discarded",
                               "msg-rx-discarded",
                               "fr-swap";
 
-            vdd-vbus-supply = <&pm8150b_vbus>;
             vdd-pdphy-supply = <&vreg_l2a_3p1>;
 
             connector {
                 compatible = "usb-c-connector";
 
                 power-role = "source";
                 data-role = "dual";
                 self-powered;
 
                 source-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_DUAL_ROLE |
                                PDO_FIXED_USB_COMM | PDO_FIXED_DATA_SWAP)>;
 
+                vbus-supply = <&pm8150b_vbus>;
+
                 ports {
                     #address-cells = <1>;
                     #size-cells = <0>;
 
                     port@0 {
                         reg = <0>;
                         pmic_typec_hs_in: endpoint {
                             remote-endpoint = <&usb_hs_out>;

-- 
2.55.0


