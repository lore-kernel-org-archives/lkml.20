Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CC5237CD52
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 06:06:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791439598; cv=none; b=f/rXAJZSNljbxGj8AZC1ZVSZvRno40ouGa2TqiKuAZqDQYpJtdS+CsLhSE6UgXJJcl5JCbnkFPduzexDTC1fD9B8eshBM5Ti9ye440GNIsYUCgcGVBPbRqCtvbdix8zqIOLFdCjsAeLZvSG7Iuk76f8uf411SkU1ipUxm0E7vI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791439598; c=relaxed/simple;
	bh=vRQFQ0/bN/cY2yMjmaiKgpsVQx1nHdnB9AcWyqVzs0M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DmxDEpucGumg/i/h7AknfVJMRTrQVNVzJWS0UAKRuVQPLNh19Z0p+LnYuJJLBxDavntaIBrbKDPUV8Wtz+A1cV/PMwWt/u1EK9mk1Plwc8KXTTdZK0hU+Ohs0T+7r00l2UvkktrtRpGf8XgiXlnzNH82kGH4XF2VANUU+TvGIyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gNpaJ6aN; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gNpaJ6aN"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3a813079a55so198411a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 23:06:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791439597; x=1792044397; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7yznlhzA/LCCyg8VcHmCAqbKM1iwate4R5ON9EtsImI=;
        b=gNpaJ6aN4qfxeYrHAJjEnCiNAsmt8BCQMeNTv4NXdZoMM7/Di9O19X6mEvH0d9Git9
         KvvKUzeovHNNBLe3Ssl3GlSIum5hf3zBoJ2vLKIfl8HyO8PsTAp0msXPk8L0j6MJV2Lh
         0ZqxgeJkQyc1e3afqx1WdqLNfrSUBYCuYsILQ2wCm3Sx4oiBcF9TCltO4ybk10pB/mBy
         Hdms3WI0BHOBgerPxcSsyYdOdf/s3V00uyVUhWd7MVM7xG9laeU7ib/o7WOneGgxLrFw
         tgRNrJqpY4EPW4XzcBMS2LhhuClxO3DRPlE6HO43yvNaF6RAR6g9yxXKe8Zhofn6hBVq
         ssTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791439597; x=1792044397;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7yznlhzA/LCCyg8VcHmCAqbKM1iwate4R5ON9EtsImI=;
        b=DODS82kfcQ5MjfvT8d61ERLTCdjNwaKc4Obvj+aMMqoTF00yg9mF037ExQnteWtDMV
         l45CKgnnUOnJLAI7SZRwpDPF2f67+NIWab7PNtLtN78fhM+yB384MTUMTv5ZJFYAzmMM
         JIXd65JhKlJSAmnnyxwIaQI6aIjytlT2IgWh/EX9pkWWQyw7uzA7a4Z14OUvXSXQ7V2Q
         MX7sIR+3V5fRtEhdhuS1PAp+A2Xhy5CmD7kciyU0Ep+glavKtC0Q/Q8xCk61hd6RMX5B
         DsY/Ld4mlTMVSm4S0cK2rJdAUllf46HpMqmXmqEgVtVuAZStwo6roUpX68KuooziFFRp
         DtrQ==
X-Forwarded-Encrypted: i=1; AKwUvBxdtK7TMA4LU0+e8mIcD20+gY6GCApX56O7sdzKGbp2C3WIBKewxk7Kj5iOA1A/FBmvUdnu8hGrCl8wXMA=@vger.kernel.org
X-Gm-Message-State: AFq9FYKKaPVrNwsnNCLnYjFruMFMssv0oxsDv2jS1AhHl+UzWGhwvNDQ
	jOteNoGasAvA4Y1+zkwyfFhl1l2+8YmmLqz1gNMS/HIk7dSgnFU+upS6
