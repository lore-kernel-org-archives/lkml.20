Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794702734;
	b=SDpKpXtTDf6f8fCc6LyXJL/IFxhr/dBghd6s22h6Lb7clAQQi5t852i7qTLJ460G4fDa
	 xZMBIiprJcnyIFCV+WMQ5P9SUjhxRGV5cqVAOaeXgerR1CrGnXaemjYaujugPIdPidx9/
	 nJr4s87BNyqioCT0DWcBuUJ9q1SUREoKKRINaAjm2DG/x8k3M7UeWhT+7UjO4R2Q6jrbh
	 S2iVxPSowExRmfg//gBz91Q/shllP77/PDpjfH2ML+uGPaLaEAXDyngoTv1MK09UYuNQU
	 59rwbHP9WfYtWV9yCsYeM51wDbFUGHNBiV6/W9ujsWwIsMtF/PYisTFNxsZC2p3txiA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794702734;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=5BzEzIkh88UF/eFKoP7bFiAZvwEVTm/vwY2OAtRkH6Q=;
	b=Cx/wnpcT/qjkzCdHQzw15GtlAosEriWKS0jphJB9TSyRHcy7rtc2kcAdkkt4de9b+UMn
	 P5uY/KOFk39C6w3z3aNRgUSS6YR5i9srLQYdmb4ds+QuRLIGjMeKHH0NCqwTY0O47wp7A
	 sVeKtnp5xPkiHYhJKpxbMaujFp47NLdzb/QKs1gr88kBp/fzT0AufHKbF86P7S2ToCoCK
	 ULUfROqmFxlzzNkPEhv1N5mqGRkLug6pwx5yP9A9p+CJsFYlT+3XL6Su8YkO7M2KnssKl
	 NC+g6tpCxfiSCcj8WN1Lkyyu36Bt2ueV3E/DIH0AcI3O8SQW+ZaIhtd5L336wZdDLMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NuB+pYQG;
	arc=none smtp.remote-ip=209.85.208.42
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5F56606A8AF
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 00:32:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5F56606A8AF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NuB+pYQG
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6b47c1a3c74so3640479a12.3
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 16:32:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794702732; x=1795307532; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5BzEzIkh88UF/eFKoP7bFiAZvwEVTm/vwY2OAtRkH6Q=;
        b=NuB+pYQG05P8vQsvSqK8FGXmuv6ceF9SEljR1BuShW+W/8vSijjlGoVxffAOL1Xuit
         FVKS/QagbramNrGHQ7YQcw0KXf5Z1rEHgu8J9YT+7duzmX+5k+DIm70GcYL1Aj0moXUo
         ZbSgnLz7FveQGyQDM9sNm2M8Bu+DDGoSDYyOnUujpQBR5IqA/cb8XvQ35+n2qf68Lwle
         +nPHPawZqGNoYKcpYs4YYZHnqEEt9MeLiKNt34QXOpZLGMndedcl94C89CAAGK2Jc/W8
         mvtkgZtTYqmUa8XMvuu8WvWp8r7vaoHxmm8RsNTnDfAWmDWKMzHpkttLgwVJ1m14oeK1
         TvIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794702732; x=1795307532;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5BzEzIkh88UF/eFKoP7bFiAZvwEVTm/vwY2OAtRkH6Q=;
        b=UFzoO0uFBmKHkJ4sUJ4mkkcoCmdwTohEuFoSB2pGIvpZsyOaQwMKTDAnRsp4KHITgG
         jZNF63nON+q4MhHt8E/uL/l7nLT2eMB8lHUroTcmeaTQWnGKbWwrqfIHlhMpnGljOvLE
         uqBearf4uN4ZVRnbnhsylGHjJM1537yNEgTwla8bsdY7r3f79GePjOwH4DoQOt/jJU1W
         hLzfcSIjP0S3HFNInRbutNeKSc/V3g6pf1OAefFgwi/+uus1RpIgEp735mLJWVHpKODc
         Nzu12ZHC7PMskQ3TlNLk31pLaxZHGW8Hb3OcGX3qT4J+LeGJEQTeHCgYw8yzHL19xP5R
         gvyA==
