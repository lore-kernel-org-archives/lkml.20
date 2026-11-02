Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793641517;
	b=tUkLqqMbKD7q+6A+RBXZvGl3n8C2DKxrae3PbNp+/k0lEdlYk6fFQt7eyc8Rd7oEmztu
	 dg8JUBJyosyIB4jAxFxJnJnBeuxepLjvJL+G/Cv67VsONuJTHlHR0EUgaKqPWJ2ANBxPj
	 oaJq3KxYsoJuGA4AeDfA+l7I4InZ3+7K4kdYC0CN3d7ZmH32j3/+QNNVzUCtFDn76yDrS
	 qVKso55V1SHxaAp53yqDMAG1rABSodM0bFwZWAh5olyJbbiRiZrHtiH+4p+Jt4qlc/B1p
	 eDAmK2GCpA2Ao0MTNejiK/KK0tUbB/f/feEPw23pKepsI1MyXwSHrYkJixz3b83XaoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793641517;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=O6UlseroD4jG2dHId972eYhTZmtxZYuBjJ9VhYkAhAo=;
	b=AceGeS0SArReM0V86QXPhlHN6j2g/mjnU4rfF1yVIkKBUneTlzNaqsjgZdIN51sLFwjo
	 ktw78+3uPLRBIQitHJq5JSLx7Y5qrTyt446LBTutGd8OufZSiM6jCmKeRnBdItGIKJuCM
	 azdC7OOkUFxRXkkoZx9UEaBSL4ttlEpE0y3g7fRECq+T6+M6qZCRJxwcIILnHFf+63Ux1
	 byBIgeNs8ut2E/V2FTU5juH9+wWCwdW74y03WIeGhId1XjSrm9Dc3rUNwTlMuerON8pC4
	 1b+a87vPZCMFPXC+H7wgxjUTQy0RMIkofl3D1xH0AL0I8BSyeRCaFGuzXT6QAsBPgsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FcfWJZlw;
	arc=none smtp.remote-ip=74.125.229.7
Received: from mail-dy2-f7.google.com (mail-dy2-f7.google.com [74.125.229.7])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFEA6606D829
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 17:45:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CFEA6606D829
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FcfWJZlw
Received: by mail-dy2-f7.google.com with SMTP id 5a478bee46e88-33e5ae86ff2so1981386eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 09:45:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793641516; x=1794246316; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O6UlseroD4jG2dHId972eYhTZmtxZYuBjJ9VhYkAhAo=;
        b=FcfWJZlwlorXOdwsxhWcH9+liYdbhRZnfXp29VOEP3RP6t0Fmdj8AeWdxNMZc3KVy9
         Dyep5PR/joW3owgfvwUwR9tVvvVN8AKy0+UyzTOShSU7F9wn4yh666jjxzDBnoQYnGDL
         hnGCFDjyi+VLr+PzDlITWWHzV15aQtk9M07kcW5Nozj9Dn1GxcHH7UEmFGrpR4gO7Rtf
         6zFFC/KgIq7PCvcnzeI+47NPkUPslSfv553bnI+tuAPNkbinSkC/yR0/0kdF+Rsbqv6x
         10nn+IpoHCdADQE3QUIXz7DoyY5uJkS6vjs3MMt+bRpNa0r6IwlYMoyKzT2sNEyiI0RL
         gFOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793641516; x=1794246316;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=O6UlseroD4jG2dHId972eYhTZmtxZYuBjJ9VhYkAhAo=;
        b=T5/9vobpyZz2BptTUqEQ5TozBhVtejrU9yUl/BOKeshuPAoq4e+Bc29Dvb5u/NOnXc
         QveHtLsMkkdLSttIek2YZqOUin3HABzONvx+nOGSzSRWsYHsXLV0o+wh34dtf4dpKpc3
         e+GOeTlKbauipjjMEk2wThUj/oQFs6brsvWC67AtwBHsAfp0ISVR1F4/7/4tELWh7DuZ
         QLUa54O/y11Q1MODFIwxtLKSKlucMTB8+cyIRL3FvwBYbzNAJRcGP+u9YaANSEYJZnox
         CWC12w+xR851WQ9ym2n9MGdqZIJ5hnYWskfxVXGmiXFNwZzcwy+SpuMvtHjou/w72/2/
         tzaA==
