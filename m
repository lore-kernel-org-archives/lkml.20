Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793957377;
	b=kWs8vH5efFDBv4pRFtUIyYjXOLaysJYH0RtvVjgkt8831D0/ARo7haNXBx88ddp8pBMY
	 ZPsh5CwIFqWNLue3ZjfqNj1bcSA56yw3mVxH3dqb4cyzFy8AQSHh9HMpvQRw2ipTf8mie
	 4iO3CEP+8PC/cLKAetx9yY0nkS31KEf66chHxBdVJOVoTik6RiADjLjzgIYMjdFT9s1Q5
	 W/CzVeth9VfiQ33MWaoamnWWhOArJvi9P/5vo9av0Tc5vOxDdOqN8rVyTiPw3TWA1WnOw
	 dhCVqxJmWMD1P4JkVc7W+yeaP/qeKP4DkdZ9J3WjJkpaVPAvt9VXZQyX28cEg7wM5Nw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793957377;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=Z/K15dxirSI+QSh23nqxE7Vi19mIq7MmVTmrvXlPOvQ=;
	b=eCZHd2Ua7bM/J3REzuX5l4ZBgFpYtIiMKxITEIaxWdkPmIwYx3WBDf2PkfAcHcMkwrLu
	 VFgMH17PChFmaS5Rnp5iDhwo4r34R9+ZtQDkdyl45n6jLXdNY8Fi2gcXcRbOW3U+oLu/X
	 DGTLI8k8opykVGHl482R9EiQebhxvfKdX32fYo2ulRSb/6a7J0Yk8pHelEm3AVc23odWy
	 sinH5orsP6ztzpyrGoVEliGeN93ma6dLodZRpPbA8/yc/Gtza1R9v3PixYBUoYyG1vm6J
	 P/S4hxlFHf4AOnql3XanuZWrA8Wmj6yWF+tnc4aK5qfIn0T3xkVOtq/mz3AA8URtAPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ijZNdrYA;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47CAD606A331;
	Fri,  6 Nov 2026 09:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ijZNdrYA
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 351801F008A1;
	Fri,  6 Nov 2026 09:29:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793957377;
	bh=Z/K15dxirSI+QSh23nqxE7Vi19mIq7MmVTmrvXlPOvQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=ijZNdrYAKTARTgh27GXxOE7gVus3vyqE5Qno8d4/jfF9WWLGYaXPl8kMb5ijorabs
	 YjKQG/MDfnUmKCi13IJ04wSOX49VrTvXP8EJBvcr/XoYn/8ypQqbIEYVmn0Idhs9GZ
	 ZrZgrRKHDb+6RbmN0a/mjvSZaqQWCiLXpBC5w1lTdlrpzpIKjAhg+VOYm6GGFuNnvs
	 6Bq4H+r91xP4vIcWtyd0WhpP641LlwIxVCNOvg9BHpkU2ANhqfg1IoMF+YjQUoA3Fe
	 1p97atIDP9tSOLldIcu3hXU8Z9WYR+U5gS7K5rTfwB/JvlGrrR5ChNyarLr73zF4ob
	 uZv5zy3fsaMVA==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Fri, 06 Nov 2026 10:29:06 +0100
Subject: [PATCH v3 5/8] dt-bindings: arm: qcom: Add Glymur SIP CRD
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
Message-Id: <20261106-topic-sip_cob-v3-5-52cd3826ab49@oss.qualcomm.com>
References: <20261106-topic-sip_cob-v3-0-52cd3826ab49@oss.qualcomm.com>
In-Reply-To: <20261106-topic-sip_cob-v3-0-52cd3826ab49@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>, 
 Sibi Sankar <sibi.sankar@oss.qualcomm.com>, 
 Qiang Yu <qiang.yu@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Sivansh Gupta <sivansh.gupta@oss.qualcomm.com>, 
 Pankaj Patil <pankaj.patil@oss.qualcomm.com>, 
 Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>, 
 Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793957347; l=861;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=+sVTvh+aAbocnmo9shqG34Hljg4c2OnrCE/KMhmPXTs=;
 b=WM+9p1L313k0iHOuJhcyeG3jsPDaaA8APEvytg3sxRMI6MMBRICBPkN5BFW9jXoWzjMX9F0+U
 wWOkq2560aRCooxEwEchDZC/um0RTrHUhcS2p95xoEARyAPM+IQYj2P
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Document the compatible for the Glymur CRD variant which uses the
System-in-Package variant of the chip (different package and power
grid). The rest of the board is seemingly identical.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 933a2361b5d7..b5ebee87e668 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -92,6 +92,7 @@ properties:
               - lenovo,yoga-slim7x-gen11
               - qcom,glymur-crd
               - qcom,glymur-qcb
+              - qcom,glymur-sip-crd
           - const: qcom,glymur
 
       - items:

-- 
2.56.0

