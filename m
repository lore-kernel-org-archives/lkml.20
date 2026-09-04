Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A78C331A53
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 13:09:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788527371; cv=none; b=KQU9bmHOy4RyDZtdtZsd5TH5EU6u23oMCGBJjQ7yxGJO1hFBm6H3PSuD8YK6KRJGFG5ZBvEyzCZ5xwl8++agH2CGzNEFrgOp1VwdqFZquqQaVYhsHEwWdgQ5BW9cCUGaf1AoEB0MLbH/rrl1V2ufksZUiB7zdeRx9I1M7Nuo+VQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788527371; c=relaxed/simple;
	bh=DxBGNoaEFtQlXpGgig8NFJaF8scL78xQ+bsiJIm6WLE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pHKhJ30FHTOLMMJ+TnokeVZcgd30OLYkp4jrZESN1uIS+8wkPVa151zJzzyrpA/EIn/EfAYKj/cPX063csY3UgTyE21inob4+JypXWivCA+hQKQNLEeyHZ1AY2tk60b1q8XJ3Gh1Awbld56UQeo/CFpLWJL0EZM97TozYYxOuG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=olH2mYH9; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="olH2mYH9"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-49b96433ca3so328315e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 06:09:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788527368; x=1789132168; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kbG5tkNoyC999CbeFUHbHjzpSs9HHc0dLmddOFM6uZc=;
        b=olH2mYH9E46t6Om306g5So4mMj67KDlc8Z5FHwuja+1q4P29+4NcpaivlvMtSKBlkA
         7uNjqH4wVEh9Q2JC9Zq9sPnpLXC/zZRidrppUSO5QRfHifSV0X0do3cC/jd9wYM+VN6k
         qT8pTWqM4XInTS/POpxnq0uNGFXT7esYNoAkIHjJkODQn6t/jVockQ07SGZCCn8sCnc2
         xNWMNZubuaDZgdakxFNaoG1OzToOBl1aIx97KA+NZTzqnnjheW8Xqqe0EkQvKBHss0O9
         lZGJyPAnl1jArBuHiod0Yo6u50AqoQvP67LfCcmXuzdfT2KtLdrjx9FycSKc3mvuSmv7
         IyvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788527368; x=1789132168;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kbG5tkNoyC999CbeFUHbHjzpSs9HHc0dLmddOFM6uZc=;
        b=lfObehllhywq7rmjyJbXIqw+uRidNRxmiYMPQ5EQcdCQ4+OBYEthjlGPFOlqxk6O04
         WU3R+Xj2GNlexpDrwOsyQa4DLZK7wP1PUxLxcknBR+64BMitscOCg+1RQpie+06P2jEZ
         qFEEbmvoqi/aC2DfBgAzmjZmqdAbb7OhpSOVytUAXNSUwvZJYOHaLnVMa7/rAuOqvCj5
         cXfsCsqXFnS75F2EghIEjeAFFg5+Swtb7mhfu1jW9TRUpHaBrgw6FH5uXNhST1O6RhSK
         fJC8oLoKeJIPSFOU82o7pi0QWwJgicUt/9IPhQEa3q2tFzHDNoROH+E5I19VrLBAVUG7
         Xbcg==
X-Forwarded-Encrypted: i=1; AKwUvBxoF8MBKQhlBIvevodDpi+MjyZvYRrfXkfuqK1M1fHMtYt32fmrNyXfdyZsoyHjiO7BrF4SA/X6G46vNg8=@vger.kernel.org
X-Gm-Message-State: AFuF++mFZT8xQeabxCT8JT76gQJ9NFdzA9dysdI590ZCUWUeZTc/8+0d
	7sul70H+FDBBOyyxxqx0k+kuGy4Pnj0BGYqoI01C1/LrFvqGOx/8bFNf
X-Gm-Gg: AYBFou1WwT3rEshiZJqXTFFh+ySsx3LugJG8dDAmc+ln4C+Gx48O8Cro/UZJm7pfxSL
	SQ7E5cK2vehhjT5ToNur1HbgyOlBohXpp4yNy1tNQMTUp6HnKaxv4cZSDxTn44c6ReOMGx9tmN5
	lL6ODQ6zgxyk+Lu2U4h0tMuhSV5IRxXxDLy0X6H83bgJivbt1LHvTSKf1J1nRX3bw+6ivqQz0Jr
	JyfG8BQyVbNppDzPmsFXV/uh+zYm98ns5U5Wo7LkocHNYSkbB/8TK8QNFZjLdRf95bnWSidDwYy
	KbdYyZrNKiialbCAZ4Gy13DUTCL0jKcbzkimX3b3aVTzQCHSFjciyvrSU4mwwRFOknvZEYpylEm
	zWo/X88vVK8erxzQ7bhKOZTVD9qXekcR7hsyQsfSdcVK6vMob9ZJqP1Muq1G6NIsVq1K1LB2Ehh
	D0oZqm0V2QRQJyA8gOHjt4h8iD8FMaMKTFoMjIBdhU8nST4sFLIfa81VXcNf+YbRSsX6EnGYuKA
	IQvr0zFjBxYtzW2ElgmbVlkFDglr3eMtBiwLtgjgs4ogdM1cSHUIhMy75FIW4rHEZ7Z
X-Received: by 2002:a05:600c:a00d:b0:499:d95a:41f with SMTP id 5b1f17b1804b1-49cf7f51dcbmr42170965e9.0.1788527367548;
        Fri, 04 Sep 2026 06:09:27 -0700 (PDT)
