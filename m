Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE5733F4DCF;
	Sun, 20 Sep 2026 10:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789899907; cv=none; b=V42FA7eKFkLhtvKq4IhyBUG7mL67MgXsmyJwSrQI6EjubxeWbtlCCJnA4MEdk6lK26R6g5IDi6YhWynZHCzSWjX69zerydyZqE5kRgE+NWwFgTUjGhytoZ+T5riZNyPyZ6GFkRsZFNLJTFs9TBmf/otDDYbuP5beEQgKeA07Dzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789899907; c=relaxed/simple;
	bh=AfQRWYlOA9oYn7pKhRYTtSAvICG/ajPN7ML72cUReh4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mI/Efac5BTZ0q3wg7XEgzyIFpDaN99NdGDyRkvFcE8kh+NsBsl8FHoGUxupLXlRBJR09I5Lg8O3cnrYxHWhnxDNby0Vc4sY1iXO6scQoLeRIAbrGq1kObak9FnqwkK9wyFilCeFEpVr8dBnn2tEjuLhXCQOufteyqFMgoonltiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QXZqdjcT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QXZqdjcT"
Received: by smtp.kernel.org (Postfix) with ESMTPS id ABBD3C2BD05;
	Sun, 20 Sep 2026 10:25:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1789899907;
	bh=AfQRWYlOA9oYn7pKhRYTtSAvICG/ajPN7ML72cUReh4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=QXZqdjcTUPGbG2CO60FeN1vEQq1lisHu40g5oInrQm4/l1ohb5pAnAcvEEd/dEda8
	 4+6R0rQA2NUw7J28JuVwNcDZSW5+ySY3i45J/ezUwEFprrzHHAcOU2lQCDaIHvx+5c
	 VOMQvUkYmgIOWMfRfIOKnZzetOcqX7UXhvUrdUmIeLNYF0FnUL/znmNHneiGc99KLF
	 Ba6uWZmhYttl4R+AN7tYm+IGmMHEleyMF3nWRWvEpotr0wsAv/fOotkobsWsopWfcE
	 j0jJbFiL9pf4kKVza6R4EXx3UxTlfU6LIgb8usJhCQ2+KzZvEjoU3ytPvVs7mD0Iz+
	 1nSDVTSZx11GQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98AC9C982EB;
	Sun, 20 Sep 2026 10:25:07 +0000 (UTC)
From: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Date: Sun, 20 Sep 2026 18:25:13 +0800
Subject: [PATCH v2 11/12] arm64: dts: amlogic: s6: Add clk-measure
 controller node
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260920-more-socs-to-support-clk_measure-v2-11-224382a429e8@amlogic.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789899904; l=725;
 i=chuan.liu@amlogic.com; s=20240902; h=from:subject:message-id;
 bh=9SDzhFYgFeR3zBxYK2Jcmr4Ssvx78QFB8BdBwjoaCo8=;
 b=Vsjs7WW+r5ugbL6idpVlhUEpnx0T7h+vBrL4GLl5aOWOcGE2N9h4+cD574WFhLUgaR7Pse2ns
 rm4BfWnNdhpBv2XXV3AdIrylReX04DutwAx7IFXw08a0WOS8fm2fQ9K
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


