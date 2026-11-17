Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794919191;
	b=RWtYxkfm60Y/j3kW/oAijo0fN/rKRziNlksfgrq4hL9qlQV7da9rymLru5+Gcl8KOLUn
	 S3phzxRq8IlsEFbUJTUVfehScvclMRskp6Iwh9iwTB/f5tB1VoPUcjkwkQiY6W8id1nAW
	 u66qehNczNcgPNISZCLi9VH6oKaWlqQRQXcYMT8T55n2dcB7xDAmaSkj8EzzbEgVjaJeB
	 9cPPbLHHIPuUT07e1J0JdqBWs5pfhCwMbGP/E2l+N7f+KcIU76iYH1PsacfhuAddKmx6L
	 LU6CfvccLO2nlRepu0LWG0phtnNKVqifroA81VofLOTXjQKFsTRl0yWoXEmdAJ57dBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794919191;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Yf/7M/nDCTW8ZFPsGSaUmFFI3kKEtiDdHsd3kIU7HVk=;
	b=JsYFl+xLYFjB9eq9oL3BasZrfZ0xv03guOlnVcKwgYZXSHE2ys8BEdTSh45zoFoZznLb
	 xwMBcwTt7jz1Z+R1Cu/aY/9GvAwbvhxGLngd4oBzt4CDAuUw/sWrx4+Hw7uAZrBYBVMTL
	 ET89m0cQQid3dWQBb3N9fTi4ZiLZllRlj4MfWTNql1HgK9pb247P2NqaT8Z6xjmSS9TBL
	 RRDHf8nM8gubBF6AX1f2xx8J0+3aCJhb93AVBLpRYGTpoRq+hAs2dmezZRxtj5GGqKumM
	 PE0rEtfpoM7ySbJJJ7PMaiFnotm/7NrWlw5InYtbA9t1FQtm9bUKOXrGjODhOYOYIsg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Om4lJDcv;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C53E0606A335
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 12:39:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C53E0606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Om4lJDcv
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4ac95761c85so30978585e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 04:39:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794919189; x=1795523989; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Yf/7M/nDCTW8ZFPsGSaUmFFI3kKEtiDdHsd3kIU7HVk=;
        b=Om4lJDcvRTZnmDu3St2YFLuaMpP3U1G6F/IlFhPrRtbqeocCF/Dh82A8F0RIkcjYJS
         VssVIIFxYm+xPYX3l3RIOi0uY1st/9+ZuLWeF2mzpdQFkod6DqOs1aaIwvoq64K3fJhb
         B9iK/0Hvggz1k4FcxtggByjel1j0AdP/fe+JCj0N823NP1X4gwJRYMACpM4Dw+pdGQy1
         HwDFDYJobvjTO3alxk7xvANzObwpvs1r4SfbVuqshS2YOo5io4EZWa3Gy6wtWQhzpvpO
         3IBwikamk3jmLSdlOlub58OAvjN29ySqdaW2GtmUaNNT7TvPfUh8XFVftbNkpTVIYnW3
         FIvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794919189; x=1795523989;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Yf/7M/nDCTW8ZFPsGSaUmFFI3kKEtiDdHsd3kIU7HVk=;
        b=k+XxGiWWU+ajao5fNvGz9PtG5nGGJPjKA5PPBpBT7Uhm27tHmBCjQ4c7Dnc71DTsvj
         dS/QBCfmwsIoXEpg1ea429Lkmjf4aVbUykfT8T/07vy7QcJtaGBudRY2QTQnLue4j+r5
         7AAIc54eX8Z6dk2qIFBoZMllTMeOE/gwSqbiRg4QaFLGZcYqwRw2s3Hw7m8WpYJKhqUo
         pnS79atCt76IgiYIYOM8c5IY23lcKOAZO9P4EAFm+uijWPFYSepWGYDUqvadQOtukkG9
         mKqmiqqU8sanRyb6KUCHpHGiaJFu3dLuFHHZmONfx/I7HjivA1N8U3drCKNKydMbpZ+m
         bwtw==
X-Forwarded-Encrypted: i=1; AL+hErFxj4yhkikPZn63IP2pqn/m7muiy5wv+ZSarZriFj4mAVvwhgaSp8cRxOqqRcvbNCvMSg6Uuk+NR7O1ino=@vger.kernel.org
X-Gm-Message-State: APuU4Z9n2k+8r1Wkr/H2hhlz7cBiUCU5s4iLQds44Y5dKxx3N4wm46QK
	bz+2uMpkuhKbCjmQhpqHaEn6blHHCJf9TG11EQG4glcGfRPJvF8oI0ky
