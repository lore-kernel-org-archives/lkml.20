Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793805320;
	b=hvOWdy93x7ZfimdaYVNROfEu0yMHU86DkUvlBhOFfZI5yoBTYMoAkkVDWoIHBGjcRqFC
	 qi4AM2Nc9eE4i88lMCh258ft7iAdatBT6DpF+R9T4kasIzxnh99ejkQRyt+i+T2/dklLc
	 2BF0o80ncgF47ulqVVNKZEuANjH7OnGGRpwOVNq7m7ZmbfH7TOJjXkEXqMuuudlw37EIw
	 d40JCF7wsiqBew+mL0+K07Oh8fVBm+Tlukzcx3vpdniL5MvZQ2y/ZGJm1tA1XxfIF5lKk
	 e1l32TVMUlQKLOcj8bLXN5NjaPvOTNBUUqweUnNltt27DsfJ7J52twIBUS0JxWyas6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793805320;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=GpnNU5B9NJK77jC6aRes+NautYKxyKYAGU+8JJGRzB8=;
	b=Hc1otda65tpvZwpfQVwTUiT1gYBwr7GRU54I0iyBJiQFE3gbyXM0UuRoW56/jg3fuzc9
	 G3KKmKG2DJU9hYW3W+/jj8B3OjmPz8eOntz1Y1pRvqI5MfOTC1vpPy96NfmtRcS9ZKYNO
	 L784B+J76LrNH71HPmUPPnrGbbofzSBGnco78oKzqQm1gH7pZP9/t+w5ft3SCDS2WOtFm
	 dy/lc3nt1qPkulAgE94+3fVJ9LdhA0OfbgGihyinxJPC2cz7yrGVJ3lEgoH+zBB4Z1PAc
	 xRjaYjH4g4RTQ1EZeKQE84jOqeONqH/wocQIHwBRhEvDoqd1mmqjjltDbf9htUEPaDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=M6LY+J7M;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C2C0606D810
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 15:15:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1C2C0606D810
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=M6LY+J7M
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so8551615e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 07:15:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793805318; x=1794410118; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GpnNU5B9NJK77jC6aRes+NautYKxyKYAGU+8JJGRzB8=;
        b=M6LY+J7Maap5Xkn35WhtQ4qpZIjdiLwIhtpYcaP9gnj984fV0oknNqjEMp2OegYMFI
         aumcBMEIAt32eGfRe7wcGT6ACO/pz2N4VVwXNjjMbo/9g2J6K1XnKxM5cRImahGq06HQ
         tJ4MoUZG1R3aDKsLG7SxTca8A9vCquS8imLq/JEqJpJkM/4D0HFralwa8VyQypN4ygY0
         IRoe8JhKpodd9P6m76lJhYL59HHtAblnYAjAr28Q62qBncgmr7ViCJYBt/bePYtM9hjr
         UFMduYQXZEweWE7+NhoNJFhYMYTKm/Y7uq0GdGsHlB6hIR38Re0OSMu7KSxgh+c2zvMS
         /Jfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793805318; x=1794410118;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GpnNU5B9NJK77jC6aRes+NautYKxyKYAGU+8JJGRzB8=;
        b=WGyvb4zl+hnfiTmP9vag863VKRQ3EidDlFMeSJQgDTILEFTps6/pg8OOgx1ReMT/NB
         b5eucrD0YmDvYPTjD+bE9aJNrj9yFallVqE95EpEaW9KBTSOKEhTo6m8qr59DFQZz/1s
         Wa4HmV+bGxNI9M/dh5G4IfM7SqjXiy5Wen0qBFfaXKv9G1gYo47hk5zcMcn7SMy7YX3D
         eeyTiJhtnNOLfGhax1TX4jb3LZjn2Qf+tpGexPLYsxlPpEV8CShlwxqIjt0nU4Kpj76K
         aJ2rhMeSlqyc//EqESjqFSC4aiDJoI+NM/i6Vndax1/EOHVQ2N8e+eiiuEap/MbTX/By
         XTvQ==
X-Forwarded-Encrypted: i=1; AKwUvBxUyPyI0YDcPQJw4sQ81gl5vMG3/P/mVK7mxcEZUjxpc1mxvVRq5dv5GillekEkKnHO+jrZjGOF/5DKKSU=@vger.kernel.org
X-Gm-Message-State: APuU4Z988i5VXlpfbz02f9qSZFFcL5QId2Gv0RhN2DxGfFZP/M3uau+p
	PWDQuiEYm/koO8zB/wZC3pCU3h3E0VoOUrsbsMrc88jKJRjBYZNc9TEcLd6UAw==
X-Gm-Gg: AYBFou3Upph24bY2HhjWXnyXH3Zrp04Zb9DfeDITHjz33DYh71Hqo9SN4wIOQO+06Bs
	sDbEBjMYisjeHLZmVVJGqqqOv+Ldr97Afdjo0k0Shpm9GTxSNle+lHmXW0HgeppsH8zJhpjfw3z
	Hwyd6VDLONMQL4ECLVH/FSbimrYp8ktT4JVmA2iQEqX2/xvURSWcSyqW2V9A/Q4Ljgaw0Cs2XKh
	ANqYwlgUJYKYOaflXGY1YbyLcgnJlYTO6kkAtdel4TP8Cm6Q0gYQ0sNw7k1OqWe6vlzamg/c2nJ
	VZMNKllvzQb42rAB7+5s886qHZ/T/UIkrqlmLFoqMKVDvzcA3kzKyz7OGKwj7DDuBZl/Y6JvZcH
	u7sKt6EkKSVbj9nYBZZdiMQYPVPrHDFayCXAoQ01yfagu17wCtuEQrDKk6Gs33Qo7F4EvaIcDF2
	hxAwUwfAlU52cCHu24b6/HoT1/SZB5qmC5wjHnlVGtG1VmaGEJWXicjJaEVvXw4E7c6vfW4ojLS
	4AyD4+kgJEoOdCsXPEdq+awPP4TF1+8I9cCwHcucb4DVH+E2+ZQEIBQIZ2FTe/N78P/K3+tkEI+
	Au3qx7Ob+vDT5DTrU00nukmvSMKOYEDDveKQSA19d3bkk8cctbFeza9BAaDuolAL4A==
