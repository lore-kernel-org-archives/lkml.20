Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793262373;
	b=tnJaH7FmwbzcdcprUeJGDZe9HjyqYyIraQG4cvk6AHpsSMk/DW+YCsFqa99f4G93kc1Q
	 DN23qhsFPZ1XbcTINYpq42MSsNaA3wS4n6DitEvXSw+BUSC7HdXDylCwF2+oNcLsXuYnR
	 9VRs0UnyfwLIrmHitl2Aa56rshhEs0VNmIg0tsuCVHr5vae72O9vpl8W/BYYCmXA0t0+w
	 zoPPW8cqh4D3YjD72XC1ErwEFEwC8mnWRF0Y9H/WvYW9rsmduW06B4XQ76GTD7rW4Rrhf
	 1uKPjUTskHshzrNaTHifhpTBWWCgiy+/ctAlB4exjKhKFUReIbJijJ2ES1Ten+Ma0gw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793262373;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=UNWkw8vYb7JpYpnCN3rPDxXzy3LWTgIRTpE3bVdVYK4=;
	b=yx/U7FadE0jHxXlbWU4mzfDBs3Qmm/BHWBm+EwD35HTyYi+XnwL0WS11A4PH00qTTcyb
	 ghXXB/bFQLQ4Nzh8rNup1G6PPkDayiSG/TUp27EAUah+rpybaKs84oMlP+Gk55oprud82
	 w/Ad39wuj8uRelS1P+wnEmJPL8tqYa4RGTNNysufCp+2OF/nX3nggeRbFu8G30nAsL07x
	 0M/3ovcA3lFQWZl7fHiDvHO96wl8q/DTuMYV18PHN/p16njWP93f29w/wSp9AmwAFYZle
	 /yUAPMotxx8SJZ2K5ZiuhH8Ax1Wpb0lRAcPnN5cg1ficxInW1pJ6TQjnIt/isS8VzZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nYC+QuJl;
	arc=none smtp.remote-ip=209.85.214.170
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B4EA606A324
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 08:26:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5B4EA606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nYC+QuJl
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2e8ad5b2f61so5444755ad.2
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 01:26:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793262372; x=1793867172; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UNWkw8vYb7JpYpnCN3rPDxXzy3LWTgIRTpE3bVdVYK4=;
        b=nYC+QuJlGPWv7gHT2s17wBR0beq6hdlI3uFQngjhSzA4kUtXpyQH3H1w1LU1fjtAnd
         a7EnMLlvtgdTbH32vry4E/b1A/TjMXaV9Auxw1E/CI5SxiGYt7PW+FsvWMZ+wpnSYbXH
         sCwIFZzB0N1wOxlhcdIMCWiyHWX+hjNxql5uYxr8Tg3O+/J7wiOUsLXUdMHHMXLDiWuc
         XClWbpT3IaiUD/5WwB7xaR+Lsvcqh+NkQlkWOTO5cyFd8VuZWeylC8T6C3oV3jxs6fvK
         P5aKzPO80GvF7W+dPBVq3P15hDb4slKQQw3DPisF72vTyN6CphiRZaKN8Jo3En4kYvpf
         eRdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793262372; x=1793867172;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UNWkw8vYb7JpYpnCN3rPDxXzy3LWTgIRTpE3bVdVYK4=;
        b=nPalvtoLKAx+RLln61Qg05minK9NWsSOykJUHa0HByHegmSKVucbBfpSnuUWyshWVC
         2CwM1qfZp6f/cG8GCvtp+uklS/+r8tmRIATLrP0vTwWPIyCtRayPiwKe52RiWTOwfCr2
         lH/y4o0d82RxK84IVRkO9NUgqLeSprQ3diCl/ldu2ZeywLnDO9SVkX1UUgxx9gXVwGy2
         CThae+yt3lLSmumuaukJy4/y/0a3h1JbWeISHTqq7/cxb8idSz6UL3ue7z9ln0Ni/25X
         37fhmKCF69i91u+X3mcDxhtQPJMyF0SH/7Y0tPPykeCOVhQpZKAf9kKfNopcAot3Vlu3
         FuVQ==
X-Forwarded-Encrypted: i=1; AKwUvBzP6Nxj/O6Cglr/6rdvM0KxisdFyfVafa/x514d4IoB8ZqBY6DLOWiZ+5Pl8DTA3W7URfj1qQrYgEzqDM4=@vger.kernel.org
X-Gm-Message-State: AFq9FYI1Mte5rrLdzIDPc+Oys+HF9Lo1JQxA923i+kys72qdieaYRHVX
	BE8DJmtrkNJGRbcme/YEXzGTrAsJcIcCXjI3yOUW78Spv38o29F4BQ/k
