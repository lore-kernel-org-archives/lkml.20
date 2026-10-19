Received: from nimiomail.com (nimiomail.com [217.160.32.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 538734E4303;
	Mon, 19 Oct 2026 13:31:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.160.32.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792416720; cv=none; b=N1oIHLYq5T6ptv/2sPzol/ZPTVHfBPo15TqCS9aagbql0WHO+hWTUvKruk/q9AVSU9cWd9Ro3CKQmta8xZkN71QQTbGRUZxPfsJhLkfH89xNST0VgR1Rba4C6kUckaPfNHpnpkjJt54r+0Akbj5C56oje580Nl/zX+6C0dLbMDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792416720; c=relaxed/simple;
	bh=M1M6nljnGAfwwvHObKJvaE5eSP4oRD42lcgGZLu0e4w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tVGBHVZBZRaqo4imHMia7Oaj3RGArN7rBPxiS1cRmH7H0Rqwtw6gKNd9gzfBKjcedQXTGzDFeuvVRslkafR0o5IFyE4Jc/PR0h+9m/hC/9FNXJA4/pK/unOGXt6gQZ1e6ZOiPcmEB0I4ioiTht5UuImUnbNxmsdB+3vY7ZJO1ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gluon.es; spf=pass smtp.mailfrom=gluon.es; dkim=pass (2048-bit key) header.d=gluon.es header.i=@gluon.es header.b=ZTXM7jmk; arc=none smtp.client-ip=217.160.32.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gluon.es
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gluon.es
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gluon.es header.i=@gluon.es header.b="ZTXM7jmk"
Received: from nimiomail.com (localhost.localdomain [127.0.0.1])
	by nimiomail.com (Postfix) with ESMTP id 22144816B8;
	Mon, 19 Oct 2026 15:25:10 +0200 (CEST)
X-Spam-Flag: NO
X-Spam-Score: -3.101
X-Spam-Level:
Authentication-Results: nimiomail.com (amavis) (amavisd-new);
	dkim=pass (2048-bit key) header.d=gluon.es
Received: from nimiomail.com ([127.0.0.1])
	by nimiomail.com (nimiomail.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aZTmsOvGeLf6; Mon, 19 Oct 2026 15:25:08 +0200 (CEST)
Received: from DESKTOP-2QFDG0H.tail76f4b.ts.net (21.red-2-139-241.staticip.rima-tde.net [2.139.241.21])
	by nimiomail.com (Postfix) with ESMTPSA id 656E380C3B;
	Mon, 19 Oct 2026 15:25:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gluon.es; s=default;
	t=1792416308; bh=+J/OdOLcTvpcvF9JyRvCNxahAKijd69Ha28plFCpRUM=;
	h=From:To:Subject;
	b=ZTXM7jmkEL84MayKq787lW9ELO/zSDFa6Ifj6RDVsj/lUVdNqzoIkkbNI/isPe+UZ
	 mZzssWa61D78lavQqKZMjOXZFDkp4OpaTB8UeaNcyaE1EY+a6V7eHcpA1oEXCbNVTd
	 ycHoAh+eReq40qSuCmsSyP1F3iC34bZ7AVVCt/CoxdNwoPwuKgYfzTsVYQv+A54vV7
	 spgCChgcMUqTI52sE+jPl1+wo8aF/vexGtdZyRDol841S3j1mN2dFAI9pXTiNDJWKk
	 Noc0A+m7oBluWFgJjW8+Bvw1RFRdsgWVVtcVu8Kx8pxlUqr7bl4IhzZJ1brwXBdt+f
	 TqoUtq9vCmFzQ==
Authentication-Results: nimiomail.com;
	spf=pass (sender IP is 2.139.241.21) smtp.mailfrom=info@gluon.es smtp.helo=DESKTOP-2QFDG0H.tail76f4b.ts.net
Received-SPF: pass (nimiomail.com: connection is authenticated)
From: Miguel Jesus Seron Gonzalez <info@gluon.es>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dongjin Kim <tobetter@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: rockchip: odroid-m1: keep vcc3v3_pcie enabled
 from boot
Date: Mon, 19 Oct 2026 15:24:58 +0200
Message-ID: <20261019132458.855-1-info@gluon.es>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: <179241630793.1079550.12263942423312977317@nimiomail.com>
X-PPP-Vhost: gluon.es

The 3.3V supply of the M.2 slot is a GPIO-controlled fixed regulator
without regulator-boot-on. When the regulator driver probes, it
requests the enable GPIO as low, cutting power to an NVMe drive that
the bootloader has already powered up and used. When the PCIe
controller is built in, it probes a few milliseconds later and
re-enables the supply. The drive therefore sees a brief power glitch
without enough time to fully discharge.

Some drives do not survive this. With a DRAM-less Transcend MTE110S
(TS128GMTE110S), the board froze during NVMe probe in roughly half of
the cold boots, before the display came up. Kernels that probe PCIe
later (e.g. as modules, ~3.7 s after boot) are not affected, because
the drive stays off long enough to reset cleanly.

Mark the regulator as boot-on, so that the regulator driver keeps the
enable GPIO high when it probes and the supply is never toggled after
the bootloader has enabled it. The PCIe controller then takes it as
its vpcie3v3-supply, which keeps it enabled afterwards.

With this change, 5 out of 5 cold boots after power cuts of 2, 6, 30
and 60 seconds succeeded. Afterwards the supply remained enabled with
one user, with no NVMe or regulator errors and NVMe reads at 1.2 GB/s.

Fixes: 35b28582aa3d ("arm64: dts: rockchip: Add PCIEe v3 nodes to ODROID-M1")
Signed-off-by: Miguel Jesus Seron Gonzalez <info@gluon.es>
---

Notes:
    Found while debugging Home Assistant OS on an ODROID-M1, where the same
    change is being carried as a downstream patch:
    https://github.com/home-assistant/operating-system/issues/5103
    https://github.com/home-assistant/operating-system/pull/5104

 arch/arm64/boot/dts/rockchip/rk3568-odroid-m1.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3568-odroid-m1.dts b/arch/arm64/boot/dts/rockchip/rk3568-odroid-m1.dts
index 442a2bc43..6d29fa926 100644
--- a/arch/arm64/boot/dts/rockchip/rk3568-odroid-m1.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3568-odroid-m1.dts
@@ -106,6 +106,7 @@ simple-audio-card,codec {
 	vcc3v3_pcie: regulator-vcc3v3-pcie {
 		compatible = "regulator-fixed";
 		regulator-name = "vcc3v3_pcie";
+		regulator-boot-on;
 		enable-active-high;
 		gpio = <&gpio4 RK_PA7 GPIO_ACTIVE_HIGH>;
 		pinctrl-names = "default";

base-commit: c03c1a14507dfaf8b856c2608f9ac216021fc222
-- 
2.53.0

