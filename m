Received: from sendmail.purelymail.com (sendmail.purelymail.com [34.202.193.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 069353B6C00
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 20:04:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=34.202.193.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792181067; cv=none; b=ZIuao/lDdPUD+tj/huTGLobDNMMt9gKDYZUFg4RLVOM4Ks8u6Ym2j3fxme1c9wr+gaVv7cs1XkCjMkrzGgXP79iQAvNuOmOq9r+sZGUYXyPHrcwOg+IQMHbGky/Zvurdt4TCKejwZ3fg8mioIXMv77Di+BO7nlO+fgv+8ofBQN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792181067; c=relaxed/simple;
	bh=TF8/x1++trK88sRkq2eww+jshZ+Pery96bRXF5tv/s8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UG48l/eNhMR9jZUojhyGR5CvQXtfq6sRRN7fp73Kkk5WpmcqH2twkI8NUchvrw0kwlA91CAxpRTtuepfVNt6RjGAMIcYHbGiynFX64BxtiApTPraa1ZSJwX3mq2URHjiiCXwEKQrWUlcV3eVUryhH+Eai5LWRSOH7mqmNGYtB/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org; spf=pass smtp.mailfrom=mentallysanemainliners.org; dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b=XhFNw6EY; arc=none smtp.client-ip=34.202.193.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b="XhFNw6EY"
DKIM-Signature: a=rsa-sha256; b=XhFNw6EYy5JMpzPHcpEIAysBSDRLMOlJlSjewQ9UWNEXUkS6Z+4Y/mNhFq3Wb0YM9e+3wlhA+6J+MD/u7Upkw/7hICcRG9NKGdYqt9rFl1OiMGUIOHcR6ixPHgcroW+kj9j2SwvEUBtoI/7OKEKkCBdDZm2pdwbanhEZfAfuXm8qQ0WS2aMoK8pwXgFl9XhcyZI9YkbvXoP9P447ZRIEy9nwZp5RxynE7cXsqKBJAuMfql1/PvuMqvbFvyeNV0YQLvjno/7p48zLMxMvwbngcKl0Oj1NqFwSzWfCITTeAvWqEQBc4Un7FkoWZ9GJmTt05JrKZWm5jeBF+q7IUDl5zg==; s=purelymail3; d=purelymail.com; v=1; bh=TF8/x1++trK88sRkq2eww+jshZ+Pery96bRXF5tv/s8=; h=Feedback-ID:Received:From:Date:Subject:To;
Feedback-ID: 68247:10037:null:purelymail
X-Pm-Original-To: linux-kernel@vger.kernel.org
Authentication-Results: purelymail.com; auth=pass
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1585118032;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Fri, 16 Oct 2026 20:04:00 +0000 (UTC)
From: Igor Belwon <igor.belwon@mentallysanemainliners.org>
Date: Fri, 16 Oct 2026 22:03:52 +0200
Subject: [PATCH 1/2] dt-bindings: arm: qcom: Document Xiaomi 17 Ultra
 devices
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-nezha-v1-1-a39900dfaadd@mentallysanemainliners.org>
References: <20261016-nezha-v1-0-a39900dfaadd@mentallysanemainliners.org>
In-Reply-To: <20261016-nezha-v1-0-a39900dfaadd@mentallysanemainliners.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Igor Belwon <igor.belwon@mentallysanemainliners.org>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792181037; l=1099;
 i=igor.belwon@mentallysanemainliners.org; s=20251104;
 h=from:subject:message-id; bh=TF8/x1++trK88sRkq2eww+jshZ+Pery96bRXF5tv/s8=;
 b=mx8c0hqgGdOeNBR8+KFw5/LfesycWIF+gSLu87Ts6B+YI4LIDPfmeWxFVdTPvl82jrY73jMmS
 ikefUOs8WfcCD4LFlQgJW81OaKFigqqMCaNBEd5dXKIeHao0M4al6t3
X-Developer-Key: i=igor.belwon@mentallysanemainliners.org; a=ed25519;
 pk=i9++1bbnBwoyc3uhTaetGXS1TbBJoS0mcxT59GrpYh0=

Add compatibles for the Xiaomi 17 Ultra devices, consisting of the
EU model with a smaller capacity battery and the CN model.

Signed-off-by: Igor Belwon <igor.belwon@mentallysanemainliners.org>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 121ca557ce1e..b0eb7c912b91 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -173,10 +173,19 @@ properties:
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
               - qcom,kaanapali-qrd
+              - xiaomi,nezha
           - const: qcom,kaanapali
 
       - items:

-- 
2.56.0

