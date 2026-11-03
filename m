Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793691794;
	b=I+r5ObnoqXoH4NPC26fKIUZ26GQN+cBSN9+x5VPiMeqcD/wEnch70LBcrDV1lgcnmZad
	 QeLN9dCi+mK6J9Vr8EPtIX+u/a/RdD8yFpxCi9XnngQKzG7aB2PUj1bbaQs9YDy3GoTba
	 lex8OMvRhSNJoOnxxvj+q7GNP27PzkTmHVX9+eCZqa5H3WL8igbGdkcy53jIeUWH71xKT
	 tu1WfyW6/ok+Oe2hiwr89ZzIUs39sF8DySnugtLMagZQcwnx9WuiWVjzm4g07uUUUip3Q
	 qkVFN8n8VT6ejYilbFulrAfqb0BfvQq/Va9hz0loLwKu6nGot3zCoWFwVEJbaQpbadQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793691794;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=60XJaMYLbT/o6HXjRlwFTyr3vUVptClPltCAojDk0R0=;
	b=wikoaQ82CRzBCFxvsucircOiJNFrw0qKnzWGnzp+e6uPgmpPTPuGqQ6fM5hKPwwL3zKM
	 MKnOLKBo1K9c76crYwRswEJ1yjBaDszJbP7OGO/273eBvoVIn3TgV7CpeM9dUlIrv3MsB
	 4OP7AfgjaCdfoPML3iTSUCpz5EAQe0JEark4SEgWVV5S61oyhW6qrvwyCyrsrucFRP/G9
	 Dn9SVC2ZXGgnLlvs9koupOdrX2GScTTfaScd7gzfb1IgNsDzXjJ6zC1zK89WBsHqTlfsD
	 dhOoVhgfll3ATSt6zVcx3v5Or+OKausekMV710iZoIP3fNGiNaqy+HtUCLmSdqwps3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=n4zKvvA2;
	arc=none smtp.remote-ip=209.85.216.41
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDF74606A32E
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 07:43:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CDF74606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=n4zKvvA2
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3ae486f8a27so2182458a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 23:43:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793691793; x=1794296593; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=60XJaMYLbT/o6HXjRlwFTyr3vUVptClPltCAojDk0R0=;
        b=n4zKvvA2Ks462iJH3QATVJq4VUjpdSMQ89hWNHewVHAINcRR7rmjNVms0wzU1dX+Sz
         zEOa/1Ax2FtAcTiEqXlJI4bAMi0dOxnBo5jRYahFg3hGPtzg7qGeLesAa8F5+enPTLWE
         rRv7KBgOYQJzjTkuNF8ibN8H5TlJA/FJ8sRVKoM2XIjFMebSHvAgGl/X9xCoH1DoxD4y
         MqafcXTFWDLWI23P/zm9l8jeL2Wn02qYUpx6qVq81UKjk+CU1SVCzopQInRcR5vFIdy7
         4aTtlrRJ5/8uMKXCBWsAF/GE+Eut1UyqAqHIEQncVT5i3O3Sfu23P+NSg9+a/tJfwUN1
         V5JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793691793; x=1794296593;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=60XJaMYLbT/o6HXjRlwFTyr3vUVptClPltCAojDk0R0=;
        b=tDfGY48NH27oqlIchVud6jijw5utQWXLhY5oEh48AyarbdZ/rw+4bxKFHQX3cmFtJn
         Su6L2s8n23T0VdS3Z1lETE5PogUo1TTYAZB++GTUw/0q+skXE3hPc4KZNXgca9ssivwK
         ldtUvo2rum6tn8S55kzgJi6eTyC39yWrUQP78VH770U1Wq2fiC+ykpl9zQcldhHm/Vtw
         AwFi4FqB37/YofOdYS+rmbYP5Qvu9Y/DoRzuXIbPEA1Nzhv90JVqaQ76fd61u9byuG6a
         aBjnW95vDyePbTwy6Ah/lTyAB2Ylw4076efvn+xDeSNJvKyiRT49G0MMQRMLMeV71QvT
         pWWg==
X-Forwarded-Encrypted: i=1; AKwUvBxgZbkf8aZDxLSPqkvprCpwZQF0+/aV4FH2ciH8H1od75ygLKxUbar28JsQ4llqMUOCr8XidVtH5yTcjdQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+VnVPD9KY3gOhR2XiseNUiDmpflhZ2P7PegZKPLyORCPp6BTWw
	EQP/mlkW4SsEk7orbP+DLMAslAUHEVz+tKPMD3esPFCutszg4YU4uHMS
