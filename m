Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A4CC3F23C0;
	Sun, 20 Sep 2026 10:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789899907; cv=none; b=kedmnmPmbzr0hj1FgKCvg+YtxHkvI9GrpMABorP6nFB+ITrJ7sHhg9qLmSdcvGX642aF6qG10JuhYEYjuTutzH7i0O0L6jQ9JwL38FbkINApY8QYVeAcPElEZBkMCMoiAFtgV8QLohDUtycRGmiy50dMX38CZgAQXRApdommnWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789899907; c=relaxed/simple;
	bh=7yUvmIDMbzfZAF93qAmLa8Oi5bfk4s5SvGz6m0eGErI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aOcmKHUlcarOmO7+nnUpAP9IsEq/FD1IkwcmGOBPSkPLcB96zHQ3CT4SOxEFKo1zPflz1ez7cqsOubUAwCmfP+l+RUBlRQa0ZkyEawIJG1Wq9fpNZUfA1Ef4xzgJPmHAZSYTKFmooKynz0oaRoPHyAeCVlooaO3SgKSSZo7ZfhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X1mMz0CU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X1mMz0CU"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 66D80C4AF15;
	Sun, 20 Sep 2026 10:25:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1789899907;
	bh=7yUvmIDMbzfZAF93qAmLa8Oi5bfk4s5SvGz6m0eGErI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=X1mMz0CUbvKFxWP0aC3JYkN+k5/UVO7mRy2B09flWVK8uZl2sNFXMJBuE3qCklLXN
	 ltgm4CYfOOQ2t0SPI4X7Inlfy9+l/WtTOqO+bxXtfKo1h4Yb39q8ulk8d3Yp9Ikzjh
	 B4gzTtdVpAsFIon/Z3v3nYifUTZfC+WOFsAydSq0J2ZGzeUiMR0WsZmWZapLP1DjnU
	 bkC+MDpwFc+zyeRIflWpMeJ8TuTOoAdm5Qid9lb+HQYFpUhzP5936UPXesXRgG/aPh
	 +/GA8tPymbT98h+IjFeu26RxMSxO0jQ39I1SrjwqgfbCnPmfUdtmhpp7mIFRCqGaX7
	 zElaDQUPJwtlw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53585C982D0;
	Sun, 20 Sep 2026 10:25:07 +0000 (UTC)
From: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Date: Sun, 20 Sep 2026 18:25:09 +0800
Subject: [PATCH v2 07/12] arm64: dts: amlogic: a5: Add clk-measure
 controller node
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260920-more-socs-to-support-clk_measure-v2-7-224382a429e8@amlogic.com>
References: <20260920-more-socs-to-support-clk_measure-v2-0-224382a429e8@amlogic.com>
In-Reply-To: <20260920-more-socs-to-support-clk_measure-v2-0-224382a429e8@amlogic.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Chuan Liu <chuan.liu@amlogic.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789899904; l=735;
 i=chuan.liu@amlogic.com; s=20240902; h=from:subject:message-id;
 bh=m5R5k55AN/MNKbp84EDgUAXLk3E5z1TMK4ptSdMbBlo=;
 b=o3JaiEL+aRnvotUYIh5NHQ4EnpH4qmkpE6JzCCATMhxdOCOaG7hehas2rqKuMAtfPA4g4UuMZ
 PQAEVnxwnclBeLHFj3pU7h7mPupa7IL+eH9R6QsEr5XfdqWGnrWdSp4
X-Developer-Key: i=chuan.liu@amlogic.com; a=ed25519;
 pk=fnKDB+81SoWGKW2GJNFkKy/ULvsDmJZRGBE7pR5Xcpo=
X-Endpoint-Received: by B4 Relay for chuan.liu@amlogic.com/20240902 with
 auth_id=203
X-Original-From: Chuan Liu <chuan.liu@amlogic.com>
Reply-To: chuan.liu@amlogic.com

From: Chuan Liu <chuan.liu@amlogic.com>

Add the clk-measure controller node for A5 SoC family.

Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
---
 arch/arm64/boot/dts/amlogic/amlogic-a5.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-a5.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-a5.dtsi
index 2b12d8284594..0be176ace337 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-a5.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-a5.dtsi
@@ -157,4 +157,9 @@ gpio_intc: interrupt-controller@4080 {
 		amlogic,channel-interrupts =
 			<10 11 12 13 14 15 16 17 18 19 20 21>;
 	};
+
+	clk_msr: clock-measure@48000 {
+		compatible = "amlogic,a5-clk-measure";
+		reg = <0x0 0x48000 0x0 0x1c>;
+	};
 };

-- 
2.42.0


