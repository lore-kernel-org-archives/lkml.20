Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0970E3D522C
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 12:36:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787747800; cv=none; b=i7on067FdsXyqdpVBCzVpei4dOyzINP1peC1ofE17MM14yLF8m5KgBOmwO2o1PQpToo/QfhAeX69Re9/lQ0Drp7mwwUtba6cJ59tTZnrf/xDgT7uEwVxCZ8EijevzVNXPqoUCv/X2443Y36H8F6fu01ueaDbnymsG0A3eKAQ1/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787747800; c=relaxed/simple;
	bh=bZCTslaMfY2yHuls00yoeNHJSejBPMWhnKOx5GZU7Pk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ky2D9jrkx9bq+2QfiJinjiB4RZFQxpb1eV0KH6sWtLIza8hql7uk49XMOZ+P47FKl8s5pC2325wN5s25UwcFnDQuosuN7MnrCR8isrrTr3G2EuzMNKHWSe24n85VfcZDaSEhgj+i/qboVUPOenkQ0IVnVAFUs0NCMWAtqTnJzek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cmL3a5Jy; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cmL3a5Jy"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-49800c6a846so7055835e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 05:36:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787747797; x=1788352597; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=W53+ozmmytCKTsz87hYJRPt8O2Llloot50egnShiA6I=;
        b=cmL3a5JyS0AuNTJC+EGHhBr3h6STNiq7p4P9sUmz+8w2lRxrncrBLIOgwXOy/FjLMR
         fx4qyQSjXyN/Z9a6ibP4nPB9z5luJqgfykhGKAe0uUxKCqNjKus7HicRG3t8SXNNREDv
         IgHgv7gUX6pctWhhg9sWS+A4iUmFyzsood+GLy3TbWZ6pcqVmtB6ZfUwkexzjETmPXiW
         u2i+a64sxb8SdVU1rF7eHYlYd14ycYw49fHWTBwU56F55qDwnDKkvdygpLL1n0ykHL6M
         Jh7RFlcxG+9UwOEQVMqmEK0mwiNLre8YreLl6qZCxgUOltmxhMsysZ6a7r0gyMe847Ej
         zbuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787747797; x=1788352597;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=W53+ozmmytCKTsz87hYJRPt8O2Llloot50egnShiA6I=;
        b=MyBIGgp9XuHbKBjedTopFSflg9SFXF/eQpWMWFmnEVZsHUSWtYAHplOtLrXS45EECp
         8JXP2fkAVahKKy45fFQg8IG/QuZhkr/fm6IF5KFhiWvSI6FIY3uBkuS+k9jE1nN1auGj
         Wxe170xwEcjpQEcnADP3io8DH1J/y1Phb3AienNpcFluUsh6GMdxqQuV1I+K68k9mh5L
         2C5N8cEiME+6dzXDNsNkogdEqHzu/BRdTZkUprk5Cpx4HUPIMrIQAm3xlBaYp+37bFUQ
         qFIYmdDPUZQGixMGgX3N6UoJkv1Q2OdDHilbdl+zuVUBHkrZ3ej1D8vr1GWfjt9Ck+fr
         zH5Q==
X-Forwarded-Encrypted: i=1; AHgh+Rpn0rfskrHCHNVlGSQEyk/m7UbRpIYUt8fEITMHjJFkbOJ2xxMErJwGXNGp1OZvPopCOT3tF5XNPCQ+oYo=@vger.kernel.org
X-Gm-Message-State: AFuF++ksvI/ukb4fhKP5zqwpHdrI1cmgZLa2MhvOYdUFrt1ZYjVsnR75
	HcDw4y0GBxYIWKqBmRKcw8krH+/cr4HkYRa8GMxz7FWrLB7dqt6fnvBzzhPGZA==
X-Gm-Gg: AR+sD11Y6EsU2ws6xd9ld7ajeCoSDENiC4cFx46+Ieh+KoiWjOZvfPh25BrKzEoBuve
	o2XLv7KKaBWL/K1a9ohchrdj3L6mvSHBtosSlEjf8KxV0GQQ578l/k2pBAgpwOvPwQAYeNg3+Q9
	iwhQnGG4+aOLSARBVxHZZnZG60AS+5JU7S9xo62z+J+wt2M+OYtaG/n1kGTpMIb4hgsUbyMT5uq
	2m9e3J6ywud4KKEQ0aS2DNMUn/U6myHIYQz7YisnwiCrtAXcZvv8YkIkDutx9SHWbedG1Po/s+g
	gtNQtm9+oxWT8pBSrolz19PSBsRYqWwi6Y5OcKIUKZxloGFAjb9nKqwTCBueg7QEcU+ajuK8l7E
	TlnEUS0EdgDIHPR+1D86kfbGOub3ZoYdjQmdJJKZByQMgF5t8BngG4jWL9BwAWq70FHscyrL5Up
	UOQv+j5vLe5zd6vo6XUkC/29SffvSzE/MUQNJzK7YcmDHvkneWHInqXj6l6TxRgv905IrXHKeZ+
	lTL6lEx74bs5naetUipT7rWfXLsNJFpGl8mSbvq2DOqBgU=
