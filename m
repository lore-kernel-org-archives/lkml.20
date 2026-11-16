Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794855163;
	b=1kNn4LESHkFiqMdfu3FgZqNehHcWvSBcsmF2y8uQ/xxaKFIc2U2Dr098FUjVdjncc7xh
	 /tU4CmWon2vRZnWGSlkVsU8DnuisJ+5jfK8JSmhcR7432dcjAIiKPGqnmrJUPkE/oaE3A
	 RkXKAMbVxuQVDeeZ0W3p3IVYO5uiUwgA2C3WLGJZsaLbcMRwd8rZMIeCzSW+Gj0GIjXfS
	 n+4woVzJrHK4edtkpv73kmpK2Id85Uu4PxPCv1ZOVic23bQu4xNV0Rprao5gHJpMmCyPY
	 Fh2lbEMtBhGAdLqvqf8O1gIRnOZQqttp2fra2niMEnAWoa5Wg2vMPOZPf5G569dmDcQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794855163;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=m/Z2nYi9NZNoITMZsJFvw0t9wUHDOrpZ4vvlNzigGVA=;
	b=TMMS/b1lJdcaV06TVX29BGh6Lr+7r6EQqG7zkHCoc7UHQONAlstb5HJB2uVHrhp5KyFH
	 cZdOHsh4XeIPs298/PnC1vG21Pr9dsI6QdmZundwTnte3gtMcqq8ybG0dvUuZnebC09JS
	 t9upKtWnx2qZFq+5Xv4fI1zfRNd+qKeBeOZ7apvMXzBHJ7y9AeeTHf2jmRhCap2t7EB5z
	 ake95K5pZto13AgYBcKIzAWv8EJAYWWdDOsRM1cg9i0am6drDu94RVt74k+syjJjRyyO2
	 MXBbUQK2SYdIiOCJiZWNVeE3vh0MBcLxMKP0uGrtrQNRxYfM+vI2xJtQXm91JJfF47g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Js4XTkPu;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CDFE606A32F
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 18:52:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9CDFE606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Js4XTkPu
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4bb606491faso12758365e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 10:52:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794855161; x=1795459961; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=m/Z2nYi9NZNoITMZsJFvw0t9wUHDOrpZ4vvlNzigGVA=;
        b=Js4XTkPukbCMDuP+silCcUkGbdhKS0wyVvy21AGdd+TmgOsiahvn6FrhdgE8k1fhVA
         Tx2AP4PQpfZGqLLznhjxaiOf9WEjlfnV3LD3mRtVFIAktbCvWEGSKg+Slq8Og7voi7u+
         3gxtr1u8YM+Q4ohDcvr0Xvd87te5jFCOOTcq+LHUT1AALtom6J6Y3ygMi5r3VzxbnGkm
         +D0lYSxXUvkAS+jk/De7oD/D0METPY51FyUXa35VRphFlRfPEqUypwJ77fgI+8FXRBZ7
         WM+NKLoevu9bUKtq8nYmHavdEAUeA/Cq+C7EI9N1Rt6zfzMRHsrHbWYO2ThyXdZ6rIfQ
         YJlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794855161; x=1795459961;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=m/Z2nYi9NZNoITMZsJFvw0t9wUHDOrpZ4vvlNzigGVA=;
        b=K31wGqtirDfAtRbTYp0QU1MXz/MsYVpOIcRoInUdN9CV3d/zC1KoSQHOAk+ux8m88h
         WUhtr7QwyaCMgUnxj50T4zWp4XxFvtrMaAsi6X7EKimbaKsoD063lto/mJjpnionhUOB
         pNKTiNpbEYFa6VV3UAjBaEQ6JLeML8736Bkv0KmTDAyHMIt2I8Q+OKTzOk5y5EZVyzNv
         NHnD/UzQBiCdSh3e4kYd0qXOfb2Uxsydu5fUHU0Hf76PuZayW4F81ihCQQ3rAntXpGY3
         7xwcVLAGPIFfafKVdJYIdBf4hNb6xXFkwo7B4lLjIDjW6Ohlg/JfSGx4QksSLfigkrGQ
         Bc8w==
X-Forwarded-Encrypted: i=1; AL+hErFRTU0vUqqySWA3m/E4HEvX+G1BGLiAfNh/c14cwtIw3e+0HauKPqWr+stoQ67cArF8bS4POIHxmKgD4cQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9DCWcBN8Fnf5Bsw2jGWloLJrvJFXMTSF/3mVI/I54L9eGaecV+
	1lTFtNtK+OnOthFSezpg0cuH66dLmnWaT70LMw5hqfVX92h3XUDqiK0W21yohA==
