Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.6
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793561378;
	b=SSO2o4H46SGfouQFuwrTFsKAqje+l65dFvUq7q9G9SmLviwYvfeSyL/JEf9riH5KjWlJ
	 03+aDt10//NEn2fOR5WKb+wEhgTU/bwIJ6rbAsTj1Mn3QYp+2IubBHw9zsm6w+SkYm0dZ
	 V5t7M1kgguMdWsOktiG+UfmgRnAuSqTX5x51B3y28h9t/Fk/HegqJOfcFhJ/0tuRJSRPl
	 uI5ylUUaCFTfzj98iAbcAfcS76F8JM9bLRkPfCgAQPdni6vW4Qumxp7/HpD4BDmNZUvru
	 my96ZVTqkdLXZrxhnupcrOKgYv3vNyu3JxgYugJtv/GWCyK5QQhE87FxW5UF4UUhnRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793561378;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=RQgMc315r3kvQDWK2uMIX5umY8gWuldHWBME7LLziZk=;
	b=f20uqk+pwpoywIb6Gg8GPRHTuHWDFdJ3zb4+wvSJYJ+R4XL9OMnbYX5sUnQwLsnw7ieN
	 b0D9maZWAwpjn1sBOl5B/D8KGeVtmyViZ7QUxKARalo/+u6Uy+JnzsrrbDZQeYELs4wZe
	 SEWSRb+fRzDQ8kkxyPbKCsGUDBWIHdJrWcTwV/Q6zNi6HuwgG0I/rN8uagoG0/hnJYFlX
	 TPhT35pxBDTo9XBqseDv+qeHOxW1Pp3fVb9GDlr/X8CoKRoN6FHCKm3xvvTp58dX/wBcs
	 b/LDhkl963TIeWGo1l2X5i6ph/mU1f4hatDvtbqmw0K9OTAWuhI/5Q4rY6AT520gGfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qM4unuy+;
	arc=none smtp.remote-ip=74.125.229.6
Received: from mail-dy2-f6.google.com (mail-dy2-f6.google.com [74.125.229.6])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48B1A606A32D
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 19:29:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 48B1A606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qM4unuy+
Received: by mail-dy2-f6.google.com with SMTP id 5a478bee46e88-35adc681e1aso4620908eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 11:29:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793561377; x=1794166177; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RQgMc315r3kvQDWK2uMIX5umY8gWuldHWBME7LLziZk=;
        b=qM4unuy+u6DMfAn18z5l3tOEd3W59i4ICx/Nkg6fXsbLeJGUQwtHbta2kcCDw7tkX3
         sswIow9vEOoHKucQpW4oqdI54rvCC1kdoY2tK57p4MJrYAmr82B9FcXaXOh/xDj0m6Nk
         IOa2/dAm3WEpGSwRh/WxyUDpPdWtjWJVkhSnfFJed8H1AfVOKkyx/sSfoo9YkvEofA9q
         6bzKU5w/5fpgVqRgYRa7oGdC7a8Vxx6kyIncK9GSeekRRDA0YlnUTaBNB66DYl5hg5Nu
         bxWjuiz/Vska7EkbwiNX7XzHwXeh2+VTAw+rDdDZAx+rT9wt5OeKw0SEY4YpbBeGetMR
         M5/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793561377; x=1794166177;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RQgMc315r3kvQDWK2uMIX5umY8gWuldHWBME7LLziZk=;
        b=QTzsbgbHDeN0PlxAeG1zThvvB0WxuoJZXGOehZqOAZLSB3QnrEYZcGeMXkpOuZintT
         t7dsGbVI1r87A5Jm6aCybEyjgoP69WHWuZLn/mdtgvhR3B8n0J3sy6cE/Sbb2RQi/SXF
         NhPFpdw+KO4/uK4f1xXInhiehMXg+ubgl3TmLr+e8LQL+FeNcjheMcpz6cFkQyYO17T8
         PkpoYis2BamphJzMq1Mye0mx+Hdrf23ElIVe3MjpSXHCoClGJNxbqmXSAVaeE3wUiA2e
         M+sK2tazlaGcWQGiT9lyJCztuJLINzE98K9Gyc5wTX8YR8i8r1jsU1U4fCCgHW4yWSFP
         EvYA==
X-Forwarded-Encrypted: i=1; AKwUvBxkLsCjuVg9FDXJ7U96T80v/Y/2GtUw11y3G8jvxndzZpmynJiT62/3A+idvnDqxd7zhmY+vlJPXib9m0c=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ+3CJBGsjNd/dLmNWiDAjBqvNFEGEOdKXkPiakuCmz1o0/tEgv
	FPhYbz3VQwM/WjwVqjSJxpyCaliqgv+uH4bv4U2HsnXgqC9fc4OM1N+l
X-Gm-Gg: AYBFou0dKR+pBVHWwWjSfeEQagvlen7boM/B5eHPWlCKvQlS5ldFTB5b9fhGVNusHnl
	foW0oa61q5+jW+IYuLo0e1DXYhXwdElsh80Lojeywhy0UOZ4phAPcoA4sImuhD3epiWR7hVrFMU
	DiwAcY2Z0icdJBoOtI3+WcvAlBF2L97GjGSvoUWxIrbaXQ2/kCwlUZlrIO5mfjs+zfohb57wbb4
	Dg9/verr3FGBcsDqKmRw05Qq4W1ycMNATZ0AO2m6/b4meGieZkxM18mVSX5w+LQOXxnZpBlXeCh
	k3FWqzk6EBuCq8Wu/J0VM9sS74o6rf6aM6GEZmN8uqWeVcVXlbkaztc9dmchzeP6PdJCah6sJZb
	q0Hfxpo4DBIQuT3OmqyvO12oF9tEsin5XsIjXUmXuCGFfaIpYNzhH/oposGeo9fKVFjQiW8sM9R
	lx9hINEcUGLTl6F8cCCeBoHaA7LqiI7jTcizTrOHlVzkp5GNxP9gPitgW+8iBvKjnU0WEvwyEmw
	uee2Srg0CBhSXRCRG+IvkQf9WswN3XOdCsubK7QbUb/S8JLmVKD/n4eF74ptbC8qMaPLH63gqVo
	0dnD6pbPs5Mc83jDihYNAhT27ew=
X-Received: by 2002:a05:7022:b0c4:b0:1af:2ba7:e44b with SMTP id a92af1059eb24-1af2ba7e498mr7041623c88.3.1793561377291;
        Sun, 01 Nov 2026 11:29:37 -0800 (PST)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428af1dfsm31471861eec.7.2026.11.01.11.29.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 11:29:36 -0800 (PST)
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
Subject: [PATCH 1/5] arm64: dts: rockchip: fix GMAC clock parents on 9Tripod X3568 v4
Date: Mon,  2 Nov 2026 03:28:03 +0800
Message-ID: <20261101192807.897562-2-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261101192807.897562-1-coiaprant@gmail.com>
References: <20261101192807.897562-1-coiaprant@gmail.com>
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

