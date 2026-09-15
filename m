Received: from mail.mdapi.ch (mail.mdapi.ch [31.3.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D787839C637;
	Tue, 15 Sep 2026 12:12:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=31.3.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789474353; cv=none; b=mYBdIf8kMpVHZmlTW7Ue2ENw+xeX9r3H/qx8LusVG3i8gLQkb9E7/111lcVuYb3TcSKDbG/N7WPRfUSVd5p61gwsCnCSOzBAK1GasuJ+DGXlg6QvNFJfwQjgNhtgE3ehXUzT+agByg7SxwEmqQipoAGxaMHhRVff5t5bzpA9hvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789474353; c=relaxed/simple;
	bh=y7hTY41aUfVQK1EaUfYpy+/9tFS3eggcocITc2b38Dk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=JAw+opiryJMcGwIzJvArYdHyVzFQJzW+3VdupCzltyGAUWzgOK/xUOCqsX/yx63EA0iTu3Nl70jdTFnGHozWRxEa+dyNfEFwjy5V8PIc0mlgkkvYQK5kQ5Cb1QcKaO67EM1f6dVsfp2wSolDxOHtwRZGjP07KLRWWBYRP2PvkWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tillo.ch; spf=pass smtp.mailfrom=tillo.ch; dkim=pass (2048-bit key) header.d=tillo.ch header.i=@tillo.ch header.b=TFMoI+9f; arc=none smtp.client-ip=31.3.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tillo.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tillo.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tillo.ch header.i=@tillo.ch header.b="TFMoI+9f"
From: Martino Dell'Ambrogio <tillo@tillo.ch>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tillo.ch; s=mail202603;
	t=1789474346;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=crTiarevnQnKIMMV9H7NWGBFcK3peD/bzvBVhBr5ui4=;
	b=TFMoI+9f/IMg/rjhqVMcsjEph0zoixESn9bn4E3w9GZdu4SqRV93qFEfXbW4vym+ARMsoF
	6ro39G2XdYJXQ8MuiUBU8F8HkYQ6U8hDTcyKMqsoQq8CtivPzHao7TqpCNUPoB8Ksxema8
	hARaJqD5FAqj8jAu++rX5sJ7Y1KpoUXJ46puiWkmmuSWocl8aR9dZgUUZn0GHnwuCxRKiQ
	Zqk6QipU1gZQFyU0zE2aLAxPVOgFM9eFNGKm+9K2B8i6VzscRJZ8pJqDM8VGZ46VNf/Atf
	Of4jkuY+5HOCXUksZoj/XY4XQ1NWHTxpqS/x64xBW8wdgro4iW5pHk+QYrDNGw==
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kees@kernel.org,
	tony.luck@intel.com,
	gpiccoli@igalia.com
Subject: [PATCH v5] arm64: dts: mediatek: mt7986a-bananapi-bpi-r3: add ramoops region
Date: Tue, 15 Sep 2026 14:12:26 +0200
Message-ID: <20260915141226.600486-1-tillo@tillo.ch>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Reserve 64 KiB of RAM just below the ARM Trusted Firmware secmon region
(0x42ff0000-0x43000000) for persistent kernel log storage via pstore/ramoops,
allowing post-panic console output and oops dumps to be recovered after a
warm reset. Without it, kernel crash logs on this board are lost when the
SoC reboots.

The zone sizes (record-size=8 KiB, console-size=32 KiB, ftrace-size=8 KiB,
pmsg-size=8 KiB) consume the full 64 KiB carve-out. The requested ecc-size=16
reserves a small Reed-Solomon parity block from each zone's own allocation
in persistent_ram_new(), which lets pstore recover dumps even when the panic
path truncates writes mid-record.

The no-map property is required so the reserved region is kept out of the
kernel linear map. ramoops remaps the carve-out write-combine via
ioremap_wc(); on arm64, leaving the same physical RAM mapped cacheable in
the linear map at the same time is an attribute-mismatch and risks losing
panic data to dirty cache evictions from the linear alias.

The region sits immediately below the ATF block already declared at
0x43000000 in mt7986a.dtsi, so no other reserved-memory child is moved or
resized. BPI-R3 ships with 2 GiB of DRAM starting at 0x40000000, well above
0x43000000, so the region is always within installed memory.

For the carve-out to actually preserve content across a reset, the boot
loader must avoid touching this region on warm reset; on standard BPI-R3
boards with the stock OpenWrt U-Boot fork this already holds.

Signed-off-by: Martino Dell'Ambrogio <tillo@tillo.ch>
---
Changes in v5:
 - Restore this board's own carve-out. v4 carried the BPI-R4 values by
   mistake - 1 MiB at 0x42f00000 with 128/256/64/64 KiB zones - while the
   commit message still described the BPI-R3 layout. That would have reserved
   1 MiB instead of 64 KiB on a 2 GiB board and contradicted its own message.
   Back to 64 KiB at 0x42ff0000 with 8/32/8/8 KiB, as in v3. Thanks to the
   Sashiko review for catching it; entirely my error in regenerating the patch.
 - No other change: the plain reserved-memory node from v4 is kept.

The BPI-R4 patch is unaffected - its values were correct in v4 and it needs no
resend:
https://lore.kernel.org/all/20260915135722.566918-1-tillo@tillo.ch/

v4: https://lore.kernel.org/all/20260915135727.567145-1-tillo@tillo.ch/
v3: https://lore.kernel.org/all/20260915064302.1595204-1-tillo@tillo.ch/
v2: https://lore.kernel.org/all/20260528123655.2650868-1-tillo@tillo.ch/
v1: https://lore.kernel.org/all/20260528093038.1945245-1-tillo@tillo.ch/

 .../boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts   | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts b/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts
index 637e556..70c693f 100644
--- a/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts
+++ b/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts
@@ -140,6 +140,19 @@
 		tx-disable-gpios = <&pio 15 GPIO_ACTIVE_HIGH>;
 		tx-fault-gpios = <&pio 48 GPIO_ACTIVE_HIGH>;
 	};
+
+	reserved-memory {
+		ramoops@42ff0000 {
+			compatible = "ramoops";
+			reg = <0 0x42ff0000 0 0x10000>;
+			no-map;
+			record-size = <0x2000>;
+			console-size = <0x8000>;
+			ftrace-size = <0x2000>;
+			pmsg-size = <0x2000>;
+			ecc-size = <16>;
+		};
+	};
 };
 
 &cpu_thermal {
-- 
2.47.3