X-Received: by 2002:a05:600c:4e11:b0:4a0:eae0:769a with SMTP id 5b1f17b1804b1-4ac185bc7d0mr364163455e9.28.1793805318506;
        Wed, 04 Nov 2026 07:15:18 -0800 (PST)
Received: from [127.0.1.1] ([2a00:23c4:a702:d301:f5b6:cc80:9262:e168])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fee968763sm4435197f8f.56.2026.11.04.07.15.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 07:15:18 -0800 (PST)
From: Biju Das <biju.das.au@gmail.com>
Date: Wed, 04 Nov 2026 15:15:13 +0000
Subject: [PATCH v8 4/4] arm64: dts: renesas: r9a08g046l48-smarc: Enable
 USB2.0 support
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261104-usb_rzg3l-v8-4-ab109c4bd108@bp.renesas.com>
References: <20261104-usb_rzg3l-v8-0-ab109c4bd108@bp.renesas.com>
In-Reply-To: <20261104-usb_rzg3l-v8-0-ab109c4bd108@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793805313; l=2436;
 i=biju.das.jz@bp.renesas.com; s=20261020; h=from:subject:message-id;
 bh=YojL+tlinE7FIZ2yeWFo6aqIrFv+jHkcwPWa0n5GxOM=;
 b=qvqZR72nd3jkfSRiegsp8j/z9jBmkwHWkyrsvNPMZD0V96dBR0A57iLA022H7Js+e5d7JveyS
 2lHoXLZDrTvB/6Bl/eYIAv6+X21qKBK0x7WHXSi52+0tIh5OSjDppeJ
X-Developer-Key: i=biju.das.jz@bp.renesas.com; a=ed25519;
 pk=yzD2T1OLS3lEYflbk64xhLlxhk75lZ+NoOtkTOqrlVw=

From: Biju Das <biju.das.jz@bp.renesas.com>

Enable USB2.0 Host/Function on the RZ/G3L SMARC EVK board.

Drop the explicit "disabled" overrides for the OHCI, EHCI and HSUSB
nodes, as they are disabled by default in the SoC DTSI. Enable the USB
PHY controller and both USB2 PHYs, with VBUS supplies, and add the USB0
pin control (OVRCUR/VBUSEN). Port 1 has no OTG pins.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v7->v8:
 * Updated commit header.
 * Dropped redundant nodes from board dts as it is defined in common
   board dtsi
 * Dropped usb1_pins.
v6->v7:
 * Moved the patch.
 * dr_mode changed to 'host' as function is not enabled yet.
v5->v6:
 * No change.
v4->v5:
 * No change.
v3->v4:
 * No change.
v2->v3:
 * No change.
v1->v2:
 * Updated commit description.
---
 arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts | 42 +++++++++++-----------
 1 file changed, 22 insertions(+), 20 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts b/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
index 68d7b579e352..9ffaead2c6be 100644
--- a/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
+++ b/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
@@ -71,18 +71,6 @@ codec_dai: codec {
 #endif
 };
 
-&ehci0 {
-	status = "disabled";
-};
-
-&ehci1 {
-	status = "disabled";
-};
-
-&hsusb0 {
-	status = "disabled";
-};
-
 &i2c2 {
 	pinctrl-0 = <&i2c2_pins>;
 	pinctrl-names = "default";
@@ -134,19 +122,15 @@ &keys {
 #endif
 };
 
-&ohci0 {
-	status = "disabled";
-};
-
-&ohci1 {
-	status = "disabled";
-};
-
 &pcie {
 	pinctrl-0 = <&pcie_pins>;
 	pinctrl-names = "default";
 };
 
+&phyrst {
+	status = "okay";
+};
+
 &pinctrl {
 	audio_clk_pins: audio-clock {
 		pinmux = <RZG3L_PORT_PINMUX(H, 4, 6)>, /* AUDIO_CLK_B */
@@ -217,6 +201,11 @@ ssi0_pins: ssi0 {
 			 <RZG3L_PORT_PINMUX(H, 2, 9)>, /* SSIF0_RCK */
 			 <RZG3L_PORT_PINMUX(H, 3, 9)>; /* SSIF0_TXD */
 	};
+
+	usb0_pins: usb0 {
+		pinmux = <RZG3L_PORT_PINMUX(3, 0, 12)>, /* USB20_OVRCUR */
+			 <RZG3L_PORT_PINMUX(3, 1, 12)>; /* USB20_VBUSEN */
+	};
 };
 
 #if SW_SER0_PMOD
@@ -277,3 +266,16 @@ &ssi0 {
 	status = "okay";
 };
 #endif
+
+&usb2_phy0 {
+	pinctrl-0 = <&usb0_pins>;
+	pinctrl-names = "default";
+	vbus-supply = <&usb0_vbus_otg>;
+	status = "okay";
+};
+
+&usb2_phy1 {
+	vbus-supply = <&usb1_vbus_otg>;
+	renesas,no-otg-pins;
+	status = "okay";
+};

-- 
2.43.0

