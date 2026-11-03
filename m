Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793734045;
	b=xbcctswGYMB2Icrrw3aDUpHI1gW+MgK+2l36PUcigHkDrI41PwcIhKlkxIeIJ2tFfboq
	 SsKq9cavX8MDSSUKE1e9e1NKxYCzyLs3iYlHveTIge2HXcaixDMLGrE23QKtZAy2WaYBZ
	 GhKfYqcYWCiOxV0Hznx2YVmWFL/sPSHBKYtjw8FQUNwfZ9TNfbxP/EwuYlU0F1xhK0FiH
	 sWFjbARJq0biJmu0xd//TXL01MSRrYYi7hOd2Q8r4xyOnF4nRR0boU5ANfzg31OI65yid
	 6q7CnNa7A1jbup9tqKNrdqccphW5MV7N7sZd1xctukSL0jZRL6WTpcYqQIV0mVZw/vw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793734045;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=uM7v3icM1TulOwWui44XsfGK5eoCNO1EvhFijxzbsbw=;
	b=WUSV1/ACk3uiKSzhV7bLbrecMU1pYs+YsxXBapdvYrSa382IPs4Hfs4y+8LklobdtiuX
	 YOByWnpXaZz2mKC1ToSd3pJLi8GI1o9+ZaNz9DUcDrB1++sn2P7vJzUnlJmsCw1clUgZo
	 kIJPSNu1FWuWTxYDxew1v+Tr1hqHr15f9DuyKcwnUWmLlP89+F3Es1GAAxETLPnCr8CXW
	 HQuanL1FMQKphk1f56xGuN2O8tEJ7QUIpIw2H1aXCVCByhNpbRSm65HA5Q4X7ZHdLVqRO
	 7QBYUV5QmKLfQVws6D/j01+oaO0Bk3BdbRfKDbqCcfGNNrvnLGKDPXjHEOzT5OlyPyA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PTKgLAGg;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26909606A31B;
	Tue,  3 Nov 2026 19:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PTKgLAGg
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793734044;
	b=ATKjaw2dTM7uZsCULpakz9y25MCscMxd8G4c458xZ6/GRrB3kqlOlWKDkkTeesVkD2jX
	 6AWMS0yEFsETzjnlF9JRDsEvywHRq9CqZ/rP4GNBHM8bzWSfi8nBEuhzaMRR1VuMwcxJk
	 xztz/AblWB4CphJukJRNlQiebqTWCgh7Ja3b24Hypfj/01gGSZ4JaXRRNQCFr2njmTPQ1
	 JyQlG6A+XLmEbO5oyYnANxR2+b1jrsjRrPzjlEIisI+EpSNrr7IdED/hzN4xD53ewrWFU
	 4Y4b+6do2phAdVSznzn/Rr5pkTc985ExHc46GvQHl43Wgxfm70x7GYTiC5G3j57Vf7w==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793734044;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=uM7v3icM1TulOwWui44XsfGK5eoCNO1EvhFijxzbsbw=;
	b=Gmk7HHfpp3RGfTETiDwaLNLQQ6tWuk5W8taiTdykYcCP+68qTXA1YgeZV2yhYCzwKa5b
	 1gfM36WJ8F5rx5RT7bVNI6flKVv+8zm5kp5cPKEI6J7xYC5blj+S2saA5Y3pO3Ec4KHYZ
	 HTgavE/ClVL431Y+I5OUo0p4os+xtQ7Qy2hJDZSX//buXVJcwJTqNaluLjkSc/uW/mDuo
	 frxkg6sFJst0awnxraziWrfbrrh4WmotlbypcY6FMQkkMBoaW4ied02EUqjdXm3HSzXgQ
	 8jlbukTAUAyvxcjoUfEmWocHExt6VFUHNeX24lgOMezF1fMC+IH4HFFt1Vio6cg3SpA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3A0C31F000C1;
	Tue,  3 Nov 2026 19:27:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793734044;
	bh=uM7v3icM1TulOwWui44XsfGK5eoCNO1EvhFijxzbsbw=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=PTKgLAGgNW2fSXM0kYZ/Qm/seuzkArLyfT4I3gQQTxE2G8lSKADny2WxPdNcUzbPM
	 rOmC+evaZ4D8JXp1EyNBwO2XNpRKrFngAUzc7jKq/fiNBuOdXza6fdVhVd2ZB/q/GA
	 OeCo159taO0WrFBA+0EmVyJqCL2DjA7Y1M7fyM1kOFEMeBu8c75d3mn2h3rUuXTVt5
	 uQIIDNzFuPtK4Orru1txZ7WS9JZXK7bWL2bA00O+MKyfxlOpcbcmsRcjkCcO1EUfUL
	 QDCwOnGsuuYEOAgo9CrGa8t6ehYw/HRHTjNPfPlnthhxJ3EhJb/JrXQGbX7I7QURmI
	 hlBWq8Hmk9uEw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id A896646ABE;
	Tue,  3 Nov 2026 19:27:23 +0000 (UTC)
