Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793703927;
	b=QZgduiXbv4SC+PRueq9pTQEpbErBXNBmSEBofiB8c8j63kXJvR4ZCPQNTS/GQ1J7EP/C
	 wno7EVDVykUOD9sVJLD1l44E5Le5FkYDsF4kSep2D6L06DqVZP3OkPMcwyMPehoUz7u7z
	 G9/lujqV9G/ol9o1s3v8CwdFd7agT1LZAXayn/MMuZ7krVAownuxvwRd57cK4uLTK0pO6
	 iq7B96NXPWnyBCbmy6ZK0+kdzt2gaW8IfsbxRVZCN3fwMhdyn6jcIHWC+id/mXAD7utiA
	 dg73VDQkNskAxLxCoHt+nvLDfFvXBOTxQaM6O/yFCr4iWhjhpF9c9XK9TPk/uxxszIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793703927;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=LFiGU0wVYYFRIuNAq63PC6SLhwVIgqIMMPvA4Bls3qE=;
	b=vQ6QzNXfT1uI/r60iaoGUTPa9wVEfvqIbXn5uGGUcXDx/1S/aowOXXb2RhMSJRSRX+V1
	 faMbEVvzOr0A2YHkpGkuUc1S4iEq7qXi+xCpEe2HGd379bE0aHGsZjZaTaQfq+zCr6p5K
	 42IJt1izkG7zEljy8Je8va+wog7Z5GIY+K5c1j7GKWTn79vmBobt/APLggiIAJEYNc5Ir
	 OTQpo1r9IXeSTp2ks4h5SxNfaXWbnFMPuWkpU+i5kgXxcrrxHoTeBy2BaXbU0yWT79Knt
	 q5F6DYWYHzDKrxk6fWiYtqgkGb3SyRRw+mc+88Dnmlw3OdsHPEBN68ot4YGTowpj8Uw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Y62S+JmB;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72CB6606D81B
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 11:05:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 72CB6606D81B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Y62S+JmB
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-49d05d51553so25963875e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 03:05:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793703926; x=1794308726; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LFiGU0wVYYFRIuNAq63PC6SLhwVIgqIMMPvA4Bls3qE=;
        b=Y62S+JmB4ApRXS1aUJzO88O3fK322dR6cG9xNZLkfEmndK7DM1pE9II5exNLD0g4NI
         d/DjpZsvo6NfN4Z+13mMxbFaoEdQrBcedKsbruLRwamwo1ohvcWYRc6PoOjCJa6SNqLu
         bkqu+AgsXs5C4Y6LuAmRzdO2p2NNqEDZarOH+GUJMXeB6e7s39GHNtl8B4R6cZiVdObF
         lzDaovFg1h64NzCkK4UCkNA9PKFzMjNI9JyN2zEfXXkBDtoEct9MuZuU5OXJSP6tGMRa
         kwar3gz3Yl6Z6ATPC8yfNCGq/UozgAgWv3mnRzFUvIRgScCHVdZZp/tDIRhO8jwLkAn3
         T7Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793703926; x=1794308726;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LFiGU0wVYYFRIuNAq63PC6SLhwVIgqIMMPvA4Bls3qE=;
        b=xHzV6bJXewEjIJ8v98cbvUE1XutmNpLHr6+WDFkw0QiVoIYgw+PHQ9ibTadxGVnNqL
         4eMqTTK8yMnisChHBy+RbsjBGn5sU+F4dBKOO6/pyLZ3KYESMR9K4evZQ0s/qod6kvmw
         IVfUpbLcuE8mRqFAgRMDm3qWkmvlt6er9c6RZp8sReQjQisp0kiMy8TJ6iStamRfZp0u
         mijRhDWi2Atmv/mOirif1y89CExRyFHxh3UgC+WI8aG+WjHmv08O+C557HxoMeMdI6SF
         tqCFDF6LvwG9JxxxPk8k5SQqDGKLzK+tRf0d1Zjtjy1tBYraQc+PC86dJuro2OLnEsEg
         KjTQ==
X-Forwarded-Encrypted: i=1; AKwUvBycAqdVMTYnZqve9dcvlmFnID2iJKU3P4vT4K5sozEbbCL0iSNmu63UDkGj3zrr0yRf/9Ecdqn1HJe8QNw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8lhnHRiwXKqkO5pI/EGoYceYUIHmqRWSewHCI9fYyGs8HM3z4y
	g362vKY0AuGWxRudJaiErYxlSBTJXhiFdCulf/JJHw5pDn1eNv6w+Kpy
