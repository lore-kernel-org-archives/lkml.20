Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22153425878
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 07:14:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790234107; cv=none; b=gMMBBchcysJJUJ5dLusVgw1Y4CBxbp7GtsnGsEdpTDc1fcA6fPrEx7uckYBVW99vJUiVRxvazdQgp7TxRflKBRxetQMK3S6QTnp/TB2V8lFT7SCftN+X+Sg42SsyxHmYGfayA/99+vJGLrd7bKMbQzUw1j6+xKRb7S1x9Wn56XI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790234107; c=relaxed/simple;
	bh=7N6pTSfQIgQpZbCNDu3Pk+zXTCh3MC0AIlBR223ryak=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qKsSZ4a4gQiU58QjiqAwba3y9o1HWLqaxlY6kc4/EbBsMXU7B/LapcFjcTXixNJDVP+3puaWMt1ajBoHhTPZJHGtlhDkBiA/4GSmlxZLdsfoL5MTT7FT9B7fKPVbpUEqD8nueQ8v21UKRfUblsh0C9zZvF889BDrByogoCJRtPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wermuth.pl; spf=fail smtp.mailfrom=wermuth.pl; dkim=pass (2048-bit key) header.d=wermuth-pl.20251104.gappssmtp.com header.i=@wermuth-pl.20251104.gappssmtp.com header.b=JDCZOGhH; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wermuth.pl
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=wermuth.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wermuth-pl.20251104.gappssmtp.com header.i=@wermuth-pl.20251104.gappssmtp.com header.b="JDCZOGhH"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6aa13a28848so948110a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 00:14:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wermuth-pl.20251104.gappssmtp.com; s=20251104; t=1790234090; x=1790838890; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bU+4t3FGIXSiYOJEMQu/Cnc9Vdhxqo1btIx27NvDSa0=;
        b=JDCZOGhHB2+AI8B/l5/VdQjnSq1x0lSHoerfCzJrsm5cKaPp/OhRnsnkRzoAedKhWS
         Tzy9VwrRbvc/KIKUhi+Q4F30a5MgP9pL0Jnk9KUwkkmJ2FNhstHKR/ZDadeGfrZ7UU8u
         a8zE6MaKIdXok2MBFYK/+YRa1rgrRS4fKoVeSt0xgQyATmEESaKF5/HfwPZJ/u0xcJsM
         kKU0W0x9tHiIrngNjlzD+ma7cw4cX6tqMiN7J1u6UZlMXc6fshcIxadXE9F8UsQ2VToy
         oS6VxdIdkF0t+Bjns0JFENQoFRyErIBorM0g0zGjCHYHXgNae0vF4s1Csz+GI0htq+EX
         venA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790234090; x=1790838890;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bU+4t3FGIXSiYOJEMQu/Cnc9Vdhxqo1btIx27NvDSa0=;
        b=jrq39TqxVT4DPbwcae4/BGn3cnn0V3KbQYo6NwH0zQXyi2aSCeRekmiiLazDGNKR/3
         Bq/BX8XnovjNOKSJ1cyQ9i86ZJZgtfYHnZK/UKc2EjD2g2v73xW31tG/kUWXpc0spitw
         bECTDO8utB7rZQ+TIqalxZOMrTsjsOHjlCoHKxWbneaF9f1Z5qR5PeqHbjy2FGNZboaP
         b39gsp1Yu3bMJuqlGzQxxQvLm1eQVWDnjrimMDEk7Njw3pzHitT43E1nN7JSLWor2t5D
         RyqGw+Xd/3YWTFQ5uhGzFTz0rjPMEtjToAR90xuyYVLmWtDRYDl98OG57XgTcTnTzLLy
         WtRA==
