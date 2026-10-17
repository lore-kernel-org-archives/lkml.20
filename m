Received: from mail-pz2-f6.google.com (mail-pz2-f6.google.com [74.125.228.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C6734CF49D
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 10:33:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792233206; cv=none; b=BS2HiwMI5iw/6muvXS/Q0J5lCGDBoXTLjB6NYKYoPTn8XSKNGO5vQFWHfdHJYwIueZ9xJgOPocXzOBPqWjiKVDfzSljvcZsLKtJ0zHoNVGzeJaR4vPKf9Hzyv6WCFUtnCJOA/JH3nU9PaW1Vp38bovzKJUg39LMwXK0EuaRFlMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792233206; c=relaxed/simple;
	bh=h9mpyNGxyB5LQ5/f3cT1zd18jPmDbLcsYpdDrXeaHok=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Mxo4E2MJGhZ1CQdNaeHukzIX8HoxjazYhh5pF55cjwhUmpO/vvtmKLvTXLFMrmmBi439yjcAQMQsXvwGCpwnq7MDC63zcwTzKAkYDLPv6Ul9whXUdek9su4327bJTYp4KtORxfR7s64iovpVSpQpanWny0SMrZyjpTJBs9Ew10Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z5PW6Xyr; arc=none smtp.client-ip=74.125.228.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z5PW6Xyr"
Received: by mail-pz2-f6.google.com with SMTP id 41be03b00d2f7-cd616db42fcso287538a12.1
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 03:33:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792233203; x=1792838003; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PE+HwLCwRnxv9Z9DzgjUbOHs4/5c++tnA7FG82mBFBc=;
        b=Z5PW6Xyrb/yHCZXJlD0saKWcSdUBpdU3jem+YD6Axvy/lfkg8c46WTi57EGxP8wPML
         nOJelPuKjzD0gxHRHb91NOdRtoc6hBhlizF7k/nMrY+tp2kNMz/Gl17bpofUdeqnWnS7
         nl7Tvd/cSL6dNnFNpLHjYCpJnsx7fhaQLMg6LDNrgyuGqnRXjKh+PnFOxDd1tLzUdoxw
         xFw6sJi0tuXZVuSLIw7/VZHo1Q8pJzztoYqtHrQRSmjaH8Y43E2jfgz3wjej3uiYNn1h
         VVBusgsy18DUC1ihop3szHiEZi9GrfAZ7ir1GexqyG/i/SajVAF0IVW5yulhFH6LZvb9
         kN9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792233203; x=1792838003;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PE+HwLCwRnxv9Z9DzgjUbOHs4/5c++tnA7FG82mBFBc=;
        b=NnQQBD5mL8CTLXFJl43higbKsrn+EJRZ57qbXTY8u/+lUlr0yWH3hqhzZen3gUb1MI
         kEwDQzVxyYLu5lxlnUnoKIwBGM2myucCzYfA0m6LQVp2UfbRMmdHrKgy1Fk4xIp0KXuf
         zpeUkSUL8s3cUW+t0PR5PGzvfDnJOPCiASXkDseuHcqQM+ngB8ECEPT2o0c5nXQcz9wj
         eXBNFUQk/vQO9lQAiDCNIf9r2HKNqgEsAh7VTO8OmD2CDu45xtANTYGErpnmkMDnZVE1
         XFrqY7gjDYvF+IKsodR+HHvM+BYeA7D6Mjsg6CjH2QcZsu7+fnuVivnig9lXBADUkG0v
         XHWA==
X-Forwarded-Encrypted: i=1; AKwUvBywByE9FC7yPBA98hL2cxUtHfRkwHVgUlFwkUCWdEbrL34bu1PoDWLnbLUrEAuOgeeQiXVA8uRqLTK4uj0=@vger.kernel.org
X-Gm-Message-State: AFq9FYK24P2IlK13OUVIjNrSDswBtFpApOH5boEuZTVMybFxmWWzBWjV
	XcIfqTixn+9VzYgHhsknDWA9+n3javQQ3hq6ab+7gJ4/QbLud0EWIziD
X-Gm-Gg: AYBFou2L9ylDZ68Pk0KnlHgoacWJQ06K4Hng+B2MFeSjW+vHNKnh4T76iprpscYN67y
	yxZWR7jNvCExM+mpD6+/RvqfoEbO/yPvHF2wEpPfKCSALU7Byjv2Q9sOa2tN4a8oVnND2sw3d29
	230x+3y8GwrJkKF5VHkpd5iqpqdR07Ob08JcTKck5oJ5g0xFkedZ1kwgoXMu0ETvspwjhXzrHK7
	hH7Fwj+BhOWPo/FWzaqwZx9LGM1msE1QKcr1OpDPqZfQcZWYPr7g/vWH9FIZUAMAeNvNNq8iQz/
	sagboTzhYB8XxV6DbYs1ARW7CrRPh0Ev5d0wAhIAb6ugljNszVJvRtwbfgWNr/04IAArqwa5epE
	ALAmlxxp+Lf4nzZd77sKzJ9neo2OMDpf/WcdaH7cddI+viPUMhPGGNZappmk9YggRkZQY82CIU6
	e8PTlJIBzX4RGjb5A2KXX7ePUIPn/WXGCH0ouMDoGyJRF5l+MNQR1gHKe6
X-Received: by 2002:a05:6a00:13a6:b0:878:34d7:6a24 with SMTP id d2e1a72fcca58-8a04be4a6bfmr1651573b3a.38.1792233203390;
        Sat, 17 Oct 2026 03:33:23 -0700 (PDT)
Received: from Linux-PC ([2a09:bac5:1f0f:372d::57f:4e])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89f58414986sm2051585b3a.57.2026.10.17.03.33.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 03:33:22 -0700 (PDT)
From: tianshi12127 <tianshi12127@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	dri-devel@lists.freedesktop.org
Cc: Jessica Zhang <jesszhan0024@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Simona Vetter <simona@ffwll.ch>,
	devicetree@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-kernel@vger.kernel.org,
	Lu Chen <tianshi12127@gmail.com>
Subject: [PATCH v2 0/3] drm/panel: Add Smartisan TD4362 panel support
Date: Sat, 17 Oct 2026 18:32:47 +0800
Message-ID: <20261017103250.800109-1-tianshi12127@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261017083531.766557-1-tianshi12127@gmail.com>
References: <20261017083531.766557-1-tianshi12127@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lu Chen <tianshi12127@gmail.com>

This series adds support for the Smartisan TD4362, a 1080x2242
command mode DSI panel found in the Smartisan R1 (trident)
smartphone.

The initialization and power sequences were converted from the
downstream device tree with linux-mdss-dsi-panel-driver-generator,
and the driver was tested on a Smartisan R1 (trident).

Patch 1 adds the "smartisan" vendor prefix, patch 2 documents the
panel binding, and patch 3 adds the DRM panel driver itself.

Changes in v2:
- rename lab-supply/ibb-supply to vsp-supply/vsn-supply (per review)

Lu Chen (3):
  dt-bindings: vendor-prefixes: add smartisan
  dt-bindings: display: panel: add Smartisan TD4362
  drm/panel: add driver for Smartisan TD4362

 .../display/panel/smartisan,td4362.yaml       |  75 +++++
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 drivers/gpu/drm/panel/Kconfig                 |  13 +
 drivers/gpu/drm/panel/Makefile                |   1 +
 .../gpu/drm/panel/panel-smartisan-td4362.c    | 263 ++++++++++++++++++
 5 files changed, 354 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/smartisan,td4362.yaml
 create mode 100644 drivers/gpu/drm/panel/panel-smartisan-td4362.c

-- 
2.56.0

