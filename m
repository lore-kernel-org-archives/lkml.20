Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE89C374731
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 14:34:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790087647; cv=none; b=ruD1LP1hyJrXzzKLn6SsisMaIKHUyrPrTZJe8xT0ngSX9w4JlqKdt9ZfPGQO3uRH5XzsVC1MufA6rLxaq+viqrldsmyWGh+Sc5dpEi5LxP4t1311RrYhuja8ewBe0TLvna+0ppBkI71mrvnDvoajwXcYH0GswI7ZXnzHF/CpMJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790087647; c=relaxed/simple;
	bh=HTxXW1i80xc/5ySMCXcIlhCujaED7RaMVu0HGBcwOTk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=TGZh5axxeeqDfqN1S01WKWIl5BFobNISXWDRYrN6z5Lp7py0+cWsHUgW/e2qFnoOShkzwso0x+IfEkHj4ugZVvsVEPTvkTy8sVeTQJ6CncPaiK099Lj3AMnh6R2uZK8r2yTIHH++wB78fX6+BCBY6l4/TVXEdqEv54JYUxem+Yo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dTRbXUj4; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dTRbXUj4"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254f9f7db0so512728966b.3
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 07:34:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790087644; x=1790692444; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Ba3ecdPg+nXAggAkyJWYjwGlyNmLO+sGERFOk7ut8Ms=;
        b=dTRbXUj4kU/+5157YVbS3NytE6e6GBsL0sqW8b0Js5AEwpaVBvFqTUlzmbLxmE69Y1
         d20eCmVfZx0F033GJIaa1QD1hRTAwWs/CMfMQfeKjzUzcnP3vR6jp5+v8QZk7dadODsS
         QwQGkG/WHW9uDYtx89pNkjfcvQaM1jqgNvPOC8rCMd2LyUfFzS0aV0d9eh4qwIe1g4Dy
         xDDeQTzenvIpsl0XFC64xyU+Iacd0piRznCc7Dx09w5+iuUJBNb6gveRCsKyf50CnCj2
         GptheRKq/1Xj6s020Np9QFl4SJLseVJ/R5H1F92qKa7fn83UMKa1oG9wATr5G1vHc3Wz
         UHyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790087644; x=1790692444;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Ba3ecdPg+nXAggAkyJWYjwGlyNmLO+sGERFOk7ut8Ms=;
        b=cTJ3nshL2pF0I71YGspGjaX1UegrTn3gNLPXSamZuD1/Y7ZDtv2qRda8o8hnWV/eqI
         HoAFj7IMlEbyDMiSje/Clxyiz+qLl1sopkIdZRDLcMuW+lukuRoIkNrQYztZHV4JXD1N
         oiovizmtrK+m6N0SMtkxpcWutKx8KJGtaugF18d/B+ST5vgrOWh7IPIwVRm4/mbIUY3+
         etfYu8KAcydP09msokPs84ML2NteHYRDthrFRCdHuzp2o2ed4gCAJKfLufj2uM8xJ8yv
         qp3WrhU2nqb7SsFvZVyka6mvYdI6oM6LiwgA1yoClPBwITYG6gzs7wtQRClnH0ADF8dZ
         Mi9A==
X-Forwarded-Encrypted: i=1; AKwUvBxQ2AJOR1AvwZzMgnH8R4iO/10tw9jVu/bcc3cHMpE7RiGwIpXQZ1s2AI6shYjQJK8hyVCo/RzAFyPAZOY=@vger.kernel.org
X-Gm-Message-State: AFuF++kgDI9GuSeezzCi1m0gGGxRUMG7JtzJmy5aSh2e1CXHQYn6Va9d
	+PmoMoGzPqQvFvIUQJ2EzlTe9j4jvVC6W2Cu0jCux6FzH2YUHkX50eCp
