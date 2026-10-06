Received: from mail-pj2-f9.google.com (mail-pj2-f9.google.com [74.125.227.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C0013B4E8C
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 07:48:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791272925; cv=none; b=TyXEJsftTQ2lVnN6mvXjDzrQVcS2OpnG+LqGb7b8rexB64J/je2SmoV3FuU3Tc/acoQCiZAMaqkPr7vP8or9Ib7sT/7a7SzkaqS2kslJ8s3bxeEoFyQ5xRDSjT6x1tNldsQMSLBg6vsXFPJaxeLaksF9QbhnF0U7OXFiINF7zsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791272925; c=relaxed/simple;
	bh=+jOfCnFXSfPxl0yaVoDKsZecnSdkpw2ZpHxdR4nJTGk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BIjlcg0GMvvllWhjtR3szWXBEQKZJRpgRd+o9v1ntEsyXrIodnOvGkv9xBESFpiWzS3IAizw7m5vRdmC8LR+yVgbbaKiosbkmxLyOg0Sj6+DeGXJsnl0gqfsDVWk4V47ezpwvRMCdG692rV6e8JzsnsdySSJe2wSEtybh0NbVcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bF5vgcAB; arc=none smtp.client-ip=74.125.227.137
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bF5vgcAB"
Received: by mail-pj2-f9.google.com with SMTP id d9443c01a7336-2e4a61a2ff9so11956395ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 00:48:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791272923; x=1791877723; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5FZEAA0Lgtv6ilrYXH3YJyGzw6r/Idq0zYgWK6iHl90=;
        b=bF5vgcABrZUQnZpqQ0fBKF5O9JjCbzwpEdVy9INifLC4k9T9zQfyQttEBetsZ/APim
         Y16Rn14cLYRo9/x1TaTat4jnsa8/1w05D7cuCXVpLA9s+eaNVEl03S+Fe00WjyjmhORB
         8yG/mLux9/q4jvERkjyyOhjvcAxZmVZQP8LLdJfjGSBrtn8dIq/6KHRgiKwjijgtvb/5
         CWIGTjlB+2UwrJCwM/mOfRaNscYysGhNhk6vOTh+O8oNThm/eD0BSyaHpbvyUcctiWL/
         WekBHWAssJNKpxE+NVgT+7RbjTN3I1sTHggCYqGt6KczuXnIZJa5TgAh/iBOmwU3LGcv
         pe/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791272923; x=1791877723;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5FZEAA0Lgtv6ilrYXH3YJyGzw6r/Idq0zYgWK6iHl90=;
        b=dSP7O6n2DH40xqtpXOZbf5ZTxTWwbR5Lb6pyr2N2KH/R/qqW9RdbRm/7ouazH3nWg9
         jR1yFKP3OWa2sreB3MrZB4YcEu5ifgfZmOTekH+PyMcxwbQJom6iTPd5GkR6ETlQ6Rgt
         tN1MfhrNKR+yzUq6HkzZLL7PHIh1FANug7+cDlqelohzFikbkXbR4CZJ8ffytJJGxCtl
         PUY+1vP8ZzXXdx4JQWsd9AC7D3xhAkwTMH1nc6mHHjnCb0bItdJRamDTCGCR0QIpsTNZ
         rIkqo+chcPW1u6lZ8AdD3L9qG2RXFNN2rsdyNmt2BLydi/17LWCodpMWavQKedFOFt6Z
         yRZA==
X-Forwarded-Encrypted: i=1; AKwUvBwpc3JaxZi2WkuK5Lr6EsHQ5qxtQIvXNjyD4nb/6RSXvORfiMW5dYNFfi8taq1I2s7u9nqxslR5ViowFFU=@vger.kernel.org
X-Gm-Message-State: AFuF++mCxKjUEDHUtiSJVo1j1m/bbTXesnhkDRbwuAE4EoD0a52HCogk
	jmV+SBcsnoOHKQxCNUFefsS7dT2OnZv93Xy24lbjarBrz0Vs8UqStVeH
X-Gm-Gg: AYBFou1qZZn/Xe6lx224g+HM/ZPC5RCiHkL5DAYyBL+eUGqq3ed5xLuRUmUWD08638e
	TEmfYU/JLo705VjbRvFpEkaVHyiCX5xzmO+Qw+HWeet0EfwlezeSDSQXRZ88cPETwTbIlPEkQrw
	mREvwaDCQbJMzwUIEoJARRTe7PSpTVRdzFY7BeczFHVPdJ1ymU1iddvCu7sEaWSLAwwX4ohM0I2
	SeYna5GtZbX2SoVK5tWOUdzaf5m/R503JAeGErLFXhkONhZXIjSD7bWT9Ogq/UDzLs9F37moSsC
	oMk8xE8UsU13F21AO1OUk3m6KwVyDxySvI1sx4ESNJvzo3LbWk6sxNMH16n2rN8ilq5KCyOdhIi
	efPOlG3zBjSrfAJTj5mxbGtcb/Y5j+c1JGMpCO+h9sHgEl3GwY5Q9alyWkpdGjAT0PkBc5sfIb1
	MzlPR11HoOD5Myl6TKDkYcPVIQ8fsFBrphehnkTlaZb70pSI6KMQin9UeWMhc+RppsLgBw
X-Received: by 2002:a05:6a20:94ca:b0:3dd:85a8:4c56 with SMTP id adf61e73a8af0-3e1246dea5dmr525873637.29.1791272923390;
        Tue, 06 Oct 2026 00:48:43 -0700 (PDT)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cce6d2406b1sm1998173a12.8.2026.10.06.00.48.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 00:48:42 -0700 (PDT)
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
Subject: [PATCH v12 0/2] phy: rockchip: naneng-combphy: add SGMII MAC selection for RK3568
Date: Tue,  6 Oct 2026 15:47:47 +0800
Message-ID: <20261006074749.2010233-1-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Changes since v11:

- Revert changes in v10.

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

 .../bindings/phy/phy-rockchip-naneng-combphy.yaml   | 13 +++++++++++++
 drivers/phy/rockchip/phy-rockchip-naneng-combphy.c  |  8 ++++++++
 2 files changed, 21 insertions(+)

-- 
2.47.3

