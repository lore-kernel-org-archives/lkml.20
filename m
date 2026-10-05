Received: from mail-pj2-f7.google.com (mail-pj2-f7.google.com [74.125.227.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 099B042E417
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 22:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.135
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791241196; cv=none; b=EvLyusDUO+TqstjUSZ8lMWvA/ep81+qSFsJVwyyhGkICHNeZFLltfpHZjBswTi7Cy+ODHfpRlbut6XC3Ino2NGOaDPWG+2V1JDsuX7o/n0pvc43jFn+ptxEcJk3P5KT9XPFJGGYCe/SJcqNTqlgFm2fdSUsXS0ZSQIl00JF9dV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791241196; c=relaxed/simple;
	bh=qxgnHters5EZb5yOUvI0sltyapdlY8DMSj5hYLQRAnw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mNRMMa1dzy4pXwtSP8ET4CUxULZyqJtUsy6IXJ2bGO+eqm/TgR4zlUSeVptroU9VRDyJdp6i8XN5ruQOVvU/4+tWkZYK4LZTX2LaZYlVZZxoIq8f63jB5N7tjQZ0cGDd0PLMw9lHwgvFEElhifl7HGHFUTHYsiurZikfNLUhKP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cxQO9/dM; arc=none smtp.client-ip=74.125.227.135
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cxQO9/dM"
Received: by mail-pj2-f7.google.com with SMTP id 98e67ed59e1d1-398da2bdcb9so478316a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 15:59:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791241194; x=1791845994; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=h3ikYaSpRCSX3H8ucJ72hbBucRgUg7rHXJ+trb1hlAM=;
        b=cxQO9/dM6Zl8UkrI6i0CzkY3nZIwX9sPMet03YB48gWJZS7JUloi1kUsyOj7KDC0Ku
         q4o3ynaEcxlzI1Zdrw+SNfcJbEj7TskJdQvPR5V+Nm+sqrdqNNYHUkvIqHuzRTIwLCT6
         Q0ARfwCI/d18+SVEn5vPKfuwaKfs+E7tRrz7GjjmrmaTYvv10Du/b9BmQuOqoqsf4lKc
         z42t1jWFjf/P16joAv9TUPItUj0rIWz2M3gUmWzr/e6+OzEr8cLWAxpzA6HtfoYGH0cM
         xLJhdn+r0VY0bKUvZRiPJKVMLpuWOM3iXRSpwae8MmxGRxP8o7p/IaaH3y0ONa/rPAnt
         ptpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791241194; x=1791845994;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h3ikYaSpRCSX3H8ucJ72hbBucRgUg7rHXJ+trb1hlAM=;
        b=W9gw9giAw3WhTkzv+7swTKLiNCyC37J0g/E2hq9T56N77jFSkfroFhYuZDf3KnJ/QG
         3ek+KJ2elF4O0Pg/ENsuhp6NYa4x59Z7sq1ueujxHnhI9xluVi7mOmPZVTPRdKk0wTbI
         21SGnhCwa5gO4l//SiPd3LF1sWDbkdQo1T3Vls/UP/Y33V6B40eaUP1/BKszNCKK57Vz
         B7T9rERXOySvT6v7p8ZC15DlbTm0q1gU6VcHJOCDZZU27RcrK7Fnz9r9sXGsOiPs9z6W
         WesI1i8iWLe8F9fRx3UslIOrDXCg9GRPUtPUJtE+xLm7NTAjgqxTyBP4AQ8nm+Qi2oSw
         X7Rw==
X-Forwarded-Encrypted: i=1; AKwUvByFhSIBbpLr+F/IU1pomIMcntor0FCfFZy8isHcnlOT2/iK5H/Ss5//oSVtIovUXgcDxitigSwtqb8o0b8=@vger.kernel.org
X-Gm-Message-State: AFq9FYLBxLc2W5o5AufBKkItIXR6Ee7cTDoIfSs8taIpFUmQFZUa3gZ5
	/E014AFaWB8JbMqoil58uvsgJMbRsP5mu4p8eWKotbQZ0yVjkBv/o0yp
X-Gm-Gg: AYBFou3jrejJdQdke7MQqGBzuQcNtbM8gf5AgWmLAAmLBupDwuFFkKuISEVuT4olu72
	CDMkptxwALbtZXu9reFBU7cOSOs05LEdLDKzlakk4LM9frRma8dIFOG5ha1DIBIUX/ncCmTCrXk
	1IiG66sY821wi/Ym/R7D0iw3MUOKyU/EHL1d7YzrnnIKzjL6VmLyhcpqFRbVoL4V62WgelrMf2W
	4JeNDx2f9+9WYxWuN//DoOKq60TNuAfMNK6LIujDKeIz9Co/GLcLjTU6NktjR7qEa3lECVxaZlD
	9yMXYakc2pARuw7XJrWU4hhTFSCVlqi5TGAuYWk5LAHmOZi1C2pfMom9OD2MOW6nbPKc0A6moX9
	H0091ujqLntAd4nmK2q0mJ6AbQhziR17y6SDziyygwG0wVp28/4ujqykh4W/KO9YplUWaIqbeP8
	Ni8lbWGN7FN4KE7xU181Tc+yuJwBMzeIis9om8ER0A/FsMeXk9bN1ViF2mJxf9ydYFEvy7
X-Received: by 2002:a05:6a00:94d1:b0:886:3d9e:aac1 with SMTP id d2e1a72fcca58-88af58d4ef9mr10577114b3a.45.1791241194303;
        Mon, 05 Oct 2026 15:59:54 -0700 (PDT)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-88b0b8f5b79sm4183327b3a.15.2026.10.05.15.59.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 15:59:52 -0700 (PDT)
From: Coia Prant <coiaprant@gmail.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Coia Prant <coiaprant@gmail.com>
Subject: [PATCH v11 0/2] phy: rockchip: naneng-combphy: add SGMII MAC selection for RK3568
Date: Tue,  6 Oct 2026 06:59:42 +0800
Message-ID: <20261005225944.1171574-1-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Changes since v10:

- Drop the top-level "default: 1" for "rockchip,sgmii-mac-sel".
  dtschema injects top-level defaults into every matching node, and the
  injected value conflicts with the "else" branch that forbids the
  property on non-RK3568 variants, breaking dtbs_check on those
  platforms. The driver already treats an absent property as 1 (GMAC1),
  so behavior is unchanged.

===

This is the PHY part split out from the v10 RK3568 SGMII series, sent
separately to linux-phy as suggested by Vinod and Jakub.

On RK3568, the SGMII interface can be routed to either GMAC0 or GMAC1 via
the GRF register pipe_sgmii_mac_sel. Patch 1 documents the
"rockchip,sgmii-mac-sel" DT property, patch 2 adds the driver support.

From the RK3568 TRM (Part1, Page 229), PIPE_GRF_XPCS_CON0 bit 1
(pipe_sgmii_mac_sel) is defined as:

    0: SGMII routed to GMAC0
    1: SGMII routed to GMAC1

The hardware reset value is 1 (GMAC1). If the property is set to 0, the
driver routes SGMII to GMAC0; if set to 1 (or omitted), it remains at
GMAC1. This is necessary for boards such as the Ariaboard Photonicat,
which uses the SGMII interface connected to GMAC0.

The DTS changes using this property are sent separately to
Heiko/linux-rockchip, and the net-next parts (XPCS glue, dwmac-rk SGMII
support) are sent separately to net-next. There is no hard build
dependency; the pieces can converge during the merge window.
---
Coia Prant (2):
  dt-bindings: phy: rockchip: naneng-combphy: add rockchip,sgmii-mac-sel
    property
  phy: rockchip: naneng-combphy: add SGMII MAC selection for RK3568

 .../bindings/phy/phy-rockchip-naneng-combphy.yaml    | 12 ++++++++++++
 drivers/phy/rockchip/phy-rockchip-naneng-combphy.c   |  8 ++++++++
 2 files changed, 20 insertions(+)

-- 
2.47.3