X-Gm-Gg: AYBFou2E6EvFzK6EvKzj5ArWqRwji06wUxbhMtfu9+6fZ7BJUpCJU3a9PLpgfcFf22B
	camm0aTcKszHCvTt5sl5wt3gJNENOq1D+jhScG9se6QlGNCptLcnyo2vuSGhk7WCQBGApJ9YDxw
	tV+qoMqq95XaO1iDpiOOXw6WnLvF2VZS/yQmfNgFPNMW+6+jLCWZh/RhrXIq5YpE96Z8kMBVFT6
	Higk180DwKi4r64LHkW2539V0YjDv+2blz/Ym9Hdx4qX5EoE9vEUFHPg7wzotBo2QmTZ9B2se4Z
	UV9ZTD0nNHIktpbp6eVURFkhQ7Z960KEQj8zfEaesnFa7gDuGMryW650htBsCaoLjuv0Y+en15G
	QeE8RhlvYhZ6mTfmrnpOJvbZcysZTR31z1f9jLI7+wO/IOwkQSw9Cr8LRkYjQgzyaNa3gzdJAPh
	T+5yr47rHhR9RLx8JCMNAchAFVKaC4Q9TenV/fJPgSRNQeZIrOaEZr8jfiR6iLlNuwl/ba7X/Y0
	i1YDSVcJpg1equ0loNg8Larx8Q5oqT7oL26BuBm5qZB9n7Fj4GEjBuOxLTbfOnx7vXV3MGSVlM9
	gZLFUnSHe37bI1tteDRvjq2XmgHWsnfr
X-Received: by 2002:a17:902:f545:b0:2e9:53b1:a3c8 with SMTP id d9443c01a7336-2eaffe75f83mr68645205ad.0.1793262372227;
        Thu, 29 Oct 2026 01:26:12 -0700 (PDT)
Received: from localhost.localdomain ([240e:36d:b08:2bc0::a60])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6b7a216sm30031585ad.16.2026.10.29.01.26.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 01:26:11 -0700 (PDT)
From: Jianfeng Liu <liujianfeng1994@gmail.com>
To: linux-rockchip@lists.infradead.org
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	Jianfeng Liu <liujianfeng1994@gmail.com>,
	Alexey Charkov <alchark@gmail.com>,
	Amin Gattout <amin.gattout@gmail.com>,
	Chukun Pan <amadeus@jmu.edu.cn>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Hrushiraj Gandhi <hrushirajg23@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michael Riesch <michael.riesch@collabora.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] arm64: dts: rockchip: Add ArmSoM Sige7s board
Date: Thu, 29 Oct 2026 16:25:21 +0800
Message-ID: <20261029082541.469999-3-liujianfeng1994@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261029082541.469999-1-liujianfeng1994@gmail.com>
References: <20261029082541.469999-1-liujianfeng1994@gmail.com>
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

The ArmSoM Sige7s is a rebranded CoolPi 4B. ArmSoM purchased the original
hardware design from CoolPi and confirmed that no hardware modifications
were made for the Sige7s.

Include the CoolPi 4B DTS directly and override only model and compatible.
This preserves the Sige7s board identity without duplicating the hardware
description or changing the existing CoolPi DTS. It also preserves that
identity when a firmware-provided DTB is replaced by one shipped with the
kernel.

Add a comment explaining the relationship between the boards and register
the new DTB in the Makefile.

Link: https://docs.armsom.org/armsom-sige7s
Link: https://lore.kernel.org/r/2a1c33c9-8971-4054-a463-60f3ceddd627@cherry.de/

Signed-off-by: Jianfeng Liu <liujianfeng1994@gmail.com>
---

Changes in v2:
- Include the CoolPi DTS directly instead of extracting a common DTSI.
- Explain the board identity requirement in the commit message and DTS comment.

 arch/arm64/boot/dts/rockchip/Makefile            |  1 +
 .../boot/dts/rockchip/rk3588s-armsom-sige7s.dts  | 16 ++++++++++++++++
 2 files changed, 17 insertions(+)
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
index 0000000000000..c3282581b42d2
--- /dev/null
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-armsom-sige7s.dts
@@ -0,0 +1,16 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * The ArmSoM Sige7s is a rebranded CoolPi 4B. ArmSoM acquired the original
+ * hardware design and confirmed that it was not modified. Reuse the CoolPi
+ * 4B description while keeping the Sige7s model and compatible to identify
+ * the board under its marketed name.
+ */
+
+/dts-v1/;
+
+#include "rk3588s-coolpi-4b.dts"
+
+/ {
+	model = "ArmSoM Sige7s";
+	compatible = "armsom,sige7s", "coolpi,pi-4b", "rockchip,rk3588s";
+};
-- 
2.47.3

