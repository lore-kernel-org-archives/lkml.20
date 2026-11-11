Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794399306;
	b=Bo/z7SL2PhuhixfWjigUxLr1Ltu/dWm+7HZJD06SjG9sSQu/AUEh3SrzQq+2Jzx0OoaR
	 mx8PjPj3JMZXao3ykXiCm9T3gjCs2zEElchylNgPmOeui2WhtYzdskSaHxfoetG+JX9oV
	 vfDTdwufofTnnO/YQ5FCKYf0Gppt5eO+FsRyjT7hPoBfoNfCxQMzsEhNVbBLg97PQfyeP
	 ih8hKl6cEXYEKsp23B5TVYK6JB46395k+MyhGsCzo2RMl/pJWVflfWwlfeqOSwT39hSYH
	 acmYPbAiGXImgRo1EoBcUT9cYXzA2ydZ1x8J3yMZ9hKqiMmfHzEU82uSsgvLjJAa9fg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794399306;
	h=Received:DKIM-Signature:Received:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 X-Mailer:Content-Type:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=IkV87vPxNc1lgky1u5D0+AymN/pbZwvO+hBfvN04Pvg=;
	b=jEC08HnllWBCH2oFpmQt7UdO0OtgLMfGdkrLtNDLYraUUPJfPGcF15Hykfo7okNfGMrG
	 JLBAp3yWRI/wq5mHQv2iByVeF5j3C0ptKtpsRN64AcZfGbudd0+mr9ROVUHRuKC0VLlt4
	 8QtWg7v+kL6NuchzEV4uD3Z8IEVCia+O7AlFpafiuNCG3UJ+Cz9S1TdbVV2mvKN2KNTm7
	 cWtht0cufVrqV0FvUUVVnujOZ/uURJbVbgWALgbdzQU8Q8acAcVeBsfVgIUIVYeaRnYHR
	 oylcr2YqGYMUe8OoIxQsVh9Rp2PnIlJGrBb+T/Q4agNP9pICrq9c99yjFog8g4IpYwQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mbST1Coy;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FF9B60A261E;
	Wed, 11 Nov 2026 12:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mbST1Coy
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794399306;
	b=EkDoQJ11VksYqvqP5Q+83sAxwSIxttKcMN+L71XKyMlRsVqfpLDXEEu5V9cAGPHyxFzV
	 2GQQg5p6imH3PiK3PCrrtfruDR7fgTMhSXaJI448rREwc/BuJbfeiLimJ0ls1QYAw59k5
	 CpskZo9IXf+1s9xlHALS7a6VDh2lbcbjc4Rh2sN3bOeK/QFAwfZ2uV14pBzMM2ECRD6c1
	 IjjFsI28sQ3izFzuIO1oOB0qQgHJknD6fW+gxMvoEFAo9NXJiqMCMBr6Ca/iVPi1GqPat
	 Tez8XNg6LZe0rfb0j72SkWjVzHKhmZSp3qgZVS6TxiZpwI+Ksa7Pl46JJltk+/z2hMA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794399306;
	h=DKIM-Signature:Received:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 X-Mailer:Content-Type:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=IkV87vPxNc1lgky1u5D0+AymN/pbZwvO+hBfvN04Pvg=;
	b=exA3Vzs0VE/XKArjU53gQVGjfUNXM6E4FtATbyC3uuPg2Xj2yiA+p4rYiSCVaeZAlnCG
	 eNiaw0wQ6P5eW+KPeE3Q6A/bEwLZq0zA3Gm/d+TBgUNc96ucGoqE98D1lK4sg2HdmdFWg
	 SAIyfdgog99qKr5Z3rtO3IhpzPoQvWgMMLHafwo22tALkSfBsXmp4d38Cuhx82gFk29MR
	 Ze6tE6GeLyY8K/4+qLUTh6I/HJGHpWtc7al2eNpbCxZUWZ2JrM/IroJgOxceb8u4b+B+N
	 GJmhpeE+h8kN/yDaXITwRTWb4WCBqn0Rczp0hpTWHBY7nJ45HHok3xtKaVh+hncH5sA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 298CC1F00A06;
	Wed, 11 Nov 2026 12:15:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794399305;
	bh=IkV87vPxNc1lgky1u5D0+AymN/pbZwvO+hBfvN04Pvg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:Reply-To;
	b=mbST1CoycDwvjHF7e7aIDZQnBklcqUx//NUSY1WvLP52K6KhkoOcK4umE2T0ugSq7
	 wvHOHN+LKSmGSy6zDN1PQ5bS3JZPHgtXvEF/g+zZxZ9SpNBbNXb2eGxgnw+mLH1nrn
	 RgdNP19ip4KrPZDQfrTzgogAS4cWoShWLHNpwZuInK0lfskO6t7jEEgUKkQXVDlF99
	 GmbUsLHd/Qc2X6NAJf3dg/wWd2Ba0n5EOw16fwVp62/znu6fV6E634zxOwqeDJWDv+
	 36+QXw7YzefTOKo6QPvb1Fwt5aMyqLdo3zi7sOfLYhGyubhaSgwZNMeyHjRVTsU8bZ
	 AH4raLsN2iDEQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 9EF3848F60;
	Wed, 11 Nov 2026 12:15:03 +0000 (UTC)
