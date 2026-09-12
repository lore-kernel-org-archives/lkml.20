Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B78847A87A
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 12:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789216106; cv=none; b=rLdvfSF3ykUH90OZbf/dYi4ChNrdzkm+Bp0YOgI04pCzjLBoWAvOna1j90aX91UuUIXvBMxhJz6wYt9RcLvUtNGOZw3mfnTJ9dC8ht50AlmEt6TssRcVdLZrsuPF1Izpif552MWBeb+Us2kfOGk5Lc9uIvmiK7HWvCMvSdNFBl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789216106; c=relaxed/simple;
	bh=06OCCRLJZiWFmko6yn+El7auSYo4iw4lQ+pGHqY4J3s=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=GkvbogmAj050rk939BV9NItRGVzrwUiqmGqc9r5QGN3GxeBhFu2gi1vS9a8QTUlIPDYHiL091SoqeziujxSp+nJ6k9evUtrT4NTagv+uFkZfd/0TnPeYlB6veDqv5Tt6pd3/Bi6DqGGyoLABQhQwv0zGBHVzNp3dr+oVoo73VIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BhYPyA9I; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BhYPyA9I"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-86a25369f16so1430886b3a.3
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 05:28:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789216104; x=1789820904; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=oe7EXYlzw5spJ4MGmK2TXNFq8D9C+6xPH4nivENYcuY=;
        b=BhYPyA9IrNZBzadE/xwuZhtWgRAC8lgeIBzDTaC2GcEnwP4TqINJO4sPJcir14Ucl8
         HokL2QWEvU8n8kHYaRc2MSM83FSTSzMGyHKyXt5V9avbymkSBjzU0IBseZHfOhbRENuV
         id4CiDzkufYLl3vnIiQnErwICdxzjExoh3sF1EoXaOS8+4rlqfzqHIDcysa3fDnzd3X7
         W16OcGrgE6kwustxrpONo5mufCKfCYMI+dbkou2cE5Wz0i8bP9pYi2R6TY0y5pX/H6RV
         1RAX++MPxplV2yNaxIr39O3kDcer+vFlbk0M+Dyet50no03kDxYOWumQFPswqZVFOIzK
         yKnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789216104; x=1789820904;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=oe7EXYlzw5spJ4MGmK2TXNFq8D9C+6xPH4nivENYcuY=;
        b=YRjGNqe4WhAjl388A2HSz9kdR0Xqy9HzsfxvPAiNOHMx+mhV5MBC24/ebpOPWJQapN
         6A/z+l0hCeK2Q2QXOIYSE+y9yxBVP8pvpC5eZ24Mp1NAAti2vwL3vksUkmnrcbKyoTdd
         HiTJIrLZOtllD6MUDQDKFXuSGvpqCs3cXl/hwucL9aNeIEjocdTMRuMLtLTzun5xQzab
         0xBYTEhzukEt8oqaFrbJhcpqOxDyAfO3kb6/UZfyGCzMSNTD3gWTwLXQVlRI4bGj4G62
         UGvRuanMa2m+E0Kbihxl22b115hdy/m/gT2LD9DMV3BddVVRK9w/z+AzqiEjcqMz43wq
         ylaA==
X-Forwarded-Encrypted: i=1; AKwUvBwqNgUxneg9yZpcCw4vJo6pyP6UVgh2EOhnq1TvQVlUtkoydQG2V/nXVzK+w2/H04xC5WPsxa3QHrUlG6Q=@vger.kernel.org
X-Gm-Message-State: AFuF++kF19S0LwEY4CFnFR/QFzRNPfYbYaCM2XVZY2k1WCL1+Kz0ooYj
	ELfO6pb2vvt5QWgoa2valz8+v5tEJm6E+c9KTtOAcpH0FJZCmHULS5cB
X-Gm-Gg: AYBFou3x7VaYhjrjc1GV5nOU+M4B88D1lnaCn6Dvg0Uct2AZfVfyIrtTHbIZ+stf/Ly
	x2iWfm2EqvoKQSYCyw6xzEpgZaSqm+wx7jbrB9sVfHOeX4cTA1EjCAqfcTldjL7caB/mo2tXGyT
	0J6A/hfw4ygd0gQIwXKmeQQlP0y+pSPLzTTM48w3hnl0EVbcrl73IS6lwa4T8LXlBWj4cC3iDk1
	Z2IzPI6NCeBY9GMqC/GdhWS2aCP+8GW+EgLLRWQDsaZd9ih2gMzyDbTj1sYwvmND+NVCzMNVG+w
	jJUpdd0mxVU+kmz7JYDjaM3JGg/yIiAbAB0MTEANWRJ5ZawzIe9l04hnLMRpftJxJpW+7i926N8
	OlxgF8U7RAfEi3ArLuxlpYjGlkF4eLvEjZ8Dry2nUCSr+S6WUURwBDGaErmo4+8qdxqdxfjucd4
	THw2e5/sw2UpveuSXzDiP17u+iNQVtHUIavyocCBEqVFXdu4B+Sgcn1QH8R845ChE=
X-Received: by 2002:a05:6a20:b08d:b0:3da:6bdd:2308 with SMTP id adf61e73a8af0-3daed5d1814mr17126253637.18.1789216104145;
        Sat, 12 Sep 2026 05:28:24 -0700 (PDT)
Received: from [127.0.0.2] ([2404:c0:701d:4e35:aab7:8c01:68f1:4912])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc4c65b1a63sm2512427a12.31.2026.09.12.05.28.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 05:28:23 -0700 (PDT)
From: Reza Kurniawan <imkyufie@gmail.com>
Subject: [PATCH 0/2] Enable USB support (peripheral mode) for Xiaomi Redmi
 5A (riva)
Date: Sat, 12 Sep 2026 12:27:32 +0000
Message-Id: <20260912-riva-usb-v1-0-0acd5cf8c62a@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQ5AMBCF4avIrDWpJhVcRSwYg7Eo6SCSpndXL
 L/kfy+AkGcSaLIAni4W3lxCkWeAS+9mUjwmg9Gm1HVhlOerV6cMirCmyVisKouQ8t3TxPd31Xa
 /5RxWwuPdQ4wP6sV+cGwAAAA=
X-Change-ID: 20260912-riva-usb-ec9ef25c885c
To: Sebastian Reichel <sre@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 Reza Kurniawan <imkyufie@gmail.com>
X-Mailer: b4 0.15.2

The purpose of this series is to enable the device to act as a USB peripheral.
It enables USB-related DT nodes (controller and PHY) and modifies the
charger driver (BQ256XX) to expose its VBUS state through extcon.

Driver change is required since the device has its VBUS connected to the
charger IC, which means cable connection/disconnection events must be fed
from the charger IC, to the controller driver to dynamically enable/disable
the USB gadget functionality.

Signed-off-by: Reza Kurniawan <imkyufie@gmail.com>
---
Reza Kurniawan (2):
      power: supply: bq256xx: Expose VBUS state through extcon
      arm64: dts: qcom: msm8917-xiaomi-riva: Enable USB support (peripheral mode)

 arch/arm64/boot/dts/qcom/msm8917-xiaomi-riva.dts | 17 ++++-
 drivers/power/supply/bq256xx_charger.c           | 88 +++++++++++++++++++++---
 2 files changed, 96 insertions(+), 9 deletions(-)
---
base-commit: 68142f986ff04b2b70b31db00f719bf690f64a9a
change-id: 20260912-riva-usb-ec9ef25c885c

Best regards,
--  
Reza Kurniawan <imkyufie@gmail.com>

