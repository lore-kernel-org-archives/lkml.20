Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793008659;
	b=WPkN+Sawfzi5YBOPl4MD9pAY85EaJbCJJDb+I3nd7bBPnmU11YjsTAPOPGUG6t1THx4r
	 Kf5TbuRHpA3b8/j2xAO0h6rwixLk0xVlEjSqNJbhHvtcMOYNwvCCi1g20iR5jasCpsjWn
	 g2Y+2FGOViHkUstEbgwcL4Ta6TYlBxp25kuN0UdHHvuqUfniEIMBKJMr4eynceN6ganSO
	 K2XnfJ9MXGnalGQ90qYqQkh87DbHUK3jGCkd71k+oCTNThhXRK91KM/uly61BtlkERfzu
	 6vLGr/g3yF5P0aFy6yOr5DgdbtWTokB8AHvllPeyaWn9UbiQ0AkUqb6eIGctAMyeO8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793008659;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=F5/whTPXJ4TwJiIzCOtu0fJEtFPssDni5EasuMfucqk=;
	b=zSLclYQutb0dBX+ZsCH0p0PIT7Jh78b/ORA/LzHT77dTgMDVjSq/HqWLp8+cEWXauNEU
	 zaPq/hCm4pv07fu26H+PxMHvmthyCoq/sfAl6fw4WmLjRWCVSJWC84l+K9sVkDnakn80N
	 kqZ81xwkZHN046m/mNXWHNN64hwxI5yyZCmiDUls0W/SwMAskpLls1m+bSPuFzkzOIed4
	 nusEdchqGafF90epjk/ZqVXfcYratmzE6QVBTzmvG/Ca+SKIZjO12d23OeQ5PE5xxDTZW
	 cP6AnqIq0NVIsJymfe4HhnO/pQ3VNFcJwhhhI09Lt2u0eYy9ce//rYcjSeYVGdXvORw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Wh7ZW6Wu;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C1D760A3804
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 09:57:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3C1D760A3804
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Wh7ZW6Wu
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a60f9474c4so7848915e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 02:57:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793008657; x=1793613457; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=F5/whTPXJ4TwJiIzCOtu0fJEtFPssDni5EasuMfucqk=;
        b=Wh7ZW6Wufbb9/HHgWXkto90YwrR72qh9cO6pZovp5WXkyrdt9oqM81y4MymKRy5Ekl
         L5ZfvI8oq9QXBz/UFC3C7UaL5bW6nYN6/O3UlOgb7UwXkasDXPRt/KCcGHBCfww8zTpY
         L4PXQz59K1WRtu43BCX8CJCU1RJAaGEN7iJwV4/Esn+E+6Fqr7NBOJ1zqOo0z/BuEzi8
         EE2+ohgtyiVst5wWDO3npJiZ9VLcASo7NBi+UEMhdegKPEoNDF8i26c/3jiWpTKeYJW9
         cVCo/JaDJUng843Kkz4s3Xy/Am8vYPigyvJVM55m8xfzK7etfGTnUmvpBPfDo9FO/ePL
         izLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793008657; x=1793613457;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=F5/whTPXJ4TwJiIzCOtu0fJEtFPssDni5EasuMfucqk=;
        b=Xfpm8Ti9NLym4MoTW3EEI7db9yI/l50RgTIK5ihN7KS9QFvcT/7jTAowo6imFwIV/t
         4rmErtEr7LL4aCYpsHp+NYQ8wE7UbtdPECK1/kaV+ZHUqm+IPtZ510Ai14FRFSU1H6Jp
         SZTxcvkmeXgThR50FlFaO2oePzujMmZbh5AXLFwaCb3xjVBb1WnMNDqYqhzI80lZBeMp
         kfV57NrGeVdkXygeXHvPYtQydd7O9JYi0vDQbolGpa67aCKWz7GwLXvifniI88QboCgd
         kJ0Psnri66J69QcSBPkLPIdMEbkiujnXS7em4rMn2g3OfCOD0NkNQkcKXx1YwmoyvsEd
         RQmw==
X-Forwarded-Encrypted: i=1; AKwUvBzufkFjDGnKApmqwPtTRKMrWZYkXUXeN8+8Y2wB6LdluGGIH0CmchYGCUu3Lepz6agfPMrXjpE9KbioNNk=@vger.kernel.org
X-Gm-Message-State: AFq9FYKMO+uCIKhbp4HV0cOwsk/MfkpjeaYLedrd46qH2XKdyByagY0R
	ZXMlgO1agskbKu1eXxXyJz2n5uy/u2i3sRSLFm94oGAKVlBd77y+yMS+
