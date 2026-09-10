Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F06F63DDDDE
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 09:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789032704; cv=none; b=Tw4PJAxcA8bxA9yVbsmbq1539gfde8YcfxGRuMcLdmZR4ABM3Shz3Kx6Y+PzLu8b077OF88NwW4TreRXjiPJ3RfnW9ScI/x4iuE9TOmZ4MaQMhfsEjacSncbnkapnAkodrZgnvp6u1h2108my8MRW1KbLOKACCBsu7Up8ErxvTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789032704; c=relaxed/simple;
	bh=U65vA4iIr02MHl2n6QXZFfU+NDomKjnZHbkK5Rr1iqk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=CmspeD/YoTO8n+XY730OVdIjFjPFtuWQFmGvVg0gTB6YKzprVo+YRK3rvSHkTbrwg8t1olUbHHdPzJsYH4Lbi8pCQPrHQOKmRYl1iz1BVOl0hLfcoqSGI0kfpAlwgxyhk4L6r+/b8RvxarS9FA9HB67BNdQN9NAIn9tti6ed7Jc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=H9stmC2G; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="H9stmC2G"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-49b8e527d63so86822885e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 02:31:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1789032696; x=1789637496; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=DGt/68Seh+Cu/MXxxMelYUkMWN3xBNuSwl1SfYB7jDw=;
        b=H9stmC2Gjuq2SSpP89FR7/RRzTfPXBc6Djr8TYAg2rABNOzPhyrtk9ZDG3e6wpJb7k
         mRnrUSJh87MXqTzeQczyXUWljQjwdnD+QnlWdD/1ebzktb4NkA3B8vymnA9f6HKfqUMp
         fHhDFBdUAyfVpDQXtDLj6lnsCUnABEXDL3popqU4O8exIJ33NeJJBNpMmFKIlH3xS1/g
         h5sS78z47uC7i8h4u94nPqmU7E7CPAeo2k07mB1VQMzWug7nR+P/MJVN+FZbEymoDy2p
         Abh6tCrThfPW0cxyFk3465Xj90CxpcEQlNe75YQ/ug3YvYmtV+UHD//QIirLoQJuAzxZ
         7rsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789032696; x=1789637496;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=DGt/68Seh+Cu/MXxxMelYUkMWN3xBNuSwl1SfYB7jDw=;
        b=BZLCGy0p/A7iSS/tU7ESIur1K9ZvV7UuJqB1p6JhirESQfpVed9xiGYOdBCpfpVZ+n
         doRgB6oRAOzmb9l7bV1M6/8FdI5fHFZnmC2HLZZP5xJDM0Nf6ziQyIANOLQUdiz98rzG
         kKhPoGL50ETDJSMhuop+0TV6Y4FGQ1tyjuDxI4dZMYjIo/S5JMy6g4Q8KcazOqXuXtve
         QZK0XMWoKd/bPSBJNHyjfFuz9CfMkhG0q0BbUEnMu9ujXUU86EUuoXuLzCVYCiRpejzY
         YPZ02S7Kn/ST/Q4+uMZBUf7fxryp5ONFj6qGfxmMEOyAje73qgf6Wyk4yKqfbqzjX6kl
         NqAg==
X-Forwarded-Encrypted: i=1; AKwUvBzPuVLIahaAtqjRTaes68T6xvy0vpkmN2Z3wGmi/auDXmP2FJt7A3l22Ak1B8Us0bo3Tn4Vt9fKKT49RSY=@vger.kernel.org
X-Gm-Message-State: AFuF++mcAnOF2QACYVjsi/VYWW5VP87S1LfsCR5/YdJD4S0yTxou3oeC
	VUkxaR0EHX6+ayVJNP83BeyoNkVU/Y6qBre/MFotpP/e8+MFcqTIdoXjh2Z0d/K7MQU=
