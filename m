Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794919202;
	b=fz7HXr8KWu+nyRhjqpx3K2f+ua77eJhZ27qhu855J+WZXmS3QS5Te3vPV6T5fIu62hlP
	 XqUDW0p0NsGp4/Uhs1kUjqLj0rgW4dxoYIDsv+gLxgiohDK9ucW9T8s3S8it3G504Ea5g
	 VoCUHiUYgrwkdlNld+IukrexD+ZxzMx7nMz4gPW5+ESf9a0ohYDVJ9U8tWO9Cl4nYJ+1/
	 BeLT7Q2s8oLHbh7n0qgjmbsCnouj2pGVvNqFtBFYPG/2v7u1YOt7nANSSannxZ294PMQX
	 z7016mIGJpr8hfeZL0yfXa99VYld+lKfh6mRFxApOOIggLLnGdj9YLF7SG1O6GfXrYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794919202;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=eH7GNmtkSKP2fzAXhmpuBWSGX/FXkIALtIPPfHtDiis=;
	b=mMl1wwJ8SbMWQb1iaPohZoC9k0EDQxYKxgov+xbMpD24FZeXd3GxCRMivAix4aYlWE4j
	 H+PEkKj1Z48SKALyDnuW7MW9q4pS3UwUjTUV3nIXyZLRt++XNA9m7HGM9VmRRC8+n9amB
	 +QNgBdCwQhQIyIgukglAruzIeoVZka2OgMWBBd8PVYLjejXT61Yoi0Ww5idDHnSLt3lT6
	 XA7OR8yEFlcNn9T3NctDjdpHCaByGpAUbg9hm5QjER4zzXjp3c71YQJRU6gPKfhIyg53H
	 PVzy+QbKGTDguH1zBsOydtvUCHk8Ty6qqtRPFK1dSPPxeVjsIguML8lBGV5qZ8jayYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ce62sMFo;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4434C60A6F60
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 12:40:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4434C60A6F60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ce62sMFo
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-492f563d1c6so1830997f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 04:40:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794919201; x=1795524001; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eH7GNmtkSKP2fzAXhmpuBWSGX/FXkIALtIPPfHtDiis=;
        b=Ce62sMFolZ8wDThxrrbo+CnTzEs6w7mi342mwpd9ugs27RJgJ5cnId07PBaxEu1f2t
         8GevcTB5H8HH0tU7USgs/C7oMgv9C0E/2ENimKZuqJYO6fUEJsnb+FA/18VNYiFDdJOV
         5Pob9+GtoRAtyzzeYV842RMcHt1a5qQwiptHgRxHqkDQEYD24TcKNisrkw9Umr0kQC2s
         b+gU0YRgX+3RcsiL5lLTQVNbAqgu6Lz1m9w9D0860q9fHHpe8W4Fb/a+9PLqJC1UR4Ao
         f5P9EdlzBCylkrLMsuxiJLc0SwS+WTSiku/JffJ/yUhwQwnzrhcmbogzStGBZmR0Uf3K
         75Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794919201; x=1795524001;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eH7GNmtkSKP2fzAXhmpuBWSGX/FXkIALtIPPfHtDiis=;
        b=bwkyfdM6MTAh2H15nZlB1rYG1chMG1yz41MR1ApEqhXj0mWqkajiWZcwW8OMBnZt36
         gsGFsuE0NtCEEZeJDc661qPZO9UWIse4ioNlRN/NOwHNo8SMhn/JJYEdm6rNk4javqd3
         WOqj02adpHpDLCAkoPBxVhDYl6zLbWovQDOBUs82l0gfgNVsCvJbLcCOw5W7HATOk3lq
         9+9Zyn7L2TLTqb25A0lmUuTN0O9w/8PlKGiiVyqr4yQMW3Ijw8/EF+ljUsw1e4b78pnx
         RbIGqOfZAQEBEnnJ1KD6jnsWiARG0YkS70ZIjWfNYIRUrS60a71BVzyyN8zQKfrH9sPO
         VMDw==
