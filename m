Received: from mail.mdapi.ch (mail.mdapi.ch [31.3.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 979BA3D5674;
	Tue, 15 Sep 2026 04:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=31.3.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789447882; cv=none; b=UKokUREch0/e4Umj2rMk7rqta7Qfnopjc1fwvjGJ1VWgriTr1WZ2rmroalnM3TMeLcOGXUUUNjwqzKoOZ7a0szfv/aHchT7rIPCEEcLJSFIoqC12lqNxJLDo8TAfBWGDo3EjfsTXEwD36Wn4kuHrQgxovocq1aGINllY+eI2N2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789447882; c=relaxed/simple;
	bh=N+KotH2yB55vdYwI+QGG/lbvALP+prQ+U+1wCL+IJrQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=rox5edX5UKBeDHMGm+mSCeMrbMBV226fajo1U9rO4VbBBLgT0WaLxDT/izwdFsqjoq8ezgScuB4eO3NzlpDBFMyD8EkvP4UrB/+maxApRfndpuu0vGvxmoMDxgocWPmnrVJrzYNItCTfk+xdjJDtnwuwDOnm7y9Lev5D+KSnguw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tillo.ch; spf=pass smtp.mailfrom=tillo.ch; dkim=pass (2048-bit key) header.d=tillo.ch header.i=@tillo.ch header.b=OuSbTTxe; arc=none smtp.client-ip=31.3.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tillo.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tillo.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tillo.ch header.i=@tillo.ch header.b="OuSbTTxe"
From: Martino Dell'Ambrogio <tillo@tillo.ch>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tillo.ch; s=mail202603;
	t=1789447383;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=R17raKv3A7dRbP0Z0IS8IcCAkKFbNj8l0X/n53cwErk=;
	b=OuSbTTxeQeoVaSq50k3p04BeRq+7cMcJ0MvPJa0qOXiCzU3MJVtd+1bfodzWQfmfQqSjqY
	qyvXMojZFVSTC2VhK2xjejCpSE8wi5tEA3yrGa3jTzqc2bv2YHNyXjKJe0prFuibH0Gc1o
	XoPH8gpNaxsEZfVhCxbEipAishcwGSS2iqNv9wvrNZgzBJQlEDzIA8AzJvATBc2m4EyVEp
	M0aQhmfexP4p46trWHu9WZW+R6jqGMGsjRZa6Yc06rTuqjJBfMBZV2ZwEWkeYyWJS/z+Eb
	zRBupS6VDq0EnaFl/RL4l30rY6daSiSGAlhS1Y8D7/DTYuraPrjfsQFlQFScWw==
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kees@kernel.org,
	tony.luck@intel.com,
	gpiccoli@igalia.com
Subject: [PATCH v3] arm64: dts: mediatek: mt7986a-bananapi-bpi-r3: add ramoops region
Date: Tue, 15 Sep 2026 06:43:02 +0200
Message-ID: <20260915064302.1595204-1-tillo@tillo.ch>
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
Changes in v3:
 - Resend; no functional change. Rebased on v7.3-rc3, where the v2 diff
   still applies unmodified.
 - v2 drew no review comments. It was also sent, in error, as a reply to
   the BPI-R4 patch's thread rather than its own, so it is likely to have
   been read as a duplicate of that board's patch. This version starts a
   fresh thread to avoid repeating that.

The matching BPI-R4 (mt7988a) patch is being resent as v3 at the same time.

v2: https://lore.kernel.org/all/20260528123655.2650868-1-tillo@tillo.ch/
v1: https://lore.kernel.org/all/20260528093038.1945245-1-tillo@tillo.ch/

 .../boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts   | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts b/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts
index 637e556..322a12d 100644
--- a/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts
+++ b/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts
@@ -142,6 +142,19 @@
 	};
 };
 
+&{/reserved-memory} {
+	ramoops@42ff0000 {
+		compatible = "ramoops";
+		reg = <0 0x42ff0000 0 0x10000>;
+		no-map;
+		record-size = <0x2000>;
+		console-size = <0x8000>;
+		ftrace-size = <0x2000>;
+		pmsg-size = <0x2000>;
+		ecc-size = <16>;
+	};
+};
+
 &cpu_thermal {
 	cooling-maps {
 		map-cpu-active-high {
-- 
2.47.3


