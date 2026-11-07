Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794053831;
	b=bAKsY7nHujS/QaU2CspcAax2kLOIk+3grUxWKLmrNGGwplYfMlo5fSM5PDfEIHLnAjCC
	 /1bB4+cnJQhHJGJBWWXjL4fSpvnh548gz0vv79QPK5sQXP3JYytf5b1axz6ctxB6wZzlM
	 pJsTL42mXzZZvC6/NM9pK9RdHIzmzEiqQbsHiaXvF6LqhQ13+ikIdLMIRoa5VqN/negkj
	 Sm5R1h2NSn+IXF83vWzm0lg5v2zlh0ndLQSy/TjahekW/7LbC66zgrSICZWSIm4rkbV8z
	 p53iepg8P0v4hRMB8xYeS8gCX7MIZh+B75i63wPWM9F7fISi+U4lcV/9ZpXWXby83rQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794053831;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=OzZ+my+gF/xrpmdUcbUTj2FL7CyDhVz3E3zrCVn/fRY=;
	b=lNUUmlIOePcI6vxufg8ZFmJvbdgkn9coyIz+9Es4GylMW/am7uRjFhOjMKbBbkBC+A1P
	 S702FPn6ag+KNECDXBqDGXdrKzzkIce2elmkX4PcodLpoX2UQ/FqEveOd1a8q0nfyD62T
	 ii9vD7rqQCDnJZr0k3K8tz2BpzrVV9GgKhkzB+jFqTiqyA9+lqKtlcW5mOTovU2nE36U2
	 Fox5yLBKQ8QsirnSduEci6zCOVtf//50l7kCcABJI6R429sju6g6C3k14CIwG+9VXIZLV
	 3XB+DrlfGn8xj4xjdAlCII7tPlZrgCktXyJZx8ZG0WhuAW63CLwbb0GQ2wlMnOebbHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=b3J8NaK7;
	arc=none smtp.remote-ip=209.85.214.178
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DFAD606A326
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 12:17:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6DFAD606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=b3J8NaK7
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2e95bd1c14cso13803475ad.2
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 04:17:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794053830; x=1794658630; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OzZ+my+gF/xrpmdUcbUTj2FL7CyDhVz3E3zrCVn/fRY=;
        b=b3J8NaK7zrhtmM0Aa8QCoegX0BxH7a1gG0KzXhIxMGCyoQUh+Rz3dZY72/EscNp2u1
         7BzzBGweO2IaTPfPZhN4qoOUneYgCNBB3xkDdgGrIDBKq734sRcLOD9U6eULBb/TodX+
         ixujhXiLeKQcrvlHIsQT/owX9J7HyI/XBqicJxizdwikj+sSYepZfeSHDp9fxTDbBmPE
         llGwkQDbN71jiuyRigHsSft+4Hdno2wgV/TC4ZqvxX469p6y0D40MaGMvUdAXTZMfMQM
         OsmUPvXO1ky4hjp9znGIJIug8Zs0YSZrveP0W7upYGNWo9Z0gHjRavoIToiVkgT49dOj
         cm0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794053830; x=1794658630;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OzZ+my+gF/xrpmdUcbUTj2FL7CyDhVz3E3zrCVn/fRY=;
        b=Z4GNV3aBCfySPQxPCSDIyHjrHjnSOZedzJ0XVsIprxXYhQY8we+H1HvGMNbZN+bqLF
         UMWuBlF4lzIPh+N6TKeXYqbzrIx46MQIJJYRW83K1BjwS957+m8Bz0A6+Acpr9XSAsHq
         QXlDDC4zGj+dusqvRS3iJVHLr+PpCyWSQZMP0b4atWQ/Hzs6X0CaoeoE5U9ogZrwVc/5
         Se060OrvOSIo9a2k4pH2Pa0OS6ux+tEsOuHPT3FTYC0kQuRed98c/H7yeOhc20TS+Lsh
         wazOaRTL4ZrLITgD0GN7jxOSpIjTsxmmzW+0NrBymixfjg6HNqmLS/QpTFTk6xZjyNwI
         /IQA==
X-Forwarded-Encrypted: i=1; AL+hErHjDFMoS8Cf0/vchXXluihm0YueHWJGaPkz5psACj+E9NnnD8aqyXZ0wC1K14dQ11o0c/J9PEVEPaqLyFA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/OjR+WlVUxa8DGPoL+ECfHSaCLeQjZ2HVr3HxRnx64ysjneWXu
	CCL8WqKnrSLMODXZjbB+ZeGGeisUp5uPnw8+KdtZ6FqzHl0jiUAdlvRl
