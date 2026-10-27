Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793136603;
	b=GoVNkM+KPDUn0Bc3S6r5ulmFHHdCgVmVbLfxzWOI+dTmfR7OSTjBcaA7jztZCXkaZVZs
	 DxcNRmnHUYpZ1sz+h6Ks5GgpflgLRM/N+ojTfBv9SzGPaAxYzg4lP58fhgBqBgEa7FucS
	 O0mbDBQ+l7kuu9vC36EiX+9hgUIMTjrr38Qdnln3iYqrwUAHCgLKbe+EwfFZSrnPj/H7A
	 QTfxgsJvi7icQaVE/UB6YPATSPOEC8qcQR4Tc79YE7Lvh8/tTln9wZVUCvRBtiudXrmRL
	 5K3C75anXnkFItCp+AJryUDvhJkswW+OVJxy3s8nJ3hjDNuphpPldKsY6uol15hS/Mg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793136603;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=X/hQ+PibmDW7TqdpOhk5donfJe8MwWu3WLcD5XbFhlg=;
	b=AxTyhosWtX/pwT0ejr2Z3HLSaBcXsw92FcbSs3E6lWL5ooyV8uTUBm7SPePvcubFFFJh
	 M8xMhTP4F0KVs3InVnj3ky3s5oq85AdNMP+JwS+dpv3KMIxGBINABZlpfJCoWkoiVTiR7
	 ARgHIps9s0nLtj6LGA9ORUyk8lLIenfeS8dncsK7PcJGkZ9co1pJecnRHDFKEsucA64Lz
	 ixujK79/AaTfym8rEelhr7oqzbTcSQq3gK93zOBqV9DWNHm2yXZTuU8i9BieApP7nsq3b
	 jKwa2bVgnViV3XU0LI8Qk1WP1+m+vDWPLFew6XGS6sMYkhcfsgh3YJ9WuQCOBMcgQtA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sjYdwL5w;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1CD9606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 21:30:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F1CD9606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sjYdwL5w
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso879037eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 14:30:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793136602; x=1793741402; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=X/hQ+PibmDW7TqdpOhk5donfJe8MwWu3WLcD5XbFhlg=;
        b=sjYdwL5wxM+HRiApAJpmIxcR1QkNSobITLQX+78/9zaAgfOT917BPtC4m6unEr0F1L
         U9Bqkxy2WVHU8Utec8/R8It/NOpSIvrKdo+yl10zkJINaYakkwDaFsTzOXZUwP5fCGb/
         zBZI0FX+9dT13cRRL9/JS3BsHV0+cPyRzvxNRvqyzSNAZUxZWiegCh/htQAfwruzMpPR
         yHdDGTGCMKw+ezS2laWwfzXW4XZHja/wad3mqIV6nRIckT6fRFNQABlDS4xSUrQDt+QH
         M0Yru/0o9qgm+wjq7VlT0Ifttjn7IBfYUyPKSNYzSdwjgOa5FCZ0VQg63SlOXdcSV6q7
         FdTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793136602; x=1793741402;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=X/hQ+PibmDW7TqdpOhk5donfJe8MwWu3WLcD5XbFhlg=;
        b=F3CLuMt61A4Jhft8dCZc+ZSUg7eX1hETTHbMpzzi2puaPAQjs9HD5UowLOsj8iyhQJ
         L2qMrKpQLBUgd7IaO29wlK6VQqtUlg8WGScT0vNlZQ9PF+kIQzug25xui8Kkb7w9iie1
         iKAXxttuFi9urLrr1FD5uT32uN0KZm5J0QirlQ+Er3KKSyDK62aLMOLZGijdgFazqZqW
         HjL1Spi4YmSUuW9HlR2ka8M4EcifzXJTy2VIf5h9uNuKLm1ta13ebcl4Z724S5eLIYnB
         AqQvgf4/V1TaIcYsj6kHCXkPPJY5uz6+2nG6cgo58AvsdP/GYPpEfwGYus3xz0yBigw/
         6cIA==
X-Forwarded-Encrypted: i=1; AKwUvBwjYd5jrXV8H5LKuBaCx6RkUH9m1007rF6pfVvf9ZiW2H61Vm8yQjVK/F22tj4HSKyRRYNdjuW2+4e5MA4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJRdfzGCrZ3GWiPa1rchzh6wVXj/w/7ALEjYqAtHtEXW8OJ20HF
	NT2vTfJKsi9k3t1s03FeHyduyuUo39YaMs9hbBTdwusUH9bQyU+9AbDD
