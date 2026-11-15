Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794781807;
	b=vn6gNqdBWCYEfJQd3qw4PSYfPM2uVL/cjmV/DypCY/PspQZ6uQj1fh39vvbRaKq3c/Ci
	 SVW2080QeseJUCxX9knce2y5B5vtmsYaJLJ4rwVSVdY5K7V6G5/0Yrztc6H115LgOBeRV
	 6XFx8vjia3zMsg253iZodUMp2RLdVVgEgEtgqw2fqoF3CI6mBUK5Glk+fVAvBi/KDnyVs
	 ezsEbJWbgTuOdANb7t5TAN40rWbvOXWWEQSsZ3kuitQtTmjaxO+Rk9Ok6PT2i27v8cE6H
	 tvA5OEqIoOaeFK6qjq9AWMsBXFG00PCZZxgI+4h8YngZyPSWu+yf2fderaSnnBy7kfQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794781807;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=1gLNBYp+ck7xYQnvYM+G+PAF9GWuVTdzo0tmuZTHUOE=;
	b=mJ6M7znNuYWVZCeV3T5epi4BYc2r0Hez/UEwkfMpydwWxJ228DM6IJzuY/qfofKpScpU
	 FiSv2oB2yAUMgvFgNNPrvtOd1YVXKV96XmGV42wsVPUIL9iaau8cRzwb0aTMnS6rL8OVD
	 LxX/VL1wccscH2SF+4HkQHa2wc86HSds1xPN6FkHvdQmkrancBbSz2zT5XJZWExBCIFE5
	 2C0fzu6oKzS6chWXfDs6k41Ajwn02n/vo/xoT72SEK3dtdozlzf1Bwbb7ZUNy7+MLYixT
	 QZ+wPyoIvayrtd+jwNEIP2EokHM1eDvlernswqzU5bauQxG8IxhiJgP0IXsV6i1LyAQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iFQBAC4M;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43540606A336;
	Sun, 15 Nov 2026 22:30:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iFQBAC4M
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794781807;
	b=QBf+bc9vQjW9VzV+sf6qW12TgpSicc90MBBA3TXzgObXbn8E0i12petHtkjvTpemtDOE
	 e/de4lIhGK0gBcVqA45d0KOwFs+rOTGKpQLono6W2A6UYHsuPoaRI4ZTqh9yq+WAzwvf8
	 gPg5h5SBowY46R0NvQS8MCmozboooexmnyqjQNkE5dR4uIVtSh2nN7DDSBFX3npIxjRET
	 BtX3miDMCUpsF83PEJg8vw1MzAO1GJsnOzZeK9ZcwcKSf//CT1oTEVHb+845J9bYTwSMo
	 Pql1kMqTxcgGG+NvdRWpPgIZwsBZrV4pmBe5NwXpkmzz2IMu62qORjvAsKd44gOCcvw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794781807;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=1gLNBYp+ck7xYQnvYM+G+PAF9GWuVTdzo0tmuZTHUOE=;
	b=ETHWlLfNUphK3IzIHzZ5ZjKYfeUtYyIIdWcMMuXHa8Rf7r7nPRIjPeqmddY2X5GmguRb
	 XCGy062rzJ293D/xdw7MifYH2X4KHrJ0+EWceRiqwlHm6dtqc6OwV1Ps0igx+i23eZ5C/
	 0lyuMRYJyfrsWRyV4emdb7OnjHvDTg5Al+qM07y36bMOvKZMkKD4woaCeuVhxSHYinBYs
	 sUKQatpRC40naydKWGE2FtTrrBO7saofvz+WLTsHi6hkdKYC5qJe9dPGIXutX2FkymhL/
	 GY0GoCme8fuDjaGxWOlyN6/Mx7f/gMKzMx6zELS+w7TellsNo3CAeDufiOsDyBPQ3bw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 079711F000C7;
	Sun, 15 Nov 2026 22:30:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794781807;
	bh=1gLNBYp+ck7xYQnvYM+G+PAF9GWuVTdzo0tmuZTHUOE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=iFQBAC4MYpU90/lDAYWGaic2mbW+YCwsliq/idAoNS89ZL5orJIikuLcFyrr2ixSz
	 NBhJhbjGBDI0CFe3hJBLnQcFxEHKqtdoWSFyCelJfoi3VNQLUnXBBU/GAEAzbM1Bgn
	 3zTXtplU/yjcFmvNYzdwJwOeI90pvQrL3Egady7vOTvC6hk8+3PqPjT0x2CCwdRzs1
	 3AuSQzDJQBAzx2Cf49k+CtuvKvzvfa2THng8svpmjZ8DI/4MZFRA2Lf3Otc43eBjD8
	 1xpO3NgdH4v+QFGJZF2rMQxKc6o21ELcvZzZYqdyp9PICa272hStkXkfZmNDNTqQ72
	 fs44LUe42qdlg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 8819F4A228;
	Sun, 15 Nov 2026 22:30:05 +0000 (UTC)
