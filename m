Received: from mail.mdapi.ch (mail.mdapi.ch [31.3.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97A453D8115;
	Tue, 15 Sep 2026 04:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=31.3.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789447883; cv=none; b=i1uigE3TfBbK26ChpGNr/bPE+y+0gHu3fEnnZp+ewraC2Zavy9mMSm0vTa/8ZbsCtbtzyQ0du1RIlSaJg3AN9yY65qnnt3fRRIz7Z4clPSksXZTrZtnTXzlHJ3BMZ/LutL6BhBQO0SMXkcnKajIUkVZwIlpxL1Dk90sAHrv8b4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789447883; c=relaxed/simple;
	bh=fxOKKCUsK9zZzemJd9lkf1QVkybwyZu93u70HP087HA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Hk4lkr2WedA9JfA/0c6xopfQ+qTvd3gn12IQO70upcaAVRIjIAmIHdt3D0Soam2sAEu5snuNG917o9RT51K0l/K/uM34WK+sN+zUQzD5dY+a/XM3uJ+KnYwclXQDYIQIok4pp15XQmFXBXwoeubqt8ratZNH95OMxNesIETHoFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tillo.ch; spf=pass smtp.mailfrom=tillo.ch; dkim=pass (2048-bit key) header.d=tillo.ch header.i=@tillo.ch header.b=PPSoj7Pg; arc=none smtp.client-ip=31.3.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tillo.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tillo.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tillo.ch header.i=@tillo.ch header.b="PPSoj7Pg"
From: Martino Dell'Ambrogio <tillo@tillo.ch>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tillo.ch; s=mail202603;
	t=1789447378;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=iDBR88Kq1bFU8YSncqnOxECCzfjGRrt18SSlVQzNBnc=;
	b=PPSoj7PgCTlMLla4350sZgDJzIx+8rTgGOjNPZe/8yjpHw/erLp7sBJIKRyL4Q0DGFFEES
	EOHypxEvIX9IQLMiyt4D1pNU4m5sUDJm9S4W/mviqw44fezn5wsj/atoTua336GyBgO+Sx
	3Ke3NU5c08uPO9p0GmAXn1OCT9x+OEVGupg0kPo7RDXGEtsV26T65sB4R5u/n8sJoZM9Dq
	L4QTolYeMLexySoXGEkLqUzBoI6PZsVqhxG2u7Z3nSwnHU4AApJVk/72Jdj5KPvYm/M7wy
	Y58qs1XXSkMlQ3h1FetjarEwgC45NJLH870d8KGTSMJtgWLgYL+dWQ0Deh/Kmg==
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kees@kernel.org,
	tony.luck@intel.com,
	gpiccoli@igalia.com
Subject: [PATCH v3] arm64: dts: mediatek: mt7988a-bananapi-bpi-r4: add ramoops region
Date: Tue, 15 Sep 2026 06:42:54 +0200
Message-ID: <20260915064254.1594808-1-tillo@tillo.ch>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Reserve 1 MiB of RAM just below the ARM Trusted Firmware secmon region
(0x42f00000-0x43000000) for persistent kernel log storage via pstore/ramoops,
allowing post-panic console output and oops dumps to be recovered after a
reboot. Without it, kernel crash logs on this board are lost when the SoC
warm-resets and the on-chip console buffer is reinitialised.

With record-size=128 KiB, console-size=256 KiB, ftrace-size=64 KiB and
pmsg-size=64 KiB, ramoops_probe() carves the post-console remainder
(640 KiB) into five 128 KiB kmsg records, with the requested ecc-size=16
reserving a small Reed-Solomon parity block from each zone's own
allocation (per persistent_ram_new()). The ECC lets pstore recover dumps
even when the panic path truncates writes mid-record.

The no-map property is required so the reserved region is kept out of the
kernel linear map. ramoops remaps the carve-out write-combine via
ioremap_wc(); on arm64, leaving the same physical RAM mapped cacheable in
the linear map at the same time is an attribute-mismatch and risks losing
panic data to dirty cache evictions from the linear alias.

The carve-out sits immediately below the ATF region already declared at
0x43000000 in mt7988a.dtsi, so no other reserved-memory child is moved or
resized. BPI-R4 ships with at least 4 GiB of DRAM starting at 0x40000000,
so the region is well within installed memory on every variant.

For the carve-out to actually preserve content across a reset, the boot
loader must also avoid touching this region on warm reset; on standard
BPI-R4 boards with the stock OpenWrt U-Boot fork this already holds.

Signed-off-by: Martino Dell'Ambrogio <tillo@tillo.ch>
---
Changes in v3:
 - Resend; no functional change. Rebased on v7.3-rc3, where the v2 diff
   still applies unmodified.
 - v2 drew no review comments. It was also sent, in error, as a reply to
   the BPI-R3 patch's thread rather than its own, so it is likely to have
   been read as a duplicate of that board's patch. This version starts a
   fresh thread to avoid repeating that.

The matching BPI-R3 (mt7986a) patch is being resent as v3 at the same time.

v2: https://lore.kernel.org/all/20260528123645.2650085-1-tillo@tillo.ch/
v1: https://lore.kernel.org/all/20260528092807.1936177-1-tillo@tillo.ch/

 .../boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtsi  | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtsi b/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtsi
index 0ff69da..6a8dc89 100644
--- a/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtsi
@@ -80,6 +80,19 @@
 	};
 };
 
+&{/reserved-memory} {
+	ramoops@42f00000 {
+		compatible = "ramoops";
+		reg = <0 0x42f00000 0 0x100000>;
+		no-map;
+		record-size = <0x20000>;
+		console-size = <0x40000>;
+		ftrace-size = <0x10000>;
+		pmsg-size = <0x10000>;
+		ecc-size = <16>;
+	};
+};
+
 &cci {
 	proc-supply = <&rt5190_buck3>;
 };
-- 
2.47.3


