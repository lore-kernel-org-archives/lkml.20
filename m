Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.193
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793641512;
	b=GAdkLYSEKiZ3s1l3VTF8/n9BIJYWlYdsltOcXBYt4katU/u6gQp2Ac991a75qu9+8F2F
	 6oTCVemt0GbXhFloiG4Cf3VayJUrk25uJnBrbBabM/6BBna94193G3PEzuM8tAh880i2S
	 MxsjEYLk6HQMNAEbDl9pmhi1vUJ3RrkCSXYqWp4qFxuLeGWB9A7rHOD8I1Na8FwQjv4th
	 fJhvLqMxFaCl9liMMmMzHTpQbhXL9F//KxJt9N9WecCJSzMrqH90T7TFAj0URR6zQwUx0
	 lROllRHTAMBUqMqtLHb9OXotiyotjS0KqYqwzd/olKj0ysShzcUWb6I3pMDgSQ2ktkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793641512;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=1QXiP0o5CtQwTzziGzPYfpYOgoBAHOCYb3Fgk/Di0Jw=;
	b=XrVKW8sQ57AWk68aEqZSb1REoGZG1jn76pN6fVI9IIg7wTmjGjSI1p2f+hLgwVFQ2iH3
	 dphfHnJUMM4I1WjE3SA5FU4akiM1HU7YjAoBwy2Fdz0q+Xexfwt1HfEzKwon0ntOaJPsK
	 SX//4KrWOKr+1P+yYc1zc7Wm26xfpTBJBjI2RPZqR1ZVcKUEgAruUn//a0wA04omJzYwi
	 79ooLPyChHdA/KwdSOYGrdSGnMERchNF+ktef0+eE2GDny5uXsM5CrRa61yLy/d91EIh4
	 rPvGTcFDzbFK+tM9rmv4vzFj8s04yOREV08qZwZ+auOgpEt7JkCLWtCmNQ3Dno60Jmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ULpjH2UX;
	arc=none smtp.remote-ip=74.125.82.193
Received: from mail-dy1-f193.google.com (mail-dy1-f193.google.com [74.125.82.193])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A718606D812
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 17:45:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8A718606D812
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ULpjH2UX
Received: by mail-dy1-f193.google.com with SMTP id 5a478bee46e88-36a315ed211so4007695eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 09:45:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793641512; x=1794246312; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1QXiP0o5CtQwTzziGzPYfpYOgoBAHOCYb3Fgk/Di0Jw=;
        b=ULpjH2UXEcZCLVw8VO0kZhaGkiSR3Mi0zLmxONptr4D8OMolU6Ch1ofbAfXuIMp1SG
         WtI0+aLAXJU45yeUuPT312pC9G6+tb1QE9rxxUPi7zZV15dV8AI4PmvRW6T5UR3vG+0P
         EBhQGVs/4i0GCiLKpbydrPKLSH0jiTIZx/OCfVOmv+d75jwUS/0l/OViwdV7wWKL8rcB
         bQssPdQxqp+h5nyvqv+2bKsS87bQLRATI99FA45LWk7OgJHVZm3RzfB0zKJEDq5IIc7G
         UzdVKCiVoyUqtbg2MEKG9DWNWOxg7J2jll8+ldB07wK5/ui9+RSk7zSbLebL7p0Khn1c
         1U0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793641512; x=1794246312;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1QXiP0o5CtQwTzziGzPYfpYOgoBAHOCYb3Fgk/Di0Jw=;
        b=FDYjKn9YsyJhchm4ZS3+BdZ/SomgdpB1r+TjxcJDVZx+Su++YtM4TWprmBw2FDB0g6
         XxDF6ryOdHBnyNislp4224e63PYboMB0rMYxgTKEbM0KlvH215CafbDbk2lhGtJF2Rq5
         XgWhZjzM11ZEeNKzXQaSZd693iiG0EefXtx8NZjFcNO9eKCpn1ZkCELHLy2WX0PWr/GG
         MxM4Nmhl9nKPskvl7jU0+JfuduhfMxYeVfGge6rnD+eLPh7S2fG8NnidbPxY8tz0q45O
         l8wer6kbZixGUl+utABanx8v3VFYphwXfyzqxcLTP81bUozH8jEgUgCMGuAy9BhnHAmh
         UOZg==
X-Forwarded-Encrypted: i=1; AKwUvBy/C3C7j9qqpQYkcfdIsLW87xlohSMTQ2wbjadx3gvHkY7rSs5ZKPGN+pM5Xg6N33UyDPPEOd/3rQP0q+s=@vger.kernel.org
X-Gm-Message-State: APuU4Z+gXiZT9BMycPWuRW2FJz4ZZG83n2qWJ7P9n62LdVFGaXsB1jkR
	3vT5YXvn9rPMyYe+reE6FRv88uZDNcx0ka5sjD9oC80e8Ow2P8f3drL3
