Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.142.180.65
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794654661;
	b=Uq//5PE7Vw75qIJKg58+/Yi3bMyX/1+ySVPmzymTvidzS7s2e9tD+B9B5Fjk7pcPT7Sx
	 bCHKOktuOANdFpwFUvUQwxTB/f9ivq431ezEWL6m2Gnha8Rc7V4DkK0C/XdlzprI7gTbo
	 A7QynoU62Lb70G4DkEJykS1lL+wSKalp77i7E2nafSWnhNmwdW5WNibYwBfl07EygT8Mo
	 4sRk8E7qKB27/UdxX9p2CaOazWwDuxCfmnu+p1Q+BUbLJBeJz7hTcbFLcTqSepXgA/Qr/
	 rRu+s2bL7A+eFDVi0cIsnojkmX+xAOrDZehL1j3A7TCovMq5tEINLMTfqDcaNjWyAYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794654661;
	h=DMARC-Filter:Received:Date:From:To:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=nxNur07JedLwdgeoyM/idjM87N/Ou3v+0VvVn90Adw8=;
	b=LgFv/e64XVkvoSV+tU879NFvCbmZ7S3Op8RDBz8V6BKP0WR3EZyG0ARVTP//rF0wm4Dn
	 EncKuV2u6Vl+uouuD5ijjBKJ2ZZ11iI9yEkGxKFpEb2O+LVqjX3bTrp+a2P+gAa+bu+xh
	 ZtS2BHHDPC7EtRVEhAuYkXGM+TBXsCudzZMR9/LZgTk081M6Qd+BB6je+RSMvKDDdhK3t
	 Sst0VpCHujUikSMX+UwxA89fasAcIlEESxwykGF7CYRw5wOn6j3mWpS9ZAcQgR59nsFR+
	 yNMjlXOICvs6UaRRYQnJfj2LdjPQsCXJodMboOSxtiHvUI+mlQHkY/tb7xbQyiz2b7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=makrotopia.org;
	spf=pass smtp.mailfrom=makrotopia.org;
	arc=none smtp.remote-ip=185.142.180.65
Received: from pidgin.makrotopia.org (pidgin.makrotopia.org [185.142.180.65])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8BE2606A8AB;
	Sat, 14 Nov 2026 11:11:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8BE2606A8AB
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=makrotopia.org
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256:X25519MLKEM768)
	 (Exim 4.100.1)
	(envelope-from <daniel@makrotopia.org>)
	id 1xSBem-0000000040T-34qQ;
	Sat, 14 Nov 2026 11:10:52 +0000
Date: Sat, 14 Nov 2026 11:10:49 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: Detlev Casanova <detlev.casanova@collabora.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	Michael Riesch <michael.riesch@collabora.com>,
	David Heidelberg <david@ixit.cz>,
	Christian Hewitt <christianshewitt@gmail.com>,
	Daniel Golle <daniel@makrotopia.org>, Marc Zyngier <maz@kernel.org>,
	linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 7/7] arm64: dts: rockchip: rk356x: Clock the vdec at 400 MHz
Message-ID: <64aa864c176a6ca898535c12ceb85ee69b89028a.1794654074.git.daniel@makrotopia.org>
References: <cover.1794654074.git.daniel@makrotopia.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1794654074.git.daniel@makrotopia.org>

The decoder AXI, core and CABAC clocks are assigned 297 MHz, the rate
the vendor kernel derives as a quarter of its 1188 MHz GPLL. This dtsi
runs the GPLL at 1200 MHz, from which the closest rate below 297 MHz
is 240 MHz.

Assign 400 MHz, a third of the GPLL. The vendor kernel clocks the
decoder at a third of its GPLL for streams above 1920x1088 and lists
400 MHz at 900 mV as the highest decoder operating point.

Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
v4: new patch

---
 arch/arm64/boot/dts/rockchip/rk356x-base.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi b/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
index eefcaa2c26ffe..bb30c2939a269 100644
--- a/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
@@ -666,8 +666,8 @@ vdec: video-codec@fdf80100 {
 				  <&cru CLK_RKVDEC_CORE>,
 				  <&cru CLK_RKVDEC_CA>,
 				  <&cru CLK_RKVDEC_HEVC_CA>;
-		assigned-clock-rates = <297000000>, <297000000>,
-				       <297000000>, <600000000>;
+		assigned-clock-rates = <400000000>, <400000000>,
+				       <400000000>, <600000000>;
 		iommus = <&vdec_mmu>;
 		power-domains = <&power RK3568_PD_RKVDEC>;
 		resets = <&cru SRST_A_RKVDEC>, <&cru SRST_H_RKVDEC>,
-- 
2.56.0
