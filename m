Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6E5F38AC72;
	Tue, 22 Sep 2026 15:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790090767; cv=none; b=G4BhcVBHzzpZmy8adc32t8khwmUvR10juufMxDTVs78Mtfn5d0d/wjAhNpoJ4+Dodb2XjxHGtPqDWoFJnRwMYXSqyHVE+U+PFGBHWeiVymUmsy5uLRl1FHT+FoJj55Tn47w7W/q44zMq8tWjO2QjuthxwM2Gg3ZCJYK0CoIT/RA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790090767; c=relaxed/simple;
	bh=57SNkfKu4gZmSj7badp1rQxpoRMIOyz60/StL7VmFdk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=htcexs+Ve9lXj7Jn4uuhOZf/H0x8AxMFUOfRP/5h2BpuS+cwbDWIx9HfkDvzxswrVrj0tY1lXg87Xqfn3il7g0wIyTq97cQ6ExVKpxz9KheWlqd3nsVcMTsFhKSoaEBbWUrPx3n+BvaGA3lhF4gicofzasWZho9aZsEbed4ObUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=JpVr9wYC; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="JpVr9wYC"
Received: from francesco-nb.. (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 89D9E22B6F;
	Tue, 22 Sep 2026 17:25:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1790090760;
	bh=6vfK8cCET6M/6AUILdbY6s5+8qRAvPa/xd7rw7DfimU=; h=From:To:Subject;
	b=JpVr9wYCWEWr+WEd+YgP7vsAb3N63fOsXtRXKNvhuvO6l5F8w7x0AIutY7zwo+4s4
	 +T3fCg4mo+aHPQlnddQwlGBIiZL4XoDPirZeivmNnLMyjWuZZuZ5uTlNCNMsHN5QAo
	 Qd6Yp/ojG6SLaZyTPMAkhVuT/qCe6vhfCxCgjdI1QEC8iud5H0whm5rRYDOnXjkSZT
	 cYQhFet8JPbPF82x53o5R9cauRzv8w/dwrjbtpuh3Np7aXckpx9UfAmaU7su38iXZB
	 iCO0SJ9cSgBQzEEdEjOMW5UJM8n5631Y8f2bL22FP2kU6SwW8l87o39xP5x86HAmB8
	 TbeRRxApny2lQ==
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
Subject: [PATCH v1 1/2] arm64: dts: ti: k3-am62-verdin-ivy: fix main_gpio0/main_gpio1 line names size
Date: Tue, 22 Sep 2026 17:25:48 +0200
Message-ID: <20260922152551.270845-2-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260922152551.270845-1-francesco@dolcini.it>
References: <20260922152551.270845-1-francesco@dolcini.it>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Francesco Dolcini <francesco.dolcini@toradex.com>

ivy redefines gpio-line-names for main_gpio0/main_gpio1, sized 87/88
entries instead of the SoC's actual 92/52 ti,ngpio. Resize both
arrays to match, keeping every existing label at its original index.

Fixes: 881f5e9d8082 ("arm64: dts: ti: k3-am62-verdin: Add Ivy carrier board")
Assisted-by: LLM
Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 .../arm64/boot/dts/ti/k3-am62-verdin-ivy.dtsi | 41 +++----------------
 1 file changed, 5 insertions(+), 36 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62-verdin-ivy.dtsi b/arch/arm64/boot/dts/ti/k3-am62-verdin-ivy.dtsi
index 844f59f772e1..c99076109a9b 100644
--- a/arch/arm64/boot/dts/ti/k3-am62-verdin-ivy.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62-verdin-ivy.dtsi
@@ -367,6 +367,11 @@ &main_gpio0 {
 		"",
 		"",
 		"",
+		"",
+		"",
+		"",
+		"",
+		"", /* 90 */
 		"";
 };
 
@@ -425,42 +430,6 @@ &main_gpio1 {
 		"",
 		"",
 		"", /* 50 */
-		"",
-		"",
-		"",
-		"",
-		"",
-		"",
-		"",
-		"",
-		"",
-		"", /* 60 */
-		"",
-		"",
-		"",
-		"",
-		"",
-		"",
-		"",
-		"",
-		"",
-		"", /* 70 */
-		"",
-		"",
-		"",
-		"",
-		"",
-		"",
-		"",
-		"",
-		"",
-		"", /* 80 */
-		"",
-		"",
-		"",
-		"",
-		"",
-		"",
 		"";
 };
 
-- 
2.47.3

