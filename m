Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792678986;
	b=NN6loEOQrD8iK32tchpPNaYNCjUOG3rPPEzcdR8BDHwfoG4frJ+8EMMzTUlI9Y1OA6mv
	 CbS7B727Fbj2OIcSkf+0VfXhn81kA/aVb+8YJ/PFPJdP6xQyZagRCicfx/6K3vE9pKvMX
	 KsHb79Z7K3Occb+QtcjmbDm9fCuT1OUIuyXaUHHTPZY5DtPmcLwQx3IGui5Sdz6vZKF/J
	 R/bPQhjz8sEkmc0ZrmmxK4nR2SXfbeP48Xq1dYtR81lbynTO95F5kEZWU93UmKNO9BbME
	 rgfNHQqkVQo98xP0FSHGCkATc426WPbGucvv9812qjxlkA7Ix+3xs/LBPL0e33coMpg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792678986;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:To:Cc:X-Mailer;
	bh=myYidWIIbWAkZv9VR701i1PRbNKaJd28wzAcC9LDW4Q=;
	b=SwER6iV/2p/NkOPSecIWgRGgTxsVGUR58MwtfU0EknuZVUoLTCUp5Ga77V0YCFTGZM8V
	 skitq2/XZOChGplh0FWo/Z116uBtgXR+kAyr8Quk28OTggGcaTfGvGWPLYm+7vgJoYWaI
	 NAgMAEtuIMvnIzRKbfC6AkOHGyOPq3mDaLxrEV3Xx6MO494CJAeOPM+8rDqiN89k0YBTr
	 S0ZvxLCzMvM/d7L8gZqgP642oM8B7h5eVtew9LPg1Tf2QsWlZeO3cR9iIWoyo9X5rl0x1
	 zXkJJDC9hXAE15B7+6bpayxoiMkZtZfUi5J8+iIa1vG8annNqE9ERyLF/BH91Xh1cbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=oefI+SRh;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CD16606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 14:23:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4CD16606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=oefI+SRh
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a2072b9832so4296065e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 07:23:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792678985; x=1793283785; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=myYidWIIbWAkZv9VR701i1PRbNKaJd28wzAcC9LDW4Q=;
        b=oefI+SRhk4UgRTuRM47u+1b04l6u5XLZOSIZ66bQL0wJyvbFLyM4Ug/lbN3QkWZI0b
         vZkYcN3S/tijHM0jbhSVJ9GrpeQ+VVma7DHe7Xe6o2cTEh2kFW9zVZP8Njct1r58gts1
         K2vN+nVpb066Ma84PrlKbqLcb7FBWH3zjd/ojMYzg7/W3WbFRGAQDLFtgaP/mSoavT5q
         MmvuNaBgH0kt4kr6S9AG4Rwuiz7eY+UpY66O+XI5zbk1BrNDxhrONRgMBHNqbZGaH8o0
         EemoURaaZkqTZg3hfKpYE1pKu2e0FqTXt96gmF0D96zTEKF16Y+zZahIOkVqthsS1+LH
         dChg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792678985; x=1793283785;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=myYidWIIbWAkZv9VR701i1PRbNKaJd28wzAcC9LDW4Q=;
        b=sQGQ8wYP5bdqXj+FJY6F5grIBTP2g9J5WKrrSfzBLwPqPqmL0AFVnAfbhrKG6Yry3V
         L0g1d8c4Gz/5tw8j7rBXzEIJQwpmuqacQhNhEieCUSQdjufq+D4wo7KGpcj3YvHvGe/q
         /MQRd4pVe++kRqWIEeEZYTWtkSBiAFChCTrgH54Jyihh/8C1cTY7tMAvYIMd+1oS1q2l
         4pY5470oPLfYIIV8sbSirwsmNKGxxwUq2YielfNGa4WAxG4A0DLJhy4tBrQ9BvI223XD
         NAjMVUSVOvO/M9wxL42up15e0jITftx/OedYr2c/zlcABGUH7jnDggk1ilKBmunCxqEi
         zfDA==
