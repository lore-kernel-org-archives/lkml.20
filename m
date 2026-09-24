Received: from mail-ed2-f35.google.com (mail-ed2-f35.google.com [74.125.228.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 946A43E49EC
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 07:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790234100; cv=none; b=ex1vZHiADKoUhe0ZJBmnYACgwKFUzzja7nfamTduARW85hsrJolyWxIwDv22kUNRCWN8Dmr3Z+lWgV+2O6xkCqN14GY4L/6v9LQ5yTiyS0/EvmTDgkQCl7CYHRxYw85YJOBTt0M5HwuVVvPBqF0sHIgWj890VoetsDYqa6ct7Kw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790234100; c=relaxed/simple;
	bh=U1Z6kjsMVIbbbRSSBlT8V0uTPKeoPfC6ZhdfOLN5uW0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bUymXQfGJbjyyjyLvRMSGoZSmgFeczTqF3KWSbfzx5XLMCE47Ey2/2pgSE2PnzxF4svkAXfpZzTYicDuE1Im+7UENU7w0DpL42xtvrjiKzyPpHDYkPgmkqtLYjhI9eDzDtAPbSmtvuPZFEKALP3bOAl3NREnBA+WuPVgqLc4nD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wermuth.pl; spf=fail smtp.mailfrom=wermuth.pl; dkim=pass (2048-bit key) header.d=wermuth-pl.20251104.gappssmtp.com header.i=@wermuth-pl.20251104.gappssmtp.com header.b=bnOWYsid; arc=none smtp.client-ip=74.125.228.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wermuth.pl
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=wermuth.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wermuth-pl.20251104.gappssmtp.com header.i=@wermuth-pl.20251104.gappssmtp.com header.b="bnOWYsid"
Received: by mail-ed2-f35.google.com with SMTP id 4fb4d7f45d1cf-6aa1d00daaaso2868876a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 00:14:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wermuth-pl.20251104.gappssmtp.com; s=20251104; t=1790234092; x=1790838892; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W/q4IHYKCy6ATe5C6R4o2zyKGD60s2UPYSeHPBkDVEs=;
        b=bnOWYsidpe7xcw9Oe4mvJ75tR8m7UZt09lWMnVpb3C2BFx4V6szCbUQG1cpL0cvDz8
         VBAEMyNl9awcfhiNAC3ORD/oBwOGOjVhb+X7UsuSRtc64m/QvAXd88MKjPrfOrlus1uP
         6I5hfloudEjOrEyo52yCNjosVUVk1FguWI48ifALKHQsaNkvp/P8BB+kHslLq5nSNgno
         zKguWvBRCLZ/JYM+OUqdm710LG3YDfphlkZtLBcmcH0K5D2AuSOuqctPoHHJDq/JTmHf
         Kr10+4Op2dllW4WatMFouVM1YWFzVU7g5mdrlaQ0B3MYrUNeMkMfG27767xQrKw6Qhwn
         yJWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790234092; x=1790838892;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=W/q4IHYKCy6ATe5C6R4o2zyKGD60s2UPYSeHPBkDVEs=;
        b=AjWkoRm3Yv5ZScM8oSVl/yfgV8bqBZT4rOIFtlVpq8WwqgkLiCtY7zdBPuT8DeQMy+
         1EfpbKqjHWkV1eYMh7fOfYSnSKFH2L8Xoa+8VsZh7KkMRx7sEHSwxHMvT8XMaWrlD3/3
         ke+Tpvb0NokqPhxEQSxrmTEV30NtlOOOTGNXvDwHTp5ZeZojj912B01D5rhL4WIVkUR5
         sCwIRpO6O01COzyNTOyXqUcJaMhNf8dYRAjyW0XBPxvjqaSbZ0j2OEzkuc61MJ47e50Z
         Uabw6PXU+eReDakNMcvNX3jU9Ix8NAO3NfVAoQzNUqjNFA1PjwtXdEhNt2gZTEgeLXEH
         1syA==
X-Forwarded-Encrypted: i=1; AKwUvBymrOfvX5/0ffD+MSX0fl2Vx1SK1HTQBORe+ztllZjJJ3a99jDS/XqJDaTcrqIC+62GEcrW9AhRyMUQfms=@vger.kernel.org
X-Gm-Message-State: AFuF++n4PcZFNA/1ygBCY8/h5r2E2AA+i97WEyynZv7gi+lTDNTgvu/x
	cRUccXaEU2ChUnloO8Pa61SfYIgHNniMBLIZwE1L8GfCSO0tg+nSvXq2hg+4dYM8DJM=
X-Gm-Gg: AYBFou0+EThSyfUgj58JYmT91FdF7KSD9g61+wN4H3/K6RWydThiEexjpt5VAESLT1a
	vmbKjSsdzYOp7Qf/Dbq1wSh9j4Tyaw9qzClZzum0pri9G7+WsDUktiUdzejmmIbJgWR/cD1zSNf
	+lKVfI3f+k5fiQ3t96k4N8ehod+eLoguwMr5IixQtVnxIO8FfLditFSq5gNWZGf3168dhEOzKlf
	pSG0y2fYVsNvVUpf8LSoDXt/Cruq5CEuP/SOblyXO5+980gB0xjdfZNtMrpFxGZYO/VPZWW+D6Y
	S/UayeUNRdekGQunZ9KNmi8fFzurXIU0GGRG5eNKk317Wfwua8XkBod8bOSxyoYo6UBJmjqOO5R
	Hqwp/SbKHxCrlRLlrrG9jpDqjctxmy6ytZpNb57nuuyDBObVgVa1XzKdEnKcND6Nb8kX0rvSad5
	rBK3B9S9u2WE+Dw5tqKaIpimNTXy/EjzOlmhEg7pAfRaWmdo2+wtVDdWgLORzZohLPCxN14IWdq
	2E98vPHEnlGycAOkmxaHNNWE73rhOHfKQ33bFO/iKgWgOU=
X-Received: by 2002:a05:6402:5385:b0:6aa:aaf2:f6a0 with SMTP id 4fb4d7f45d1cf-6aac8ecf65bmr1299955a12.1.1790234091341;
        Thu, 24 Sep 2026 00:14:51 -0700 (PDT)
Received: from janlin-02.home.wermuth.pl (109-206-198-27.host.skynet.net.pl. [109.206.198.27])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aab38a9756sm3306589a12.25.2026.09.24.00.14.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 00:14:50 -0700 (PDT)
From: Adam Wermuth <adam@wermuth.pl>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Adam Wermuth <adam@wermuth.pl>
Subject: [PATCH 1/3] arm64: dts: rockchip: Enable USB 2.0 host1 on Radxa ROCK 3B
Date: Thu, 24 Sep 2026 09:14:43 +0200
Message-ID: <20260924071445.441822-2-adam@wermuth.pl>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260924071445.441822-1-adam@wermuth.pl>
References: <20260924071445.441822-1-adam@wermuth.pl>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The USB 2.0 data lines of the M.2 B-key slot are routed to USB2_HOST3,
which is served by usb_host1_ehci/ohci through the host port of
usb2phy1. Enable the controllers and the PHY port so that modules in
the B-key slot, such as LTE modems, can enumerate.

Signed-off-by: Adam Wermuth <adam@wermuth.pl>
---
 arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts b/arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts
index 149a5306bb03..ad9a91c0d0d0 100644
--- a/arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts
@@ -758,6 +758,14 @@ &usb_host0_xhci {
 	status = "okay";
 };
 
+&usb_host1_ehci {
+	status = "okay";
+};
+
+&usb_host1_ohci {
+	status = "okay";
+};
+
 &usb_host1_xhci {
 	status = "okay";
 };
@@ -780,6 +788,11 @@ &usb2phy1 {
 	status = "okay";
 };
 
+&usb2phy1_host {
+	phy-supply = <&vcc5v0_usb_host>;
+	status = "okay";
+};
+
 &usb2phy1_otg {
 	phy-supply = <&vcc5v0_usb_host>;
 	status = "okay";
-- 
2.43.0

