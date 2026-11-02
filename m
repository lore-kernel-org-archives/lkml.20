Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793641504;
	b=yMqejVFnvm8nXYm4UoK36ptfFJxDeGnPYWXVKztqli7Ex8o8BpuJaiEXjpldoT/oDJ81
	 3IEoTIT6zncwKrHIMCXhYR35YxyDanXzE2nwWXwe8HyNp+LOY9ryS/caTUAMbmfplR0r4
	 SLC0xp1pOPd4OkLzMIjTYvQ/3HETP9m8qGaIhsxXuwPPLsbU14HE4jDJYIMvuKE/UlEyt
	 8abKgfwxrdqUZ9lShVketuS0MmTv7AjpFGeK6LI4j2CBs7cT4s3hwq366iOsNpSbF5Ypy
	 Cvb1eiTjlUNbngcdbT80HF/DuvzTB5qas5K1lMIVrQGlYVJStgaoSR0uWgfQNnB+wWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793641504;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=RQgMc315r3kvQDWK2uMIX5umY8gWuldHWBME7LLziZk=;
	b=YBjXyQr6XFUf09ejQHHraaOBDFoBcY+xHXEyxPR6xXnP8OziL3XXiOynIVYs/tTG7BRH
	 gdyWsvJr7eiFkneDiUzFKa2bNm1Ks7WfM+TtNUvaSOUbCJ0E8mf54A+8z93VWNZDurSdZ
	 CGgDNUXZhrw0LuZCPEKDgo5qIhf/FrsXZQWPY0Bz3BcpWx5iCO7Uz93iuS8fIgGo42avt
	 fQPYygBuxKqb69saUn4+oGyDrDy+w8GukPLK03SQB12hKUdXF3O7YNxLKrrDcjnDCKBLi
	 VlRQsniAu/UEsRtfKV5s3hebFEUWR7EFsOk6kQ71mdClkzJvbm4hK0m1ZBJcSHWje/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Lk3eopqB;
	arc=none smtp.remote-ip=74.125.229.7
Received: from mail-dy2-f7.google.com (mail-dy2-f7.google.com [74.125.229.7])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42343606BA52
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 17:45:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42343606BA52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Lk3eopqB
Received: by mail-dy2-f7.google.com with SMTP id 5a478bee46e88-36888ae05e7so1192784eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 09:45:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793641503; x=1794246303; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RQgMc315r3kvQDWK2uMIX5umY8gWuldHWBME7LLziZk=;
        b=Lk3eopqBg28WyHFLJDTTieCw7XdETdXHvXrK89W13ut6lyiXCcbbKpMA25Zz/c4z8y
         h91UAmTUeCKpyi1VO6PDKcBO+JY6ool/cxNLOfaIS71OWo4/Y65kdRmmTPS4kVFlGzy4
         2Em5u36QKr4BSQ14zXbYQT7wK7J8BTpu45U3g8u2XsmhDNQ2eJQf6c5u7u3p+ZkLzCzE
         xsI3D/F24dulapgfOvLIh+Iv8qNgi5YOkP2/ByBL7Bc1dQNb1XJIhPK2FdsLBBx/1bSw
         DqvyAuqf10+m342t4No701ztoWQnBKcnmkknXuig+KhEoAh/5KnHntw2/JS8nVytdGUx
         6MqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793641503; x=1794246303;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RQgMc315r3kvQDWK2uMIX5umY8gWuldHWBME7LLziZk=;
        b=KdnxcPg1OGHbUXOwdx9vj+sJsv2H7J0pNgZ2zEpesRsoPOY+eRhq5M6TJ1CpY6H2xy
         3Ll3476Kwxom3i4AiOotbmO2KcAbok9QfsuKEff916FkvMc5j7h+1+qawW5obdSPFKDe
         x9e952nFJ6qUe1h9JQKtlzBI2NqrHkhkfC3n033oD+GqUkv0Yx//g328FhE6g3X5g9TB
         897fxRKX1iK/SDo4otRGVIyioqGhe0VZIroBuj30Ot/JZpL5LKaYgwBkijfHVdU5sFrf
         8e1cs7F2am9IL5gr7KsR5hIgBSh56yfpxQzmQKLzH2ED2gErooQJqOz/8oPes+Kmjv5Y
         Nleg==
X-Forwarded-Encrypted: i=1; AKwUvBzaex210TijgRBpl233xaYv4jUBI/ox+3E+MV/dGDPsZhIK3L+czVKNMn/1rtUMWuIcThqAIAQDcfOPcEU=@vger.kernel.org
X-Gm-Message-State: AFq9FYKgzak5/hav110BlrVDd7tV/+P54Q1HFl5/2k3k3pAr0X9c4ZoS
	eW73jPjE1S/PbTEPCQZOqVBme3guwNEvvzYOpPAIn38/GAQjgJ+lY4J8
