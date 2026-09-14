Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D625470E85
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789390412; cv=none; b=EE7RHZVxv1MioK//Dg0bl4IKZ3gDALfq5dWjle3a1j2w/mryNiDmqQ8kzhyv6FrFMbgnDpV7Kht2UNqXxMnv8zMdlY31fHgF8aI/d5IInXFXOZ89Ollaw5tVSKmsRyxOklWVhpSBUDLZ1i1c39Lcg3vg9SsMDgxJGt5bBu14jkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789390412; c=relaxed/simple;
	bh=9MU3GlGUB1OPK/XpXe4SqAgEDW6zxQdlcL04VkOQLyg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PQLSuV7NCmO6eco8d+xV4lPN5m0T9T4Dg8yw6eCFbMf1X+v814lnnYB/s5DKlMA4oN2Uody57lgMzwDlFDEUifQTfIery5gse9EQvDwd8lDWisNGKUZ+bA9cymMwkMgA8kf+ohjeR6R0Kx7Ssm9jukR/COjD9+RMFgpJ3aWx9gw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E2YYoThV; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E2YYoThV"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e71cdb22bso11148415e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 05:53:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789390408; x=1789995208; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=A3kON4+baHQ2AT9bdbK8IFIq5pzfZyIIzNPdnsQweAI=;
        b=E2YYoThVHapCK8qtFsBg/sfmGrjkk2YeXPVNr/8A9P6LTdg80I84CuHlttgoVx4VH6
         mDuxnQdf4nAyafR1x6cbN98nSFWwA4+nD9OFQP3T1PsvFGV5ruxBz2lQcn2uUSpaulpL
         z9Aw06Lp0jCfN278+G9XJuN1K2buU/Q8km2FwIqenveDyjdzRGamHkaM+a336TOCKzRD
         DcJBAsQVkv9lSrbLxgs/o0her5FaZYdL8YWznX0DDt0MYvfg+m2sScfkDOYWyUVZr2Ef
         8xqYllWr22mCzuGYkQYzsrp/4/O8l2DUaxOA4TnZiFeJlm3RPsigTG74m3YSkt6TfGJE
         Blsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789390408; x=1789995208;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A3kON4+baHQ2AT9bdbK8IFIq5pzfZyIIzNPdnsQweAI=;
        b=KkNQvBOj+0hg7vDpq/+1+kjv3JVLKXu0rlwkCx14CfzgTNh/G9bLJMxwH7q6bQEu+z
         BYEmkPeo3ZWilgZp1ip4AUeYaExubGzdVk3XW0FxgT2O6s2VEpPTM3mRjYYG6nIDfSDH
         GSnjeqHZ9hKbmM574zPAWFaklTG/y0C96PuEJFYbtxE+Or+WEWo9UZGjIyzyxd8NFINK
         KJpSE+Cu8EG0I34wT8HqToWSUsvbiCz9eXgVz7DYGeZNLs7FwVKEX36v7uT2gyLuZO9e
         UTh6tDrX5WZH/POq7WeWyEX6+kmaaytFusbdS3IwOXAonl79Du1sJC7JM4LjMx4euOkz
         VklA==
X-Gm-Message-State: AFuF++mFXOVvUThq21UKj5ul1837Z5IHA2Q3nuAb5aucXAX+9nYQ7i8U
	dkR0dPcGNwn+xfrHbVnfCp+wQma6TBJTREqc3fqis9AO5pvsmE0xSIV8jTD2cCxCxEFSiA==
X-Gm-Gg: AYBFou39c9ZxP3FBFN0YjomUDLIX5dJgOhVJs1DQs2OgJ6hTeWF+TTfbTT/YVdOhuGd
	Tn8odR1BKV5CSQiGpB33h6Brvtmw6qMWUafTSebdMNhpmf++1vcxs8xlE9CvPWMpnAI6pSYXexB
	lmmEN3mIJSwIbkvmIW0nCc4PHAbYrNxvXHgs5RuHK2Df4poR8+X61I9ADOtx2afpCv9M2cDIjg5
	Bc1yCNLyTu0Jwv/0H3Q3yBoh540yepnu74yq57HW3iAb2so5Qjd0yYE1WERTl5amqm6ZQR4cVKs
	zh4+GLgc8Nc5+CwJdjmYLeDUzJpkz2j/+XFcwcQaiH0qWRK7Jr5V5uPLbL/zoAo4FI955NXMOFE
	eH4IhGPefIk2ySWW0IgqZceqg6kJRo+E1OraG34SVpVquec9kgfoammLMCXuNDxuhCF94jF9I4B
	MSnJNYRYfl/tHpuim6ezc55pfyA7+/a+QBf2y3xFeR951JtfLafuLaC+JiqfUxDLML8lDyypvXe
	Wh0qnyCPlqXmoIE2D/uqEQqFT8oX7k2+FgchIyfNrkALWxN8gg+HgB49s59ZgTI79Iw4n089z3Q
	WooKvhv+GyxQdFbY
X-Received: by 2002:a05:600c:4693:b0:49c:fa20:cbfc with SMTP id 5b1f17b1804b1-49e7a66b714mr30526925e9.19.1789390408188;
        Mon, 14 Sep 2026 05:53:28 -0700 (PDT)
Received: from GLaDOS.station ([187.14.102.91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e60acff8bsm320954365e9.9.2026.09.14.05.53.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 05:53:27 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Natasha Kovalenko <natasha.k@variscite.com>
Subject: [PATCH v1 1/1] arm64: dts: imx95-var-dart-sonata: correct UART8 header pins
Date: Mon, 14 Sep 2026 14:53:11 +0200
Message-ID: <20260914125311.8354-1-stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Correct the UART8 header reference from J12 to J6 on the DART-MX95
Sonata carrier board.

This is a documentation-only fix and does not change the hardware
configuration.

Co-developed-by: Natasha Kovalenko <natasha.k@variscite.com>
Signed-off-by: Natasha Kovalenko <natasha.k@variscite.com>
Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 arch/arm64/boot/dts/freescale/imx95-var-dart-sonata.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx95-var-dart-sonata.dts b/arch/arm64/boot/dts/freescale/imx95-var-dart-sonata.dts
index 3479abc25df2..9344a0d99418 100644
--- a/arch/arm64/boot/dts/freescale/imx95-var-dart-sonata.dts
+++ b/arch/arm64/boot/dts/freescale/imx95-var-dart-sonata.dts
@@ -336,7 +336,7 @@ &lpuart1 {
 	status = "okay";
 };
 
-/* Header (J12.4, J12.6) */
+/* Header (J6.4, J6.6) */
 &lpuart8 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_uart8>;
-- 
2.47.3