X-Gm-Gg: AYBFou31Z/A8xtH4Knf6tNnZvSqHZWdiWY75t6SMj5bOVj1biTkf+lRFyAy4YXHWIBj
	gZ6th85/8ZA5vP72UrhsR+aUMGfyh6cuYUmOQcGQ0shvUJU/963RL/Zkoc7y9HQ+52xf4FtOa4h
	TN3ttpJ1IzOrVByl6No31rxqk1pFH28rlHnSW2AufGrgVm0Ya62PEfDlQQGc/UihKPb5YYW0g21
	Nnc9e+CnqpTOcktNEgoBK2TkRZrfCFCIgLOnO1kNV/F3NoYL8Z/64w2dkxRcmFnRtbAmI1d2sPN
	qbM5bxtRpXbrIYrgqtlWva2dJIKycbscIAKOcYImoRdsP/zXnngsIsAtHxTZEZxEbCR2EnOz7pC
	T0rdQl4oIbthl5lRCuNIMAO7jL7DX6VqsATTL1I0qy3EpgaSKxJuGAGl4E88mjG+juSKPrmufst
	TuS/U5qfzzErKa8RQaD/9eCWkaqlbBQiStw1TJ/BkNv/YY8PrtQqUoWu+YPkrZuYAzJICeWwxZZ
	/2GWzobBDMFNeoxWA==
X-Received: by 2002:a05:600c:3b02:b0:49b:9202:6f80 with SMTP id 5b1f17b1804b1-49cf8220edemr425817905e9.6.1789032695579;
        Thu, 10 Sep 2026 02:31:35 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26d4e3f3sm66092525e9.15.2026.09.10.02.31.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 02:31:32 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH v7 0/5] regulator: Add X-Powers AXP318W PMIC support
Date: Thu, 10 Sep 2026 11:31:07 +0200
Message-Id: <20260910-axp318-regulator-v7-0-de720ceb9bac@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANt4omoC/4XPy26DMBAF0F+JWNfI4wcOWeU/qi4GPA6uwkOG0
 NCIf69JVQlVVru80vjc60c2UvA0ZqfDIws0+9H3XQzm5ZDVDXYXYt7GnAkuCm6AM7wPEo4s0OV
 2xakPTEmtdE1SFOCy+GwI5Pz9Sb6+fefxVr1TPW3OduFC37KpCYQ/tAYuAEBwkLmILSWXDBh2N
 lA+hM/lAwOeMbR53beb0PgxVi/P1bPYmv4YOAvGGZF2UOuiUqU7V7hcfRXtjds2znJvmIQho2F
 MaWuoSmOtShjqP0NFQ3N0rjT8qKxNGHpniNRfdDQQ0KEhEsqVCaPYGRISRhGNSpFRWmuBUv8y1
 nX9Ark+bPMXAgAA
X-Change-ID: 20260710-axp318-regulator-43545ce3261f
To: Andre Przywara <andre.przywara@arm.com>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Hans de Goede <hansg@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 mfd@lists.linux.dev, linux-sunxi@lists.linux.dev, 
 Jerome Brunet <jbrunet@baylibre.com>, Sashiko <sashiko-bot@kernel.org>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4080; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=U65vA4iIr02MHl2n6QXZFfU+NDomKjnZHbkK5Rr1iqk=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBqonjtDS1WT3rALVGNiF8RLi/gxqITHUSlljEgO
 xO6EuQl2hGJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCaqJ47QAKCRDm/A8cN/La
 hdPKEACHNleOvLFJvngqUQQy/1jvZ34s4hRZqzxVQrdmrOFXh4cCPw6ml9sn4Sa+sXyZAZTwX1B
 L55sCnj3KPi+hcy5oVNmosjqE/bt6TEneeSs/SOvZyuNsZ/6Zua+6plZ2MG+T0YvuOKtzV58UVw
 ad/ktw22Tb3JlL0Yc4jiaAUSbobrvzw4sRwlmW1IrWKjy/ah20phF2TLHWRTaxVve89zXksnWz6
 XXUKh3kvda4C2Pj+VvrQbhpUsnQ4jlOMQEDTyrNmLgauXIaE9/oPwX2D9Y0oMtGDKGp3vVYwRoV
 Xlmhrrc1DyaerTrTsgbZHEoHyZsHFjQZPKAvphLfFpd3/z6SkB2cHzTgz7YtkGvI0S2zg7bXkMo
 lwiPBiAseBUhzUXliAr3BntAuowFuz4hFP0kJEXIoSin6pdweqFVUoQAuGJZTSuUmcjrgPw7pPT
 uODWLH8lZOAGm2bGE/aM3H5rgj6IU1mL6qP26iXMQ/Nm96xPIaKjP217uxn3eru/EqAXyR15i5M
 tCnJzooqZl1uc/EKVYJeimGLVQiouco8XLoSz9qdSJJsdOQWjmm/ZnxCv4IwxYrpF3VoEPxXOWM
 pFXf4eFwh/lb6m1sQpv+oy8GPdLlhgFlLQzOl3uVPDDqgX6KCpf1y0H7RlgatMvvALsBZeeiNZE
 TlBRHzMyIEcidiA==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