X-Gm-Gg: AYBFou0D4D8szxpy7RoW+6fbIkwnUjLTm/ijCOnEYUephEPx/Hk4c7lBWeAkGlUwmEU
	11W7pUt1sYP+ppJvs8s76oFm11mRAmlEYHhO0lLY1qk6ge219uoQZFvISaSlrq0XTqscxtyskSQ
	0/ty4wNXSi5GBFGKZWX5nz/dXlE9qqbw+H8LGTsYmWpkOGENDNJv3a5e3tjEA0SVcl/MdwKSKZ8
	Z6cSufBg14CXJWTG2dGrgr7Dt8U2g1BitDBNugb3PjKlzDeuDs1MqYEf2TmVn+t2rjLvrhYNKwj
	JSUjlohy3Eu8NwfKDZVjHMPkNJVqQFzG/qZCKKzscz9WI4QCMezMhR97wVQdddqE5TJYg7n+JN7
	av11YoQ7AwLNQev4Y+GVQWcyLXyiFgptjBuuIP7AyfCcxXF7p/JEXIoGmNtnqQNuBJthXsllnfQ
	qeG1GmmiuoeqTChpmRww6Q7u0JDeZ23Uc51gnlvfqWpA9yY0EBUHWR4OMq4mwl8onmKI8dYh2HN
	LaCowVQduQSyNm2BOdrGleeAmwd8K0gM8RlKUb+wqMKlTc4oCuGI5LdRwmfalRJma01NuZ5qRuB
	3IWKu3xRw35pC/GlqPEe5HZx1Gx/zzQwbvkE8r7GTzkeISfpHJnE8MhCnLyfxonbOQ==
X-Received: by 2002:a05:600c:154a:b0:4bb:6a5a:7824 with SMTP id 5b1f17b1804b1-4bb6a5a798emr116616505e9.30.1794855160850;
        Mon, 16 Nov 2026 10:52:40 -0800 (PST)
Received: from [127.0.1.1] ([2a00:23c4:a702:d301:6889:eb24:5e57:83b1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb5720f6basm157961345e9.4.2026.11.16.10.52.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 10:52:40 -0800 (PST)
From: Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v2 0/3] Add RZ/G3L HS400 support
Date: Mon, 16 Nov 2026 18:52:38 +0000
Message-Id: <20261116-sdhi_hs400-v2-0-de41f7a7f330@bp.renesas.com>
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
X-B4-Tracking: v=1; b=H4sIAPZQ+2oC/03MywrCMBCF4VcpszYlk16srnwPKdI2UzMLm5KRo
 JS8u7EguPwPnG8DocAkcC42CBRZ2C85zKGAyQ3LnRTb3GC0aRGxUmId35zUWqtm1h01pjqaE0I
 +rIFmfu3Ytc/tWJ4+vHc74nf9Me0/E1FpNTUjWVuhqXV3Gdcy0EIySDn5B/QppQ8GXzMrqQAAA
 A==
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Ulf Hansson <ulfh@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794855160; l=1545;
 i=biju.das.jz@bp.renesas.com; s=20261020; h=from:subject:message-id;
 bh=TTEJfEawvjDbFSQ6Fs65tzvehlnQj31DNLAkJJXRiME=;
 b=2oQyctcsRUZIl5FW0fFWgIu4Gh0NRzja9Fppp82DjTe9EZNEPy+nV3Ik5RkN90TaZQPRdHbgw
 Vh08oHhQ5uOCYIwCOEZN5YtoLqqlAMDxRgMTjTAFa/HtwACmv+vV17v
X-Developer-Key: i=biju.das.jz@bp.renesas.com; a=ed25519;
 pk=yzD2T1OLS3lEYflbk64xhLlxhk75lZ+NoOtkTOqrlVw=

RZ/G3L SDHI IP support HS400 and HS400 ES mode. This patch
series aims to add support for HS400 mode. HS400 ES mode
support will be added later.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
Changes in v2:
- Added fixes tag for patch 1
- Using ios.timing to decide whether the HS400 divider restriction applies
  is wrong: mmc_hs400_to_hs200() lowers the clock while ios.timing is still
  HS400 and then walks through DDR52/HS/HS200 before prepare_hs400_tuning()
  clears the HS400 bits, so the divider could stay at 200 MHz or prohibited
  non-zero dividers could be programmed while HS400 is still enabled. So
  tracking HS400 hardware state for RZ/G3L clock programming using 2
  variables hs400_active and hs400_clk in struct renesas_sdhi.
- Link to v1: https://lore.kernel.org/r/20261116-sdhi_hs400-v1-0-c5bedd312408@bp.renesas.com

---
Biju Das (3):
      mmc: renesas_sdhi: Save and restore IOVS across suspend/resume
      mmc: renesas_sdhi: Make HS400 OSEL bit configurable per SoC
      mmc: renesas_sdhi: Add RZ/G3L HS400 support

 drivers/mmc/host/renesas_sdhi.h               |  5 ++
 drivers/mmc/host/renesas_sdhi_core.c          | 95 +++++++++++++++++++++++++--
 drivers/mmc/host/renesas_sdhi_internal_dmac.c |  5 +-
 include/linux/platform_data/tmio.h            |  4 ++
 4 files changed, 101 insertions(+), 8 deletions(-)
---
base-commit: 35dd24973da5e5810a6fae86c291293d11dc8022
change-id: 20261113-sdhi_hs400-5f08e5237291

Best regards,
-- 
Biju Das <biju.das.jz@bp.renesas.com>

