Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E73B3DD521
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 21:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789765309; cv=none; b=JNLETmwFtuydH1Y+srRyyIvH8aek6/rFx98z5zZwdXPsuK7TFQZWD5XOaHGAa1+QmRLO/bAS0X6QOhRB3+sfUaGlwBvw/fVFF/2sWVNJHZ867jQrbV1U7koSoufamuhrG40iTiiUCX8Pms8o7/XapUaKXXXLImtcsaXfJiowxSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789765309; c=relaxed/simple;
	bh=ZRyjLwuWb+X9g9IpWHeNCy8T/E28/fkf3KvfcIaopTA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ix8raSD4VVCCOpxGH5piXezxQnWE8o3AEnx3Z/2rmfuUPpFQBJLvlhe8PbEUGtV1LOgRGjDdV+JAeeptty6hhNKwr37Wr3Dcx3XBQFidExpJVaVC2Yw/mWZk8r1p4BvcqN1On8DfSF4rOFSNtloKMBk7pNJl4s616czr2sI/2VE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KhH/Ekct; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KhH/Ekct"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc1e1b51234so142142a12.3
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 14:01:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789765307; x=1790370107; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=3WiUysQa48NgmiHeWEdLUhz2qNirMR0WRXFvV2RF1mM=;
        b=KhH/EkctWCwnfuKjXN5sOERAtumcLoyJ3tl/SOjDZYNucM3AlsMs89aRMyazJJClKe
         G5L6XzFGF6l+eL0PYvxroOBxx4iKIFV0Ob30ZtwY6r1Ck34wJdSwLWaTVZi9FSoGo+tv
         jV7YHr9wQvchsWv2m0zYJl+1nq3Ej+g7NBz5mnnqB+k+h693CW1RSssEZYBUnhpv+ZZk
         fjAEiSgsX59vdxvJuMd22hh108i6jZGX9aI57mPLxH+Gm5QDXuGx1dCyb21XF4lnytYP
         XbBDcF6odtcdfFUSC1BISMH8pF8xjvTAsGoRJSLHEzXv5jYoZ0zh1nuBkFuALEWObebb
         CI3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789765307; x=1790370107;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3WiUysQa48NgmiHeWEdLUhz2qNirMR0WRXFvV2RF1mM=;
        b=ewz/fF7rNiW3CmmuxFJ8QQZRKFersKct9zw15a8LgzWh0bpWXjvvzexXqDihtZKQ1k
         Vxl6qKwcC2PcamWl3o/cijXGFotJpvwwmcxQ8EE7esGrFj+LiqNVK7F15Mpmv7bnmVXn
         LsRAnT01vZiN/sBg5Kbd+6FRrH0vhFiu9w0AzKP1CYDY7z+lwHkCEOd2I6LkvAGQaI7Y
         ebZqJPS0hpbyGO0uFTlETFOfMocDWLWZHLTciPx4bZO6GxDTMNQLff1w38rutGvRF30v
         QOJg4UDDGgrC0CT/rH4SWreQyw1mimPpnIyla/kbeYQZo0KCu5l1AoI8TbSMGl746hhi
         84Vw==
X-Gm-Message-State: AFuF++m2kaYRJ/CoUs/B0+XtdkwccdWZqo4bK/afKVJfYVOy3X2fdP7I
	4jNlGjB7xgMdNGAyexkEPgWMcE3LuG90aq/w5hbaON02jlmjcG2i0QIj
X-Gm-Gg: AYBFou027WHC+Ay3mY9dxRydR2xI2DkAbsfEs0HjjoUq+E/g7jq/IOuST3D5Twhbm9w
	Vy2BJaV4WXgjTtJzIgEhXD9yZN01XqUUt8tqsvKJ8tu6xo2PTQD4bxchVxlTaJJLOs2sGTnzfh+
	5Bgif1+0wDdW1G4BY0kZhPw11GgGDMlixUw6ayhvNXdZ53auQz9oLbMjvJ5r+u1jcCsiJS27BAj
	zo0ldTfoYDcrJFNy1plGQjBCavY1olvOifcZQ2OH2GZgxkSjRWPQos0ZPvM5vH0Ov37mVovMOmY
	UiF5JQ5uFJzan0ww3uYABrqn/oWg4nZpATVaBaYUwyO7iPfyvhHM+E4l3+nmioCNQxgPX0fkdIH
	U6EpnSxWzkkkJp0JuFf3YGvssecIID8hMcrLnYpnQSxzJ+T8PRDV/C91sKGgf4z9Eo0nivANp30
	r/i4SXmbHcGldQJDmB7zlL6cXrffwaETGZSsfudlWfvocc5oWvi1EZXMYW0KzGfnyGMf2Y6tYG3
	KJYPNlf
X-Received: by 2002:a17:90a:609:b0:39e:b778:2b3a with SMTP id 98e67ed59e1d1-39eb7786460mr468341a91.6.1789765307417;
        Fri, 18 Sep 2026 14:01:47 -0700 (PDT)
