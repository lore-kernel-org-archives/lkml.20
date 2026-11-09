Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794195963;
	b=Oec3EqU2iUvSUpW7XxViqQiWxkHP+0Is8qGEbaApJ+pPu1gjUoMEL78QljIuWXgfg03Y
	 9JeVkcfFbsQ7oQDnl4sx3ybxSfNSqEWRp1j0IFREeuObfsnIThD4AZxZWPHo6aghj/mOf
	 h+feWZGYaBkcL798S9A/haZ8UVFtaieWCkh3k8GfZ65LlbDDsaMJm8J7KRqHzLqrEvDSG
	 RRvSnGOhyWXuadPLPPGkp3lDKPT9aoNnUp5e0Rf3Brys+DHiDa4iwpnwJOECGAFRSfUbP
	 3WXSWELqPrUjswDte+IOdEWjAnSF0gQJE3zd4MxqkGWjQS3ejncowo6LkXThMxTvI7A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794195963;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=pJzY35+Iq1WY5o8SwGQBlJsXXYfxvzqCFf4SStexuJ8=;
	b=o/3ZQWRH0+TXVdzAMR55Wa7/a/Wlhsuwr+n2+omnmhl/BhrSloSPmAO7A5EJdBYT8vNZ
	 VDniExAFlbEPb5lTpTQQ4o+Rxl1c5ccmxHQN+koW84CVfM7zuQbmufnmIUnL5TlBA8CRX
	 90J55SMC5Iy30iYTW9xd5bCibYuqz88R+IOF07ewQT/e2ATajKjNQtzkFM29ELYNhUj6u
	 sukcXr3yliPhSmSKt93ALafF0YDz90EHEboZZIrd4szAm7R7LM0X28GaWXdv5x8pu2Aet
	 bfa9ZWc7bgfPxQofGr1TO3/GcshK5GGY7WsJEiWYbs5ju4l0bzgMtoEDGxgtp3Jvvpg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Wm61kTRA;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FCDC606A31C;
	Mon,  9 Nov 2026 03:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Wm61kTRA
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794195962;
	b=JD/C/0ZoKT5fd9yma5QiqbU2D1fGGGhtXcy22Ru8/BTRF1mlDhxPAmwCUPAkcMdD2U4j
	 Raq4m5QqyX/STkgywDZICZ17t/5UbYuchXuQLGQwRNjI4ALriASH8MXNnkTSKqQ664qum
	 kHWQnHtwyfii1lxJ12qEkBcc+Gywgpvpa5xgfPmP8UowJ/YH94ssNIAsdtdoV9+u2UcG1
	 STZ2RpTFpWjm8822xUR0sbHnhJLyToKz2U7TvtTnwLxDBuAHadedvg+D0c6JTA3GZJa+E
	 rM3CNnRv7cxMAJWxzqRDzTEiwhPwl+ZA3lghQVKyEYV8z6kysInYXTS4EHWxok7kW9w==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794195962;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key:X-Endpoint-Received:X-Original-From:Reply-To:
	 Content-Transfer-Encoding;
	bh=pJzY35+Iq1WY5o8SwGQBlJsXXYfxvzqCFf4SStexuJ8=;
	b=qoToWs05at8uPNKmmGuwO0luB77Ru1xEn6kEyDqBnyx8Llm65Byp5zT0jkQZW52x9MHb
	 utix3dQdP9kJRNkq8iSFWXq16ornNg26prGXwAAtoejvoUrRXzU0qlNI8/1V0y4N9gumF
	 e3bdjYc65w8S3YniQXBXZlK84gjieVvUFfwiEQFzVhsyjrIn6Y4Oapq4Cxp2t1Rq8Vlwh
	 0KuHbQ1dIQu5asVhxqEhsvVcVg3DN0DvZ9i02Mmzu5uWNo1tYNBb2fMXD0p/NIXBuiRXp
	 L0R0DXbSQ9e0pE5HOTic8ZX6ylKQtRGmk2H/xVj47J4Zd/XJLnqFK3617DmtP4ryTMg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1FF5E1F0089F;
	Mon,  9 Nov 2026 03:46:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794195962;
	bh=pJzY35+Iq1WY5o8SwGQBlJsXXYfxvzqCFf4SStexuJ8=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=Wm61kTRAVF0xchiB9hWNx6ek03/7njs5z7oVR5BooNuBXeNzMW6nQXa7KQTWHlC37
	 AjJdcjHF25L/gpP8LnLPisRAf0rKNqard3T5cOtjUZ+mjhV9fkOQ4EXMvguYL7270g
	 MmI2pPlhqqoQxNnE2tonekEoL3bhlYJ7COkm1eiv+s5PS+7oa2A80V2+vKbnvJdK8h
	 2jh64skhy40G2NIRiYzmXrxWrW3A87BXSTAwKRvYCaVtaxcMwoBb+XykY6Evk8m7Wt
	 SrP0QxuBAfHMeDH8Y3QxCf9XLNK/W13Y8NTwT40AA6R78nhqotnG50vR7TxWI9f8gb
	 9u2YdY/R7RSow==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 9F7664826E;
	Mon,  9 Nov 2026 03:46:01 +0000 (UTC)