X-Gm-Gg: AYBFou0QY2XPhCKMCLVaEv0TcOEJv/AsuQ8TWY2PFrKZnsudMrHLqnqzX2cxcmZi628
	3JLn+mCFmVf7/5BFgp3Q68o/zr05mm6X4k7ZJHfWZY/ktIltvbh0CRkSV5Ss6pqd9iodkgqf9yj
	uKxFtWIIjWvt3aHZt5KVW6bbauNFW/EUB5u1VY+lssxNYB21bjKy77CQUE9WKUvU/+II2iy4OTX
	0/L4eUyNfUZMtigc9sAabCZERxoUiBe3UYDMpNX+XV4n3Vvof7PySJI3MfiIpJBMWD5XjS9m1OU
	4fpefUdl49Gu/sDooo5jNFL30UX0a/0Uqy0hndfOkZfdRMJmaIS0BG/DHyrtRl1Q5CgA0MUVptQ
	u/XubtZfN9exJmVi6aN6zgdyS/hlsATw1JrjfZV+r5pgT5sDg4mTydu8uqdCnZ/k9zU8GYRtUI+
	ikV7bTpcGuswhO+pxc4WoQvX+N7lRk/5wnjqeFgO6ol8t5Sk9zai2SyuVYIowi91dOx/XnlUZ9U
	ud7UXKTXes7ynCja7OFMpQeGcG5QqxQKMvoHSZ6qlV1sVrDQTL/neNCa4eH9onmRFlmhSmRl5Qm
	75UzsSZP6BVZjCOKU1d0u2ZK7H7Z3PjJagbAvb/QK1tQ
X-Received: by 2002:a05:7022:ea8b:b0:1a2:a5b1:884f with SMTP id a92af1059eb24-1a6ce2fec4amr557384c88.31.1793136602060;
        Tue, 27 Oct 2026 14:30:02 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:9958:9525:7799:82b5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1a6d7ed488fsm723725c88.7.2026.10.27.14.30.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 14:30:01 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: [PATCH 0/4] ARM: s3c: crag6410-module: software node conversion
 and cleanups
Date: Tue, 27 Oct 2026 14:29:54 -0700
Message-Id: <20261027-crag6410-module-swnode-v1-0-2f885799b6ad@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIANIX4WoC/yXMwQrCMBCE4Vcpe3YhiSWoryIe0mSsK5pI1mqh9
 N2NepjDd5h/IUUVKB26hSpeolJyg910FC8hj2BJzeSM87aNYw2j763he0nTDazvXBI4IO53g3f
 bYCy186PiLPMvfDz9rdNwRXx+a7SuH5Phj4B6AAAA
X-Change-ID: 20261026-crag6410-module-swnode-aec98b623a01
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Russell King <linux@armlinux.org.uk>, 
 Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>, 
 Mark Brown <broonie@kernel.org>, Lee Jones <lee@kernel.org>, 
 Arnd Bergmann <arnd@arndb.de>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 patches@opensource.cirrus.com, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.17-dev-e56a4

Convert extension module definitions for the Samsung S3C6410 Cragganmore
board to use software nodes and property entries instead of GPIO lookup
tables. This also fixes GPIO chip label errors, corrects the WM5102 LDO
enable GPIO lookup name, and drops the custom WM8958 device name that
broke regulator supply matching.

Additionally, remove the unused CODEC_GPIO_BASE definition and switch
codec platform data to dynamic GPIO base allocation, drop the empty
wm0010 platform data, and configure the S3C_EINT(4) falling edge trigger
type for wm0010 in board setup code in preparation for dropping
platform data in the codec driver.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
Dmitry Torokhov (4):
      ARM: s3c: crag6410-module: convert GPIO lookup tables to property entries
      ARM: s3c: crag6410: drop unused CODEC_GPIO_BASE
      ARM: s3c: crag6410-module: drop empty wm0010 platform data
      ARM: s3c: crag6410-module: configure wm0010 interrupt trigger type

 arch/arm/mach-s3c/crag6410.h             |   1 -
 arch/arm/mach-s3c/mach-crag6410-module.c | 202 ++++++++++++++++---------------
 2 files changed, 102 insertions(+), 101 deletions(-)
---
base-commit: 20a33c6b6cbe7e4805dfb6cd68816937443aa148
change-id: 20261026-crag6410-module-swnode-aec98b623a01

Thanks.

-- 
Dmitry