From: Ivan Verbovoy via B4 Relay <devnull+ivanverbovoy.gmail.com@kernel.org>
Date: Tue, 03 Nov 2026 21:27:19 +0200
Subject: [PATCH] arm64: dts: qcom: sm8150-microsoft-surface-duo: fix da7280
 pinctrl state name
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
Message-Id: <20261103-a1-duo-da7280-pinctrl-v1-1-be1a6dd10f20@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMwQrCMAyA4VcZORtoO9Dqq4iHLIkuQ7rRbmMw9
 u5WPX6H/9+haDYtcGt2yLpasTFV+FMD3FN6KZpUQ3Dh7L1rkTzKMqLQJUSHkyWe8xs7FSEmjuE
 aobZT1qdtv+/98XdZukF5/s7gOD5L1h5JeQAAAA==
X-Change-ID: 20261103-a1-duo-da7280-pinctrl-beddacac8298
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Ivan Verbovoy <ivanverbovoy@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793734043; l=1561;
 i=ivanverbovoy@gmail.com; s=20261103; h=from:subject:message-id;
 bh=0js5pdnbTdQyzcVH7Eyw2YpiHysbE+V0Y8mJj4fF7JI=;
 b=RiH3K/R1JRzpBkJIo7DjuAXmYGNE3FhsOK/XAyLQC8ue2NxiLReGgvu9T8ZGQZzvu7oChjSQ0
 EA4YRzzS1TcCCz0Lo18EYHNHy2CBbuZCiYS404fLAJtR+ayJpbzN+4M
X-Developer-Key: i=ivanverbovoy@gmail.com; a=ed25519;
 pk=0AchqTH1hJFToIUeFfQRlVzzuaWQDs4e75SxT2y3s8c=
X-Endpoint-Received: by B4 Relay for ivanverbovoy@gmail.com/20261103 with
 auth_id=1396
X-Original-From: Ivan Verbovoy <ivanverbovoy@gmail.com>
Reply-To: ivanverbovoy@gmail.com
Content-Transfer-Encoding: 7bit

From: Ivan Verbovoy <ivanverbovoy@gmail.com>

The pinctrl core applies a device's "default" state by itself and the
da7280 driver requests no state of its own, so the state named
"da7280_default" is never selected: gpio42 stays as the firmware left it
and its pull-up is not applied. The interrupt line is open-drain and
level-low; after a suspend/resume cycle it stays low and the threaded
handler runs continuously (about 2900 times a second) with no event in
the chip, which slows the whole system down.

Name the state "default" so it is applied at probe.

Fixes: d1f781db47a8 ("arm64: dts: qcom: add initial device-tree for Microsoft Surface Duo")
Signed-off-by: Ivan Verbovoy <ivanverbovoy@gmail.com>
---
 arch/arm64/boot/dts/qcom/sm8150-microsoft-surface-duo.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8150-microsoft-surface-duo.dts b/arch/arm64/boot/dts/qcom/sm8150-microsoft-surface-duo.dts
index f37e11bde067..4078a7521a2e 100644
--- a/arch/arm64/boot/dts/qcom/sm8150-microsoft-surface-duo.dts
+++ b/arch/arm64/boot/dts/qcom/sm8150-microsoft-surface-duo.dts
@@ -372,7 +372,7 @@ da7280@4a {
 		compatible = "dlg,da7280";
 		reg = <0x4a>;
 		interrupts-extended = <&tlmm 42 IRQ_TYPE_LEVEL_LOW>;
-		pinctrl-names = "da7280_default";
+		pinctrl-names = "default";
 		pinctrl-0 = <&da7280_intr_default>;
 
 		dlg,actuator-type = "LRA";

---
base-commit: d6bcfc94eb4da6e089c5473970cd96727292fd97
change-id: 20261103-a1-duo-da7280-pinctrl-beddacac8298

Best regards,
--  
Ivan Verbovoy <ivanverbovoy@gmail.com>


