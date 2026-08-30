Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 621C63B6354;
	Sun, 30 Aug 2026 14:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788099745; cv=none; b=mFFNY2uz5EOT1xu94zNW+IRgzx4sYnHxQi4TnEoetHcCakBighmtDx0GeWPcUMwOuJU+dlRpmToQZ9QoFnm7cIZbFPSXJVhAZ9fRUzCd4OgcrAj8fbFPhEQlEOIItjh+BOKzYgfwhQX0ebCgSoItWnaoePaBRaWqY/f0skLZ82A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788099745; c=relaxed/simple;
	bh=BZZYf9REXU7acvmjIiBUNWktgp5lIoBvVJa7kgwRxaY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uiH3zrBOvmu94Vao5Kyg8NFQwJvMiQTDGuojaYF2hW0A1Ly9Upekm9QYi58/lBywdtpiTrTg/f1HpTmegZIfe1WrA2GCAP3dWCp35oyLfiIG3BYzDZb08t8RNG+tZ/b1gnw8m58oq8c8QZOQUMMdJEY9v+0tA9C3VMqua5tgnDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eNhqr6xp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eNhqr6xp"
Received: by smtp.kernel.org (Postfix) with ESMTPS id E2ED6C2BCF5;
	Sun, 30 Aug 2026 14:22:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788099744;
	bh=BZZYf9REXU7acvmjIiBUNWktgp5lIoBvVJa7kgwRxaY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=eNhqr6xpKbNzIijALOoX/xtotFDjEGXPkyOKpU++3fMmEvqwUCM4S+6VxNf225UYr
	 Xs1suevVgwD3SAmk2tB/ZdPV2AEiZekptG1vwix2Q4zKiTnT6R753MyazvaYciSyV2
	 0RqY61QsA6yVP3TlRaQPAyyCscU8mC8wW67bCWkvO8JEdaUvYnsPgE2PrOpzAbEsS3
	 dmBTBc/RM3Ha5T74qLp4axAIqmHsuW+LCtuK2UtLmp2OKluqb8/651i8wSLpzbq0HY
	 YyML9FK+y8HMtrre8ASq5h/YSLLZ4Ikp0lkXkd6yAog4exFRgkehps3bQb+/W25HA1
	 43scpGWHQ4yQQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D281FC61DEB;
	Sun, 30 Aug 2026 14:22:24 +0000 (UTC)
From: Sven Peter <sven@kernel.org>
Date: Sun, 30 Aug 2026 16:22:09 +0200
Subject: [PATCH 3/3] arm64: dts: apple: t6032: Fix cpus node indentation
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260830-b4-apple-dts-fixes-v1-3-cc20f8445754@kernel.org>
References: <20260830-b4-apple-dts-fixes-v1-0-cc20f8445754@kernel.org>
In-Reply-To: <20260830-b4-apple-dts-fixes-v1-0-cc20f8445754@kernel.org>
To: Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, asahi@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Sven Peter <sven@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=725; i=sven@kernel.org;
 h=from:subject:message-id;
 bh=BZZYf9REXU7acvmjIiBUNWktgp5lIoBvVJa7kgwRxaY=;
 b=owGbwMvMwCXmIlirolUq95LxtFoSQ9YUm/kbbz1N+Xc39Nhxa/8db+VatcWXH+ep6lVWXHDUJ
 b807v2jjlIWBjEuBlkxRZbt++1Nnzx8I7h006X3MHNYmUCGMHBxCsBE+EMYGS4EqpoEG/mtiji0
 N5h3iayH06Vom2ku/e/OGBkvfXEiP4/hf36xJZeTEpPt80+72K5fEj00oWnuaYWiiEYhrQXBTf1
 fmAE=
X-Developer-Key: i=sven@kernel.org; a=openpgp;
 fpr=A1E3E34A2B3C820DBC4955E5993B08092F131F93
X-Endpoint-Received: by B4 Relay for sven@kernel.org/default with
 auth_id=407

Drop the extra space indentation of the closing brace of the cpus node.

Fixes: 67d9574cf8ed ("arm64: dts: apple: Initial T603[124] (M3 Max and Ultra) device trees")
Signed-off-by: Sven Peter <sven@kernel.org>
---
 arch/arm64/boot/dts/apple/t6032.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/apple/t6032.dtsi b/arch/arm64/boot/dts/apple/t6032.dtsi
index bbf19ecdaaec..61d044f3a734 100644
--- a/arch/arm64/boot/dts/apple/t6032.dtsi
+++ b/arch/arm64/boot/dts/apple/t6032.dtsi
@@ -283,7 +283,7 @@ l2_cache_5: l2-cache-5 {
 			cache-unified;
 			cache-size = <0x1000000>;
 		};
-	 };
+	};
 
 	die0: soc@200000000 {
 		compatible = "simple-bus";

-- 
2.55.0


