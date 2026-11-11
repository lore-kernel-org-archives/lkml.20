Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794376814;
	b=c3KveJlqCxkvI1PPJxunkbTpv47MfXP6r3Maqoa8OacgzkQaWwNNh97hfJOHK1CLTisk
	 FrEzPCmls/uMEtzfFsd7m+OFSEZSGgMy2n25SX1p2+4AVfAgz9kPPwJrHdR6NQxt7IN1I
	 a+wuMndMdlEdKuoLqcO2MVrsslqLZuvtVATQLMPsvGC2XH51rydZWECBHKvhNkUQjn89h
	 nwoWufY5hAGL3fHqbJA7wjDB/FfYJrAM7lemGUdwujochViiBbSHLwvPttKVX8rC5/uQ9
	 UY4MKnhVREv9yzw04ktU6fBn6ho/CivJeKR19xiLNt78KQ3R6FzQe+vB9P0qS8ndsmA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794376814;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=htP2+aPrpKFt+HsykgI0WJWWWQvaF3s5InUokxPNh5Y=;
	b=RlnU8Fcv1n9QoWiiawkI8H5ZNurVEJYa3jOUENV5H+h3EnGk8pa9xSxHGbwQ0CNg2qFx
	 Xu+ZJddjFBsd5hBElgXOyuwf3ptZfGn0qna8yN+4UUuphaMQE0QuVguynCEE1DOSxRcFG
	 Xb/v2t7BxXf7xPPyUmCj2H2A6TWLMQCD2Qg9TmyiNpGbHWwnvf+Q8LTTfOlxQrPTNsq7/
	 zF4TEwhsuNbqe7s+vUayBYOo5B7OuTlg6tYOZ9V6jzQBmOvcTi+IxQE2WXLzPWR/8aY+i
	 l0sD//+r+Vfmx7nxznVWf9t9umHcDMH6nVyEL92dqxgtMiYKEInBC2Gk611wTtCJMRA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JmYqCVbi;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D1A960A381A;
	Wed, 11 Nov 2026 06:00:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JmYqCVbi
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794376814;
	b=lM9BZUnNJm0I78quSOO4kNoWh30hNGC3m4bm0OLw/NLf+1VAjjl00v0frfN/uNNJw1sa
	 iTiCVOfQ9uqmTQ9QimZa8SIoC5i8fsZtMwQu3E/cAwwT1R8sxApV1ZSlLngq4RhgBHtyV
	 56zVE9qx1Z6ycX0ORib8VGpO1RnJPNJQMHDly0rZs4p4jRuqM+miAkwDF90n4Tnky2YWf
	 Z3ej2j5zyEyGqm8nonvUvRf4YGgD9+mF1Lqf1ovGp4S65NAkh4mEk4x8GU6eBUDbTyyFa
	 013/2rTzDlrSsZVU/wsPq7UQyjo2GkCDt7ErXH4Sl6DLnNBo9K0ujiHpw6xECTv5aQA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794376814;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=htP2+aPrpKFt+HsykgI0WJWWWQvaF3s5InUokxPNh5Y=;
	b=T9wNHiO3IyfQCKizGl7Eee65vo894pbiuwaTEAzcecOX5oEVBUkZJEDURGudbC4vajAB
	 VXd22Psw1wyajdEBe9PhFw6vBF8vnOnMBpTesgKigb4K4on7WMTqKNTg36gMNcHLfiMxj
	 6W9p6sBYNTefeGNWSo19sPfAsXhVdYSF2uFtIDMjivghAR6RW7jeurYNWCLCmtENKZm4m
	 i9GdLRMmEY6ddW3xQPk7EDDL1YkCDOQh0RqxMYn9+lmJOMOumnNP1tzsBif0HhfPbCvlU
	 DLr1tT9HzBl32qc8GFpSQuZJ6bPgTZQ+r36xbql+4hGrfjPtu5PbXxNc5rr44ICx5cQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id BF6011F00ACD;
	Wed, 11 Nov 2026 06:00:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794376814;
	bh=htP2+aPrpKFt+HsykgI0WJWWWQvaF3s5InUokxPNh5Y=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=JmYqCVbiQdZol/lpjwrNKoEnPToOdufQ2sf/nZ1v5GAtQOxdGT9A51Mc3U1b4cReg
	 6iDrD/V6S3s22aHqyhzlBUMNe2rYnirj+fdssB0xy7jfJjMkhsRHE/jWLrpjKjbt5I
	 1huV1o+MkNrZXCejVfBacJkCIw8O88X7/2wUJ9Wm/La0MNsd1xsLWR4+Z5AFnLwr3w
	 +zArV5+rdbTiDnp1XS1zZ/aSDEHNVPv8H71A7Y8oUfqZxKZPYdCklPwHK27RTl/q3W
	 d5NUOLCYmzAS0jMUnZ+etVdD7o4WGy536OxNHsRsAH+v3y3h85lUFycSp1Q09UcDye
	 UvagQEGz6pcEg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 43BED48DF6;
	Wed, 11 Nov 2026 06:00:08 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Wed, 11 Nov 2026 06:00:14 +0000
