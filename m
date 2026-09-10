Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D9A343CE7F;
	Thu, 10 Sep 2026 08:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789028149; cv=none; b=OUZ8rv1wCJnYQ9pLOnj+t8oKnsELbpcUf6mkuc+6WRYKOqc8iNacXyrRonOoAF3xnlvX0AKFoKwmNNjMKxnpQrQhnapqVDTJURJj2yWJuO4kuVkpYitvGmxWUMX8Ko7KixBlvb5/sqkz/ady7h+Zes0SdR1wUH05t0EYenkVZrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789028149; c=relaxed/simple;
	bh=3gq0RFMdJclzfJxFzLp1eQN0N7a+xavx9I/D0sjlg+w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Deerqz2x6r0VLOTcfoMElgDVnhhzxSGsnw4SGQbjjR/OJMM+ZLnk68Tq/ReusVCf01DV4uV6rev2Lw84wgHTSp8xcxg/S4+kKspYiBN+xN3uClad5dvFSgVc1lEbPhS/9hXT4kcXpdU2GB0TRX+wVA3KbjsnFB1qv2/IXUBMtBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HX6Jk197; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HX6Jk197"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1399E1F00893;
	Thu, 10 Sep 2026 08:15:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789028147;
	bh=cQvvaoG1lMvUXXuqPW4x4BfHpu4GyKiKwKXuUucQD6I=;
	h=From:Date:Subject:To:Cc;
	b=HX6Jk197W9hdCAlM8Ce9CWgkOOeuKRtbWFAjKOcOONVr9Ol5rmw8wKgfVdVM1lNQa
	 O7CYUjK198zCsi+jz9QDwpBrjVFoT0/fNgBHRlxIbkYHxbOMo1nEp0US8y823C0pmh
	 wLpWf/EpgUcTyapG1dgBLZFwwopy2FqYzZBkQ8I16uL+A1n8zFnT5NAKpkR3XkJWM6
	 qcjnU/DN4Gfiu8E+pGJmUXultIjpVXqaZMOX/VTN1bqV5bRpfjIXFpYz2vlgMExf+j
	 lzuaY5pzAJ4uyS3aoryxTzHyzRgzO7GELkwkDpRmyow3KzinpMyXo9trJsRYYrKch9
	 xWlJbxtrv2sQQ==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Thu, 10 Sep 2026 10:15:42 +0200
Subject: [PATCH] arm64: dts: qcom: glymur-asus-zenbook-a16: Fix up the mic
 sample rate
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-topic-zenbook_mic_sampling-v1-1-2532136d5a9b@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQ6CMBAAwK+QPdukYFT0K4aQdllgUdqmi4RI+
 LsFj3OZFYQik8AjWyHSzMLeJeSnDLA3riPFTTIUurjqe67V5AOj+pKz3r/qkbEWM4Y3u06haUo
 6l/bS3ghSECK1vBz5s/pbPnYgnPYRtu0HQPM1o34AAAA=
X-Change-ID: 20260910-topic-zenbook_mic_sampling-cad8e38b5f7e
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789028143; l=1135;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=+cEY6rhxTB/F0M6Gc6IN+lIDNC82LAF+/DdHfogTqnM=;
 b=RRHdGU8kI5rZKm6daF5ZQEbL0MW3Mzr2y7RJ5julphPfrkMknCyOXMxQ/lSPT+DJgbeq2B78u
 ElMJoPe5Wi3AqUrvPNPMJSlVnVNqa+w2IWBQa+42TYtm1PQJE15KWwK
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Set the correct value for the hardware, matching the readout from
Windows during audio recording.

The microphone seems to work fine either way.

Fixes: e8fbbca94db7 ("arm64: dts: qcom: glymur: Add Asus Zenbook A16 (UX3607OA)")
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a16-ux3607oa.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a16-ux3607oa.dts b/arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a16-ux3607oa.dts
index 939e1a927a79..40433dc2d6cf 100644
--- a/arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a16-ux3607oa.dts
+++ b/arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a16-ux3607oa.dts
@@ -737,7 +737,7 @@ &lpass_vamacro {
 	pinctrl-0 = <&dmic01_default>;
 	pinctrl-names = "default";
 
-	qcom,dmic-sample-rate = <4800000>;
+	qcom,dmic-sample-rate = <2400000>;
 };
 
 &mdss {

---
base-commit: c68a982815dcce5464e3bf2a31ac94f5146c04ca
change-id: 20260910-topic-zenbook_mic_sampling-cad8e38b5f7e

Best regards,
--  
Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