X-Gm-Gg: AYBFou1/ykjQs1JcdBqoTfWbjeUl5JOC4Rkhp9pCNaCQMefXeaThipDMQ/wm634ZlKY
	148jYYBcBU2nQA+e8At4weITs+DeaGoSdlU/I7rmflVPFH0+7a1ZG0TwH10ev/xsP79pG3rxFfq
	91Vo1cucuKJrIzV8OaTq6iY4284DTWPYw7CDi8PSiLDWmKndP5cvvMD+sNCSaUquzTJkRVIhBIy
	tYeSyFwO2ZQE2jaLbZifxjLK3QTkd+GohjNKO2QNkTApOIw2CYTzPjOLKF30E6Vjbs4TvmWVpuc
	t1lfLDnxLj2HXsfteMHpUmKIERg1pVuhKYxiTwJpnGnodR8x2ukq7K5RsddXA89eq/ZC/CyVHBI
	kaw2UsFibmmGXDgKA7PuhNuMgJgvrCEqNRlORjiw8EqSAQrFIBul7yefRiZZOZditFRWRhG92Ve
	ALEb8bk9ohKxSp7FtEx4dn2AVISqsgw9q00kIFW8NpgtzhAIKO8Cxe5k1DpDnxN7zoYRS3aH5nZ
	2ZjcVdS0DH4Z+5QOr+ii+IOeLd62ssFJQIkmawGB3aSNzS5uAzlC0SyEeEZn/G2SzJmU7v8hZ04
	XAbSxLWxygJGvZhn7a9fmMweg80=
X-Received: by 2002:a05:7300:cd91:b0:369:f231:b98f with SMTP id 5a478bee46e88-36a300084d3mr26330619eec.4.1793641511478;
        Mon, 02 Nov 2026 09:45:11 -0800 (PST)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42935b4asm53290803eec.16.2026.11.02.09.45.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 09:45:11 -0800 (PST)
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
Subject: [PATCH v3 3/6] arm64: dts: rockchip: fix GMAC clock setup on BPI-R2 Pro
Date: Tue,  3 Nov 2026 01:44:47 +0800
Message-ID: <20261102174450.3000397-4-coiaprant@gmail.com>
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

Both GMAC nodes rely on the internal 125 MHz GMAC main clock, but
neither pins its rate explicitly. Add assigned-clock-rates = <0>,
<125000000> so SCLK_GMACx is fixed at 125 MHz instead of whatever the
bootloader or the hardware reset left. The RGMII speed clock
(SCLK_GMACx_RX_TX) stays at 0, since it is managed at runtime by
rk_set_clk_tx_rate().

For gmac0, also switch clock_in_out from "input" to "output". The port
uses a fixed-link, and there is no external 125 MHz clock feeding the
MAC, so "input" described a clock source that is not wired up. Note
that on RK3568 clock_in_out does not change the hardware clock routing
today (rk3568_ops has no io_clksel masks), so this corrects the
description rather than the behaviour.

Fixes: f901aaadaa2a ("arm64: dts: rockchip: Add Bananapi R2 Pro")
Signed-off-by: Coia Prant <coiaprant@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3568-bpi-r2-pro.dts | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3568-bpi-r2-pro.dts b/arch/arm64/boot/dts/rockchip/rk3568-bpi-r2-pro.dts
index 4d3ebe50b90ba..677b6261a3a1e 100644
--- a/arch/arm64/boot/dts/rockchip/rk3568-bpi-r2-pro.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3568-bpi-r2-pro.dts
@@ -206,7 +206,8 @@ &combphy2 {
 &gmac0 {
 	assigned-clocks = <&cru SCLK_GMAC0_RX_TX>, <&cru SCLK_GMAC0>;
 	assigned-clock-parents = <&cru SCLK_GMAC0_RGMII_SPEED>, <&cru CLK_MAC0_2TOP>;
-	clock_in_out = "input";
+	assigned-clock-rates = <0>, <125000000>;
+	clock_in_out = "output";
 	phy-mode = "rgmii";
 	pinctrl-names = "default";
 	pinctrl-0 = <&gmac0_miim
@@ -232,6 +233,7 @@ fixed-link {
 &gmac1 {
 	assigned-clocks = <&cru SCLK_GMAC1_RX_TX>, <&cru SCLK_GMAC1>;
 	assigned-clock-parents = <&cru SCLK_GMAC1_RGMII_SPEED>, <&cru CLK_MAC1_2TOP>;
+	assigned-clock-rates = <0>, <125000000>;
 	clock_in_out = "output";
 	phy-handle = <&rgmii_phy1>;
 	phy-mode = "rgmii";
-- 
2.47.3

