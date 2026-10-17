Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04EE838F950
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 17:52:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792259552; cv=none; b=gLN4XTS9V/6GGDkxwLegWdlp3iFa85C4KTdO3MnR883JN+aLcs5R7JHcC+yf0vrs0++MYgrNSSGgSQ2gG0PVPU9MY/xz10Wc8k29NbflnwLT/0GI28T6HpvZ/IKrDARESx/uSvUNqifPAKHryftvG5sazWYBIKYfDAnu2c4RHZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792259552; c=relaxed/simple;
	bh=RvyyXJVT6NTkKHJtv9luXFIdJPR6X9pRfsnAcFViff0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=b18qK3MBMPrktKAItI9FWhs0R0HHuvHxPQC383XkL3V6fJRUAiUTwip2SSoh7irMKQ4umKKBoyc8i8vRK9fUwNERaePzlOd1o656tY3K1dxoYfpByBnWFr6J6mwYQHDfs4trQnBijNVK1cnpqxA9LCagMMl50U/Bszir5wxV2Gc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=es647pKA; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="es647pKA"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48afcfc4bf5so625738f8f.1
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 10:52:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792259548; x=1792864348; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=KCsJp0MHB9uPiSNtf+Qp5XQzhNWphBRW5nGkjAoSi2s=;
        b=es647pKARD2ocvS6U9LSOg5V6B6SYPDghpGj98XZn07GcNR7F6STCiW55K9GAjYibH
         bBOSUwOcaz8G8GOQXmJgEN2ElYB68TP+MY9chZPoZsiNF25toKw6u28cXDhetLb5Tp5/
         kdSqW+4OKxfwdsKSeEv80+7XtAr58Siui581Rjbd4cp+1+1/OTmj0naK5VO+SQhDfqV+
         inlGHgAHHj34AT6LdjT1iJRKQhds8t6XV9LvwWvxMh6+5kPTevznK4r7ipfir6KmRGbE
         uDQXqCQWldGRhBLfbrzpeVPdKQ1BRztjC/DqWmcAXS26x8/eThKdI+lmIUWxfgZcXzTV
         zoRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792259548; x=1792864348;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=KCsJp0MHB9uPiSNtf+Qp5XQzhNWphBRW5nGkjAoSi2s=;
        b=Da7Ne+1XCwf+OiF4Xv+wkjrinzqXIglGQf0NGw+CimMml4F2SjcAAj1HflPsf1AV3b
         Ay1JtzPlm3HuMYxDpAcURAU6iWkADHMWqiREkis1spUZOxUXAlyZ5FCGIjTSeQ4S5SE9
         Egr/eMPWE8gXQ2auSt8dMrJl1aJICZHYFW2o1HPsnxJWp2pWRz8goo4WKlpeUC6rqHet
         QTCqF2nAV2/L2/D+qoOBoC5cDvma0nisPNIkoD1AoubsnCrtYTWh9yeGLWQ09KIcCwh3
         WG9FDiVM9Tz9oYHGP/jNSfeIQGeGZUKMB/PgIVqPmnlpqEmu90YJWpxn1BiIO3v5j70s
         b8vQ==
X-Forwarded-Encrypted: i=1; AKwUvBxfPe+MsjwMb6+mujiY+MCPZ9Z4zyTxezeeCy41/IEbSrhqUeNF6aBqYcxGU1p22kJTMQUwAhl40Rle/BU=@vger.kernel.org
X-Gm-Message-State: AFq9FYI+/s9EA5LXGCycnbKrvrjRxR+89ga1mfNNutvIq0OdMTqdWiEX
	Hm/sy58TXgYBff5eJMXu3X6SWPTmiLsKRjEH6pyq0t7KjchukzqMe8or4a/wUVyG9UJxCw==
X-Gm-Gg: AYBFou06wZS3W3qF42T35Xg16DwOqMHClJclnuwYvYnEXZ61GaW44Vep2aYG5dq8YvW
	90aI/zO+dyJAASgEB3pMM0nAfSAG0i9BlFsJ9/fHeYhIQHyalKVbD1qZ563uUrJjg3yZLSqh236
	DU5OjQZrAGiZLC1GcJCQOnXHm2xym8lvaCv/WIIpVMIlN66eAAfPhxiDS1q1FvPTKF4ByRDtZjY
	lCd6aW7v1HLOl9aby+9mCSs+oWqL9VDmaaG0lbzUs5JHDX145XNgNeHARaAF2ed4bwPwAMeG+Y5
	BNnuYy1CScvn4OCVOgC3wtYnk+1JkTvne4imzk5qgxk9pkOrEWOn7TrcecMh/U79qLw8jfEYeE2
	MJZXLpFh7pWIDe4LPNSJPPmhL+UUZIl47T//vd0VWwsMzeI8kDP3nLv12LFXQrpwEa8jD4D/LLL
	e4c9CVx08sZFR/qW+eA50uzHaFeqwsa7ZwqF6LH1Rmt659bZt82qMm2uinuY89S+aBDOZeOSaDr
	oFkVu0kSQPVSEXEnyg+ekcNj4ZD3A==
