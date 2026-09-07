Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B063639060A
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 06:47:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788763652; cv=none; b=jPP+ykySb0Tn1Jkn2bzSzSk3smMqPddU5nBAWZtU7YzLgpWwUwxX83HUvNqPYJfzVCXnFjCm4fhyi7e5oi85twg0FiLXyKa7j1LsXYhGDNirg8cmo7X9vfZcq/XOSaksO5AM+jfiigAFmM0pOvzDoKp0Q0NUtMvjN/qxVP8tbwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788763652; c=relaxed/simple;
	bh=gfWrSoeHVI8G8zOpNpxAVkXnMy09qAbqOf8byIMhbHI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=CW+l4BqT4Cu3Lml/+tMCnX2XvmQ39iynIzzVd+gWtSj/74Mj4op1BliUaNp0tL/be332l4HebzTksgEfgeZCRKwgH29CnL1oIL25UFTsR9D/p1fYpYT1vHcKhBDJJk+9mFIx37dpUrrya8thzO7/t5OVPDs+xdOGQEDaSchGdlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y5N/tzYa; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y5N/tzYa"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-49b965570d7so37814375e9.0
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 23:47:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788763648; x=1789368448; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=67I9fZQv05H07qwfT2ore1O1EeEbYTW4uGyAtywvhDg=;
        b=Y5N/tzYakfHLsg0SDnGHSS9sdCqpq0JfjiFdNSQS/J04tOt6t5ZlXOzQDHSrjek9lK
         MM9mcFGrEemLfcUOAaFzYmHet3Nh7SCGFfFBLPIYR+VvxQHw6EUO3PEhozYsIStcPiZ/
         /yDNVHu04aNzbpwpq8EH3N3xD/Ru2iHiKvT/8o5V36OBvXLC+oBGBdAPRcPZVQTG5fnZ
         ab/f5U/aE1h5mY8UN1f0GBWCyGw0I9om4YQYRBBXEq/aX84Bqtjmg9cj1S7dNCuLBhqo
         MhAYyj0IYyqop+3By+PfdlqA9kTE10+I3rbsbiGAARiH4YbYl9mf9A+M8E4CqKOUPDY6
         GJFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788763648; x=1789368448;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=67I9fZQv05H07qwfT2ore1O1EeEbYTW4uGyAtywvhDg=;
        b=QZ/KlHD02uYoHWUp7MMuJrEBvcH0M+feWxCu1816W6GmsKAZk11qjvy/El8eWIPRw9
         mXBabb3sutu1PDiUE5S0oWGkSIXF0bOZOcLke4TQGJ1rZjg2jEFeMlT2gzwiHtr+Jj2I
         HbZi6LagIGGBc/i7LclVgrnc9EDf0jp3SsMhq24wHBIJjqnWTE+w0N4mNFXwnAsl7Crp
         vme5oiV1Rk1RN7eRm9+h8TyN/qkSYlhtsSjh9RRlVG3eQRJC9MFuXBn52AbHojHxgn18
         0Ywkesd3p+rTLWo7LPBGoEZIKNYEnguG5nw7KIra5SPXM6J68U9zwA58BlaVnFe/kwfW
         c3Fw==
X-Forwarded-Encrypted: i=1; AKwUvBxrPGVv+fwBzHoF6NX0Iaf8WGlduJSs+7fVt0t0zd5uX0aGboJQhI0mV2bf6l4cDa0fjoiK+asSQ/499+Y=@vger.kernel.org
X-Gm-Message-State: AFuF++l0dBynEbGoL7gNaMs5j8ojZZKLgyqikTxNGzHCtNBxug53g+EZ
	HnSUnqwSgFQp+fl3d/qRNEa5rFv8T46VeM6xDhgR+aGK6M2SLrpZ+30L
