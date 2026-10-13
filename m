Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2D15517BC5;
	Tue, 13 Oct 2026 14:41:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791902477; cv=none; b=npDaWr2+l79SMoD4c9FZPsh8NiyU9O3BUzc45wsLhngnd0Sz3vPhWE61gktA86LeNxUnu/c7q+sDOmKdl406Peqf679hQVKRmxdWXLRHQ/YnXuiWr9rKfgQlj+FYU0e4hw8ivO/xC/S0PA6pmlJXYu+7Ekq/JhFCG+dqN5jxL3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791902477; c=relaxed/simple;
	bh=NQJwGJAIXFwunkjKILQ9QiqNkBOf1+O2ps2CAZM0SBQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dnIFdRNGlx1cfLEmTCmRCp9/jN2dpvHE75A8XWjVPeuEEj4LwpwGqye0SWSGy1HS7geaqrzXI8ulv5sImCwDE5yDn3l9nrtUa3dTAwvZGlX84uMlyiKRiPJsJixY99QOnq/xOS8jOVMKP6lJ1VAIgbl5HBEpkH29Xc9KVsgk18U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mh7PaA7k; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mh7PaA7k"
Received: by smtp.kernel.org (Postfix) with ESMTPS id A3FE7C4AF0B;
	Tue, 13 Oct 2026 14:41:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1791902476;
	bh=NQJwGJAIXFwunkjKILQ9QiqNkBOf1+O2ps2CAZM0SBQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=mh7PaA7koiJFqsHCKf00XPfZHMd/QxlzzFTPW06GtIgtGlIpp702YF7naBF3ROJLs
	 +CZ5aY/j0zF0bgUG+N+Ls9VUDfB1rpKe6uf5CiCzb6de0GTXZ8O8WIjtV0sf9J4hOv
	 Rr2wC6QvO2Nsc7gZcmPTpjp+cM2ZOA9u4DouBV+4GI6WaNs4/hsJVrmF5+w1Bsyo+x
	 xWD5Jf9vdsASWM7F8bX7zHLypcAsfD1efDOzSXGPNblA5bEK4FNussEvOQDQAgXklo
	 n4NsM1nJ6LdHf3KJK9VFCQ/rgryxGYckf/AkIZUV48Kh1aMZzulWA4G/MZDHzgFHVH
	 80o5AEoYaQ6dA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81BE3CC6B0E;
	Tue, 13 Oct 2026 14:41:16 +0000 (UTC)
From: Juerg Haefliger via B4 Relay <devnull+juerg.haefliger.canonical.com@kernel.org>
Date: Tue, 13 Oct 2026 16:40:56 +0200
Subject: [PATCH 1/3] dt-bindings: arm: qcom: Document HP EliteBook 6 G1q
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-add-elitebook-6-dts-v1-1-f22e67fc7f9d@canonical.com>
References: <20261013-add-elitebook-6-dts-v1-0-f22e67fc7f9d@canonical.com>
In-Reply-To: <20261013-add-elitebook-6-dts-v1-0-f22e67fc7f9d@canonical.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Juerg Haefliger <juerg.haefliger@canonical.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=906;
 i=juerg.haefliger@canonical.com; s=F9F8B48C; h=from:subject:message-id;
 bh=DoiEVJtPjXSpbE/tu9R+shKoxBbwNwzwDSKezr3bIi0=;
 b=owEBbQKS/ZANAwAKAQ/TiwkLpkK3AcsmYgBqzkMKlMLDVRn5psGzGZjctopgbBMo6MXXyPxZe
 hAWFalBQeWJAjMEAAEKAB0WIQSFl9T3oi6mu+It14sP04sJC6ZCtwUCas5DCgAKCRAP04sJC6ZC
 t6coEACIMdjKROjHf3W4UyMSYrMVLtsh0gRq//NksYoV81dZaQs7OKv6ePUzvBkmcaR0WjGCK5V
 RscZ8Mj1fn0H4bzyEPpSDb22I1BihlheSIOrarWLqY/6QLFl2cK8Yjt41y3s3mMPee85yus6dUt
 p/Hma+WF1uLEwCWi5WyrMfHGXKCyOvmbgkSFYh16hX36L5iXsmdhPGbZJxKihXMlMuRnCbuxPPm
 SMZSIQdDd1+wSraWx9qzIsgSjGnseLExsm5SJ6v3j19AGl7ZZP/Bc/WrBgpZnhg9KJ+vKmP5y+O
 NSAWwt6UFXXIBbOmxKS0yYLp8Q4lXMKUXoHwpCvSJQGa5dPF/cBT6OSHhE0idNjhKmVIffXdMxH
 ZsTjG39orXAVGrl382QAaS4RviIaUFmJPSEE54VhW2Ai9ZVg01KyvTDCqkhrTkkQbDE/cZZ4uI2
 hswlySlLBS1rXtv8VEt/bsHRhWdetGeblBQ7f3esK4KCJaic9UxkXx65pgzaP8/7aFiA/e2CsyF
 UP6+UMNoK5f+122L1hyQWXM9W+6aAHh2wPmt4zqia/GYx1VltqY7CsszuSyVcOAlzURL4ONcmj/
 NfwU84QuevM9xiUhU9KCtfWdWzt2LiNfOsEmoKUBTMYkk86Y008yflGykSwPJB4Vi8QGMkRoEaP
 0dhnvJByuLdZP6g==
X-Developer-Key: i=juerg.haefliger@canonical.com; a=openpgp;
 fpr=52B5BDD2A6EDC76A0FE0AB4A754C3A96F9F8B48C
X-Endpoint-Received: by B4 Relay for juerg.haefliger@canonical.com/F9F8B48C
 with auth_id=1135
X-Original-From: Juerg Haefliger <juerg.haefliger@canonical.com>
Reply-To: juerg.haefliger@canonical.com

From: Juerg Haefliger <juerg.haefliger@canonical.com>

Add a compatible for the HP EliteBook 6 G1q 14 inch Notebook Next Gen AI
PC, based on the Qualcomm Snapdragon X1P42100 SoC.

PDF link: https://www8.hp.com/h20195/v2/GetDocument.aspx?docname=c09121784

Signed-off-by: Juerg Haefliger <juerg.haefliger@canonical.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 121ca557ce1e..1b59f4379859 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1307,6 +1307,7 @@ properties:
       - items:
           - enum:
               - asus,vivobook-s15-x1p4
+              - hp,elitebook-6-g1q
               - hp,omnibook-x14-fe1
               - lenovo,thinkbook-16
               - qcom,x1p42100-crd

-- 
2.53.0


