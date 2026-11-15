Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794781807;
	b=FeBzxX5eC6LKsq5tJzkHNCwOcdMkCDxczk+yKeF4mFl418+3X2l47TgbNch+gyHU6Rp4
	 MHOWK8N3W6JnDnne6hw6wGMiB0rD3S9jLKoII2y0EIagd2X+SPhnKae9yTd/5keDbaUbl
	 j2YeTroF4zIUkBe35O4YAi2iJNV6NmBgb3BcZ4vnEwVH5TufH2yEdbjK8Tb6JEgQ77c96
	 KMyrg9C0pf5QQIIbpUWb+sYpu3FPHSfODB5fe8Eoqi9nU82VYPsjxS0T9J+qfcMzPK1Jt
	 GkJuf8CYmeUBOmtnuakkDFOIkA7TKA9gRSjPDleFLlBK5Uf/d2rPFP9GV+fM7fCruNA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794781807;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=FS5qk1dfpPCEIZP1LBaj3fIaB9aWxROaAsOBlHXojYo=;
	b=FeUA2nTy1NlChiJ0wZc+ISekJ9Ensa3AiK4gt4N6wArLlvqwqSX80CXoR2LhRzDB/qY+
	 O9Ts+adSST/b3zYxzHVaLTGQZ4wNIKI7AE5lpbowh+XB33F+yQemHv6lSo7JxU4UPSFEr
	 NRP257ZDByLSGoRTyeLuEnNX471pgFJWG8UOu1d45xZ9ig+8k3ZCpnhQJYiJCsz54yhGe
	 1IVhgm7iLrTroOs8FFUG6mw5qmAypEXMhJ/AjGx+8Po6uThlhvx0WpT4mhD19L1PlNatv
	 LKfl+9Ra5E+lTrDn3BWlVkCkZB+Vj+J0BscNLhhDEEjRcVGfBkHkcZPaURoB7yLq/OQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=onN03JHn;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F2C3606A880;
	Sun, 15 Nov 2026 22:30:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=onN03JHn
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794781807;
	b=WVHAJvAf5JAz8UF7hb/vBq0X0vl/OjPaGh9uvP/EVPTq+k3CSVKBhpnjjums1yrISma8
	 L9IuT+nGqozV9zaqG5kf/GdRVTNO7XC7BpcaPqUpg7tDEKU7DJPCEV6svsZFAu/3wOSKa
	 CZ+Z1H3a7BT0nVEQ2PPFMUx7fxM/lFJPtV1fCLKlvsYRONoSBB3Fai7ezahK/3gfLkqQO
	 lr9DinSHlLzp2WEPK93PRfj6wpYlM++MrCbnlUVoT7uRyqcraZmRjb1YeS6kZSpXzt+Iz
	 1/3lescUv8ww0ftY6OuuZRYDu/o9aQsvt+Svh5kW0F0najy6GGXYCA6N6xcakKAJiwQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794781807;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=FS5qk1dfpPCEIZP1LBaj3fIaB9aWxROaAsOBlHXojYo=;
	b=Hia/U/qWzg84LjsfU8CUxpk1YK+R8Vo1btPnfKT2VzmR7KAVcqLQDeTJsWHZOjlN8qMU
	 dMbAzN/LgzzTmgPqmy/qw61EXKtrVH4eV1DTU6ADB6q/f+l7ZjznAVYwnnwJ8tbn2t6Gg
	 I+2tqnA6+YBzWlrc46AN7002NK/5uVazp54gTjyNTJW0a6SMkHaPUKyY3xkCJQOh9AJRi
	 JUTQK7rsjW+KJOpBbssMnXtDgrDcreD3ELjTlkFu/AQiesP/13A5sTfR/O5eki3ienFnp
	 5aF37I9qnfDb880ub5+oAwt/4e/mMhot3usmzIZOQPv0InI63En1t62PNmzsOguQZaw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E5E4E1F000C4;
	Sun, 15 Nov 2026 22:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794781807;
	bh=FS5qk1dfpPCEIZP1LBaj3fIaB9aWxROaAsOBlHXojYo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=onN03JHnCpN3S1pZurlORqIoIlBe4plxDSkxaNH1/7nM29RFJjMMarvZ2ubzBmwXf
	 8MQbe7Od7ueElMWe2pQAHI7pLr32VxXm5eKmO7xUEDCS9RpT7TvtFJL6JjSw6kZ9Cu
	 2/TuCAdkTO4FHDEg85V05ZyHMbwM5M/hLqNvYgdBhDDB+m23G5qXQDF3n2Xz7u398m
	 Leb6pSTE0yolFDL2RQRVmppuAvBMBW5JPYM0BDIkAPrdulZbdauGVTKXMcWQNpGY9y
	 hFUubB6X5eo3AIgkuBFo3iwlD1ikfU5rZgvhBeE1bmMEAwN3xnqL86HiQ0UEGPNRvY
	 mEem60uL0vk5g==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 5F7584A20F;
	Sun, 15 Nov 2026 22:30:05 +0000 (UTC)