From: Mizuno Miotsuki via B4 Relay <devnull+founder.crepuse.com@kernel.org>
To: heiko@sntech.de
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, krzk+dt@kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, robh@kernel.org
Subject: [PATCH v2 RESEND 1/1] arm64: dts: rockchip: Enable I2C2 on
 UNIHIKER M10 V1.2
Date: Wed, 11 Nov 2026 12:14:34 +0000
Message-ID: <179439927406.86676.11920437995901310527.i2c2-v2-resend-1@crepuse.com>
In-Reply-To: <179439927405.86676.18160135777424812496.i2c2-v2-resend-0@crepuse.com>
References: <179439927405.86676.18160135777424812496.i2c2-v2-resend-0@crepuse.com>
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
X-Mailer: b4 0.16.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=openpgp-sha256; l=1123;
 i=founder@crepuse.com; s=20261012; h=from:subject:message-id;
 bh=ZUtHtXwG3cfnbIn8yg59s0s/+r9OqLaGzwAjtw4eQks=;
 b=owGbwMvMwCUmds2G2fVJ/hLG02pJDFlfYrQ0J3SINtxUleIvMLlUMEeUafGP0Brbf5UrTitVT
 L1jcuh5xwQWBjEuBksxRZbZouzlh5pXXJs7ockOZg4rE8gQaZEGBiBgYeDLTcwrNdIx0jPVNtQz
 NNIx0DFm4OIUgKm242X4sZqvb7HRJqZmXcmA3ht7wiIfVmpIq+V+T85f9veLQ/I7hj+cLavPzN7
 KURlzuLPiYqypb5faB12+7vCOAy1XV189sYIdAA==
X-Developer-Key: i=founder@crepuse.com; a=openpgp;
 fpr=9B150777C283A8D69D90823E16D63C0345E46FA4
X-Endpoint-Received: by B4 Relay for founder@crepuse.com/20261012 with
 auth_id=1166
X-Original-From: Mizuno Miotsuki <founder@crepuse.com>
Reply-To: founder@crepuse.com

From: Mizuno Miotsuki <founder@crepuse.com>

The onboard resistive touchscreen controller is connected to I2C2.
Enable the controller at the tested 400 kHz bus frequency. Its GPIO2_A2
and GPIO2_A3 pinmux is provided by rk3308.dtsi.

Keep the bus enablement separate from the touchscreen device node so
it can be reviewed without depending on the pending NS2009 binding
and driver. The controller-only configuration was booted on M10 V1.2
with no NS2009 device instantiated.

Signed-off-by: Mizuno Miotsuki <founder@crepuse.com>
---
 arch/arm64/boot/dts/rockchip/rk3308-unihiker-m10-v1.2.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3308-unihiker-m10-v1.2.dts b/arch/arm64/boot/dts/rockchip/rk3308-unihiker-m10-v1.2.dts
index 270ea970c95a..0c03f118378a 100644
--- a/arch/arm64/boot/dts/rockchip/rk3308-unihiker-m10-v1.2.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3308-unihiker-m10-v1.2.dts
@@ -131,6 +131,11 @@ &emmc {
 	status = "okay";
 };
 
+&i2c2 {
+	clock-frequency = <400000>;
+	status = "okay";
+};
+
 &io_domains {
 	vccio0-supply = <&vcc_io>;
 	vccio1-supply = <&vcc_io>;
-- 
2.56.0


