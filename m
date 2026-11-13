Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794567953;
	b=k69VEpZI0ApnfB+b2cD8aY6qwMHvLNeL0s6PExMmw7sGd9TachACseYi+RO91t39LEV5
	 75wG+4HVAI0mlP9xdMOMFBP4ENUL0gH8ozBQYRnIY4OKttzCtR8jl9KasDHZSoYybP27g
	 oTpIO8bLe0ewiiAYFH8TyyE+L4RwwQB8hemaLa5Tsv3zp4uAjXX282904hq0C5UURlZ9E
	 CHAXhA06LYqexWRw/iDRgCH4CcyMWoxD9GR1J70lSPekspe+K2VT1AkQIJSf4Sx0FX/4t
	 pzecK14LlFggYwa225JYewVV9D20D52WresxiKqECnhOXckpULykAPnpTOQezFw9x4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794567953;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=sIczx4EcJP0tNqiNCagmfdESXjTqKCY2sjQfBlgdqoY=;
	b=0N+rnp/ySndnng5ZhIrQJMoV3KNS+J4qB6sPnDrOe1PACAyiE2hQ/zvkcqzz8jk/6KRB
	 +DFXw0PahZSys3Dudg07JUN9Pwb5GLFIMqpfdYWn4yfaJU+72Y2x0ErAu7YRI0XBxU+gX
	 DPdC46A7p7LxC7v3WCn1RfUUqzf1XeLGWgmWWUvLZlTJRfIW/Y7jMz1OvaJRy5cfrUnMr
	 +bKqMq2tBb7a9ShvZ3xX24D7s8SzH1ITmvuEhvPE5I/uU6ikw7oBcDpm5PBD0y3CyVaZS
	 8eve+Mr8yEE+8xVDU2PURQkuuIsoua0CK7YTN0MgodzoXKb4FeekIc03XAP7jF+9jIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pTrJM5N5;
	arc=none smtp.remote-ip=209.85.167.50
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE738606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 11:05:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AE738606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pTrJM5N5
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5c151178f0cso1087211e87.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 03:05:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794567951; x=1795172751; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sIczx4EcJP0tNqiNCagmfdESXjTqKCY2sjQfBlgdqoY=;
        b=pTrJM5N56JwLitY8jMA6aeAQED3ILcDksDAzVeMg7z+Pb40AzV+vriwY9m1oXzTIDg
         HNnq0dE5w0sV94AlLlGZeS5rvx7HDP/f0LVqvKamh98XrWMprTEwjX+FNwspkbByavRc
         VHNqX30dBy8VBpRBqCNrRrhomiwHGXmk21ItMlOhyqFAvs6h6JA3oGaCb2NUWj++a27I
         0JMty6SVln9aWctIzGZK0N2Iwlt0dx4U1x9y9pR6oI8+unczMJ6TLxZ+KsIdTTFwDElH
         j9Q/OYNf3v4Ga04FaKONKLv0jy8CY9tYUsp+hst2Eldnf370JJRGKTolOANfYza5osym
         UBtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794567951; x=1795172751;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sIczx4EcJP0tNqiNCagmfdESXjTqKCY2sjQfBlgdqoY=;
        b=I+dalx+03SIAJgzjm9P9l28Q8FXUyuDLpE0oHbmESuNdKHDakyhxs4W995A3q4ePn7
         bgg5euMV688hYuhGa4e/uNqfCM9jXxzLzicU7IkeIPqJ4ko59avqhqTWuBHwFzVI6rIY
         QRzbVq9li74ADCHc2+CT16cQw2y3ER1m8+GzyT4pjNYVnlORbyicUQNf5iF2Ez6Kec34
         l8tvS7z2am2LPfrBVt2AmdLw3707V624HEuLasto87nUCjCK3CqTxlaU5W8igTVWF0oj
         28xtSJHOplXam66fN2zttA8ape+RWJffAMsCTVVQ07D14VqNnl75i5hSeTUMxdJy97EM
         E3pg==
X-Forwarded-Encrypted: i=1; AL+hErEaXYaPsNfCZgNpgeYn3fMp1obhOCh/+rXjmfGSED4odi1LNTsvNahxFf2wSm8Mw2orGboI+CuShKcd66U=@vger.kernel.org
X-Gm-Message-State: APuU4Z+uj/hZjvrxPIsAGPfDsqf7Yim32d5I9fTf6kp68ZvxvE2XyHPj
	sCxqmu3g+6LrUatkUdYGtXwzRoPs6hdu09r64ybk0a3iq22t5IDiN/eV
