Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F8BF3C3449
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 15:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791128749; cv=none; b=ncJ6uh9OBHWQU7T+d7QWsjHW7OJ0QiA7qla5GUfYuRQ7Z7hRExb4MnTi5gKdSU8+g0eLGSG2Ra/82+kSYMpgz/zSwMUBZ27fo3bLsAmgW3Go4accL/RyM6au3ULn20yKQlXWDdQzuhNz3qW5w0Q4WEF8oA1NpTnIOziTRCmYCHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791128749; c=relaxed/simple;
	bh=K1VIZ3NwHt5qEWl3louZYpxajUVl1gB557HUIiN0qII=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CDaZ6cTeJEiwMJ3PUteR5OFJXX77OkoTMnw3rnNcfhYbEuTvjEY0FQabWanB2wSK6BkGegGUIK9W154UMZGm/Vw4v9x2sRpL/NBnIoH0zi1XMI//4b27siijJeP7var5hmekz68S06wwNQhPLuUNvKn8or+tTCloBi1zM8IOsI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ojZ2or1P; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ojZ2or1P"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-4a024e16179so5689335e9.2
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 08:45:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791128744; x=1791733544; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T1cONhEHrcirrtFRMhHudThkO2tsvRRJIxPc9+WouMU=;
        b=ojZ2or1PwufYCbu1U8opKRRmjymNYEFG1G2xGJv9IH90cbEwzBzr9W4wSuEjqnQ8A0
         YU8cLRFuU4wDfYpOlIDODIyooouRv1XhJGA94DGCbU2pOYkuwWXAX2n2acZfK/yV+/1Z
         kg9vLUr69NXR8drX/XOsQ43MsoHaC2F2vyfrni05CAXdYBrOfdwuiscEh7fU1PeITH6i
         vJfB/Mjex2CSSQK6Cdqi3XugFfuLGmfonBveQ56A5IFP2mLMfohCTOSs0ixIA18fizL1
         dCruMmdFOyj5LBiO+n3TVUBm5tzFDT7E/7I0C3UJdRXUSPlk5B/q6LVxPlEk7PiBwFTi
         UgbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791128744; x=1791733544;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=T1cONhEHrcirrtFRMhHudThkO2tsvRRJIxPc9+WouMU=;
        b=EqEmENVipiVCSuE57SEELMdpOa0DH2bkOd5CIIMCn3VqGhm+Z0l9kgOjbU5rw5RgYb
         P0SMatNJtSW8v6phi18aCZibiWn1KoECI5p1gn2mC4JcmtxCzvBntkcxP7kVRJQyqC1X
         vP7abgP539qu5IdfDqUb12D49T4gBZVRzYnIvHhrpn+bt4jHnaxhpJzoBGorRjJCT5Rt
         tlH8eGiMYHQuzGNHiVgSJC7r/tV1h3eSNHQ+GiXkqd6BEW1WH7R8OAVMrnkPV7PglXVd
         Qq35RKiSIq/iNrRez5WJ14aqbwSoRHK2h+VomzzElPare5cgEFTwGMUroMzR0wTIB6Ka
         ouog==
X-Forwarded-Encrypted: i=1; AKwUvBwxMrgWkodwXlrhWFtvieeHyt2rp/rnThPQ1JQDOLLji/NAQkkgtx2ARGPHl5sl0tdNdsDyMFomLFwyEfs=@vger.kernel.org
X-Gm-Message-State: AFuF++l4QbV6UMMWl+g8z77QmP8hTfQ4LXnB7MK16eG3wFjWDKZc+x3G
	Nf+Ai7TT19+M0g+myjMwE5AHojQIUEMWq2qQYZRCLdbcJTycMANVGF0P
X-Gm-Gg: AYBFou0kaJ8WlW6CXOXg4m5Cghbw5Qx0XMvy5letatMRZq3+SVycsWmVhq+Y5CEaFK6
	kAbrnn7ODGzYrQJHJyT16MyrSLn2Y8BjmOZMLn/7ChSbKuLCqBkf1NPmPbXbGJW5t2jXvoLDKBq
	q4ZQIw3cS37qwI7UqgrACHtYt6CRv2dDioMpITquaS2lp37TudLlsFquxz4/auL0hkPqmlC5FLu
	/uaYwMEoyN9OnEKDq51RtLdx8KEwSFlxf+tzAv/zutlrsNJRRvypq0HHiRlpNEfS/AjZhti/h2I
	wyawSIuve+djdBRkVmpdqWuLe6VqRoMzhWA9LoAUEbNxRidN2YZtH+5poLFibTu2Uool9mZWvZK
	0fixBYoZ+3uxC2TmwmWcf/lEKXIyGVmzFRFAoI6s7qUCjpH9S3ZCPQUZDMNTHQnV2qhk+Ow35yK
	PNzSVpT6PtwVL+FsKaXcFhT1WvcIdEMPJmIrM2psAedYBd610VLgUeC+Iz4okWAbsisENENFfef
	S13+tFYFjdPBlXDi0M=
X-Received: by 2002:a05:600c:1546:b0:4a0:1c43:3c04 with SMTP id 5b1f17b1804b1-4a02756e5edmr142342575e9.13.1791128743642;
        Sun, 04 Oct 2026 08:45:43 -0700 (PDT)
Received: from xeon ([188.163.112.76])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0394ca0f0sm168639935e9.1.2026.10.04.08.45.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 08:45:42 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Ion Agorria <ion@agorria.com>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 6/9] ARM: tegra: lg-x3: Add haptic engine node
Date: Sun,  4 Oct 2026 18:44:53 +0300
Message-ID: <20261004154456.145362-7-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261004154456.145362-1-clamor95@gmail.com>
References: <20261004154456.145362-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add node for Imagis ISA1200 haptic motor driver used in this device.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi | 24 +++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi b/arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi
index 99afd5d634e2b..1f10f4bfb5f24 100644
--- a/arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi
+++ b/arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi
@@ -1568,6 +1568,30 @@ power-sensor@40 {
 			vs-supply = <&vdd_3v0_sen>;
 		};
 
+		haptic-engine@49 {
+			compatible = "imagis,isa1200";
+			reg = <0x49>;
+
+			control-gpios = <&gpio TEGRA_GPIO(H, 1) GPIO_ACTIVE_HIGH>;
+
+			pwms = <&pwm 3 53000>;
+
+			vdd-supply = <&vdd_3v3_vbat>;
+			vddp-supply = <&vdd_1v8_vio>;
+
+			imagis,clk-div = <128>;
+			imagis,pll-div = <1>;
+
+			imagis,mode = <0>; /* LRA_MODE */
+			imagis,duty-cycle-ns = <1250>;
+
+			ldo {
+				regulator-name = "vdd_vib";
+				regulator-min-microvolt = <2300000>;
+				regulator-max-microvolt = <2300000>;
+			};
+		};
+
 		nct72: temperature-sensor@4c {
 			compatible = "onnn,nct1008";
 			reg = <0x4c>;
-- 
2.53.0

