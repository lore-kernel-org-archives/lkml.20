Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793686333;
	b=S3sWSZkZN0rCrsBvYppyODvx1ZNfCcxkDHtAFgpDUHgLSuhaNMzS+g1R0ydZKl8Djl+c
	 ONj6DeaG9fZcC0KhlGEcQnnhCvl3DV2fsLy5voTTDCPY/FGk42hR23PN4OIyXDP1lOPf1
	 WVJJP64cdYU/5xpyOcL7UZum1h7B8vK74pWjtY8TLLn/fLY1Vai6gks7NQhg7BTJGYyuf
	 n8Mlfg+N/aFAuBzQL8O/sBq8Zoez+9Lm4+ZHYknuzhTAsRDDEgzurUSx1c5mJ7Vv9CoUV
	 g7RYFUYlLuHjs49IP76R5pjdV2DgaktTRLjXKEaS56pJByA4q4R7LiYjVT10HcVbnkQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793686333;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=Y1vJsLmhajtmtrGk3CEdEpHpsAWbMQetVNtaJwsiq4w=;
	b=0B+YTVN7Id1/xyHTsfQK9w3lJ9CZGLD7JgU6/elgw7AJgYvljG6khiScS+MKHb9Tgpwv
	 YIsXBGyNWfddda+xDTpkKHCls+VmCwfdxI1V6cvdrLlV4Vf7F27A1Bp4mMK9cASBPKT8v
	 BEdEeaUAn10T3ZMTb/kZHDvK1kuTF7USVIF/BgfAOmNtJGnxEKm/wmq+K5bE7XfnFZVOe
	 j/oUIKQuv6Tl0/DnvDZoEG4cAr03dKoTkTFyc/YgOeyRoc8tR2880biyiUpUX5ArHE9QQ
	 CnAq4OoBWaXAlZ4Kb7gntWYV8AnpZsDN4lQwP9A4vhKn7kyYVS0INFEG9O40cBK13MA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jiuVi9kI;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C920A606A32E;
	Tue,  3 Nov 2026 06:12:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jiuVi9kI
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793686332;
	b=PlZ8Y9DzSVYyhTOS3L7ouyJUi+MGz0dtNkErafGNAlEL/0knMpgng/Rw6P6dutNpkwv4
	 HfNb8vqfF2flan3ch6cDnlmWSv5Dj2EVrp2EqDYmfWctQZ0oS5gQ0FPp6oNj81fhVVMJo
	 Qvdk4BTyMofXKZVF1NAONCHmn7FhugOpIJg1daXxD1aOi35ZS+oJYw6cNoN0Es33AXWZc
	 oAhy0i6doR+yAVPejPaoCJWK8oTM7ctB1mp8eqRxRhvs/cTu4iQa3TNS/EoEbBdtXWREh
	 NvUipoNPeRN4D1kJGQfIqHnuKV5MIe1k0pqHgjRuvG1Y/jrY4/UpQIilzMuuXGkfmnQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793686332;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key:X-Endpoint-Received:X-Original-From:Reply-To:
	 Content-Transfer-Encoding;
	bh=Y1vJsLmhajtmtrGk3CEdEpHpsAWbMQetVNtaJwsiq4w=;
	b=fkRTo4XgQ22LOkr0zMSZW/lBkr88gCuiC60YvYPra1HgxuK7EDqi4zJfgOFODZiUXYsf
	 DkJ+2hsZDJrIk4pTWlgi8hOx3Lt9np1c87ddGDzR3drBKIevh/XQoweWH7BmzyDjowIjD
	 j80l363qK3O6py25TtVjtrZMnDubUdJPiX8jUkFyGM1vup7gjysf/ZV0u+5f5OECr7WuQ
	 LHKGhZHAJJe2IznKFj9G0jK7esJGm0XKqVP4sfxB+CX/AENxmPCNEsgiM1pb3wGlukZGr
	 Pefy6N2gwBgE6zdhEaiSdWbpeWX5EdULZNNs7V4juBLeMwVaq7ktMK6ezGD1bIiXOuQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E1A3B1F000C1;
	Tue,  3 Nov 2026 06:12:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793686332;
	bh=Y1vJsLmhajtmtrGk3CEdEpHpsAWbMQetVNtaJwsiq4w=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=jiuVi9kIa7kbUZeA1VekrmQrLF4/586Mvzg1vh0wY+gG83jf972IWGcmnID6RJbir
	 VtzX8iLG80PnjC8qKAcl/DPVLbp2+sBg9AcFQZHUO1BTUVbMGfamZC5ReNjysTUZUZ
	 3l9VTNkqBVzDp6HpyxNuzc4JUXLmFzN5Wljk8utPhK7G/tzrcglCloKJNZOqoaC07g
	 D295hfwByKp+/kog7LURI/G3aQtIzRQuuZYSxKWKvziL1of0ZfM5cLaoRPSRaIlRUw
	 gRPOznZZ6wVnQqo/My8H1uOxGs7eewU94KCBhhmcgxU/DBNxvroi914GdM1vw/vnBb
	 6YjQFr1FbhrcA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 6F259467C4;
	Tue,  3 Nov 2026 06:12:11 +0000 (UTC)
