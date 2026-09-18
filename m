Received: from mxout2.routing.net (mxout2.routing.net [134.0.28.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46445384CD5;
	Fri, 18 Sep 2026 14:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.0.28.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789742746; cv=none; b=rlrI8i0f1naBuO0i5tKNrOtsuMMa0y/mQQ74qpxd+OjWMXT6whWxX+Bjm/7nlr3l55dD8sHyRzA9dk3Eu6wtmF8Iz23P/VaZ3/UKDYn0fIPtIaTrf7u5YpNW79COJdCZJZrqxCSt8ANJYgWmBYlHgPZlQ36SiDUo8yMpiGzZIGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789742746; c=relaxed/simple;
	bh=ho6ScU8M7mRs8Tvsb0oKXh8jaDKo+WXbgU+Yk+Xp3qI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=D8tT22jnOBMRYt/KFtuVU2rCOJReFULfZ5XFk9xkcaBuHgtQMoI3LUfyvhcTQvovkN1ksfpDqwzpIOqIBGKfr73QS61YBBnFXMUdoRa0LJQopqIpS0cLubBXT0B1P1xNOThHMY6YL6pn3JSWrr5ILqfKEJA89qLabO8nQQRe++o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fw-web.de; spf=pass smtp.mailfrom=fw-web.de; dkim=pass (1024-bit key) header.d=mailerdienst.de header.i=@mailerdienst.de header.b=DISv0Eq2; arc=none smtp.client-ip=134.0.28.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fw-web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fw-web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mailerdienst.de header.i=@mailerdienst.de header.b="DISv0Eq2"
Received: from mxbulk.masterlogin.de (unknown [192.168.10.85])
	by mxout2.routing.net (Postfix) with ESMTP id 7BE6D6143C;
	Fri, 18 Sep 2026 14:38:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=routing; t=1789742334;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RUEDhthLVuxR2718jDNKdRGiGEMQjCBAe/tRxn/+snQ=;
	b=DISv0Eq2ohtzhZJGzuiCqsNl7e4SYVmhSXbU++jql8NRjDfhxFkELnjmX49hLDpPxRByEF
	ICUTJu4L/5bi44PdZE4m9reQj7D3g+x6jmYXj3G/06b4BhDYkpEh9HkNTySJhOfXItDs4y
	WoSXn6ATyZRZmBJ5aUS7K1EGUGEOh84=
Received: from frank-G5-5590 (fttx-pool-80.245.73.6.bambit.de [80.245.73.6])
	by mxbulk.masterlogin.de (Postfix) with ESMTPSA id 486C31200CB;
	Fri, 18 Sep 2026 14:38:54 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Frank Wunderlich <frank-w@public-files.de>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Linus Walleij <linusw@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 2/2] arm64: dts: mediatek: mt7988a-bpi-r4pro: label gpio-hogs
Date: Fri, 18 Sep 2026 16:38:43 +0200
Message-ID: <20260918143846.30458-3-linux@fw-web.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260918143846.30458-1-linux@fw-web.de>
References: <20260918143846.30458-1-linux@fw-web.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Frank Wunderlich <frank-w@public-files.de>

GPIO hogs were tagged with name "?" in recent kernel versions (7.1+) due to
commit d1d564ec4992 ("gpio: move hogs into GPIO core").

7.0 showed the unit-name which behaviour is restored by patch [1], but
labeling the hog directly makes things easier.

gpiochip0: 84 GPIOs, parent: platform/1001f000.pinctrl, pinctrl_moore:
 gpio-0   (                    |tx-disable          ) in  lo
 gpio-1   (                    |mod-def0            ) in  hi IRQ ACTIVE LOW
 gpio-2   (                    |los                 ) in  hi IRQ
 gpio-12  (                    |cd                  ) in  lo IRQ ACTIVE LOW
 gpio-13  (                    |reset               ) in  hi IRQ ACTIVE LOW
 gpio-14  (                    |WPS                 ) in  hi IRQ ACTIVE LOW
 gpio-21  (                    |tx-disable          ) in  lo
 gpio-63  (                    |?                   ) out hi
 gpio-69  (                    |mod-def0            ) in  hi IRQ ACTIVE LOW
 gpio-70  (                    |los                 ) in  hi IRQ
 gpio-79  (                    |?                   ) out lo
 gpio-82  (                    |PHY reset           ) out hi ACTIVE LOW
 gpio-83  (                    |PHY reset           ) out hi ACTIVE LOW

after the change:

root@bpi-r4:~# cat /sys/kernel/debug/gpio
gpiochip0: 84 GPIOs, parent: platform/1001f000.pinctrl, pinctrl_moore:
 gpio-0   (                    |tx-disable          ) in  lo
 gpio-1   (                    |mod-def0            ) in  hi IRQ ACTIVE LOW
 gpio-2   (                    |los                 ) in  hi IRQ
 gpio-12  (                    |cd                  ) in  lo IRQ ACTIVE LOW
 gpio-13  (                    |reset               ) in  hi IRQ ACTIVE LOW
 gpio-14  (                    |WPS                 ) in  hi IRQ ACTIVE LOW
 gpio-21  (                    |tx-disable          ) in  lo
 gpio-63  (                    |pcie3-cn14-hog      ) out hi
 gpio-69  (                    |mod-def0            ) in  hi IRQ ACTIVE LOW
 gpio-70  (                    |los                 ) in  hi IRQ
 gpio-79  (                    |pcie2-cn15-hog      ) out lo
 gpio-82  (                    |PHY reset           ) out hi ACTIVE LOW
 gpio-83  (                    |PHY reset           ) out hi ACTIVE LOW

[1] https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git/commit/?id=d54a489c8c4b627775445d54a6cbd32f209bda8f
"gpiolib: use of_node_name if line-name is missing"

Fixes: d1d564ec4992 ("gpio: move hogs into GPIO core")
Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
 .../boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-cn13.dtso      | 1 +
 .../boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-cn14.dtso      | 1 +
 .../boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-cn15.dtso      | 1 +
 .../boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-cn18.dtso      | 1 +
 4 files changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-cn13.dtso b/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-cn13.dtso
index 973b76ba0cbf..e9c322df15fc 100644
--- a/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-cn13.dtso
+++ b/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-cn13.dtso
@@ -16,5 +16,6 @@ / {
 };
 
 &{/soc/pinctrl@1001f000/pcie-2-hog} {
+	line-name = "pcie2-cn13-hog";
 	output-high;
 };
diff --git a/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-cn14.dtso b/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-cn14.dtso
index 90b2a64459c3..9d8de737ca40 100644
--- a/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-cn14.dtso
+++ b/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-cn14.dtso
@@ -16,5 +16,6 @@ / {
 };
 
 &{/soc/pinctrl@1001f000/pcie-3-hog} {
+	line-name = "pcie3-cn14-hog";
 	output-high;
 };
diff --git a/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-cn15.dtso b/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-cn15.dtso
index 9750916042de..57ee7dacdd78 100644
--- a/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-cn15.dtso
+++ b/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-cn15.dtso
@@ -16,5 +16,6 @@ / {
 };
 
 &{/soc/pinctrl@1001f000/pcie-2-hog} {
+	line-name = "pcie2-cn15-hog";
 	output-low;
 };
diff --git a/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-cn18.dtso b/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-cn18.dtso
index 9830fb0fd97a..7830980ac95a 100644
--- a/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-cn18.dtso
+++ b/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-cn18.dtso
@@ -16,5 +16,6 @@ / {
 };
 
 &{/soc/pinctrl@1001f000/pcie-3-hog} {
+	line-name = "pcie3-cn18-hog";
 	output-low;
 };
-- 
2.53.0

