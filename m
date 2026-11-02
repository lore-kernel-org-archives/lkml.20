Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793639944;
	b=YsJmQzFXMi177EJHrKJ3miXnd9t7Fhwaj2ENcRIywAkWo1vOxatQF6wTU20iiYiNsZmo
	 J8u39vWcWSL07Ju63/oXIXFHgiYa0+i0iwAnbVDds0ycYoHAcnn5o1VonQq+KacLr5TUq
	 oQxZjyQkSqOvvZIsw/YNZaVhqjHxwgWuu6qCyoxNFzPlf2w0k3NcG5e5WCgyn2OsqBQZt
	 z8Xnr65S8R0cgFparLoz+qBmhLof+zeNr87WhaOtnHvqdT6w73iQjE3LOwVh7AwlIv4R8
	 gbskzDIvVBC767PyAEX8jVD0YLDkILomhJK57RAk0Phuu8YjJBIjnKUvQ1RhI5voKrg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793639944;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=BCkJXdrsAlr6UgG3VN+uF/+sPVvDnFNnW/1WCxoAQCA=;
	b=Ls1dy6mqFASXvwWHijM5Wc191MeP5sqY1FWq4PmV2lz2D0c/OIV1/OEJsiEZZG1eIDbR
	 8e8nA63dqg32P5jlYltIrLEUsl28dPeDDRQaHm7Ewu2WiwkpYGfs8TaU/dWObcTFUQ/PL
	 gym1d23EuTbpRhJcmMZBF32N5Pjw8P7zQNA5AczrwucG+QrKd8j/QIPrCrhTt9r+YCzAi
	 6uCr4uNiYLbfls0/qLI9/jfNcCmGP9abDnxdy0s/FDgaBlk/5s529OaAk62qZyWFmEJ1V
	 tCCIBpWSl30n+kDZSEdwdIo/61ETTehpnSxoYph/areZg708v/99IIiaciTRe7BkxPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UFbJi6I1;
	arc=none smtp.remote-ip=74.125.229.9
Received: from mail-dy2-f9.google.com (mail-dy2-f9.google.com [74.125.229.9])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2377606BA41
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 17:19:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2377606BA41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UFbJi6I1
Received: by mail-dy2-f9.google.com with SMTP id 5a478bee46e88-35fad13ca97so77489eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 09:19:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793639943; x=1794244743; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BCkJXdrsAlr6UgG3VN+uF/+sPVvDnFNnW/1WCxoAQCA=;
        b=UFbJi6I1f7yJ9oMbM/w7l7LBPGxfYK4lTp8CA6h9myt/4iu5jftwM2ST44jrU+MUP3
         AjCfTXXCfEN+LhZ8Iz4eZCAeR6Tat4LESfIt+s1ZtTYJGNLK89WZsERtlWVRSOGwNaM9
         ytW0YkYN6NhTineofT+O+L3/W3GhV7AyO2p8rKeO7h2Chf9CMYbmUcoV4a2SsPxsXdwu
         71fCITyKfPTp/j90U8SNbCf+Lp6sUCskLve7yGsyoaxoIbALbGJtQvQ7KFKdD7dr8yxE
         cV65nlLCNvWaianAfHGHIuevF64eAZ0zyuBqrNPTAuGZ2PjfYqrxF6O6yWwZncvEttIe
         9Yxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793639943; x=1794244743;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BCkJXdrsAlr6UgG3VN+uF/+sPVvDnFNnW/1WCxoAQCA=;
        b=JCuwcgR/q2+wzwR6n8c613+cw3t7TqvCAmIx3GLhRRdsi04by121fX3R/Ssg3diEwZ
         g9JEwoaIoWTrQ1L9vpa0HqNaY7hwfiy3JkIovqQG/IttZd/qfieMZxUpWZn/4xtfTjgX
         MrxvLkcKn4hpuXJOufRoBL5Qh5Z5QNXIbUnvtE3iW58C4rUXgaJc8+VKrqLFb7QrFgyC
         RB8hcEmPQPTZ3gHg6fcdzj2E+GrK54t3Cu10ZSHBTi6DlbArm+d0yhCQfUPAWBNhEPOn
         +c7Tfqql88PTA7QJm5pAfm2Ehp9U1gxROanebJOlK/Pnud+I4orN3bllt6GV9u5yCcRb
         WbxA==
