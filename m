Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99F001EFF93
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 21:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788642970; cv=none; b=MIReTCQ9H1gzkO+zTij7hk7vJJtzKeXQIm2iXdYv91zlwAV3+OC9Bp1/tfN4pSdcmcF1UetOWOm5rk0+FXcqT1jDcZBlj25UaC1uCw9cp+tuu6hMbz1TrAwZXS9e9LXEESHzgDOxoTy/zs7ar+KUbuyiWW57wqXNlYDofWPYpMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788642970; c=relaxed/simple;
	bh=7zs5e98dNzg56/13i3QVmPD5pAOk+Ih4sqhBkUg3GWA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DwW67a/2Sjj0ePxXtwIVyOyFyFbDaXbzECT+thXomyQcotdbHfIOHXJm8HVhjEJBJHFCZIFH7X9CxKRlvls7EB1wy7O41YTPypSqJLXHTbqRMitAnysjxuBYoLqKR8JUCMm2fTmoBpSkZaEJB693qDKrsyErVRF33O6vKm4bv6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sigma-star.at; spf=pass smtp.mailfrom=sigma-star.at; dkim=pass (2048-bit key) header.d=sigma-star.at header.i=@sigma-star.at header.b=Rw3leCYU; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sigma-star.at
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sigma-star.at
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sigma-star.at header.i=@sigma-star.at header.b="Rw3leCYU"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-49556f97a9dso17934385e9.1
        for <linux-kernel@vger.kernel.org>; Sat, 05 Sep 2026 14:16:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sigma-star.at; s=google; t=1788642966; x=1789247766; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PlZSpK3Xz/4+7T/z4ljWfbg5RLow9iJYEfMwMkSMVQI=;
        b=Rw3leCYULqubFpsQU4p+wxLQdmvZ3x+qAbapd9nuFrE/KCtNZMqr/UBnZNuyqyNEBb
         q4HxZJ/+vLHMwdw0m94T4jS/ileSpb/EpT1R67b5bLU/qNdD12UuHgc0EMxUIyG4QIVI
         DHA/RHlIpWA5FmyNGEqYQD/X2+MEQ/4EIwi4eZVOw4EGvwqG4lA0WcJx0e4XxKxrXyVd
         pIBfA/SEUY1TN0LkOum9ueotutES9aC8VtbxVRW5e9ucTTdeNeW7JuJX9CIfR6w+zEuP
         21Z29WulWWOOCdy1C9+kJ/M4AvDsDCn712du9UTb4QXnKO/Q9jIVTsOMdR8KCMzHSviY
         EYAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788642966; x=1789247766;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PlZSpK3Xz/4+7T/z4ljWfbg5RLow9iJYEfMwMkSMVQI=;
        b=HyIo0gUxumAGB+lvarePhvN3+qkqzuhoWEGK98D9se9dIN3uRCANqizUOCpbivYssc
         Kacok7EnttvyCo/1qH3zjbSV55CgFhQja4BpMqYjIsuVh7OSyJ7cxg602etHNFbyIxQr
         CKX2yi/9FLvxjbGzwP0bOM+4w7uaXtlHrkxgHIFC8O+YfvEvoKvIh1pS4JiwTHZyxOOF
         5ww2VxwI2PHOk568TZelLgzlDpO1KC+pkUrlWtmw58WQFdRKHWIRU2f1OQj1hK5skjkb
         baefArG+lvxOLGWqQz56UA2kvREcuGLILxiAEcASSVCCSVwN5hzXFPlRKXgRsCZw60LG
         Vccw==
X-Forwarded-Encrypted: i=1; AKwUvBz2RTqOpLvNty4IJKWGFdSSmBAf3xqk3VNP1MuFyqNzkqIyOJtFMSdIU6/dOz1i02NfY18mTc5ViUQlRYY=@vger.kernel.org
X-Gm-Message-State: AFuF++mg+IUbLNGBdnRLmGP/cwkER3ahf7Gc8Cr6GBO1DdfRVFDoizoz
	qNxUIVavv00/SWks5CsEdPTFZzFOUbvbE1fhEyMHQ2UM67ldIKSgBD2TpB57sfS+AA0=