X-Forwarded-Encrypted: i=1; AL+hErEHQMxAWLRk72dxshEITF+y1rBsY0ne2bfurQ+s1fQhJLfXhuemufOXgmSvefM38DbUwgvtghcJflksLIo=@vger.kernel.org
X-Gm-Message-State: APuU4Z/QhPm/x7HC8VnKMCtHURMU1ouYTgV561n6tTGmKIRyua1xgRUl
	nvX2bA319bfp36YMw3T9L6XOaYSuKeP2OuTjJJveVYtAyodD/4F32+Y=
X-Gm-Gg: AYBFou2yoUl3AELhowWvGLh2iZWSVuL1CcZl8qZQNSZFWaj5TD61wsssEXR7tSsVALR
	nRjs+htQC1ZuQq0FnBVWKIJ8IO1XGvmBnQQETpBDQ9O+9gu9S3wruPClEgDIu3V7Ia4hWyNeVz1
	Dk+XQnWFrrZuz/9/g2+6GjPMkFbBgYQ1jrczWmMqQrk+kldY6UEi2b5HfxcWsu+G1tO99JWfKNO
	TBjlD/ELWkCeqI59UJqOEfnlxkOZXuXZuWKYSY6nRXFblea/mYd36xNz4eitMf/2nQwRPkAANcm
	AszVlIF1vBII03r5nCmNkqOsrnNtFDb1xJBzMCearvPP8nwEuSDB40gstLE9TycgHWN6id7c0/O
	lcmcmZE8tf0XtHdREWUgL6df/zzxmERmgA7a6RWXIoXwQ1oe2wjBT7rU/d3bEfoPvIf4NZszGl+
	HXOlKhRy+alHWdTr9zEssXHfQprrgVWk/fpd6A0iZNi5MEY08rDFTPISjB/l1XBs7uTBwiujd6G
	b1yx4VsmeE+/XCO2BDCthl5HEuq2JAC+ZOWFe0s2R8mXG4q5xJtVYBrdH0bqNDkpDPparYok8JW
	j2NjD2Hj9s0O+cflNEfj5mlrQakalsq8pBtaR8lT2AMyvadh8dKVpYDirzpTn2kzKO+YKSDmvXL
	GnJgSNhLbqlvwf0bSwJPryg5hUvTjN8vhU4M=
X-Received: by 2002:a17:907:3f02:b0:c50:5186:6dc2 with SMTP id a640c23a62f3a-c509636b5f5mr660429766b.24.1794702732209;
        Sat, 14 Nov 2026 16:32:12 -0800 (PST)
Received: from sohrab-omarchy.taila18b31.ts.net (2a02-a44e-4ae7-1-c0e-6d5a-8ae2-915.fixed6.kpn.net. [2a02:a44e:4ae7:1:c0e:6d5a:8ae2:915])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095a5c4b7sm260695166b.1.2026.11.14.16.32.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 16:32:11 -0800 (PST)
From: Majid Hajiheidari <majidhhdri@gmail.com>
To: andersson@kernel.org,
	konradybcio@kernel.org
Cc: rafael@kernel.org,
	viresh.kumar@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	abelvesa@kernel.org,
	mani@kernel.org,
	admin@mswin.me,
	linux-arm-msm@vger.kernel.org,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] arm64: dts: qcom: sm6125: Add CPU idle states
Date: Sun, 15 Nov 2026 01:31:58 +0100
Message-ID: <20261115003158.391171-4-majidhhdri@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261115003158.391171-1-majidhhdri@gmail.com>
References: <20261115003158.391171-1-majidhhdri@gmail.com>
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

Add per-CPU power collapse states. The downstream "trinket" low power
levels use exactly the SM6115 numbers (silver: entry 290 us, exit
376 us, min residency 1182 us; gold: 297/324/1110 us; PSCI CPU mode 3),
so reuse them in platform-coordinated mode.

Cluster (domain) idle states are left for later; their PSCI parameters
still need to be checked against the downstream levels.

Tested on a Xiaomi Mi A3: WFI and cpu-sleep-N-0 show up in cpuidle and
the usage counters increase.

Signed-off-by: Majid Hajiheidari <majidhhdri@gmail.com>
---
 arch/arm64/boot/dts/qcom/sm6125.dtsi | 32 ++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6125.dtsi b/arch/arm64/boot/dts/qcom/sm6125.dtsi
