Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FE8C3B6BF1;
	Sun, 30 Aug 2026 14:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788099745; cv=none; b=KWdZMJtU6hJfnaiPIO7YQNWmOIMtyPFIUvgH2R95O6BtkLwIji7fcEjQhSOYPVpuQbetxxWPSSkq/uGyVh6utwXnj2RMj6CETpQsIn4f0ZgA/PlOM9xFpL+GzrhB4Nasgp+QJDFKYPARwjAkCKA5JS4GUsd5BWeRzmVmYBjNfe4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788099745; c=relaxed/simple;
	bh=DzWRAVjSbOt2fmkIlgKACC5xJIcKFQRvLBJixPdk5hA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZNh5gIfxvjZKpgUba82XAQpUd4zpuG4lxHMXCrmomGIeiozdQJSbTOsFwP3d8HCJNFMNvwkXMAnEi6Ub5wY9M6noqruo5QM/JLMthlNK/HS3YmOpzSy7UxLgBTfA7UY+MKu1CrBjXnrYzssGRFvzBwYutGXq9opzjGYqJCnB3oY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nUbyPs9x; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nUbyPs9x"
Received: by smtp.kernel.org (Postfix) with ESMTPS id D492EC2BD00;
	Sun, 30 Aug 2026 14:22:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788099744;
	bh=DzWRAVjSbOt2fmkIlgKACC5xJIcKFQRvLBJixPdk5hA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=nUbyPs9x+IH5ZG8ZYGCcgMBtQLqLS83gp1J7TIqi0XV2+/WvWBl+qF7x8yFw4qlwH
	 SSL9k8IUFkRLDpD9NWp8bezU1WhKHBtuQns4mxFI0KxrxREtVsjB+ohDp0KQxovWPJ
	 0ZrRYIkSAn5KhsScqFJ/gkj0oaBMw9yDVKfEHeKnzLkUr0Bll0p31LUDtEq03HsWzf
	 N2oadCLwTScAznLvho4jWm4usHd9EH8Ar+N903DApEofqAp9SO3qUCxV3zbzsFkxq+
	 lmUeAu1sH2ktnwTXvNa3amue7YU0im4rpGbNzKWGncm1eLyMlW+vK2QLXXxTnm4rm3
	 xR1lcyoWDUWAg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3459C61DD9;
	Sun, 30 Aug 2026 14:22:24 +0000 (UTC)
From: Sven Peter <sven@kernel.org>
Date: Sun, 30 Aug 2026 16:22:08 +0200
Subject: [PATCH 2/3] arm64: dts: apple: t6030: Fix cpus node indentation
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260830-b4-apple-dts-fixes-v1-2-cc20f8445754@kernel.org>
References: <20260830-b4-apple-dts-fixes-v1-0-cc20f8445754@kernel.org>
In-Reply-To: <20260830-b4-apple-dts-fixes-v1-0-cc20f8445754@kernel.org>
To: Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, asahi@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Sven Peter <sven@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=702; i=sven@kernel.org;
 h=from:subject:message-id;
 bh=DzWRAVjSbOt2fmkIlgKACC5xJIcKFQRvLBJixPdk5hA=;
 b=owGbwMvMwCXmIlirolUq95LxtFoSQ9YUm3mTvpemPl/lYX/B4sD0ctmWj1UnfNU/z3FjDrUyk
 PNaXlXYUcrCIMbFICumyLJ9v73pk4dvBJduuvQeZg4rE8gQBi5OAZjIL1eGf+bdlj3PejY7LXt9
 atFhZUbblW+Wygpe+OAuobx/w+e5C5oZfjJemva5XKrzybOHq8o2TCg7XvvvXoWGwpRpbo3+281
 P7uMAAA==
X-Developer-Key: i=sven@kernel.org; a=openpgp;
 fpr=A1E3E34A2B3C820DBC4955E5993B08092F131F93
X-Endpoint-Received: by B4 Relay for sven@kernel.org/default with
 auth_id=407

Drop the extra space indentation of the closing brace of the cpus node.

Fixes: e81af013dbdd ("arm64: dts: apple: Initial T6030 (M3 Pro) device trees")
Signed-off-by: Sven Peter <sven@kernel.org>
---
 arch/arm64/boot/dts/apple/t6030.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/apple/t6030.dtsi b/arch/arm64/boot/dts/apple/t6030.dtsi
index dda9568af11f..5ff12edfc553 100644
--- a/arch/arm64/boot/dts/apple/t6030.dtsi
+++ b/arch/arm64/boot/dts/apple/t6030.dtsi
@@ -208,7 +208,7 @@ l2_cache_1: l2-cache-1 {
 			cache-unified;
 			cache-size = <0x1000000>;
 		};
-	 };
+	};
 
 	timer {
 		compatible = "arm,armv8-timer";

-- 
2.55.0