X-Gm-Gg: AYBFou2S6c4uZcqzkYo3vmytp3xOa6UCbmO+tnDzdB3pHGobBEZxme1lRCSAkH2bKeX
	DuTgH2/X6cdnYC/ZGClhj+6mQRbswEP7HPA2SBtmoYN2iybLHL3/fTyx6flwZUougUPoiDkiRYc
	Y4tx86p3+4/vuqFN15t3Lc4Ev0o7pDXOgAXLJdiL8Qnye4HFUd3CLuhy26rtt+JOvKnP8LwCDXo
	c6TMRkIYIVW9/lBTApzR4QbRMFLToU2i/B0BMesmNobdlfO1Rrrrj35cC0EZuby5dm7WxkYDAD9
	73J8tVPCQk9eCXst6t/tOeeojWP7CZQFOe3PaMS1StJLM9uNVozx0TrMA5rCqjnrgEuGWPlX9td
	rnMf43/ToqSsbIvmnIO4/ftMvXKk3lcld+Qd2XpC9koq6/e+226/fqBQcY+LSeEvyE28sOKfIhZ
	hNNR2UGWshiEuuaQCYNeHW2hD/yKcVdw+zT0PmjkrxZHhL8wPBX7yTxmM+O/wvdRi4AdmjdfVUD
	6BlDGWyzonATfCgIEoOs6OFwOCmoXUYADfvrMjUCMg=
X-Received: by 2002:a05:600c:c1c8:10b0:49c:fa21:e749 with SMTP id 5b1f17b1804b1-49cfa21e8f3mr85554955e9.31.1788642965679;
        Sat, 05 Sep 2026 14:16:05 -0700 (PDT)
Received: from localtoast.fritz.box (clnet-p04-043.ikbnet.co.at. [83.175.81.43])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce5952560sm261416695e9.3.2026.09.05.14.16.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 14:16:05 -0700 (PDT)
From: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
To: linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	vkoul@kernel.org,
	neil.armstrong@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	johan@kernel.org,
	rogerq@ti.com
Cc: Julian.FRIEDRICH@frequentis.com,
	upstream+omap@sigma-star.at,
	David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Subject: [PATCH v3 0/2] phy: ti: ti-pipe3: allow configuring ACSPCIe TX/RX mode
Date: Sat,  5 Sep 2026 23:15:53 +0200
Message-ID: <20260905211555.15944-1-david.oberhollenzer@sigma-star.at>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch set adds a device tree setting to the PIPE3 PHY for
the reference clock selection of the ACSPCIe clock buffer stage.

The clock buffer can operate in either RX mode (clock pins are input,
recover the clock from the bus) or in TX mode (generate the reference
clock for the bus).

This was tested on a board using a phyCORE-AM57x SoM.

Signed-off-by: David Oberhollenzer <david.oberhollenzer@sigma-star.at>

---
Changes in v3:
 - Cleanup device tree property schema

---
Changes in v2:
 - Add ti vendor prefix to property name
 - Reorder patch set to add the device tree documentation first
 - Add a property description to the device tree schema
 - Add an example to the device tree documentation
 - Make the property exclusive to the PCIe PHY in the device tree schema

---
Sashiko:
 - syscon_regmap_lookup_by_phandle_args() does not return -EPROBE_DEFER,
   there is no broken probe deferral here
 - logging but ignoring a failure of ti_pipe3_acspcie_tx_rx_mode() is
   intentional, following implementations of related properties,
   e.g. dra7xx_pcie_unaligned_memaccess()

---

David Oberhollenzer (2):
  dt-bindings: phy: ti,phy-usb3: Add aspcie reference clock setting
  phy: ti: ti-pipe3: allow configuring ACSPCIe TX/RX mode

 .../devicetree/bindings/phy/ti,phy-usb3.yaml  | 38 +++++++++++++++++++
 drivers/phy/ti/phy-ti-pipe3.c                 | 27 +++++++++++++
 2 files changed, 65 insertions(+)

-- 
2.55.0