From: Igor Velkov via B4 Relay <devnull+iav.iav.lv@kernel.org>
Date: Tue, 03 Nov 2026 06:12:10 +0000
Subject: [PATCH] arm64: dts: rockchip: Enable SD UHS-I modes on ROCK Pi 4
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
Message-Id: <20261103-rockpi4-sd-uhs-v1-1-fa394d2046e1@iav.lv>
X-B4-Tracking: v=1; b=H4sIADl76WoC/x3MMQqAMAxA0auUzAZM1QpeRRykRhuEKg2KULy7x
 fEN/2dQTsIKg8mQ+BaVIxZQZcCHOW6MshSDra0jqhtMh99PaVEXvIJix448sV9d30KJzsSrPP9
 wnN73A0g3Bx1gAAAA
To: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Igor Velkov <iav@iav.lv>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2365; i=iav@iav.lv;
 h=from:subject:message-id;
 bh=az5m2/WqrCJ/+LWcDbyXHuHBZoPgNzj0Wuk5JL5JV+Q=;
 b=owGbwMvMwCVmNH1q96v4SmbG02pJDFkvq61Wa6jZcBwxnsSReEeXM+R2AMdDY4XN5v1hgZP4W
 TtjJ7zqKGVhEONikBVTZJlwSONWxpKrf/09zB/AzGFlAhnCwMUpABPJ/8vwVyK5nP38C3nbF7cd
 g6OCWgqVjzNzuhZxqF6985JffvP8UEaGZqu9q/eGewl3cCT3PdWeLemz/F192n4lmduCdi93vsl
 iBwA=
X-Developer-Key: i=iav@iav.lv; a=openpgp;
 fpr=90C228DA68A4D5FD4F4837E03297958BEA5F7903
X-Endpoint-Received: by B4 Relay for iav@iav.lv/default with auth_id=1060
X-Original-From: Igor Velkov <iav@iav.lv>
Reply-To: iav@iav.lv
Content-Transfer-Encoding: 7bit

From: Igor Velkov <iav@iav.lv>

The SD I/O supply vcc_sdio (RK808 LDO4) is pinned at 3.0 V, so the
card stays in high-speed mode at 50 MHz. Let dw_mmc switch it to 1.8 V
and enable SDR12 to SDR104.

The card supply is not switchable, so after a watchdog reset or a
panic the card and vcc_sdio are still at 1.8 V. Linux and U-Boot proper
boot from the card in that state; U-Boot SPL loading from it has to set
the SD I/O domain from vcc_sdio, as it does on NanoPi 4 since U-Boot
commit 210ab4f60df8.

On ROCK Pi 4A with a SanDisk 256 GB U3 card: SDR104 at 148.5 MHz,
direct read 64-67 MB/s instead of 23.5 MB/s.

Signed-off-by: Igor Velkov <iav@iav.lv>
---
Tested on ROCK Pi 4A: v7.3.1 with this change, 3 cold boots in SDR104;
the Armbian 7.3 kernel with the same change through reboot, panic,
watchdog reset, s2idle and hibernate, SDR104 each time. Not tested on
the other boards that include rk3399-rock-pi-4.dtsi (4A+, 4B, 4B+, 4C,
4SE).

With PCIE_ROCKCHIP_HOST=y and an empty PCIe slot, tuning also needs
https://lore.kernel.org/r/20261103-rockchip-pcie-async-v1-1-4dcadb94af64@iav.lv
The SPL side for U-Boot on the SD card:
https://lore.kernel.org/r/20261103-b4-rock-pi-4-spl-iodomain-v1-1-8dfc34a5e2e2@iav.lv
---
 arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4.dtsi | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4.dtsi b/arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4.dtsi
index 52de4a79e2f4..3de1d14529c1 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4.dtsi
@@ -356,7 +356,7 @@ vcc_sdio: LDO_REG4 {
 				regulator-name = "vcc_sdio";
 				regulator-always-on;
 				regulator-boot-on;
-				regulator-min-microvolt = <3000000>;
+				regulator-min-microvolt = <1800000>;
 				regulator-max-microvolt = <3000000>;
 				regulator-state-mem {
 					regulator-on-in-suspend;
@@ -696,6 +696,11 @@ &sdmmc {
 	max-frequency = <150000000>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&sdmmc_clk &sdmmc_cd &sdmmc_cmd &sdmmc_bus4>;
+	sd-uhs-sdr12;
+	sd-uhs-sdr25;
+	sd-uhs-sdr50;
+	sd-uhs-sdr104;
+	vqmmc-supply = <&vcc_sdio>;
 	status = "okay";
 };
 

---
base-commit: 2974b78ee4302390eceb5f5983c00b3d66fc3c78
change-id: 20261103-rockpi4-sd-uhs-5e61c1ecf674

Best regards,
-- 
Igor Velkov <iav@iav.lv>