Received: from OrangePi5-Plus.BB-HOME (20014C4E1B871500CB6EF488A18F9C42.dsl.pool.telekom.hu. [2001:4c4e:1b87:1500:cb6e:f488:a18f:9c42])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce554d52esm135575435e9.3.2026.09.04.06.09.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 06:09:27 -0700 (PDT)
From: Igor Paunovic <royalnet026@gmail.com>
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>,
	Oded Gabbay <ogabbay@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sidong Yang <sidong.yang@furiosa.ai>,
	Diederik de Haas <diederik@cknow-tech.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Jiaxing Hu <gahing@gahingwoo.com>,
	Nicolas Dufresne <nicolas@ndufresne.ca>,
	Jonas Karlman <jonas@kwiboo.se>,
	dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Igor Paunovic <royalnet026@gmail.com>
Subject: [PATCH 3/7] arm64: dts: rockchip: rk3588: add an OPP table for the NPU
Date: Fri,  4 Sep 2026 15:08:54 +0200
Message-ID: <20260904130858.27803-4-royalnet026@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260904130858.27803-1-royalnet026@gmail.com>
References: <20260904130858.27803-1-royalnet026@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The NPU compute clock is driven by the firmware, which only accepts one of
the rates in its own PVTPLL table: 300, 400, 500, 600, 700, 800, 900 and
1000 MHz through the PVTPLL, plus 200 MHz off GPLL. Anything else comes
back as SCMI_INVALID_PARAMETERS, so the table has to name those rates
exactly rather than describe a range.

200 MHz is included even though the vendor table stops at 300, because
mainline pins the cores there with assigned-clock-rates and that is the
rate the NPU boots and idles at. Leaving it out would put the boot state
outside the table and give a driver nowhere to return to. Its voltage is
the same 700 mV the vendor uses for 300 MHz, so it is conservative.

The voltages are the vendor's, and the upper half of the table matches the
GPU table in this file step for step: 700 MHz at 700 mV, 800 at 750, 900 at
800, 1000 at 850. There is no PVTM or binning here, for the same reason the
GPU table has none: mainline uses conservative worst-case voltages instead
of per-chip nvmem data.

The table is attached to rknn_core_0 alone. All three cores share one clock
and one supply and cannot be scaled independently, and the driver hangs its
devfreq device off the core that carries the table.

The full SoC range is described rather than a per-board subset, so that a
board which cannot cool the upper rates drops them in its own .dts with a
/delete-node/ on the OPP it does not want. A board may only delete OPPs
that way, never invent intermediate ones: a rate that is not in the
firmware's table is rejected outright.

There is deliberately no opp-suspend property. The driver has to resume
every core before it may touch the shared clock, so letting the devfreq
core drive a suspend OPP from inside a runtime-suspend callback would
deadlock against the driver's own governor worker. The driver records the
boot rate and restores it itself instead.

The consumer is the devfreq support added later in this series; until then
the table is inert and the NPU keeps the fixed rate that
assigned-clock-rates gives it today.

rk3588j.dtsi does not include this file; it carries its own derated tables
for the CPU clusters and the GPU, and it gets no NPU table here. That is
deliberate. The J part is rated lower than the rates in this table and none
of it can be measured on the hardware this was written on, so inventing a
derated NPU table would be guessing. Its NPU node stays disabled, so
nothing binds and the cooling map added later in this series is simply
never resolved.

The same rates and voltages were arrived at independently by Nicolas
Dufresne in a proof of concept that was never posted to the list; his
version differs in that it marks 200 MHz as opp-suspend, shares one table
across all three cores and drops the assigned-clock-rates pins.
Link: https://gitlab.collabora.com/nicolas/linux/-/commits/rock5b-npu-poc-4

Signed-off-by: Igor Paunovic <royalnet026@gmail.com>
Assisted-by: LLM checkpatch dtbs_check
---
 arch/arm64/boot/dts/rockchip/rk3588-opp.dtsi | 45 ++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-opp.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-opp.dtsi
index b5d630d2c879f..3711727020ed1 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-opp.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-opp.dtsi
@@ -151,6 +151,47 @@ opp-1000000000 {
 			opp-microvolt = <850000 850000 850000>;
 		};
 	};
+
+	npu_opp_table: opp-table-npu {
+		compatible = "operating-points-v2";
+
+		opp-200000000 {
+			opp-hz = /bits/ 64 <200000000>;
+			opp-microvolt = <700000 700000 850000>;
+		};
+		opp-300000000 {
+			opp-hz = /bits/ 64 <300000000>;
+			opp-microvolt = <700000 700000 850000>;
+		};
+		opp-400000000 {
+			opp-hz = /bits/ 64 <400000000>;
+			opp-microvolt = <700000 700000 850000>;
+		};
+		opp-500000000 {
+			opp-hz = /bits/ 64 <500000000>;
+			opp-microvolt = <700000 700000 850000>;
+		};
+		opp-600000000 {
+			opp-hz = /bits/ 64 <600000000>;
+			opp-microvolt = <700000 700000 850000>;
+		};
+		opp-700000000 {
+			opp-hz = /bits/ 64 <700000000>;
+			opp-microvolt = <700000 700000 850000>;
+		};
+		opp-800000000 {
+			opp-hz = /bits/ 64 <800000000>;
+			opp-microvolt = <750000 750000 850000>;
+		};
+		opp-900000000 {
+			opp-hz = /bits/ 64 <900000000>;
+			opp-microvolt = <800000 800000 850000>;
+		};
+		opp-1000000000 {
+			opp-hz = /bits/ 64 <1000000000>;
+			opp-microvolt = <850000 850000 850000>;
+		};
+	};
 };
 
 &cpu_b0 {
@@ -188,3 +229,7 @@ &cpu_l3 {
 &gpu {
 	operating-points-v2 = <&gpu_opp_table>;
 };
+
+&rknn_core_0 {
+	operating-points-v2 = <&npu_opp_table>;
+};
-- 
2.43.0