Received: from [10.198.60.252] ([2409:40c2:5404:cbbd:a461:609f:eccf:23f])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144d55ab3a3sm1396904c88.5.2026.09.18.14.01.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 14:01:46 -0700 (PDT)
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Subject: [PATCH v3 0/4] regulator: dt-bindings: Tegra coupling DT
 conversions and cleanup
Date: Sat, 19 Sep 2026 02:31:21 +0530
Message-Id: <20260919-ti-tps6586x-v3-0-63dd240f4684@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/1WNyw6CMBQFf4V0bQ33Ugq48j+MC1paqJFH2tpgC
 P8uxRh1OcmZOQtxyhrlyClZiFXBODMOG2SHhMiuHlpFTbMxwRR5WiJQb6ifHM9LPlORM1UAQAW
 FJJsxWaXNvNcu1ze7h7gp6WMiLjrj/Gif+12AuPuU8a8cgAKtMikYFxkKLM5tX5v7UY49ieWAX
 7cC/u8iTakGlLrRgjEuf911XV+ofasx9AAAAA==
X-Change-ID: 20260821-ti-tps6586x-b54e7111917c
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@avionic-design.de>, 
 Lee Jones <lee@kernel.org>, Shree Ramamoorthy <s-ramamoorthy@ti.com>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Dmitry Osipenko <digetx@gmail.com>, 
 Svyatoslav Ryhel <clamor95@gmail.com>, 
 Laxman Dewangan <ldewangan@nvidia.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 goledhruva@gmail.com, m-chawdhry@ti.com, daniel.baluta@gmail.com, 
 simona.toaca@nxp.com, j.bhargav.u@gmail.com, mfd@lists.linux.dev, 
 Thierry Reding <treding@nvidia.com>, linux-tegra@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789765290; l=1955;
 i=j.bhargav.u@gmail.com; h=from:subject:message-id;
 bh=ZRyjLwuWb+X9g9IpWHeNCy8T/E28/fkf3KvfcIaopTA=;
 b=pDWSttThJKmSFzcPLOWIIcnuPe6VgcSiNvLmer69KwJPqMHHUZ5ptr/3bl0iXCSPyu84XHxru
 iuqZob+NJ0TBIt47S6zvpR7aVJgVPcmTD2rBdOtTLbQf/sqkllZYKhf
X-Developer-Key: i=j.bhargav.u@gmail.com; a=ed25519;
 pk=IqNDwUZKECEA+n8wXctFLBbYL9NhFstZNbOznm/nX1k=

This series adds a shared DT schema for Tegra regulator coupling, 
updates relevant PMICs to use it, and converts the TI TPS6586x 
bindings to DT schema.

Summary:
- Patch 1: Fixes existing TPS65910 validation warnings.
- Patch 2: Converts Tegra regulator coupling to DT schema.
- Patch 3: Updates Tegra-related PMICs to reference the new schema.
- Patch 4: Converts TI TPS6586x to DT schema.

Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
---
Changes in v3:
- Patch 2: Add '>' to description
- Collect tags
- Link to v2: https://lore.kernel.org/r/20260916-ti-tps6586x-v2-0-f12cfdfb446c@gmail.com

Changes in v2:
- Add patch 1 to resolve warnings from TPS65910.
- Add patch 2 to convert nvidia,tegra-regulators-coupling to DT schema.
- Add patch 3 to $ref to shared schema.
- Patch 4: remove individual properties and add $ref to shared schema.
- Link to v1: https://lore.kernel.org/r/20260822-ti-tps6586x-v1-1-93cb46b32b27@gmail.com

---
Bhargav Joshi (4):
      dt-bindings: mfd: ti,tps65910: Add wakeup-source and GPIO hogs
      regulator: dt-bindings: nvidia,tegra-regulators-coupling: Convert to DT schema
      regulator: dt-bindings: Reference Tegra regulator coupling schema
      regulator: dt-bindings: ti,tps6586x: Convert to DT schema

 .../devicetree/bindings/mfd/ti,tps65910.yaml       |  20 ++-
 .../regulator/maxim,max77620-regulator.yaml        |   5 +-
 .../regulator/nvidia,tegra-regulators-coupling.txt |  65 -------
 .../nvidia,tegra-regulators-coupling.yaml          |  74 ++++++++
 .../devicetree/bindings/regulator/ti,tps62360.yaml |   1 +
 .../devicetree/bindings/regulator/ti,tps6586x.yaml | 196 +++++++++++++++++++++
 .../devicetree/bindings/regulator/tps6586x.txt     | 135 --------------
 7 files changed, 292 insertions(+), 204 deletions(-)
---
base-commit: 9f0346dcbea363787186c94ef94dd01aaa215afa
change-id: 20260821-ti-tps6586x-b54e7111917c

Best regards,
-- 
Bhargav

