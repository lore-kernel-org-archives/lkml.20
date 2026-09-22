Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E7F5559CB8;
	Tue, 22 Sep 2026 15:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790090769; cv=none; b=lCXRSgptcd4IBkzy5OVDkd6plc/htZeCcRqCjg0jmYWewIIyBabEebtiEhAXWh7WrAlrwiXs1/BIRVnvjuHnUgE40wn9xQA6+x2BHX6nl9uOxb2GKTaJc0T9ChbEa+qBK5OazPpLdL0qrzK4V366HXRlbg6HsKtCy1+vZNXsggY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790090769; c=relaxed/simple;
	bh=oTfs9U3BRL4l76ynRsZIJmwCmZP9WJEbyr9QxJ6pbqo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZzYj0slFgobAbr+reAvLmbA+7WUe4hK+7FcLo83815L1gBAEjH5Vgkf9n5IWLZwi7JAdMEbPHFBLgDRFPa8f41rbfyByaIcETb1QIFAEJpfF88En6SuGde88COo+wIcfCVhdzTJvARzG4IAV3u/s1hrhwLl0ncsFCr3jd5lUWLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=yEC5MUUO; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="yEC5MUUO"
Received: from francesco-nb.. (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 2C01A22B7D;
	Tue, 22 Sep 2026 17:26:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1790090760;
	bh=DNuqR6h7lMBYLpc3OWPx94AN2/jHBwLOhY3RRj1IfnM=; h=From:To:Subject;
	b=yEC5MUUO35xVfwfGxJRYp/5MPkNrbAkfOcOqC7PqKuD0hKjjzJGZFM48z2kiDIdAC
	 MiyuYm1BLdUS5C5l8yGnVY7tArv4j0+EvUUJToCGHCYsfXtwCH/FvuYMymbOf0zZaC
	 zx18+kWiQOPyCGJFCIWevoZ2GZadDFJRhVqz1jb3iwGSr9XkDsBk8+CMym85lGre7l
	 qqcJG3S0pM9lHjAJQkFnorqRz72xf7dIBoNs3iWeTkD+rlO331SfvAvf0Yw56dz0Vc
	 LIthRFoNccp+6TPbCfaWvvttbGatuSOj0q6ym6hvgKrfg2gr1vvJqCbSBJsHqXfwTb
	 GUHkgKeXtG80Q==
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
Subject: [PATCH v1 2/2] arm64: dts: ti: k3-am62-verdin-zinnia: fix main_gpio0/main_gpio1 line names size
Date: Tue, 22 Sep 2026 17:25:49 +0200
Message-ID: <20260922152551.270845-3-francesco@dolcini.it>
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

zinnia redefines gpio-line-names for main_gpio0/main_gpio1, sized
87/88 entries instead of the SoC's actual 92/52 ti,ngpio. Resize both
arrays to match, keeping every existing label at its original index.

Fixes: 4abc2f22e469 ("arm64: dts: ti: k3-am62-verdin: Add Zinnia")
Assisted-by: LLM
Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 .../boot/dts/ti/k3-am62-verdin-zinnia.dtsi    | 41 +++----------------
 1 file changed, 5 insertions(+), 36 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62-verdin-zinnia.dtsi b/arch/arm64/boot/dts/ti/k3-am62-verdin-zinnia.dtsi
index 0ce8357797ed..f399764b05cf 100644
--- a/arch/arm64/boot/dts/ti/k3-am62-verdin-zinnia.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62-verdin-zinnia.dtsi
@@ -274,6 +274,11 @@ &main_gpio0 {
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
 
@@ -330,42 +335,6 @@ &main_gpio1 {
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