X-Gm-Gg: AYBFou09rQ5FFwyh7EL7LAqA6POLsH92uoR+MsqMmkjf2gT4mGUL0R0jhJTM9dpkVIF
	GFOs5Gzg0fkfd9K6U5/5dXRNDybX7EuxhGSQzJSicpM7ZBV6DvT7AAXJ1FRkRvp0UL9BxktcGb+
	Ad8UlMPpJQs8R/VarJy08fTBR6yJaxtRP1PDheAfk6KUlgLSDDdJkSbPdHC5GLEtNbknqHxgt5y
	AuR8XreMwXmtLBH+VELX2aF6gSI5rN2YyiyAe5gCtf/Sw/dMYqmkZpEvi6nL55bipI2plnushTQ
	f9FXvJDVqbJE+cMrrXEG8VMHE/GwvebIddSJ1WjmdCP1C44VT8RB7XurrmTqx+iIA3QMIC2661n
	/iI3W33PkrMHI3n4jmOFWAsUo68j09eMTIwhVZjl+KMFZPcgKgNF7tuSKHgsKNEANwT4JTduYK3
	OIHZWPPPUTkyMRQF5J6dMIBF6oFHrEvq6jG84R1oppI3HTMMR/48BLfC2lYggkghDFMKlgljWo+
	4SX80eath9i3asBByksYyqeq5V0ekgm0WLvBGfc/laILqWrNJzmf4tn5Sgp/0SgGEgJfI7KHFk9
	LSufMcCf
X-Received: by 2002:a17:907:3cc1:b0:c27:d84e:ebd6 with SMTP id a640c23a62f3a-c2a157fcf13mr1269533666b.25.1790087643972;
        Tue, 22 Sep 2026 07:34:03 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a9c5814e2sm103469966b.27.2026.09.22.07.34.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 07:34:03 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Subject: [PATCH 0/4] arm64: dts: freescale: Add Toradex iMX95 overlays
Date: Tue, 22 Sep 2026 16:33:45 +0200
Message-Id: <20260922-v1-imx95-overlays-v1-0-694100afb4bc@toradex.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMmRsmoC/x3MTQqAIBBA4avErBtIw2i6SrSwmmqgPxTEkO6et
 PwW7yXw7IQ9dEUCx0G8XGeGKguYNnuujDJng650U5HWGBTKEcngFdjt9vHY0lhbUq0ZqYbc3Y4
 Xif+zH973A8LiKiNjAAAA
To: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
X-Mailer: b4 0.13.0

This series adds device tree overlays for the Toradex Verdin, Aquila,
and SMARC iMX95 SoMs.

The series adds support for:
- NAU8822 Bridge Tied Load configuration on the Verdin Development Board
- UART_4 reservation for Cortex-M7 firmware on Verdin and Aquila
- SER0 reservation for Cortex-M7 firmware on SMARC

The UART overlays mark the port as reserved so Linux does not claim it.
Firmware remains responsible for configuring the UART and its pads.

The Makefile entries build standalone DTBOs and ready-to-use composed
DTBs for the corresponding Development Boards.

Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
Ernest Van Hoecke (4):
      arm64: dts: freescale: imx95-verdin: Add NAU8822 Bridge Tied Load
      arm64: dts: freescale: imx95-verdin: Add Cortex-M7 UART_4 overlay
      arm64: dts: freescale: imx95-aquila: Add Cortex-M7 UART_4 overlay
      arm64: dts: freescale: imx95-toradex-smarc: Add Cortex-M7 SER0 overlay

 arch/arm64/boot/dts/freescale/Makefile                    | 15 +++++++++++++++
 arch/arm64/boot/dts/freescale/imx95-aquila-uart4-mcu.dtso | 14 ++++++++++++++
 .../boot/dts/freescale/imx95-toradex-smarc-ser0-mcu.dtso  | 14 ++++++++++++++
 .../boot/dts/freescale/imx95-verdin-dev-nau8822-btl.dtso  | 14 ++++++++++++++
 arch/arm64/boot/dts/freescale/imx95-verdin-uart4-mcu.dtso | 14 ++++++++++++++
 5 files changed, 71 insertions(+)
---
base-commit: 478f68c644732750f8386e4de7c909c5ffb26ab2
change-id: 20260922-v1-imx95-overlays-89b3a9185b93

Best regards,
-- 
Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

