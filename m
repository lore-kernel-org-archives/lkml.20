Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3BF7448384;
	Wed,  2 Sep 2026 10:33:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788345206; cv=none; b=oiGvQIawvVM0d+SSOPnQ/L052J7wS6kdh7jjmECA5odeaNjE9cYXMGH/pGb8CGXrg/rk/yrKNk4H3EIj/ce90LLNjaCKwRuQGmiGBQ/LSoB+aKYZqbFl6NPuISE12OqOmkHJJcP2ZH/Kr+RB/lk+M1PUDuvMlF9MOokTS8dbec4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788345206; c=relaxed/simple;
	bh=u5hHq0Z8k4K50Ohjh9lwnjaZVf04Xn7H8lsSwUTpb60=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QMLc3iOKcy2cZ4PJeB6g3kCHaZ5urshB8iAVgKahZjDFVHNaqVCjIJHGKJhV/v3mv9BfyUJoNFeVYBxIwhap+DWekdZLa9bLc9vNxIFOfBjcrEPbznb743CdN0rwAzEjyALzgwMMpOIzf7oX0dpCST+C0qFhH9pO6OMz0gv7AU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=AtQMhqVa; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="AtQMhqVa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1788345197;
	bh=u5hHq0Z8k4K50Ohjh9lwnjaZVf04Xn7H8lsSwUTpb60=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=AtQMhqVaX4vBafLgjq38dnQi+xH3JfKJm7L/JJkdyo9laW+iJbMja+VHNaaLIpkAZ
	 E1Zko15QCw3xKw4hWCtdn343tZrZfR4lsUnMxO2690e8QPvlTv+cg0eQ+SZQVT5hQ+
	 bZHZrDUWqNQ/EYmDznXLbNKlcE9bOSlc/UD4Z7xukiHAnXbOPyz063C4h7tev4Ts3X
	 tg5eN9UCwXKTHG3dig7A8HR+BE/vyyKdDOtI0m0beGdMTAev53/g77MBhh4ytBZia4
	 0ABT+p/o6mp0hZwNIGNc7bQfMAS8Pt6sKMn2/s98DUsY1BCkWvp436ju+uH6hLgxqt
	 Zwg1IcsgDuqCA==
Received: from yukiji.home (unknown [100.64.0.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9323517E11E0;
	Wed, 02 Sep 2026 12:33:16 +0200 (CEST)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Wed, 02 Sep 2026 12:32:45 +0200
Subject: [PATCH 2/3] arm64: dts: mediatek: mt8395-genio-1200-evk-ufs:
 Complete UFS power supplies
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260902-mediatek-ufs-cleanup-dts-v1-2-7876e7a27a9d@collabora.com>
References: <20260902-mediatek-ufs-cleanup-dts-v1-0-7876e7a27a9d@collabora.com>
In-Reply-To: <20260902-mediatek-ufs-cleanup-dts-v1-0-7876e7a27a9d@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788345194; l=1127;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=u5hHq0Z8k4K50Ohjh9lwnjaZVf04Xn7H8lsSwUTpb60=;
 b=lFpdvPJzBvklTLiXP2jD/pez1CnBtvueQBfvZSzK6nMVsCJPvYjgbiURCaaBLffnYNr4mr4Ph
 V0XqDbVqq+ZDv3zkmjuw3fwOtRGJhmRwxbXy2kWMZuAmAyD+8/LqPzz
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=

The MT8195 UFS host controller dt binding now describes the power supplies
feeding the host controller, that were previously missing from supply
description.

So, add in the Mediatek Genio 1200-EVK board devicetree the regulators
used to power MT8395 UFS controller when the board is configured to use
its UFS storage as primary.

Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk-ufs.dts | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk-ufs.dts b/arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk-ufs.dts
index e09a3ecd8773..f3d839f31918 100644
--- a/arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk-ufs.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk-ufs.dts
@@ -16,6 +16,9 @@ / {
 
 &ufshci {
 	status = "okay";
+	avdd12-supply = <&mt6359_vrf12_ldo_reg>;
+	avdd12-ckbuf-supply = <&mt6359_vbbck_ldo_reg>;
+	avdd18-supply = <&mt6359_vio18_ldo_reg>;
 	vcc-supply = <&mt6359_vemc_1_ldo_reg>;
 	vccq2-supply = <&mt6359_vufs_ldo_reg>;
 };

-- 
2.55.0

