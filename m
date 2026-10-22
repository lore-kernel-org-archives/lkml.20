Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792678184;
	b=NA+1C+KXELqAKUxjSTI4uJYz7OKmhPIuM/ul6f3KQlHJa2VZDYw6wqDS69tRNyVIDlKJ
	 jx9lbSnQGYm6OGdaUn72eztEzQpz9y5IVoFKk/FQCjzAVJXYkyksAnw8w3fu7+aY6JYQd
	 ly/zioNaUAXNaX79X/ILx9XremQd027BqxpiXLOp5QsUpZoh5fI1QNCuHquMGqEoh/o7Y
	 GAiC83NunLCCarFB34JZap3XnEcyX6eHgHZv2CZUmbdrGG7iMpvjRNSkWRJTmPkpOTlde
	 EXhKnYy5lLuaIZ6lqUzV9tVF5er5YDIygOoNYay63tur4tkLYlFbArUODiE7ThMqe0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792678184;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=ao/tRbZr32qcHB0KVI6iOR1WFXceFhMkLS8qN8SkWO0=;
	b=gY82vCx6CDX/fpvPdxCbnhMrzKm2ccXbb6W+gec1J/7dYQzxefQTL5ND24DCRua1jAnA
	 esndE+HFd+CskVtl0zLv/AyYSQYUU6eKuamgHXtqMef7/Xe1ulb0BAWNZwsbbo199+j90
	 RZJqAj2bckl5DEwFzAZXVcezShy/Toe6NNZJ8Ax//KD+nFS0yzgR2cROMGJsw7/v4Lhym
	 kcdzIVbKQRCrABi4XbMYOVscfB9DUYEJdQV6RQreUEHfhyYV7VU//+T/zMmaB1Unc2/9X
	 bU4EcM0S5n0FEcvzZ/lmlUXNG5ELmqqEJr9v1rZK6k5qOnaG0kpLFhJppcviHwYcjkQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=SmB6T5Uw;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5474160A261D
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 14:09:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5474160A261D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=SmB6T5Uw
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a16aaf2067so22192525e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 07:09:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792678183; x=1793282983; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ao/tRbZr32qcHB0KVI6iOR1WFXceFhMkLS8qN8SkWO0=;
        b=SmB6T5UwcIHWvTfoyw0ydYX89rnxNGJ0mffGEByawWO/OADL/jfp3vOT0R+YwpUDWU
         bKv+iFtcO/ALp3WENVb5e20XZLQw0oyLUA/vz5H5QxAgcYWJJEyGBDtKZ7eTgWaKqSNr
         KMuV0R8/LksrmqfTIriSersAy+uIt3ShLocfvdSLJkn3wFSft4t9qKCDdamKqeB6ZCdU
         q2PqRX5XBzLOz5sOPIwA5KVzTymxmg8z7ORUHlXfLLlwu0U2py9WweDxL2tdRgfUk+G8
         q2xyXdRKxA9incJk18jMziUKTTCwfKYUjoxM5Qmqda3Sr6p3ufBhAm5/9pAvnZgnZ0VJ
         pV5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792678183; x=1793282983;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ao/tRbZr32qcHB0KVI6iOR1WFXceFhMkLS8qN8SkWO0=;
        b=Np/5waVyB7SHjpf/TQXR2ymmVdpBBJymHO3WQgW6HBsQxQwoOmMzc+QFPZz3NX+7/l
         PFFPPD6Wibh0Bwp9TiRqjjT+CRcksjS2DkvLagrFJ4cqXzRQ8tWJd5xWQWnQsj4kphg8
         v2af4M0RSBE4qxlPQVr8vcYJ514Ds8sHOjh1Ma5iVWFUL/F8tUxZTmHUljiGHYjTj3Zt
         PAUGlomKnjLq8TMCHti0FOlOU5y0d6TKIvMlkcK68kXj4M+8xvtkKQ6juD3PE/MAfhxm
         820xN5Itpk3ZcY3ybv7uAejfFjerRphGgd/uvuvBPbPS+PydP0TA1RUzxiH2AstX43iU
         ghug==
X-Forwarded-Encrypted: i=1; AKwUvBxkr3Gv97ILli/MjLYy3FEQyMpmQGX2Qn3gqd0ArgxoPw3zWIzZUK8d3bWQ8ePDMhsRFdMJuGkGVfsBv4I=@vger.kernel.org
X-Gm-Message-State: AFq9FYLIbi9/BltrEu5zEcLDh+68yDotd7kUkYSVkLDKlUw6mUK2kfZJ
	UcnmdQongVSUBGTRSG4nG/1AR2S6WFCgdM5ScjiXBHIKdTYKlFCJNl9/