X-Forwarded-Encrypted: i=1; AL+hErFY7yFEoaOu3RnpvAX/4gU0mVj1gW2JtF+4NWytw+HPUGDYIC1b79cLHBDhXdznDWzI9Ph0NgMSvE+VzZU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9VdEcxdyTiTwewk+YNyqWgNcQb4uQZLdd577EjFj7EWPYJsKDd
	ro6+GI+zHpM8q1LHdXYqFVVN2BL3ht6IPupLTEvSWCzxP+WewRfSJ7JT
X-Gm-Gg: AYBFou0Y4wHRskQ5H4jxYl8DZDrgdHaHzI1khNOfPJRPtlgBZwx8F5pm15RQ6ECOZaa
	FJoBRhtGsCJc2oP4HE4zuU1J+5aVKx5zXZRR8BKlAJ+pQh4T/lZiPpx6yx2fPjdgkR9Tau+ivst
	R5yaSJIci8LJb92EJoTKy1Iy2AJSQUiQRqmrCMKDEoXYSOUQVq9CSuT94Lzm3QBwWd2vtqiFdz4
	DA9iQ6DK/sLyDk58zaQL+kxjANOnBj86zwYAG4n9KVpHm1n394XacMMdUqby3JKsO7s5WQLzem6
	ptElCLLxl+DWErkXexa3Rz7JazgaUSGFrVxkbiniPAvPC/OM8eNtwRQ9acKWFSI6wnYp4zOC/75
	1N1OA7ID6ra4Dbb9vPshMfHEHMMFulCn/AzItgjJKA+Ulfk7PTnK454GqEbcJGksU4wiibe++mw
	sijAZV6LtTasHuLAStyyCXzyUDqbf6vSiML3zVav1XkVfqKIqBBSpla3dKE93QvjxuHv/bL0vo8
	aD3z9LGotSwBRv+gUokL/ytGgXxJSLIgUacqbPK2uyFxaDuKvWRZSNz3ymdVIOxJbHgiuGQGrzm
	vRPqxggk+N7uG5fFC3By/eaBH4PytB3/aSU7WHySldk21ppWeoCJf+MUPwp4Io+thuMW1Q==
X-Received: by 2002:a05:600c:8189:b0:4a3:598e:e7a8 with SMTP id 5b1f17b1804b1-4bb559f72b1mr298144455e9.4.1794919200559;
        Tue, 17 Nov 2026 04:40:00 -0800 (PST)
Received: from DESKTOP-BJ3EVC4.lan (94-21-223-203.pool.digikabel.hu. [94.21.223.203])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb783f8154sm71474905e9.4.2026.11.17.04.39.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 04:40:00 -0800 (PST)
From: rofikkerneldev <rofikcoga@gmail.com>
To: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	rofikkerneldev <rofikcoga@gmail.com>
Subject: [PATCH v1 11/11] arm64: dts: qcom: sm8250-lge-timelm: add QCA6390 Bluetooth
Date: Tue, 17 Nov 2026 13:39:46 +0100
Message-Id: <20261117123946.668557-12-rofikcoga@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261117123946.668557-1-rofikcoga@gmail.com>
References: <20261117123946.668557-1-rofikcoga@gmail.com>
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

Describe the QCA6390 power sequencer and its PMU regulators. Enable the
Bluetooth HCI controller on GENI UART6 with the supplies provided by the
PMU.

Signed-off-by: rofikkerneldev <rofikcoga@gmail.com>
---
 .../arm64/boot/dts/qcom/sm8250-lge-timelm.dts | 92 +++++++++++++++++++
 1 file changed, 92 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250-lge-timelm.dts b/arch/arm64/boot/dts/qcom/sm8250-lge-timelm.dts