From: Igor Velkov via B4 Relay <devnull+iav.iav.lv@kernel.org>
Date: Mon, 09 Nov 2026 03:45:58 +0000
Subject: [PATCH] arm64: dts: rockchip: Enable SDR104 on the Kobol Helios64
 SD card
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261109-helios64-sd-uhs-v1-1-ef8fc370d282@iav.lv>
X-B4-Tracking: v=1; b=H4sIAPVB8WoC/x3MQQqAIBBA0avErBtIk8iuEi1CxxwIC4cikO6et
 HyL/wsIZSaBqSmQ6WbhI1WotgEX17QRsq8G3elBqc5ipJ0PGQyKxysKWqMNhV4F60ao1Zkp8PM
 f5+V9P9MS6/thAAAA
To: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Igor Velkov <iav@iav.lv>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2313; i=iav@iav.lv;
 h=from:subject:message-id;
 bh=dC7wpDaNbCjkiANOAYK+QKZwUz9weOXO+ehiRLkJWy0=;
 b=owGbwMvMwCVmNH1q96v4SmbG02pJDFkfHX9I/uZ4N0sia0uS55ILh0VNsmYbVFUmHvgnJ2pys
 NVwqu3KjlIWBjEuBlkxRZYJhzRuZSy5+tffw/wBzBxWJpAhDFycAjCRywEM/+OEa00n7HvzzvxX
 oMBxhck7s6OEUn5dXbKXy1lfkGv/tQcM/xRfRk9cMMnGicWyffGChzM+aQk0LZ1Q6dozrYBFImv
 TfSYA
X-Developer-Key: i=iav@iav.lv; a=openpgp;
 fpr=90C228DA68A4D5FD4F4837E03297958BEA5F7903
X-Endpoint-Received: by B4 Relay for iav@iav.lv/default with auth_id=1060
X-Original-From: Igor Velkov <iav@iav.lv>
Reply-To: iav@iav.lv
Content-Transfer-Encoding: 7bit

From: Igor Velkov <iav@iav.lv>

The SD card I/O supply vcc_sdio_s0 can switch between 1.8 V and 3.0 V and
is already described as vqmmc-supply and as the sdmmc I/O domain supply,
but the card only runs in high speed mode.

Allow SDR104. With a SanDisk 32 GB card it runs at 148.5 MHz, and direct
read goes from 23 MB/s to 53-66 MB/s.

Signed-off-by: Igor Velkov <iav@iav.lv>
---
Tested on Helios64 with Linux 7.3, its device tree plus this property,
and the U-Boot and .config of Armbian, PCIe host driver not loaded: 15
warm reboots and 3 cold starts, SDR104 at 148.5 MHz each time, no SD
errors in dmesg, a written file read back with the same checksum. One
card only. Writes stay at about 11 MB/s.

Armbian kernels carry this property with PCIe enabled. In their console
logs tuning sometimes fails when it coincides with the PCIe probe, as on
ROCK Pi 4, and the retry reaches SDR104 every time. The cause is not
confirmed on this board; async probe, applied as
https://lore.kernel.org/r/20261103-rockchip-pcie-async-v1-1-4dcadb94af64@iav.lv
is not tested in this combination.

A normal reboot powers the card off, but after a watchdog reset or a
panic the card stays at 1.8 V. An SPL that does not set the SD I/O domain
from vcc_sdio_s0 then fails to read the card until a power cycle. Armbian's
U-Boot does this (such resets 8 of 8, on Armbian's DTB). The board is not
in mainline U-Boot yet; v2 of
https://lore.kernel.org/r/20261021-b4-helios64-v1-1-74afe8aa6d72@iav.lv
will carry it. Kobol's U-Boot is not checked.
---
 arch/arm64/boot/dts/rockchip/rk3399-kobol-helios64.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-kobol-helios64.dts b/arch/arm64/boot/dts/rockchip/rk3399-kobol-helios64.dts
index f13ea2df7a30..35153e84f206 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-kobol-helios64.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-kobol-helios64.dts
@@ -781,6 +781,7 @@ &sdmmc {
 	disable-wp;
 	pinctrl-names = "default";
 	pinctrl-0 = <&sdmmc_clk &sdmmc_cmd &sdmmc_cd &sdmmc_bus4>;
+	sd-uhs-sdr104;
 	vmmc-supply = <&vcc3v0_sd>;
 	vqmmc-supply = <&vcc_sdio_s0>;
 	status = "okay";

---
base-commit: c3baae5f1a15645cddadcb2b9abddef5df291f59
change-id: 20261109-helios64-sd-uhs-9424ef31f9c8

Best regards,
-- 
Igor Velkov <iav@iav.lv>


