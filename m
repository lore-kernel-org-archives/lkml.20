Received: from mail-pz2-f7.google.com (mail-pz2-f7.google.com [74.125.228.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4239449C4DA
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 16:28:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791304099; cv=none; b=mRMQTYc9knJ/ppa3CNI/vf+Ps8cDJyvjkgoqlqT7jMXwuamBmfPkB5ZitmxRFD1JEsSEqmwKpHQ7lVQm0UxkDZfZZBGBEtSxPMfcxxggvTtPJdgHemk/16htwo9OVkI6dR6PSLjNj/ek5seFzu0Os3uNYpa5Kl4Pl1f4sq6yHFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791304099; c=relaxed/simple;
	bh=hiyW8Ip4dlaQ0Aem4POCsGZGRN80n8JOfwWDEi4ASNM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZlG5Jnu00qWVJEXUlJYgYCi3D6u5S1Jok+/9HeKxwiyvM8rKdRcSAqArpb44H3colZW3N3P/IppE7fTlw6Ahk5x8pCxN05ANvDpbBpXjbUrgWF2Gt7xBXzrxyVupEJsd4nCxWrWtw/a46ifx2812VN1NsQYTnIMuXfgJ65K2/L0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L+dYQeSz; arc=none smtp.client-ip=74.125.228.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L+dYQeSz"
Received: by mail-pz2-f7.google.com with SMTP id 41be03b00d2f7-cc7c6cc3513so501293a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 09:28:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791304097; x=1791908897; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=iyS59LHL863YniTBRLDQIsOwBigLIOw+B5p59bUiqbM=;
        b=L+dYQeSzm/fAIbCgqtrhUyusjiQF/TQDET24kidMYbTqR81/kNljoj6DHLgo1KDYa3
         1Iamww6KgUssGhLE63wOM5I0OVOR66fVQ2Z/b+npoOq4C+hzoWnfTS8fzV7LMsHUZksC
         jjxjwbuSalNoBZDL0tssjVsCGmVMddwQy/ztFZT8Zm01SNKJwad2H2l5HFnffQYs19mX
         zvpsbb0Sbl6F1rdyLo1znxdnieqC/3o8znsKm4zdhU8NSPQetT4+9o0NS6bvNqpUtiun
         M1uzYSIvp8Ha2/+9rv4P9pVktawGGvFTx8VZrP3fGUiJJsbUTwfaEWsBw6l7J4WEBvgu
         Feaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791304097; x=1791908897;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iyS59LHL863YniTBRLDQIsOwBigLIOw+B5p59bUiqbM=;
        b=VGhb4A8CN0ZpsT8Wcgtjfbf38YXVwhUXxn6gOJ7IC33ZzHZKzphI7FYIhoN/L4+Lep
         NN/MDkfVeIyktFHaWJBXbNSM8IxyX6zOPvI3gC1hL+dTNS2oVqbvF9KgXcvTQiZm16Ry
         puF5A3vpcbGuMH0C7nh0CJqztoZWmmOvF6723rhu14gFlr9AS/sD277yY0p5ZlShjlkE
         e0DTDaL8QOtmfLeAoIfcb1o5w7xTCgE27Mu/4DLucYYMgkjsd8EVA8Rfsf+afoLvo4Qg
         wTt39b7jS0QaQx4oz6tGEJWBTfQbTn9ialu41pZGynOCWcqw0uArR6Z+/jlgvSYDv+np
         NeDQ==
X-Forwarded-Encrypted: i=1; AKwUvBy9JuCdRr9dinYRKi9MEI6iSW4HHJVbU6OkrdGOMZqWyRA6sFMQ0Gh+nHOBdv/sJSJM9Z914wO5Vfkan+0=@vger.kernel.org
X-Gm-Message-State: AFq9FYKN4imxJmA0248jt+iuG3dEMdD+NoL3sVQwUgns69+lD6IXz/VU
	9XnIyiIMnpYp5LlgEWGMb+tmIRPVh/GyDtLwm6EzRqIYVSWujRaCvzZ+
X-Gm-Gg: AYBFou3YjN+XNoegauyQ4+ZVNl8Xf8EGR7uju8qzAAT9H50nsTPlPqD8VjPwebWLGZc
	lY2vJ6Gp24SLYnHKu81s+81xy9TREJ+tMMSybbWBFfc2298VOYxHql097IL+UwR5gXGFZgvX4aK
	DcX3+mHydUu6EMRWJmWxuAZUefeUtyUrFz9R+wTKnsR5c25Zzjiz94IaXWRC4UMUpieZF60FoZP
	3Zq7EbPpbxQ42GYtiAovRYOJIoYB1wjUwfXiCIlwKvJvRIEDzKmwiHmFmbEZAnLcm6Rjqe65FpU
	LcHSfKBBnB39Ffe1PG56NpejkjBjTsc0+Kqtb/L3z7fB0jrr27zlK5r3VIuZRccWNvGofryji4v
	KDbbgX9EekM6EE0qQl6s2tJ26EuQGSKJ+f8wZTgyDnRuuv/NbmF83aCddyEDidjoKf0VhTlYIeT
	qi5KBXDZXnO4x8M8kx0TBQ6qvUTTbb0Od5A5ZNytJMo3brgGAKZ3UMHEUmIgELN0nuo6v7
X-Received: by 2002:a05:6a00:3cc7:b0:881:f5e1:6e8c with SMTP id d2e1a72fcca58-890df4ab129mr1783463b3a.33.1791304097548;
        Tue, 06 Oct 2026 09:28:17 -0700 (PDT)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89188a0d603sm259898b3a.19.2026.10.06.09.28.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 09:28:16 -0700 (PDT)
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
Subject: [PATCH v13 0/2] phy: rockchip: naneng-combphy: add SGMII MAC selection for RK3568
Date: Wed,  7 Oct 2026 00:28:04 +0800
Message-ID: <20261006162807.2843858-1-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Changes since v12:

- Only write pipe_sgmii_mac_sel when the property is present, leaving the
  routing unchanged otherwise (Shawn).
- Validate the value in the driver and reject anything other than 0 or 1
  (Shawn).
- Drop "default: 1" from the binding; the property is tri-state, so no
  'default' in the schema is appropriate (Rob).

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
driver routes SGMII to GMAC0; if set to 1, it routes to GMAC1. If the
property is absent, the driver leaves the routing unchanged, so the
effective value is whatever the bootloader or hardware reset left.

This is necessary for boards such as the Ariaboard Photonicat, which
uses the SGMII interface connected to GMAC0.

The DTS changes using this property are sent separately to
Heiko/linux-rockchip, and the net-next parts (XPCS glue, dwmac-rk SGMII
support) are sent separately to net-next. There is no hard dependency;
the pieces can converge during the merge window.
---
Coia Prant (2):
  dt-bindings: phy: rockchip: naneng-combphy: add rockchip,sgmii-mac-sel
    property
  phy: rockchip: naneng-combphy: add SGMII MAC selection for RK3568

 .../phy/phy-rockchip-naneng-combphy.yaml      | 13 ++++++
 .../rockchip/phy-rockchip-naneng-combphy.c    | 42 +++++++++++++++++++
 2 files changed, 55 insertions(+)

-- 
2.47.3

