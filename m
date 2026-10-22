Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792673635;
	b=LlEGPxNLI66QgzAGDl0hFWFgkgrZ6PMZllSSRBeoQsZMlzTSsvUkFny6bPk2bAhWkrwW
	 hhSG+wil30kk4lwW3kNi2J/W4yFFc5rGdF99sy2jqZHAnvMhYj6iWXVzXJWvN5CWVHrfz
	 QYZX/SkVXWlGs+YxKZIbj9VY6k9LXpHWUr+Grd8AdcHKGquSvBpr+CNE76WujoH5hYZQ0
	 oyy+Q5a1siTO0BHlzh+ww1LN04q90tTfWd7QSweXTp4A8gPh9cyVBV9eLcX5T6Ki3vWNL
	 VtzeZMKPiZyH/OsPuQIFYAAHwEFIipew9ZA2J1IpcKGqj3YnkueNO8R0wmiAPiDT4TQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792673635;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=hJXOwkkBJmyzw8mSfRsieQwN95oGOjBRB10X28KVVpE=;
	b=g+yai5+mn8G9xiemSnGHH0/ruWDXvogRxb7WkXWcA/RH3DVHWmdW7nCswfCsq7nc9FXg
	 H+fJpptcTJpUi3GnkelykCAtTgxwtVKNAwHsXvEELzXZk4oWBr64K3KFJbrd5A+zpo/z+
	 8MbQ3f1eeJIllRQkyV5VNQv7Zqh4O9pcyo2KAsNK8d/XFwbAr/lPg28vOcWVDjwdRya9B
	 MDpOjaqWPvaneOUEBN9HB4/Jbcz6vbaPpBclHvDVSbowppf8xXzWHJODl09a+iRGM54aQ
	 D/eZZ9DLK+V0MExYH2FNhyTIMytaAi9GwlTWJGfaquYRqFWxXMnzcbzBrez1oDx6/qw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=RuDQWiW8;
	arc=none smtp.remote-ip=209.85.216.52
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE124606A319
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 12:53:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AE124606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=RuDQWiW8
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3ab3f899c8aso317598a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 05:53:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792673634; x=1793278434; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hJXOwkkBJmyzw8mSfRsieQwN95oGOjBRB10X28KVVpE=;
        b=RuDQWiW8eT8+/ckB3EQRMpvQsmBvfwnrlJWxTRGppkJMvr6/Sd1eQtfNIC8R09wDBN
         NlnRulIKwVl4zQCJi3tVBM8WK+sRY4RZq0j4lMYw3tMOl7H7eJifGgv66eEoNes6IRBu
         aviTlHcAHbOzeuUPhuRv0LnhUP/lTZmUKEYhhGqF2f97XFR8RpGADvlJjHJqPCpqr0NK
         OCP8p1nlJG8KEyr0Z2PNB97/ykCcH5fv4Oje+K+qo5qWdt7d/nXTQrHCN3AbRO+wdKYc
         TTgc6CP9afp5EESJw55tNFsAfFyrfqt2GiizYw7HhC9hcY/KQuhCC0vjANtq3OWb9OUM
         hQ+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792673634; x=1793278434;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hJXOwkkBJmyzw8mSfRsieQwN95oGOjBRB10X28KVVpE=;
        b=GSAQxQq+VE2Q5FKMA5jbGmyzDcZwMumuO6G7Ff/VLySoEzlsHUWeqjD55BkOP7mt+m
         x764B1ZZWzBszxsCXsCSVy2PXjsbId8e/tzVwk6GflsErmzBB5TsRzQl6q4TGCrGohKj
         JsmJ2OpicoC9u0btmr9H8i51s3qIomHZNE+R/itAEeKJeoKJS+e8tAk7OJo1UaRAyuDw
         JSwtp3K9opBCeV2KOCTjeXsefRSSpngNwmFlc7wTc1B4glefZINwiV/bSmYaSrh9j2tC
         oQ0KVdmhgfSjG5kEteWvadr8N8uJGpvztqwv68QdyfHyHn21xM23ouLlzWL2KipUq//S
         3iEg==
X-Forwarded-Encrypted: i=1; AKwUvByVPtYVn9GV6KuGq2Ukg4EnTJ5DUWY7P9EqMOCZn2klqgGAGPQ1IIwJFjiKR6QugisUCBE7YqyYbAfhugw=@vger.kernel.org
X-Gm-Message-State: AFq9FYLg4I66Ong66Dpit5Oi+N1M6/c1jVPGki0/bupUTVQufg/SaEuf
	GATZ9hZTgg8oq3FNIS0hH3l4pfC1hXCbYra9rfulRvJxm4hyjXs1j1Sb