X-Gm-Gg: AYBFou2qmtkigRV9mjkudLXjcbLe29w8R9mFU0/Zz4ilbjLL7uDZf5XUfcoFlb5eWAb
	+5CI2DGrWAKBMxRZRoRvFDL6i9hGLa72EFz5GKjnkWZy9NvFryrmh5xbX8b+6FgTgMvsyGHZ039
	v0MBe5KRwP1I3EIARdAM+XCoVBz07ZJB88287My8GqvRW8ldgAVsh+e7s+fIvbz3nBGWNd+4T5o
	nhAuGeasFnPVhQIQSl0qEjW0TvR5PSBu1chWVw6j/d7PC1Xf9X75rapux4sT6sjmwl6R9EV9C8f
	ODKAM+uBseNnwxzkdwDC5bA9Xv5rdBLSgB04cVLIE1ifeS2cSVyl8+7CTEveHKoNG/nNf4ojsEi
	Ni2yFba/Icx4bKdmP4GHkQmuBIuu8zDxD/WlCFll3mEEXbpvQ6jWiGOxNwlfUXn4+5Utg6vUbA0
	BIfH1yVHsGFCMLdvPCxK8X0pNMUk62ZX9HO65RAc3e/GPGlcjUkWvrtg5fJmtqgP0hLZBOMfE8c
	EKWjZlfEDXg6XaJgdPgDnhgEKyyU2DxncyQqYOMjzqgZMo6h+kUsKnBjsfEeb/WcHHU5BusixOJ
	OV+pTGpI7bBlr0nR4PH7PDbSAz/BKt2GnaMTS24zeLNiuRzKrXha46JhpglL
X-Received: by 2002:a05:600c:6095:b0:4a1:f7f4:7cf1 with SMTP id 5b1f17b1804b1-4a35ac8bf3amr98760375e9.11.1793008657479;
        Mon, 26 Oct 2026 02:57:37 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (93-34-92-187.ip49.fastwebnet.it. [93.34.92.187])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4a35a0cc374sm190382825e9.9.2026.10.26.02.57.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 02:57:36 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/9] arm64: dts: airoha: en7581: add CPU OPP and scaling nodes
Date: Mon, 26 Oct 2026 10:57:08 +0100
Message-ID: <20261026095727.31708-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261026095727.31708-1-ansuelsmth@gmail.com>
References: <20261026095727.31708-1-ansuelsmth@gmail.com>
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

Add required CPU OPP and PD nodes to support CPU frequency scaling.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 arch/arm64/boot/dts/airoha/en7581.dtsi | 177 ++++++++++++++++++++++++-
 1 file changed, 173 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/airoha/en7581.dtsi b/arch/arm64/boot/dts/airoha/en7581.dtsi
index 83b30a340950..c5a335086741 100644
--- a/arch/arm64/boot/dts/airoha/en7581.dtsi
+++ b/arch/arm64/boot/dts/airoha/en7581.dtsi
@@ -74,8 +74,12 @@ cpu0: cpu@0 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a53";
 			reg = <0x0>;
+			operating-points-v2 = <&cpu_opp_table>;
 			enable-method = "psci";
-			clock-frequency = <80000000>;
+			clocks = <&cpufreq>;
+			clock-names = "cpu";
+			power-domains = <&cpufreq>;
+			power-domain-names = "perf";
 			next-level-cache = <&l2>;
 		};
 
@@ -83,8 +87,12 @@ cpu1: cpu@1 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a53";
 			reg = <0x1>;
+			operating-points-v2 = <&cpu_opp_table>;
 			enable-method = "psci";
-			clock-frequency = <80000000>;
+			clocks = <&cpufreq>;
+			clock-names = "cpu";
+			power-domains = <&cpufreq>;
+			power-domain-names = "perf";
 			next-level-cache = <&l2>;
 		};
 
@@ -92,8 +100,12 @@ cpu2: cpu@2 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a53";
 			reg = <0x2>;
+			operating-points-v2 = <&cpu_opp_table>;
 			enable-method = "psci";
-			clock-frequency = <80000000>;
+			clocks = <&cpufreq>;
+			clock-names = "cpu";
+			power-domains = <&cpufreq>;
+			power-domain-names = "perf";
 			next-level-cache = <&l2>;
 		};
 
@@ -101,8 +113,12 @@ cpu3: cpu@3 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a53";
 			reg = <0x3>;
+			operating-points-v2 = <&cpu_opp_table>;
 			enable-method = "psci";