This patch series adds support for the X-Powers AXP318W PMIC, which is
used recently on new boards with Allwinner SoCs (the A733).

The PMIC features 9 DCDC buck converters and 28 LDOs, plus the usual ADC,
interrupts, and power key components.
A datasheet can be found linked in this Wiki table:
https://linux-sunxi.org/AXP_PMICs

There was an unclosed topic regarding the handling of LDOs output
voltage being limited to input voltage being provided by the supply.
Chen-Yu noted the min_dropout_uV would be a good fit for that but
the actual minimal dropout value was unknown. I've arbitrarily picked
1uV because it is the minimum the framework supports. Realistically a low
dropout regulator is bound to have some dropout. This choice does the
trick for now and is certain be less restrictive than what it is in
reality.

If anyone has problems because the dropout is actually higher
* it is arguably an HW design error
* it is a good time to let us know what the actual dropout is

Changes in v7:
- Rebased on v7.3-rc1.
- Applied Chen-Yu change requests.
  - More complete register definition all in the MFD change.
  - Add writeable region holes.
  - Fix invertion between short and long press IRQ.
  - Drop confusing comment about DVM.
  - Use MFD_CELL_NAME() for the regulator device.
- Link to v6: https://patch.msgid.link/20260812-axp318-regulator-v6-0-d6b84b55c000@baylibre.com

Changes in v6:
- Apply wording suggestions from Chen-Yu
- Link to v5: https://patch.msgid.link/20260720-axp318-regulator-v5-0-a1afa7ee24f9@baylibre.com

Changes in v5:
- Fix shutdown register offset
- Re-order patches to put fixes first
- Tighten DT regexp around swout
- Other points raised by Sashiko on v4 are unrelated to the addition
  of the AXP318 support and pre-exist the series. They are not
  addressed ATM.
- Link to v4: https://patch.msgid.link/20260717-axp318-regulator-v4-0-50aff97084dd@baylibre.com

Changes in v4:
- Capitalize patch 3 title
- regulator: add support for workmode and poly-phase.
- i2c: fix probe through i2c sysfs
- Link to v3: https://patch.msgid.link/20260717-axp318-regulator-v3-0-779dc1b97dd4@baylibre.com

Changes in v3:
- Correct mess up v2 errors regarding ops and ids.
- Correctly propagate errors when checking axp318 threshold.
- Fix DT binding regex regarding dcdc max ids
- Add missing RTCLDO.
- Remove axp318 PEK MFD cell:
  As pointed out by sashiko, the driver name did not match anything in the
  pek driver. While the device does support some handling of the power
  button, it does not seem to match the existing driver. Register 0x36
  relates to DLDO3, not the power key, as expected by the misc driver.
  Leave this out for now.
- Constify axp313 and axp717 mfd_cells array for consistency.
- Link to v2: https://patch.msgid.link/20260710-axp318-regulator-v2-0-ee5f1c56b49f@baylibre.com

Changes in v2:
- Dropped _NUM_VOLTAGES macros
- Use min_dropout_uV to limit LDO voltage to supplies
- Add bypass mode for EDLO4/5
- Prevent crossing 1.54V threshold for DCDC6/7/8/9
- Link to v1: https://lore.kernel.org/r/20251021112013.2710903-1-andre.przywara@arm.com

---
Andre Przywara (3):
      dt-bindings: mfd: x-powers,axp152: Document AXP318W
      mfd: axp20x: Add support for AXP318W PMIC
      regulator: axp20x: add support for the AXP318W

Jerome Brunet (2):
      mfd: axp20x: Constify axp313 and axp717 cells
      mfd: axp20x-i2c: Fix i2c instantiation

 .../devicetree/bindings/mfd/x-powers,axp152.yaml   |  28 +-
 drivers/mfd/axp20x-i2c.c                           |  26 +-
 drivers/mfd/axp20x-rsb.c                           |   1 +
 drivers/mfd/axp20x.c                               |  93 +++++-
 drivers/regulator/axp20x-regulator.c               | 319 ++++++++++++++++++++-
 include/linux/mfd/axp20x.h                         | 148 +++++++++-
 6 files changed, 589 insertions(+), 26 deletions(-)
---
base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
change-id: 20260710-axp318-regulator-43545ce3261f

Best regards,
--  
Jerome