X-Gm-Gg: AYBFou1YDdrul3Bx7OMvfCt81lsmAE79sQlgolLd44IFKiWA3Z9GE+RdjBmLj9J2Qsc
	fjX8NIgTcK/utPDXU3vkoYOjNnW9C80aY9SAE5ZWceYQ5LEpgGSxPsP2VsBPYCW2FuPKMQtlF43
	RJHqiuNgdLLkbWNlXB2aYbKfRYeM4ajvhDO7UGwVn5pg7adQM5ewz65uGuv3UW3vd+zRNZRSuxA
	v4/KLHjApripY0BsdqKRpxomCcbp+hDlUYxkDzyfLpB5k++bpQP1BPnYVmlyVyLiq+RY3Fuxkqo
	PaCb6zkOL//USxzvTmOHwh9S/xWYeFWKf8qMwz/Tkfj3Mwr7w8NLTK0Nr9MxEPSIMEsGL+GEkiN
	ibu4J2KZwSC/m3y3FFSTFXPArZYFCEq6KJLK4Go5EOswLi4cxyjwphNCvzc5wTUUFK9lAkm/maT
	0gGACDGh+JLnwhyDhM0O7/ry/sXC4VDvHY5+E3JIVmV6/+ayvYjIQpBW2VcMNAJ6GV2xz55tBP+
	/b/JdGKRHULhxdXcXNJMYeiPSs8UI5C8Yb9KC9Q1Ts9LcsvC9NKoiApuzoboesNH/3lwI0oRsDK
	59iVEWInbxmWHrTjRKeZh5FeMma/VOrnrw6Yb1Jej8YgSTDX7Euvi8w06+EVBDoLloQsdyED1dR
	3OzcvH7MSm+eh/XCJzSofjAPACne9vJLaqZ+MrT/z73WMfN7zHWcEpAeisp3+QA+KaRg+1je3Wm
	HkwX5qMKTY6u4QK5R/qalnYwIl
X-Received: by 2002:a17:90b:17cb:b0:3ac:9ed8:f309 with SMTP id 98e67ed59e1d1-3ae89736030mr10686171a91.29.1793691793151;
        Mon, 02 Nov 2026 23:43:13 -0800 (PST)
Received: from [192.168.2.34] ([2403:581e:d87e:0:739f:50a5:e171:f133])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c903d0dsm2956769a91.12.2026.11.02.23.43.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 23:43:12 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 03 Nov 2026 17:40:09 +1000
Subject: [PATCH v4 21/22] arm64: dts: apple: t602x-j41x: Add
 speaker/headset jack nodes
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
Message-Id: <20261103-macaudio-v4-21-637484efe46d@gmail.com>
References: <20261103-macaudio-v4-0-637484efe46d@gmail.com>
In-Reply-To: <20261103-macaudio-v4-0-637484efe46d@gmail.com>
To: David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 James Calligeros <jcalligeros99@gmail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>, 
 Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>
Cc: asahi@lists.linux.dev, linux-sound@vger.kernel.org, 
 patches@opensource.cirrus.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3735;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=Y5xIM4BZ0PHyivynw40OAddi1sDRIGnERSTTSJ+mmxQ=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFkv+y9wRso3TUh9auS6Msk2fH98Z+jd93PUc9fpqf65K
 rjLdKdTx0QWBjEuBksxRZYNTUIes43YbvaLVO6FmcPKBDJEWqSBAQhYGPhyE/NKjXSM9Ey1DfUM
 jXSMdYwYuDgFYKqNRBgZ/l1zC6o+0FBrukKdT0arUvvX43dRzcYnMjyW5bUY1ApOZ/jFXCG+ve/
 1Wrd0w8Dr8vOtLfWkeWfWpr8tnvh/bZh6Ix8jAA==
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

The M2 Pro/Max MacBooks  integrate Apple-specific variants of
the TI TAS2764 and Cirrus CS42L42. Add these nodes and advertise
them to the machine driver via the sound node.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 arch/arm64/boot/dts/apple/t6020-j414s.dts      |  5 ++++
 arch/arm64/boot/dts/apple/t6020-j416s.dts      |  5 ++++
 arch/arm64/boot/dts/apple/t6021-j414c.dts      |  5 ++++
 arch/arm64/boot/dts/apple/t6021-j416c.dts      |  5 ++++
 arch/arm64/boot/dts/apple/t602x-j414-j416.dtsi | 35 ++++++++++++++++++++++++++
 5 files changed, 55 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t6020-j414s.dts b/arch/arm64/boot/dts/apple/t6020-j414s.dts
