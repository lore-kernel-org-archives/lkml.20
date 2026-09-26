Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5057D3A2E00;
	Sat, 26 Sep 2026 08:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790412094; cv=none; b=HZFmAOWfvPSKo2nM6MKTJar6pLw0Rkjv3YSFJWezW2FEYcwrPwR8ucr/tLlxMxNwH1tz+Gftfm/iFrv5BCMKef/EwEzV+iToGSOc3vpp0i56RazB2y+bo9Ro5kvBb+EIgyaIsgQqD0KJhal2movhYXnHNhDh/trxA32/LZLIGW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790412094; c=relaxed/simple;
	bh=+U9/w5AoIy43URp6QkdXdBTkBCIkzB7HlS6qAzlR47M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DRZ/qFStXZE8afGaE7EEjIfgP9NQU8FmJPpQRxw5QThBv+HccGbP2ZwYlMHRMl/4fAqedNy8kgUXazTp7g9S4OQlmUzqQ5pVSYxVMzRzT5mRzsqd0ikPSfvCKwa7IK7NX9ymkNBMiPWrZjpcNz/jt69670Z8KRewnS6OyAQZW54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KxfUrhr9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KxfUrhr9"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 19BD1C2BCF4;
	Sat, 26 Sep 2026 08:41:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790412094;
	bh=+U9/w5AoIy43URp6QkdXdBTkBCIkzB7HlS6qAzlR47M=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=KxfUrhr9aNYVnJ9Q6SCMgc7Ag6neQqQr/k4qWK3KwwTmvXHODv0gPwVjt0G1iBPMv
	 cqhrLxLaOxpAtKZGVsJwDAxqmvsNWOi69Uy7OaIMOoMnxgLAQTysE7doQdkiuhM+iS
	 qTnktZKBd0KWZNChsq0+Ucz2dwdqnF1d15Q/g+dAc78pGqNnsYBuHQ7DMzjv1Ae1Wz
	 /ZbgajXhG3k6VZ1he7gzn0zzuS5wDTADU29lyqHtLIyE1ENxcSVsX+us561YNzD3bI
	 tD8TfU5jLj8WYOzQ+i3aN+sHNuKObaIIJWgBnuvDnXegCBnopwuIx7xHLQJze+A0rz
	 j4Zw7v5Vg7Xxw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02D3CC98338;
	Sat, 26 Sep 2026 08:41:34 +0000 (UTC)
From: Sam Day via B4 Relay <devnull+me.samcday.com@kernel.org>
Date: Sat, 26 Sep 2026 18:41:34 +1000
Subject: [PATCH v5 3/3] arm64: dts: qcom: sdm670-google-common: enable
 debug uart
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260926-pabloyoyoista-debug-uart-on-rdacayan-next-v5-3-db74ff64a7e7@samcday.com>
References: <20260926-pabloyoyoista-debug-uart-on-rdacayan-next-v5-0-db74ff64a7e7@samcday.com>
In-Reply-To: <20260926-pabloyoyoista-debug-uart-on-rdacayan-next-v5-0-db74ff64a7e7@samcday.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Richard Acayan <mailingradian@gmail.com>, 
 =?utf-8?q?Pablo_Correa_G=C3=B3mez?= <pabloyoyoista@postmarketos.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Sam Day <me@samcday.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790412092; l=1026;
 i=me@samcday.com; s=20240502; h=from:subject:message-id;
 bh=4t9TyOvqm1xc8L6ZKobS6WwoS/3BC2akDdnkT3vrAH4=;
 b=a1Q+xMLta01WnB0B9K5UPih450rSeVSbYPH7iumYaFjpaxqi9ysbCqh0Ni3g867P7KW0LxBIg
 tlnfY6nB0ZmA14QlfotxzQyUM9yaf1BQAmMAeLJO8vUQtXwO0Q+jlZJ
X-Developer-Key: i=me@samcday.com; a=ed25519;
 pk=bzyS0akxWMqr9+AXzgBRIp28KKpEOs+GjYMc2yf+aeU=
X-Endpoint-Received: by B4 Relay for me@samcday.com/20240502 with
 auth_id=595
X-Original-From: Sam Day <me@samcday.com>
Reply-To: me@samcday.com

From: Pablo Correa Gómez <pabloyoyoista@postmarketos.org>

This has been tested on the Pixel 3a with USB Cereal board

Signed-off-by: Pablo Correa Gómez <pabloyoyoista@postmarketos.org>
[sam: drop the board-level tx/rx pinconf and stale Depends link]
Assisted-by: LLM
Signed-off-by: Sam Day <me@samcday.com>
---
 arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi b/arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi
index b4854801a5f5e..79d66fd2d6e41 100644
--- a/arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi
@@ -26,7 +26,9 @@
 /delete-node/ &gpu_mem;
 
 / {
-	aliases { };
+	aliases {
+		serial0 = &uart12;
+	};
 
 	battery: battery {
 		compatible = "simple-battery";
@@ -693,6 +695,10 @@ ts-switch-pins {
 	};
 };
 
+&uart12 {
+	status = "okay";
+};
+
 &usb_1_hsphy {
 	vdd-supply = <&vreg_l1b_0p925>;
 	vdda-pll-supply = <&vreg_l10a_1p8>;

-- 
2.55.0