X-Gm-Gg: AYBFou0ozGpvZAlI1Id64ANsoKMhucG6lCGsfiEJ97CVt7LOPzSA0CqqWrI9yhzlj47
	4aeYqkvrNIXBsinn/+jPJGWAeHycMwZKHGLn1ySOErcgOejTuY6kztfW0lCanIV2QELbMTjDzhA
	1gbZvCcZJqksVX3TKy1+S3oVs/5idk6axLsnt5jJSsr93BqmtHX4mFZn+ZBw0uwYD7PqfCZfT9K
	I0+wQ+B4h4fwVwS7YijIdygst/v0fEyiuB/PZnBXkPW8eX1xvZRE0zyuP61ZDkN7sxSKeQuWD5e
	Tp/+I9zXd1NEoT+VznaEFx7/9/zW3f/Rc8HKjVNHLd2xwqvLjqkhNESdRa6ZD5V+BzK29IbQcIZ
	7q9/KumOI+s2JrB4iLXuC/HqgnBmqdJC6r8TiAgpfKZ+rH2IFE4ghfX3Q288dvqxGIrdWNBA2G4
	OQHkX3GqzQZUOmOsaojYSMkpcJXALdOMJs67oByZRCCVBi7ystKC57UFXipICA+iJyTOEfExiVw
	XbgFfRpJ1jG9x1Ex39goLtqthqVh1RxPTc49GGLXUyHrhrHnuXsJ/uTS2TvD4wr1P+piOh2vXZW
	8EC8NleI54Zp2IKygd0eVKl6iNCm1sH+xH3uWl6s35n+9pXJ8sCYrDbcqDr+VqnhwzyPL7ilVxE
	KSRm+jzOhI/FhdmjdnpdAz4HtO3jiDl/VY23HKjGnxDxkTA==
X-Received: by 2002:a05:600c:3f14:b0:4a3:59ee:86b with SMTP id 5b1f17b1804b1-4ac14ec873emr282656675e9.4.1793703925515;
        Tue, 03 Nov 2026 03:05:25 -0800 (PST)
Received: from romain-ThinkPad-P14s-Gen-5-AMD.tail433d9c.ts.net ([2001:861:39c2:e340:14ec:7986:30c8:6bc6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2afee292bsm53218155e9.4.2026.11.03.03.05.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 03:05:25 -0800 (PST)
From: Romain TISSERAND <romain.tisserand@gmail.com>
To: Igor Reznichenko <igor@reznichenko.net>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sashiko-reviews@lists.linux.dev
Subject: [PATCH 0/4] drm/panel: ilitek-ili9488: add the PocketGo S30 panel
Date: Tue,  3 Nov 2026 12:05:20 +0100
Message-ID: <20261103110524.2812831-1-romain.tisserand@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The PocketGo S30 is an Allwinner A33 handheld with a 320x480 1-lane
MIPI-DSI panel built around an Ilitek ILI9488. The panel uses the
existing ILI9488 DSI driver with its own init sequence (from the stock
kernel), timings and DSI mode; the sequence is close to the
E35GH-I-MW800CB one.

Patch 1 adds the vendor prefix. Patch 2 makes the binding's port
optional: the Allwinner sun6i DSI host links its panel as a child node
and has no output port, and the driver does not use one. Patch 3 adds
the compatible, patch 4 the panel. The board devicetree will be sent to
the sunxi tree separately.

Testing: each patch built with W=1 for arm (multi_v7_defconfig,
DRM_PANEL_ILITEK_ILI9488=y and =m) and arm64 (defconfig, =m), no
warnings; dt_binding_check clean for ilitek,ili9488.yaml and
vendor-prefixes.yaml. Tested on a PocketGo S30 on 7.3.1 with the final
version of this series (A33 sun6i DSI, one lane): the panel probes and
attaches to the DSI host, and the picture shows the right colors, size
and position.

Tool disclosure: this series was prepared with Claude Opus 5.5
(Anthropic) as a coding assistant, in an interactive session: it
extracted the stock init table and timings, wrote the code, the
bindings and the messages. I reviewed and understand it, and tested it
as described.

Romain TISSERAND (4):
  dt-bindings: vendor-prefixes: add PocketGo
  dt-bindings: display: panel: ilitek,ili9488: make the port optional
  dt-bindings: display: panel: ilitek,ili9488: add the PocketGo S30
    panel
  drm/panel: ilitek-ili9488: add the PocketGo S30 panel

 .../display/panel/ilitek,ili9488.yaml         |  2 +-
 .../devicetree/bindings/vendor-prefixes.yaml  |  2 +
 drivers/gpu/drm/panel/panel-ilitek-ili9488.c  | 55 +++++++++++++++++++
 3 files changed, 58 insertions(+), 1 deletion(-)


base-commit: a1e63ab695ad76850ab9787b9eb6aab695dc2965
-- 
2.43.0

