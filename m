Received: from mta0.migadu.com (out-69.mta0.migadu.com [91.218.175.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAB5A445AFE
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 11:46:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787917588; cv=none; b=O64Dj6hFfHohKy8yar0qguy/AgIBU8TDVZA5BnOk5fYiYtqG2bNrVtF6+51kEEWAVZG+Rz2cWkKjw6x8Ik75yXhqtE8Gu9MmFjONJiTVHxpqCqA0cayHtfSbOfH2fJ6t8rrHHdXwwRGKuE0KOlMJZaSGMEtrBAJjDzfQ5UQDgs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787917588; c=relaxed/simple;
	bh=BpRbhcfD3eD4hwtFOUCZCY+oZfkOOf6n1IZQcrr6kRM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SRG9bgn3Zm/wlZewL4NC1uyu6GIwihoWDyBwi7CboAQdQgLz0MNxktxIHpwPfabwxbjPzwYZGvEMGysx5Orw4ne5Uci6jq6ISzGSYGl1zKwhXxy/iQPYvHB3ezO1kI/oVqDm+M+gMM7ZdMeyjPRYrxUliXML4OVppHrDYLspAZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow-tech.com; spf=pass smtp.mailfrom=cknow-tech.com; dkim=pass (2048-bit key) header.d=cknow-tech.com header.i=@cknow-tech.com header.b=M0LXgUri; arc=none smtp.client-ip=91.218.175.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow-tech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cknow-tech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cknow-tech.com header.i=@cknow-tech.com header.b="M0LXgUri"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=BpRbhcfD3eD4hwtFOUCZCY+oZfkOOf6n1IZQcrr6kRM=;
 c=simple/simple; d=cknow-tech.com;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787917569; v=1; x=1788522369;
 b=M0LXgUrimLoHl4mthzCHn68oHHEoJpzW17GS+4Y7K36pgYhhzduGEjwSy+1qpHQY7Tb3K8BI
 uhse3lRKtZ6mAFhem1jGqzI4RpbPelQ3HaP78qgbTMH8boaXa5PmJ1SQomGV+m0R0RmAfg9N+Ep
 1um6zy/hsLc6i+7s3rvw8Vepgh2lqnICaMttF8INaemSp7k3kbxIwx6VoZAHZFc+vvdzGgBMJ26
 qbUwc4Lop61E3ejTOV78hEztaXqiKoU7JBwn9UIpFa8fAE/4Or31eG0AzCgw+Wzrs8DUZ8pYnY8
 nLDyx8uq6lg3fPTD4fqOJlUtcREqiHiwwpsQrMizzgtKQ==
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 5e7500bbdfa4c39b;
	Fri, 28 Aug 2026 11:46:09 +0000
X-Mizu-Trace-ID: 5e7500bbdfa4c39b
X-Migadu-Flow: FLOW_OUT
From: Diederik de Haas <diederik@cknow-tech.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Ricardo Pardini <ricardo@pardini.net>,
	Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>,
	Daniele Briguglio <hello@superkali.me>,
	Hugh Cole-Baker <sigmaris@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Diederik de Haas <diederik@cknow-tech.com>
Subject: [PATCH 7/7] arm64: dts: rockchip: Drop duplicate USB nodes on NanoPC-T6 LTS
Date: Fri, 28 Aug 2026 13:43:07 +0200
Message-ID: <20260828114530.1315798-8-diederik@cknow-tech.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260828114530.1315798-1-diederik@cknow-tech.com>
References: <20260828114530.1315798-1-diederik@cknow-tech.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Several USB nodes were enabled/configured on the NanoPC-T6 LTS first. Then
those same nodes were enabled/configured in the NanoPC-T6 dtsi file, but
the ones in the LTS dts file were not removed, so do that now.

Signed-off-by: Diederik de Haas <diederik@cknow-tech.com>
---
 .../boot/dts/rockchip/rk3588-nanopc-t6-lts.dts  | 17 -----------------
 1 file changed, 17 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6-lts.dts b/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6-lts.dts
index ff855064be08..0ee67ee24f3c 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6-lts.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6-lts.dts
@@ -38,23 +38,6 @@ usb20_host_pwren: usb20-host-pwren {
 	};
 };
 
-&u2phy1 {
-	status = "okay";
-};
-
-&u2phy1_otg {
-	status = "okay";
-};
-
 &u2phy2_host {
 	phy-supply = <&vcc5v0_usb20_host>;
 };
-
-&usbdp_phy1 {
-	status = "okay";
-};
-
-&usb_host1_xhci {
-	dr_mode = "host";
-	status = "okay";
-};
-- 
2.55.0