From: Ronald Claveau via B4 Relay <devnull+linux-kernel-dev.aliel.fr@kernel.org>
Date: Sun, 15 Nov 2026 23:29:36 +0100
Subject: [PATCH 1/7] arm64: dts: amlogic: t7: Add ranges to periphs pinctrl
 node
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
Message-Id: <20261115-fix-amlogic-dt-warnings-v1-1-94cbd67a32ea@aliel.fr>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1247;
 i=linux-kernel-dev@aliel.fr; h=from:subject:message-id;
 bh=8C9vs4EiUCOX/M/ReYqYBqsGbRJMK4l65oqDaqs3hj4=;
 b=owGbwMvMwCWm1SvKXP3cUInxtFoSQ9Yvo+TKBd5Trrkoms/NmDrPhu2C6aP6kCePFEVEU/r3p
 +x2c53eUcrCIMbFICumyNI/1/LEu8tHz3zdo54CM4eVCWQIAxenAEwkS4fhn8Lew7/3NBy8/f2l
 8bZJKrN2yLH9ca+Zs8lA/fy3RacCL9Yy/E+8n/k7yejnqe5Pa95zlavPc/ogtDZ6uXsDQ9B5HpO
 tc/gA
X-Developer-Key: i=linux-kernel-dev@aliel.fr; a=openpgp;
 fpr=DFD863F61375BF917F0012173953305EF1D0EC3E
X-Endpoint-Received: by B4 Relay for linux-kernel-dev@aliel.fr/default with
 auth_id=744
X-Original-From: Ronald Claveau <linux-kernel-dev@aliel.fr>
Reply-To: linux-kernel-dev@aliel.fr
Content-Transfer-Encoding: 7bit

From: Ronald Claveau <linux-kernel-dev@aliel.fr>

Building the amlogic DTBs with W=1 reports the following warnings
for the periphs pinctrl node:

  amlogic-t7.dtsi:317.34-615.6: Warning (unit_address_vs_reg):
  /soc/bus@fe000000/pinctrl@4000: node has a unit name, but no reg
  or ranges property
  amlogic-t7.dtsi:317.34-615.6: Warning (simple_bus_reg):
  /soc/bus@fe000000/pinctrl@4000: missing or empty reg/ranges property

The pinctrl node has no reg property of its own, and its empty
"ranges;" does not describe which address space is translated to the
children.

Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
---
 arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
index 52e106d931db..aacdd0db1ca2 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
@@ -318,7 +318,7 @@ periphs_pinctrl: pinctrl@4000 {
 				compatible = "amlogic,t7-periphs-pinctrl";
 				#address-cells = <2>;
 				#size-cells = <2>;
-				ranges;
+				ranges = <0x0 0x4000 0x0 0x4000 0x0 0x2e0>;
 
 				gpio: bank@4000 {
 					reg = <0x0 0x4000 0x0 0x0064>,

-- 
2.43.0


