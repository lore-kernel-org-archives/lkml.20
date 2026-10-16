Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F211452CCFF
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 16:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792168164; cv=none; b=bkSL6PTBKZi4QH5wtRzkXrhE6Uv5IrjWI/6lEw1A584F+cPx5hRUrtYKrS6j4w/lBFBh2dShDGhBiYlW7W4jjUx2h6vRLQ5t0Td2rICKnM4F8+wsDam6GXqaWQqi3Rktt+kk+dtwxELVWqw7eKJ6PKbw0EH/0C79xDgeQmTZvSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792168164; c=relaxed/simple;
	bh=VhR0j1HKTwNSIioD4L3f7wFrhTcLCMcVT3/oUEbt/RQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SwIc9Cw0ugXpBqld8jRTJf8cs3TZVKUg8yvM2ZuYUhIGLhZjWhlbVPzzfFgYNQI2W11AuKAZPn7VFd12H0q/NxaNJfs8+aE777y6FuqifpcHT0fmtzcKM8RPhpg929qtUo8iBwRovGuS5hDG6tcKAAf0pPl+9CbJsSM3x2dXkTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=p5eqtnxs; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p5eqtnxs"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48dee593f18so10114f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 09:29:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792168158; x=1792772958; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JOC0Tt4izqijGr6CwbYBXFuZxdub0c8E+AAfI2tlm98=;
        b=p5eqtnxsy2WWJjYnI5bNe8HKhdjapL/R314I6/DhwaAxxcff1cLEVu/zoGeV+RzA2a
         VXkek1gTB80X66WaVdQjL7FBc0Q/QgNHhOyXtDV1pSNFmwmJmD/JtBOrzEYQncNSwpgw
         BEms1VQH2qeW5kvARan9y1+YdEdkDxOeWTP8FyJ15Vh9zq+6qOLrgl0cSG+abUnkl/Xs
         Z15dSnMSryDYpCtn0YHPWacLeBodfE+7tSVr/4a/3MXcbF8qr8ozTJDGnkGri0iMdntj
         o5gMCklR+WuPjWmTw5+TOKlLKjDbqw9q61DQGhb1j9t/YynZFw76+p/U7qUAkJFQV4nH
         e0Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792168158; x=1792772958;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JOC0Tt4izqijGr6CwbYBXFuZxdub0c8E+AAfI2tlm98=;
        b=Nmz6mMH9Q9+EZn+WyG9JMCS033F08W9PpLhDJnLLYm9DuJ+i0hWpxNJv5K5IERsPuk
         1afsWNoen91mEj0AO6R2RR+67X61ZiczeYjidTvVkGJh6HFMk9VbSZtXEPNBmFPzPVqu
         Odf1M6zzezclHcLVyJAGLChqO/cmVYtflkG6BATLkzU3VDDOP3bX1oSzd38MtwFSW26+
         VHLK8jrytAvUJ/FNfySaXSoPLEUCAPsxzCIew2YL4X7l1PjU6wzy70/WlAnILtsFUk7N
         GcPbxcB5H6yNXxMp1IgRkfzKbDgO4DMJZFU3T5gJPZU6VikuwVqkXCfPuPwDbmCWKLxD
         lVvg==
X-Forwarded-Encrypted: i=1; AKwUvBxlgsc+7+htzsPrVj9QQr/E061c5zbBecxG/0PUYrRDF/hURi44/KGPWpphJI0V3dxuN+KrN58HFoLPjDA=@vger.kernel.org
X-Gm-Message-State: AFq9FYIbjsNVSInioczV2dLIfCfr0GAXsufEci9Os+IC3ZghBnA7BMB4
	C03amw0JlxgnamTRHbWwBcwOnxuZvura3cGvg9mr0ihdNNTJVRTgl6dZ
X-Gm-Gg: AYBFou3PYGAiUNUVE3APzzFtgOQb5A7EBXUsd0e02ch9kmx/JZ2lCXjGDSCA9bstCh4
	vLijplkCcE5XbIHKCDyaZuSFGoIZL68h2qgO/8ag2FsOjiKDjxdyMIAdyCCZNWijvaYTvSMXpYS
	di+V5K12dFm7xdSbRNKc6kO4cgJl5xhcn4ZkufrQduv/YDsAWL2ZRqPvA5D6HUlp2gSHiUsoin7
	OI+Gi/Q8UzrUwpwn6hcPNnUEm0+GBK6+rXN2oMmu0EgBoff0d4vkxeO1NFgPD6DZ7PL69gwT/8f
	P+TrNVWm1RuG6qdA+9qVh8z2VIZzX2jQNknR+P9pkpuZTtkygK0SkaIi5WA3hdRVvQGILNF6j2S
	hrA5qDVKb1LQAbSH0eVcbHJ26Dnp44F43+nbkoFF9qXK23rdkQClcDp1whjUoSugAqBR4jNc1Ya
	vhy4o3wtTaEEV69fLIUJOQjZujnPzvf8dXCV+85ycOp04pIqotNLqxDNjbg/WRvXE7g5YGd0l2H
	v/9wBJi47IWYvb/WZn1qpksLQHwDMzYcT+BgqpnNPc9cj84ozrnAToY/uhP65wJEaxL1CqE5Ndk
	jVrNeLue02Vs
X-Received: by 2002:a05:6000:260f:b0:48d:ee35:b3fe with SMTP id ffacd0b85a97d-48e07988925mr282504f8f.8.1792168157866;
        Fri, 16 Oct 2026 09:29:17 -0700 (PDT)
Received: from machine.home.arpa ([2a0d:3344:57f6::103c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4c5942sm9404317f8f.16.2026.10.16.09.29.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 09:29:17 -0700 (PDT)
From: Luka Panio <lukapanio@gmail.com>
To: lee@kernel.org,
	danielt@kernel.org,
	jingoohan1@gmail.com,
	pavel@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	deller@gmx.de
Cc: dri-devel@lists.freedesktop.org,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-fbdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Luka Panio <lukapanio@gmail.com>
Subject: [PATCH 0/2] backlight: Add Awinic AW99703 driver
Date: Fri, 16 Oct 2026 18:29:10 +0200
Message-ID: <20261016162912.64581-1-lukapanio@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Awinic AW99703 is a high-efficiency 3-channel WLED driver with an
integrated boost converter and 11-bit brightness control over I2C,
optionally combined with a PWM input. It is used as an LCD backlight
driver in some mobile devices.

This series adds the devicetree binding and a driver for it.

Tested on the Nexphone by Nex Computers.

A board DTS using it will follow separately.

Luka Panio (2):
  dt-bindings: leds: backlight: Add Awinic AW99703 backlight
  backlight: Add Awinic AW99703 backlight driver

 .../leds/backlight/awinic,aw99703.yaml        | 131 ++++
 MAINTAINERS                                   |   6 +
 drivers/video/backlight/Kconfig               |  11 +
 drivers/video/backlight/Makefile              |   1 +
 drivers/video/backlight/aw99703.c             | 583 ++++++++++++++++++
 5 files changed, 732 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/backlight/awinic,aw99703.yaml
 create mode 100644 drivers/video/backlight/aw99703.c


base-commit: d419d682257d813f6cb7a28e42b35d0edf4ad038
-- 
2.55.0

