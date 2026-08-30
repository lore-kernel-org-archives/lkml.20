Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1851C3BE163
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 18:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788114049; cv=none; b=RQgZnGJ4NWTaNuF7xyJUoHbADhZo8cVAIKZqwASyWgQY4aih+qj5rAfHNN3UCdnCef2Ydp6XyrguOJrGkXZ9Ttv8Wxq6Yfk9MKTmUutP3OJa6uz/9+opN9PlSVswKdws9Vkegayhw0EYXfU5dptD61Hce3ZQf1C0KUUMqAdYb9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788114049; c=relaxed/simple;
	bh=u1TIZt+CHOCWQOH9BZ/QQLKHjmLWjHuJGP5POnmAlzA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YxpLwtwn574H+FCqUhg0rMoTw9tEtvlVhDasLAApRp58RH93jG/JO5iYiVhVHWm0nH4577sYvIFFP9nB/bV3ingyqMIVvU/YCSrGTLT998YHBX29XIhBHq+uOtCKFGFtJ1Lz3KWXBBW8iqTLssAKgwoCSNlBipMpdNbRKTp1XDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=drhh4W3T; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="drhh4W3T"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-cc1cc97b84bso2344210a12.1
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 11:20:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788114047; x=1788718847; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4Z/BxeJ8T4MCVt5zsyL/JPI0APYo+zl6RdZeA6DakAU=;
        b=drhh4W3TVrk21h7U2VRLEBGYDnOo4WVmMpOBDkhSIKN36qhtFdf0ePF48lec1pbTe0
         KU2Zwhk+oyppaQKlM7SdgqH01oPtmHAo3Zo/oNkn2oNWe+XOrk3NCfbgHGrP1nNM03De
         mPY5QWNRCuAE+hpO9tANsVf9wswsmFadbseXBtH589Iq8Vn7Ax8jc5dc0oRHTFyTlGnD
         uicurQmiLzQwkd1QzuOiSV9DoiDMAdIf+x/vbpGVVOfSuQBfS7trOU4VX7IsnFZwdDLj
         3rhx/P53hn/Kcm1wUCsdWPboKdJUPTg4Bys9gkc4aoFVqeFGNeCB3+Zqe51UeMyAW2ek
         gBcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788114047; x=1788718847;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4Z/BxeJ8T4MCVt5zsyL/JPI0APYo+zl6RdZeA6DakAU=;
        b=Pb+UrGOwMj69zzi9Hw39bXNri5tVfSGpUaTNBFnwD3xMjmS6VKSLWaXX6aXfcjKASi
         LqRsNR+Tx7vjx4jR1bRtYmd9Tm5hRBrkOQ5S5dd/Um8OmYSH6nwhh4cqHhdJZkbpB5pv
         Ep7sOCO0U7i5XkFinQaYHLqbSaco0UVU7XRC4Km+lnjTA0wQzaXcNeDmdZxvTkGg0LmS
         AhSLsbNHFFaTJ9fPzm7fedKIW9NnlCtOVWWb+UqkYPdd7KslHlZ3crjDZP9QBxQtTcoj
         yxey1gX2Xv1aUVzzLKG/uy5Rq67EJIGS7B3KapPqgKkMYDZl+viBq4igCpfTzHKcYVKD
         iGIQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr9x1vf8uOtsS+O9iBYL2IhNubfND+jWooLus0ZcyfsN6DHpiVGqXxqmhtvwsqLFjjBAe/wVvbLI3a1/pA=@vger.kernel.org
X-Gm-Message-State: AFuF++nlDRsNAGwtm+PZatkfiEWMIz52RnpMCIUI34oEtK++K5Uh7duU
	ngjRDC2x+c7aCMmCla6UDDidQ0zYK8nxbAw74ZiiflSNjxp3uthwGOGe
X-Gm-Gg: AR+sD100OytElU5Uh2LmNwFf+e/N7+WnN1ExRfC7J2mPJXXBLCeGLl58tO8MMPfaBcM
	+W30YJF1P1isq4sygPntbT/IMlc682MMOz5WQlJhaOli8MM+v7qxshY+cQ5cO7Ep0hdS06Tdqxg
	fKBq1vbsWzUktU4LdecVpJc/jyb0B83fzumtKqHssPqBMlmQxeJyvz2k80eJmRI6K5lcCeZa+p5
	OdhMaOeOtJfmq6mtseBEibgQg/6QwcTygKK/qLZLQn/TdxS45SooiWjoOg6m3lGm1Th7zEomQF3
	j1PEPtWg3Z1SG+zQbLQdLyaBss8YNMjYL1BfeGBouh7SFYxuoWVmElQCHZI5PO5S1azDyExtvGK
	C1rh0h2Fp6nIp+CJcE9l4+QusRVFT64y4ElTF5r9XsgV1FFKB77MQpjgRloucGTrltjO+Tk856i
	jfoVrZOyPsf8HlUnKkgUqnFzs4tDrKnJJlEc6sXgbnOzJ9jMxEDyijCh/hWufB5hEbjzbyQE8iY
	p9xhg==
X-Received: by 2002:a05:6a21:4d07:b0:3d3:af44:ee12 with SMTP id adf61e73a8af0-3d3af44f160mr20178531637.27.1788114047417;
        Sun, 30 Aug 2026 11:20:47 -0700 (PDT)
Received: from debian.prasanth ([103.177.82.239])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f95a847sm21619480eec.17.2026.08.30.11.20.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 11:20:46 -0700 (PDT)
From: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
To: Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ryan Chen <ryan_chen@aspeedtech.com>,
	Billy Tsai <billy_tsai@aspeedtech.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
Subject: [PATCH v4 0/2] ARM: dts: aspeed: Add ASRock Rack B650D4U BMC
Date: Sun, 30 Aug 2026 23:50:34 +0530
Message-ID: <20260830182036.284736-1-prasanth.padarthi10@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add device tree support for the ASRock Rack B650D4U BMC, which is
based on the ASPEED AST2600 SoC.

The series adds the board compatible and describes the BMC memory,
SPI NOR flash layout, UART console, and MAC0 connected to an
RTL8211F Ethernet PHY.

The MAC0 RGMII timing configuration was validated on B650D4U
hardware. With plain "rgmii", the PHY negotiated 1000baseT/Full but
received no valid packets and accumulated RX CRC errors. With
"rgmii-rxid", a 5000-packet test completed with 0% packet loss and
no RX CRC errors. "rgmii-id" was also tested successfully, but the
additional TX delay is not required, so "rgmii-rxid" is retained.

Changes in v4:
- Validate the MAC0 RGMII timing configuration on B650D4U hardware.
- Keep phy-mode = "rgmii-rxid" based on hardware A/B testing.
- Add the SPI NOR fixed partition layout validated on B650D4U
  hardware.
- Correct the BMC memory size to 512 MiB.
- Order peripheral nodes alphabetically by label.

Prasanth Kumar Padarthi (2):
  dt-bindings: arm: aspeed: Add ASRock Rack B650D4U
  ARM: dts: aspeed: Add ASRock Rack B650D4U BMC

 .../bindings/arm/aspeed/aspeed.yaml           |  1 +
 arch/arm/boot/dts/aspeed/Makefile             |  1 +
 .../dts/aspeed/aspeed-bmc-asrock-b650d4u.dts  | 95 +++++++++++++++++++
 3 files changed, 97 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dts

-- 
2.47.3