X-Gm-Gg: AYBFou3RSDHNdcTs3uGA5/9RCIKlPjjIcbRXYvy495/g4ScQ/+tDEkUkfR/DjWHV//Z
	whOFb9rAScOnoJFiRDxd2Ui9dwY0DPvEq8GcagJqwPMdOrrSrkbsUOZAsAoj+QVSdPJwICUMnRV
	U/YtqqmtJDrdbetffBagMtt5piF1Ky+DDPJdc4liLqv7SkFTi+LZMo7kH6qRlNoHHGIBkcfwkVg
	PrvyX9BLP35xsuwA+N0Rc2vUNQyYXKEMNDfLgN0BALqGaIAWpCJxL4aBGC2INyPNjx5Ah5K8PTW
	UbNiICLrUVOvkZcc4iDXqT/v7/SYtkSG7eORH2DuP31l12YVqK7eT4jiiQG7R268uVp5oBkB7w4
	8HIYTKhX5pyNXEG3At/WK769vT6OOcc1vQEMOfVLy9/sL9jZbtbWD8YaxyuD2WjbPljLHCY56YS
	ZGZtWw0+PZRGXoVAi5jM6hgiyvZ/hsY0V+tMfWAI8+BShvrzwjcz0Xn57wcLijKNygJjbJqdVt+
	aYFO6ravMysS+PKOO8rMFv5pKCoXWynePva+Juvgh4tW73b6JNgI9RGe0o=
X-Received: by 2002:a17:902:da81:b0:2e9:6468:2005 with SMTP id d9443c01a7336-2ea43ccf96dmr64409565ad.2.1792673633997;
        Thu, 22 Oct 2026 05:53:53 -0700 (PDT)
Received: from localhost.localdomain ([240e:36d:b08:2bc0::a60])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea3b435243sm23704165ad.31.2026.10.22.05.53.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 05:53:53 -0700 (PDT)
From: Jianfeng Liu <liujianfeng1994@gmail.com>
To: linux-rockchip@lists.infradead.org
Cc: Jianfeng Liu <liujianfeng1994@gmail.com>,
	Alexey Charkov <alchark@gmail.com>,
	Chris Morgan <macromorgan@hotmail.com>,
	Chukun Pan <amadeus@jmu.edu.cn>,
	Conor Dooley <conor+dt@kernel.org>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	FUKAUMI Naoki <naoki@radxa.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Hrushiraj Gandhi <hrushirajg23@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michael Opdenacker <michael.opdenacker@rootcommit.com>,
	Michael Riesch <michael.riesch@collabora.com>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	Rob Herring <robh@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?=E5=AE=89=E5=AE=B9?= <HystericalDragons@proton.me>
Subject: [PATCH 0/3] arm64: dts: rockchip: Add ArmSoM Sige7s support
Date: Thu, 22 Oct 2026 20:52:51 +0800
Message-ID: <20261022125339.82746-1-liujianfeng1994@gmail.com>
X-Mailer: git-send-email 2.47.3
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

Add support for the ArmSoM Sige7s, an RK3588S-based single-board
computer sharing its hardware design with the CoolPi 4B.

Document the board compatible with coolpi,pi-4b as a fallback,
extract the existing CoolPi 4B hardware description into a shared
dtsi, and add a Sige7s DTS containing its model and compatible.

The generated CoolPi 4B DTB is byte-for-byte identical before and
after the extraction. The Sige7s device tree differs only in its
root model and compatible properties.

Boot-tested on an ArmSoM Sige7s v1.0 board, which successfully
boots into userspace. This series retains the existing level of
hardware support provided by the CoolPi 4B device tree.

Validation:
- Build-tested both DTBs with the arm64 defconfig and W=1.
- Passed dt_binding_check for arm/rockchip.yaml.
- Passed DTB validation against the full processed schema set.
- Ran checkpatch --strict: no errors or checks; the two warnings
  ask whether MAINTAINERS needs updating for the added files.
  The files are covered by the existing subsystem entries.

Product documentation: https://docs.armsom.org/armsom-sige7s

AI assistance: Codex reviewed the series, ran the build and schema
checks, revised the commit messages and cover letter.


Jianfeng Liu (3):
  dt-bindings: arm: rockchip: Add ArmSoM Sige7s
  arm64: dts: rockchip: Extract common CoolPi 4B board description
  arm64: dts: rockchip: Add ArmSoM Sige7s board

 .../devicetree/bindings/arm/rockchip.yaml     |   6 +
 arch/arm64/boot/dts/rockchip/Makefile         |   1 +
 .../dts/rockchip/rk3588s-armsom-sige7s.dts    |  10 +
 .../boot/dts/rockchip/rk3588s-coolpi-4b.dts   | 936 +----------------
 .../boot/dts/rockchip/rk3588s-coolpi-4b.dtsi  | 941 ++++++++++++++++++
 5 files changed, 959 insertions(+), 935 deletions(-)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588s-armsom-sige7s.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588s-coolpi-4b.dtsi

---
base-commit: 8f7df005a7564bd7ffa75da9c3085d5b996f1e16
branch: sige7s-next-20261020

-- 
2.47.3

