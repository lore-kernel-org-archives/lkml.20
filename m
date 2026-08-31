Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59EA138AC78
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 23:32:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788219153; cv=none; b=TPo+iJG7BbnXBm0x4MbsL0QUb73lWIJufN+W+yfW1ErY3fyjrw94QVHP3/oOGsabfrkAB9l2d2kZhF4h+PY5gm/hGleUUEsAAmlIS/oG3xkujuNwoBOR8X7hTAoeaDVx5CWqY6Qm46ToRa/8uSGJTRrtt78giN152MGmISC10TY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788219153; c=relaxed/simple;
	bh=Z5Phb0NYnzJ9UJstyCcMsnXLSLAEeBoTZwfa5AdVlKI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=IYweFTB707wyHNdBFePV3JNpLTD3MXjSpE+pOXu4yhfb+dbnISHpSg7I5GFUb5uPiXOrFucznvP2cDmz+bHwHfKk27u7Z7fNP/i4qlGUe6HtfnXtmzjmAAy5dzNT/+aTJAB7xAc5eSJY74WqtTleADZTH6Tww9NB3c+DQdxmpok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aYOHPmkE; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aYOHPmkE"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cc1c7962bdcso494636a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 16:32:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788219152; x=1788823952; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=djOgvsv3VuaYv8IJ6t6EG50/ulOg85QJhyL5jpcElpQ=;
        b=aYOHPmkElOnmK+KSwbGx5Occ86UKXSB0Nt+Za6xlAvgg5IqkeAN8AELMPU8tsvPXb6
         B6adSFeiKyY0u1HIFX9TV8HC/VoSnVqJNd7cQl4biKaEuIsGziDunzongBfZkIaHphUP
         cG8C7ujZQ2B9thIYtbPWpCz9pULv7LnimVOBJb8V/MD1E/Ci8tZF1s4Kue14Mrg52Igu
         0AaBSHvGSNE6pR8NyEyrsvczv84vRIDcsjHbpobADRKwf5JsNGRA3M/YZMRg9ZNyl95q
         O8vmoQYRQv944ttmE7uhlhOX/8K7Myl2ETVqxoEhFFTZtSQH1ODMaGyjLCXQGLJ9LCN/
         37fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788219152; x=1788823952;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=djOgvsv3VuaYv8IJ6t6EG50/ulOg85QJhyL5jpcElpQ=;
        b=J+pdMmknuepQi7RFALcz/A3Nl/Pv4jF4g2b621u+lPv1bT4iDYpcIznyTQZPUb4nak
         iixprZquL1nTMyp0y+oo/fGULQP2iik5H+s3xidH8SjsDcOKc9t32BfYuNq6PDreORLR
         LBnMg2GfdcPIq1oBw0MXWPX0104HvT4pB15mzg92gEJ63KsmoB9Kh+nVIs4tcCfwyUvH
         zCncK1zEzfnWguYEK5UQrAAFAGUP0zw13vZW/X8NVM6OZ8hOYzotivr6t7BsYF9+yqLc
         Bqs933dsw7gkVsPvISSD/Xl2INpzMLb/RbqqMRI0JFuBEXygkdbjH3hp7+GRv0gJ/KCV
         zYGQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp8u+I3g8zodFiXZGdV2IOIREwgBY2dImskktSgIBh341/EAjMM9XJ3Z4L/Gpxtw9dnErXQL+POUTCA+As=@vger.kernel.org
X-Gm-Message-State: AFuF++nTFP5o29Eu6e4flkhOEHOA6VJ3XQnztORgVzNEqYq0IKUWFbSk
	sUkMrkPkVuY/b8XIPMcaQ1uQdPJQEICznhGDmapGqOC04bDigWsfUnm3
X-Gm-Gg: AR+sD12+Cb7QhhNdY4PIJBQuJT3YQZxojeGYiHHtChuRHALfIpohIuJUKi5ZA3CQhIp
	JbAr/oC8eW1+lBWS5j5OIWNYlyOI2Sy8qUpg+VVZTy+JQZJ2LkiuAaqyh+oOelDzzyFp1HGJNNx
	WdCU1/fzRI453J6e0ad6WTKYxVwDR5FORsfg2TscVzI3adE5ffdfHdu2js2V0IFKGLd8CUSoGa6
	13PMjY/zHAulnPDpK+EuHeHbJCSHh1l+fqTSQtJSHpWawNd0lgoTCaQYuP3q1WyTCHxeakUpau1
	xozMZXUz+CCE/8imeLdI0HoKw5BbU1LxZJlF+/Xr3kfhrxzIyfvdxTjMURIWxTKFkQmVIt2EkAr
	WItd+jZyE2OsGKbEvPtZLEQfW70U7cNKofPqi5/3mIJRMdI0bKKpNX/ExAsojMNC4pUIWUwv+kv
	i0W/7wD7lC7MwzQpXuW9vqS83gZ9kjcc7+99AMmumZOBseLNB1ofgn86GQ73Tw+OVk4qM0bPY=
