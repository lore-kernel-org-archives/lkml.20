Received: from mail-wr2-f33.google.com (mail-wr2-f33.google.com [74.125.225.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 365A2404BE3
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 11:44:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790855066; cv=none; b=nVkKKyvnQ+DOFWtar5eFeROmItkqDxRIyAVIk5/AUweHQ4EEvVpdJhHtw3wC3rIb71hveR6ue4MaMw4R8ZL9eRidwVPwKEYys/6CmSR5PdFcov5HgMMtYI2h3+qeYAGBSLPBET9CrlG28omlVLKw7LneYWK9PJP0LKhNGmH5GY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790855066; c=relaxed/simple;
	bh=TrTvDfFn/k4uiEHyffaC4IKdjtst9K0k0gvyN6WQHvg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=L1FiW6OUejBIp1FH6Mog/QbbFu+QZ4hTYiy6V4JsFHNcdBb2jEUY4eVUANyqdqrVdCDkBAXBWj/u3/FA2VDS3vPq4PTsk9NgVRZqCANOWwcKikyggSLPIzL6KgeUO6kgBa6t/j00MWEctaGng+Fya4BjbHWe22XekdBOfARyna4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XLgfOlJe; arc=none smtp.client-ip=74.125.225.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XLgfOlJe"
Received: by mail-wr2-f33.google.com with SMTP id ffacd0b85a97d-48b024549a2so1325651f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 04:44:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790855056; x=1791459856; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oHoaVug1Lx4d7NCtEru06mZWP8AQ/VN7bfbLwwo+zA8=;
        b=XLgfOlJeGr0cYV1OULxE3UdFb70m+d3T4FjQcs0cW9Hk+GNhzNwfZ4AmLtFumheUoJ
         z7cfk7NVEvKm0Yyt9ZWjqFb49OPIo5eHFjRS6HVvbazV7X61dfEoGPrmzwRU6T40utFF
         ZcO8tqux7Ck8Yo0ZL3eN86ZGvD+BmY5JeKCv89K/l0GajlnGyTThvNMb5cWknauJXTkb
         JiEl2U8cvy7+Sx9iYC70BpnneNx2KYW0hIYmCENZbke908lODGAE1+PZ8hyWzmu/5ic3
         twYFi3AbchK+Srhv+/+x0qnfo6NpfiWBKDJBKHQY/H4Ixn1qAvQy/mJ4BHvg0VLnhN4L
         AAdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790855056; x=1791459856;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oHoaVug1Lx4d7NCtEru06mZWP8AQ/VN7bfbLwwo+zA8=;
        b=sIeJMDTsyqd3Xib+3mBbhqNwZFGm9uodhG2f3XG8HOGvb/9OPTFoGzOX3bzyH+Qi5m
         m9pVdYxBE/Ozpj4sim3xu4P/ihCOZkYuLaC196p8V7dPLAa9xC8fQw2Jrewi0eevK8Rv
         zfEZuQLYvrWAOoTE33Z60ISghR6EGc6ZpxCo9gJ8g5+nnLvQgWoU21I/OqevfNtced5R
         y7baroBRIk+w8wwYH9cMq0KI1RMShMnBB4a73NTj5IU1+AMn6KKj82BtVChw98Xuul2Q
         VvYGXfLY9yNYHpyPqiTZptwPPo+/5XTfPCKw/9DCmfq+4D4nUnYlNGlIL0vpOJr/lz6u
         DFfQ==
X-Forwarded-Encrypted: i=1; AKwUvByXClH3J34MHF0TMB4tFKPD/kVEuakS+4KbagTGjj6iqDPnHX7R+uAcLNp2EB645Ja7xSsmIW6jfzzVyPM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJJhYjJnUKU0Sh5OiQ9PcjHBVL0OEDVp/CZLfvnHDrxMYO/yaqv
	KuU9F/D7M1m15qXuCUDRtGt3cSAACoE5YJ+WtM2cZEK3vER/ddvVdbg7
X-Gm-Gg: AYBFou1LIqDntP1bIae5Cd8thxWkT5+QUYrLN5AIMN1pUtbAQqKzMr83IDb/jFlRbWD
	alytexQdhRtQea9in7+QzoaCoQigeQPJulQWHvluosFjYJHpyhfMoNcubTXxmkDRCe/XrUrZz+F
	KeWZMoqaUeuPqZWd/44zEP6y5qfVuSST0YjGewdMpVQMJa5NEy3Dy4PSvo5uOmtnSf791MhQkle
	H75x/95b63rl1kRvuijFkVV2RizIkWDHyGqGZsBkpQlJZ6jyVKh+1dH7TRf7xHJdI4Pyavami21
	3XpU+7t8Mf0vJifTqjitw31eNAufJ75ZQY7Qm0t2mo7Meyw42j0ylGSq5U0Ur00eTSzvXLHPbQa
	gZiUwDLQ/ub7UWqGLh+jyiwTmNf0VbR2Q9fqNGJi9/XfJT8vv7f4GEgto3MSLqMAmwywjcSQgJ+
	EI0Fovo1zEu+8w6WbZUS76uqaloDYuW/tzDM1ijhUOAfrWscx4+9B6xIaH7vVRC1oeNBVQt17WD
	3oB0XE7aty4KsJL+TupsD/feIgBmyfE4A5bTK5OTPn6xCD+yg+sBxBFKBDBjo0OfhzzLSvZN4c=
X-Received: by 2002:a05:6000:4b18:b0:487:14b6:b1be with SMTP id ffacd0b85a97d-48b024d523amr7320787f8f.25.1790855056060;
        Thu, 01 Oct 2026 04:44:16 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b1035eff8sm1243705f8f.7.2026.10.01.04.44.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 04:44:15 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Date: Thu, 01 Oct 2026 13:44:09 +0200
Subject: [PATCH v2 1/6] arm64: dts: freescale: imx8mp-verdin: Add Cortex-M7
 remoteproc
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-verdin-imx8mp-hmp-camera-ready-v2-1-7d1343ecd3ec@toradex.com>
References: <20261001-verdin-imx8mp-hmp-camera-ready-v2-0-7d1343ecd3ec@toradex.com>
In-Reply-To: <20261001-verdin-imx8mp-hmp-camera-ready-v2-0-7d1343ecd3ec@toradex.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Francesco Dolcini <francesco.dolcini@toradex.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
X-Mailer: b4 0.13.0

From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

Describe the Cortex-M7 remote processor available on the Verdin iMX8M
Plus SoM.

Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
 arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi | 33 ++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi
index 9fee2cf9ef54..45a4713c260f 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi
@@ -77,6 +77,18 @@ key-wakeup {
 		};
 	};
 
+	imx8mp-cm7 {
+		compatible = "fsl,imx8mp-cm7";
+		clocks = <&clk IMX8MP_CLK_M7_DIV>;
+		mbox-names = "tx", "rx", "rxdb";
+		mboxes = <&mu 0 1
+			  &mu 1 1
+			  &mu 3 1>;
+		memory-region = <&vdev0buffer>, <&vdev0vring0>, <&vdev0vring1>,
+				<&rsc_table>;
+		syscon = <&src>;
+	};
+
 	sound_hdmi: sound-hdmi {
 		compatible = "fsl,imx-audio-hdmi";
 		model = "audio-hdmi";
@@ -185,6 +197,27 @@ reserved-memory {
 
 		/* Use the kernel configuration settings instead */
 		/delete-node/ linux,cma;
+
+		vdev0vring0: vdev0vring0@55000000 {
+			reg = <0 0x55000000 0 0x8000>;
+			no-map;
+		};
+
+		vdev0vring1: vdev0vring1@55008000 {
+			reg = <0 0x55008000 0 0x8000>;
+			no-map;
+		};
+
+		rsc_table: rsc-table@550ff000 {
+			reg = <0 0x550ff000 0 0x1000>;
+			no-map;
+		};
+
+		vdev0buffer: vdev0buffer@55400000 {
+			compatible = "shared-dma-pool";
+			reg = <0 0x55400000 0 0x100000>;
+			no-map;
+		};
 	};
 };
 

-- 
2.43.0