X-Received: by 2002:a05:6000:4a0c:b0:48d:db77:d119 with SMTP id ffacd0b85a97d-48e07975a78mr6303403f8f.2.1792259547901;
        Sat, 17 Oct 2026 10:52:27 -0700 (PDT)
Received: from [192.168.1.3] ([148.252.146.238])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4c5942sm18263626f8f.16.2026.10.17.10.52.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 10:52:27 -0700 (PDT)
From: Dale Whinham <daleyo@gmail.com>
Subject: [PATCH 0/2] Backlight fixes for X1-based Surface Pro 11
Date: Sat, 17 Oct 2026 18:52:24 +0100
Message-Id: <20261017-sp11-lcd-fixes-v1-0-0eb916c01a3d@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqDQAyF4atI1g2YkYnQq4gLHaNGxMqkiiDe3
 bFdfjz+d4JJVDF4ZydE2dX0syTQK4MwNssgqF0yuNwx5VSirUQ4hw57PcTQN46ZC/aeCVK0Rvk
 Nqanqv21rJwnf5wWu6wbo9k6pcgAAAA==
X-Change-ID: 20261017-sp11-lcd-fixes-5a2666365561
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abel.vesa@oss.qualcomm.com>, 
 =?utf-8?q?J=C3=A9r=C3=B4me_de_Bretagne?= <jerome.debretagne@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Haipeng Lin <jimmie.lin@gmail.com>, Dale Whinham <daleyo@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792259546; l=1468;
 i=daleyo@gmail.com; s=20251214; h=from:subject:message-id;
 bh=RvyyXJVT6NTkKHJtv9luXFIdJPR6X9pRfsnAcFViff0=;
 b=Lf+tmZ/tKY+2VhA4g7bV2nLyZfEMVHO/BXOXlCEPoZzWEJp5RaWPdCOobZeVPmlmkzDNwQer8
 TKhCn7sZHIUCWWxUlSDF5xvn1/oJZY/vR8SFJ85S60vcqFdGGkiR8Rl
X-Developer-Key: i=daleyo@gmail.com; a=ed25519;
 pk=M4mvgx1TB2TniKaedTDsO3PbLKgFosJuegXRXPbn2Ds=

The LCD variant of the Surface Pro 11 has had no working backlight
control since the device was added. Its DT took the panel description
from the OLED model, where pmc8380_3 gpio4 is the panel enable line.
On the LCD model, gpio4 enables the backlight instead, and brightness
is a PWM output from the PMK8550 LPG on gpio5. The supply is enabled
by pmc8380_3 gpio10. This is the same arrangement as the ThinkPad T14s
LCD and the Surface Laptop 7.

Patch 1 describes the eDP HPD pinmux (gpio119 -> edp0_hot), which the
Windows ACPI configures for both panel variants. At the moment we rely
on UEFI to set it up.

Patch 2 moves the OLED-specific panel enable and compatible out of the
common dtsi, and adds a pwm-backlight node for the LCD variant.

Tested on the OLED variant by myself and on the LCD variant by Haipeng
Lin.

Signed-off-by: Dale Whinham <daleyo@gmail.com>
---
Dale Whinham (2):
      arm64: dts: qcom: x1-denali: Add missing pinctrl for eDP HPD
      arm64: dts: qcom: x1-denali: Add PWM backlight for LCD

 arch/arm64/boot/dts/qcom/x1-microsoft-denali.dtsi  |  8 ++--
 .../dts/qcom/x1e80100-microsoft-denali-oled.dts    |  4 ++
 .../boot/dts/qcom/x1p64100-microsoft-denali.dts    | 47 ++++++++++++++++++++++
 3 files changed, 54 insertions(+), 5 deletions(-)
---
base-commit: 24a19b953e2a3d0ea5a8c4951a0ab8f32720c907
change-id: 20261017-sp11-lcd-fixes-5a2666365561

Best regards,
--  
Dale Whinham <daleyo@gmail.com>

