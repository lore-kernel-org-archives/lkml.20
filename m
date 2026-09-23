Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0359049504E
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 10:41:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790160080; cv=none; b=XDQSSuMgx+WzT6OHU2IvgNSTVbyHSHgLWgctAFCHey8v3g452MPhFt7r461kz1LR5FeDsqbjDkwtMyYBkSrwO2mIEau11vMEAe4a5wSEklBNH9dq+Wy3bgdFOAamR9BRs0H+E7JipLCg2nzPmo/aR/KLkaWI3LkP2paLH5J6xkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790160080; c=relaxed/simple;
	bh=3FpZ2LQPJEraDRB+xfM2+yX1c/xN43QUsBqOJ6MBVec=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PSODkKD5S9O4U4EP9KBvN7n2hVc5HiHgJGT4e9raUsj9OuAHlj7XIQ8jtZ9rq/9/5rYGfx3TGARWS1X7yjDIayFu6jZqZxcvQbj423w1WToV+3OTNI6LGFR9MJ78XZ64gwiGy+lcU2fFfRm3QQ0qt+CEqz6yknIUsXB5lsj6T7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kTjAnPwz; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kTjAnPwz"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49e6598dd44so3574435e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 03:41:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790160062; x=1790764862; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uy1/P3kdVU6Z6TgBEn/xi8p7dGk/j3Q9N42vq6jL5bA=;
        b=kTjAnPwz1Kc5kesTwhtOES+DFBF1BnpH065abtkiGjK6nCcj+w1P0ppyICpgFexZVY
         Odg8dcA6Ga/BsRmIbalJMhroOYhB8bpa3ux4EGHclq3yG/lyXlhWA20qOpy61ii5fFX6
         106BvpkqmlnfW3wWuDHtjgtjD5t6Np9lRvxCg2hc3VCREdSrI2+JvtY4Q8m6f28ZwQe7
         ZxQLKLmJ3lTXfR4BUu5Xlo7hdXDavFzhtMhtofvHq8WTRFEotG6cB+xSSFO7MNwrcn5N
         ACMiZEnmD6zLh+4DUWQcJVnT6Ie1XCwfcf+DKEDd+2cztOxF0/Yiqj9spdblCrzDV589
         ysfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790160062; x=1790764862;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uy1/P3kdVU6Z6TgBEn/xi8p7dGk/j3Q9N42vq6jL5bA=;
        b=ocI/gbsLx1B/32M/XRsF8ryG+G/q+nzdpnmXCNhIpMIWIcfS28bcHbFnVYdl/qzCoA
         KlC9on8j5GUydpVMPer02aHvWf76heURzavIAu45TAJ5heSOi/FWkOmCh3cFY1seH0c3
         M7hv8NY34T3oHmu9PYO3oEgVzSBZnzMkYAVJGzF4cjXFrnNc+Qwyq/zgRC9/wK2/tc/S
         CTFHKMzQUNh8geFXH5XYV8sR+ag0xdulash2ms5RaUksw0b5oAYc8BzIffC5FDuN8ka9
         cs5Oh7BseVKP5EEpwgYx68d0u3sfLYNh6gbJGtNL2vZaJhfQY+9rHC6Jv9Mp4SxZDq1e
         oOvQ==
X-Forwarded-Encrypted: i=1; AKwUvBxebKWGYEM+nmq2AKljY2F2s93td6w6F7o8611vpxclxTd55p1bJbdsRghs/5G2lwMWWh7mEczKVzxEgkg=@vger.kernel.org
X-Gm-Message-State: AFuF++mdZWT3EvbpHjoiOQVHHPHwQG2C+V7AfpGTyNevSIvfR+CRQX25
	hxhPAVW3Cfrz03YXzCDgrUkHXkY390Zm2DXBVqpf1/akATMbQ7o6qtgf
X-Gm-Gg: AYBFou0ic1uh3AJuacJz6f+fuEUgpURu8dONDAzQMhFIbDTPuF43BS/WkL+t+3uaRsM
	IuvF+Wxi7nxYidJifRTsDTHXGWeJw0Ra3mIXoaq+Dg0gPR1AtGXFOuUKMm0X3a8MvEnSfMjZZMY
	cU50tH0br9OXXDdzoudVRyR9g1VhiYwMowy6uF6BZ/SoGO0BWk/zb6mNumXVkW/Jc91iegowY8S
	64+unl3sG9KefpNWMLWn3wMiovfYi3lkrPpEGVc0mAjJBZV9p2bMVkoAAa0aXcplFuZvAZwO8+s
	Eb5PAvbLbZOZVl4auFX/NhjqJSgEmdE+RMXq0KtDXWxEiSgAh/t+2bX0JL96SgSaTk5k/g1cziN
	uQiYHM3i/bHEA7rBfBw1sbYHWBqkAq2s+1Pyu9RoCSINSyLKVuS8kELd581RN1gdegauEEIvrvA
	TdZgB2/e8K/C9Atp92Y/PFBMSg0YrD17YiY8XoikgFSdqU2WnD2cqapGYysjX2tvY3fWCRuLt30
	Z3RA4df5WGgcmXu4moRKtRcKB3/IPpToi4dyefG913sN0cKOZLUkSOKk0cu5aNzgqH5zYzoihKV
	uxofW0Rr
X-Received: by 2002:a05:600c:c16d:b0:49c:ff9f:f6b6 with SMTP id 5b1f17b1804b1-49fdee0b7f2mr26577895e9.6.1790160061713;
        Wed, 23 Sep 2026 03:41:01 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:885e:6ade:cc5e:a35e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fde1acb91sm65170415e9.15.2026.09.23.03.41.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 03:41:01 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Guenter Roeck <linux@roeck-us.net>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v6 3/8] watchdog: rzv2h: Drop WDTRCR_RSTIRQS define
Date: Wed, 23 Sep 2026 11:40:49 +0100
Message-ID: <20260923104054.3324830-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260923104054.3324830-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260923104054.3324830-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

WDTRCR_RSTIRQS is unused, so drop it.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v5->v6:
- No change

v4->v5:
- No change

v2->v3:
- Updated commit message to reflect the change in v3.
---
 drivers/watchdog/rzv2h_wdt.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/watchdog/rzv2h_wdt.c b/drivers/watchdog/rzv2h_wdt.c
index ee1649e0edae..9774fe8e441e 100644
--- a/drivers/watchdog/rzv2h_wdt.c
+++ b/drivers/watchdog/rzv2h_wdt.c
@@ -39,8 +39,6 @@
 #define WDTCR_RPSS_25		0x00
 #define WDTCR_RPSS_100		0x3000
 
-#define WDTRCR_RSTIRQS		BIT(7)
-
 #define WDTDCR_WDTSTOPCTRL	BIT(0)
 
 #define WDT_DEFAULT_TIMEOUT	60U
-- 
2.55.0

