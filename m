Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FAD62EC083;
	Sun,  6 Sep 2026 00:41:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788655281; cv=none; b=MqMf+XrUJuQFTNWAXyzdBqfR/CugEhVXCM+ULU5N9SXZe2RzuS2zhBQ8Vw7P5HefjzsO04Vz1TWavCo1m2a3t4uHR0TGPalzjfDQi5au6lK8Acap9xlaL9NtrrWSWGMq4dk3mPRaqmisvJmx4iySLyKttVx0n6+Kt4YSvWa4/gU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788655281; c=relaxed/simple;
	bh=BOls6dywp5f4iVmehXMYIfhWHAm2J5WPWDd6nD+bw8w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aVtswTs6/zTCHBIx3WV02ovdx8dotMsOdPnwwcjVlZSQkNn1+KUDRuVI00ljzWYJjOyUkKRmRU3PJQSkF3cHyoVc14rawvYOhihTilebObhOfJdlVBiAqyWisRjEqbVFj6AtG/Ejm6uVUFMm4WC0SlveyTVAKtQCXkSu9yS1xnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VfRQsONF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VfRQsONF"
Received: by smtp.kernel.org (Postfix) with ESMTPS id F2A71C2BD00;
	Sun,  6 Sep 2026 00:41:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788655281;
	bh=BOls6dywp5f4iVmehXMYIfhWHAm2J5WPWDd6nD+bw8w=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=VfRQsONFcGGrN8LBgAEjH4KsV9l9YmW06rb/6NSdJM80xy2f2J0ZPBaPU/8BjpTE/
	 ABQMBh3zD6U0q87BlSiyg5T5Rd4cyXnsDtxT7cLTwzhtUcj4ChgffwrR5rme5eJBbh
	 V15kdtDxiLF9XyAiLas6Ugdqgv4IuECPkg8zBqKgpjU3kL/179BBM1LrrIonaOW7Rw
	 3/GxrXe6YK1SNVg1aJ8keQP7xoGBo66fZWsP/hzQQsm1ROJMbHQLy4TsjzfQcwC7WZ
	 KhOEv9LIexCZj84UruR9CX2Y4xzuDn5IVeGxPPp0Qn/MxuuKWceaPeBrxPcLPu8oxK
	 gQGOcNfatbhzg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA9E4C79F9E;
	Sun,  6 Sep 2026 00:41:20 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Sun, 06 Sep 2026 02:41:15 +0200
Subject: [PATCH RFC 4/4] arm64: dts: qcom: sdm670-google: Add modemsmem
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260906-modemsmem-v1-4-a3634b553841@ixit.cz>
References: <20260906-modemsmem-v1-0-a3634b553841@ixit.cz>
In-Reply-To: <20260906-modemsmem-v1-0-a3634b553841@ixit.cz>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Richard Acayan <mailingradian@gmail.com>, Petr Vorel <petr.vorel@gmail.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org, 
 David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1040; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=TWhq237rZhu1dOgSbAfHXHmc82yvCd23tTIcG8XeM4Y=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBqnLavPpWNaZfkKWF76bCFYzF1GnMpyQalCsKCF
 PD96WyDkxuJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCapy2rwAKCRBgAj/E00kg
 cneXEADEztAkrJN/obtgTy+goU4i3hQ35Ps3C2kYGdyQscbWK6dJp0WxpnUI05+wQk61Pf53DYh
 8JjDb6qqVM1UtpK/2nIiw0LTItZu12fuBCq9y+PJFGiFdb/qMXe6FZlsXVcaxjkEnktggI0IwkB
 H2aCmPeU8qf28YCGOvTQF8djBgAeCg3rdq4MPLTVcOC/sWBDabJZoK6obixqYph34tNDvS9Hxyt
 wp1H5WkAtUubyiV4BfqQHYn8T/qj49taWd5+4VlRF9iwBF4j/hskzEV9aDNwTBezeIM7ZoQ/qoX
 9lVF99tsTSaTfBMLW2DfrwMX/9W/3/V6mABKIrh/0RXU0MC9u34wvZuq1OWUIW31NBmhSCMrbzJ
 vHbVqsntooUkb/bvRziHnaxPTDXHl33brhbHv2nFNWOejI6+se5PGpwW/gvWpSHai0fXTRQKCZm
 CwYHGO4i767HgYW96sJpMVekSJyssIXGjEyvLcETLrZOyH37ZGqskbQkstma9XkxaZjNNyb0cNU
 huRNCf84fqcM4CFnye4g9MaGagWLfrP4Soo+0qh3qU2jyYo6Z03XbcHOEBzo/4HwNlKNUVMHMmO
 a5XV25IRY8p4acKTACABfVxLiV20gmted+a3GL8svlihI8iZAPE6taP4XwGjFyCqnVx14COIlTC
 NeBbN5oUj4K8Zfw==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

From: Richard Acayan <mailingradian@gmail.com>

The Pixel 3a modem needs the modemsmem client. Add it in the device
tree so the modem can properly boot.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi b/arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi
index b4854801a5f5e..4604c4eb2192a 100644
--- a/arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi
@@ -61,16 +61,21 @@ gpio-keys {
 
 		key-vol-up {
 			label = "Volume Up";
 			linux,code = <KEY_VOLUMEUP>;
 			gpios = <&pm660l_gpios 7 GPIO_ACTIVE_LOW>;
 		};
 	};
 
+	modemsmem {
+		compatible = "google,modemsmem";
+		qcom,smem-id = <134>;
+	};
+
 	reserved-memory {
 		#address-cells = <2>;
 		#size-cells = <2>;
 
 		mpss_region: mpss@8b000000 {
 			reg = <0 0x8b000000 0 0x9800000>;
 			no-map;
 		};

-- 
2.55.0


