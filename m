Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73C8834F48F;
	Sun, 30 Aug 2026 14:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788099745; cv=none; b=pC1R6pi+ZpLrwi8pOwpTEXGmPNons8rqcV9WBsj0npcb/4Z6iWmlERK0zT7nlLuFBuyqoXIX3eJsgwmZQad0iUXjhJkNZ8D9C+d2iKUzCfHLfnoyt18xRRnmViAgOyEakzNwoXcRP3EbjGILrzHkJAyd1cp/qnhrvBjXtykQBN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788099745; c=relaxed/simple;
	bh=XZr0dTCOqATFprJYOJpR1NmA5rDqYT2PR4Gt5cOZ5Qw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uM1eQOt00KN6lqCPCAv6dvqocJjtUT+FnmKh5om3BLjLj6LYC0KzMr5RsjKJ2cqAOSVJ69pJDmikCIwA8tGmvqbUoCbgenBfJgkCzeH6vTHlGP8hAYNyHd364ab6/ALd/CoRDFCEMRXE6ZuX7WYDyZvzWqe9hj+VyK7VxZ0q2Tk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ivy13M/q; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ivy13M/q"
Received: by smtp.kernel.org (Postfix) with ESMTPS id C3924C2BCFB;
	Sun, 30 Aug 2026 14:22:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788099744;
	bh=XZr0dTCOqATFprJYOJpR1NmA5rDqYT2PR4Gt5cOZ5Qw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Ivy13M/qWsYgF5IE5uJy3xqW8lzedyJYUMPUQ4v+h2M8BLYa4KP1JaS8D9N1YVpug
	 8iqR/k7ss+Mtg/9eddKMnMKPZb6y2EddU+FPyhuQsmKDkmFilRRYbFmj98b3Fmredw
	 D4deM8YXIAn96ZQh3huhE52C4u8GHcnmxdyfZ1HH2W68nJmSmGPb8Y+cF6bfiqOMQ8
	 2R5dBrd1HSl8tTmMkyXrUSfkmxZBQZaXx3aOq8ETEPE2aVHsYJPJOMVteKPWwmINU1
	 svNx2Z44567TlagbvYinPXlaX3zdtFJyHo4DOmx0DR9lm6gMrARtOa1BsnYO8zJogq
	 rR+csyOZrZXpA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4151C61DE1;
	Sun, 30 Aug 2026 14:22:24 +0000 (UTC)
From: Sven Peter <sven@kernel.org>
Date: Sun, 30 Aug 2026 16:22:07 +0200
Subject: [PATCH 1/3] arm64: dts: apple: t602x: Fix cpus node indentation
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260830-b4-apple-dts-fixes-v1-1-cc20f8445754@kernel.org>
References: <20260830-b4-apple-dts-fixes-v1-0-cc20f8445754@kernel.org>
In-Reply-To: <20260830-b4-apple-dts-fixes-v1-0-cc20f8445754@kernel.org>
To: Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, asahi@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Sven Peter <sven@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=756; i=sven@kernel.org;
 h=from:subject:message-id;
 bh=XZr0dTCOqATFprJYOJpR1NmA5rDqYT2PR4Gt5cOZ5Qw=;
 b=owGbwMvMwCXmIlirolUq95LxtFoSQ9YUm7kmNy8dzdjSoX58y4TUN1HtkV++B7ua55Q8OKSjG
 KzNyqbYUcrCIMbFICumyLJ9v73pk4dvBJduuvQeZg4rE8gQBi5OAZjI6xJGhhezXC/K8afdsWvi
 OeZz/Hc+s3finpPHnm1YK/ouktWg8hrD/9Ifmww4VJ7cOnPqtJnOdQe9iW1rP/985nz1zN2XPYr
 ScWwA
X-Developer-Key: i=sven@kernel.org; a=openpgp;
 fpr=A1E3E34A2B3C820DBC4955E5993B08092F131F93
X-Endpoint-Received: by B4 Relay for sven@kernel.org/default with
 auth_id=407

Drop the extra space indentation of the closing brace of the cpus node.

Fixes: e1514f9b3755 ("arm64: dts: apple: Add initial t602x device trees")
Signed-off-by: Sven Peter <sven@kernel.org>
---
 arch/arm64/boot/dts/apple/t602x-common.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/apple/t602x-common.dtsi b/arch/arm64/boot/dts/apple/t602x-common.dtsi
index 9c800a391e7e..66b6f8347d19 100644
--- a/arch/arm64/boot/dts/apple/t602x-common.dtsi
+++ b/arch/arm64/boot/dts/apple/t602x-common.dtsi
@@ -254,7 +254,7 @@ l2_cache_2: l2-cache-2 {
 			cache-unified;
 			cache-size = <0x1000000>;
 		};
-	 };
+	};
 
 	blizzard_opp: opp-table-0 {
 		compatible = "operating-points-v2";

-- 
2.55.0