X-Forwarded-Encrypted: i=1; AKwUvBwiAG+LKps5c6duQlEpj0kQre4pjWOFa5MH9HIFGTI3xppqoQda8VPngnj3Q8WxolCGxNiMMtQf/l3ITZs=@vger.kernel.org
X-Gm-Message-State: AFq9FYKDId73aMn+emv0R5FrJeNz8hCwR/2PaH8h5uYha07NdFwE0RuA
	oKyty2XwCePVex6VWC2iKSZ3mplN+DZuB1k7qkIvOwJ2MRodZeUngYKG
X-Gm-Gg: AYBFou39LcKpaD1AsOchS0TnhHlsWNY61UChkUst9OJCQ3yW6h2IptQK0YHS6w/S61h
	EfgJfsgTgSI/D0m9JoJAK3egrcxsmnybgYkXvVFptc+Wqtoxcqdb8lP++eZd3BCQnEUlVSViUWP
	O55dC79E9/LjFueiGGPqS5kWylj2ehWnp5JCKZZT/sUim/nJy9XjKpWsh3MtHR3nr4xaB7entF+
	vYqmGJV1A5D07/+K0nlvMwWMt6crieYXN0rDVTwALwIA1F/Oo5+unoL2XrgLnmW3D6/D5U6518b
	PTZOgmb5BjxpVa3575MkjQ8lJwTuJ1XLvhEJSXSF9/anOAsbYUPiA6sIpYcCm+x5xQIETRRF0a5
	bBGr06+chJKrSAyVKvDvA+VWI22O3M7H7naHmdAUwj6KnuXUW7gKo6pc4vRg9AxxQnyv9x+RAIw
	pPTNavnBsHR4W65o82fzYv4+0uG41HS0dY0KFfHRLoFUWuMaGWMmdIKPSy7E3bdPlFTgPv6hgCM
	5nvVxpg9EG+GLN+a4DJLxf3qn1eyu+XNav6KGvtDv4ODhuFV1KEz/2BPl7AzIDcdSFLi4oncOoK
	7q3YG2dL8mJ2Ay9V8HJwn5rQL7t/FDuf3LOB75FygGQ+LLDp8pNkjIU=
X-Received: by 2002:a05:600c:a49:b0:49f:ffa2:1c72 with SMTP id 5b1f17b1804b1-4a204b20321mr50739115e9.11.1792678984170;
        Thu, 22 Oct 2026 07:23:04 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a207b29276sm95945435e9.6.2026.10.22.07.23.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 07:23:03 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Date: Thu, 22 Oct 2026 16:22:59 +0200
Subject: [PATCH v3] arm64: dts: freescale: imx8mp-verdin: Add Cortex-M7
 remoteproc
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261022-verdin-imx8mp-m7-v3-1-af284e28531d@toradex.com>
X-B4-Tracking: v=1; b=H4sIAEIc2moC/4XNTQ6CMBAF4KuQrh3TH1KoK+9hXNR2kC4KpDUNh
 HB3BxYmunHxFm+S983KMqaAmV2qlSUsIYdxoKJOFXO9HZ4IwVNnkkstuORQMPkwQIhzGyeIDVh
 tUOpWt00tGM2mhF2YD/J2p96H/BrTcnwoYr8eGDfiF+spzkZMFhJav0ARwEE5o2qDzj9MdyXJe
 pzPboxsx4v8gIJz8ReUBDZeqFoRSPkGt217A40DcXcRAQAA
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
X-Mailer: b4 0.13.0

From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

Describe the Cortex-M7 remote processor available on the Verdin iMX8M
Plus SoM.

Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
This patch was previously part of the Verdin iMX8M OV5640 series and is
now sent separately, as requested on v2.
---
Changes in v3:
- Split out of the Verdin iMX8M OV5640 series (Frank)
- Move the UART_4 overlay to the shared Toradex Cortex-M UART series:
  https://lore.kernel.org/r/20261022-v1-imx95-overlays-v2-0-c769d6eb54fd@toradex.com
- Link to v2: https://lore.kernel.org/r/20261001-verdin-imx8mp-hmp-camera-ready-v2-0-7d1343ecd3ec@toradex.com

Changes in v2:
- Rebase
- Link to v1: https://lore.kernel.org/r/20260910-verdin-imx8mp-hmp-camera-ready-v1-0-3c9349ecdb9f@toradex.com
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
 

---
base-commit: 7f47e8eafbf55a2ad0697e5d28f5e6cff2fa42f9
change-id: 20261020-verdin-imx8mp-m7-a69e26868741

Best regards,
-- 
Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

