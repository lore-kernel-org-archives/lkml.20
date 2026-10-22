Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792673493;
	b=TFvBVsZsw+/JRICk5JIhpiDskDeH5qslmBWfFu3QICPUiocsPLrtr386g1ce3s4YHPui
	 z6RqhUVs8/FSDla8xiYNsRcbNC1X+H8m1q9/PjOQVZtovzFS2Ai2r62b26pfD0F8YkHHY
	 Z1jpY4x8HLpBvBlREyhi5MxdieBnvGLWwck+OuZzDZWbr4ziLdehjxIxPHP+b3k4t+HXj
	 WRXDnjHfzH8GYLVNCDMjJPBvZAwOvofEHhgO2t8RREMG6vUl9TB7v9vSOViVp0tp/qexY
	 nmfZm2OVGIOy5/Zt477tX16yvICLHoVaywXJ/hHwQEdg27A4UOgDfLIQxxRYi9+PjyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792673493;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=UC1n9q3EpmPuUpvBqt4fP3LiFXC+thJA0wBcCFtVB2o=;
	b=ygEexoAIYTJSJ0iBQZIWkfLsN8EAujOzJB8Pb2Smu8KhMWQLfKUJRBEj8zlz/tdBI0QV
	 rRQNvzjv45Kd7D5inAwoYZrk6fG6mNmmhjz1QpeRj9Qt9MSdYNfxfd8UthhEInxrC7JbU
	 tbWCqMSF0qvjIiLt9t8e1B+zZ3rVfKpc2Zd1PBNRr6lN7Ew4Ye5KRzKPqzk2KfJrDnCGi
	 Q+TU6J7l+0VluRDI4RJmTLaKP9r+/OfVH+lGArj0MK4AjMj1heETOr01suB+ziObthu9s
	 TosFU060aXcIcz7op2U+KpP7PR99fjkkaXF9BSosf5+cMZPiVTVY5fXk7UMHyWxe6KA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=AkeELCE3;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7779606A32F
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 12:51:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A7779606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=AkeELCE3
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a2074a66beso5066585e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 05:51:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792673491; x=1793278291; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UC1n9q3EpmPuUpvBqt4fP3LiFXC+thJA0wBcCFtVB2o=;
        b=AkeELCE3sWsU1rOvCd4inWtQzOkmV1djxnvyC0OXF6tvKMkXf8xs1HmivsgstqroCu
         UjGYI+vQj726+wUPSYTgeqGmQ8Y7GjOfuN8JnzY2ZM5pcP/aN9AuTOZc07F+MmSgXAMq
         keMBXIb2uLAZKrOGe2iVal1dyIEbnjcaisanFDcr9zHixGnvHVQOHqD/vKCM6sdmuD53
         WeOyO0SFZxJxq7tusNLCvubWqtM40i3KhLMWcKosDZ0HnpiILDf2rXs00puYK5uMuD63
         MNF1lxFJCDnlIPAuc8eByykvb4LJ6dUtjEE1WnofRfyjVlWHj7NDHh2cMIc89+tnFCbL
         Dhkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792673491; x=1793278291;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UC1n9q3EpmPuUpvBqt4fP3LiFXC+thJA0wBcCFtVB2o=;
        b=RM8Ae4eXH2MDcxiY1QGfwXyvM3DoE3tQF/ipNiIOn4uYoXyDW8ZW+1qVs4xL3aMbqV
         iOHRtIHsB9ppK+7qt73T4BwYT5AwDFVEICAj2O+qyNF/nQRGKyptPcaMdsgyea1ASO/4
         MJWjuEabvy/O+ilFXvABtx/AK4Qb8htIbIAzGi6aFbgABZ1KF3D/UFonHx9ljkAP9NdD
         PkuhiSYeujse3chp+oAZjHcSnU3wNKzBacjnhPiTjegk234gE8Ow5Yai5ZpYeKlyRTGC
         QOiRpm0sPD5oIDuUu5jncfxh6KsSMuQuAiIE4TrEhhFuf33t+75aTqPEHFI5duPViS1P
         jpsg==
