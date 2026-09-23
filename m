Received: from mta0.migadu.com (out-165.mta0.migadu.com [91.218.175.165])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A5F247533E
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 21:36:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.165
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790199377; cv=none; b=Pn3WDxPgLCLvuw/20npAk8HpcQ3+82JCzlHWswy/XsmkxewM4fzHd+MX5dG2sVboVoauySLKz1V7zbUi7jeRfLRhDfz3F8f7cDaTs76+488RH9iQKrbJ01njA85alCAQ6i6IM5zrmU7YtDKkR4jlG8OMCC2DpOGoWDVVjtJWigY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790199377; c=relaxed/simple;
	bh=Ca5BbrAJIBa3O09AXU0PUuW4/9AxSHHQmz5hoAQr6OY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fiApJOMgw0yXrP4c4xWHLdEhyue9+Klz7t/x2Nc/2Fmsz0HqPKK1AIUlgR/s/UZORU+2XBfktorcpi0wlmTHfcL4F1MpGycUmfpnwRRw/hUxizbSxLz+3R4dWKPbzfkrSwUXCbPhr1qkLXHw4RBQIxeLUnALLxPkkvLO/G9j3Ro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=fAktFKbn; arc=none smtp.client-ip=91.218.175.165
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="fAktFKbn"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=Ca5BbrAJIBa3O09AXU0PUuW4/9AxSHHQmz5hoAQr6OY=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790199371; v=1; x=1790804171;
 b=fAktFKbnQX44oBbXq/AiOR2P9auuTjZBUWLiZk24IUD+yRmDKgZwcGC2VazBZQwEe4Eiq587
 El0qq+pmNtmaBQlZVK0NWu0BY8fmJuOhKRxdNaHKQJbHk34DGa/wE6ssy35CWg1qyYYXFJpbRno
 RoOKtVIaJO2ZeR1fJks9Hth8=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id a4c98a9833c222a9;
	Wed, 23 Sep 2026 21:36:11 +0000
X-Mizu-Trace-ID: a4c98a9833c222a9
X-Migadu-Flow: FLOW_OUT
From: Luka Gejak <luka.gejak@linux.dev>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>,
	Peter Robinson <pbrobinson@gmail.com>,
	Bitterblue Smith <rtl8821cerfe2@gmail.com>,
	Luka Gejak <luka.gejak@linux.dev>
Subject: [PATCH v4 5/6] wifi: rtw88: 8723bs: enable building the RTL8723BS driver
Date: Wed, 23 Sep 2026 23:35:56 +0200
Message-ID: <20260923213557.186205-6-luka.gejak@linux.dev>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260923213557.186205-1-luka.gejak@linux.dev>
References: <20260923213557.186205-1-luka.gejak@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Now that the chip support, firmware interface, coexistence, power
management and the SDIO transfer and association paths are all in place,
add the Kconfig symbols and Makefile rules that build the RTL8723B chip
module and the RTL8723BS SDIO front end.

Signed-off-by: Luka Gejak <luka.gejak@linux.dev>
---
 drivers/net/wireless/realtek/rtw88/Kconfig  | 18 ++++++++++++++++++
 drivers/net/wireless/realtek/rtw88/Makefile |  6 ++++++
 2 files changed, 24 insertions(+)

diff --git a/drivers/net/wireless/realtek/rtw88/Kconfig b/drivers/net/wireless/realtek/rtw88/Kconfig
index 3736f290bd42..e1f40d6785e6 100644
--- a/drivers/net/wireless/realtek/rtw88/Kconfig
+++ b/drivers/net/wireless/realtek/rtw88/Kconfig
@@ -36,6 +36,10 @@ config RTW88_8703B
 	tristate
 	select RTW88_8723X
 
+config RTW88_8723B
+	tristate
+	select RTW88_8723X
+
 config RTW88_8723D
 	tristate
 	select RTW88_8723X
@@ -159,6 +163,20 @@ config RTW88_8723CS
 
 	  If you choose to build a module, it'll be called rtw88_8723cs.
 
+config RTW88_8723BS
+	tristate "Realtek 8723BS SDIO wireless network adapter"
+	depends on MMC
+	select RTW88_CORE
+	select RTW88_SDIO
+	select RTW88_8723B
+	help
+	  Select this option to enable support for 8723BS chipset
+
+	  This module adds support for the 8723BS 802.11n SDIO
+	  wireless network adapter.
+
+	  If you choose to build a module, it'll be called rtw88_8723bs.
+
 config RTW88_8723DU
 	tristate "Realtek 8723DU USB wireless network adapter"
 	depends on USB
diff --git a/drivers/net/wireless/realtek/rtw88/Makefile b/drivers/net/wireless/realtek/rtw88/Makefile
index 0b3da05a2938..6889b3796449 100644
--- a/drivers/net/wireless/realtek/rtw88/Makefile
+++ b/drivers/net/wireless/realtek/rtw88/Makefile
@@ -55,6 +55,12 @@ rtw88_8703b-objs		:= rtw8703b.o rtw8703b_tables.o
 obj-$(CONFIG_RTW88_8723CS)	+= rtw88_8723cs.o
 rtw88_8723cs-objs		:= rtw8723cs.o
 
+obj-$(CONFIG_RTW88_8723B)	+= rtw88_8723b.o
+rtw88_8723b-objs		:= rtw8723b.o rtw8723b_table.o
+
+obj-$(CONFIG_RTW88_8723BS)	+= rtw88_8723bs.o
+rtw88_8723bs-objs		:= rtw8723bs.o
+
 obj-$(CONFIG_RTW88_8723D)	+= rtw88_8723d.o
 rtw88_8723d-objs		:= rtw8723d.o rtw8723d_table.o
 
-- 
2.55.0