index 6b57c658cf918..38816268fcf53 100644
--- a/arch/arm64/boot/dts/qcom/sm8250-lge-timelm.dts
+++ b/arch/arm64/boot/dts/qcom/sm8250-lge-timelm.dts
@@ -95,6 +95,67 @@ key-assistant {
 		};
 	};
 
+	qca6390-pmu {
+		compatible = "qcom,qca6390-pmu";
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&bt_en_state>, <&wlan_en_state>;
+
+		vddaon-supply = <&vreg_s6a_0p6>;
+		vddpmu-supply = <&vreg_s6a_0p6>;
+		vddrfa0p95-supply = <&vreg_s6a_0p6>;
+		vddrfa1p3-supply = <&vreg_s8c_1p2>;
+		vddrfa1p9-supply = <&vreg_s5a_1p9>;
+		vddpcie1p3-supply = <&vreg_s8c_1p2>;
+		vddpcie1p9-supply = <&vreg_s5a_1p9>;
+		vddio-supply = <&vreg_s4a_1p8>;
+
+		wlan-enable-gpios = <&tlmm 20 GPIO_ACTIVE_HIGH>;
+		bt-enable-gpios = <&tlmm 21 GPIO_ACTIVE_HIGH>;
+
+		regulators {
+			vreg_pmu_rfa_cmn: ldo0 {
+				regulator-name = "vreg_pmu_rfa_cmn";
+			};
+
+			vreg_pmu_aon_0p59: ldo1 {
+				regulator-name = "vreg_pmu_aon_0p59";
+			};
+
+			vreg_pmu_wlcx_0p8: ldo2 {
+				regulator-name = "vreg_pmu_wlcx_0p8";
+			};
+
+			vreg_pmu_wlmx_0p85: ldo3 {
+				regulator-name = "vreg_pmu_wlmx_0p85";
+			};
+
+			vreg_pmu_btcmx_0p85: ldo4 {
+				regulator-name = "vreg_pmu_btcmx_0p85";
+			};
+
+			vreg_pmu_rfa_0p8: ldo5 {
+				regulator-name = "vreg_pmu_rfa_0p8";
+			};
+
+			vreg_pmu_rfa_1p2: ldo6 {
+				regulator-name = "vreg_pmu_rfa_1p2";
+			};
+
+			vreg_pmu_rfa_1p7: ldo7 {
+				regulator-name = "vreg_pmu_rfa_1p7";
+			};
+
+			vreg_pmu_pcie_0p9: ldo8 {
+				regulator-name = "vreg_pmu_pcie_0p9";
+			};
+
+			vreg_pmu_pcie_1p8: ldo9 {
+				regulator-name = "vreg_pmu_pcie_1p8";
+			};
+		};
+	};
+
 	reserved-memory {
 		ramoops: ramoops@b0000000 {
 			compatible = "ramoops";
@@ -506,6 +567,21 @@ &uart12 {
 	status = "okay";
 };
 
+&uart6 {
+	status = "okay";
+
+	bluetooth {
+		compatible = "qcom,qca6390-bt";
+
+		vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
+		vddaon-supply = <&vreg_pmu_aon_0p59>;
+		vddbtcmx-supply = <&vreg_pmu_btcmx_0p85>;
+		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
+		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
+		vddrfa1p7-supply = <&vreg_pmu_rfa_1p7>;
+	};
+};
+
 &ufs_mem_hc {
 	status = "okay";
 
@@ -636,6 +712,22 @@ touchscreen@28 {
 };
 
 &tlmm {
+	bt_en_state: bt-enable-state {
+		pins = "gpio21";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+		output-low;
+	};
+
+	wlan_en_state: wlan-enable-state {
+		pins = "gpio20";
+		function = "gpio";
+		drive-strength = <16>;
+		bias-pull-up;
+		output-low;
+	};
+
 	touch_reset_default: touch-reset-default-state {
 		pins = "gpio38";
 		function = "gpio";
-- 
2.39.5