index 631c54c5f03d..2df6a39c719d 100644
--- a/arch/arm64/boot/dts/apple/t6020-j414s.dts
+++ b/arch/arm64/boot/dts/apple/t6020-j414s.dts
@@ -24,3 +24,8 @@ &wifi0 {
 &bluetooth0 {
 	brcm,board-type = "apple,tokara";
 };
+
+&sound {
+	compatible = "apple,j414-macaudio", "apple,j314-macaudio";
+	model = "MacBook Pro J414";
+};
diff --git a/arch/arm64/boot/dts/apple/t6020-j416s.dts b/arch/arm64/boot/dts/apple/t6020-j416s.dts
index c277ed5889a2..7f3f0d6eee87 100644
--- a/arch/arm64/boot/dts/apple/t6020-j416s.dts
+++ b/arch/arm64/boot/dts/apple/t6020-j416s.dts
@@ -24,3 +24,8 @@ &wifi0 {
 &bluetooth0 {
 	brcm,board-type = "apple,amami";
 };
+
+&sound {
+	compatible = "apple,j416-macaudio", "apple,j316-macaudio";
+	model = "MacBook Pro J416";
+};
diff --git a/arch/arm64/boot/dts/apple/t6021-j414c.dts b/arch/arm64/boot/dts/apple/t6021-j414c.dts
index cdcf0740714d..ec4050ec0ecf 100644
--- a/arch/arm64/boot/dts/apple/t6021-j414c.dts
+++ b/arch/arm64/boot/dts/apple/t6021-j414c.dts
@@ -24,3 +24,8 @@ &wifi0 {
 &bluetooth0 {
 	brcm,board-type = "apple,tokara";
 };
+
+&sound {
+	compatible = "apple,j414-macaudio", "apple,j314-macaudio";
+	model = "MacBook Pro J414";
+};
diff --git a/arch/arm64/boot/dts/apple/t6021-j416c.dts b/arch/arm64/boot/dts/apple/t6021-j416c.dts
index 6d8146b94170..0037346959a5 100644
--- a/arch/arm64/boot/dts/apple/t6021-j416c.dts
+++ b/arch/arm64/boot/dts/apple/t6021-j416c.dts
@@ -24,3 +24,8 @@ &wifi0 {
 &bluetooth0 {
 	brcm,board-type = "apple,amami";
 };
+
+&sound {
+	compatible = "apple,j416-macaudio", "apple,j316-macaudio";
+	model = "MacBook Pro J416";
+};
diff --git a/arch/arm64/boot/dts/apple/t602x-j414-j416.dtsi b/arch/arm64/boot/dts/apple/t602x-j414-j416.dtsi
index 0e806d8ddf81..852fbcd6277a 100644
--- a/arch/arm64/boot/dts/apple/t602x-j414-j416.dtsi
+++ b/arch/arm64/boot/dts/apple/t602x-j414-j416.dtsi
@@ -43,3 +43,38 @@ &wifi0 {
 &bluetooth0 {
 	compatible = "pci14e4,5f72";
 };
+
+&speaker_left_tweet {
+	interrupts-extended = <&pinctrl_ap 58 IRQ_TYPE_LEVEL_LOW>;
+	shutdown-gpios = <&pinctrl_ap 57 GPIO_ACTIVE_HIGH>;
+};
+
+&speaker_left_woof1 {
+	interrupts-extended = <&pinctrl_ap 58 IRQ_TYPE_LEVEL_LOW>;
+	shutdown-gpios = <&pinctrl_ap 57 GPIO_ACTIVE_HIGH>;
+};
+
+&speaker_left_woof2 {
+	interrupts-extended = <&pinctrl_ap 58 IRQ_TYPE_LEVEL_LOW>;
+	shutdown-gpios = <&pinctrl_ap 57 GPIO_ACTIVE_HIGH>;
+};
+
+&speaker_right_tweet {
+	interrupts-extended = <&pinctrl_ap 58 IRQ_TYPE_LEVEL_LOW>;
+	shutdown-gpios = <&pinctrl_ap 57 GPIO_ACTIVE_HIGH>;
+};
+
+&speaker_right_woof1 {
+	interrupts-extended = <&pinctrl_ap 58 IRQ_TYPE_LEVEL_LOW>;
+	shutdown-gpios = <&pinctrl_ap 57 GPIO_ACTIVE_HIGH>;
+};
+
+&speaker_right_woof2 {
+	interrupts-extended = <&pinctrl_ap 58 IRQ_TYPE_LEVEL_LOW>;
+	shutdown-gpios = <&pinctrl_ap 57 GPIO_ACTIVE_HIGH>;
+};
+
+&jack_codec {
+	interrupts-extended = <&pinctrl_ap 59 IRQ_TYPE_LEVEL_LOW>;
+	reset-gpios = <&pinctrl_nub 8 GPIO_ACTIVE_HIGH>;
+};

-- 
2.56.0

