Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66E27397B02;
	Mon, 14 Sep 2026 18:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789410926; cv=none; b=f/7oKn64OfQudRZahxFRNEPGYCzYezqC99yCWwG9IzenSzHbt27no9AYjPTUKOqvyv6NfE6Z+66gCJWouMspcmAioK2pqXqCeXdXr4VMU9K07+XPyHtL9/HB5+0Ni/I5PGkRvYedBPorO/1ZzYZIqz0G3D+6/2dtzqNeidH+St0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789410926; c=relaxed/simple;
	bh=huRi7eyZ8P4rbCqZ5VVeI+gbg3mSFVtOBlNzX/eg5dk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=l7ktPvMWd8OEGREghhdIAPz/pDVsVt0iCtBBG6Vox1bqMaq+riI/4oJacRXygOYdpIY2wHar/srUuQppRjAwunfpsExe3AfDWnYs/1gGlN2IGAmyeA9FNV0VZX3WaEcA5H+V6KuXFLdw6OADqSianugNaCqP1IAiqjDw/AmFFps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=Ek0w6Pd4; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="Ek0w6Pd4"
Received: from francesco-nb.. (xcpe-178-82-167-143.dyn.res.sunrise.net [178.82.167.143])
	by mail11.truemail.it (Postfix) with ESMTPA id 7E0291FEC8;
	Mon, 14 Sep 2026 20:35:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1789410922;
	bh=8R5FilPUkiBmnTtWAelcOCzMoXjc/4kErqArJsMoizQ=; h=From:To:Subject;
	b=Ek0w6Pd4lUc3Msyg2GKRR25cL/Fol52JiCsMJgKHLbzs7Um3iiTq/yp4nBXdGb4/x
	 grL+ucN8Laq6MFBvoOL+sZefCoI8dvP9gs1HDouT1hHH483tGoUCxBlvDz7UB3cgOq
	 jHTYDrJZMPT18cmhk6EZc+uUVbkMFSwJHlY8hSeYr8qPlFIiopzD0mQ9GKf9tQGIRO
	 oZlLOYqSPaAxbdVK1rb4a7pz1sIKF4iQQVWZngVpQQGIh3MLd+WIITcy7a1CLV4VWi
	 UmDN5U9AxYna6i6CdeVNteMl0YL2KxXmoxtKIFm7o5fxE+r0xPnHm3SKpAhHq1diMh
	 sGPDvOwsuwCBQ==
From: Francesco Dolcini <francesco@dolcini.it>
To: Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: ti: k3-am69-aquila: fix AQUILA_B73 gpio-line-names typo
Date: Mon, 14 Sep 2026 20:35:15 +0200
Message-ID: <20260914183516.28865-1-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Francesco Dolcini <francesco.dolcini@toradex.com>

wkup_gpio0's gpio-line-names has "AQUILC_B73" instead of "AQUILA_B73",
inconsistent with every other entry in the array.

Fixes: 39ac6623b1d8 ("arm64: dts: ti: Add Aquila AM69 Support")
Assisted-by: LLM
Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 arch/arm64/boot/dts/ti/k3-am69-aquila.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am69-aquila.dtsi b/arch/arm64/boot/dts/ti/k3-am69-aquila.dtsi
index 5119baf62a4c..b6854acee8fe 100644
--- a/arch/arm64/boot/dts/ti/k3-am69-aquila.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am69-aquila.dtsi
@@ -1573,7 +1573,7 @@ &wkup_gpio0 {
 		"AQUILA_B70",
 		"AQUILA_B71",
 		"AQUILA_B72",
-		"AQUILC_B73",
+		"AQUILA_B73",
 		"AQUILA_B66",
 		"AQUILA_B62",
 		"AQUILA_C21",
-- 
2.47.3

