Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.231.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794906600;
	b=kanNHSMKlor42aXUqulbTW69dPxjN0VcPhirI6TCOgB0u3ZiHS8v1bwv2z2ye8KfHM1U
	 Gc9dWC2b/6ISeakSdmTUdsoGuN62b1Gj4DcA1kvfGoD/kpeDkX1YKmzbZi0vrw8h763RU
	 oCls8uW7z4yOEGG6n5su6WykQjLd+W7NCaXyAmR40GyE7XF4Glce3nQK11Qj0/IdqQJPB
	 6KK/HmKD+l1sm7G8/q/r1kjwco2m5kRHfI8+w9pxRkkGavUqyN9bbVz38k79Yw/Sy9uTv
	 r7CV6i+LeVJjnImie8D/rc72RrYiLgV3alh2tly7JjRZE1Ged7f8OGls68mEDHPaGnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794906600;
	h=DMARC-Filter:DKIM-Signature:Received:X-Mailer:To:Subject:From:
	 Content-Transfer-Encoding:In-Reply-To:X-Lms-Return-Path:Content-Type:
	 Cc:Date:X-Original-From:References:Message-Id:Mime-Version;
	bh=fHUvMEx0c2bPwIe6HR6SirI4dIsRD6+ZIL2vDk7n8vU=;
	b=sric9oPDs8QPH1obSdrq5fXJ72YZ4PLiIT9k/waac9hh6oWstSvCnuMt599hpcE40nUK
	 6Ho3+HwEKfKI3NIsyc+x5iNxdBbhMDCb5VnKHoT/bTPQoajIDqOSQslM3r6wwOG+B7Ome
	 0Atjsk29ysh+H9G1QbhFXNXlqGeYbaZT1EPuc+6YpnS773upGjpHPX2TKiNFF1pEZR/XW
	 qN7Ew1DmvoXxAyG4LV9RfVph30f1dD/Haf8bn9+DpUiNVZGaoN6IRBcQoiSv1Sdp4a64R
	 ICYlRM+sD7G/PeCP0D5FhpyVUo7lXDFXHwQBTFbTDKbszCuKldYFPGR++V6I8ysvRaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.cipunited.com;
	spf=pass smtp.mailfrom=oss.cipunited.com;
	dkim=pass header.d=oss.cipunited.com header.i=@oss.cipunited.com header.a=rsa-sha256 header.s=feishu2303200042 header.b=Bz5M+yCj;
	arc=none smtp.remote-ip=209.127.231.48
Received: from va-2-48.ptr.blmpb.com (va-2-48.ptr.blmpb.com [209.127.231.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FC8E606A329
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 09:10:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5FC8E606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.cipunited.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.cipunited.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oss.cipunited.com header.i=@oss.cipunited.com header.a=rsa-sha256 header.s=feishu2303200042 header.b=Bz5M+yCj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=feishu2303200042; d=oss.cipunited.com; t=1794906589;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=fHUvMEx0c2bPwIe6HR6SirI4dIsRD6+ZIL2vDk7n8vU=;
 b=Bz5M+yCjaZHYlYGXLDxrUU2jdQtZu+AEPN0Wy63wmZLy1noGcRBH7FE7CK0iCV6bPEg7Jb
 deyS3Z3xPdgUO5tRR/tnMiX+AVyGMb1Kk9DwANH74ySmpOPR3hme31qYvtwmmxhrm6uJH+
 18BQxyIgL+zMv77uEG3Bbz3suMlYuzarFHtkAF023da5FTnn6QWWdkEMwKQbTtt7k3UtDk
 hFjuJ7/P1RNgiujUi46npsb7RMgAAeCBjKqYO4VmV6/eyOFsRmZpcnuiNx+C3hRxlXy01i
 b9ZhgaJKonSNTNZSqvDX+gxw0Vfs7Q3kdIr2F6NNcj0uOtVEviXdN/bCfguBHQ==
Received: from [127.0.1.1] ([171.15.157.139]) by smtp.feishu.cn with ESMTPS; Tue, 17 Nov 2026 17:09:46 +0800
X-Mailer: b4 0.17-dev-ce4c1
To: "Keguang Zhang" <keguang.zhang@gmail.com>, 
	"Wim Van Sebroeck" <wim@linux-watchdog.org>, 
	"Guenter Roeck" <linux@roeck-us.net>, "Rob Herring" <robh@kernel.org>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, 
	"Conor Dooley" <conor+dt@kernel.org>, 
	"Thomas Bogendoerfer" <tsbogend@alpha.franken.de>
Subject: [PATCH v3 6/7] MIPS: Loongson64: dts: ls7a-pch: Add watchdog node
From: "Rong Zhang" <rongrong@oss.cipunited.com>
Content-Transfer-Encoding: 7bit
In-Reply-To: <20261117-mips-ls7a-wdt-v3-0-2e88f7e1d6c5@oss.cipunited.com>
X-Lms-Return-Path: <lba+26afc19db+585bf3+vger.kernel.org+rongrong@oss.cipunited.com>
Content-Type: text/plain; charset=UTF-8
Cc: "Rong Zhang" <i@rong.moe>, "Yao Zi" <me@ziyao.cc>, 
	"Icenowy Zheng" <uwu@icenowy.me>, 
	"Jiaxun Yang" <jiaxun.yang@flygoat.com>, <linux-mips@vger.kernel.org>, 
	<linux-watchdog@vger.kernel.org>, <devicetree@vger.kernel.org>, 
	<linux-kernel@vger.kernel.org>, 
	"Rong Zhang" <rongrong@oss.cipunited.com>
Date: Tue, 17 Nov 2026 17:06:48 +0800
X-Original-From: Rong Zhang <rongrong@oss.cipunited.com>
References: <20261117-mips-ls7a-wdt-v3-0-2e88f7e1d6c5@oss.cipunited.com>
Message-Id: <20261117-mips-ls7a-wdt-v3-6-2e88f7e1d6c5@oss.cipunited.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0

The Loongson-7A has a watchdog compatible with the one on Loongson
2K0300.

Add a watchdog node with appropriate compatible strings to wire it up.

Tested on Loongson-LS3A4000-7A1000-NUC-SE and Lenovo KaiTian M530Z.

Signed-off-by: Rong Zhang <rongrong@oss.cipunited.com>
---
 arch/mips/boot/dts/loongson/ls7a-pch.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/mips/boot/dts/loongson/ls7a-pch.dtsi b/arch/mips/boot/dts/loongson/ls7a-pch.dtsi
index 1793109281c7..dfc91e49ea77 100644
--- a/arch/mips/boot/dts/loongson/ls7a-pch.dtsi
+++ b/arch/mips/boot/dts/loongson/ls7a-pch.dtsi
@@ -74,6 +74,12 @@ ls7a_uart3: serial@10080300 {
 			no-loopback-test;
 		};
 
+		watchdog: watchdog@100d0030 {
+			compatible = "loongson,ls7a-wdt", "loongson,ls2k0300-wdt";
+			reg = <0x0 0x100d0030 0x0 0xc>;
+			clocks = <&pch_misc_clk>;
+		};
+
 		rtc0: rtc@100d0100 {
 			compatible = "loongson,ls7a-rtc";
 			reg = <0x0 0x100d0100 0x0 0x78>;

-- 
2.55.0
