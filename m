Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792680412;
	b=4Stdki+cITXYE5doO7EvE0VUdXCiVefPHhMWE+R5VCJA2waNRJbYmzFqcmG1GRZFRfaH
	 phW1la4jSp1gxg4qpcNZIW0X0PK7kK+ALfU/jErirbcnMnIqBYmJ0aHvOSi8ipOzZy4Vg
	 E5YPF6fYZVH1AAhVv3REqOA8l+/HqHOvRsALWETpuUoFJvQ9O9P8G6inA9u8VdISfhwdJ
	 2h+b3QNmVEndQgybjWC+pl/fRD8wWT1V14ly7XcB4XFUffzltR6JkdZxXmPhb+MC7HVlc
	 rt+7JQi3Cd/IgjcDo5bqLux1B5wEayPuNRc7iyZW87A4hL35PoVbIC5og4Ru6Tn6fDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792680412;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:To:Cc:X-Mailer;
	bh=xBDqLL5GuxOGFYhhyYk77KxsJOi32ML+5os83sQIq8A=;
	b=ytWXHYavFfG0n83YQkZGIKmizxBrr6EMxW4JIAfdQtNijamNGhQQ3P8SUW8aicVBS2Mi
	 L+lXYwG+hRG1YW1phd8YgG+uk6ZHjjE5tSB1NXG1uIb3CNqGgghnuPegz9WPuJCDrH6s0
	 8jBJTFkXOfqp/O3AtmI0rgZ4Ik48gw3hKMqoE2fwmC6/SYoZ3EMbfr1C/UIyB23G26MED
	 8UHBlKZvahp/gHGv3u1GlA2xbHuC9UxCZfgMrFKgSEnVHr5zYnPKB79SAelTsfTMeyVjI
	 6zqQoEn3U9a8J5nXqTeaCuCbwJ3zmAAXOcbm1jnPNUT/KcQeuhmRfB3udWL7iuj3CyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=DWOhEbyZ;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5BDE606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 14:46:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5BDE606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=DWOhEbyZ
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48df54150dfso1264883f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 07:46:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792680410; x=1793285210; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=xBDqLL5GuxOGFYhhyYk77KxsJOi32ML+5os83sQIq8A=;
        b=DWOhEbyZupY6A6Bx98lfDLMZ+jao4XBWvR2wmr1Pufz2RMFe4QuRJu89Bth2PWK9oq
         abRqseaMgIY0+df6PDZxw7F0a4H5IEWO64EO2WSgCLRZT6YmJESBpyE9WiQ/FJqK9e0w
         IDjXPvsmwieup6oNnAcsxTiMyaBPdS58MyWv9ICRxSyUkQ5qoI7pvJPVglAAeNcJouj2
         rkAWgpadM1mYJC5Mn3vh2bLOwfevicF5wCTkLx1+fvgXOREphrgG/IFxkOUf/5pYBUTQ
         qNMH/xmWQ4NHidqnCPCaQAxtGVmWnQ3i5ZioaX9Fv3Jb6k5JbimnZDgqtG1EsDUBsPU2
         AVLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792680410; x=1793285210;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=xBDqLL5GuxOGFYhhyYk77KxsJOi32ML+5os83sQIq8A=;
        b=AwGUlSILVDFnLRzrExusbPx+9w2UcZmK0Em2rU8uGvYlr7VQr3au8r1puzgk/pFjws
         gPvrYgkM/eXvVE2BRtGPuk7BZcAkPtuuu8X/m1pjfSJ5isvaMRdVcAiRrwWQKEnYlqdV
         jLAdZiWhM3SbHRu8ueDxDEVgnXOjFYIodGCAgC1QalUqzNhB6QlEqijZzYJ+2ytadbM+
         22Lrv9fQkVFhE/9SJx1sb7A0zWjF6GVjck6L74OBIRHflbtHn0vzYgP6aVjmiE20OU7j
         NiWw/oekK/BWmdCWP2j+Y0KFGm5wUh6Be84HfJvDd3znJVDFRP2vRQTVdoVZ/1LFBnQQ
         5meg==
X-Forwarded-Encrypted: i=1; AKwUvBwvRlis2AWaYEFHHKtUbMPJ/KBjF2KKQ8q5PljqGYgbJGS6wRgwiM72z9TrGC9cJe8Eh5zY/mrsvqIDpsw=@vger.kernel.org
X-Gm-Message-State: AFq9FYJP65fzbAW0Cf24RvG1ABc/blchkRAyT+1efM+PiDhFKkbJGB+D
	5pkdPA+TCxB/xwOKT1YAI1O6IZ3Ady2GiggGZhZFeMZ+HTx7e/3XA/+h
