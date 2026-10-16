Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E381175A85;
	Fri, 16 Oct 2026 05:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792128877; cv=none; b=mSKamO0GgNwjrrUGKo22nlmxQ9ntqxb4USE0nT+KEF5ZoVDkFAwDJXGRV0ZimNgHAHgJLtvKfYedC19GVdkhyMwwteBSflTVsGaIGzjZ1C16ihXUZrNtU2Oy/rXwXH0gtnl+5KuPK2duIxDfvVM/nXaX8Ol540kPtW2CUOj4oxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792128877; c=relaxed/simple;
	bh=6m8Ojyo9TbI7mj4V/7EpCvY/aUscvJAlabnYrJd4b4Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BhbHFBYeqbyRoGAdwyb3UiT2PLMMT7jxbfY+fRSNpadDB9qdpT+7gU2S2CAoQ87ttgOlQObGJ/YvsDLlTijP1u0tla+RqMBX8KSuj0EYu6gGrRS2d8GMl69atUhQftH9BgzOInwEgXC4vqHDAO7A/POOiYQ7GmUoM5bjx2PUlAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oiH5yQq6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oiH5yQq6"
Received: by smtp.kernel.org (Postfix) with ESMTPS id F05DAC2BCFD;
	Fri, 16 Oct 2026 05:34:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1792128877;
	bh=6m8Ojyo9TbI7mj4V/7EpCvY/aUscvJAlabnYrJd4b4Q=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=oiH5yQq6irJQzvLhxtPFPBZp60Z2kcKvQI/PUmvcV/tKbVW+9mIpv+TBsa2SKiChy
	 GpN4F+8wEsl1upQ4c3hP2RrWutOfAyGdWVIhMSoRFiYUkuHnDxqhCqhJh2CideiuK9
	 FdSWUMLiKLnksRDwlNuz1952+y5U65VPWljYvUEA3mwk4na8T92G9ZlZZoRWIdmMaL
	 442bTBl+6W6hxsVri/33h8qsP+wofaS3J8ap3ghFQaw/9JDcJxScc1AG7zXK6rS9cO
	 OybPRDaLhMMARf8My1ChcQ1egRzaq9ZecDG0LGGGyNsB1RDqMBdVFSCe0uFKSLk/ul
	 7kqZ1AMmNUYAg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0209CC6B2D;
	Fri, 16 Oct 2026 05:34:36 +0000 (UTC)
From: Igor Velkov via B4 Relay <devnull+iav.iav.lv@kernel.org>
Date: Fri, 16 Oct 2026 08:34:34 +0300
Subject: [PATCH 2/2] arm64: dts: rockchip: Describe the unused RK808
 outputs on Kobol Helios64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-helios64-power-tree-v1-2-31d6c8dc5092@iav.lv>
References: <20261016-helios64-power-tree-v1-0-31d6c8dc5092@iav.lv>
In-Reply-To: <20261016-helios64-power-tree-v1-0-31d6c8dc5092@iav.lv>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Igor Velkov <iav@iav.lv>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1855; i=iav@iav.lv;
 h=from:subject:message-id;
 bh=q+lERKCDnOjng4lQyfplDkXO0aaernq5BCDtZUzNjMI=;
 b=owGbwMvMwCVmNH1q96v4SmbG02pJDFkXt2ffMj9gPDm6g7HyEbORruy0LcsZ/xyd/oBlpX55w
 gGj8zcKO0pZGMS4GGTFFFkmHNK4lbHk6l9/D/MHMHNYmUCGMHBxCsBE7u5j+Ct2695OU5Uyfe9Y
 yxYbu7tTUrZdfOOlebPqg7zL2sc5mw4x/K+wOrNTMFNSSmNZlMPuXv5q9qX37bQF0i7nvfOVlz+
 whwMA
X-Developer-Key: i=iav@iav.lv; a=openpgp;
 fpr=90C228DA68A4D5FD4F4837E03297958BEA5F7903
X-Endpoint-Received: by B4 Relay for iav@iav.lv/default with auth_id=1060
X-Original-From: Igor Velkov <iav@iav.lv>
Reply-To: iav@iav.lv

From: Igor Velkov <iav@iav.lv>

The Helios64 schematic lists RK808 LDO_REG1, LDO_REG2, LDO_REG5,
LDO_REG7 and SWITCH_REG2 as unused (sheet 2). Each output has only a
0.1 uF capacitor and goes nowhere else (sheet 6).

Describe them with the names from the schematic and no constraints, so
the regulator core switches them off as unused.

Link: https://wiki.kobol.io/helios64/files/schematics/Helios64_Schematics_Rev1.2.pdf
Assisted-by: LLM
Signed-off-by: Igor Velkov <iav@iav.lv>
---
 .../boot/dts/rockchip/rk3399-kobol-helios64.dts      | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-kobol-helios64.dts b/arch/arm64/boot/dts/rockchip/rk3399-kobol-helios64.dts
index cf247d6c6212..35e92e1c8ff8 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-kobol-helios64.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-kobol-helios64.dts
@@ -436,6 +436,14 @@ regulator-state-mem {
 				};
 			};
 
+			vcc1v8_dvp: LDO_REG1 {
+				regulator-name = "vcc1v8_dvp";
+			};
+
+			vcc3v0_touch: LDO_REG2 {
+				regulator-name = "vcc3v0_touch";
+			};
+
 			vcc1v8_s3: LDO_REG3 {
 				regulator-name = "vcc1v8_s3";
 				regulator-always-on;
@@ -462,6 +470,10 @@ regulator-state-mem {
 				};
 			};
 
+			vcca3v0_codec: LDO_REG5 {
+				regulator-name = "vcca3v0_codec";
+			};
+
 			vcc1v5_s3: LDO_REG6 {
 				regulator-name = "vcc1v5_s3";
 				regulator-always-on;
@@ -475,6 +487,10 @@ regulator-state-mem {
 				};
 			};
 
+			vcca1v8_codec: LDO_REG7 {
+				regulator-name = "vcca1v8_codec";
+			};
+
 			vcc3v0_s3: LDO_REG8 {
 				regulator-name = "vcc3v0_s3";
 				regulator-always-on;
@@ -497,6 +513,10 @@ regulator-state-mem {
 					regulator-off-in-suspend;
 				};
 			};
+
+			vcc3v3_s0: SWITCH_REG2 {
+				regulator-name = "vcc3v3_s0";
+			};
 		};
 	};
 

-- 
2.43.0