X-Gm-Gg: AYBFou1Fuq3Mq6giKPxo+CAWEENS3AgM6nK0DQf60yoOqciQUKxyd81psPczLMxNZC/
	0IdyWtU9Oe1jAPHxFUS/RnCBRf08dUVrfjQNZLKqr34oCQoO9Jp0ZVO+f/5qN+IRX4HpSuDXSbM
	YaX+Q25Q7q4+FqXOkaAYRG1okmVzGdIPlNxsIEwB4W5Spsozr6eQ1Uc/1EbDDowA4f0zLJhDYz8
	QRArPij1eq9rGm6qXNeOf/9ZKZGSW12Dt9zdYIWqo56dJFaVzFaEc9XM1NPIGtz/Y+rko8FGSds
	7UxvNRYJJSgeMTY5ygWQiLllj9ShuOIJyFLwx0khLR1gE3Z/FtUsdD0muWlq5ESDuOhN1Sii+M0
	djMCYAW+kV7rXV3/1WsZZPWOmsPP0JMnQEaIL8wayhkxFjrsaRhRppNMZc9pF2Z1VQjCNJdxpEV
	DTxw5n5hxd1Qb7V3aauyG/rCq1YQbiW3UUxXXGkAWIJr0YzxNyig09S6kvu5TvpxC/QtZxva0RA
	ZaSGGepOPpss1OWLXKc3n/qyIoGofzlicExTzq0Q3jFpX1Hj63/V0PBu79hQTqaz3Tay57AfZy+
	zfPcnGLgLcDEjukvEkkD/pPSnLooo9kedNhtYyh+2cJn98qq
X-Received: by 2002:a05:600c:548b:b0:49b:92df:87be with SMTP id 5b1f17b1804b1-49cf81f3655mr208334755e9.4.1788763646919;
        Sun, 06 Sep 2026 23:47:26 -0700 (PDT)
Received: from [127.0.1.1] (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cfd3f815bsm200573845e9.4.2026.09.06.23.47.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 23:47:26 -0700 (PDT)
From: Franz Schnyder <fra.schnyder@gmail.com>
Subject: [PATCH v2 0/2] arm64: dts: freescale: imx95: Add ENETC port 2 in
 SGMII mode on Toradex boards
Date: Mon, 07 Sep 2026 08:47:19 +0200
Message-Id: <20260907-add-enetc-port2-v2-0-e8f1f8b000c0@toradex.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPddnmoC/2WNQQ6CMBBFr0Jm7Zh2CBBceQ/CoraD1ERK2tpgC
 He3YFy5fMn7768Q2FsOcClW8JxssG7KQKcC9KimO6M1mYEE1aIVhMoY5Imjxtn5SNiUVUW1ank
 gDXk1ex7schS7/svhdXuwjntmN0YbovPv4zLJ3fvVy796kiiQFElZtqZRjb7mqTK8nLV7Qr9t2
 wd/n0NVwgAAAA==
X-Change-ID: 20260902-add-enetc-port2-735526a9ef2c
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Francesco Dolcini <francesco@dolcini.it>, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Franz Schnyder <franz.schnyder@toradex.com>
X-Mailer: b4 0.15.2

Add the ENETC port 2 on Toradex SMARC and Aquila iMX95. The port
is connected as an SGMII Ethernet interface.

Enable the reference clock on the modules and enable the PHY connections
on the supported carrier boards.

Signed-off-by: Franz Schnyder <franz.schnyder@toradex.com>
---
Changes in v2:
- Fix node order on the imx95-aquila-dev.dts
- Link to v1: https://patch.msgid.link/20260903-add-enetc-port2-v1-0-2a21139d7a7c@toradex.com

---
Franz Schnyder (2):
      arm64: dts: freescale: imx95-toradex-smarc: Add ENETC port 2 in SGMII mode
      arm64: dts: freescale: imx95-aquila: Add ENETC port 2 in SGMII mode

 arch/arm64/boot/dts/freescale/imx95-aquila-clover.dts  | 18 ++++++++++++++++++
 arch/arm64/boot/dts/freescale/imx95-aquila-dev.dts     | 18 ++++++++++++++++++
 arch/arm64/boot/dts/freescale/imx95-aquila.dtsi        |  7 +++++++
 .../boot/dts/freescale/imx95-toradex-smarc-dev.dts     |  8 ++++++++
 arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi |  7 +++++++
 5 files changed, 58 insertions(+)
---
base-commit: ff1bb9ccce43cd06c766c3ddef796a7e40e623fe
change-id: 20260902-add-enetc-port2-735526a9ef2c

Best regards,
--  
Franz Schnyder <franz.schnyder@toradex.com>