X-Forwarded-Encrypted: i=1; AKwUvByzThChHpA1DU6dYohmZrZKKjhq+tY3z/+b3DUMB4+VUlqzwFJ43WZeBkTqic7opLtOQSGB98gv4qdzGZU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJKY7TIHTz2iVExxb+TXFjKIuSs/Li3y166EFzAd0vgOqAuRvXq
	zQTa00w6vqbhkWn++b5vguCxGD40pnYR2VIprLb4mGLAy/N6oPva08qO
X-Gm-Gg: AYBFou35mjD7rPZ3P5Fgh6yC8iCcPJDZr2fVZLbze4AnJ8G87h6BEYLeSKH0d9FO1EA
	qhRcpUbs6/gp2lbdlNAY//qUDX3GWphlQuueyKl+BHpcl29XEzr56PTYov/6o0VhacAfufNGGPt
	Phq0bGNzEFgYLq2rU6EODwPKEcI4OvV7X9VKLCjbqivK8J18xrtF10l6Aj+AfqiuAR1N5t6v6js
	XqINtIyd9Rgt/PzUieWFDRz7OAu0ZOOPXdycdQMoVvr315MSGU90gA4BHxaYb/caIVtfibpJFd6
	RUnH69cP73HJSYzHUKCiqbt2KXJ0Pp477rBAUyEC0UtsdlxF4SUCkzeDdY6d/qDGRPMrG79rb+f
	lwgelZpR6nbVz4RlP1dGpKorrBGby7lk1w6ITJ972Rd7GhWIZYsbzWTjkrxAKgEzEvtnjprUxoM
	wiQTNj3jzUmyzLbACl6XLwDp8tYk5rmiEiVW4ivURuHs7MyAtg67Hn7LKpBA+Or5cOO1lyNQVwS
	ikXZN64BSXZBvdcRSaw9qflGo/bP3bZhr/20wYvtA02wtzDz9x2hCbx9Dhd6RFgj9iwgmyNZ1US
	PUlPQfQHcpIWlQejtniILboA6K9d8ugaeEHF1egpCH13y4MDDVIJ4IY=
X-Received: by 2002:a05:600c:8b6a:b0:4a1:9831:a69c with SMTP id 5b1f17b1804b1-4a1fdd3bc69mr97539725e9.30.1792673490763;
        Thu, 22 Oct 2026 05:51:30 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a203a0f243sm64112995e9.5.2026.10.22.05.51.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 05:51:30 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Date: Thu, 22 Oct 2026 14:51:06 +0200
Subject: [PATCH v2 2/5] arm64: dts: freescale: imx8mp-verdin: Add NAU8822
 Bridge Tied Load
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
Message-Id: <20261022-imx-nau8822-btl-v2-2-b4221ed43650@toradex.com>
References: <20261022-imx-nau8822-btl-v2-0-b4221ed43650@toradex.com>
In-Reply-To: <20261022-imx-nau8822-btl-v2-0-b4221ed43650@toradex.com>
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

Combine the shared NAU8822 Bridge Tied Load (BTL) overlay with the
Verdin iMX8M Plus Development Board device tree to provide a
ready-to-use DTB.

Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
 arch/arm64/boot/dts/freescale/Makefile | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index a4f26aef77fc..3821e3f16210 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -738,12 +738,15 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-mallow.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-yavia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-zinnia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dahlia.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dev-nau8822-btl.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dev.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-ivy.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-mallow.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-yavia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-zinnia.dtb
 
+imx8mp-verdin-wifi-dev-nau8822-btl-dtbs := imx8mp-verdin-wifi-dev.dtb imx-tdx-nau8822-btl.dtbo
+
 imx8mp-evk-lvds0-imx-dlvds-hdmi-channel0-dtbs += imx8mp-evk.dtb imx8mp-evk-lvds0-imx-dlvds-hdmi-channel0.dtbo
 imx8mp-evk-lvds0-imx-lvds-hdmi-dtbs += imx8mp-evk.dtb imx8mp-evk-lvds0-imx-lvds-hdmi.dtbo
 imx8mp-evk-lvds1-imx-dlvds-hdmi-channel0-dtbs += imx8mp-evk.dtb imx8mp-evk-lvds1-imx-dlvds-hdmi-channel0.dtbo

-- 
2.43.0

