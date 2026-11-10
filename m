Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794340365;
	b=z+mcLJ25cFjrACogMnzDwayBT2OGeGxl+NpErjrP3R8immeiulnftsQJVCeO5uCrEQ/0
	 sQAy1tRKeJSzrPMJkv/WLX/D+OzV90hSSni/Tb8+/h4RoWJvSu4VkfoX0uyNSvHlNJbBR
	 DUlPtwY156dv3TOyvQaDG2/sxj6+mkPdEVLWIXVrpEvDZt2/v5h5weVKJyfqW6HBSYbo7
	 mi2BoZdOkBpCJMuZXFCwTvL/qpN3HWTpX6CwpaKy/YGfxWMNh3sqHmJ6BByRQWgaxHwEs
	 +PcL1qdPfCJwLfE9yydinVoipQElaBuFijdaRhWjy08j5+lqxPTQFvLmIu1VBuHWr+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794340365;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=jysfsGSRAYJJWkmbtwBk1tFImXdGDkNw2DYjF9a8f5M=;
	b=UM3yperG5c5ti0QlyFy84ZAOg15Gc5UW3j4ppTzs5NKIn6l30xN0ctQw++LH5iy79Z3I
	 ekg2ByBTg11qxQaLL45mZvUq9JJWMrhuazzXXMarshHQOPT+1Nl6CTcobNzEC5fq1bi+Q
	 a4ejKxIWJCIv0A0EQvdNStDdZoMQNV/Fof/MNyLS9hCNi+WC8L25kgEOkXw9ec+HTCw5W
	 RPVTt9x40xqCcBQYaVDP587x1GtkuUvOW3h+j03pu9/wtc5yQcPpOZzAJx5zBzJVD3cwk
	 80FxQpJmzXPCOH7HQz5GdYD/QSlJaHeUBUA5UlOdWxb7Ny1negdJV9I1imRbVQNKSkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=J41g6b6A;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB232606A33F
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 19:52:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB232606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=J41g6b6A
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-36ecc11bd26so287049eec.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 11:52:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794340364; x=1794945164; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=jysfsGSRAYJJWkmbtwBk1tFImXdGDkNw2DYjF9a8f5M=;
        b=J41g6b6ATnFGFSDIFPyS0leZ5T4BVLZwsL/PVzgG6oFe4Lu4rpcjZtjq34EF5u+MwR
         e07S3I+Kpqkgfq86S0TKajDGiB/6tl5JkxKbXcbhkleQmd3GwvmkD6LoKuxs/sBqTcQq
         7/YY7KE8+kXBIuWIKfubNByEIQbEXW6qKranAJnXgCtsB+Vignrc68EhpP5RGqWR/L5y
         Ax331Gymw/u7PCEqIV/Y4rtV6OAbWHPdrWkZDUWSrQb9AqZxU6u/gHGh6rdyGDDlQAOs
         9JhASEyYVawuOT+9swaOJwm3FF6AMYp34zg7UWOabD21I5fryMdRerUuLBhxnOKKHrBU
         2xBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794340364; x=1794945164;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=jysfsGSRAYJJWkmbtwBk1tFImXdGDkNw2DYjF9a8f5M=;
        b=WgcOGqisZawa87AggvfJwhqnMFoMrDTCuvzvBYX9I0o3NmTe07KdwQiH0voZMh3i3W
         t/TkyecegN2EWCchyeGSOaD1YidNMpmgaau7vuoxbfylf4yfhM7Mo/CNIW1ZElB4IhFo
         XrvtJOP60oWQVmx4RP4WDz5P4NAW6Wd/v8zoYJfjJcvbTIjF+ZrWm89T9gW1Yd/ykjQY
         /h/5aYAzbfug2pAb+QPQD+5aMzTenPoSsbY8c8i688c9BW7Zo+F3SCTUIXlVXtQxgEVU
         aJYKx6NDCziTPHqvk0TYJmKvEVK5TbVXEZEsYheSgw2H5V1tmZ4KipNi0Nvx1sJDh/Vy
         TbPw==
X-Forwarded-Encrypted: i=1; AL+hErFpxYQMhvJsDx/2A2hPIYabl0LvXWWyYcS1ssH8S3i6WLWVchCYqfYTYvoRn5Ng/ypd4HitKef73CJaIoo=@vger.kernel.org
X-Gm-Message-State: APuU4Z8JVFBQAOLASOkcox/FDCvgyb7tmcYyODlonobMVyLsEehZ/7+s
	/YdJki3Q4iUekoSOtbrnfntack9Juey6POISGjJdbOdm990UdmOGVRH7246Fxg==