X-Gm-Gg: AYBFou2g70B97qwhPN7EJQlQVhgRbwJDa9OWHZWzXmiVBVaKAPQ2qBLGFVmyXURYJXc
	6M0gDKHp5uSjKcQL5/fshgFKNZ2wEPRvisHgeAMQlWVjh0h4IT0uU+mfCq+xr7XCSsBJWIHvqvS
	ZNt897S5OvLklCTvElGY4v0yOFF3TJjUx/O7mNsvMZo7xczXMb0VJnMmIUNS9HWJX7J7dIrZn0W
	RTMc0/9VjT8chlJSHrbMQBSr4cCl1Sh15TG1NaW+VeEbjEodw4J7afMznMONuF7SK7GplVFaNr0
	F2+RUVir9VTCLTnTj3OKdoGHw/8Azz6O494/M3TK6ILUybMw8aSPq7uXZKHIKZTsLJnJ5WJSK1t
	TFguQcQ77xrj6MJPCb3JeKvPrd6q1hmWK57ZioDQdfTuxmWT5+kZndAe0lrhJjcX8H6sKqb6OWE
	5Xb3UypEHNevmc0xKFCIZdIBT78McyQu1tTn5Ox5gqdUWJh9slYm++BQLA83K+T9yX1X2AMhGUH
	n+2RnqohSRgwYcGh/x7NtHL23nlAOxQZYGq3+8gaspLWf7sTBHpO/B2ZBxw2pCP9cA4h7nA05e8
	N/snoUI8h0+zHLHickYTE7TWlvc=
X-Received: by 2002:a05:693c:88cc:10b0:369:d486:457f with SMTP id 5a478bee46e88-36a422195d3mr16266651eec.2.1793641503345;
        Mon, 02 Nov 2026 09:45:03 -0800 (PST)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42935b4asm53290803eec.16.2026.11.02.09.44.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 09:45:02 -0800 (PST)
From: Coia Prant <coiaprant@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Frank Wunderlich <frank-w@public-files.de>,
	Peter Geis <pgwipeout@gmail.com>,
	Junhao Xie <bigfoot@classfun.cn>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Coia Prant <coiaprant@gmail.com>
Subject: [PATCH v3 1/6] arm64: dts: rockchip: fix GMAC clock parents on 9Tripod X3568 v4
Date: Tue,  3 Nov 2026 01:44:45 +0800
Message-ID: <20261102174450.3000397-2-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261102174450.3000397-1-coiaprant@gmail.com>
References: <20261102174450.3000397-1-coiaprant@gmail.com>
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

Both GMAC nodes list SCLK_GMACx in assigned-clocks, but only
SCLK_GMACx_RX_TX gets a parent in assigned-clock-parents. SCLK_GMACx
therefore keeps whatever parent the bootloader or the hardware reset
left, which may or may not be the internal CLK_MACx_2TOP.

Add CLK_MACx_2TOP as the parent of SCLK_GMACx explicitly, so the GMAC
main clock always comes from the internal clock source and does not
depend on the bootloader state. The rate assignment is unchanged:
SCLK_GMACx_RX_TX stays at 0 (managed at runtime by
rk_set_clk_tx_rate()), SCLK_GMACx stays at 125 MHz.

Fixes: 156a530ed5ed ("arm64: dts: rockchip: Add devicetree for the 9Tripod X3568 v4")
Signed-off-by: Coia Prant <coiaprant@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3568-9tripod-x3568-v4.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3568-9tripod-x3568-v4.dts b/arch/arm64/boot/dts/rockchip/rk3568-9tripod-x3568-v4.dts
index 4903e32d0ead0..d94bc34a31e67 100644
--- a/arch/arm64/boot/dts/rockchip/rk3568-9tripod-x3568-v4.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3568-9tripod-x3568-v4.dts
@@ -268,7 +268,7 @@ &cpu3 {
 
 &gmac0 {
 	assigned-clocks = <&cru SCLK_GMAC0_RX_TX>, <&cru SCLK_GMAC0>;
-	assigned-clock-parents = <&cru SCLK_GMAC0_RGMII_SPEED>;
+	assigned-clock-parents = <&cru SCLK_GMAC0_RGMII_SPEED>, <&cru CLK_MAC0_2TOP>;
 	assigned-clock-rates = <0>, <125000000>;
 	clock_in_out = "output";
 	pinctrl-names = "default";
@@ -284,7 +284,7 @@ &gmac0_rgmii_clk
 
 &gmac1 {
 	assigned-clocks = <&cru SCLK_GMAC1_RX_TX>, <&cru SCLK_GMAC1>;
-	assigned-clock-parents = <&cru SCLK_GMAC1_RGMII_SPEED>;
+	assigned-clock-parents = <&cru SCLK_GMAC1_RGMII_SPEED>, <&cru CLK_MAC1_2TOP>;
 	assigned-clock-rates = <0>, <125000000>;
 	clock_in_out = "output";
 	pinctrl-names = "default";
-- 
2.47.3

