Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D5E552842D
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 08:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790064116; cv=none; b=pqxb/DbF8AJL5P0BpUC9CNP73fqd7xaSybgtdfXg0EKf0YLyGZ6c81azWlcvGOzcqXMzPIwwTdetuz4ZX/mJ1YSSgjfTN13WY74BndHiLSvOCIfOhaL2XhbZ3thLaGqkSZQz3I/zWcCmTiw7yn0DjJ/g79GnXlE+zkl4qnrj02U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790064116; c=relaxed/simple;
	bh=8caMejK8hgruIPCiytRhmYLDcurgxrGWdTVCVpsRw0U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=o9GblOOWOq2XBtYaJhxzoHTROWUlQ5NJwyvxLJ5N3/AtRy20zB1dazYeEHGyn7OVeoS7WNpDiI94UvWlyyTUlcOBy5DFF0rkxRwYpInqLNVL7Jv1D9yDGma/yhQPh9gspAyYBg3Em2cqkqLdiMSVxkf1rtUt69qI6o/ICcqrnlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qf+nY3bJ; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qf+nY3bJ"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49d0726cdbcso2018165e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 01:01:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790064101; x=1790668901; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k8SSEreitnBFuEXQj3F3dce2S1yQFmhptrw7zyYrACU=;
        b=qf+nY3bJ0l4kr1VWLZG7cczDhzi0I0pbqnIGx0g2Ca16CelTZIS3wgyAlHU7Q3ZF+T
         l3GyoPioQCGr4o+Ymi5fe+rwTJUIcf0pxEbt0dm3UrHYNiQ2Efu4KEEtsfpadkOj5WKu
         PD0UrdqVCAcrqyYHOLqoODqlg6q1UUw1ysOVm0QCwDu2eqtaUEhU3a8OYqlKEmlf2p4l
         pLZf/ZLXsvoGHP+OHJKWCI5v60PbFo/olg49RqIdQcQaezuKKnii/GtCGtgEK850S1Iu
         4gZ9nvv+RcYzjfPYilp3D6iyRufxOlOSvym9fKuTyrAF3r5f7CYQMePOTWFYjnYTLam9
         vOlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790064101; x=1790668901;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=k8SSEreitnBFuEXQj3F3dce2S1yQFmhptrw7zyYrACU=;
        b=TlwDTwrF87g29tB73HRP8BC0h0fd0SxCdw2b2ezAVBTNQqXIShjRNOcgOGrOIEjyzM
         MOKxo7p6t6RT0Q5lLDIiRgvU3OL3HBX4Rihu81PQt70tg2rD1Vn5/fVLRH8l7xqHTwxm
         am52ykrUOddy7mNZl37xJ68WHiik29VSPAyKeBk3yYK65D0vFrgd/G6m6qX0VnGjl4Kd
         T70WUqx1UFSOH8uyKHchtmK24LamlFpE7/7MN6rb+kQrGO7EE9zKAlN2ArtBgFTLqG/F
         PhWyhS4kVNBUqLHT/iMF+qYsuXEyvCgHCEpfV2CGpSlRdKWTqvoT6tkt2+jJskbReYU8
         N+BA==
X-Forwarded-Encrypted: i=1; AKwUvByzDwtJAB9DJ6np+aFb2C2bdAu935xw3uvKqxv3tT4o9cVrOUw4iC/9T1sUktJBXNL3vQUmii7S5FoFIRQ=@vger.kernel.org
X-Gm-Message-State: AFuF++ndbba/2qEmk0LCwzuwg+0ayrEZmP+LcrgudfozBWVs5DAd1F2Q
	VfhrpAEMz2EqWKelu+atx/y/AeZjKkDm/2DrqCYYFNX5xqrKvHNX2iZu
X-Gm-Gg: AYBFou3fRfoNKEqvNtsbIkanH9/vmX2m9/2VfpCkBYkDTI1xIp2fmGq2tzT7FgbJTSy
	g1Zrzj2PKhf1kYd14e4NlZAtQaJrcHxSsEa4A6NRk8Qp+apw3HNK9oQVBoCpGUcsGQvBTc2ZbcK
	xFDBrIxXQ4yHDefajVVl2GvBVZQZqvtu5Cz94roOqWww5VWGgSSwdTAtJV5Rt0yFq8WJplmu4A6
	8RLoaUH0jmZhda0q2Avfq5TdV+K4hIxpSRtFvm2YbCpGp/zm1t56uZCiEwNZ7ikom7MXg3+LY4z
	3ranushpWU50YM6bF4d6QF6GWEd5BbA3DzF4mFAjZtqibqqccp7/waY3GoPjy7BzuoBmEJDkNn/
	YE20XkM6MVBFvG4H7smpKrE/sIUGj6jHcdGCtdEdo4iWVF+gW9ucCKLzdLpquYbeQ5ED4v/KsEZ
	Pzx+b3X/zev/MAIHNMwLSYST2zQyKxlgUbwWYYPZxSTAIuwPaijLYl3gNo+uL4pxtT8b2uMQjq9
	ru58fRWtFn1NwXggKWZZzxmti8BpvrXAysApq4FR5ZmnFBqsxtppdxCX+b//+dnVoxPJIVcSKJ7
	3Hc=