X-Forwarded-Encrypted: i=1; AKwUvBwL6fjFtE4lxvHPS9hpfy9R7k0CBcpPBLouJgCRubHkESZs8vRGPjrqvBYiEBcssD8kryOmtNXCkXRR7U8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9fpDhAjg0jsHnlawtN1hW3mD39jgsIz95sMD14xH8Qo78v6JDh
	lGMstjS2IyUsKZs/Djlyh5SPadJhco+fHWPgf7wqN6pgdgD5WfZkpeTL
X-Gm-Gg: AYBFou1A3gmWYWa9A10MOdAE23dMrMwqjf8rkjWCMov75HvV1Mlmu8b5KloVKnFsp0b
	axqF3iWk0H8iT0F2FVkvmr4U/qcVb5wrX7BP9aCASD6puVhxZMfykO+gFJ9XX+DNkWKYCq2XEoF
	F42J2an2pd5ScWdqTcoC739WaBR1d1NbdDjeh/9Icsv2Jskp9YTi0pCEG4FFDwE5eLy62uVpMt4
	FtSpZ8iU96PtKOedgvZn+OQgA0InBCkl0xyYwqOsq8WV1pSNRKuKbFizeqsZsi/kSzVf8EaYzmL
	+w4ZkRGiSwY8cQDydziRxJVA7+zsIrgjQXT6bfUfXXnGek+IipjWIjXEUAM7OmxmctiaQzuhC53
	uNErvtqvgoI6gMMJleVpN5EBYSCFaAjxNFkbcb/NGuvqbujry2xYuOmUNEUnO1u2RlS7OiU3+dn
	DHgVmW+JcbzE1itVrOFtSuKXlQe+N86b+BJDxdbUajLhijND4+IXLPF8MXg/2mty8WyCSwQabPv
	CZ12AROXlMPppMKbn16jnP1CT4uhWi3LqI9429MT0OQajBQ8souetZSyggBS/SdEY2l18KSIHxk
	NoY2nSKMfzNHCSabAcMcBOgcXU0=
X-Received: by 2002:a05:693c:895c:20b0:359:ef9:9be3 with SMTP id 5a478bee46e88-36a4236a466mr15885436eec.11.1793641515587;
        Mon, 02 Nov 2026 09:45:15 -0800 (PST)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42935b4asm53290803eec.16.2026.11.02.09.45.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 09:45:15 -0800 (PST)
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
Subject: [PATCH v3 4/6] arm64: dts: rockchip: fix GMAC clock parent on Photonicat
Date: Tue,  3 Nov 2026 01:44:48 +0800
Message-ID: <20261102174450.3000397-5-coiaprant@gmail.com>
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

The RGMII WAN port on the Ariaboard Photonicat uses SCLK_GMAC1 as the
GMAC main clock and SCLK_GMAC1_RX_TX as the RGMII speed clock. Only the
parent of SCLK_GMAC1_RX_TX is set, so SCLK_GMAC1 keeps whatever parent
the bootloader or the hardware reset left.

Set the parent of SCLK_GMAC1 to CLK_MAC1_2TOP explicitly, so the GMAC
main clock always uses the internal source and does not depend on the
bootloader state. The rate assignment is unchanged: SCLK_GMAC1_RX_TX
keeps its rate unset, SCLK_GMAC1 stays at 125 MHz.

Fixes: ba124e06ce7b ("arm64: dts: rockchip: add dts for Ariaboard Photonicat RK3568")
Signed-off-by: Coia Prant <coiaprant@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3568-photonicat.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3568-photonicat.dts b/arch/arm64/boot/dts/rockchip/rk3568-photonicat.dts
index b719d5b661c43..7e0a2ab829209 100644
--- a/arch/arm64/boot/dts/rockchip/rk3568-photonicat.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3568-photonicat.dts
@@ -285,7 +285,7 @@ &gmac0 {
 /* Motorcomm YT8521SC WAN port */
 &gmac1 {
 	assigned-clocks = <&cru SCLK_GMAC1_RX_TX>, <&cru SCLK_GMAC1>;
-	assigned-clock-parents = <&cru SCLK_GMAC1_RGMII_SPEED>;
+	assigned-clock-parents = <&cru SCLK_GMAC1_RGMII_SPEED>, <&cru CLK_MAC1_2TOP>;
 	assigned-clock-rates = <0>, <125000000>;
 	clock_in_out = "output";
 	phy-handle = <&rgmii_phy>;
-- 
2.47.3

