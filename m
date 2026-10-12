Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D33C3D953E
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 19:03:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791831806; cv=none; b=OgSZOXFBcix6UvhfzTWET9nhyOT2RzHgwWHdw+3kw3XKFmbYJyPmFT6w2RTGi5blW3mCVSatrVJkXSCYuNKyXBbQPiVaD4+S5RaeV6j7/XGDWV1bbzTTIwz7cAljrkOpkxGoLx57cbmDkGG3Y8nmZJeog9CZhZyf4+scHgPoTnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791831806; c=relaxed/simple;
	bh=60F+hSMZaW3idUzKP6BXQvTV4G564KjFBtabaxAiiSg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Wlvnjy1O03RX3GJTQR6fn/E69Eszx0Tdq+28KLKGbsJFsel9k/TVj0Rxlrvn+P0oXuWpW68zQzEIViEtroi/mON3VIFiUv77rcCNa3p0s3ea4XO2Jgtaq0CPoZ2obgYg96bJN1j5GfhtLA3LWxD33zFqr8e9Y5ZkHQQWbFIE9mM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nGuI5EHU; arc=none smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nGuI5EHU"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-33c2520ad38so5026084eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 12:03:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791831802; x=1792436602; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2NkKyRW0wfIM67u0LXIiGPjl/Rwt9skgi7xkmQC6+0Q=;
        b=nGuI5EHU9TLCPJzg9E1oIPeqaSaTsBcLdFJB7JzDsRgwvUkAAe7gnwTeRBXmuF9h4u
         m/1nWf+BnF8Ykuqe7qqvz8k70DWCnaO5ID6VFspFdWYaQc3U+IulDZ3gMsHSjg05Ty9q
         g8FxwFx9YDoHu+yNacHJN/MAOJrdUHF6K8B2eEiS1V1pCuWX8LpseBUNe5eVNm2zBrXA
         G5l4bIDwt4p1kx+QD1KyA6Jnx7G//IUNMph4mceCO4+wnwG29hc1evbp16KEP6tS7WRS
         jQdH6iqUL33l8Yry1F7e/Z3hUWPJuqfUJLOkwJ5f+0x9rmsuNiQ9xKRpTNam3cHreDIs
         cC4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791831802; x=1792436602;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2NkKyRW0wfIM67u0LXIiGPjl/Rwt9skgi7xkmQC6+0Q=;
        b=p9M3tdTH9KNYkr1RSjVNEfYyYVTN12Euje+gvhswPw+P3Z24aXlimD25eKUXajw5wG
         hFHpgMo0GTRsMV3HWmuBiHLyDnbxhU6CzKbGVVeXGQWNPkdT7XteUdQkur4Evtc0s7+n
         O3IRoAg1q0mlx0vRzAPquifQTB9f1xtlrT+TmHxdCLRa3NToZqV6EnMCvq94hlbZbAzz
         Qdm3br2Y36cBUU+QmkULaTgI9+HxqF1NIWgUNLrpM4tPc8iL57AMr2u0puWuVLq3tOl0
         iCf8ShIeYvthx+ck8CussUvdASVC1MRlox+JXcCmKja4NPdfUNXXgOAS29zXfVSQf6OO
         zq5A==
X-Forwarded-Encrypted: i=1; AKwUvBwEV+kJKpoQLBASRf+H9lUKJ0WUIFdegWu3UiR8xVJx3puT/BT5c8OhTOMBq1m0tpmOiF4ocwZ+4M73Wss=@vger.kernel.org
X-Gm-Message-State: AFq9FYKLEAnpJ/YHy6vx4tz1FjG98AQ5dfe7NMckBAWEoV2uRQNAWsKp
	6S4i5JIoCm604Wwb2x3P/qc6gAYPrmDz2C/gR52AaIjqZNIrxHSMRwXX
X-Gm-Gg: AYBFou1k42X4ukPsr4cmSbGE7IS+Fd8zhx4hZj0pF+GKKXt5w8x6u7OmqcTmfT8V1Wp
	2obGUSxo8wHiimbPpKr5QgcgQwZbBBwOCsZ0vbPxyGEh9NsKgQafd5MzUNiMXYchdHsMZBTLDlZ
	WvHCPyMtQCCCfNYFF4y4cWoK8/8BXTQwqoaPEf/6wMqFHvypz+it0mY061STKSkzASgtAxeq/CP
	R7z9errQkrmNpZ9CtbgDFGPWK4pfS7Y8e1nxPqxX97YIgYk6SP1a6eXchGkrpfx8DI24tLuIW9U
	PI6neYAGvTmyWOZkyLDyqJcK+o2P7Ere2bTJDVulgGhKIL7RKV9z40FXcWGsr1IAYdekdRUM08/
	iGfaY780YfSrHAj9BNGTMUblSBgzcFEVHLEq89Z/r2jjYEWKfhvViFPZa6A18LpRBr0rSNH/uHi
	T0GospIm+e6b0CG66MGhh2ddGE4yRwSSQcHlb80V1HaqM6r8q/9npE7QYyUvdB9bzKmMForh8GU
	iOHdXcOmCHaDI8hbUg/xzsBqFFAC5SOJ0VADhU=
X-Received: by 2002:a05:7300:f582:b0:353:5ae1:b0f5 with SMTP id 5a478bee46e88-3537e101bf0mr14461668eec.26.1791831801912;
        Mon, 12 Oct 2026 12:03:21 -0700 (PDT)
Received: from localhost.localdomain ([136.126.251.209])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537cb6a279sm35501602eec.30.2026.10.12.12.03.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 12:03:21 -0700 (PDT)
From: Henry Zhang <henryzhang62@gmail.com>
To: Maxime Ripard <mripard@kernel.org>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Henry Zhang <henryzhang62@gmail.com>,
	=?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] drm/vc4: dsi: Make failed reads visible and recoverable
Date: Mon, 12 Oct 2026 12:02:41 -0700
Message-ID: <20261012190249.3167-1-henryzhang62@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

DSI reads on the Raspberry Pi 4 (vc4, DSI1) can fail in two ways that
the caller cannot handle:

- A peripheral that detected an error answers a read with an
  Acknowledge and Error Report. vc4 copies its two bytes into the
  caller's buffer and returns success, so the error bits look like
  register contents (patch 1).

- After a read whose bus turnaround times out, every following DSI
  transfer times out as well, until the display is switched off and on
  (patch 2).

These patches do not prevent the timeouts. With video running, vc4
does not keep commands within vertical blanking, so a read can still
collide with active video and time out. That is a separate issue; this
series makes such failures visible to the caller and recoverable
without a modeset.

Tested on a Raspberry Pi 4 with a 2-lane video mode panel at 120 Hz,
using a backport of this series to the Raspberry Pi 6.18 kernel and a
panel driver that retries failed reads up to 8 times: 499 of 500 reads
with video running and 1000 of 1000 with video stopped returned the
expected data, with no lock-up. Without the series, the first timeout
left DSI unusable.

Compile-tested on drm-misc-next (arm64 defconfig, DRM_VC4=m, W=1), each
patch on its own.

Henry Zhang (2):
  drm/vc4: dsi: Don't return error reports as read data
  drm/vc4: dsi: Recover from a timed-out transfer

 drivers/gpu/drm/vc4/vc4_dsi.c | 114 ++++++++++++++++++++++++++++++++--
 1 file changed, 109 insertions(+), 5 deletions(-)


base-commit: 3e32932d3626d0279f9b3531bd648f8c0a16cb08
-- 
2.47.3