X-Gm-Gg: AYBFou1zhviiBxuBCM2UBF7b4QVVDqRALkmGQ4ICAOIYQI+XkI6t82Rxbddf5ShPIkg
	w7aRQXY0EDxU1Sv9iswRMK1ugwkxBFKYf1ChTJTqNUdyZVifMdRt1RNwDyYc6WaFvDHnl4YaUBt
	LR+hyfYShxEdxk8pZ92SIuSj2yaSczWoiOo5+idjckWm+a0nu/xsUIoAu24PFeLRbwg1A/LlTUc
	AtV1GSKB9qxSiNiOVzB3EppolK08QYe1p0Fmepyt45TTPvAsyz37cNAZ6hZz/DT+soKdz89DaAm
	tODDBSSuNOkQFQrWs+Av1QQuiJ3OH3PdQjlS9w2KxIDT+YFc9DQd7QvJeq+/W9t6VCEVedA4cZr
	ZNI1t1AJ/vZpOUlNJUlEsbr6cdNfIHNXbNVy0vJ6e/AfYi7Ses+TDIPc8thBFvW0D/rI+v2C1Bm
	FKoM99ow/BYVX/IZxEPsWnAiUQVcYQB5LEn82ntLGE4JApiO+ma7sD5wEmRNRtqaHW1X7efcYEC
	U19dR9Svp039bNNSlfd/3zEv1ADqBQVZYnSi0mr/4ARGS522zaTlRfFtF9XbWUyOmX/OXtNgg==
X-Received: by 2002:a17:90b:1347:b0:3a7:9ec3:ea0e with SMTP id 98e67ed59e1d1-3aaed7c10c2mr702874a91.22.1791439596767;
        Wed, 07 Oct 2026 23:06:36 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3aa0cbccea3sm2632203a91.15.2026.10.07.23.06.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 23:06:36 -0700 (PDT)
From: Joey Lu <a0987203069@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>,
	Hui-Ping Chen <hpchen0nvt@gmail.com>,
	Joey Lu <yclu4@nuvoton.com>,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Joey Lu <a0987203069@gmail.com>
Subject: [PATCH v7 0/4] phy: nuvoton: extend MA35D1 USB2 PHY driver for dual-port OTG support
Date: Thu,  8 Oct 2026 14:06:25 +0800
Message-ID: <20261008060629.2736806-1-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The MA35D1 SoC has two USB PHY ports managed by a shared hardware block:

  - PHY0 (USB0): OTG port shared between the DWC2 gadget controller and
    the EHCI0/OHCI0 host controllers.  A hardware mux automatically routes
    USB0 signals to the correct controller based on the USB ID pin state.

  - PHY1 (USB1): dedicated host-only port for EHCI1/OHCI1.

This series extends the existing phy-ma35d1-usb2.c driver and its binding
to cover both ports and add OTG role-switch support, while keeping full
backward compatibility with existing device trees.

Changes since v6:

  - phy: update the copyright notice in the rewritten driver header to
    "2024-2026" instead of "2026", preserving the original 2024 date
    rather than dropping it.

  - phy: split the unused linux/io.h removal out of patch 4 into its
    own patch (3/4), since it's unrelated cleanup that predates this
    series (the driver has never done direct MMIO access; all register
    access goes through regmap via syscon_regmap_lookup_by_phandle()).
    Placed immediately before patch 4 since that is the first patch in
    the series to touch this file.

Joey Lu (4):
  dt-bindings: phy: nuvoton,ma35d1-usb2-phy: extend for dual-port and
    OTG
  arm64: dts: nuvoton: ma35d1: add USB controllers and dual-port PHY
    node
  phy: nuvoton: phy-ma35d1-usb2: remove unused linux/io.h include
  phy: nuvoton: phy-ma35d1-usb2: extend to dual-port with OTG support

 .../bindings/phy/nuvoton,ma35d1-usb2-phy.yaml |  44 ++-
 .../boot/dts/nuvoton/ma35d1-iot-512m.dts      |  36 +++
 .../boot/dts/nuvoton/ma35d1-som-256m.dts      |  36 +++
 arch/arm64/boot/dts/nuvoton/ma35d1.dtsi       |  65 ++++
 drivers/phy/nuvoton/phy-ma35d1-usb2.c         | 286 +++++++++++++-----
 5 files changed, 390 insertions(+), 77 deletions(-)


base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
-- 
2.43.0

