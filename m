Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793639953;
	b=p5+UrFOatP5Rryl0roPD+vs5zKEiey0Y8D0uT7+145wCc9pKI9K7+HIh2UwTWFgARHJp
	 9EZlsbY6ExNpR8GrT5N6gEe7EVehN858dNNSX+HKqPKRYrqJ7tFmkwEkUBS/hsveAt24j
	 pBla1Qv9pE9gVSUcJ7zBdn3S+nKmXu9KxSdAvORLVdFhDdJddCoJsrPC9hY6ZYFEgO+th
	 9qmWynL95Ixetwx4vT0iF0v0GC5aWrTJhs5ea9jdam8ibYNVspJvx4giHv06WgL2r9jDE
	 TnzBKicetwpdRPe+x08/iBll5BOs5wLQO+b0uTsqFm6M48wIXeoQv6ZYtwDZs6bZD5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793639953;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=O6UlseroD4jG2dHId972eYhTZmtxZYuBjJ9VhYkAhAo=;
	b=ez/L1JJPnZNwbpABF2p8Krriyja8rffTDxW+aWUiM1epOHe91q1MNtTEe+6Z9F04s1nP
	 wuFEifc6tHjluqLTqZRgHOmlRcPK94oRqBWcNO8J46Ho00/ghLfZzp+xNBR26mMTW0Ni3
	 Ko4Ihi2Ba8WSi/T+oy8YHuis3Uf5ry1bXy4soEcqeR8eIhwIKqD4FH7p/8ZhnPfoFsGwk
	 hFJNtvdFNlrB9cax5nuTIZmcon3o66Tkpd4VAOhmicB3mrx/1N05Hn4h8EqyKNqfmioNw
	 cXNb+zaLufKdUmByQrxlgm6Sq3DkUN2Oj3H1q60QtulHOw8iY/Jh4zRvgmjwO5Icf5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="wqJh3z/e";
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBF11608760A
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 17:19:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EBF11608760A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wqJh3z/e
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso1986259eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 09:19:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793639952; x=1794244752; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O6UlseroD4jG2dHId972eYhTZmtxZYuBjJ9VhYkAhAo=;
        b=wqJh3z/exiU3Y/hR6t0pi660C6t5oEFAT2H80uPgrLHfpVmDceZ4RcvgrhR4eRtBOU
         c2c0u+iaiefkPR94sRsesg0ZztBXi8QWAxJ1H6XL6JJ+3Nwc3fj4MEVbyM3v4so1B23b
         FTNXXmGC8pUwyrKTHoXmAMUN3QQ3Y48RR/wy+BQStzOCk0gdAPKUOotgN8tFrJAzcRHh
         cvdzYG0/TXBoVoRiT3R+thLQRCtyw08cl0IdUzC/+622TiZUHYvrzVucA4F3rN1cIYgq
         M9a4RrhvaNeXV/7yeaBtAX3obkIE7LZqk9osUiuG8dNf3MtgE3rhLgLn4oqo3LQdJKyo
         0dZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793639952; x=1794244752;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=O6UlseroD4jG2dHId972eYhTZmtxZYuBjJ9VhYkAhAo=;
        b=oPPCfxVaszLNlwgAg7PLL+TD3eseYqCHanP+HRqudVMiQzru3xgAE7yJXGQCdLrFbX
         koQ3/So+LakagVWDr+MOHMJQeDH+DsANPNCr97SBlz4oxRx9AN7fMFADAslepTSMVfb8
         GeGAJUBUtjEwiyS/i4QmKSYYTdeG5XcIZIzuaKCGXUycuHzc+JbZ5KVNMHO/wQnwMNIc
         iUfE6QW4LKB+X5PBiE6Co7ClngHVB3xI1LfwYi0WObATuLkB735dTyDyS2ZKhX69EwfF
         DGT7YIqoKa0yvupDlWiefg2jlm8F0RxCGxqTvewjUdc3KWtasTPPcUs0bcmUczGxVP0L
         h/Hw==
X-Forwarded-Encrypted: i=1; AKwUvBw2bzt5ddS7MrSV4AOCZVDZfwpeoAyi5BAEA4WL6cIHM3BnEP3srUmLhnsd07d2Fs+y6CDgLV7UgY2mQzI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8NGZdYN+iJluLHlVPo0nBX8K0gGIt1g8iaMeehJW47r986btvx
	7Q264XQITanvoNDCcUyaAJK2cKzIUqMRzsBD8SrpwjhILLxk29/uXgco
X-Gm-Gg: AYBFou0ldknrSQU9KpMAUQ9Ux+b3stN4Dko4SqHRAf9DST/KcPQawMkGcbMIdQGDTmm
	DCzPP7cR8hP8vAAApEAvCfPx5JDMKdBYUwUFfDw4HKiT4c37jZO4cCNcRMHmHahhdetSa66dM8c
	tRsC3N/RGnxcNpEQgw7VYkj0u/GtKgdRdnaKjcu6MfyZTSTKyZUgmOzlUkRVtDVnMibwsJABpkl
	tqj0eKgPKeFqZYwZwLXah6xxPguiuwiu79auEI6gOZgsOXY6YW6AGb9o8Z78E4CvpDhXxb2Djda
	wkBpLCSV6SL5rUx9SAJb1iA4dbUZqLdwA8kuy8lpqk0Vqnf0VsjjTgWOBpIkVBgEe6QvWpEvXZi
	CAHyexm8KnitZeLMyiYAXmL2aB+OxrZHwu2Nihe/DiqDAVy5YBoQ1y7w2su7afyFxZtmmDjGzec
	KLpIBZjUrXziPv8V8XgJCpuhl1DdqNpA1gXmIIUPA9ayO6x+x1yoiomy4EAYmhvdtFi0PzETue9
	UFuXrwVBVWKy70r1AzYn2Ml/Er7GkaNhTN0U7G+N1fDp5oltwqxrCuweUSqW4QzXLVY6a9lHU5B
	3rDVtS++ame586Uoy/g0RpV4Itk=
X-Received: by 2002:a05:7300:4717:b0:360:5f7e:2eb9 with SMTP id 5a478bee46e88-36a423f4253mr16154942eec.32.1793639952051;
        Mon, 02 Nov 2026 09:19:12 -0800 (PST)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a429467cdsm36978047eec.19.2026.11.02.09.19.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 09:19:11 -0800 (PST)
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
Subject: [PATCH v2 4/6] arm64: dts: rockchip: fix GMAC clock parent on Photonicat
Date: Tue,  3 Nov 2026 01:18:36 +0800
Message-ID: <20261102171838.2958552-5-coiaprant@gmail.com>
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

