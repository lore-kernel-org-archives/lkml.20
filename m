Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07A643E7BC6;
	Mon, 14 Sep 2026 17:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789408550; cv=none; b=ltc2hnJwMCu9T1kSpnbCzrpmI9QVVxa8DnHP+LY7hi5hnUSxGoSirzgw1kibHwiCymW/eAoYTXCna58OP0wLJbbz5QaNf/o4mpLZGu+H5QJf5oBzSZrU2IW5pgBBXeTmTHPXRVYP6boZeWOJpaDRMjxb28bROHjntopxSdkDDi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789408550; c=relaxed/simple;
	bh=ygSUwM3kwp/oTV+43XHUdQUTkG4jUJ5/uxMqlrNqeYI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gacppBgMk96212yl3vvXj8LPXUr8d6hTgeFOMYnZCZ4g9tiQbxkgdENL+bvGe/n52f7t53mCC5NwtQWBdvaojUfkdXP2hqCB6/P235ViM97sQk3xtpU1ZQRYxS1OZoROpV7quAeXt35ygUAteWkmJahwMYQHWhhPePl+1Z0WtCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=oa1jHHYO; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="oa1jHHYO"
Received: from francesco-nb.. (xcpe-178-82-167-143.dyn.res.sunrise.net [178.82.167.143])
	by mail11.truemail.it (Postfix) with ESMTPA id 2D5DE1F8BD;
	Mon, 14 Sep 2026 19:55:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1789408545;
	bh=MFHANsOlVjpv8Fp7sgZEgOBC57kTvkzD0gDUZ1FTuIc=; h=From:To:Subject;
	b=oa1jHHYOXKKofnpplpNXWeWcxv0adOqu3Tb0cNDdWUQ4k1Q6XAZ34eXf8va3RF5ut
	 r6YfL73uVfxiWNGT9naACuenHqQlBVnuqTJV/8n7y5+2jNgkTp96R+tKvyjkYiLa7f
	 0nclhloOeV1dNVVkw6qlp78MO8i7bLWzsoZ9jve/8ErT4+iE5H9bozfsl7S0O2kGdW
	 Hihkpv2o5stkJimz8OvjcfrVSL7KZxPRP79wTejJE1AG2+eBY6sxnW8K0VJ/ofEQ+S
	 9g+PFUyRVp9/znMz3PNDii4y7ENTK+gkZtkisvs7pYhEVzzzUZfLGRCgrhj1bGZaIU
	 uuQ2TWa0K26Og==
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
Subject: [PATCH v1] arm64: dts: ti: k3-am62-verdin: add SODIMM_84 gpio-line-name
Date: Mon, 14 Sep 2026 19:55:40 +0200
Message-ID: <20260914175541.11041-1-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Francesco Dolcini <francesco.dolcini@toradex.com>

Add SODIMM_84 gpio-line-name (Verdin SD_1_CD#, used as cd-gpios for sdhci1).

Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 arch/arm64/boot/dts/ti/k3-am62-verdin.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62-verdin.dtsi b/arch/arm64/boot/dts/ti/k3-am62-verdin.dtsi
index 895b1b7dcac7..e65d0e9c0373 100644
--- a/arch/arm64/boot/dts/ti/k3-am62-verdin.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62-verdin.dtsi
@@ -1065,7 +1065,7 @@ &main_gpio1 {
 		"",
 		"",
 		"",
-		"",
+		"SODIMM_84",
 		"SODIMM_17",
 		"SODIMM_155", /* 50 */
 		"",
-- 
2.47.3

