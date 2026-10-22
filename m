Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792673655;
	b=VUrfot8y+e+pvzub0zq9BwyQqI6t8nwxRHsrrbIMWdSUB2JYLDgolL40yfQdPlqhDrz+
	 4PiJspPSMYSKZplx7c2IwpZoyNhy3TGabC6Zee6MZpFLSSjgIy1fVENH2nKlS3am1wGoA
	 LhIIDhF5YiCgB4xVq6aefnDP2BbigpP5xpltpUu8x60tL1gXunb8I7hOfvFsX4dSULtVu
	 lrWU44IsxW91rFNOsv21qiOqcao1MqNgPK5tW9oQbb6amr4spgeIZqBMtV4jH5rRj+N8e
	 9+egoueotRjJnJsXNQWotwHQ7FPUWOGq3MtlNhmqHFf1bwbKZUJOA6FttD1nttloqHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792673655;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=6/5wXgO+LxtHjUK045USqfI3dlUW80LCQmKUkVA8okc=;
	b=WVH2r6Q0MAzUoBOqdce5mIzlVk92ibeuamTpifduFmOaBK1HifJ6a2SsP7GFa8F/q4dl
	 aoGhzRTx5Iwc/qPTugJE9SfOp9VKUoE5kesl+CsAYn4cPZse9uBQ2HGlIrtfFIW/jVFhZ
	 TSrfJwWrgKpcTQRNxpvuCjHkKb3o7+ETI0XRriQk5850rwYmragtq/+WCAYxi+2mB5nB2
	 DdzhQ/uiSpG+nBQtP527pX3yosIZkAqAhjILl/J35FbpSZhzqedNy0IPiE82nXu71pkNa
	 XONffcD5pWmQiUnQiX2L3j9+N7JlLqCqaQPOy4Npx8/u0B01hNB6K02DYYqNWFEGaTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=CH3f+a99;
	arc=none smtp.remote-ip=209.85.210.174
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E79F606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 12:54:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E79F606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=CH3f+a99
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-899b7b55c89so181702b3a.2
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 05:54:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792673655; x=1793278455; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6/5wXgO+LxtHjUK045USqfI3dlUW80LCQmKUkVA8okc=;
        b=CH3f+a99vQRGNJSWuTQZ9HRli7fl/lWt7DyziEvRwOOAPQuyf4hdMnL5twyXjUmVN8
         Fb8mPn7txGLWwoRXJTW5N0/MRAIJlhmskc8BTit6Hhq+sGK5X6405xdti4JyFFwQBh/r
         6ci+uaLs2ZuntK3T2yfriTzRjkrIBZUbBhyHajbhyq5/n5GlPYnjkI38yaNjF/bdc2KG
         9p2RXLMBboK2Yyprh2wl3bm5PYWYXhqfnmtIp6z9oCJCHFL101EreQ7koX9D95XrRsej
         UHXP/mBSwbUaXV61Jim/rRJg+XHV/KEI48sULW7NhWdtUmCQvrC0R+LvuqGQ7aYFLHLs
         YTWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792673655; x=1793278455;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6/5wXgO+LxtHjUK045USqfI3dlUW80LCQmKUkVA8okc=;
        b=O51g2TYenvoheNTabE/i89wUTzXsY4bswVJNLEXgAUHd6Kus/DYtYE5Z8mnzPlgpU1
         OtuzPPAj7CTUQj4nFed/AD4znVhx4iUCdiKsfOBfwFDz+bZfUOw8qtlnMXsD5nYCeReO
         FxUrCDLGX2NNb16fgvhawoiG7qxvu1kEah2io1EFYJWmxxsh3Mu3abVBb8Gwb3ImgRms
         uS2OzvYiAtzNKGC0/NYFdW3bU71GC2CQLvVllatwILyhQfdnPGJawUXnHweKktsDYSDX
         SfIwTnMIaFfvt0o4YUAzET/+NwCWC8UjMNNA1MaruHKu246OM1POHsGyVmU7o0unnWNp
         SsQA==
X-Forwarded-Encrypted: i=1; AKwUvByx/bhmy0sHuFBZxd6Rpi440cnsoCq8jLq9+nC3u7/OCHDxRE65uZBiBLTm3W9cq+oOQ15Jozk9U24tDFc=@vger.kernel.org
X-Gm-Message-State: AFq9FYK22hgmFwwF0BgVXbUBG9Nk6fmPbs6M1aBkohL1f4mIdAOG6OT9
	cLGZWoAItMnJYeGMYfRIyc5jWf3quq2smQ7PW7uZEHruh4dKQ/CGD+I2