X-Forwarded-Encrypted: i=1; AKwUvBwES6xxVdCxD8Cj2EomHTYoMtgyugKs+mgyPU6L6Rym7On3yVugbiZ3xbl7vKa8ZBxQrfHLPF5SKNA05t0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9oCQ4zViYbw3cpK3sBh2dfAeB51hiqDqEgAOew0KttLaQsUiyc
	QX+pMkUzh6p0ardU+9eHxiQON4j9+CRWOgXRc+FEvlncF+5TWXPr08aY
X-Gm-Gg: AYBFou1O6OlvFo6Xf5vImrHiQDJUY6Dh2CUq9Hph/mRAom7ayTo0n5DymPvCF4KRBEd
	3/lzD6qZolW2pkdi1TacKJBqbdLuAaLsQrxkFIG/fOl7wSrYsWKbSJfzrmQ8n6WDA+86NOjpVGr
	gGMbcR5ZamI5dqrg4wWRYMLIZ4Gl/iVX55BdHoDtTpE1blGbaFpWqa/zzGzSsserNJU3HEzOuNJ
	Nf5V0aSaNf6W6BfG5PgyqhQEIfcsMWVm3PYTzq9p/14+LIeT5e2/Rk9d9tbPL0NpxEl6A9X6L5X
	fXXCAlF7JeFj5yRLw6/bzWlFJ2Lrt4jLd2fP1vdM0IjLjOHJPfAZV4Huk8xp3eZgy/pmyijjTnX
	zj+wNtyToO+7BbvRRzSTssUu8jYXrtcAhBhg2HNO3PPsD7tMwSAzwnyoAa7QpEOP8e4QNefYyIG
	yv1c/NIsv52DS2b1Bodl0dk8lhNMW4WDd50Cr2cCwXdPnxws9/axgEACQxl9BMub43YrwpAeUfj
	hYOFUB/g5o+GUrShnmR0R09gvY01nlZm1jcIDkdKzrdF88jyVFkpEI2SzXV+emsCtrTeVrqPCJ6
	qcq6t5+dGmq/PcJd8mpCKPjwShg=
X-Received: by 2002:a05:693c:88c8:10b0:36a:1f:9b74 with SMTP id 5a478bee46e88-36a423bf83emr16230795eec.27.1793639942982;
        Mon, 02 Nov 2026 09:19:02 -0800 (PST)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a429467cdsm36978047eec.19.2026.11.02.09.18.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 09:19:02 -0800 (PST)
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
Subject: [PATCH v2 2/6] arm64: dts: rockchip: fix GMAC clock parents on Graperain G3568 v2
Date: Tue,  3 Nov 2026 01:18:34 +0800
Message-ID: <20261102171838.2958552-3-coiaprant@gmail.com>
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

Fixes: f296bb503a24 ("arm64: dts: rockchip: Add devicetree for the Graperain G3568 v2")
Signed-off-by: Coia Prant <coiaprant@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3568-graperain-g3568-v2.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3568-graperain-g3568-v2.dts b/arch/arm64/boot/dts/rockchip/rk3568-graperain-g3568-v2.dts
index 4c55c7d211599..07cfc68b5f91b 100644
--- a/arch/arm64/boot/dts/rockchip/rk3568-graperain-g3568-v2.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3568-graperain-g3568-v2.dts
@@ -280,7 +280,7 @@ &cpu3 {
 
 &gmac0 {
 	assigned-clocks = <&cru SCLK_GMAC0_RX_TX>, <&cru SCLK_GMAC0>;
-	assigned-clock-parents = <&cru SCLK_GMAC0_RGMII_SPEED>;
+	assigned-clock-parents = <&cru SCLK_GMAC0_RGMII_SPEED>, <&cru CLK_MAC0_2TOP>;
 	assigned-clock-rates = <0>, <125000000>;
 	clock_in_out = "output";
 	pinctrl-names = "default";
@@ -296,7 +296,7 @@ &gmac0_rgmii_clk
 
 &gmac1 {
 	assigned-clocks = <&cru SCLK_GMAC1_RX_TX>, <&cru SCLK_GMAC1>;
-	assigned-clock-parents = <&cru SCLK_GMAC1_RGMII_SPEED>;
+	assigned-clock-parents = <&cru SCLK_GMAC1_RGMII_SPEED>, <&cru CLK_MAC1_2TOP>;
 	assigned-clock-rates = <0>, <125000000>;
 	clock_in_out = "output";
 	pinctrl-names = "default";
-- 
2.47.3

