Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 457C03B47CC
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 15:58:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790524690; cv=none; b=hek0k5DP2yGXaOhUIiX5JshfMTTQRnh/pE8yhI9yKZltFXJGfMKkH/h7WXb8dtoSDEM9tEKaePj+TFqa38iOEPJMA+mrUs6dd2E1UlplTsZG4TJQQrUHASVWiL9sF09DXGDT+krdCDV9tYK5Af6ZA9B1ufyIPcs9EfE269yWUVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790524690; c=relaxed/simple;
	bh=tiF4dNCYfSiePx22DoLQmh8H7VMxIsra+1NAFUac6/s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AYXsynm55U/RjelVNL4NuQsr53VRpv61DSgJcsNt2yRzcn1oWTUltOvcZeIq7cXsPI4n31f/3ce+O5/QBiTD7Gq3iBI7LZiEBQ42Q7oTOE2w6nxJDc8hgPFOjcBqfo6jZ4GnKvQV3DzdI2QFcTIO3UcLWWmohjuNKizqN32otNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CKLZiWOc; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CKLZiWOc"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49b912d3920so16860855e9.1
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 08:58:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790524687; x=1791129487; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6hVPxB3LDp7THumASK8lONkRvyk4UvlnbOgMgC/3vpg=;
        b=CKLZiWOcIGTYFxrjiFrpaTsSHy2u2Pej1OYTjB7GYk6Ome7Gm4u5//Z9KRe4JlJvTF
         xxBTUcUUwSEVS9ZG9H+NmWmPEL9YNuYtvJVdg3isu54LimWs7tR0rFhxjVnAndW/gpZF
         g7mbrM4Ho1GYDBsEjaBYj5b8NPQEMRp34TWTKCARgbi+regBJFeBw9PCXxzB8Eit+jGt
         CTBPYdg82bxDwA+FpVNFArng5OwQ/TWBhxEZdEtr9tpSNf3PrkZhe/wUtQv9+uI5IEoH
         Fo4wS6WvUXNC/XsbsbzbNdYrCW+jm3Vsd8cLFnT9lpisOGbzTSwkjv40ip5eCUWyeGTk
         ctsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790524687; x=1791129487;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6hVPxB3LDp7THumASK8lONkRvyk4UvlnbOgMgC/3vpg=;
        b=V7bkpi/oIz6GGOetjOG6HA4tOfgTF6gY5qEIbn8L0mPCvcS7AzhBMRV42kC004a6Jo
         WVkDKatoAJjqUwBUVkXIm8z93ipi+Xz54+SueWCQg5JHmi65Vlh+1QB7A7YseTOx3JjS
         ZplqWIYGjCtuIU5VAK40dxuqlaoxMSeVesjXnXmFpeOkEY54kKnIgszSWRVz7ZtVIYJp
         LJV7Q6yin4WLEDG6+CkfCpI+AaFYuX/X/GQAvq0G5QV1uAuyqRBH0WI69MDc/G8j6laQ
         1hIE3rLmkZ+IeNfWdUXKpiPGJbM+e8i8YOMx1i57J+SZ0TkFq3+ATXd7vqLzZ5L8cjSy
         1R1w==
X-Gm-Message-State: AFuF++m97kGfdScNeCOoN5xsyOwW+brkZglazUIid003YYVHU9B0hvTT
	shCZDnnSkT7n622ZJmu9IMb5w9kD/62hp6FxSgdGlUoh2VvZgItBWhnu
X-Gm-Gg: AYBFou23wx7kfTQ6PcmIQUh8rgz/RvVVUbgQ5dknXjxAqCZz5eZGMn+Gz/hn6CXVCF+
	hekTU5/fMSN1u2jT31mOAEoe6Fsyt8k2zvsvEe74716Ota4wTL1UKjKaacqiyUsp7Q9GkNVmCP5
	nXCEqwCnW0E7GQjhQOBHUOqy+KuYn4x+NOmOjCSRLI4dvoEvlgdTXMy6ebusQTr1cfIsUF2WAox
	8pgxzrDBxwfjFWyvjJh/PD8uQhDewboLwp4JfXt9PTkWi82inh9ssrtD91DeaaaKaVAZVoVtaY5
	yme1EovY7iQXWHuFdRzuhobBds53hvqCVmmA7zShWs4yjBBDCO7hBGX4PZt6WFW7FPDQFJxajAP
	AIQ3T2+Ld8OFTPLGCo9ZEKJv8s7ODyUBfarizMB9tJIqZO7AdLj2UBt8QKT/pD4qkM2J7XHu95F
	ET2+2vxn4Y3FJjug/Yqy0+CN+OhdpVVFKObQxPxdB8mHPD0/QZiL2Er1mV4YHxz8rVoCn2g3LuS
	EEEsYr6DzSm8fQIGRGhOPM/RP+2CQ==
X-Received: by 2002:a05:600c:a06:b0:49f:fd4c:cccd with SMTP id 5b1f17b1804b1-49ffd4ccdd5mr65841555e9.28.1790524687190;
        Sun, 27 Sep 2026 08:58:07 -0700 (PDT)
Received: from xeon ([188.163.112.76])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0018dd5easm66708625e9.3.2026.09.27.08.58.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 08:58:06 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	mfd@lists.linux.dev
Subject: [PATCH v1 0/3] mfd: max8907: Schema, pdata and poweroff
Date: Sun, 27 Sep 2026 18:57:41 +0300
Message-ID: <20260927155745.187758-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert existing txt documentation file to DF schema. Remove
platform data use. Switch to device managed poweroff handler.

Schema includes reference to pending tegra-regulators-coupling
conversion. https://lore.kernel.org/lkml/20260924-ti-tps6586x-v4-1-6c7a8fb8b646@gmail.com/

Svyatoslav Ryhel (3):
  regulator: dt-bindings: maxim,max8907: Convert to DT schema
  mfd: max8907: Remove platform_data based probing
  mfd: max8907: Convert to use device managed poweroff handler

 .../devicetree/bindings/regulator/max8907.txt |  69 -----
 .../bindings/regulator/maxim,max8907.yaml     | 285 ++++++++++++++++++
 drivers/mfd/max8907.c                         |  33 +-
 drivers/regulator/max8907-regulator.c         |   8 +-
 include/linux/mfd/max8907.h                   |   5 -
 5 files changed, 304 insertions(+), 96 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/regulator/max8907.txt
 create mode 100644 Documentation/devicetree/bindings/regulator/maxim,max8907.yaml

-- 
2.53.0

