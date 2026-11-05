Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793918076;
	b=jLfPcDCWLsaKhs5zxEc3Z0XarbT+l6bGvY/xCzypE1SJMVZ5+V9N2RTeBk6GpZUbXM9h
	 qXHxomoVZ+ihgv2MgLwTD4SaoJs4Q6M7iJcpP0G/3a9xOASZXwMzaQRiutrSqMJHVF4Ov
	 ykjkF/Y3vgUzQ7oUsZWQ046+CDkN1P3+nIWaq5aNq5raWVtttAgOOfa6rZlE3L3QTWGJh
	 6JB+9FoJqwusz1prT9mIuDnzKDv64RfpnH9yPmZAVfzOtpKqKs0t1RfNtmlsoOZHuoJgt
	 fLSxXb17Z7xXvMtuB5eQ6vSTYBwxKciKhoHfMnGVWG+MpFaDVWNOA64aPsacgf2mKZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793918076;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=1hYspQIQ4LkjWerTtfiwgFtZ0WGW92Raq9eAnPsktJs=;
	b=Gk1qGE0fUiNES5fQtDEfXc4PJFCYY7JdjLf8avMoAwBKFdnunPZOclX/f1n0sxA7+0+Z
	 WmcIGMJiNmlTio2k3uS+Ism2ikj4mGIC9jTgwg6SCL5EPyNQxe2Ncoveu8jn0TpdOM4vm
	 B04CmaZ5lQk4ZW9E2D6lQPjVAGwF57K40ZhL951P21mOhehRfgHhdXUr9AunKUvLQ1yIO
	 AOAC6PlJHYg4supwdOPUA/fJlQIqNOeskEy8Esn9SZgzDaT72JXnlzDCxvsTIeoBKbirk
	 B2KsNVCqsWYnUEnZs6GFHq1icqrunRPP2D0fltFD4Uxo3Y3PYym7nkfOC8Tck4TnTJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YSXLCZnB;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6A4F606D803;
	Thu,  5 Nov 2026 22:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YSXLCZnB
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 533AA1F0089F;
	Thu,  5 Nov 2026 22:34:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793918075;
	bh=1hYspQIQ4LkjWerTtfiwgFtZ0WGW92Raq9eAnPsktJs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=YSXLCZnBsbSH6o9EuclTsHCKziC97L4yn92K40m06PANLvq1GqQl3bKFJE8dK7QoU
	 p1YA0e+08t+qsfofVL5fcjba2n5sO0jNzAj9WXkGnmqTXPM5x42Mw5l31ctLwll7pt
	 D6PPgAT/bMOzcsIYtAn4MwHwbeIYLB9BaaGjOklDQsoQTs8kPV5FO+ixObOZQgR/14
	 JieCUr930vDatI4bY+SqwLhE9PAfHx5NDgbZfC69B0wLqQxsLDL5/o9leHd89UWy85
	 rtHuS0KlBewmmNvVykQ3rF+xB8hK7VzPbtEXKhAVncWK5s0UkaaSpmUvkvhO9kOn85
	 Z/8P1rEGwT2yA==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Thu, 05 Nov 2026 16:34:19 -0600
Subject: [PATCH 6/7] ARM: dts: arm/vexpress: Fix Cortex-A15 GIC compatibles
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-dt-vexpress-dts-fixes-v1-6-66615c3c8ec3@kernel.org>
References: <20261105-dt-vexpress-dts-fixes-v1-0-66615c3c8ec3@kernel.org>
In-Reply-To: <20261105-dt-vexpress-dts-fixes-v1-0-66615c3c8ec3@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>, 
 Sudeep Holla <sudeep.holla@kernel.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Andre Przywara <andre.przywara@arm.com>, Linus Walleij <linusw@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.16-dev

The "arm,cortex-a15-gic" compatible does not take a "arm,cortex-a9-gic"
fallback compatible, so drop it.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 arch/arm/boot/dts/arm/vexpress-v2p-ca15-tc1.dts | 2 +-
 arch/arm/boot/dts/arm/vexpress-v2p-ca15_a7.dts  | 2 +-
 arch/arm/boot/dts/arm/vexpress-v2p-ca5s.dts     | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/arm/vexpress-v2p-ca15-tc1.dts b/arch/arm/boot/dts/arm/vexpress-v2p-ca15-tc1.dts
index dd68250fa999..75d7f2852f94 100644
--- a/arch/arm/boot/dts/arm/vexpress-v2p-ca15-tc1.dts
+++ b/arch/arm/boot/dts/arm/vexpress-v2p-ca15-tc1.dts
@@ -92,7 +92,7 @@ watchdog@2b060000 {
 	};
 
 	gic: interrupt-controller@2c001000 {
-		compatible = "arm,cortex-a15-gic", "arm,cortex-a9-gic";
+		compatible = "arm,cortex-a15-gic";
 		#interrupt-cells = <3>;
 		#address-cells = <0>;
 		interrupt-controller;
diff --git a/arch/arm/boot/dts/arm/vexpress-v2p-ca15_a7.dts b/arch/arm/boot/dts/arm/vexpress-v2p-ca15_a7.dts
index 8f210671b287..f3f9d6e4dd16 100644
--- a/arch/arm/boot/dts/arm/vexpress-v2p-ca15_a7.dts
+++ b/arch/arm/boot/dts/arm/vexpress-v2p-ca15_a7.dts
@@ -147,7 +147,7 @@ memory-controller@2b0a0000 {
 	};
 
 	gic: interrupt-controller@2c001000 {
-		compatible = "arm,cortex-a15-gic", "arm,cortex-a9-gic";
+		compatible = "arm,cortex-a15-gic";
 		#interrupt-cells = <3>;
 		#address-cells = <0>;
 		interrupt-controller;
diff --git a/arch/arm/boot/dts/arm/vexpress-v2p-ca5s.dts b/arch/arm/boot/dts/arm/vexpress-v2p-ca5s.dts
index c716e60a8be0..a5e0dde254ab 100644
--- a/arch/arm/boot/dts/arm/vexpress-v2p-ca5s.dts
+++ b/arch/arm/boot/dts/arm/vexpress-v2p-ca5s.dts
@@ -119,7 +119,7 @@ watchdog@2c000620 {
 	};
 
 	gic: interrupt-controller@2c001000 {
-		compatible = "arm,cortex-a5-gic", "arm,cortex-a9-gic";
+		compatible = "arm,cortex-a5-gic";
 		#interrupt-cells = <3>;
 		#address-cells = <0>;
 		interrupt-controller;

-- 
2.53.0

