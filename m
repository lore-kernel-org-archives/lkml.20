Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2052555C315;
	Fri, 16 Oct 2026 17:16:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792171014; cv=none; b=gRqGpoAQEXtodQQV7MN/Na5UEUB3XfdAx7mPp/Gop39EQAsChui8NiThrMsPbcUI2D4yzrefWHnUvkWFUxf6ukK3TmwRejt7TXkbORdH7JjeK8wNVvNWO7jv3oCut/eFi0yFpLHdLCPdCkVc9RrIfGwNEi5XQtuFbscHNdnoRBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792171014; c=relaxed/simple;
	bh=mGfO8kBmNFsGLWeCA35XjVmhXjh+nOoiN5ErDOAAE84=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bwicau/Np8s5T63zinzA/bR9FHzZwEiCsJfRy3GTfyGBbfpvEh1Br316GW3Bnu+ce0KEWFt0I/HAscHiVR+Ti3EXy7E7VLoo0UArXJ8fTbBvuB8AA4aH7tZnHjQaOcGfbp76GZWeb5OytwKQ6EzzyPUGSW1ghyiOlrynm7tZEhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MCSg+PP3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MCSg+PP3"
Received: by smtp.kernel.org (Postfix) with ESMTPS id CD1D8C2BCF5;
	Fri, 16 Oct 2026 17:16:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1792171013;
	bh=mGfO8kBmNFsGLWeCA35XjVmhXjh+nOoiN5ErDOAAE84=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=MCSg+PP3lY8x8FXQYbORvXs6hcg93GFny3H7rZv2da0mUDD4+nJ3r/R0w4V63EYW6
	 3q0zo9Z4ppKKfD6ge52M9a8jx4MwvHTxF9oAWWeVWjCKRwPv66n6if6LZj3jIpMTy1
	 eZV9kLpkB1PVxy6V9zAkqaK2iFUr6wC4wKytrffd+Zbvf2e9Z7qIlvmIIlfEE6Saxx
	 o8tDQTWNlXnOKxEFLEJdMMSFXdykCbjD6h8hq+rb42ewkcZ5FNNaJSZ0qqhHsD/kM6
	 S9ORHIYcTpPnqa0jWhw/ama5LsfKqdvaMLPbVJftbAp7xETu72Jm+dMS2QL36lleik
	 FLfwNN4EAqoNQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD56FCCA46C;
	Fri, 16 Oct 2026 17:16:53 +0000 (UTC)
From: Ronald Claveau via B4 Relay <devnull+linux-kernel-dev.aliel.fr@kernel.org>
Date: Fri, 16 Oct 2026 19:16:07 +0200
Subject: [PATCH v7 1/4] arm64: dts: amlogic: t7: Add cooling cells to all
 CPUs
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-add-thermal-t7-vim4-v7-1-6eede5450fd4@aliel.fr>
References: <20261016-add-thermal-t7-vim4-v7-0-6eede5450fd4@aliel.fr>
In-Reply-To: <20261016-add-thermal-t7-vim4-v7-0-6eede5450fd4@aliel.fr>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ronald Claveau <linux-kernel-dev@aliel.fr>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2150;
 i=linux-kernel-dev@aliel.fr; h=from:subject:message-id;
 bh=pWfl7HrfY/sohfU3J31MDc3TckJ5tV1lL5L4g5UHqnU=;
 b=owGbwMvMwCWm1SvKXP3cUInxtFoSQ9al6N+1yr92ni882az69Uv5/0lzPpnc/sLz01GK0a87w
 sHP4W9fRykLgxgXg6yYIkv/XMsT7y4fPfN1j3oKzBxWJpAhDFycAjARBy+G//6ms+a/Oq/3aNM1
 pznLfs69lhsu7hnE8r7Zvq32RbLwntuMDHsyOudqbFxzP25SlHCPhc5za6df1/LDZE5KrnvL86+
 2nRcA
X-Developer-Key: i=linux-kernel-dev@aliel.fr; a=openpgp;
 fpr=DFD863F61375BF917F0012173953305EF1D0EC3E
X-Endpoint-Received: by B4 Relay for linux-kernel-dev@aliel.fr/default with
 auth_id=744
X-Original-From: Ronald Claveau <linux-kernel-dev@aliel.fr>
Reply-To: linux-kernel-dev@aliel.fr

From: Ronald Claveau <linux-kernel-dev@aliel.fr>

Add #cooling-cells = <2> to all CPU nodes (both little and big cluster)
to allow them to be used as cooling devices in thermal zone mappings.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
---
 arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
index 6894c06a836bc..8aa85aab30469 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
@@ -63,6 +63,7 @@ cpu100: cpu@100 {
 			i-cache-size = <0x8000>;
 			i-cache-sets = <32>;
 			next-level-cache = <&l2_cache_l>;
+			#cooling-cells = <2>;
 		};
 
 		cpu101: cpu@101 {
@@ -77,6 +78,7 @@ cpu101: cpu@101 {
 			i-cache-size = <0x8000>;
 			i-cache-sets = <32>;
 			next-level-cache = <&l2_cache_l>;
+			#cooling-cells = <2>;
 		};
 
 		cpu102: cpu@102 {
@@ -91,6 +93,7 @@ cpu102: cpu@102 {
 			i-cache-size = <0x8000>;
 			i-cache-sets = <32>;
 			next-level-cache = <&l2_cache_l>;
+			#cooling-cells = <2>;
 		};
 
 		cpu103: cpu@103 {
@@ -105,6 +108,7 @@ cpu103: cpu@103 {
 			i-cache-size = <0x8000>;
 			i-cache-sets = <32>;
 			next-level-cache = <&l2_cache_l>;
+			#cooling-cells = <2>;
 		};
 
 		cpu0: cpu@0 {
@@ -119,6 +123,7 @@ cpu0: cpu@0 {
 			i-cache-size = <0x10000>;
 			i-cache-sets = <64>;
 			next-level-cache = <&l2_cache_b>;
+			#cooling-cells = <2>;
 		};
 
 		cpu1: cpu@1 {
@@ -133,6 +138,7 @@ cpu1: cpu@1 {
 			i-cache-size = <0x10000>;
 			i-cache-sets = <64>;
 			next-level-cache = <&l2_cache_b>;
+			#cooling-cells = <2>;
 		};
 
 		cpu2: cpu@2 {
@@ -147,6 +153,7 @@ cpu2: cpu@2 {
 			i-cache-size = <0x10000>;
 			i-cache-sets = <64>;
 			next-level-cache = <&l2_cache_b>;
+			#cooling-cells = <2>;
 		};
 
 		cpu3: cpu@3 {
@@ -161,6 +168,7 @@ cpu3: cpu@3 {
 			i-cache-size = <0x10000>;
 			i-cache-sets = <64>;
 			next-level-cache = <&l2_cache_b>;
+			#cooling-cells = <2>;
 		};
 
 		l2_cache_l: l2-cache-cluster0 {

-- 
2.49.0


