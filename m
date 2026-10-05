Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB9F9318BB8;
	Mon,  5 Oct 2026 21:05:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791234337; cv=none; b=uUP9CG3s/Rip7bO+YgU/l/92ItfCRwKXkFlVWkn30P6WFM6dJFxh3esVoBRagDRrka8Mjd70lHJvO3oWiv5mexJy1Z/rLMHZoUKXLPSoxQkB5HLB0mNztGHaIUIAaaHkV9GmvidhzDFvUHjt2pczXt+Gslyj+zOn3xqwkGowRwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791234337; c=relaxed/simple;
	bh=G+w7EkzR9iONABXgqKNyTfrfF1ClH+VVNNkqFimY3Pk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CRY1oUSo69tC2wezIpo2YANkaR6msk/ATKW8M5Y1+6xSjS0UFYBhWmy5d0Pg9KBQQYrU7mPTmGovoGaPyXWxGRJwQZyZSDsqubXVt7dK5vraY8ILqhkzqow7zIKkvwC+r5CaQF2gVASw7QjcZ9eHINZxvMFL+MAt8EuAyRFh5F0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bFBMVAKT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bFBMVAKT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 323311F000FF;
	Mon,  5 Oct 2026 21:05:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791234336;
	bh=w2pIgFiEsXU056asN4AfqubB2EFM4zS7a5OgX9F1Kac=;
	h=From:To:Cc:Subject:Date;
	b=bFBMVAKTvhIR2n3To4WWdXuc9KtDdFGha11HRSsirugMVFeHsODpkBYxxUkcbZ6Ap
	 jR7k7gKTGezDUKdDDHiCuHDSffJBWPHDigfRJ/k1udQjSvEydA/jCj/AWJLh3xc0d4
	 hxbH1QG42KGyST/xRlpqkDKMuOVUae85+32BnT878E+TlcUBONBoUyTvaVX2mQphgR
	 +zCJlGztuhKsHiuLQ8mcJM1yv/zo/OZz/spgKt+dSFytpcaE7y8lwoPlZrytm1NtAO
	 uVBA+rmaikFSd0ZWPJfEVOh8dyP89JqJyugbrf80eD61+WWyoQr5rKAob3PS7ncO6s
	 tHo6MGMsi3K/w==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Liviu Dudau <liviu.dudau@arm.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] arm64: dts: arm: corstone1000-a320: Fix GIC redistributor region size
Date: Mon,  5 Oct 2026 16:05:06 -0500
Message-ID: <20261005210506.2118052-2-robh@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Arm Corstone1000-A320 has a GICv4 which means the redistributor
region should be 4x256KB rather than 512KB. This issue didn't become
apparent as SMP was disabled as a work-around in early versions of the
FVP.

Fixes: 87599f1843d3 ("arm64: dts: arm/corstone1000: Add corstone-1000-a320")
Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>
Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
Hi, this still hasn't been applied.

v2:
 - No changes, rebase on v7.3-rc1
---
 arch/arm64/boot/dts/arm/corstone1000-a320.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/arm/corstone1000-a320.dtsi b/arch/arm64/boot/dts/arm/corstone1000-a320.dtsi
index f0937914350c..f895a024fc92 100644
--- a/arch/arm64/boot/dts/arm/corstone1000-a320.dtsi
+++ b/arch/arm64/boot/dts/arm/corstone1000-a320.dtsi
@@ -73,7 +73,7 @@ gic: interrupt-controller@1c000000 {
 		#size-cells = <1>;
 		interrupt-controller;
 		reg = <0x1c000000 0x10000>,
-		      <0x1c040000 0x80000>;
+		      <0x1c040000 0x100000>;
 		interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_LOW>;
 	};
 
-- 
2.53.0

