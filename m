Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59A1051A159;
	Tue, 29 Sep 2026 10:41:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790678508; cv=none; b=KizajUSLLCPiqRmWeqqJ5YMM7bQp20MhvTVPKqlpwA0NuZAJqZZpE4NH+o9znTyzZxZJAtlZZ4e+4v5dCN6coTPTdtV/K+QwtOFEXhfMd7i7Q8TizQHoPeDNXVzj66DZkC2bhAQHq0nZe7xypeuT3niXsJ3s/1UYLVZCEzrD9jw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790678508; c=relaxed/simple;
	bh=ohVyGXhCgnwro20BvSE8QCBmsQ9YPbHoyspNgd1/HEQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WXy+MT1AqXHLw12CBkKp6p9KbO2Nz9++ch63kxs9jwM0pMUSrqt3dHYA0RYCOjpJ6hQL8kvRyGjtGWkag+3KL1307zq7GmH4uz7G/JAcCE/xXtjs0Un5Bq9DDALTAQ9+YEZI8Mzbtft38uvkNlZcls/3vwGQpttOo9xk8ATATb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CEpQQkYc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CEpQQkYc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BB2F1F000FF;
	Tue, 29 Sep 2026 10:41:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790678496;
	bh=dQn31xHbq0L/9f4jn80/zqGrFsjkBvOVj0bPXPL+JB4=;
	h=From:To:Cc:Subject:Date;
	b=CEpQQkYcXpf4Al1gCu4YnQPRD9UCvXY5TgZ1aWo6kmUw8yiOc/SwKXY2CXsa49Yv/
	 ofAWhYmIQ7Mz8IpgJ1umyoL+LHVa3H1pOgkU7LweHrF0H89nEYchf5JaN0AHm/CuWx
	 cJaA5SETCedj9UYBZYqdvm6EFh7w0C+XWLDgXddknD9Vt1DeksdhvzktMpcVyqEQ5E
	 +xFnciBMlAFL1sqsKimT/gzlOdZgu/bODyopj8NJv4JKzvVz4ZPVJeZblskE9DhTrQ
	 kdvL/r6OvljsRhOQ+DM1hkCyv50gYG+lZ5Q54t7nVPEtEddjaoLv4b053KSTU5xJwX
	 gjnzxPe79s0Pg==
From: Arnd Bergmann <arnd@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Monish Chunara <monish.chunara@oss.qualcomm.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Abel Vesa <abelvesa@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
	Imran Shaik <imran.shaik@oss.qualcomm.com>,
	Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
	Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
	Jie Gan <jie.gan@oss.qualcomm.com>,
	Xueyao An <xueyao.an@oss.qualcomm.com>,
	Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: qcom: shikra: fix sdhc interrupts property
Date: Tue, 29 Sep 2026 12:41:12 +0200
Message-ID: <20260929104127.3156764-1-arnd@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

The gicv3 on this chip uses a 4-cell interrupt specifier, which
includes the affinity, but the newly added mmc node uses the
3-cell format:

arch/arm64/boot/dts/qcom/shikra.dtsi:4151.4-27: Warning (interrupts_property): /soc@0/mmc@4784000:#interrupt-cells: size is (24), expected multiple of 16

Add a zero affinity, same as for the other I/O devices on this chip.

Fixes: c8e3d40457f1 ("arm64: dts: qcom: shikra: Add SD Card support")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index 9823c591b02b..1814ab33e236 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -1470,8 +1470,8 @@ sdhc_2: mmc@4784000 {
 			compatible = "qcom,shikra-sdhci", "qcom,sdhci-msm-v5";
 			reg = <0x0 0x04784000 0x0 0x1000>;
 
-			interrupts = <GIC_SPI 350 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 353 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <GIC_SPI 350 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 353 IRQ_TYPE_LEVEL_HIGH 0>;
 			interrupt-names = "hc_irq",
 					  "pwr_irq";
 
-- 
2.53.0

