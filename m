Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793873016;
	b=CURYcmvjLYirtvw1Y2Fu5y7CKboSiKXFPU4stvdkZ79qE+MWHeWdgOH1/aJMtbaySM3t
	 fYWk1wcstUl/H634DQCuJFHGZ5WET4Ye3mfsPsCVePWOB5dukDp6b2EZvCrKHGaSJhdo4
	 OjMCRw0CxViEuVjn9srhUTrr1fHqo5vXUKd2QzzDbW+GK1V8LHkxW/kG2C2V61HT4S+pS
	 7vKnoLYc+EzCqTiVVZkzwE0mfptYFyXR77RV5pY7uy4TuJD0IBwjDm4wYlGEX6tL1M9/+
	 td9a4OJWtEgA9KDlyZ35gsBApuq7dIoI4/49nq6unp3Z137eGiPScFNrBCcuPcitXJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793873016;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=rvhYGG2+F5DLhHvBXxyAZN8hokDea2WGLIFovieWgBM=;
	b=KbDaWZX4qett631vkyov++Tx7SkcLSZWhMqFIIcQBl9uKlx1hpmd3J5bP1IgWkyrYwRt
	 c6T5LCFx9HyMYlNlKRBcI813+CUGo+8oC8ySjVlZ9RZORSwMWU9ICoUxoCRQ+qNMO6ujw
	 y4gvsyDw1aFTBxre4juFO2/ljFL/EWv/t8tK7Pq8GsMScutjEtjTTMrTdtjZWB1xenI6e
	 i7Fnmrz10AwIyvx733oX0VPVG4qBNkRhkNm2BaG/LikNVnXVQTIPPJCFWs1lhdXfpa/4e
	 e8TZbJGmPUzpaNhiYLlOVlNPkpGBS00YQWXGnmP1H6ePUgJiBjnf0NviXzRpwKObkYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 064E56082BC2
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 10:03:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 064E56082BC2
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a214c5c4c0so14955085e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 02:03:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793873014; x=1794477814;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rvhYGG2+F5DLhHvBXxyAZN8hokDea2WGLIFovieWgBM=;
        b=WHQOQl7mLvFeo01Yo1NMOq1ZMm50DtReIvitaEJ6dwHZ9gq/KNS3wIyMDIqClvK77L
         AIaLaBcZBMLcndzxDQbzXDf9QShB0/Wl+1dM+fPkTSH0yk/Dv42q7SLxO1vSbyXwGp0H
         Te82UcORHlewiXV9ICFu77L+EUnUk/T2lq4aMO8Dulj/z64S4OVde4rFoQj04V4QcVu0
         677laFm/JV5JK8Kfz4k9EEDAM86swSEKH82g2/JYQHQI8oEkAV7CUHe+p5lBR3Ssx0u0
         xgs1Iex+Jg4fmcOCg5K4s1utZIuXMu92zPu2dE9MvMaG9XOVR3HThs58JqQ2nzwS26ld
         YENA==
X-Forwarded-Encrypted: i=1; AKwUvBw1tBnK7i6CP24ewGA12VGeco0MEwATtYf17i0pg7Ec6i5rd06ad6zdjlvANoRz5Y+XanSvgjAlfjkmGGU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/welEn/zkbS1GcRITy4rLL55OUJ4CRpvNspALzkmffbVIYd20m
	9edOBz0HKUeZZK8hHXOY12G8ZldC5UaCJtpt0sNVvePuZUqZD6u/XeX4
X-Gm-Gg: AYBFou3vh6SfEX/DII0b0PRpLgwTo+eHn6RXuMOTxJkrJfXU/Cbf1iD/wKWx6dTWNt4
	yOBVu8SBtY3vlBdj5F55bo64FKar0w/nxyyY4Qqc3fI7BL+XHUvF067GAjx6K7mnX7sZZhc4gno
	9L1+oyGKaK3VFpbARN2RUFogARykN1iexNYOb+0AZCn6d+RTAuAbL1VbyEiLKZO5Mhp3J7tCH4N
	I0VirykTKjzFi7dzILXyGe0QyJFPWGry9LCT70MVIFhnjQuENS8OcGXw7gqJWedcW8kJ3d74k/R
	St5ciu5XoUbbLvFYIAKrY7MzDyqu/eSDaftgYbl5l1GsrLHDwl+U0tmqkoDGLGo8DdmksqhzKbX
	Vu1Gtu7cE3J2TkqpDGeneafGMUWszZZ/6i+NCg/t1QCSYTNMefAT3xtUxqIBLdrBkgCv4uhyh3T
	iI2Fn92oT/7Aj/+WPWyFzL2E29LA/o32sJUj+A2D31TXx8oAZakR8aCOurWP56N99+v1h7sJslZ
	eSwgSZu5YyfjjV4I8BNOb48x1nizVO/l8eJOrPd9r9RCh/agiuebmJ1Jn7q1gez5uyCLFkIIQ3K
	ilw4oDiPaaM/jO7q/c6iag1/IQOF2hSvvw+ZlIeWq4DX1YiKZXSEKbm+8akGrVMxbnwOItcd5To
	XBUbCKq7XdikH+VGbXdJ1eh2now==
X-Received: by 2002:a05:600c:3ba3:b0:4b5:2c72:651c with SMTP id 5b1f17b1804b1-4b52c7265a8mr45793945e9.5.1793873014390;
        Thu, 05 Nov 2026 02:03:34 -0800 (PST)
Received: from threads.localdomain ([90.254.187.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b43342773esm53455775e9.4.2026.11.05.02.03.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 02:03:33 -0800 (PST)
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
Subject: [PATCH v6 7/7] arm64: dts: amlogic: t7: khadas-vim4: enable the ethernet port
Date: Thu,  5 Nov 2026 10:03:22 +0000
Message-ID: <20261105100322.37816-8-tanure@linux.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261105100322.37816-1-tanure@linux.com>
References: <20261105100322.37816-1-tanure@linux.com>
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

