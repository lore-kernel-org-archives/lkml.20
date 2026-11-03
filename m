Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793723846;
	b=x30xqFXY5JjmV3XDBR0SK2CsIoVmJ0/PLPF5ld42pPb9mvCiryov9XsdHNesSt0sBocD
	 dJ0GEXzrKKBeS+NxF5BeLgvUsY2tuVay46vHtLOL9TznUlm3r5Zzof4RtARkDmzHZ8M44
	 cLmhXzybdL6bIIyUyPRZivVH4ZWx/Niu8Tgx2tkJTnynC/9meiag0244294MCd/JBCK1Y
	 MGN8Kz3mhoCbmTKiktfeBEhPES3XY0nEokuvH1t3I91WWeNoH3liLyyvkdkstfquBSzgD
	 u2hlcs270mNhvNo1RBHyab9d60uE+8q5WjYHT/G+qZzyOGQc4ubD/2bHG3uuAL25STw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793723846;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=rvhYGG2+F5DLhHvBXxyAZN8hokDea2WGLIFovieWgBM=;
	b=A2xWaX1cndKP55CKFDJyqSyyBidqKfqzX7JuR5IOyzA4u4iHVnHS1F29S1nqMgdh8/sk
	 7WDyIh3i+9vQH2J938Lc+GNxa6dxD9dCB7FwTfNYDBJdGEsMQ+tgjnPThCxl2l9mqwQ89
	 Xwqh1f9Xpijo1C6ddEGY41a9GoP4jHnBZsgb2aYjmi7/Heu4oo0lL27hiQOyc6c5AkDxU
	 XFkfoWGmt6c17ExeoXPhPYXRM3rjpgJtxiqfFfZ44afvjun5ESp5Du5Qv608e9f756ruC
	 QEEAnjAUv4nijOPS2MD7iyLUqBUalGsejcbErBBmjBdPLdnfQKr9ckaj/WJgMLO9bNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EC2B6082BFB
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 16:37:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8EC2B6082BFB
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48e20ed3b9dso3867103f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 08:37:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793723845; x=1794328645;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rvhYGG2+F5DLhHvBXxyAZN8hokDea2WGLIFovieWgBM=;
        b=KdZzdLJkf/zuO2JKh7jGpy0TYfW7aSr+xjl8kuYsGY5qZaXc+KGI73gSULAfMhK+wC
         oYTJInhbSawmWYdIKslpUFKzv3UludQ3On9yI5I1R5n4wRSKYj3T9YVV1rVN3pbS6UWw
         CHWkt8h48BQkmJWVO9v2z9+2qRLSrGNJjkNuVgvxDnLMzhDn744ehTPZrLQeys21/4Ll
         qyYXjfbU1L/wNXVfzq9Q5dw5qPYXsl7pVafKRKDOPYNYp1DrvPWZhd5ommalURLmw9JB
         k8/RnzFBUu5A4WRM+0b1LG0EbFjFH8kxtTwfuV8Ugb7InL8arYzbSbVu/E4fzRAKZuTM
         XmAw==
X-Forwarded-Encrypted: i=1; AKwUvBy5EIRAlbQnjeoSUAg/VpRdLkV7n+e/htio7tTirtpvRaJLhXmzZwGCCaCyK7UC0SeJ8JXvzSaT6cHJFps=@vger.kernel.org
X-Gm-Message-State: APuU4Z/OKaDsyKGsctKpXego9494fDl8bOGCl+f/lN3WcVI6+4vj6X8D
	rVbOG7IfZYxFjbmzPYDrb2vF4EUaxNFNsOVR7UzzSX/B5AQCVcY33YtD
X-Gm-Gg: AYBFou3RLsTFvAl/wlEa5wwpV1g2RwCm2hQxbX4LAv6WT+AQTaGBJqSifHAXOfQcLdd
	2XJYgSuaiRRcIQgqz6R6UM+9n1JFW3v3x0/PLaLF9sMzGBvQ5BheIfg5ZwUGcHBK7GJt6wNMSSs
	st/lzyupPa9tEJ3Fjs20RJhpkmWGlZj0EcF2hSReGFgT3kwOmVHnAQQa+/n//vX6Xj71mOyhlsw
	/guZy8K7F5hMFfaAckmMxHyWfoR+XCmGHIQhKEfruM9GQClB5gjAx7E0u1hPY0YFKruNUoBWH4W
	ToKmGYdALQnXhydyKBBh/p6zDQdKHq4+tvRuOwYEtbz+RV1amCvXQWZzdTvQTCGSpg8P01Ybl0x
	s4wCN1VsQxq9x8eVficY1wxy3G5h3nUEBN1wegJFzfIpOzkgKGeZmgpiHj9xFbsefUa/9hv+uJr
	UE+eI67qw5grRsqDjCpEeeFm3LqM99YGyHo4q036fGYFzy7BZMD8NLOHp5NJyLQUX6Ugxbv60Ha
	Edt+SyPsPkzySCTb06VtX/cQjwl3/v2L0/gc0ujBm+kKOEDYk+IH8vPtucvWACcADWCddWtUBWR
	C17j+6p3/gr6fULSlExUK/6a00GqMfBs65bc8wuulYWtZuEoVtdfi0/wAycOgb2rY+/pyZc1ck1
	kSB5EVZzDLy5vXadpdr1mMBz3GsmYADcEyXnJShAHia4zxpY=
X-Received: by 2002:a05:6000:2611:b0:48e:4e00:b72f with SMTP id ffacd0b85a97d-48e6e50c8ecmr28996710f8f.32.1793723844739;
        Tue, 03 Nov 2026 08:37:24 -0800 (PST)
Received: from threads.localdomain ([90.254.187.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71a4d3e9sm29044772f8f.6.2026.11.03.08.37.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 08:37:24 -0800 (PST)
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
Subject: [PATCH v5 7/7] arm64: dts: amlogic: t7: khadas-vim4: enable the ethernet port
Date: Tue,  3 Nov 2026 16:37:15 +0000
Message-ID: <20261103163715.385394-8-tanure@linux.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261103163715.385394-1-tanure@linux.com>
References: <20261103163715.385394-1-tanure@linux.com>
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

Enable the controller and the management bus multiplexer, hand the
controller the ethernet pins and point it at the PHY on the external
bus. RGMII needs a delay on each of its two clocks. The board traces
add none, so the PHY adds both, which is what rgmii-id asks of it.

The PHY interrupt output is wired to GPIOH_6, so link changes are
reported instead of polled. The PHY reset is an RC network on the
board, not a SoC pin, so there is no reset line to describe.

Assisted-by: LLM
Signed-off-by: Lucas Tanure <tanure@linux.com>
---
 .../amlogic/amlogic-t7-a311d2-khadas-vim4.dts | 23 +++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
index 0fa83362b417..93327b993d39 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
+++ b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
@@ -14,6 +14,7 @@ / {
 	compatible = "khadas,vim4", "amlogic,a311d2", "amlogic,t7";
 
 	aliases {
+		ethernet0 = &ethmac;
 		serial0 = &uart_a;
 		mmc0 = &sd_emmc_c;
 		mmc1 = &sd_emmc_b;
@@ -256,6 +257,28 @@ xtal: xtal-clk {
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
+&eth_phy {
+	status = "okay";
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

