Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793639940;
	b=FbeUctXsbG87cWx4mjhShjQbrbLOdm7k5DxJopzDIhLRrkDZkUQNgsiqtUO0hLKSiSBG
	 VZqD5HRtYyzL/bsRjQuQD0BF/KL+NGh5NL51A1dpFwqOlcc1fceiTaVaPZf2IXpl3grRj
	 qKAw4RW3HFzi5yQgt6OSDp4EcYKOUlrpRtp3cBpqrh5hDMf4x0NyOr6R1DIVeYjiYv1JM
	 KZ7Jam9GrwT/J4WLVNFqkVGWgRQ/B8rsVGp2sBGNYFMX/lce18FpOLe7s2bUwsECy86vW
	 y91b1z9M8qT4WxoR00ZLkFgrhetD4q529yvOfY7CBmLz61PGm1hJyu2rz9vOZ8z112g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793639940;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=RQgMc315r3kvQDWK2uMIX5umY8gWuldHWBME7LLziZk=;
	b=37UE0kJcuxfoR6x0o7Ubh4XqdYnlQFu9c7EeYh9AaCykEp8ffQxVJuqMoYRUKqzwqNy7
	 2E510j16mcqbmFUgump98ipd5B3wd3eec49ec2khjCWjhI53J7iKfp0vBlZm7FaEN/G1N
	 EEttl5XpS/Sa0ZpNQ9oPuxStzCawG+DePB4xb+XEwHWzdFk+JUlgOGaoVx6SC8+L2TwAB
	 7j0h4h+tjfWP+MmfyCi5ngRhYLM6MFMfLrSyDgOHVotcSrv4SuBB2Uls7tWL23mAQHsVs
	 vh/QRE1iRdd9UZiphHCax7wsem7aVlxKroh7w9/gvZ+e84roSg0Ekl9yVvryJRjPgmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iNl28hm4;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3747606BA41
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 17:18:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3747606BA41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iNl28hm4
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-3535a54bed9so4909293eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 09:18:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793639939; x=1794244739; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RQgMc315r3kvQDWK2uMIX5umY8gWuldHWBME7LLziZk=;
        b=iNl28hm4ffxDnz3s5nRFxbvgTbN21jy3k6JLnY522gvwo8vcbqDIMDjSIc2Dm0WAMZ
         SKQa1Fb6fJKFTNghKGZ1UvjxsbXtX6bE2Dqpq8AozK0a6//AgvNg4wKPqycqIS8Ng67+
         ZCe1f4lJy68S9NgFuZ7zg6TsAjKNvlshnhrKCZhm0ZZ7Fa9twriqcQ5FdJUc5UTEiYT1
         0Nk3i7PPsHmTsEwoPUv6/tH22VwWAtyguSQTIFqDQ4APxL0NZ42zbgKOaKArddxlY+Gv
         YhYy7jJtR4H4yTL4H0G9zcz4Yn6Isd6uRADtVyCOeyC0hxMHfrnve3oL2VMUug9PdLkI
         mf6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793639939; x=1794244739;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RQgMc315r3kvQDWK2uMIX5umY8gWuldHWBME7LLziZk=;
        b=JiI0jJGUXFHWJD0rSzJSujUqK2gQcRMfYZZ09zq3MVFTSV8BDCRRi+VwLqferepiGM
         ehvw00X0Al4UySRfNOvocmsb0pGhaeaqAY3O7oY01nEQgB3CkkDIAxpFZKkjVL24c+Jv
         K2ajPcovJGJHvlYcCNCgqCB868T4/th0sgcGer2KLspPGd5mUWTGjIllxAUKCYb20vg5
         +srewkhRRVY9iJGcEgsVTNf4UPOb3EPSLtCSkNpx6o5OSKljwX02ivhrbj+DkgD8Qj8P
         wR2nIT3n9k2Vqic0y9EV0hdFaO3uX1ts3l4HZ2I3ifnOwsd7lOS0V+oTpz9/rVyGIQIM
         VsUg==
X-Forwarded-Encrypted: i=1; AKwUvBxXiz7tttzMwR4wckTg6ikLIS/yPrZTCu2EYv+fCfvumdpQ6u3o1BOUOU2r5Tz6OjXv+TJSjPIArlzyhck=@vger.kernel.org
X-Gm-Message-State: APuU4Z+UedsGNCZ+P9Z54k6eZ3bgaGS5OrQmkN8WvVRndhK4Fbt37PHQ
	zVJoiAEVdM09Gd4fVqNnGy3q2okEGJppg63klFsFarVfEKyQcdmVxxLq
X-Gm-Gg: AYBFou3Nm/zfPov2Yw4zL5sloIHiipwSStEBB5+W8W1Z/hJji2UkCKD1ml7zXljM5SX
	YlUNrSFiqTm91ljlIcBVchcZnSMHb/MIpNIp1D8jSZIkvk6LKdxtTcK12WBtNNV9qcs501LO3P7
	Njz5xhJXaoj7JY2ZqIfeh5Nh0sFsLeE0zL3QyU+BoqWgVe/CEs+OlTy2PLEuxggyWLk5kRe91WG
	lg8JF+qgBxXu+BIV+QXAiExbZwsZ9dKeDeUAJPKC/jtdp3gi9KxqjrzYiHk639cJjxk2LIleHeV
	X64ENnwx29Q3d9nrLM99fhrXR1flswb1OHnb1p4IOI4D0bgyh9dsk0H15aYJ1aJ95cPnw8OReD/
	LMZTlo/G+gE9Y08iCyrTu/ngaNolLewXW+ePoUOM8MRpJyT26MQPJa+Gu0RUhwkoV5ag88gCvZo
	bKRFyRd9817fAWM2dBcRJRim9Ew9FX325xOVYdQtTjvmXCYHATnTe8sm0ktS99Y2xZCbE09NteC
	omTotamozEHsTGHj2fnq412wyKJ2vPB6MKh385r55O64Dq3I1+GN6xfcAYNWDPVrwjj0JGOins9
	IUnaQvaDTVqY6F+tzspGqk34CEA=
X-Received: by 2002:a05:7300:fb02:b0:358:5bc0:4f08 with SMTP id 5a478bee46e88-36a425f611cmr14286162eec.37.1793639938712;
        Mon, 02 Nov 2026 09:18:58 -0800 (PST)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a429467cdsm36978047eec.19.2026.11.02.09.18.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 09:18:58 -0800 (PST)
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
Subject: [PATCH v2 1/6] arm64: dts: rockchip: fix GMAC clock parents on 9Tripod X3568 v4
Date: Tue,  3 Nov 2026 01:18:33 +0800
Message-ID: <20261102171838.2958552-2-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261102171838.2958552-1-coiaprant@gmail.com>
References: <20261102171838.2958552-1-coiaprant@gmail.com>
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