index 1b148e453..c06842c0c 100644
--- a/arch/arm64/boot/dts/qcom/sm6125.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6125.dtsi
@@ -44,6 +44,7 @@ cpu0: cpu@0 {
 			reg = <0x0 0x0>;
 			enable-method = "psci";
 			clocks = <&cpufreq_hw 0>;
+			cpu-idle-states = <&little_cpu_sleep_0>;
 			qcom,freq-domain = <&cpufreq_hw 0>;
 			capacity-dmips-mhz = <1024>;
 			next-level-cache = <&l2_0>;
@@ -60,6 +61,7 @@ cpu1: cpu@1 {
 			reg = <0x0 0x1>;
 			enable-method = "psci";
 			clocks = <&cpufreq_hw 0>;
+			cpu-idle-states = <&little_cpu_sleep_0>;
 			qcom,freq-domain = <&cpufreq_hw 0>;
 			capacity-dmips-mhz = <1024>;
 			next-level-cache = <&l2_0>;
@@ -71,6 +73,7 @@ cpu2: cpu@2 {
 			reg = <0x0 0x2>;
 			enable-method = "psci";
 			clocks = <&cpufreq_hw 0>;
+			cpu-idle-states = <&little_cpu_sleep_0>;
 			qcom,freq-domain = <&cpufreq_hw 0>;
 			capacity-dmips-mhz = <1024>;
 			next-level-cache = <&l2_0>;
@@ -82,6 +85,7 @@ cpu3: cpu@3 {
 			reg = <0x0 0x3>;
 			enable-method = "psci";
 			clocks = <&cpufreq_hw 0>;
+			cpu-idle-states = <&little_cpu_sleep_0>;
 			qcom,freq-domain = <&cpufreq_hw 0>;
 			capacity-dmips-mhz = <1024>;
 			next-level-cache = <&l2_0>;
@@ -93,6 +97,7 @@ cpu4: cpu@100 {
 			reg = <0x0 0x100>;
 			enable-method = "psci";
 			clocks = <&cpufreq_hw 1>;
+			cpu-idle-states = <&big_cpu_sleep_0>;
 			qcom,freq-domain = <&cpufreq_hw 1>;
 			capacity-dmips-mhz = <1638>;
 			next-level-cache = <&l2_1>;
@@ -109,6 +114,7 @@ cpu5: cpu@101 {
 			reg = <0x0 0x101>;
 			enable-method = "psci";
 			clocks = <&cpufreq_hw 1>;
+			cpu-idle-states = <&big_cpu_sleep_0>;
 			qcom,freq-domain = <&cpufreq_hw 1>;
 			capacity-dmips-mhz = <1638>;
 			next-level-cache = <&l2_1>;
@@ -120,6 +126,7 @@ cpu6: cpu@102 {
 			reg = <0x0 0x102>;
 			enable-method = "psci";
 			clocks = <&cpufreq_hw 1>;
+			cpu-idle-states = <&big_cpu_sleep_0>;
 			qcom,freq-domain = <&cpufreq_hw 1>;
 			capacity-dmips-mhz = <1638>;
 			next-level-cache = <&l2_1>;
@@ -131,6 +138,7 @@ cpu7: cpu@103 {
 			reg = <0x0 0x103>;
 			enable-method = "psci";
 			clocks = <&cpufreq_hw 1>;
+			cpu-idle-states = <&big_cpu_sleep_0>;
 			qcom,freq-domain = <&cpufreq_hw 1>;
 			capacity-dmips-mhz = <1638>;
 			next-level-cache = <&l2_1>;
@@ -173,6 +181,30 @@ core3 {
 				};
 			};
 		};
+
+		idle-states {
+			entry-method = "psci";
+
+			little_cpu_sleep_0: cpu-sleep-0-0 {
+				compatible = "arm,idle-state";
+				idle-state-name = "silver-rail-power-collapse";
+				arm,psci-suspend-param = <0x40000003>;
+				entry-latency-us = <290>;
+				exit-latency-us = <376>;
+				min-residency-us = <1182>;
+				local-timer-stop;
+			};
+
+			big_cpu_sleep_0: cpu-sleep-1-0 {
+				compatible = "arm,idle-state";
+				idle-state-name = "gold-rail-power-collapse";
+				arm,psci-suspend-param = <0x40000003>;
+				entry-latency-us = <297>;
+				exit-latency-us = <324>;
+				min-residency-us = <1110>;
+				local-timer-stop;
+			};
+		};
 	};
 
 	firmware {
-- 
2.56.1

