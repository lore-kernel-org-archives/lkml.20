Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.231.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794813839;
	b=RM07xG4KhcbLXTWlEQmix4tfwPB7ZH2dw6Wz76oIyELDK0Df9+XS95s7U8aijJaKPuCL
	 sgiYvRE9QH/J0+bo1tPvJU8u6KenMEk/P+w032O1qtC0gMoufnxhNmIv6qjqdpoHHf3ZH
	 36K7NPljfemynd0PV5ptlMwRRtOmjcE6Tuc5gA76Y9+407g+mg07DWSx4PtoP2fThk8wh
	 HOMgdoCOKSyAhtKBi1f3vf4LtLhHh6hWF633dDj98AsosVUK/GyQMPaYu06Ok1yF4DSB7
	 w/WuI74IcIcMe7SNTQKuHq7J0PnplOL5DonqeFX8z+WQcP6KkqNTbjCD6vdZ0IbnNJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794813839;
	h=DMARC-Filter:DKIM-Signature:Mime-Version:Received:X-Original-From:
	 References:Content-Transfer-Encoding:To:Cc:From:Message-Id:Subject:
	 Date:In-Reply-To:X-Lms-Return-Path:Content-Type;
	bh=QRE7NUQ5sdjPMwE6psGplHMQBbIdvpY0anedD1hicYs=;
	b=wEmVDggmJ/YbpjhTbJAwZGlqzYJ5TJrksoovkXXMVgypRTl4seGEKLHYkZT9jUzHprcs
	 Ld1R5+itOLJyWFwTJL/JlbnnnQuLewuZnW4hI+I6jKhK2k+F0PNfKNfQPHJdpnT/x3cNv
	 Dt6SL4pJfrzKax1EuL4I7ps/hPA8WNlZfKXCPook6LbRXQ2v8k8CYk9uUNqZ1YvzbGWms
	 4MKHXARopYByv4NkRYq53T9sB0Hk3CqvDQO5uD+krqAm+KKgeIy6XLYQtOq/pPM6MRbf7
	 xuiWQGnrCsuPu9ExebBxFD3TVN/+jvu24UH0fKcHQtfLr4TBa8KmvdxQiMZDIEGfBXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=bedmex.com;
	spf=none smtp.mailfrom=bedmex.com;
	dkim=pass header.d=bedmex-com.20200927.dkim.feishu.cn header.i=@bedmex-com.20200927.dkim.feishu.cn header.a=rsa-sha256 header.s=s1 header.b=T0c6oQom;
	arc=none smtp.remote-ip=209.127.231.47