X-Gm-Gg: AYBFou3vVZeC0ccWTlbenNdTvMMQJaTww5XfIisKwbBbZs9EtOdnfWeL7+eJ01uEo6d
	qCJ+DpzqWstPxYpomrzMxq16TN1Hs0rDcqJJThRxJUUsQv+cdzNI5GYQxmF6I/ksiETy4cS1Mye
	i2THnHCDCCTSmsm0SfszI3nknpY/DODiUw5HQJnhccKa4A39LxqfUe6nZSujyg8SIgQoF1XyVsD
	faVMiv93DZYpNBBg3b9h8QOgHs4gGInOplYL5gxLB6JD7HzmlkRC052UypaI3X1Kgf3y/KjX7Fu
	SHlu94tKG27gq2Wq2WHPsMYEq3L1AVRejQeJ8HDfBe+2rcaV5qvWi9ggIJYWavbBn4c2bC75VSu
	t/grfBekg6xXaLnF2l8NldaxK/mPQE47GpeZr5Ik5O8eMfm0iYDMcoIa0ZUyMg+UnzHflTuzIk2
	2zIimkICEv0teIzw7pTqiinnoute0Z0rQRoBY4cQlxTIs1ntDtlQ0D6LIb+yBfIzq0n/I5K4jfn
	XK+GSVAjs+9dGym8O/e+2J5MOJaX4MxxORoMbTrxc5MIgJg+KLp778GRmzBxicHg5lXNGBJWO5r
	QwqwM6mXDDgCOWPIn6s8igKtcK6AVjOiasb0SwetH6G+NUM=
X-Received: by 2002:a05:6512:15a8:b0:5c0:ca1:46c3 with SMTP id 2adb3069b0e04-5c170b1c76fmr842803e87.22.1794567950691;
        Fri, 13 Nov 2026 03:05:50 -0800 (PST)
Received: from NB-6746.corp.yadro.com ([188.243.183.76])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c17133371asm610997e87.21.2026.11.13.03.05.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 03:05:49 -0800 (PST)
From: Artem Shimko <a.shimko.dev@gmail.com>
To: andrew@lunn.ch,
	hkallweit1@gmail.com,
	linux@armlinux.org.uk,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	maxime.chevallier@bootlin.com,
	pavel@ucw.cz,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-leds@vger.kernel.org
Cc: Artem Shimko <a.shimko.dev@gmail.com>,
	netdev@vger.kernel.org
Subject: [PATCH net-next 0/3] net: phy: dap8211r: add LED hardware control
Date: Fri, 13 Nov 2026 14:05:42 +0300
Message-ID: <20261113110546.173624-1-a.shimko.dev@gmail.com>
X-Mailer: git-send-email 2.43.0
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

Hello,

This series adds support for hardware-controlled LEDs on the DAP8211R
Gigabit Ethernet PHY.

The first patch documents the optional "leds" node in the Device Tree
binding. The second patch introduces a small helper to write extended
registers, since the LED registers are accessed indirectly via
EXT_ADD/EXT_DATA. The third patch implements the three LED callbacks
required by the PHY library.

$ make dt_binding_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/net/dptel,dap8211r.yaml
  SCHEMA  Documentation/devicetree/bindings/processed-schema.json
  CHKDT   ./Documentation/devicetree/bindings
  LINT    ./Documentation/devicetree/bindings
  STYLE   ./Documentation/devicetree/bindings
  DTEX    Documentation/devicetree/bindings/net/dptel,dap8211r.example.dts
  DTC [C] Documentation/devicetree/bindings/net/dptel,dap8211r.example.dtb

Required:
CONFIG_NEW_LEDS=y
    CONFIG_LEDS_CLASS=y
    CONFIG_LEDS_TRIGGERS=y
        CONFIG_LEDS_TRIGGER_NETDEV=y

Testing:
$ ip link set eth1 up
$ ls /sys/class/leds/
stmmac-1:01:amber:lan  stmmac-1:01:green:lan
$ echo eth1 > /sys/class/leds/stmmac-1:01:green:lan/device_name
$ echo 1 > /sys/class/leds/stmmac-1:01:green:lan/link_1000
$ cat /sys/class/leds/stmmac-1:01:green:lan/offloaded

$ echo eth1 > /sys/class/leds/stmmac-1:01:amber:lan/device_name
$ echo 1 > /sys/class/leds/stmmac-1:01:amber:lan/tx
$ echo 1 > /sys/class/leds/stmmac-1:01:amber:lan/rx
$ cat /sys/class/leds/stmmac-1:01:amber:lan/offloaded

$ ip addr add PEER_IP_ADDR dev eth1
$ ping -I eth1 ELP_ID_ADDR

--
Best regards,
artem shimko

Artem Shimko (3):
  dt-bindings: net: dptel,dap8211r: add led nodes
  net: phy: dap8211r: add extended register write helper
  net: phy: dap8211r: add led hardware control support

 .../bindings/net/dptel,dap8211r.yaml          |  38 ++++
 drivers/net/phy/dap8211r.c                    | 207 ++++++++++++++++++
 2 files changed, 245 insertions(+)

-- 
2.43.0