X-Forwarded-Encrypted: i=1; AKwUvBz2NdXqRWtBZqWYB3tkbWut32v2bS5wgTb4h3hERvCA3oBzXozdejhd+iBZ/KvR4bqzL5EHaSGhvAj8P9Y=@vger.kernel.org
X-Gm-Message-State: AFuF++mVDCQ0KPiYuFytpH4x7Yd9ItoByL+cRSiItLZKUnaJhJS+iDi9
	Us+zi7BTPJXaSql9G+LnF3Ay0qt0BuOWolN8K4JNDZDFr0jintA7uac26hcz9Hh9bMY=
X-Gm-Gg: AYBFou2+rXgc6jc+cePQsmx0oJ3W4q1M6lMXEVIq6q7Is9tzOGxZcGlBZUbw+8PMUsz
	y4a9UgxVQIz/snT/YdyNbJAcFu3UGxCLZ3Gjex8ONvEhigM/p/OkID2aL4PWM1Fm9+16ndtfvTP
	ZyivRGo989/0BFd4Mm56f14ZX+jnGnbduUuk+zWAB/fwKVnD9RgR4PsgU09dX9Js68PP+hOsenE
	3WZIzsh7azs6YFZsA5sYA8/rRgy0huxpwxHH9dQ5j/85tpV/BIiT1VU5ru9VIpVebOIVkxOwsi6
	GaLgqOBEg6VUecNJ0otjmh1BPvxPNaw1+0l0ZmjY9GbXm81afRyPr8w3RW0Ut2EPdMjjNfagADS
	hmFMa2ma8WXFD7pNIidiKrTlIuf0NavIv5uGZc8fDdlBLhSR1BV1dwRZZBfnbfMX8PbXMni22H1
	mZyVIqugzEwUAgaD+JAzSQ8j5483dJDY+gSfsACmXrhhn4IUVjpIkpklfwiBiEcq6yayvnrCZ4V
	qZciJfsv07d+J4HCcwKJvEPR/NDAaXl4iRqGqr91QcAxIE=
X-Received: by 2002:aa7:d712:0:b0:6a6:b2b9:7660 with SMTP id 4fb4d7f45d1cf-6aac8f86d0dmr907853a12.13.1790234089543;
        Thu, 24 Sep 2026 00:14:49 -0700 (PDT)
Received: from janlin-02.home.wermuth.pl (109-206-198-27.host.skynet.net.pl. [109.206.198.27])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aab38a9756sm3306589a12.25.2026.09.24.00.14.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 00:14:49 -0700 (PDT)
From: Adam Wermuth <adam@wermuth.pl>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Adam Wermuth <adam@wermuth.pl>
Subject: [PATCH 0/3] Subject: [PATCH 0/3] arm64: dts: rockchip: Enable M.2 B-key slot and fan on Radxa ROCK 3B
Date: Thu, 24 Sep 2026 09:14:42 +0200
Message-ID: <20260924071445.441822-1-adam@wermuth.pl>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Radxa ROCK 3B has an M.2 B-key slot intended for 4G/5G modules and
a 2-pin fan header, neither of which is currently described in the
mainline device tree.

Patch 1 enables the second USB 2.0 host controller, which serves the
USB lines of the B-key slot. Patch 2 describes the power, reset and
W_DISABLE# controls of the slot. Patch 3 adds the PWM fan and ties it
to the CPU thermal zone.

Pin assignments were checked against the ROCK 3B V1.51 schematic.
Tested on a ROCK 3B with a SIMCom SIM7600G-H module and a 5V fan,
running Linux 6.12 (OpenWrt) with the same changes applied.

Adam Wermuth (3):
  arm64: dts: rockchip: Enable USB 2.0 host1 on Radxa ROCK 3B
  arm64: dts: rockchip: Enable M.2 B-key WWAN slot on Radxa ROCK 3B
  arm64: dts: rockchip: Add PWM fan to Radxa ROCK 3B

 .../boot/dts/rockchip/rk3568-rock-3b.dts      | 102 ++++++++++++++++++
 1 file changed, 102 insertions(+)


base-commit: 23d8f49fcae5d72b77744c7f349c12462c3bb748
-- 
2.43.0