Subject: [PATCH v2 8/8] arm64: dts: allwinner: orangepi-zero2: Add i2c
 aliases
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261111-h616-zero2-dt-v2-8-88d8030fc975@gmail.com>
References: <20261111-h616-zero2-dt-v2-0-88d8030fc975@gmail.com>
In-Reply-To: <20261111-h616-zero2-dt-v2-0-88d8030fc975@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Ryan Walklin <ryan@testtoast.com>, 
 Andre Przywara <andre.przywara@arm.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Arun Iyengar <aiyengar1990@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794376807; l=1421;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=Iab2h5Ns40ufO6oTUc6or65fgVwB87DFnCvwebhE2a0=;
 b=MuO6b/d4vcn3cxElE63zppLAfL39s+IfQeufqI3/tff3t+6PLHMGd9ZdP71jf8sy1++Avko8U
 v01poRE8azNB6n9d7zpmfRT3ttBSeyWubuohvePTfbSzwzEPsoHQxnh
X-Developer-Key: i=aiyengar1990@gmail.com; a=ed25519;
 pk=zXpRgUTrhaFe6jLyPqbBy3ccfkj04w0g2690Wv3mg+0=
X-Endpoint-Received: by B4 Relay for aiyengar1990@gmail.com/20261110 with
 auth_id=1480
X-Original-From: Arun Iyengar <aiyengar1990@gmail.com>
Reply-To: aiyengar1990@gmail.com
Content-Transfer-Encoding: 7bit

From: Arun Iyengar <aiyengar1990@gmail.com>

The I2C core numbers adapters after the "i2cN" aliases and hands out
dynamic numbers, in probe order, to adapters without one. The Orange Pi
Zero2 DT has no i2c aliases, so a TWI controller enabled by an overlay
for the header pins gets whatever number is free when it probes: TWI3
on header pins 3 and 5 does not show up as /dev/i2c-3, and the number
changes with the set of enabled buses. The vendor manual and the
vendor BSP name the buses after the controller.

Pin the numbering as the vendor BSP does: i2c0 to i2c4 are TWI0 to
TWI4, i2c5 is R_TWI. Disabled controllers get no adapter, so nothing
changes for buses that stay off.

Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
 arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts b/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts
index d5d39bac5915..98fc83291dc8 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts
@@ -12,6 +12,15 @@
 / {
 	model = "OrangePi Zero2";
 	compatible = "xunlong,orangepi-zero2", "allwinner,sun50i-h616";
+
+	aliases {
+		i2c0 = &i2c0;
+		i2c1 = &i2c1;
+		i2c2 = &i2c2;
+		i2c3 = &i2c3;
+		i2c4 = &i2c4;
+		i2c5 = &r_i2c;
+	};
 };
 
 &cpu0 {

-- 
2.55.0