X-Gm-Gg: AYBFou2EBzzMtQrAj9XJ8asFtNr87vnR++5RYvkvZoWF+kuZ25R5drkTaBB73UZwk9T
	beHVhPd92uUpVKesrVbpHdDV79uaTgIxeH8ttXI+Tb8bUF2s5iyN5DQj5XV8RLRJaHwJTrAi1/t
	Od5oTX1C2rRj/3w4c3tEGuYWnVJEhXjoQOgMNoEb6vEwObRuRWmu3eyst0trs6ksk7NIzDQgTIm
	5pwPmqK6Jw9czY41FVBTZA2pZ4CUXIKgQxuMBL/FcjDpQ542BmDpSTyzUxFgwvRs2BpqccyNVpf
	w8P2vt/886/d4cGv60zPM+6XoCV17NOOBdLUpOQtoE/iDBF0jaJm9FfEEO665+a1V30b7GdeIzN
	PtLXeaUbL7GivBoj1dRwU+M8paC4azIJGYWKKKku06X3y2AeWFwp6gjuj03Ci+/PEZ+LFH312Xr
	iGwM7hucVqx2N4we/l3VXrxrid6fMPxnbEnNGLQWc6dBn2mapi+aMEzTIYA+W1NJJnQkJxD67IU
	GBOM7pbk0E1rs95N520VIEXPMwDw/QA/zrfeM7iOGFojT3RJxLnVO13zEIUPQgu73PbahRVsa6h
	bUDDW+JfM+8PRCiQ1chUmlDvutgFo1Zb4EMyeq1me/PCdEAZcqCLCg4=
X-Received: by 2002:a05:600c:1c09:b0:4a1:777b:8a12 with SMTP id 5b1f17b1804b1-4a1fdafd654mr107712815e9.14.1792678182521;
        Thu, 22 Oct 2026 07:09:42 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e2584e760sm12368150f8f.59.2026.10.22.07.09.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 07:09:42 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Date: Thu, 22 Oct 2026 16:09:35 +0200
Subject: [PATCH v2 3/5] arm64: dts: freescale: imx95-verdin: Add Cortex-M7
 UART_4 overlay
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
Message-Id: <20261022-v1-imx95-overlays-v2-3-c769d6eb54fd@toradex.com>
References: <20261022-v1-imx95-overlays-v2-0-c769d6eb54fd@toradex.com>
In-Reply-To: <20261022-v1-imx95-overlays-v2-0-c769d6eb54fd@toradex.com>
To: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
X-Mailer: b4 0.13.0

From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

Verdin UART_4 can be assigned to Cortex-M7 firmware. Label it uart_mcu
so the shared imx-tdx-uart-mcu overlay can reserve it, and combine the
overlay with the Verdin iMX95 Development Board device tree to provide
a ready-to-use DTB for the WiFi SoM variant. Firmware must configure
the UART and its pads for the intended MCU application.

Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
 arch/arm64/boot/dts/freescale/Makefile          | 3 +++
 arch/arm64/boot/dts/freescale/imx95-verdin.dtsi | 2 +-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 5ee9fa583515..f957797d90a6 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -982,12 +982,15 @@ dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-nonwifi-mallow.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-nonwifi-yavia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-nonwifi-zinnia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-dahlia.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-dev-uart4-mcu.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-dev.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-ivy.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-mallow.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-yavia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-zinnia.dtb
 
+imx95-verdin-wifi-dev-uart4-mcu-dtbs := imx95-verdin-wifi-dev.dtb imx-tdx-uart-mcu.dtbo
+
 imx95-15x15-evk-pcie-dtbs += imx95-15x15-evk.dtb imx-m2-pcie.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx95-15x15-evk-pcie.dtb
 
diff --git a/arch/arm64/boot/dts/freescale/imx95-verdin.dtsi b/arch/arm64/boot/dts/freescale/imx95-verdin.dtsi
index 72e7f1e88409..9aa4e8b23ceb 100644
--- a/arch/arm64/boot/dts/freescale/imx95-verdin.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95-verdin.dtsi
@@ -526,7 +526,7 @@ &lpuart1 {
 };
 
 /* Verdin UART_4 */
-&lpuart2 {
+uart_mcu: &lpuart2 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_uart2>;
 };

-- 
2.43.0

