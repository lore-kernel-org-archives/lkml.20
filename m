Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17CD050AC23
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 13:13:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792070041; cv=none; b=Mjboko9FmFcbrq51QOYSvvGItoCVzLrKe1WIHF6ZuG1hbASn/0i29cJ1D7mG9p+42AVmSj64p0sme+LQBrV52Dc9EHLIaAfnK4++8TpwzRMIxl+euxE5rK798w905yddQECVdZwBwaHbHcdAMxpiCxX3oC4DuaZen0tOcERilIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792070041; c=relaxed/simple;
	bh=Cy4FqW5s/wsMdOpXtYQKO+J6TB8GbKalMxQwWeOkqh8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=oPQ7tWyP0Mzt9t4P2c3kxnsTkdJIeaKz+eCs/3IKvwwefflWL+kBmwDPywlrJtP0Iwwa9oSpFFiPke6lb0OOxukO5mo5qbtFsUPjrX3lwGWx+B7qyWE7WGoD99bDDCY0rtPlgGQRMs++4k0OSbqHmxhwxiJU9iOq0eG2Y8YjUD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com; spf=pass smtp.mailfrom=konsulko.com; dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b=Vu7ccA/G; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=konsulko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="Vu7ccA/G"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48afcd7ba9bso2954012f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 06:13:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1792070037; x=1792674837; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Lg7Afv2MbybCWKsvSIcXXsArqfbkDY1tcbjpvlWAZvo=;
        b=Vu7ccA/GS88VOiTYcXy2lAXsokuu9gNlYqtFJiEfwawZgpsycNWIY1hviRfKDZfcvD
         Yn3oAD2FG9PU4F2q8VYBfFZQVuQsRK3N03IJuUgR38+cMCXf/4naplkTB6e16czKW/bx
         MIHuxNrivkHl2123CoHfA36EEMI1TwsgAjqHg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792070037; x=1792674837;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Lg7Afv2MbybCWKsvSIcXXsArqfbkDY1tcbjpvlWAZvo=;
        b=0FOFajZAeQpgFxfqqOJIEKXO+nCuZpcnp5KkgYEN5MgKLnCdF3eY1G4ieiT2hDpnI3
         F4r4rSM+jitriICD4kTir2cxcG6weOBZAH6Pme7rfS3DJbq4G9T+bLSq7CI6qW2BUjoH
         xzKevYbj7as7Sv4f0gCgB4as+I6rjB3gc2rsHhKwhAT6uxOmNf6UFLi3AOxURJ/dpb73
         blTAfhmWHnZAKEW52FZSAgjfJlLoQmIpkADjN7QOLG97GPYN8N1/0Y/kG9oVKbeq4VU5
         hfeep5C/6g4j1x4vYL1LlK7qapsmFRAuOd7mFpwX44z+prti3JUJTY4p/gFgp/zyFqg8
         v3bw==
X-Gm-Message-State: AFq9FYJuX+mnXXqc9QVRUVKoG7OFpK9bhcwZd7jRgNrU9q5wDbQ2jYhU
	TBqnoil1Sq+auiQ+lRA9MX7GJmxmSv4FXNpozApsMnhuqQ3j2McqIlC8feu2fL+LUkf+YNjY48q
	oyzHW
X-Gm-Gg: AYBFou382eRi+ZgxzTrz74Pmwf0sl/lzM9VQMhehbqZ/tTxhEGV/hRrHG0Z9xq5KAbj
	jpDfkPLaxKGUpP5+J0uJxZiA+MobH7Ls1ND4DHL4pM0LUfj6Cquey3X7N7q2DR135vFARnwfStO
	2MQwP1IpXtToSkrNfCXQT+m/IcW1SUc6C1THE4vTYhE/AwiWZAnaWnRHvCa078h+N1XvuG0KWQz
	kLmLYk0gmXYClxr0TkPOCAvx/8nomZoJKs9QVpwRhWOQ729AG2oFiIbUuzNxGhm8gC5bpDHT4Jv
	PEtaZkNjg2r//IFk2oFHq48YAn77lAbIGuOLoZJIOL1fh22eb9skHc+SY4D3HcOj5Jo3vKOvIek
	Pve4Y1NObw8QGY8Y6uHnl9I9e+kkyGsfKEPlsO/0Cte+WNTYHMq6+2Q19YLWIbN5ffzXfSI13Tk
	o+CGSJunIwKiIo5GoHjSEHbY4Df20I7gCwj1dvKOjVe+WHiCb956egPw68yaoyj2rnxI5LM0+jk
	3r4MP3nJx3FQMg=
X-Received: by 2002:adf:e013:0:20b0:487:930:8acc with SMTP id ffacd0b85a97d-48dbaaddbd5mr27462050f8f.16.1792070037349;
        Thu, 15 Oct 2026 06:13:57 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0ac36f9sm17807433f8f.36.2026.10.15.06.13.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 06:13:56 -0700 (PDT)
From: Petko Manolov <petko.manolov@konsulko.com>
To: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dinguyen@kernel.org,
	arnemaximilian.richter@draeger.com,
	martynas.grybauskas@draeger.com,
	Petko Manolov <petko.manolov@konsulko.com>
Subject: [PATCH v10 0/3] arm: dts: altera: add Draeger M48 CPU board
Date: Thu, 15 Oct 2026 16:13:48 +0300
Message-ID: <20261015131352.3624327-1-petko.manolov@konsulko.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Adding the device trees for “Dräger M48 on NXP i.MX6 (Q) and Intel/Altera
SoCFPGA Cyclone V” board variant.  It has both (the SoC and FPGA) on the
same carrier and they are cross-monitoring each other.  The SoCFPGA boots
independently off qspi flash.

This is the SoCFPGA devicetree part.

and in v10:

  - add device_type back to the memory node;
  - move the compatible string under the phy node;

news for v9:

  - remove the name property from the memory node;
  - fix a typo in a comment;
  - attached phy-specific skew properties to dedicated mdio phy sub-node;
  - add Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

now in v8:

  - modified draeger,m48 to draeger,socfpga-48 because it is more consistent;
    with its other imx counterparts imx6q-m48 and imx6dl-m48;
  - dropped gpio3 and gpio4 bindings;

new in v7:

  - replaced module with board as this seems to be confusing to some;
  - add Acked-by: Conor Dooley <conor.dooley@microchip.com> tag;


Petko Manolov (3):
  dt-bindings: vendor-prefixes: add Draeger AG
  dt-bindings: arm: altera: add Draeger M48 dual-cpu board
  arm: dts: altera: add Draeger M48 CPU Module

 .../devicetree/bindings/arm/altera.yaml       |   1 +
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 arch/arm/boot/dts/intel/socfpga/Makefile      |   1 +
 .../socfpga/socfpga_cyclone5_draeger_m48.dts  | 101 ++++++++++++++++++
 4 files changed, 105 insertions(+)
 create mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_draeger_m48.dts

-- 
2.47.3

