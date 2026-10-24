Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=109.224.244.106
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792840267;
	b=mPh5k6q6PCOECLX05LWW08aVqqx3nW6xyczG20hKU9qCi+JsuJosd6A8yxFkNqUPgyyE
	 thXiT7WEyHn7lXfxgtHI55b7MH1Rxjsqmy5D1X1xab6kXZh76ufJF3XHlIxOpwrzXU9EH
	 n/1J1ZxPzNBLewLZ0BFh24T8oaKkAg7kiKFNvuGBGwzahg/VVN7ZNCMuPflr2tO/WppEY
	 HfVHUw3yfidgyUfXKM5BVE7Yr661hmWdzR5Um7RyK2n5t3Tat1yM5QaT9MHlMYIYrH3tr
	 +vDF52T+3B2FHaBpa6in9b9gbm7/xNKtCaFGAZMgHG4AXXBCK5XSPRVBE7KAd4loBGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792840267;
	h=DMARC-Filter:DKIM-Signature:X-Pm-Submission-Id:From:To:Cc:Date:
	 Subject:Message-ID:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=liW1fhZE4Evx5nrjP3rA8L+dUEbt7gLFFRSoZMl5fGY=;
	b=sXRFjwo4BTlbj0J/p8oWqjU2rJH0CLybiCRe+K4SVxtj2tNnAa5JdhfzB9zpsMhQDoJT
	 w0vMoJWTKFd79ZkSXMp+nwdPorBc5GiPHKvTDo+PbK++ju6S0glVfHiBUsLAGFHUElEGa
	 f1GFk9nbtA/Clbl3XFLbPn19ynB9PVqi/CFJkTXArUT8STN7lJ4OxoB683BP4O4CHhhWb
	 6Z/bb5mCuXMJQOB4cOfK1TgYACOjmi0Gi+TNNS1XsqAd8lQqN39DbjsO+jVNQTIvf4wV5
	 mWJYIiG1WyCzJ95jTgKvvR8uMb+9QKT2pOlNuT4bYwbePxA3Jh/eT3zmcQd3liHZgRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=michaelmcallister.org;
	spf=pass smtp.mailfrom=michaelmcallister.org;
	dkim=pass header.d=michaelmcallister.org header.i=@michaelmcallister.org header.a=rsa-sha256 header.s=protonmail2 header.b=KqtsF4p0;
	arc=none smtp.remote-ip=109.224.244.106
Received: from mail-244106.protonmail.ch (mail-244106.protonmail.ch [109.224.244.106])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3ABE606A324
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 11:11:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D3ABE606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=michaelmcallister.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=michaelmcallister.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=michaelmcallister.org header.i=@michaelmcallister.org header.a=rsa-sha256 header.s=protonmail2 header.b=KqtsF4p0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=michaelmcallister.org; s=protonmail2; t=1792840265; x=1793099465;
	bh=liW1fhZE4Evx5nrjP3rA8L+dUEbt7gLFFRSoZMl5fGY=;
	h=From:To:Cc:Date:Subject:Message-ID:In-Reply-To:References:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=KqtsF4p0RdSLufrMrraPuwF+pOebvoZyyBN+5+Iq+tRIt+vMA7uyYbWrQpD4URoHe
	 s92a9gxTDLoGXJDSpdwR5aNkOxcx+Zr14df7Izcmb1dpIsBmoKhPRocJoOGm2gM4ij
	 A3fWh2xNi/RnnHde67K2ob6qEg1o4MzcFIMrVeOwAzvnfZVgGrGBuUiQk8valpdDMr
	 fYEobm5wAxbOT/gPNT9k56BY5kLurjPEvhsu+91TWWbRWs2aa3Auer/7DUVJkOSauz
	 acyCYaVR9dkYCIg++Q/+i1BFe9sn1FjfpJdoZeZnsxvoL2cYMdNvVFMxVTRJzk7FQv
	 z1/SQXuyu4ZHQ==
X-Pm-Submission-Id: 4jBcdM0bhNz1DFSm
From: Michael McAllister <me@michaelmcallister.org>
To: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Sat, 24 Oct 2026 12:10:08 +0100
Subject: [PATCH v2 2/3] dt-bindings: arm: qcom: Add Motorola Moto G10
Message-ID: <3fd5ee049e08ab8b98e2f9543a0c7edc237caaf8.1792840208.git.me@michaelmcallister.org>
In-Reply-To: <cover.1792840208.git.me@michaelmcallister.org>
References: <cover.1792840208.git.me@michaelmcallister.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Document the Motorola Moto G10 (capri), a smartphone based on the
Qualcomm Snapdragon 460 (SM4250).

Signed-off-by: Michael McAllister <me@michaelmcallister.org>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 121ca557c..963fd482b 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1051,6 +1051,7 @@ properties:
 
       - items:
           - enum:
+              - motorola,capri
               - oneplus,billie2
           - const: qcom,sm4250
 
