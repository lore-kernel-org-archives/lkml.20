Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEFC44A689D
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 15:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789054689; cv=none; b=UM0w1GnkTQmxD77o+CklXeY+AsU6KkE82GFjuhiAuoClMn8FUr8AF5FsX6fQDWbNnghh+c5YRUK+pu1SR4mBP2O+uZ8vLKdfUpzJSAt0XGYqXQXykMrIe4dkp/SIvpLvtcaHcyG4p5Aty4RDheE5cySg9v7RrQjU/GK4jq7DAZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789054689; c=relaxed/simple;
	bh=TrTvDfFn/k4uiEHyffaC4IKdjtst9K0k0gvyN6WQHvg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JRtsgwW7kIU0vmYZgz9gygClYGhlzCUNGmLJ6c2bnT61SDg06i1YpQK2TGUDXlU5tVfcj9OTIk2cqFQn79MkUPImtM2ZL1RSh5Sn8CpRDWoT/rbUxgIVG2Tjyqrw2Up9d6Mc4XB/qFE6Ia5dQQc19PP9xmrUowePBoKPEkKezZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eNjk8dot; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eNjk8dot"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-499ac87c92bso76394245e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 08:38:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789054685; x=1789659485; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oHoaVug1Lx4d7NCtEru06mZWP8AQ/VN7bfbLwwo+zA8=;
        b=eNjk8dotC2zNygLiLkoqaC1/F21YVPqPHJHri4Clxe00kg3KOtuzT5ngZnS10DXAYM
         x0J+tvQvA/B0m/K80cd4wX5sokAj+A9BgRy9pJ5W8dKqrG2aerK+0Yuxex9bkPUJcE7Y
         nmHzlh21oRPpyhHgi/uLKXiWNyZ8W+rpKyyODb8WjJRtuZoawwahyoy41fVWv8FIzgWr
         GTnDscyMF6pR4gue/gTcZwP9cHmbwUAVW1hhY9NCwhvQBG13aGP3JVTD67g2ppCCEL9S
         Nzp8Z1/2M1lA7DCxWIkH5O2owpZinPBl41uYSClGq0/08o7GgMdHQq/MZfBvBfsWWb8e
         NVng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789054685; x=1789659485;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oHoaVug1Lx4d7NCtEru06mZWP8AQ/VN7bfbLwwo+zA8=;
        b=IE62lchnkFf+Na7HssV0FRUSSfr1tnfCCfifE3CoLzrmS8VnNwSIAFHBIaATW8MqlY
         jZkOWdFSYZrqj2UirmoGuC3/ys9l8sLpNWHD6EMYM4TzNOYAdTb6USCRWE5B61RGOWhY
         oC8nlsNqp/Pfd5zHj2Ee4fykn+mrohb5wYjhZxguO6E2wHwDTKmYYH1DLS8QoxD+4HjB
         psmZEBHBcbcqvd0qu325BzcasevVp5Dsb3lta2an+xGaMRnxjhQeTQc1oqD50UpLm9zG
         srLyDRE4/tLuGb+bG1d5MLRpYvNu4A25t4zOZVeFv8WZEPxHqebXQdn+umIICvYSyevo
         ZSDQ==
X-Forwarded-Encrypted: i=1; AKwUvBx71QayvseYwfPPMVl/TJZTZj8EwvxM0/yAj6WBn6F4wbzOje61gEGvG8Lzw3LQ25Pr4lH2+A/3INcBiJk=@vger.kernel.org
X-Gm-Message-State: AFuF++k2iI0I6HHtOlFpo4NPkcJLsAnLo/lA8TwJwjiUqBl8w5xo/iUU
	QuEsnKCo2VD52XoFrTmht1Hcu5kO3i+wgszj44Dwlv5JzVfgnceHJK8G
X-Gm-Gg: AYBFou0KlnTioX6BVozQA4BYBiezK83/PkLpnkKuyIo+xRD3w7P0u5TvP1b7z1xcMaW
	7Ezp/1We19acsI+ia6mTPlIUaoFhudhvAIPAk4lEcGKIg4GHwh+FQDVlkSqnoypR52ittfn89Va
	K/Xy1Wc9UIU0k+pnJnxBYQf7nblFhbUC4hVYMxjj8JJUJEiXA339WDWRbZZcZZbOTPHBYtiC101
	bazMcnwzM3+rq0GTX1ki3Kz93b7G6/Ejep1FhKotylQBac7COHO+hUhYgTKz+mU9CSL4lnVgRYI
	4CC9fEty2PA/OYRo7u0Sx/VcjZEdJ62ecBOap1ICuSq0FJ9GDPvQ4KhCSzess6uwqpduFVDYAGv
	8f/trCyS9n7WIZ9GnTwYrzcj3tcAvt1xZuu05NkxeIs3Inz9Svy4T3TUmSUms3LojJgLXBwstp1
	yTUwRwiPALIpVolv+IoZ5J4uDj/Ux7iDZmnak8dxOmhyERRdXsNEera+FBj7Af5syF8xvhGFkwV
	VIaKLirFNdEQp3RezCXdpDER3e+5BTjEGOXswzjqosvtdvk2X5mpgWgS+Ic/B/VhSptEgKxDA==
X-Received: by 2002:a05:600c:c4a7:b0:49c:df2b:15fc with SMTP id 5b1f17b1804b1-49cf823d0dcmr440541835e9.8.1789054684861;
        Thu, 10 Sep 2026 08:38:04 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e60adaee4sm3390545e9.14.2026.09.10.08.38.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 08:38:04 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Date: Thu, 10 Sep 2026 17:37:57 +0200
Subject: [PATCH 1/6] arm64: dts: freescale: imx8mp-verdin: Add Cortex-M7
 remoteproc
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-verdin-imx8mp-hmp-camera-ready-v1-1-3c9349ecdb9f@toradex.com>
References: <20260910-verdin-imx8mp-hmp-camera-ready-v1-0-3c9349ecdb9f@toradex.com>
In-Reply-To: <20260910-verdin-imx8mp-hmp-camera-ready-v1-0-3c9349ecdb9f@toradex.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Francesco Dolcini <francesco.dolcini@toradex.com>, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
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