X-Gm-Gg: AYBFou3RE+HXMxjAWeslaYXaFRKImU57CTcPxNUUFKLnlDEUevZpPfIK1LTegYtFJur
	iitkYGkhKSWY20rSkQpjb53RCJxgg54WnG2zBrDVguPN82T2wc6t6y+3E2mMV38rk7dgghWN86z
	7bMQ8SX+2o3IZ8AtyalLCYTvVY6+hSBo2trlWjEDYUHFlgGQkHOtlJ1cawOh2g0RvVVlLP8iy49
	hq79P6y5nydPcX9V8DTA9pWFt0m18coYQ6Ss28i89tJNswH5JtdQp4WbtYA9zI1tH+DvHg/zFZX
	dzbUxLX40AeqDdLZseir6U16QdfC3YlIlo9Am+bNTdJ1i/tydRgkwprp94dlZ6a5Zd/OpSraFz6
	lbHB1LA8RrPVUv5Exn/JGeOKV7J9TjvaOw/llmfXoo4t6IOK22v0hoiyrxc/rKu9m5V2ZS0u9g0
	idRphlNZr3tqaydoPX+kzreiK3FLGUf6e0Zm2/d/BUF40pQxdWDBKajZg/I5fC74RZl0XTEkMZQ
	jEuTx4C008L5fMBDJLsxpyxINu2HKxqPi/8vTFOUzfsiFtx4puL7skfHOs=
X-Received: by 2002:a17:902:c94d:b0:2df:8ab7:fe3a with SMTP id d9443c01a7336-2ea43d9222dmr65190615ad.4.1792673654906;
        Thu, 22 Oct 2026 05:54:14 -0700 (PDT)
Received: from localhost.localdomain ([240e:36d:b08:2bc0::a60])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea3b435243sm23704165ad.31.2026.10.22.05.54.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 05:54:14 -0700 (PDT)
From: Jianfeng Liu <liujianfeng1994@gmail.com>
To: linux-rockchip@lists.infradead.org
Cc: Jianfeng Liu <liujianfeng1994@gmail.com>,
	Alexey Charkov <alchark@gmail.com>,
	Chukun Pan <amadeus@jmu.edu.cn>,
	Conor Dooley <conor+dt@kernel.org>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Hrushiraj Gandhi <hrushirajg23@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michael Riesch <michael.riesch@collabora.com>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	Rob Herring <robh@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] arm64: dts: rockchip: Add ArmSoM Sige7s board
Date: Thu, 22 Oct 2026 20:52:54 +0800
Message-ID: <20261022125339.82746-4-liujianfeng1994@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261022125339.82746-1-liujianfeng1994@gmail.com>
References: <20261022125339.82746-1-liujianfeng1994@gmail.com>
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

The ArmSoM Sige7s shares its hardware design with the CoolPi 4B.

Add a board DTS that includes the shared CoolPi 4B description and
provides the ArmSoM model and board compatible. Retain coolpi,pi-4b
as a fallback compatible and register the new DTB in the Makefile.

Link: https://docs.armsom.org/armsom-sige7s

Signed-off-by: Jianfeng Liu <liujianfeng1994@gmail.com>
---

 arch/arm64/boot/dts/rockchip/Makefile                  |  1 +
 arch/arm64/boot/dts/rockchip/rk3588s-armsom-sige7s.dts | 10 ++++++++++
 2 files changed, 11 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588s-armsom-sige7s.dts

diff --git a/arch/arm64/boot/dts/rockchip/Makefile b/arch/arm64/boot/dts/rockchip/Makefile
index 442d322a20cf7..c8a5a88a0e46a 100644
--- a/arch/arm64/boot/dts/rockchip/Makefile
+++ b/arch/arm64/boot/dts/rockchip/Makefile
@@ -231,6 +231,7 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-turing-rk1.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-vicharak-axon.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-vicharak-vaaman2.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-youyeetoo-yy3588.dtb
+dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588s-armsom-sige7s.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588s-coolpi-4b.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588s-evb1-v10.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588s-gameforce-ace.dtb
diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-armsom-sige7s.dts b/arch/arm64/boot/dts/rockchip/rk3588s-armsom-sige7s.dts
new file mode 100644
index 0000000000000..f17f0d632b1d1
--- /dev/null
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-armsom-sige7s.dts
@@ -0,0 +1,10 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+
+/dts-v1/;
+
+#include "rk3588s-coolpi-4b.dtsi"
+
+/ {
+	model = "ArmSoM Sige7s";
+	compatible = "armsom,sige7s", "coolpi,pi-4b", "rockchip,rk3588s";
+};
-- 
2.47.3

