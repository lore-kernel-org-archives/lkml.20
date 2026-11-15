Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794781808;
	b=3xlNBLitZaih8+ftVyUhpZSdP/Ao+z6vo/GUOu3KuKvsnioneTBwRmScx7eWGY+5bIV+
	 gajBrn6dhXI0BquGWQ2BS5lc9y5L7RRyuw/WsAhQ4ZY8AfQX23ahfxRveGEKRUSwlUogu
	 CxRApx/aKUdJez10rbD8JHPugfi5uN7xAcU5rINuF9cBBE2jlumbtyTsfmETKWEnXMhpg
	 ilhGVEhvFwacDlOvjyutOiE9ogzQsqFtgVp81OqK55mkWTAqXiKERtokT9zAxJRTKDioM
	 x6Ip7v3Y0hgH4McpFT9dQV6CshxOH+ihWsVA60GXRRu3lJ0K4Imo3A3kjXsiO5NH8hQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794781808;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=N9+biuUIEM5/zNgR39dPI6uJFxxfJVmgO+GGjV9BWcQ=;
	b=C9oQ/IrK5EgDj5H50g/g6rdP5LOR2ZiL9eBRv4pwHFgUTpdoA20+Fu4yxVwtT50AWIVF
	 RIkg94anDGDqP6wn78DjFbrAnXtm3Np3YWsh/dMziA+M5qv0D3R2SgTrnH3HdvIIO7Hib
	 Cj1XEx5tWiqY3BsgkvwH5MiAxEaZ1TKKp/9kWFSXX+Eo85M/UlFRZg5V6ila25f2StMCo
	 v55DLsRu+lv/gobXgDFAo/C6jbcjAjcxgWYxLPMIqEZ9GybONdRoFYDqAalJEwP/+EQ/a
	 LhbqGZQ+Sdqhu5o82ssnqFGUCGVeKP7W6xAQlKwzFxkju/7Cfa8tRCm/Boy+qoE6dxA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FYLwZ2W2;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40891606A8A5;
	Sun, 15 Nov 2026 22:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FYLwZ2W2
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794781808;
	b=PVxPlVe30QGnpQcqGa7X+ey6xzOfi1inTADaTRTeTZ6pcSpeU+5O7ZTpTQUiQG8OgYK6
	 zeyuJhtPdP5W+nB/G+fDWCrBGNjHJtE6fq+xLq9sPbybd37SxZsWkTdMUOpR5MgR8DcOv
	 NxD1nNKEKR0V6TNTlfz1SpeSpGOd0zCrBcJ5BhVsc5iVJs885xyvLrAlGeOaaT8n1e+Vu
	 v+A3AOa1icEyoRKpXt/CaKoCBJjZRWZbFGW5xkJzShL+QB/Qcpe8OO8CD6iyhkRKYl30V
	 4a3s7vx0TZzcTH0uJt0iYTO4yiLMmqZA7CHIN4odZpRrLWEt2m8LFiuO7htgBfrpJNA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794781808;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=N9+biuUIEM5/zNgR39dPI6uJFxxfJVmgO+GGjV9BWcQ=;
	b=opi0RPhJrZ8hugvsGPhRjDZwn7xe0y3/urcKT8tIgCIRJpPuHCVnnGC+Nh+DQmdtc2ha
	 TxS/vFBttOArqLvYaOpuPFLUr/Ur+o1Ytv7beTtF9vKbAfXN7gisjMdY42LkcrQTeBSaZ
	 6OcP22O6RJnCaF1AfC+BleOeZBBhijfiWOUyMbIhpBehc+dFNzX7zjVn7Gatt4vOwT/Se
	 1xJAlip6kCJEP63gy6iUFxVQ07+L7QFzVJ4S9p+ysEfGYNq5Y9IR+wXqnsu9LP2qgc9TM
	 9BqaSS/QyABaWd6oKaNEY3aWC+osDoadhHjuBlHhvS6kZUXPOkCDXMT2swPJWHsoHUA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 925041F000CF;
	Sun, 15 Nov 2026 22:30:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794781808;
	bh=N9+biuUIEM5/zNgR39dPI6uJFxxfJVmgO+GGjV9BWcQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=FYLwZ2W2zRetle4GNYU3salRmvv6FLcwBxWkK8LuayOxdRL6cvOcW15obmT+dtd1g
	 A20DvLqo+aEVQ6YCqU6uAVoJxJXJwPUwq6dcWm1EI35+4tG2epK/8GFtqByXiz8wNW
	 xqExlD2xO+nczC6Flx3FEyzUKCh217kTQ2OK6kIaX43knzwDSdsHfvCDQq1/9TS+yy
	 jTT4lMlRELjIi/evesq0qb9nK/Nc8ANa6oGlcsrPpVaoxBXltv+YnzW46wvFCfQ7gu
	 uyaD1cJeIvivyBGLlBhHdBC/JRI6XGUcV1OjDzNZ4fjJjsQzA90kYZuCPA21juqddp
	 VEcP5x9zQznIw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id DCB724A238;
	Sun, 15 Nov 2026 22:30:05 +0000 (UTC)
From: Ronald Claveau via B4 Relay <devnull+linux-kernel-dev.aliel.fr@kernel.org>
Date: Sun, 15 Nov 2026 23:29:42 +0100
Subject: [PATCH 7/7] arm64: dts: amlogic: s4: Add ranges to periphs pinctrl
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
Message-Id: <20261115-fix-amlogic-dt-warnings-v1-7-94cbd67a32ea@aliel.fr>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1092;
 i=linux-kernel-dev@aliel.fr; h=from:subject:message-id;
 bh=nP0f/fVYX53MqrUgOulbTSDvdQTy7E12SUoVJKP75i4=;
 b=kA0DAAoWKo0VA3vnMSIByyZiAGr6MmujoGLPbGR+bM44AFsm7XzZ9IeDH00NoszHjeuR2WzUN
 Yh1BAAWCgAdFiEEj505yO7Txcz1vCdkKo0VA3vnMSIFAmr6MmsACgkQKo0VA3vnMSIzZAEA2ahq
 lVPO8afaYdsMfkVliu59cZ9V6ojK/X5rI8G/O70A/A7cFo/zf8BlNzxcqAx58WmtK4JD1fyzw1N
 Zwq+jrmMI
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

  meson-s4.dtsi:162.34-622.6: Warning (unit_address_vs_reg):
  /soc/bus@fe000000/pinctrl@4000: node has a unit name, but no reg
  or ranges property
  meson-s4.dtsi:162.34-622.6: Warning (simple_bus_reg):
  /soc/bus@fe000000/pinctrl@4000: missing or empty reg/ranges property

Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
---
 arch/arm64/boot/dts/amlogic/meson-s4.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
index 2a6fbd530836..a0b47c505ab5 100644
--- a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
@@ -163,7 +163,7 @@ periphs_pinctrl: pinctrl@4000 {
 				compatible = "amlogic,meson-s4-periphs-pinctrl";
 				#address-cells = <2>;
 				#size-cells = <2>;
-				ranges;
+				ranges = <0x0 0x4000 0x0 0x4000 0x0 0x2e0>;
 
 				gpio: bank@4000 {
 					reg = <0x0 0x4000 0x0 0x004c>,

-- 
2.43.0


