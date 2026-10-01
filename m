Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EA354C9DF5
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 08:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790844200; cv=none; b=NLxCPZ89XLDpICh9D7Wc+APNH92EyY4y1Q+gfjDVUoS1xGK5kxFUuyvqIcdaiD2WAr3c7rZaJUPt4NnGvqcL7NKjlEPmiUW+4Nj73FBbGUQo5kvvnmfYFLWhwt0JbgzLbGbf9JQGUcI2yeqRq1kaiwTAL8bXRVdzt0wcb9+L/wg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790844200; c=relaxed/simple;
	bh=Dx7y8RK/I3gcYSQBRPLhRiEJorSzsB0ileDu744Zw0U=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=dGnMpKzsjCQFCnGq2owmD/5JZgG/ZFUJ6RrFt2LNvK9IPj2OOI4Aw+zYQMr7cqH9Jggth6NQVc+CM3cZWpu7YhuugguDpnqzSw8SQxgnAuuB9gf0y18qtPQhIJUjfQRJ/sffbrindfJmuPbqNCFw80W/VXSk+MKMM5nH9arn8AA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oPlpWfii; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oPlpWfii"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49fe8bf173aso33054995e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 01:43:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790844195; x=1791448995; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=XKshLF9fhce9vsuhUgrP4h0h1OGaMDienEyqXvAvOQY=;
        b=oPlpWfiihWNt4nh31KX0lEh1yV0JZTGXdSRHUFDpoVRO759V70Pht10nkhY3NRsBL3
         Kx1d2W4Q5wglCgtdpRUC/dGFC1lPeBwXbrJ4EH3zlSnJxJecmJayhzO0LDYqN+E/LKVQ
         L4JFeFZdmUaWuEkI2EqnOij4QB+f7mxbuR3JrhOr3VYiDlCYvwr4yEhcb3wz69Dtw7cm
         UOz2Xmbw0IGZ/YLJqLs5LRZfxKb3KxU2rqjmvc7ZrE2Xklw5IQyQ9YBERvY1oA51yMnq
         G3evWFH/nBCWH28K/2dmBwtmG+UIs+Y/R1Fx9Z3F6FPwo96DkubvrCWgG0HdwFfoZtsY
         FiUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790844195; x=1791448995;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=XKshLF9fhce9vsuhUgrP4h0h1OGaMDienEyqXvAvOQY=;
        b=KmiAxLXihPmnUQ16hpVGG0l+wwxbMECtsphc9A1QQCc66iKA3ft6xOeJcR0Mhg1c5n
         xrONWpRcruj1qBhN+8zrmukHl944upU58g04SICDSmAS1TxTQhXpOV56u/mJsAzn4rZe
         qAnKwAFYn9ALubu+r//X4WvLG69asZFsiMCEOi5QrxzKjCZCtZerTW9Qo9+Hsux4wU/G
         kXX6zqthL9uEjKHX/5RWQpD15TqEoDQbikkolZVr3EjcSnMEDfu2vECEHlsxa6dfG5NY
         WoDcU7aSPRpVl6hKmzs8Fs4G5ltQhrKDame2j86At7VnYfoi3mNXj3gTgC1YEqBl022a
         qW+Q==
X-Forwarded-Encrypted: i=1; AKwUvBzbWx9PWsCA0v8EQJyG40nVUz4c+2ozKEDEwusVHCwfI6uOb6mQ43+u172bBP8YQ2SmkC1ZQsqrlDkmBuM=@vger.kernel.org
X-Gm-Message-State: AFuF++mRkzjDIBBvOfLk/87IDxtE9mSTU4oi88+s5RjiI2JxZ18FGZ7m
	qZvNYBlRAzX8fiFnCbQMmbDW2piaV5PWTVAKIdd5BC0A6F1TjsPG3sLf