X-Gm-Gg: AYBFou37Oj6qQ9Hux0F8a58r4MlD/5ulmiKUZ2UEHDjFIiOoe3CrlvLqEIqjnBYF1ff
	6n/PRzPSxNPaCARlkzybwp0ksSPQO5Fk5AK0T2hJMev5IfRqMwcDgSwKqAQf8xEJV/jOjoVIim9
	hTGrZ5uu6HmCYkV5KzqSEO1FxKpNoGg9g7L2wZ+QSPyjPDRnklcJnx4IvWx3+Mv6oLxwFHa/6kr
	vmKl8KM/gjungrgh6GmAZdu+EyIVbgnpRiuqh8yVHJpeFwuK62INbTgjAJgZIgO1rtG5mGITwxo
	VxqhgV9NycqgN0LvehkrQodHPfob8gFQCk/n8kKY4qDVmSeni38Gqf6liUQMfGCAWFRPNEBsciz
	grhS/08mkCPee6XNIWjSGB4ZZ7Jj1xDn31XjZp5n+6GyXRbJpmxdsfqd77VKdYghHxH38+Cc8JP
	ncQvwbAlPF92RpUjj/XdwY2jFgUZn3aZ+C6aXIR2YzWn33bQPE7mVT8K1zlnfdqbZ4fG8lplug8
	Zray5dQz/c/Q9h5eoCchpf5rh2Dy1wIEsMQ4Q0KEXbLhXM3YpduzKVQ5E1JwgPwutFw3dHaum8G
	sL9M/Ta1kdtMhhHIj+GwO+7YrCJ2qq70i1xl9b2XMA6XyMQ4SsL3/EQEy2fxmz6/Ou4KTQ==
X-Received: by 2002:a05:600c:1c0e:b0:4bb:6f45:2a79 with SMTP id 5b1f17b1804b1-4bb6f452d4fmr166096475e9.22.1794919188928;
        Tue, 17 Nov 2026 04:39:48 -0800 (PST)
Received: from DESKTOP-BJ3EVC4.lan (94-21-223-203.pool.digikabel.hu. [94.21.223.203])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb783f8154sm71474905e9.4.2026.11.17.04.39.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 04:39:47 -0800 (PST)
From: rofikkerneldev <rofikcoga@gmail.com>
To: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	rofikkerneldev <rofikcoga@gmail.com>
Subject: [PATCH v1 00/11] arm64: qcom: Add initial support for LG V60 ThinQ 5G (timelm)
Date: Tue, 17 Nov 2026 13:39:35 +0100
Message-Id: <20261117123946.668557-1-rofikcoga@gmail.com>
X-Mailer: git-send-email 2.39.5
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

This series adds initial mainline support for the LG V60 ThinQ 5G (timelm),
an SM8250-based flagship smartphone released in 2020.

The series enables:
- DT binding and SoC board description for LG V60 ThinQ 5G (timelm)
- Memory reservations for bootloader and firmware log regions
- DRM panel driver and binding for the 1080x2460 SW43103 AMOLED display
- Touchscreen driver and binding for the Silicon Works SW42902 controller
- USB Type-C TCPM sink mode on PM8150B
- Bluetooth HCI on GENI UART6 with QCA6390 power sequencing
- Storage (UFS), SD card, volume keys, and thermal management
- Entries in MAINTAINERS for timelm platform, panel, and touchscreen

All patches pass checkpatch.pl --strict with 0 errors and 0 warnings,
and the device tree builds cleanly against Linux 7.4-rc3.

The series is also available on GitHub:
https://github.com/rofikkerneldev/linux_timelm/tree/timelm-v74-stage1

Signed-off-by: rofikkerneldev <rofikcoga@gmail.com>

rofikkerneldev (11):
  dt-bindings: arm: qcom: add LG V60 ThinQ 5G (timelm)
  arm64: dts: qcom: add LG V60 ThinQ 5G (timelm) support
  arm64: dts: qcom: sm8250-lge-timelm: add reserved memory regions
  dt-bindings: display: panel: add LG SW43103
  drm/panel: add LG SW43103 panel driver
  dt-bindings: input: touchscreen: add Silicon Works SW42902
  Input: touchscreen: add Silicon Works SW42902 support
  arm64: dts: qcom: sm8250-lge-timelm: enable SW43103 panel
  arm64: dts: qcom: sm8250-lge-timelm: add SW42902 touchscreen
  arm64: dts: qcom: sm8250-lge-timelm: enable USB Type-C
  arm64: dts: qcom: sm8250-lge-timelm: add QCA6390 Bluetooth

 .../devicetree/bindings/arm/qcom.yaml         |   1 +
 .../bindings/display/panel/lg,sw43103.yaml    |  70 ++
 .../input/touchscreen/lg,sw42902.yaml         |  74 ++
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 MAINTAINERS                                   |  19 +
 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 .../arm64/boot/dts/qcom/sm8250-lge-timelm.dts | 744 ++++++++++++++++++
 drivers/gpu/drm/panel/Kconfig                 |  13 +
 drivers/gpu/drm/panel/Makefile                |   1 +
 drivers/gpu/drm/panel/panel-lg-sw43103.c      | 594 ++++++++++++++
 drivers/input/touchscreen/Kconfig             |  11 +
 drivers/input/touchscreen/Makefile            |   1 +
 drivers/input/touchscreen/sw42902.c           | 315 ++++++++
 13 files changed, 1846 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/lg,sw43103.yaml
 create mode 100644 Documentation/devicetree/bindings/input/touchscreen/lg,sw42902.yaml
 create mode 100644 arch/arm64/boot/dts/qcom/sm8250-lge-timelm.dts
 create mode 100644 drivers/gpu/drm/panel/panel-lg-sw43103.c
 create mode 100644 drivers/input/touchscreen/sw42902.c

-- 
2.39.5