Received: from va-2-47.ptr.blmpb.com (va-2-47.ptr.blmpb.com [209.127.231.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37412606A898
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 07:23:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 37412606A898
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bedmex.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bedmex.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bedmex-com.20200927.dkim.feishu.cn header.i=@bedmex-com.20200927.dkim.feishu.cn header.a=rsa-sha256 header.s=s1 header.b=T0c6oQom
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=bedmex-com.20200927.dkim.feishu.cn; t=1794813834;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=QRE7NUQ5sdjPMwE6psGplHMQBbIdvpY0anedD1hicYs=;
 b=T0c6oQomxIDBGtAfklaD8Y2a1tYefXOg9e2cO48/NFqOX++lIARMax9HpmPOoK4XhgHIWg
 ZZHfq6L2euGfIKpw+0GC97kBRiDFwmmLH+gtdV1680gm7q4HnqtuewzHIrk/EogGgJgFYd
 vNNPVPIzvrN37zGRQgkMj4as1mUwyR/461fCgobj3433wCIAhE9BioYRrDRttivoAW8bx+
 AiFQUZ+wWmHY+++Hy4Ku9grbKro5K1qqpWknbYCkdKI/V+NGCgk0BBFfIGWraUPd5Z9pE2
 SBCq1B0wSaQg22X/i8odaP6VlOF5MrYgXrc8PCM0f0Oz5Ygd40aq5WDT6OROLw==
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Received: from [127.0.1.1] ([36.141.79.164]) by smtp.feishu.cn with ESMTPS; Mon, 16 Nov 2026 15:23:51 +0800
X-Original-From: Yanli Yang <yanli.yang@bedmex.com>
References: <179481380235.4.7388336477392853157@bedmex.com>
Content-Transfer-Encoding: 7bit
To: <linux-wireless@vger.kernel.org>
Cc: "Johannes Berg" <johannes@sipsolutions.net>, 
	"Rob Herring" <robh@kernel.org>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, 
	"Conor Dooley" <conor+dt@kernel.org>, <devicetree@vger.kernel.org>, 
	<linux-kernel@vger.kernel.org>, "Zhirun Liu" <zhirunliu@aicsemi.com>, 
	"Dijia Xu" <dijiaxu@aicsemi.com>, "Chunqiu Liu" <chunqiuliu@aicsemi.com>, 
	"Liheng Wei" <liheng.wei@bedmex.com>, <yanli.yang@bedmex.com>
From: "Yanli Yang" <yanli.yang@bedmex.com>
Message-Id: <179481380242.4.1693438763870948060@bedmex.com>
Subject: [PATCH wireless-next v5 4/4] wifi: aic: Integrate the AIC8800 SDIO driver
Date: Mon, 16 Nov 2026 15:23:22 +0800
In-Reply-To: <179481380235.4.7388336477392853157@bedmex.com>
X-Lms-Return-Path: <lba+26afaaf88+94e277+vger.kernel.org+yanli.yang@bedmex.com>
Content-Type: text/plain; charset=UTF-8

From: Zhirun Liu <zhirunliu@aicsemi.com>

Connect the AIC vendor directory to the wireless Kconfig and Makefile
so the complete AIC8800D80 and AIC8800D80N FullMAC driver can be selected.

Add the driver maintainers, reviewers and linux-wireless mailing list to
MAINTAINERS. Keep the parent build integration last so that intermediate
patches do not expose an incomplete driver configuration.

Signed-off-by: Chunqiu Liu <chunqiuliu@aicsemi.com>
Signed-off-by: Zhirun Liu <zhirunliu@aicsemi.com>
Signed-off-by: Yanli Yang <yanli.yang@bedmex.com>
---
 MAINTAINERS                   | 10 ++++++++++
 drivers/net/wireless/Kconfig  |  1 +
 drivers/net/wireless/Makefile |  1 +
 3 files changed, 12 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 7336600952c8..4e327fd62b26 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -746,6 +746,16 @@ L:	linux-scsi@vger.kernel.org
 S:	Maintained
 F:	drivers/scsi/aic7xxx/
 
+AIC8800 WIRELESS DRIVER
+M:	Zhirun Liu <zhirunliu@aicsemi.com>
+M:	Dijia Xu <dijiaxu@aicsemi.com>
+M:	Chunqiu Liu <chunqiuliu@aicsemi.com>
+R:	Liheng Wei <liheng.wei@bedmex.com>
+R:	Yanli Yang <yanli.yang@bedmex.com>
+L:	linux-wireless@vger.kernel.org
+S:	Maintained
+F:	drivers/net/wireless/aic/
+
 AIMSLAB FM RADIO RECEIVER DRIVER
 M:	Hans Verkuil <hverkuil@kernel.org>
 L:	linux-media@vger.kernel.org
diff --git a/drivers/net/wireless/Kconfig b/drivers/net/wireless/Kconfig
index f4f969fdbc02..964e633898ca 100644
--- a/drivers/net/wireless/Kconfig
+++ b/drivers/net/wireless/Kconfig
@@ -19,6 +19,7 @@ menuconfig WLAN
 if WLAN
 
 source "drivers/net/wireless/admtek/Kconfig"
+source "drivers/net/wireless/aic/Kconfig"
 source "drivers/net/wireless/ath/Kconfig"
 source "drivers/net/wireless/atmel/Kconfig"
 source "drivers/net/wireless/broadcom/Kconfig"
diff --git a/drivers/net/wireless/Makefile b/drivers/net/wireless/Makefile
index fa3100ff3bf7..47b999e8014c 100644
--- a/drivers/net/wireless/Makefile
+++ b/drivers/net/wireless/Makefile
@@ -4,6 +4,7 @@
 #
 
 obj-$(CONFIG_WLAN_VENDOR_ADMTEK) += admtek/
+obj-$(CONFIG_WLAN_VENDOR_AIC) += aic/
 obj-$(CONFIG_WLAN_VENDOR_ATH) += ath/
 obj-$(CONFIG_WLAN_VENDOR_ATMEL) += atmel/
 obj-$(CONFIG_WLAN_VENDOR_BROADCOM) += broadcom/
