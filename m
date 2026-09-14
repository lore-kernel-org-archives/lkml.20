Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BB05488204;
	Mon, 14 Sep 2026 15:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789401560; cv=none; b=LqnUd0m51jiyPm9jgL219sAYpoakgXigNh/1JnPljelLIxylotyo+imv8kFkDz6BnKcvrlxOaC1GQhnZUyL9WBcHFJIQVZstXvTe0pEvbi+9y7eORy7HgZnsTeullcu06hK4/V5Y2TceRiwMydGmwuXkbgclqop/aYocTdaSC0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789401560; c=relaxed/simple;
	bh=h2aAZZsYUgxinX2Xk8rSiefl4BFGCyLAec+iN/0udkQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=P8xrNJI2G73uwusO32Il0pf1I1J8Iw6O8NQXPRTybjgY2e0jRE3RAGvGRwWMUzgzHw2cWmd6Q04ainDrtzprXPdcAam4sKtyAc/9VgL+RQDNf70o9ksm9QXeCjjr3ZM+v4TZRyVAeoRO+uMvWzUD9V3Gw0mHN3fl82ulzP0EjEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=OP0z2aBP; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="OP0z2aBP"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0964D1CC4;
	Mon, 14 Sep 2026 08:59:14 -0700 (PDT)
Received: from e135073.arm.com (unknown [10.57.7.201])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id AEAAD3F882;
	Mon, 14 Sep 2026 08:59:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789401557; bh=h2aAZZsYUgxinX2Xk8rSiefl4BFGCyLAec+iN/0udkQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OP0z2aBPV6Fo0AMlIEctr20+Lmgjx5E89iORauFkkKUnbgPCBg1qJm80ov+A1RF33
	 baRqQhiBr+RLGJid052pp+yn3KAAAKgaQlcZSUcyo382aimRPl9wHPgAIX57eVLKQ1
	 Fcz7um37e/LfSsfh7mMMwf8n1oq5aSkR9j+sPPbc=
From: Pierre Gondois <pierre.gondois@arm.com>
To: linux-kernel@vger.kernel.org
Cc: Pierre Gondois <pierre.gondois@arm.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [PATCH 3/3] arm64: dts: fvp: Add additional PCIe memory region
Date: Mon, 14 Sep 2026 17:58:53 +0200
Message-ID: <20260914155854.123341-4-pierre.gondois@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260914155854.123341-1-pierre.gondois@arm.com>
References: <20260914155854.123341-1-pierre.gondois@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add an additional PCIe memory region to fvp revc.
Similarly to what is done in the edk2-platforms
repository in ACPI, only advertise 4GB instead
of the 256GB possible.

Signed-off-by: Pierre Gondois <pierre.gondois@arm.com>
---
 arch/arm64/boot/dts/arm/fvp-base-revc.dts | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/arm/fvp-base-revc.dts b/arch/arm64/boot/dts/arm/fvp-base-revc.dts
index c84796438a83..d184a073c3a2 100644
--- a/arch/arm64/boot/dts/arm/fvp-base-revc.dts
+++ b/arch/arm64/boot/dts/arm/fvp-base-revc.dts
@@ -373,7 +373,8 @@ pci: pci@40000000 {
 		device_type = "pci";
 		bus-range = <0x0 0xff>;
 		reg = <0x0 0x40000000 0x0 0x10000000>;
-		ranges = <0x2000000 0x0 0x50000000 0x0 0x50000000 0x0 0x10000000>;
+		ranges = <0x2000000 0x0 0x50000000 0x0 0x50000000 0x0 0x10000000
+				0x3000000 0x40 0x00000000 0x40 0x00000000 0x1 0x00000000>;
 		interrupt-map = <0 0 0 1 &gic 0 0 GIC_SPI 168 IRQ_TYPE_LEVEL_HIGH>,
 				<0 0 0 2 &gic 0 0 GIC_SPI 169 IRQ_TYPE_LEVEL_HIGH>,
 				<0 0 0 3 &gic 0 0 GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>,
-- 
2.43.0