X-Received: by 2002:a05:600c:4503:b0:499:8b13:3a98 with SMTP id 5b1f17b1804b1-499dc6f6856mr63320205e9.4.1787747796976;
        Wed, 26 Aug 2026 05:36:36 -0700 (PDT)
Received: from [127.0.1.1] (lmontsouris-656-1-83-121.w82-127.abo.wanadoo.fr. [82.127.110.121])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499dc977692sm26009465e9.6.2026.08.26.05.36.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 05:36:36 -0700 (PDT)
From: Amin Gattout <amin.gattout@gmail.com>
Subject: [PATCH 0/2] Add MIPI CSI-2 receiver support for RK3576
Date: Wed, 26 Aug 2026 14:33:48 +0200
Message-Id: <20260826-csi-2-rcv-dts-v1-0-bcd8d459684d@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACzdjmoC/0WNQQ7CIBBFr9KwdpIyMAV7FeOiwKBo1Aq10RjvL
 loTly/5/72nKJwTF9E3T5F5TiVdzhXkqhF+P5x3DClUFthi11ok8CUBQvYzhKmAMRJdsEoH7kT
 9jJljun99m+3C5eYO7KeP5LfIfL3V0LTM/p2+WSpyDfmoyHQQxv0DULU6Wm1Rkutn+ZG4oTD4y
 +mUpr5xgaK2FFWsb0RytiOjmGg9xNYZJM1RS6vF9vV6A70FmTnwAAAA
X-Change-ID: 20260825-csi-2-rcv-dts-7712bd834de6
To: Michael Riesch <michael.riesch@collabora.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Amin Gattout <amin.gattout@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787747795; l=1518;
 i=amin.gattout@gmail.com; s=20260818; h=from:subject:message-id;
 bh=bZCTslaMfY2yHuls00yoeNHJSejBPMWhnKOx5GZU7Pk=;
 b=D5SZuHOEZFLq4kV/bI0disa6qhctUgipBPOTdKl3tjbmw47te+DHUq8yqwhgqFIQKWdbWjzoB
 vOdGow0S2mZD2zoH8t894Bq5c5ei5wyPao485qKRl2S+x7izKKzRIWf
X-Developer-Key: i=amin.gattout@gmail.com; a=ed25519;
 pk=MSIqDPkCOkwtyP8Fns1m+KFU9SgqoDl2mpLe18vL+hQ=

This series adds the device tree binding and the SoC nodes for the
MIPI CSI-2 receiver units of the Rockchip RK3576. The receiver is the
same Synopsys DesignWare IP as in the RK3568 and the register map is
identical, so the existing driver is used unchanged via a fallback
compatible.

Only the two receivers fed by the Innosilicon D-PHYs in full mode
(MIPI1 and MIPI3) are added; see patch 2 for the details.

This series depends on the RK3576 CSI D-PHY series [1], which provides
the csi_dphy0/csi_dphy1 nodes referenced here.

[1] https://lore.kernel.org/r/20260820-rk3576-dphy-v1-0-70e25e8d5e78@gmail.com

Signed-off-by: Amin Gattout <amin.gattout@gmail.com>
---
Amin Gattout (2):
      media: dt-bindings: rockchip,rk3568-mipi-csi2: add rk3576 compatible
      arm64: dts: rockchip: add mipi csi-2 receiver nodes to rk3576

 .../bindings/media/rockchip,rk3568-mipi-csi2.yaml  |  1 +
 arch/arm64/boot/dts/rockchip/rk3576.dtsi           | 52 ++++++++++++++++++++++
 2 files changed, 53 insertions(+)
---
base-commit: bd5f485f3f026225b86573e559af0b7254ef4184
change-id: 20260825-csi-2-rcv-dts-7712bd834de6
prerequisite-change-id: 20260819-rk3576-dphy-2304f848215b:v1
prerequisite-patch-id: fbe2d84f88709b8bf846debe6b8ce62c4392ca63
prerequisite-patch-id: 9bce33933ae69e8cc7f7ef2f0d9acb969620bc85
prerequisite-patch-id: aca697161c21e19fe3a7f62f208da0f6c3b666e1
prerequisite-patch-id: 8f45701f840680a35e044f43ebd3087282847990

Best regards,
--  
Amin Gattout <amin.gattout@gmail.com>

