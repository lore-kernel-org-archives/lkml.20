Received: from ocn-dfr-mts-208c1.ocn.ad.jp (ocn-dfr-mts-208c1.ocn.ad.jp [210.145.249.208])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04DB134B1B0;
	Tue, 13 Oct 2026 22:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.145.249.208
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791932374; cv=none; b=KGAx3KRFkE6nmoXHtWC8kq/hKDL/yLNMfnWir/4vxD3Px1XwET4vfBW4FpEcXm57UIvPiUD7z1pKYiBfit6lLQhB/kV80HuvBX1c+Qp35NjwHYQ93MYJ9O/V3nQ1VtnUEXCB46BKV0MImchI/3J4K3HiWN5JA+TDxCrYK5BFNcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791932374; c=relaxed/simple;
	bh=hGNhfkcn2Z86vETcyytxBZgfY0XAKYhXjXZeArvSo78=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AStNXGTXk6ju93F7fAOJO4kvhBeB/06AqDFYKJFHrcNn5ym2VGw1qZuIepSaythKA68yiCpR9FdxHEKTLzt8IAVmdWL9RliRpQFhXZv/ai7z3XxTGUBAIsO66v3kEqbLLFKOdet2mD4k0sJzPUpB5tx7s1FMU+qaEJeYAz8yH60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=docomonet.jp; spf=pass smtp.mailfrom=docomonet.jp; dkim=pass (1024-bit key) header.d=docomonet.jp header.i=@docomonet.jp header.b=ofnWzNMj; arc=none smtp.client-ip=210.145.249.208
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=docomonet.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=docomonet.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=docomonet.jp header.i=@docomonet.jp header.b="ofnWzNMj"
Received: from ocn-ckd-mts-205c31.ocn.ad.jp (ocn-ckd-mts-205c31.ocn.ad.jp [210.145.251.96])
	by ocn-dfr-mts-208c1.ocn.ad.jp (Postfix) with ESMTP id C716070000085;
	Wed, 14 Oct 2026 07:50:58 +0900 (JST)
Received: from ocn-spm-mts-202c1.ocn.ad.jp (ocn-spm-mts-202c1.ocn.ad.jp [210.145.246.201])
	by ocn-ckd-mts-205c31.ocn.ad.jp (Postfix) with ESMTP id A49FC440005CC;
	Wed, 14 Oct 2026 07:50:50 +0900 (JST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=docomonet.jp;
	s=20240125; t=1791931850;
	bh=hGNhfkcn2Z86vETcyytxBZgfY0XAKYhXjXZeArvSo78=;
	h=From:To:Cc:Subject:Date:From;
	b=ofnWzNMjQFwokily2BKozEhH8BpJDJhCwX5y/6CMkNmrWHTC3oeTcNNGntPX+cUXW
	 aMAO8bILM1zPmda8UNPZ5CEyn8b6JGSq6jOmq0Vs6y9eItuZzbRXfjVOG/gyvx7quZ
	 kOuFtyTMEVgzpqY8MoA1AeZQHtdBn3zhiRHGOrdA=
Received: from ocn-vc-mts-211c1.ocn.ad.jp ([210.145.250.234])
 by ocn-spm-mts-202c1 with ngmta
 id ceeb58e3-18de38862a13c6f4; Wed, 14 Oct 2026 07:50:50 +0900
Received: from ocn-sdpx-mts-202c1.ocn.ad.jp ([210.145.249.135])
 by ocn-vc-mts-211c1 with ngmta
 id c7b3d607-18de388603efd8c5; Wed, 14 Oct 2026 07:50:50 +0900
Received: from X870E-AORUS-MASTER.kkp-group.com (p3688129-ipoe.ipoe.ocn.ne.jp [153.238.101.128])
	by ocn-sdpx-mts-202c1.ocn.ad.jp (Postfix) with ESMTPA;
	Wed, 14 Oct 2026 07:50:49 +0900 (JST)
From: Shigeaki Asai <y-asai.0816@docomonet.jp>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Shigeaki Asai <y-asai.0816@docomonet.jp>
Subject: [PATCH] arm64: dts: amlogic: odroid-go-ultra: use the RK818 RTC as rtc0
Date: Wed, 14 Oct 2026 07:49:47 +0900
Message-ID: <20261013224947.2351049-1-y-asai.0816@docomonet.jp>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ODROID-GO Ultra has two PMICs with an RTC each, RK818 and RK817,
and the SoC has the meson virtual RTC. Only vrtc has an alias, rtc0.

An RTC without an alias takes the lowest free number, and the RK817
RTC registers early, so it usually becomes rtc0, the RTC the system
time is set from at boot. The RK817 RTC seems to run without a 32kHz
crystal on this board: it ran about 1.5% fast while the board was on
and 14-17% slow while it was off. The RK818 RTC keeps time well:
with it as rtc0, the clock was off by less than a second after the
board was off, with no charger connected, for 12 hours 40 minutes.

Use the RK818 RTC as rtc0, and give the other two RTCs an alias as
well, so that the numbering does not depend on probe order.

Fixes: 62e73f000696 ("arm64: dts: amlogic: add initial Odroid Go Ultra DTS")
Assisted-by: claude-opus-5-5
Signed-off-by: Shigeaki Asai <y-asai.0816@docomonet.jp>
---
 arch/arm64/boot/dts/amlogic/meson-g12b-odroid-go-ultra.dts | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-go-ultra.dts b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-go-ultra.dts
index 348baa4e6d84..86902f68d7d4 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-go-ultra.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-go-ultra.dts
@@ -18,7 +18,9 @@ / {
 
 	aliases {
 		serial0 = &uart_AO;
-		rtc0 = &vrtc;
+		rtc0 = &rk818;
+		rtc1 = &vrtc;
+		rtc2 = &rk817;
 	};
 
 	adc-joystick-left {
-- 
2.43.0