-			clock-frequency = <80000000>;
+			clocks = <&cpufreq>;
+			clock-names = "cpu";
+			power-domains = <&cpufreq>;
+			power-domain-names = "perf";
 			next-level-cache = <&l2>;
 		};
 
@@ -115,6 +131,159 @@ l2: l2-cache {
 		};
 	};
 
+	cpufreq: cpufreq {
+		compatible = "airoha,en7581-cpufreq";
+
+		operating-points-v2 = <&cpu_smcc_opp_table>;
+
+		#power-domain-cells = <0>;
+		#clock-cells = <0>;
+	};
+
+	cpu_opp_table: opp-table {
+		compatible = "operating-points-v2";
+		opp-shared;
+
+		opp-500000000 {
+			opp-hz = /bits/ 64 <500000000>;
+			required-opps = <&smcc_opp0>;
+		};
+
+		opp-550000000 {
+			opp-hz = /bits/ 64 <550000000>;
+			required-opps = <&smcc_opp1>;
+		};
+
+		opp-600000000 {
+			opp-hz = /bits/ 64 <600000000>;
+			required-opps = <&smcc_opp2>;
+		};
+
+		opp-650000000 {
+			opp-hz = /bits/ 64 <650000000>;
+			required-opps = <&smcc_opp3>;
+		};
+
+		opp-700000000 {
+			opp-hz = /bits/ 64 <700000000>;
+			required-opps = <&smcc_opp4>;
+		};
+
+		opp-750000000 {
+			opp-hz = /bits/ 64 <750000000>;
+			required-opps = <&smcc_opp5>;
+		};
+
+		opp-800000000 {
+			opp-hz = /bits/ 64 <800000000>;
+			required-opps = <&smcc_opp6>;
+		};
+
+		opp-850000000 {
+			opp-hz = /bits/ 64 <850000000>;
+			required-opps = <&smcc_opp7>;
+		};
+
+		opp-900000000 {
+			opp-hz = /bits/ 64 <900000000>;
+			required-opps = <&smcc_opp8>;
+		};
+
+		opp-950000000 {
+			opp-hz = /bits/ 64 <950000000>;
+			required-opps = <&smcc_opp9>;
+		};
+
+		opp-1000000000 {
+			opp-hz = /bits/ 64 <1000000000>;
+			required-opps = <&smcc_opp10>;
+		};
+
+		opp-1050000000 {
+			opp-hz = /bits/ 64 <1050000000>;
+			required-opps = <&smcc_opp11>;
+		};
+
+		opp-1100000000 {
+			opp-hz = /bits/ 64 <1100000000>;
+			required-opps = <&smcc_opp12>;
+		};
+
+		opp-1150000000 {
+			opp-hz = /bits/ 64 <1150000000>;
+			required-opps = <&smcc_opp13>;
+		};
+
+		opp-1200000000 {
+			opp-hz = /bits/ 64 <1200000000>;
+			required-opps = <&smcc_opp14>;
+		};
+	};
+
+	cpu_smcc_opp_table: opp-table-smcc {
+		compatible = "operating-points-v2";
+
+		smcc_opp0: opp-0 {
+			opp-level = <0>;
+		};
+
+		smcc_opp1: opp-1 {
+			opp-level = <1>;
+		};
+
+		smcc_opp2: opp-2 {
+			opp-level = <2>;
+		};
+
+		smcc_opp3: opp-3 {
+			opp-level = <3>;
+		};
+
+		smcc_opp4: opp-4 {
+			opp-level = <4>;
+		};
+
+		smcc_opp5: opp-5 {
+			opp-level = <5>;
+		};
+
+		smcc_opp6: opp-6 {
+			opp-level = <6>;
+		};
+
+		smcc_opp7: opp-7 {
+			opp-level = <7>;
+		};
+
+		smcc_opp8: opp-8 {
+			opp-level = <8>;
+		};
+
+		smcc_opp9: opp-9 {
+			opp-level = <9>;
+		};
+
+		smcc_opp10: opp-10 {
+			opp-level = <10>;
+		};
+
+		smcc_opp11: opp-11 {
+			opp-level = <11>;
+		};
+
+		smcc_opp12: opp-12 {
+			opp-level = <12>;
+		};
+
+		smcc_opp13: opp-13 {
+			opp-level = <13>;
+		};
+
+		smcc_opp14: opp-14 {
+			opp-level = <14>;
+		};
+	};
+
 	timer {
 		compatible = "arm,armv8-timer";
 		interrupt-parent = <&gic>;
-- 
2.55.0