X-Received: by 2002:a05:600c:6992:b0:49b:9241:7ff0 with SMTP id 5b1f17b1804b1-49fc7b7a756mr226941795e9.0.1790064100738;
        Tue, 22 Sep 2026 01:01:40 -0700 (PDT)
Received: from OrangePi5-Plus.BB-HOME (20014C4E1B80530056971C6280202175.dsl.pool.telekom.hu. [2001:4c4e:1b80:5300:5697:1c62:8020:2175])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fdaaf97e2sm18248625e9.2.2026.09.22.01.01.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 01:01:40 -0700 (PDT)
From: Igor Paunovic <royalnet026@gmail.com>
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>,
	Oded Gabbay <ogabbay@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
	Robert Foss <rfoss@kernel.org>,
	Sidong Yang <sidong.yang@furiosa.ai>,
	Diederik de Haas <diederik@cknow-tech.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Jiaxing Hu <gahing@gahingwoo.com>,
	Nicolas Dufresne <nicolas@ndufresne.ca>,
	Jonas Karlman <jonas@kwiboo.se>,
	Guangshuo Li <lgs201920130244@gmail.com>,
	=?UTF-8?q?H=C3=BCseyin=20BIYIK?= <boogiepop@gmx.com>,
	dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Igor Paunovic <royalnet026@gmail.com>
Subject: [PATCH v2 11/11] arm64: dts: rockchip: rk3588: add passive cooling to the NPU thermal zone
Date: Tue, 22 Sep 2026 10:01:14 +0200
Message-ID: <20260922080114.44662-12-royalnet026@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260922080114.44662-1-royalnet026@gmail.com>
References: <20260922080114.44662-1-royalnet026@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The NPU zone has had only a critical trip at 115 degrees, which is a
shutdown and not a cooling policy. Now that the NPU can be throttled by
capping its clock, give the zone a passive trip and a cooling map, in the
same shape and at the same temperatures as the GPU zone right above it:
85 degrees with 2 degrees of hysteresis, and a 100 ms passive polling
delay.

The #cooling-cells property goes on rknn_core_0, the first of the three
core nodes, as the one node that stands for the shared clock as a cooling
device. The other two cores have no clock of their own and cannot be
throttled independently of it.

The cooling map is inert until the driver registers a cooling device:
thermal_of_should_bind() only resolves a map entry once a matching cdev
appears, so this patch on its own changes nothing but the trip point. On a
board that leaves the NPU disabled the passive trip has no cooling device
to act on and only changes the polling rate above 85 degrees, as the GPU
zone's trip already does on a board without the GPU.

The thermal path itself has not been exercised on the board this was
written on. Reaching 85 degrees on an NPU workload with the fan curve here
has not been possible, so what is verified is that the zone parses and
binds, not that throttling engages at temperature.

Assisted-by: LLM checkpatch dtbs_check
Signed-off-by: Igor Paunovic <royalnet026@gmail.com>
---
v2: commit message only: wording for the shared table, and a sentence
on boards that leave the NPU disabled. The diff is unchanged.

 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
index 376ad04e07869..c3d22b08f415b 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
@@ -1162,6 +1162,7 @@ rknn_core_0: npu@fdab0000 {
 		clock-names = "aclk", "hclk", "npu", "pclk";
 		assigned-clocks = <&scmi_clk SCMI_CLK_NPU>;
 		assigned-clock-rates = <200000000>;
+		#cooling-cells = <2>;
 		resets = <&cru SRST_A_RKNN0>, <&cru SRST_H_RKNN0>;
 		reset-names = "srst_a", "srst_h";
 		power-domains = <&power RK3588_PD_NPUTOP>;
@@ -3212,17 +3213,31 @@ map0 {
 		};
 
 		npu_thermal: npu-thermal {
-			polling-delay-passive = <0>;
+			polling-delay-passive = <100>;
 			polling-delay = <0>;
 			thermal-sensors = <&tsadc 6>;
 
 			trips {
+				npu_alert: npu-alert {
+					temperature = <85000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
 				npu_crit: npu-crit {
 					temperature = <115000>;
 					hysteresis = <0>;
 					type = "critical";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&npu_alert>;
+					cooling-device =
+						<&rknn_core_0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 	};
 
-- 
2.43.0