X-Gm-Gg: AYBFou3Yh4OCNhHODOF4mkmMv6SDJsLdovboHpQqliNhN9L7AZIXp1fE5CwH7tISsAx
	hyzkVFfyMwf5+QbijsIr07dfvmutCto6tcYDdazn9KyOtRHcougvunClrvTxHsKFfFQWBwcdyPZ
	XSrQffInZOix3bcDuaxNpdtgjv9mL3DmKtBo4VZh49L6s0rAeaxaN5qHVRNfVR/Zvwb2AfqGzog
	cIXgMI+b+p5DrViZ+F/7ZVEefHxUd4ZXMVFUdJrvf40Y12X0RJNGLVywhMYHav1XMZ2CQWSun/X
	CE67DXOhKqULN4RvkIgSCPxkTH5SNnHQWeDzHxVe2INqukLM7WvaeAvSwe39Dkfmkpm7PaEmc7R
	RWaGQCcZJeA5Dwcv3HxiVRUHyNNDf+Fk5erFMZIoAU/d0471HAbW0sj3t7GDJI1d8R0bpFLoSA8
	zk5tSaqnn20OvIXwrgK7J666ATZHgBti+6gFNKzfWc0qyXN4uB0BGuRWD3LwzeiHut+N0D2oQkE
	q8T6Qi/44VaH67LEohnUpzPVzVf3aWMx9h70VRhkALfRtxKqeagqGPTrR+WeLvAH8dL5/DT0xji
	IVaHm9q+HJXkq19rd8XxyOxZgZokD5no/Gzyysc=
X-Received: by 2002:a05:7301:fd08:b0:376:6ba5:6090 with SMTP id 5a478bee46e88-37684fd500amr475269eec.1.1794340363843;
        Tue, 10 Nov 2026 11:52:43 -0800 (PST)
Received: from [192.168.1.11] ([2401:4900:881f:d9bc:11f3:620a:3333:518d])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3752060899asm8834225eec.11.2026.11.10.11.52.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 11:52:43 -0800 (PST)
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Subject: [PATCH 0/7] ARM: dts: ti: omap: fix dtbs_check warnings for omap
 binding
Date: Wed, 11 Nov 2026 01:22:30 +0530
Message-Id: <20261111-ti-omap-dts-fix-v1-0-19022d1ff4b4@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2MSQqAMAwAvyI5G+gCRf2KeCgmag5WaUWE4t8NH
 mdgpkLhLFxgaCpkvqXIkRRs28C8xbQyCimDMy5Ya3q8BI89nkhXwUUejMFHskze9R1odWZW/R/
 H6X0/auU/d2EAAAA=
X-Change-ID: 20261109-ti-omap-dts-fix-a63ad1ed3298
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
 Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, 
 Mark Jackson <mpfj@newflow.co.uk>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-omap@vger.kernel.org, Bhargav Joshi <j.bhargav.u@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794340358; l=1894;
 i=j.bhargav.u@gmail.com; h=from:subject:message-id;
 bh=JZTgm+NyAQpAi5REbf5X2XAtbqDVD0s3mN3VcZz4p1Y=;
 b=VtTLYyyu3BZystPVhH1Xh4HSIZAJMCd+8yfX6elGU3R5B5Z+24iYkUmTvBpidxaCno46xBFTZ
 et0zSJjufCbCNUPvzWK9u8tOeEHNtf3R0MP8TtcwH1vphOKCnzgZhEd
X-Developer-Key: i=j.bhargav.u@gmail.com; a=ed25519;
 pk=IqNDwUZKECEA+n8wXctFLBbYL9NhFstZNbOznm/nX1k=

Several existing in-tree boards and SoM variants were never added to
omap.yaml and two AM335x boards only specify the generic SoC compatible
causing dtbs_check warnings.

Patch 1 adds vendor prefixes "eets" and "newflow".
Patches 2-4 document the missing compatibles to omap.yaml.
Patches 5-7 add board-specific compatibles to am335x-nano.dts and
am335x-pdu001.dts, and remove redundant fallback compatibles from
omap4-panda-es.dts and OMAP3430 devicetrees.

Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
---
Bhargav Joshi (7):
      dt-bindings: vendor-prefixes: add eets and newflow
      dt-bindings: arm: omap: document missing AM33xx boards and SoMs
      dt-bindings: arm: omap: document BeagleBone family board compatibles
      dt-bindings: arm: omap: document missing OMAP3, AM35, and OMAP5 boards
      ARM: dts: ti: omap: am335x: add board compatibles for nano and pdu001
      ARM: dts: ti: omap: omap4-panda-es: drop redundant fallback compatibles
      ARM: dts: ti: omap: omap3: drop redundant ti,omap34xx compatible

 Documentation/devicetree/bindings/arm/ti/omap.yaml | 107 ++++++++++++++++++++-
 .../devicetree/bindings/vendor-prefixes.yaml       |   4 +
 arch/arm/boot/dts/ti/omap/am335x-nano.dts          |   2 +-
 arch/arm/boot/dts/ti/omap/am335x-pdu001.dts        |   2 +-
 arch/arm/boot/dts/ti/omap/omap3-cm-t3530.dts       |   2 +-
 arch/arm/boot/dts/ti/omap/omap3-ha-lcd.dts         |   3 +-
 arch/arm/boot/dts/ti/omap/omap3-ha.dts             |   3 +-
 arch/arm/boot/dts/ti/omap/omap3-sbc-t3530.dts      |   3 +-
 arch/arm/boot/dts/ti/omap/omap3-thunder.dts        |   3 +-
 arch/arm/boot/dts/ti/omap/omap4-panda-es.dts       |   2 +-
 10 files changed, 122 insertions(+), 9 deletions(-)
---
base-commit: 65f4ccf74634be22d5e57d7159d667845e354c42
change-id: 20261109-ti-omap-dts-fix-a63ad1ed3298

Best regards,
-- 
Bhargav

