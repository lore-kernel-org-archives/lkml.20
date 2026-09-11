Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79B5F45D5E2;
	Fri, 11 Sep 2026 08:28:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789115332; cv=none; b=NsUON1oKmK6NOHWlYb6X6/8YovrmXC7b17AoFiT/ZYA7bwAuGnp9VXsoy+Ytx6iP9z6yWMA4p9T66XD8SwJrAkC13EXlkmGcsYhoLvGOACo5AyqsB5cY7zd9RkDfCKgERvgoEA8wb2/faUuqfUMyGLCgh6GsS1Yj/TZcwOYsnvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789115332; c=relaxed/simple;
	bh=AfQRWYlOA9oYn7pKhRYTtSAvICG/ajPN7ML72cUReh4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fxbHSAYN6xEefyFaqfFwBpxuFdMsL4Nnd7bTSUtDB17v4Ld3hpkv1WwD7q+C4g6Y5CBJHNTqjUdYN+ayy57xmiKHX1rbZ7c9BKVmfrcjuSkj12HhffCswLZ+of1mo6SneYpT0r2Kc6SfPHffdcaE9smUBU0yTUfEa5f8y1mO+Q8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZxYRTzTb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZxYRTzTb"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4C059C4AF0F;
	Fri, 11 Sep 2026 08:28:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1789115332;
	bh=AfQRWYlOA9oYn7pKhRYTtSAvICG/ajPN7ML72cUReh4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=ZxYRTzTb7qRXk2BM+h7pOcSQEXwwl6BA+sp1K/pwwpcqBRSdAO3Cox+SWIIchGy33
	 d5JXIQNxzNpBw3Kds/SoWwTvtFS66jHYqFj8GysRq1XXLBhRE0niAA5JSXoBGQmObv
	 WzBv3a5LRusFJwifLGY8yjUqeBHpcHVbkrrTaykGR9pdrXqU43BMoBXQQXcJ2tGpFe
	 ZcApo7s8j/xRgFUsS5n5MfvqPW//uZqY70C4WOmPKKd8cWK383FWLR3QqFTyjQZpEz
	 4j8fbv/+H6rgJNpjeB/q1Df2NUTazWfXjc9ksYWgmdnwuzAW0yHK18aK98fY+Sk2Ct
	 n9Xt7Jw2Vh+VQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BE4DC88E4D;
	Fri, 11 Sep 2026 08:28:52 +0000 (UTC)
From: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Date: Fri, 11 Sep 2026 16:28:36 +0800
Subject: [PATCH 09/10] arm64: dts: amlogic: s6: Add clk-measure controller
 node
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-more-socs-to-support-clk_measure-v1-9-940e269aa52f@amlogic.com>
References: <20260911-more-socs-to-support-clk_measure-v1-0-940e269aa52f@amlogic.com>
In-Reply-To: <20260911-more-socs-to-support-clk_measure-v1-0-940e269aa52f@amlogic.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Chuan Liu <chuan.liu@amlogic.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789115329; l=725;
 i=chuan.liu@amlogic.com; s=20240902; h=from:subject:message-id;
 bh=9SDzhFYgFeR3zBxYK2Jcmr4Ssvx78QFB8BdBwjoaCo8=;
 b=+crIwXhW12Tmd+RRIn9A3IFp0PomUDH1P4dVF+bhnXDviUtnxRsDKqtAmOKAwQpMmw+DP0bkl
 A9rw6yglxz6C3Xh7H3NMFaAmgNspq8J/c0AeQYISK7Okkb40tC6IC/L
X-Developer-Key: i=chuan.liu@amlogic.com; a=ed25519;
 pk=fnKDB+81SoWGKW2GJNFkKy/ULvsDmJZRGBE7pR5Xcpo=
X-Endpoint-Received: by B4 Relay for chuan.liu@amlogic.com/20240902 with
 auth_id=203
X-Original-From: Chuan Liu <chuan.liu@amlogic.com>
Reply-To: chuan.liu@amlogic.com

From: Chuan Liu <chuan.liu@amlogic.com>

Add the clk-measure controller node for S6 SoC family.

Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
---
 arch/arm64/boot/dts/amlogic/amlogic-s6.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-s6.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-s6.dtsi
index ab3acef2b147..b0a1a05297ce 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-s6.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-s6.dtsi
@@ -217,6 +217,11 @@ ao-secure@10220 {
 				reg = <0x0 0x10220 0x0 0x140>;
 				amlogic,has-chip-id;
 			};
+
+			clk_msr: clock-measure@48000 {
+				compatible = "amlogic,s6-clk-measure";
+				reg = <0x0 0x48000 0x0 0x1c>;
+			};
 		};
 	};
 };

-- 
2.42.0


