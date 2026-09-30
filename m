Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67E8D443C24
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 07:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790752534; cv=none; b=mFGdA3RRwjXXjfv5rchIfSR1zj3YWfAAQJ3tX6bVxSUAGO66+bYdQXqPUEBi/7V6EF0ehWyfH1wt8hUd3IV2BMVtUiQdvNH0F7eFXcEPdobtqMOuBo0fz/nucZGipwpoqMtWC/vzUILJLugS7JXVvGr7EO7I+k/Qa1VZWTDgHpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790752534; c=relaxed/simple;
	bh=9++OyGSJWEwT7/ctMO79NTROZZy/+9e80noaO28S9RA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Rml6Ja9HCaCGlhadIMGHjoiiydcj9ZCH86Eu3VyQCcZqFn0sAAelIqFm28PH5dC/adzirEhYh2Tv78A7Y/imdFtkz1mOCrL/IQjeJqv2gt9/AmwV7kuAJQpnB2CfumLH+I6ZgbopaLpUWjns4DZQEmg5tv7+7Rq/aIuaFvN6tXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iO9Wd7u+; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iO9Wd7u+"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912e4b11so29448885e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 00:15:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790752524; x=1791357324; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2prECYlfUYJhHJY0ODA9AKxpvoyiJexfpX9S3WhkkKk=;
        b=iO9Wd7u+iqFXWGwmmsFge8nvX5Dvm3a/mif3zcYO03V6O3bEOxLoC8OONh2/XPzK4z
         k2HqKqPfP6H4gltXcEw5xt2nkL4ffhFNFpwhrARCmgIlZSfEVC+DkMw1Fhil8AOkMrkH
         dh3Zjy6NzZv4ppdWKUA5MfiPAKiQ/Od2eA/sKqewVoOKyNdYsiuYO4LLjBhASMVa0cSK
         3GDFMZfaN5zz/vPMcYHbyVXtTJMlQ3U+fZEMykzwFtw9Fi/FuLMm4ncENuP0l/CQ2pvI
         Qb39/faltsngUCqBf2wbRvwxmuGHlOLOK1vJ5pt+a83YHM0Z+O7A5jgZTKvb372ENKsb
         83MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790752524; x=1791357324;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2prECYlfUYJhHJY0ODA9AKxpvoyiJexfpX9S3WhkkKk=;
        b=FoPWvvIHi92G/5kYZyOqBCqU5aMuTymSfNPNqhk8pclz3NPBs16y5fQLi4oVUVKOQH
         ZnqGcNG5c54S+TbSgDy4xNs5/SfGU7iyI+ZTGRjs8VmzBx5OZHPKmPWgdXPW/eGb48LK
         IDmsEex7+Ko8IDtsRphMK6Xo6N/Ycxi00xrHc1PDFI+f+wNUxf6XMkZOWoqf0cErua2g
         Zk0HEqdRY5CoA9QQy9XZ8Jda82lULEuM0gcbtj8gkEW8r9w6DlTabhXa7cFZmCnKEiJn
         Qz4HmwdAzjO5ycUik1r505w5xYcclICJHPoYtCT1G6sF5t/xvjED6/kmQZl5ZefO59aw
         YYlA==
X-Forwarded-Encrypted: i=1; AKwUvBz3HSfEDkC/1tnHl26wku+NxtNGfIo4F6Q+8Qmm/7HIcaQH33wy2XGCX/SYPwiuePtbfKsowElOyWX5Xt0=@vger.kernel.org
X-Gm-Message-State: AFuF++ky5h1LYQoRQVms1jiTGSxBpNJ/gXfqPTxaZroAWdXKeLKI44qS
	1ZHJx4y1dAS0VsIIqF4YI5OG2gd/p6RIF/OkxCICtKxFHQJMNw4JiOTh
X-Gm-Gg: AYBFou3g9jZ6GUi1Dj1e07BKZm2JVb6BKJw56e5EB8sbqO4S83Dmm+K4AIu+TJ0Pk/W
	renW6HtgNBzuv/CWjh/9SkM4c5CU58Jhp8qF2I5e3WSLEy4+br3uiyaExrmJkS7e+CKCOoKsl/A
	1HApZt1QeKem8undzL3NLUooTmILik3jbrLT1oQQsgQDK2hoERuPOZKsL3YhT9kjjecg+uL1sPe
	uL1Ld9K9litmjLHJ3iOHOfPb9hM2qdhOUAUh0n0Hg6fe31zDTDrOHrCSCkCwC/QtIyk43/qdXIX
	xcFJFOWEUeSMA/oWpMR8MFIaqFsCwZ3A5FU+b55GIa+AidyUyo03OUxceohxA1aRhHH3AxgbCm6
	weoo8g7+E0+lOMl3OH/kZyubwN3PRm70YtzMMr6w542IvgBpy+iHSWg6lT7peiHYNq2qdTvlbTP
	zSq2pDamcyPiqoL5RTt0JFyi7n45pXWuyS2aFBHOWsyDyUIztt91ZaEryYhwOnpdhBjIhkBBb1m
	NHXubWare4C13XMKqrl
X-Received: by 2002:a05:600c:8b08:b0:4a0:4a8:d444 with SMTP id 5b1f17b1804b1-4a01b00226dmr7192805e9.33.1790752523915;
        Wed, 30 Sep 2026 00:15:23 -0700 (PDT)
Received: from xeon ([188.163.112.76])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b029be7e4sm1256979f8f.12.2026.09.30.00.15.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 00:15:23 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Daniel Thompson <danielt@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mfd@lists.linux.dev,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v1 0/3] mfd: aat2870: Convert to use OF bindings
Date: Wed, 30 Sep 2026 10:15:10 +0300
Message-ID: <20260930071513.54697-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document Skyworks AAT2870 into schema, convert existing driver to
use OF bindings and remove platform data, add support for
in-supplies.

Svyatoslav Ryhel (3):
  dt-bindings: mfd: Document Skyworks AAT2870
  mfd: aat2870: Convert to use OF bindings
  mfd: aat2870: Add support for VIN and IN-LDO power supplies

 .../bindings/leds/skyworks,aat2870.yaml       | 127 ++++++++++++++++++
 drivers/mfd/aat2870-core.c                    | 120 +++++------------
 drivers/regulator/aat2870-regulator.c         |  71 +++++++---
 drivers/video/backlight/aat2870_bl.c          |  54 ++++----
 include/linux/mfd/aat2870.h                   |  95 +------------
 5 files changed, 237 insertions(+), 230 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/leds/skyworks,aat2870.yaml

-- 
2.53.0

