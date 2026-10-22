Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792699615;
	b=qp+N6+aERtNFthdOLXr/7LUZs8tCNChgWoqjG0iCsP/sP1WRmWZCTPbkIm5JUgvLN6NW
	 yy/b+BaMJWs9DR677wukzaNbeM526WSTuJt3/d8ls5vFRz03fYm42uIkE8f40DwuBIy7M
	 UC55u4C7DxpdpdK0RE3abTFNEtN3eF0BAkKvSnig41KqaEZvn/Gw5W4S/TLyJ0NkzZSyH
	 55wTUZX+9xVHNW6wbigRnVs1MkVpP61JZFXg6ngLSKFymcdwe+BAIEEx1jIRL3s23yzeK
	 lfbwOyP+eDlcW8coQ8h3GCicOl2llv/8yC/YDl6Z/9Z5BtZ1CUE+1ANYEtnNzmNCa+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792699615;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=B88mpadYYWmyEssRGoyIfGe+/tgPvAtSdH5NBRIaaYg=;
	b=KIPDggBkZwZVtk4nNsSBI7hat2FoToN/2dor9c+GyoUv4AiyHezRYUJsDh+YNK9PjHj0
	 E/sOGgrjEFflhzweNgBEypblZdgpyqxD+6cP76CDV25E6RVDHp31G3tB5FuBoAbJ1TSch
	 dYYDt6MmZsxCmEEsXFS2xat6DrFLycIwLdcRSfqWamQvl65svs74oJfOx9AJ22FfjFOy1
	 tTe1vtr6iQ0imRum01OYSG6OqC73c+LLyhowRuDMuaLXl+NULWJyZBpPHAqVry1ehYar8
	 Qpt4ICUHblimcxc846xKBe2+8XkINOL0WDTFeNqNTeZZeeCUJun8qsPV4WhH1L+wxSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7BFB60A3835
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 20:06:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D7BFB60A3835
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a1df4c0966so648925e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 13:06:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792699613; x=1793304413;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=B88mpadYYWmyEssRGoyIfGe+/tgPvAtSdH5NBRIaaYg=;
        b=S19ZxSDeNDr/Sp2g8Emrk1y/tdO2HG0zgEHwKoqoIBDoe+qDt6EKNBuM83jy9HU5RY
         l8RFRaj0jujkCmRw7SKnVZRr+NnAKqO+Dr/f8tdRuKOcd7vRennOghI30jY8fS+/nkMv
         6d+UlivR+T9NRmusrIbWOcY+v1f4Eq2m/FYvXMt5WPbQLclAubBp+sCCGCJ2L/4bfeJL
         OlBRjCkQ5JetuZ7fXyyTbbi9U2rM3cHlzkAx+v4VTD09VxDzi4AMOohAevGq158ii+C6
         nfyqcg1NO8aeJGWeBIBWy/ZCbt5e/hm95gqASsK1ssk+iteUw0kL7ULe9XJ5eGtvbqmL
         tykQ==
X-Forwarded-Encrypted: i=1; AKwUvBxHdzKE35i9SIwfBFPMvSk7eJVn0rqwCzw/qgbIHAUJoZDvEBuAgQuS3yfdTllRP3OtMGSoZUGphh/eJ9k=@vger.kernel.org
X-Gm-Message-State: AFq9FYIBSd56Z0V0VrCry1JeFGb06Q6ttBNv/xVUcWFxEXTIipPQRRaM
	qglCmDbLPPHOOcKDannbDD7vQYApei8vOWmunSBqou/UlOtm9hlYRH+6Hck9pocKFPM=
