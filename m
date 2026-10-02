Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CC363A16AC;
	Fri,  2 Oct 2026 18:36:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790966209; cv=none; b=OGinoZNAoiYU6gtuN934YxrE6MwbFztVR9RJpHwCRGO0RrJ/+xRVPK/knirqSGqlohJr5Zh5fcwXNon34tpyf30kWIY9nOnFyIxZ3Vj2qC254aHkJNkRW+LF909af5sCTmn5rAoJbrE2lkf+FqqSvF5qKQlGOFp64tNhvbD61Mo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790966209; c=relaxed/simple;
	bh=oqriVhcuHi++E4d/LMJaua4G89WcpjjWhndoonwZOjo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ki1nG7BLwrwYPhz7wYZf0DlMz849szlhG2Acp9z1D5ngesG3UH6/XkPCvnimc8XIHd+uQdDq5Bv9K6ptgeGSlVvEHXcxELYoo2hvQm9F9bNpiVFOnoKr394SIaZx1n3R3tdCGI1+ASWAabgwQX57Bcc5+bcJAI3XjwYLWn5QCVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AU51t3H9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AU51t3H9"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7106BC4AF14;
	Fri,  2 Oct 2026 18:36:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790966208;
	bh=oqriVhcuHi++E4d/LMJaua4G89WcpjjWhndoonwZOjo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=AU51t3H9jmkA/VNmU+zgRyNpecRwVpO2NryljnfG19c9k85FiiKGI1mUhNV+t2Gbo
	 iBb+2QDYhUlxk+NvGyyO1ABvMaej+voQvdM7TgwuODdSjRjeIlsLYwzTb0h9e92bsH
	 8yZvRiKPAnKfAqY5CqbWSNuXjbGelZD4Y1HZn6+zmvCbbtVgsGkZs41KvCnQktrnfy
	 /4Ml6JVx6YBPDDzp56EMjdyDeYckNUgGIYfvc/RyFia6eItl5uL1Cgrpk36wvWuMna
	 d+L4HjbQrFc5MvsYgjwo9KmLYy3vbqeynk5TaIHa2UftFsRsYI1mLNfdi3cD4MLCHB
	 wM2E4i2Mx0Raw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50944CA5FD4;
	Fri,  2 Oct 2026 18:36:48 +0000 (UTC)
From: Igor Velkov via B4 Relay <devnull+iav.iav.lv@kernel.org>
Date: Fri, 02 Oct 2026 21:36:47 +0300
Subject: [PATCH v2 2/2] arm64: dts: amlogic: meson-sm1-odroid-hc4: run the
 SPI NOR at 40 MHz
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261002-hc4-spi-nor-v2-2-8366a4f91049@iav.lv>
References: <20261002-hc4-spi-nor-v2-0-8366a4f91049@iav.lv>
In-Reply-To: <20261002-hc4-spi-nor-v2-0-8366a4f91049@iav.lv>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Christian Hewitt <christianshewitt@gmail.com>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Igor Velkov <iav@iav.lv>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1452; i=iav@iav.lv;
 h=from:subject:message-id;
 bh=NgYmk2F31b9kS7Gvan8KxK/AyfRvJU013G77W98iZH8=;
 b=owGbwMvMwCVmNH1q96v4SmbG02pJDFn7f+7jZI1dvfOXhXy3p/6vB+4Zb9KEd/yY7T37qcHF6
 riFFvsnd5SyMIhxMciKKbJMOKRxK2PJ1b/+HuYPYOawMoEMYeDiFICJtBxl+KfrcrAhfvrXmodh
 vD8Wh+5wFrTbV6OlsdOC6e88tdpD9j8YGRZMWV3JwZH/8Klbi0+tyKWsnqW/b8ws/xwZ99S1pOE
 9GzMA
X-Developer-Key: i=iav@iav.lv; a=openpgp;
 fpr=90C228DA68A4D5FD4F4837E03297958BEA5F7903
X-Endpoint-Received: by B4 Relay for iav@iav.lv/default with auth_id=1060
X-Original-From: Igor Velkov <iav@iav.lv>
Reply-To: iav@iav.lv

From: Igor Velkov <iav@iav.lv>

At 104 MHz, reads return corrupted data: bit 0 of the first byte of a
transfer flips from 0 to 1 part of the time. The same byte read as the
second byte of a transfer was correct in all 100 reads. One 4 KiB block
read 200 times came back wrong 157 times. Writes are unaffected.

flashcp verifies while it writes, so a bootloader update erases blocks
it should skip and can abort halfway, with the flash half written.

The Hardkernel vendor device tree for this board uses 40 MHz. At 40 MHz
the same tests pass: 200 block reads with no mismatch, and 14 flashcp
runs with no block erased.

Tested on ODROID-HC4 with an XT25F128B.

Fixes: 7178f340e929 ("arm64: dts: meson-sm1-odroid-hc4: add spifc node to ODROID-HC4")
Assisted-by: LLM
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Igor Velkov <iav@iav.lv>
---
 arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dts b/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dts
index c4b93d6619f2..5f15c2299509 100644
--- a/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dts
@@ -134,7 +134,7 @@ flash@0 {
 		#size-cells = <1>;
 		compatible = "jedec,spi-nor";
 		reg = <0>;
-		spi-max-frequency = <104000000>;
+		spi-max-frequency = <40000000>;
 	};
 };
 

-- 
2.43.0


