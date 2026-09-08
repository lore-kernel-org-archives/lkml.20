Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DD5B582BA4;
	Tue,  8 Sep 2026 16:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788884620; cv=none; b=S2SiI5msQ+o4Tvgo7lFazqn5I8u0GfaX9EB9wr5v3epCWAbz/ws0DaeuZeOaqf7wB9zQT4Enw94CZJEqwEHe2nfZEBqibon17H7u3ioWugCAq+v8ulz0Aq+agbS5Egx4B5bCRksf8TY7XiKAScHlgv1Y+pOlFWAVq6qEIJxdUuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788884620; c=relaxed/simple;
	bh=eRCDKvuOtVE19iEJ31DGX90ysbGUMg9Ga3yMUW9eVbU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RZSU03+nshUEvHwi8XO4Yxt41ohU4iEQbfEj81D75EkUXnaelj3ZWLTwzdNHGb1Ogu0X8YjQyQPC29Rlz4cLr5/lND7z5Hx5wQi1MnKpGWa8ejTCXTNlmWuec698LiP7k0HeFW5H+zFWDiIa3bZUOYZCfZgZGIynBZQqQg8rhaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=APD8CwND; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=TjwP2Zoc; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="APD8CwND";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="TjwP2Zoc"
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4hfTl54WJYzKmsk;
	Tue, 08 Sep 2026 18:23:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1788884609;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=flkzUkiWLWcRUIyHVsR1WaXcCtF7WMzEBAVU0LhMkI4=;
	b=APD8CwNDttg9oKIo3v4USOZYbSVrALPOmSCOHHoiVIkMuWlVoNXIwq2Ltb4OlTfRFzDgXp
	zq64NXafpSoSF6RKKY8OjVfE7wR/Mx6K5njK5JhK8GCNItK5csBB3mAWDoK4ZGMi2R01Dy
	SoErdqhFKdj+8wlAoIIIK64hhzDY8J+RE13kHvRgKOz0xsLUw+jh9qG9hTuOyyxx8iNTur
	aoz/J7FQM4pnMKg7UDLJY114T/fgsp8MfhkaVPJAiBi8YwtaU1wSallB0qBtgfddWHqWC/
	gi8EvqGrA5NscqXSVWK5Uu2Bx2XKcb6tiQNk/GUEK7ZZGiZUD2OOkQ4eww33jg==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=TjwP2Zoc;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org designates 2001:67c:2050:b231:465::102 as permitted sender) smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1788884608;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=flkzUkiWLWcRUIyHVsR1WaXcCtF7WMzEBAVU0LhMkI4=;
	b=TjwP2Zoc6O6R5Kpzkk14RSoK1QHbTJjL9LSBz6CrMj4LVWe9UG44E1XLG5iDqMijbsjJy8
	y2CHGQpCCMEKWg/U7hIaDI84pn16oZVPmDFkf/Xlq9uwQdTrAVnHX0ljVRhRYP4eFFS4Wx
	sHT8GjwIlS4VYuMX08o3ABpZLOKBCRwJqDDKpL3Pd91IuLes/ZqoX1bpvY9h+H2HRPhnRo
	ryrlRNrI+0T2ZbtZC5AzIaBchdrf5muXsQD6NZWOTN4OzbS5DDTp18Mrp6LfYuH8Bagl/z
	77y/K1idW06YDVl/FlX71Qr/GpN0jbjydQTQZjuQN34XY+ljRBzcU4bIbEhvGA==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH] arm64: dts: renesas: r8a779g0: Add MSI cells to GICv3 ITS
Date: Tue,  8 Sep 2026 18:22:50 +0200
Message-ID: <20260908162323.16440-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: z33uh44ze4qchqiaf9gykhaqshm67u1o
X-MBO-RS-ID: 2225b73f969bd57e180
X-Rspamd-Queue-Id: 4hfTl54WJYzKmsk

Fill in missing #msi-cells = <1> into the GIC ITS node, update
its-parent phandles and fill in 1:1 msi-map .

Fixes: 7fe73a3a3f2c ("arm64: dts: renesas: r8a779g0: Add GICv3 ITS and update PCIe nodes")
Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
---
 arch/arm64/boot/dts/renesas/r8a779g0.dtsi | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a779g0.dtsi b/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
index ea6495261c2bb..ca17bfbf83fdf 100644
--- a/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
@@ -809,7 +809,8 @@ pciec0: pcie@e65d0000 {
 			resets = <&cpg 624>;
 			reset-names = "pwr";
 			max-link-speed = <4>;
-			msi-parent = <&its>;
+			msi-parent = <&its 0>;
+			msi-map = <0x0 &its 0x0 0x10000>;
 			num-lanes = <2>;
 			#address-cells = <3>;
 			#size-cells = <2>;
@@ -857,7 +858,8 @@ pciec1: pcie@e65d8000 {
 			resets = <&cpg 625>;
 			reset-names = "pwr";
 			max-link-speed = <4>;
-			msi-parent = <&its>;
+			msi-parent = <&its 0>;
+			msi-map = <0x0 &its 0x0 0x10000>;
 			num-lanes = <2>;
 			#address-cells = <3>;
 			#size-cells = <2>;
@@ -2165,6 +2167,7 @@ its: msi-controller@40000 {
 				reg = <0x0 0x40000 0x0 0x20000>;
 				dma-noncoherent;
 				msi-controller;
+				#msi-cells = <1>;
 			};
 		};
 
-- 
2.53.0