X-Gm-Gg: AYBFou2kxB2IaRv/nmG0HzNO0H0Bhe7QNc01C+hXDFiCeHhdbEFyusapFV8XeN8o4SX
	sxAvKhGKqc/8kkNWzSFASx6LfTQvCL8B+ZtMdQ6N9EYcDijFvP06wC0yZ1Jd5fmq0p5TFpxDewL
	vPDroi73NTQ9zDnTLkVFKUkZdt4ma3B3h4PwJ9JKajIYpQ2dtTkd4Wp2+kDzCGSSze5WftoZRlx
	PY2M9OblmkZhuP7Gs/eUemre+9xkpsGU1mFvyOZESF1YcuYH68j49q+ehiYkJ/ylb2Q6bZZDAtU
	wJzS3Qs/q25owPrQk1LaE5AccwKXnDX2FUln3DGn560nl78KhbNMlS0oyKoEHQgnIry45dH1jm/
	lD/k+X6DH6gLBY2VzJ5aWqyw9y7YmV52mXBCb4SgYuMpwBht3k1Y9qDkQGbKP8c6g76xUXsGVIr
	ytAIzZ4kcrzah8hanK8Js3VtrUeoESRWbpoH2SC+A6TQrJrGrE/UAHnLzersVI8SlKjIx3Mqz1p
	xlBSWBMagCrde+hlEkbloEcuXcbKsDXtec3jnsRnLgRYizDcvO1uoECIUoksqpcAF4be2f7qQoW
	9tcrvM/2AtD5/BhxR4em9G0mvst0RBmBl3Ex/lwtFwFT4MJKywCGkg==
X-Received: by 2002:a17:902:e5c3:b0:2ea:41ad:e310 with SMTP id d9443c01a7336-2ed40dcd43amr62813255ad.46.1794053829446;
        Sat, 07 Nov 2026 04:17:09 -0800 (PST)
Received: from d.home.yangfl.dn42 ([2a09:bac1:76a0:28::1d2:30])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed47d5f35asm12773555ad.49.2026.11.07.04.17.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 04:17:08 -0800 (PST)
From: David Yang <mmyangfl@gmail.com>
To: netdev@vger.kernel.org
Cc: David Yang <mmyangfl@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v4 0/8] net: dsa: motorcomm: Add BR_FLOOD and BR_MCAST_FLOOD support
Date: Sat,  7 Nov 2026 20:16:21 +0800
Message-ID: <20261107121631.1040612-1-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.53.0
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

Offload BR_FLOOD / BR_MCAST_FLOOD to the hardware for bridges when
feasible.

v4:
  - fix VID 0 handling
  - reset port flags on bridge leaving
  - remove local cpu_ports_mask
  - translate FDB VID for VLAN-unaware bridges
  - limit offloading to exactly one bridge
v3: https://lore.kernel.org/r/20261103140109.874443-1-mmyangfl@gmail.com
  - refactor port isolation and filter action for standalone ports
  - recompute flags when a port leaves bridge
  - honor BR_HAIRPIN
v2: https://lore.kernel.org/r/20261011030228.2761810-1-mmyangfl@gmail.com
  - fix build error
v1: https://lore.kernel.org/r/20261009005542.72860-1-mmyangfl@gmail.com

David Yang (8):
  net: dsa: motorcomm: Fix VLAN SVL and learn limit definitions
  net: dsa: motorcomm: Drop VID 0 VLAN table programming
  net: dsa: motorcomm: Reset port flags on bridge leaving
  net: dsa: motorcomm: Remove local cpu_ports_mask
  net: dsa: motorcomm: Isolate all ports during chip setup
  net: dsa: motorcomm: Rely on port isolation for conduit port
  net: dsa: motorcomm: Translate FDB VID for VLAN-unaware bridges
  net: dsa: motorcomm: Support BR_FLOOD and BR_MCAST_FLOOD offloading

 drivers/net/dsa/motorcomm/chip.c | 293 +++++++++++++++++++++----------
 drivers/net/dsa/motorcomm/chip.h |  10 +-
 2 files changed, 208 insertions(+), 95 deletions(-)

-- 
2.53.0

