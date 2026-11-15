Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794762213;
	b=sVqsVNy14EAh+wKDs/7FVnaVustCx+a2hMc9coc8/IJ67UEdwI0Nic//uWgZo0Bfq/kD
	 PavR+puns7DN8NTbYiiSmeleYpO/ZnsKycJEZljUF0c5nZ3ap3vI1XipETwW9xjkK6Mx9
	 sQ/KpYM3QgJINZmMWGxlhWkgLnaiB+qLTQl/MIWPsD008tqKGhxFHoeRVPQ3adCzGuVJx
	 sm7kituigj3P5+p/H4gDdcojE6QInG//IWDNKx0gsKtNhXr2W9pnw/QQO/4vD5128Llwi
	 oPLZ6eRfzYncUMgKmdKPszNNcvgPRYZbVnGaNa2B29mM2Mz9Q0ayzJjXNr9dAGcq+IA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794762213;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=d/WXFyP+++CG4z1tVSrqfN8fTdb2bD0x6lw2FR6noEM=;
	b=lGejWsyXaX84Xb+D8kZvtFvGdYPcEqHWUZ1oskoZ6e+/oB5wgtcZIntmstjWSoS99TGm
	 PGaMBZ6+vx04PqmyXD7PxNIfnBKAvoEtIAX9l8c2oKE1kNPcdah3nSW+QFrSPod7NuOkY
	 cwvvhD7afsMwfrP0+AdnE4+KsWBXGhkCtzDU1eo4bQRJpMZMHQGkZi2KCOnJpPJOOyWyi
	 fs0ajEMLNZ2BA8a3oT9NehTzEyLXHcVwYV9j+ONcaLNM24nvhxPJeZ6/KzRHutcMlPewJ
	 S2U3egci06K91zJ/SH8SHezTYnZBUqIKUpT96h3iymrFnJtXc3KbDCkL7Y+NCK0TSzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oizgNY78;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65EEE606A323
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 17:03:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 65EEE606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oizgNY78
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48fd2e38825so1609584f8f.2
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 09:03:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794762212; x=1795367012; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=d/WXFyP+++CG4z1tVSrqfN8fTdb2bD0x6lw2FR6noEM=;
        b=oizgNY7878BwZm+U0h8sOob1guY49n3RVB20KSYj6dPXqJeRJhR85uClzRcy/tUzHT
         62VT5nnjIDJCzdzBXr7OSH9uW73hbIO8EVB75KACSc0LUskYIj875+ge2p9zIwv/LXjl
         ctKNiECx7OT9g3XWyAPFuqGtVHsi6l9QrPH9VzWXTWfPl82WGfbEEuuKb/26eolgztc8
         5hpmi6DWajktt/YcA404YIG407FWzsGF40yKopYuVr1GGOn0LV/YbxA9rZHdNsrrxzvW
         b88hl9z0JXGFXzzjf9zEhsfaoqsV5aBHJGMh5vuNnGh7PlLl7Qb0mgrVXuh4k/207lhW
         pR1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794762212; x=1795367012;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d/WXFyP+++CG4z1tVSrqfN8fTdb2bD0x6lw2FR6noEM=;
        b=AiQKKVUsrFga5LMkHNSrsgyjw+6UET+Yobf2nuXuDdnKP2y8BnFOz+sswDJ9IM8SXG
         IHVAAPPRsBba5LbxXCMLSiVWdtUpmEP1aE3FqLAEe2Nz9TPaCAFoaDj7wbfX9xGooyc0
         HZqiMWxsHJJ8EOHSlwZL8bFsha1+jRI1EtZKlXE4DQYOy7QqrLKqeyZkWzmIXMhVbQLo
         Xl2WaDcReqlXmLhL+2OpDXIkOb3L/ED4mT/+ASa8plz5sURTf0qiQeVIlNgD+NU2WivA
         BaTJequyKf4XgWDtuVd4cGCO8Hh6eYcvQIRIqqqHtJqRMfILQGr0hv42KwVptPY516Ia
         89Og==
