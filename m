Received: from mx3.wp.pl (mx3.wp.pl [212.77.101.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC30A4AB3BF
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 22:53:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.77.101.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789685612; cv=none; b=N+dGuENkneiwZV9/sLbLrRNd+zvp8vDMu+gLHf7Oq6NkUNUvmyfAvxZ0pd/Q8qjh8jrJXeNDVr0hMTx5d1E1jFSbLWMfl5sE+YmxY0rJ+Ep6a+cVEBocxLzxK/nHZza9o2FyMS4B8Cym3JcMnOszT2yMozfWuVyFAb4o8NHbvb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789685612; c=relaxed/simple;
	bh=eBlyipAYFd/qj5vAmvhk97kBWbFw2Mr2NeFMS/VyvgI=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=G2SUH++o5Er36NXY/7hdsxqoAYcH8mzb1h1MZnESHwZfXJBmM8ZIBywpJBsc3D6GTaYo06WF0mgHz0rfq1w+O9pIhxgQyhIaqVVtgoNcBS4cUpr2EL0xB5arYVjLa2rgLfBPEpOe/U7zXAtmLDGiuR0hfVHD6sg3I2WXQZ0Zivk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=wp.pl; spf=pass smtp.mailfrom=wp.pl; dkim=pass (2048-bit key) header.d=wp.pl header.i=@wp.pl header.b=lkQUuZD7; arc=none smtp.client-ip=212.77.101.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=wp.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wp.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wp.pl header.i=@wp.pl header.b="lkQUuZD7"
Received: (wp-smtpd smtp.wp.pl 32800 invoked from network); 18 Sep 2026 00:53:21 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wp.pl; s=20241105;
          t=1789685601; bh=+Tvl9RGSjd3N9HgM2+Is42KPtj6OKWFn7K89chpkvCU=;
          h=From:To:Subject;
          b=lkQUuZD7GDSlzqvQPn/74qM7mrduxHzTPGM6PY5not2MNAgk0fxDlq4HADLz6XBOW
           HwEP4l1RRU9iR2LJHrZlsIgwziXDwsz5tZXKV3NzJeb5Cm2bfBZ7wyubcdE8LnY7fp
           K/kLRlBRhUzvBZgGi2byqD9XstdpP0qi5RRwS1j2H7/ID77IC1m08gZvMFYbwX+z4a
           3O0xib7rFw5wx1R8wOm+/RgxR00VLgUq4efczCPcS3jA7SqlTsSRGxpLsE5PAtITor
           eYaRGEQU+mhkTKdNDi+GlQelQFgJKeirTnNSFDc17dFSyXlI1NWX3u8fth0QTwoHp0
           tKCc9QQd9XDNQ==
Received: from abajkowski.lan (83.5.247.11.ipv4.supernova.orange.pl [83.5.247.11])
          (envelope-sender <olek2@wp.pl>)
          by smtp.wp.pl (WP-SMTPD) with TLS_AES_256_GCM_SHA384 encrypted SMTP
          for <robh@kernel.org>; 18 Sep 2026 00:53:21 +0200
From: Aleksander Jan Bajkowski <olek2@wp.pl>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	michal.simek@amd.com,
	olek2@wp.pl,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm: dts: xilinx: parallella: Enable QSPI and NOR flash
Date: Fri, 18 Sep 2026 00:53:08 +0200
Message-ID: <20260917225317.319745-1-olek2@wp.pl>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-WP-MailID: cc02f3c7c051f7c6be1c70d3a8911eea
X-WP-AV: skaner antywirusowy Poczty Wirtualnej Polski
X-WP-SPAM: NO 0000003 [8eC9]                               

The Parallella board has a SPI-NOR flash connected to the QSPI controller.
Enable the QSPI controller and add the corresponding SPI-NOR flash node
to allow the system to access it.

Signed-off-by: Aleksander Jan Bajkowski <olek2@wp.pl>
---
 arch/arm/boot/dts/xilinx/zynq-parallella.dts | 33 ++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/arch/arm/boot/dts/xilinx/zynq-parallella.dts b/arch/arm/boot/dts/xilinx/zynq-parallella.dts
index 366af4fcf8d9..1903aa1cd83b 100644
--- a/arch/arm/boot/dts/xilinx/zynq-parallella.dts
+++ b/arch/arm/boot/dts/xilinx/zynq-parallella.dts
@@ -78,6 +78,39 @@ ldo2 {
 	};
 };
 
+&qspi {
+	bootph-all;
+	status = "okay";
+	num-cs = <1>;
+
+	flash@0 {
+		compatible = "jedec,spi-nor";
+		reg = <0>;
+		spi-tx-bus-width = <4>;
+		spi-rx-bus-width = <4>;
+		spi-max-frequency = <50000000>;
+		m25p,fast-read;
+
+		partitions {
+			compatible = "fixed-partitions";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			partition@0 {
+				label = "uboot";
+				reg = <0x0 0x4e0000>;
+				read-only;
+			};
+
+			partition@4e0000 {
+				label = "uboot-env";
+				reg = <0x4e0000 0x10000>;
+				read-only;
+			};
+		};
+	};
+};
+
 &sdhci1 {
 	status = "okay";
 };
-- 
2.53.0