X-Received: by 2002:a05:6a00:13a8:b0:857:e68a:85b0 with SMTP id d2e1a72fcca58-857e68a9896mr15906207b3a.0.1788219151691;
        Mon, 31 Aug 2026 16:32:31 -0700 (PDT)
Received: from [10.60.78.252] ([2409:40c2:5002:4362:354a:8f21:7ceb:c8a6])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-85be5ca747csm154393b3a.5.2026.08.31.16.32.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 16:32:31 -0700 (PDT)
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Subject: [PATCH v4 0/2] spi: davinci: Convert bindings to DT schema and
 clean up DTS
Date: Tue, 01 Sep 2026 05:02:09 +0530
Message-Id: <20260901-ti-davinci-spi-v4-0-92e9c0b2e1d4@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/33MTQqDMBCG4atI1k0xYzKRrnqP0kWMiQ7UH4yEF
 vHuja6kpWVW38DzLiy4iVxgl2xhk4sUaOjTkKeM2db0jeNUp80gB8xLgXwmXptIvSUeRuIOpUt
 XVlghS2icnKfnHrzd024pzMP02vtRbN+fqSh4zo32Ste+VoBwbTpDj7MdOralIvznkDha9EpoI
 QGqT14cuf7iReJQlFJaXymH5sjXdX0Dwx49aCoBAAA=
X-Change-ID: 20260816-ti-davinci-spi-e64e4e48b6b6
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
 Nishanth Menon <nm@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>
Cc: linux-spi@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 goledhruva@gmail.com, m-chawdhry@ti.com, daniel.baluta@gmail.com, 
 simona.toaca@nxp.com, j.bhargav.u@gmail.com
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788219139; l=2055;
 i=j.bhargav.u@gmail.com; h=from:subject:message-id;
 bh=Z5Phb0NYnzJ9UJstyCcMsnXLSLAEeBoTZwfa5AdVlKI=;
 b=u4rRQ5rJsS4NBxCoSKV+pujQp/KNxj4jWfDkbV0TPh/Pu9fmvcCSKTBA+2Hgb9ZgqxG/Tn6ax
 1IY74iK2niqAVUCsDqPOgdZg8kIWvTgAgkXcezC+I++Eh61n020pXKg
X-Developer-Key: i=j.bhargav.u@gmail.com; a=ed25519;
 pk=IqNDwUZKECEA+n8wXctFLBbYL9NhFstZNbOznm/nX1k=

This series converts the TI DaVinci/Keystone SPI controller device tree
bindings from the legacy text format to DT schema. 

- Patch 1 renames property ti,davinci-spi-num-cs from keystone-k2l.dtsi,
  as the driver uses the standard num-cs property.
- Patch 2 Converts ti,davinci-spi from text to DT schema.

Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
---
Changes in v4:
- Fixed spacing in example.
- Fixed commit title.
- Rebasesd to latest mainline rc.
- Link to v3: https://lore.kernel.org/r/20260817-ti-davinci-spi-v3-0-23844cfb5e6a@gmail.com

Changes in v3:
- patch 2: since old text binding required num-cs, #address-cells, and
  #size-cells mark them as required
- patch 2: davinci-spi don't work as spi-slave i.e address-cells 0 is
  not applicable and spi-controller permits both 0 and 1 so explicitely
  define #address-cells as 1
- Link to v2: https://lore.kernel.org/r/20260816-ti-davinci-spi-v2-0-6c6f5171422b@gmail.com

Changes in v2:

- patch 1: Instead of deleting ti,davinci-spi-num-cs, renamed it to
  num-cs to properly preserve the hardware's intended chip select
  limits 
- patch 2: Removed  maximum: 6 constraint from num-cs.
- patch 2: Add standalone support for ti,dm6441-spi in compatibles.
- Link to v1: https://lore.kernel.org/r/20260816-ti-davinci-spi-v1-0-a7f57dfd5262@gmail.com

---
Bhargav Joshi (2):
      ARM: dts: ti: keystone-k2l: Rename ti,davinci-spi-num-cs to num-cs
      spi: dt-bindings: ti,davinci-spi: Convert to DT schema

 .../devicetree/bindings/spi/spi-davinci.txt        | 100 -----------------
 .../bindings/spi/spi-peripheral-props.yaml         |   1 +
 .../spi/ti,davinci-spi-peripheral-props.yaml       |  25 +++++
 .../devicetree/bindings/spi/ti,davinci-spi.yaml    | 124 +++++++++++++++++++++
 arch/arm/boot/dts/ti/keystone/keystone-k2l.dtsi    |   6 +-
 5 files changed, 153 insertions(+), 103 deletions(-)
---
base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
change-id: 20260816-ti-davinci-spi-e64e4e48b6b6

Best regards,
-- 
Bhargav