X-Gm-Gg: AYBFou1RQlgiWZmEeYe08KI5MwF2KW7l3i8Qh7seulcMi3iqOF3Ajsrqz/gsRriobus
	0Ts5ip6lQkPp4S3l2AiElgXz6+1VHoLhKsWP7UR0MNRL4X1JzbzBXqbSIhyeABitq3699KBPtsU
	r5gCSCXiIcV4mJQ99VR0hKXCuxhUByw7YDaf/l1kQZeYsUrI+0CYouCVg3QtCWPtFgrR1RveI6O
	LofQ5QzZ/zdrPkq4GRB2YHO0/m0rt416Vc+0x6ugca+ZOGk3VAJ/4ZM8/CfeTiWXARVnub7634e
	YdmajpQcaY3G/0SYsNreuX14yYXJcslHbdF/fM4i7Ot8skNXjbVX8oDro355Mu/eigXzxb2BZZe
	M2V8uqbW3cqdVL5WR9tK/hGw35aG8YkuA2Tmj4K5sNKbZDVETKgI6yL2iZg2+ePkGXC8lXjjDht
	iodi2Uf8txqFMJok+FdGEJq3rVxjJw70mFZdOUY2YHobCgIWpKW9o1Lq/KAsDQ2RRo2aPBrE8BP
	Ye7Bxjy/lkpgS+kZIobq3si3mTHX3wHssC9FX+g5zgKTUt1TEsySwXBMnHgRQHx/AxBzgbTexSG
	N9LOm087
X-Received: by 2002:a05:600d:8499:10b0:49e:7c8c:361d with SMTP id 5b1f17b1804b1-4a01b11e692mr49639065e9.22.1790844195067;
        Thu, 01 Oct 2026 01:43:15 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a01f949709sm78177885e9.12.2026.10.01.01.43.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 01:43:14 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Subject: [PATCH 0/3] arm64: dts: freescale: Add Apalis iMX8 and Colibri
 iMX8X overlays
Date: Thu, 01 Oct 2026 10:43:09 +0200
Message-Id: <20261001-v1-apalis-colibri-imx8-dtsos-v1-0-21881dc324c1@toradex.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAB4dvmoC/x3MQQqDMBBG4avIrDsQE4y2VyldpGZsf1AjGRFBv
 LvB5QePd5BKhii9qoOybFCkuaB+VNT/w/wTRiwma6w3T2d4qzksYYRyn0Z8MxjT3nFcNSl7V6o
 2ets2kcpiyTJgv/fvz3lebxgdnG4AAAA=
To: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
X-Mailer: b4 0.13.0

This series adds device tree overlays for the Toradex Apalis iMX8 and
Colibri iMX8X SoMs, and describes the Cortex-M4 remote processor on
Colibri iMX8X.

The series adds support for:
- NAU8822 Bridge Tied Load configuration on the Apalis Evaluation
  Board V1.2
- Cortex-M4 remote processor on Colibri iMX8X
- Reserving the Colibri iMX8X Cortex-M4 UART for firmware

The remote processor is described in the SoM device tree, following
the Verdin iMX8M Mini support. It uses the same entry address, mailbox
and RPMsg memory layout as the iMX8QXP MEK.

The Makefile entries build the standalone overlays as DTBOs and add
ready-to-use composed DTBs for the Apalis iMX8QM V1.1 on Evaluation
Board V1.2 and the Colibri iMX8QXP on Evaluation Board V3.

Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
Ernest Van Hoecke (3):
      arm64: dts: freescale: imx8-apalis: Add NAU8822 Bridge Tied Load
      arm64: dts: freescale: imx8x-colibri: Add Cortex-M4 remoteproc support
      arm64: dts: freescale: imx8x-colibri: Add Cortex-M4 UART overlay

 arch/arm64/boot/dts/freescale/Makefile             | 11 +++++
 .../imx8-apalis-eval-v1.2-nau8822-btl.dtso         | 15 +++++++
 .../boot/dts/freescale/imx8x-colibri-uart-m4.dtso  | 18 +++++++++
 arch/arm64/boot/dts/freescale/imx8x-colibri.dtsi   | 47 ++++++++++++++++++++++
 4 files changed, 91 insertions(+)
---
base-commit: 39be5a7e3ecc08098c039561237499aa595700da
change-id: 20260930-v1-apalis-colibri-imx8-dtsos-632607d6275d

Best regards,
-- 
Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