X-Gm-Gg: AYBFou0at6JGhMViZSn4c/QjSBAjcpMK2uLYnjR2TsiTvYiMPEZa8FrYJZgLfh4MtuW
	GrZ3TZqbox36CR/PgjEgZvCSA9CsneLx/kvv7Cl4hSRmRZLGxsceKUrvMt2lwAIIl7oaiRhoVT4
	BFmmG2QSdCrgZAdN+Gk8XdfblHdPgPobOnKmz7G/9YfjWkAnglXcr3skwdmCf6FPi7J47B2q+Pj
	ShccHCw5qF9XVQl4Ca5VPwQ7Qg3iURAbak5zMQDNimQ9FvgFIZ16PPgdukpRM4lZN2gv+IWFU8e
	u+xAco4yZj2TmWNaVsAZIlEEcv1tdKWtJggpGudgnq1M3tYreZQW/qycVtpn9JM3NZ67tzyChcZ
	CMOHplNFRUSnKQKgIw1QwKldzXMln9vWwAi5ES9HCkI55pxB01gsL9kwx5D2TCI5UfzVbcqoW6M
	Q5ra1XNYeel2xwaF5mB4JkYskI+URw+hLlCfKFrj23PeAe5UCUgTILp/qdbHfyKpeUI3DxCSRjX
	PfUwajShWS7uRKrnUbRI5aNn18x+pdy8pyk+NsGU/k9AujCIUo0Iv66KNuyFvKsTJ2aTdMUoW0E
	ubPKxrsp06D2jGH1kFoFh9nepJJe1Mks2xXdLmrlrRaIP+Q34drmSsifZAzE2iOQFTxklrlAPGP
	S
X-Received: by 2002:a05:6000:4009:b0:48d:ffa3:714 with SMTP id ffacd0b85a97d-48e264c9950mr11847583f8f.19.1792680409680;
        Thu, 22 Oct 2026 07:46:49 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e25828c6dsm13672146f8f.24.2026.10.22.07.46.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 07:46:48 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Subject: [PATCH v2 0/3] arm64: dts: freescale: imx8mp-toradex-smarc: Add
 OV5640 overlays
Date: Thu, 22 Oct 2026 16:46:43 +0200
Message-Id: <20261022-v1-smarc-imx8mp-cameras-v2-0-cfe3d25e7aed@toradex.com>
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
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANQh2moC/4WNQQ6CMBBFr0Jm7Zh2gk115T0Mi7EdZRYF0hKCI
 dzdygVcvpf89zcoklUK3JoNsixadBwq0KmB0PPwFtRYGciQs8YQLhZL4hxQ0+rThIGTZC7on86
 1kclEbqGupywvXY/yo6vca5nH/DmOFvuz/5vVG2Qj/mo9BUeXe01wlPUcxgTdvu9fo6+R08AAA
 AA=
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
X-Mailer: b4 0.13.0

Add OV5640 camera overlays for the Toradex SMARC iMX8MP SoM and its
development carrier board.

The overlays use the camera connector GPIO nexus, so this series
requires the toradex,camera-connector binding from v3 of the Verdin
iMX8M OV5640 series:
https://lore.kernel.org/r/20261022-verdin-imx8mp-hmp-camera-ready-v3-1-90a30b0b0d55@toradex.com

The camera regulator is supplied by the on-carrier 3.3 V rail, which is
described by the first patch.

Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
Changes in v2:
- Include the on-carrier 3.3 V regulator patch, previously posted with
  the SMARC iMX8MP display overlays, which are deferred
- Refer to v3 of the toradex,camera-connector binding
- Rebase onto imx/dt64
- Link to v1: https://lore.kernel.org/r/20261002-v1-smarc-imx8mp-cameras-v1-0-a0e89182c625@toradex.com

---
Ernest Van Hoecke (3):
      arm64: dts: freescale: imx8mp-toradex-smarc: Add on-carrier 3.3V regulator
      arm64: dts: freescale: imx8mp-toradex-smarc: Add camera connector nexus
      arm64: dts: freescale: imx8mp-toradex-smarc: Add OV5640 overlays

 arch/arm64/boot/dts/freescale/Makefile             | 17 +++++
 .../imx8mp-toradex-smarc-csi0-ov5640-24mhz.dtso    | 15 +++++
 .../imx8mp-toradex-smarc-csi0-ov5640.dtso          | 75 ++++++++++++++++++++++
 .../imx8mp-toradex-smarc-csi1-ov5640-24mhz.dtso    | 15 +++++
 .../imx8mp-toradex-smarc-csi1-ov5640.dtso          | 75 ++++++++++++++++++++++
 .../dts/freescale/imx8mp-toradex-smarc-dev.dts     | 33 ++++++++++
 .../boot/dts/freescale/imx8mp-toradex-smarc.dtsi   | 10 ++-
 7 files changed, 238 insertions(+), 2 deletions(-)
---
base-commit: 7f47e8eafbf55a2ad0697e5d28f5e6cff2fa42f9
change-id: 20261002-v1-smarc-imx8mp-cameras-8b664da20da4

Best regards,
-- 
Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

