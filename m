Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE25134041B
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 22:16:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792188982; cv=none; b=HrjpMVC04fNXow7lFMm6c99awuvWWO1/WbhWGwWyO4zrV8pdsx/R51WqNYhexlWX2IpY7qNKFz52iKXF4qrMtbg5URzPP7KbICbl06uG7pkJvHVjloaUKlLNFV+PHRmRWWY6aUnpc85F7mDEmSDxtPAYnp/UgHOXQqVzVxmT1mk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792188982; c=relaxed/simple;
	bh=XJsty+XVq3BgRuwoN2PV39ABqsBfB0LokyWIO3aDiLA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lBpEiwe1FfoGIqAXO0ssDMmFTH7pjHQ529Q8ihalbEBwcxKOYNrxovaPA3ibRtd7YC4G9S1XgqzGC9N+i8alXeGspuK/tbyPou9Dj4cv7++w6uUvwdmqI2mqMz0mW+uNXxmhHEqgoeE+zyLMwssASgrOYW/ztBkcNyOdslaPA7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZbG634vI; arc=none smtp.client-ip=74.125.82.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZbG634vI"
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-1517bda04a0so329754c88.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 15:16:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792188981; x=1792793781; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bsRKo08wZU2d222RmzKutSRcq0g6gJCTiEkblWEA6+U=;
        b=ZbG634vIPC+kuAzhAbUYFxgmlxlQ6ybF9uI/bvrzn+X3X5YMCdOfRk5Cz2fKwr36Ov
         25odjBoN4/m4wZFwKHPGG7fWShsJ8OcaQoI25HsBXBasmhgy3KoGIqFmUf0V+Xzlsbcz
         5kgz80MkzRjF73+xLKPQL2O9OmINQziqn2XNykKrDK0OYRwkSFE52541+zHDoDeLRdT+
         mTpIO8phRt6dez3RgwoqqEaJh5xnj+r9YEfynDg1UEOK1B5rfF0qdBVjYDKYPHBD5MIE
         QJYZYVElbkaR3K/pxC7h5fpl01+9Rt9agD8H06zyVG5Eo3IK9vyar0kORxRt/nvti8nv
         WB8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792188981; x=1792793781;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bsRKo08wZU2d222RmzKutSRcq0g6gJCTiEkblWEA6+U=;
        b=FOkrR7DGd5wRe7gxtS4RwVt+CZJjb+VH0mNxIEKIDyZL5TgWDXGBUJRwTOu/Yy869c
         xTBSiXaY+yLwAEdARzXDnZ5tfNTJXMtoBt2AALlBuZVQwxOj32E4XenuygPrbUJfQAMO
         R6NMu5hdgsrs1isjwmPa0UJNEUVp++ILQGAAfIwaobcxYvDFpvRAAhOCMJyOomUfoo9Q
         doSSROOWPl4kkKWgtJ2ClFIjabtM0JK8ThtrC+Ukr0pkcF/MujyMeSkCQRPA7atZhOwi
         uwHSzJYmF5LCwbk+nvg/0hxnYRJVEaGxK72FQw0ZVGtxdFFFAkFUyL6GjKIVCwaPfUiB
         Y9Ig==
X-Forwarded-Encrypted: i=1; AKwUvBz2M8CuEnclHfjhCSubQMiVFW/JMIaZb2cdZx5Z9GxyJzSU9vdfBhWo8/j5UQyHubEJ5FX4uvzzElZA73M=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ7mSAaabiqOEdRwAnBRFVgPyH4ebPc9FZFPyRYW+xCaRRpAQjx
	zdMQF1s+3a8lc2aFn98OtPZk3WNRHSMp6sRihp9ZYrgv0dRTkxUiaS9a
X-Gm-Gg: AYBFou0RDG7K+Sf5HjAyx7oi+bVAZF18ICm77c85ynBjAYKSU656GhTB6CQp6IvUXCY
	xOPTJA/FHqf2VhTNOr6dukm9UU5lvBG9/d9HBgE+oGjCiA/ve+izUBidftEVGa03PkY186ubuAw
	Wb+Csi1IsSLDvx3ZOAoAt9Ul2fJA6fpxP3zac96+y4T4TUUdREzQ1sD3Oi48H4N3x+65h493mbH
	lvAYSOEv7Dzib/rmnCtirJqKWsxZVWBx9kXjyX/fxJ8vKUuHC/9XUGK9f+ScAC0XlnCVp4gtg1f
	EG9FrSU12S49dPcf7140qvXJHbYXwpOqjPzd2+9tfJj3DfgDL4zks+IvC21pV8DaeekA/BuZUbr
	hOLHhtEgt6wTjkC3ydtfIGnR0/qPMCJDCGUAsc85JWIo25EjCEYdizlC9dvc8/bseJbQ2Bg9sQS
	HL1gZHcRgfzkhkUk95itPOeeyDkRKCVgSNCaK2+85Cadt3jJNNiLNU+UdJWYCpxwKr8ssYDw==
X-Received: by 2002:a05:701b:208a:b0:168:fe32:35a with SMTP id a92af1059eb24-18512296a20mr1365274c88.20.1792188980748;
        Fri, 16 Oct 2026 15:16:20 -0700 (PDT)
Received: from eldorado ([2600:8802:b00:1f84:d294:66ff:fe95:a98e])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831919fc14sm10480863c88.6.2026.10.16.15.16.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 15:16:20 -0700 (PDT)
From: Florian Fainelli <f.fainelli@gmail.com>
To: linux-mips@vger.kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Ethan Nelson-Moore <enelsonmoore@gmail.com>,
	Eric Biggers <ebiggers@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Mingyu Wang <25181214217@stu.xidian.edu.cn>,
	Robert Marko <robert.marko@sartura.hr>,
	linux-watchdog@vger.kernel.org (open list:WATCHDOG DEVICE DRIVERS),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list),
	manuel.lauss@gmail.com
Subject: [PATCH 0/5] MTX-1 watchdog driver removal
Date: Fri, 16 Oct 2026 15:16:12 -0700
Message-ID: <20261016221617.2223004-1-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series removes the bespoke mtx-1_wdt driver and migrates it
to the generic gpio_wdt driver which it should have done ever since
gpio_wdt existed.

Assuming the patches are satisfactory, I suppose it would be easier to
merge those via the watchdog tree than the MIPS tree?

Florian Fainelli (5):
  watchdog: gpio: Allow devices described by software nodes
  dt-bindings: watchdog: gpio: Describe minimum heartbeat intervals
  watchdog: gpio: Support watchdogs with a minimum heartbeat interval
  MIPS: Alchemy: Use the GPIO watchdog driver on MTX-1
  watchdog: Remove the MTX-1 watchdog driver

 .../bindings/watchdog/linux,wdt-gpio.yaml     |  11 +-
 arch/mips/alchemy/board-mtx1.c                |   8 +-
 arch/mips/configs/mtx1_defconfig              |   2 +-
 drivers/watchdog/Kconfig                      |   9 +-
 drivers/watchdog/Makefile                     |   1 -
 drivers/watchdog/gpio_wdt.c                   |  15 +-
 drivers/watchdog/mtx-1_wdt.c                  | 245 ------------------
 7 files changed, 31 insertions(+), 260 deletions(-)
 delete mode 100644 drivers/watchdog/mtx-1_wdt.c

-- 
2.53.0