X-Gm-Gg: AYBFou0YnRjje/ZIEsSfAoP1WLmRHmaiXFusXBRrBkZxxGuhf7XNXwY6aOIq227+KJ4
	aL9pbb74jjw67L+mA3X5xe3EUYoY/vg0GRlvISAUW0NqOkEhPNpDfgm9gsPyFH+BwUrudlu00gp
	jMFogUVizMofTdMy+YoM1icNqaof8COhQD5rvs2jh5EaG+/1MC4RLwNm3sWCO3rKC51/7VFa0CM
	q81vYD4F6zwwMZcH+i7WTjuZyGAuDNJV6ILW4XcC6McDpHaHcaZFX8ByDZ1xp/Qwh7SfilBDaiB
	2r8alzn25ODL22GcSHh2Plw0EV0Gt9LwLSahgjQ1U9iCHWKFHZHsDmyMkFS05rReWAVYRPxV0Qc
	08NDiFimZ8PExYEmdggyNoj0752dhdsot0aJoXB9P6SJ+5jT3JoHe9sW7siz4mTsGnNka/mm9ZF
	9GdqrVaeCKPz1N5JmnURkpgz8UxTLCS6kOCH/jH5VK83/lICMhmREpNQCKyABNiQBbj7VRvTbji
	fKrdx7KAkL2r1mh25/GsvLTiM34emn2SVBX/wM2I6o/kJFMHIhYR1QW+5EaSw/ym1ChetFfcXIS
	4RJ3Mf5+VmgvofM=
X-Received: by 2002:a05:600c:3b0a:b0:4a0:20b4:ba93 with SMTP id 5b1f17b1804b1-4a211c869d9mr2350165e9.16.1792699613390;
        Thu, 22 Oct 2026 13:06:53 -0700 (PDT)
Received: from threads.localdomain ([81.79.62.202])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a2123a1797sm35965e9.1.2026.10.22.13.06.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 13:06:52 -0700 (PDT)
From: Lucas Tanure <tanure@linux.com>
To: xianwei.zhao@amlogic.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	davem@davemloft.net,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 7/7] arm64: dts: amlogic: t7: khadas-vim4: enable the ethernet port
Date: Thu, 22 Oct 2026 21:06:40 +0100
Message-ID: <20261022200640.3101932-8-tanure@linux.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261022200640.3101932-1-tanure@linux.com>
References: <20261022200640.3101932-1-tanure@linux.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The board carries a Realtek RTL8211F gigabit PHY on the external
management bus, connected to the MAC over RGMII.

Enable the controller, hand it the ethernet pins and point it at the
PHY. RGMII needs a delay on each of its two clocks. The board traces
add none, so the PHY adds both, which is what rgmii-id asks of it.

The PHY interrupt output is wired to GPIOH_6, so link changes are
reported instead of polled. The PHY reset is an RC network on the
board, not a SoC pin, so there is no reset line to describe.

Assisted-by: LLM
Signed-off-by: Lucas Tanure <tanure@linux.com>
---
 .../amlogic/amlogic-t7-a311d2-khadas-vim4.dts | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
index 0fa83362b417..4914b0dff8a8 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
+++ b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
@@ -14,6 +14,7 @@ / {
 	compatible = "khadas,vim4", "amlogic,a311d2", "amlogic,t7";
 
 	aliases {
+		ethernet0 = &ethmac;
 		serial0 = &uart_a;
 		mmc0 = &sd_emmc_c;
 		mmc1 = &sd_emmc_b;
@@ -256,6 +257,24 @@ xtal: xtal-clk {
 	};
 };
 
+&ethmac {
+	status = "okay";
+	pinctrl-0 = <&eth_pins>, <&eth_rgmii_pins>;
+	pinctrl-names = "default";
+	phy-mode = "rgmii-id";
+	phy-handle = <&external_phy>;
+};
+
+&ext_mdio {
+	external_phy: ethernet-phy@0 {
+		/* Realtek RTL8211FD-CG */
+		reg = <0>;
+
+		interrupt-parent = <&gpio_intc>;
+		interrupts = <GPIOH_6 IRQ_TYPE_LEVEL_LOW>;
+	};
+};
+
 &i2c_m_ao_a {
 	status = "okay";
 	pinctrl-0 = <&i2c0_ao_d_pins>;
-- 
2.56.0