From: Ronald Claveau via B4 Relay <devnull+linux-kernel-dev.aliel.fr@kernel.org>
Date: Sun, 15 Nov 2026 23:29:38 +0100
Subject: [PATCH 3/7] arm64: dts: amlogic: axg: Add ranges to periphs
 pinctrl node
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
Message-Id: <20261115-fix-amlogic-dt-warnings-v1-3-94cbd67a32ea@aliel.fr>
References: <20261115-fix-amlogic-dt-warnings-v1-0-94cbd67a32ea@aliel.fr>
In-Reply-To: <20261115-fix-amlogic-dt-warnings-v1-0-94cbd67a32ea@aliel.fr>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ronald Claveau <linux-kernel-dev@aliel.fr>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1603;
 i=linux-kernel-dev@aliel.fr; h=from:subject:message-id;
 bh=t3oox1TjzpL1ctm6S+5Ku7TzDmvGbGuVy9dMZYSp6B4=;
 b=owGbwMvMwCWm1SvKXP3cUInxtFoSQ9Yvo9RuaxaGU1OPHnxSk9zGLPtc4/4xXUeuEBPNCeGOe
 2xMby/vKGVhEONikBVTZOmfa3ni3eWjZ77uUU+BmcPKBDKEgYtTACZy9zXDP5PlYj9CXxlM9ctY
 n3T17frIsFN3ms5vMHvW3TubgbNSuIDhf/qOHJ6Szru3N04UcvbYrNreemFpS3e+8QyXnnN/tx+
 bxAYA
X-Developer-Key: i=linux-kernel-dev@aliel.fr; a=openpgp;
 fpr=DFD863F61375BF917F0012173953305EF1D0EC3E
X-Endpoint-Received: by B4 Relay for linux-kernel-dev@aliel.fr/default with
 auth_id=744
X-Original-From: Ronald Claveau <linux-kernel-dev@aliel.fr>
Reply-To: linux-kernel-dev@aliel.fr
Content-Transfer-Encoding: 7bit

From: Ronald Claveau <linux-kernel-dev@aliel.fr>

  meson-axg.dtsi:360.33-1262.6: Warning (unit_address_vs_reg):
  /soc/bus@ff634000/pinctrl@480: node has a unit name, but no reg
  or ranges property
  meson-axg.dtsi:1609.30-1716.6: Warning (unit_address_vs_reg):
  /soc/bus@ff800000/pinctrl@14: node has a unit name, but no reg
  or ranges property
  meson-axg.dtsi:360.33-1262.6: Warning (simple_bus_reg):
  /soc/bus@ff634000/pinctrl@480: missing or empty reg/ranges property
  meson-axg.dtsi:1609.30-1716.6: Warning (simple_bus_reg):
  /soc/bus@ff800000/pinctrl@14: missing or empty reg/ranges property

Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
---
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
index 5b8ef98f6d03..dc932629c92c 100644
--- a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
@@ -361,7 +361,8 @@ pinctrl_periphs: pinctrl@480 {
 				compatible = "amlogic,meson-axg-periphs-pinctrl";
 				#address-cells = <2>;
 				#size-cells = <2>;
-				ranges;
+				ranges = <0x0 0x480 0x0 0x480 0x0 0xb4>,
+					 <0x0 0x430 0x0 0x430 0x0 0x3c>;
 
 				gpio: bank@480 {
 					reg = <0x0 0x00480 0x0 0x40>,
@@ -1610,7 +1611,7 @@ pinctrl_aobus: pinctrl@14 {
 				compatible = "amlogic,meson-axg-aobus-pinctrl";
 				#address-cells = <2>;
 				#size-cells = <2>;
-				ranges;
+				ranges = <0x0 0x14 0x0 0x14 0x0 0x1c>;
 
 				gpio_ao: bank@14 {
 					reg = <0x0 0x00014 0x0 0x8>,

-- 
2.43.0


