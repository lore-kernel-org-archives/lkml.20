Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=34.202.193.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792424894;
	b=MhyLTO1kppE/IDNGGtK3YK9mn8QlMOz2lYbOlYuD9LNIcUzR6iS/Zu9h2YsIN6eFvHgG
	 uSrnrJJsJd+meW/y+6XNFFpIhN0q9tHVGy7Lz9FpMjAP6erfUjWQSJ3uq0QIZBrxduM3/
	 ffXxulOpxEn4KHSNOeZMEpzscM1hmJR74U1QW6c1PdFbVwFVqKWFzXf2JuU54zDAYwv71
	 bmD9OVMvSLYeBg1gAL9RkNtCl2FCHOjdR2sPp8j9INLWCiLZD+V/D1zW6/U5Ie/GfZjww
	 0PcrNy3XSgx9EDR0FxQdF4EIp8hJ/DgRhHBlw9XPBoJXyrzMUuoahmH5NeQb0kK0QlQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792424894;
	h=DMARC-Filter:DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=jlnB32LCHA0I4qZyo/tYM1nPEXySNpUnvzRunyvEwr8=;
	b=yzYSd4vIuG4adXoNqWKBGWkmFbFk5nFStdmw2YNBQU8b2n1eiSoKOV4VBmbBsaLkDPY9
	 3Db8vhbnQXj4pnZz64yUf4jTZf7ElRGuZv7eW9YkwDE87i9nKOReo6ccg9qUYBK/u0oy/
	 43rohu4Sn9xhz/MWdBICSL0RWy9Dg1maXsHDNCLoWwLs2+mg4y+ULzgrWMcuDL6URg79P
	 JyOZ7PP3y5t/Q/EYlKvOz0yVAnutzuXU7wnEOCTCt/qwFEaZRz9QP8fU5ZHQ6gMEtbRtk
	 7YIGIg43mAdLrd76d6H/wK53GSZxIBG9Ab5tqDGr0eaQxJfOu1D1TKLrfyXG+/SIMsQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=mentallysanemainliners.org;
	spf=pass smtp.mailfrom=mentallysanemainliners.org;
	dkim=pass header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256 header.s=purelymail3 header.b=T7IYp1Fk;
	arc=none smtp.remote-ip=34.202.193.197
Received: from sendmail.purelymail.com (sendmail.purelymail.com [34.202.193.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AAD36080A83
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 15:48:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5AAD36080A83
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256 header.s=purelymail3 header.b=T7IYp1Fk
DKIM-Signature: a=rsa-sha256; b=T7IYp1FkAxva6r1yzogNTO2l9NH4Qm7bBxgAMYLSsEXaVlmZ/hSfysdkmbYfS6A33AEVeqyyh8jVF1VLwzTDvuRVPNKpkPvviyiNTjWiJrJ51tDGvQWPO2aCRFQGtnL6EhfJe43Gm7mlAI2J/hr+OntLhPXKuRJ1hBGqq8DeX8wUN6xduqdBpY1PgPr04Bgmvid5oEL3flmUZ3ucTPwNgUWmIfDicYFmJ3SgPqLWMfZOV3l0Euu2KmLs6RJblylA7CQ/GDCRPm8uauL49nInp46Yi/GUmfCs09iXTDw+AEhRnGbTdKIic7jaZ7wpkDeINwjoas/Ieq4PstEXpO7Nvg==; s=purelymail3; d=purelymail.com; v=1; bh=LlB6iypx0SJ2C2sZVr+0cmFUBBfczV79VPZDjZQrLmQ=; h=Feedback-ID:Received:From:Date:Subject:To;
Feedback-ID: 68247:10037:null:purelymail
X-Pm-Original-To: linux-kernel@vger.kernel.org
Authentication-Results: purelymail.com; auth=pass
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -415248943;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Mon, 19 Oct 2026 15:47:33 +0000 (UTC)
From: Igor Belwon <igor.belwon@mentallysanemainliners.org>
Date: Mon, 19 Oct 2026 17:47:22 +0200
Subject: [PATCH v4 1/2] dt-bindings: arm: qcom: Document Xiaomi 17 Ultra
 devices
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
Message-Id: <20261019-nezha-v4-1-19c1e31eb255@mentallysanemainliners.org>
References: <20261019-nezha-v4-0-19c1e31eb255@mentallysanemainliners.org>
In-Reply-To: <20261019-nezha-v4-0-19c1e31eb255@mentallysanemainliners.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Igor Belwon <igor.belwon@mentallysanemainliners.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792424849; l=1043;
 i=igor.belwon@mentallysanemainliners.org; s=20251104;
 h=from:subject:message-id; bh=LlB6iypx0SJ2C2sZVr+0cmFUBBfczV79VPZDjZQrLmQ=;
 b=wuPQeyMKx2H7/Pe6ardSaBn30Kba4Sw7PXSof7bLFMX5jU6/iVYaJ+Wa9JicWZEL5AjVKYo8y
 g7zvLjmANAsDT3XocysgDat1NtUVTyjbXBSHjYkYhrX5cz9ktVhyGks
X-Developer-Key: i=igor.belwon@mentallysanemainliners.org; a=ed25519;
 pk=i9++1bbnBwoyc3uhTaetGXS1TbBJoS0mcxT59GrpYh0=

Add compatibles for the Xiaomi 17 Ultra devices, consisting of the
EU model with a smaller capacity battery and the CN model.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Igor Belwon <igor.belwon@mentallysanemainliners.org>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 121ca557ce1e..6d9e6a81b419 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -173,6 +173,14 @@ properties:
               - qcom,hawi-mtp
           - const: qcom,hawi
 
+      - description: Xiaomi 17 Ultra
+        items:
+          - enum:
+              - xiaomi,nezha-cn
+              - xiaomi,nezha-eea
+          - const: xiaomi,nezha
+          - const: qcom,kaanapali
+
       - items:
           - enum:
               - qcom,kaanapali-mtp

-- 
2.56.0