X-Forwarded-Encrypted: i=1; AL+hErErzGSC8+n3+uvonYwV7DrN8kGqR4xmrABNH45mbQyvbu1iKELr0NhlEUAlkSrg3fIi/AmdVBwwzWiHgmY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/BA2uC4Gr0qzN6bMamQ6SJi81MOFXP4CS5AsdkWpfPLkqo3jB5
	FEtIIZ/P1nNXCk3G2lZj2RUelBht3zFGHclm9j3GXeLlbqUPq3Jj6rjh
X-Gm-Gg: AYBFou3S6PIrkZOjwcglR5aCPdS8JxoPjuOTYYJCoOJfw+AMOgrV77CNtCAILl/PbW0
	BLsVWrsNEuBYgMgbUDNAe8qo1BycGtIxgsEvgEo767zrJmOQ5UZEI6aR2IPghIpWoQW2ftfASg6
	/aAI80QNE17PIAOdWs4z0ADz8pbW+2KT3Z2f5sySX0kzYis6Gj1G522JuCzav5gRSnQ5W5ngp2/
	tn2HgQyBt9b5zbytHBNjwddhQXCP1eb3oRz5ROZaIsF0Ozny/TmQMuR5TxR7NJEnYPgCug6FRWo
	S2/NSucvMriTEv5H0aSWCyid+XlmE6P9iQQ0hAI+weB70+Bq4ipiIL4w0SHHHVQ9HYw8k0CDNtk
	mGhbciVNQqpFYmrxo4bJCJeFu/ZHhE60DGb083EzuGJeE11o46kWn5jxR8NkYfoZ7A1To+dsRGk
	1QhoVX/gxPkB9w35Y9IeAK0B40ouMW7GdHZTbz8KvPsX5X7VCr0T+sdFmW0Lct7hvJT5Vp5HDPW
	yRBNCIzg/JAS58T7WSGOBCX0TXaiY9Jsf7XyqNpWZX2Mqfte/Prz1Wrl9iSO7IeqNHE+exup2Rg
	Y5OYiWf1IDyM3QNaMYLkmFf7Rqn7p6sh4Osb4otbu86M0LVBxiuUE+VjWp+XrA+5SDTfcZywLHT
	OMg1QGxoHON1dzOJCY+Cx8x6CPiKNpytuMH5W4He4ewic5ykdFJpOU0ulo1vOh9jsvOoFTE+bIf
	OpvSQs+buu6iMq3Ff/ErYgRGTVopN6rw22Qd3qIjuaVGXywFI2LVh4xkd9TAPk6kDbMdlY5lu3o
	InzYqQkUuSyfn4ayGWBteC6dhavFryP6DM=
X-Received: by 2002:a05:6000:2084:b0:498:be72:6371 with SMTP id ffacd0b85a97d-49c713aa624mr18863165f8f.21.1794762211674;
        Sun, 15 Nov 2026 09:03:31 -0800 (PST)
Received: from jernej-laptop ([2a00:ee2:6a02:9300:bb69:6bcf:1b11:e85b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c77393700sm16719512f8f.18.2026.11.15.09.03.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 09:03:30 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH] arm64: dts: allwinner: h6: orangepi: Raise CPU regulator max voltage
Date: Sun, 15 Nov 2026 18:03:28 +0100
Message-ID: <20261115170328.34338-1-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.1
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

The vdd-cpu regulator on the Orange Pi One Plus and Lite2 is limited to
1.08 V, so the OPP core drops all CPU OPPs that need more. Depending on
the speed bin, that caps the CPU at 1488 or 1704 MHz instead of
1800 MHz.

The limit dates back to the initial board support and isn't a hardware
constraint. Raise it to 1.16 V, the highest voltage in the H6 CPU OPP
table, as was done on the Orange Pi 3 and Pine H64 when they gained
CPU DVFS. The actual voltage still comes from the OPP for the chip's
speed bin.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi
index a2a2e4cb0256..57b137755227 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi
@@ -207,7 +207,7 @@ reg_cldo3: cldo3 {
 			reg_dcdca: dcdca {
 				regulator-always-on;
 				regulator-min-microvolt = <810000>;
-				regulator-max-microvolt = <1080000>;
+				regulator-max-microvolt = <1160000>;
 				regulator-ramp-delay = <2500>;
 				regulator-name = "vdd-cpu";
 			};

base-commit: c3b0d2bd3ba62c39c131e80d940cabbb8441bbf2
-- 
2.43.0

