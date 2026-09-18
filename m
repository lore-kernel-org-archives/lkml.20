Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com [74.125.229.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E0654E80CC
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 12:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789734327; cv=none; b=PpsXml9g3gXJ3ONYlVqqKKpeUpx3/hSPCe06Q01ItyfnW2gSdhNQuWcXbIPlhTyR8sLW7kPaaoXUVUJ27JKILka0Vl9+IZUdHIS3i33VRlV1/yT57eKCcGvWoB+nXLnQqimcyBYZFtvmiZoJK4Oj/pANPca/aJcu2BCMO2x3Jrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789734327; c=relaxed/simple;
	bh=9ZSenL6dtsrp2oZX3sDl2ArZs7VcmFhK1VTxgTrS8gc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gWqM0GD5KA6e64C7/Av2yhLuOrUhpSoAMZaDU/0ouf97uWbbLOJzp8Nsu9JU8pSu/yCfXl4FtLAyh4o9CsLyUiLTmnYT/6d2MPYKOLojO1DaP8YMOEzFoWJV7Ed7q/akFCT3FxIk4r0p7tV0mypFB9r4h/1JSV+x6LgkTq4kXv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GeSAMZ4+; arc=none smtp.client-ip=74.125.229.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GeSAMZ4+"
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b5e4f1744fso1062822e87.2
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 05:25:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789734320; x=1790339120; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CMf/fmxNjFr5lz+nt/08I/rGej163DC0gAtINhbDhHI=;
        b=GeSAMZ4+viRqrtMAXU7pv+EBNtYUJxdYWLgPvaWfC7AlTwrRP/ci8xdwdH/TB+rEsp
         m+TYjLPoxSLfSwmn98GxukRg78bhJ3MN+LuRsR9mzEuvYSC9wTJIOSlLtIp2ic1WSH6p
         07bXf2aQ0LhzB5YGHpLw6Wh94c/zg9M1bHUdjvds2aL+65eJ5+07YfU2LKuf+USLLc92
         y5sc89zMAWiR7nGxuoJtwjC0bBdfq50fRtMyaG3wr2ydH6j2ZZZZjk0/BJ/zcSm47DZ/
         vyih9qwKiTOY4cHo0PSDG/VcTRm35Sc8+LyMNOtpQC0HVfWlRrsXJ2/2gh3Qme8uKiUe
         1Fxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789734320; x=1790339120;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CMf/fmxNjFr5lz+nt/08I/rGej163DC0gAtINhbDhHI=;
        b=usYJl3YNvyp+ZFK7tGH7rSRD4SafO6YlWzI1fGga6COhoSVE7QAcQTIAYQlQ4wRcG4
         vy6WjsT8rUBrxQWfmseCXIcV+QNk+zx9CT7fe30TdGP8guRQx1y6L5xOKJbLy1VIRey9
         2t/rgK7N56fc6GCcKz/xxgktDakK/d9A9aCByHM6rY10n5v2GoN6SYL5UCbNf67PJzR1
         NfZVfdXxr1oo+F2TRvvdDT+3Nlbob8N+pDCl6htTDDIobyOGz6syYuKQ929jI+lUZVFJ
         kG6ns6WPOYH4rMrJrU8FZWRL7UcWvFrrAl96aQVhg4SHFqRCwzjEBSJjhGRs9XNEQEew
         gbmw==
X-Forwarded-Encrypted: i=1; AKwUvBwZPapE52BKkib1VWgO8cLfb9uVEN6spSyrbVW5hWdUWgaMvEZ5CxAF60lwunJk0I/dQTNnV20F/Xq/woA=@vger.kernel.org
X-Gm-Message-State: AFuF++mcSOYSyR0EHdaAxcJlfgb3FNpJCvD0+SrR2wzu6S73+bwA9/Tn
	GCvyuZPYRZHc/mA6VcMql2xNlVQ8FwWOWbUGxnzD+b7IbSty5AER+DgY
X-Gm-Gg: AYBFou1GvS49HyQWgUQTEP2p37ufqA/PrOMqFgfGxvma4+VApw1XKH5JdSWta2Zf28X
	0AaqpVpD/j5J9zJ1Ld3WHq8caUYWCs7Isdta5qVreH7CBk9aWlp3tcjvi5hfB5lLoUipjcCa3mB
	JWvQSOdUI9NAkGdo8dNO7cKNJ1F87JlpHQZPomcLCq9xawnyITGso4r+qMPIWBbTBLHVlQCCnXK
	J//tvzBbMvgtLrYds0DXNYj7G4Q6O9OE68Fpm345yCKahaVGFq679FjC4cPvG3ZnI3pGfIuDOkt
	K3q0pz6INMC6wtDuDS1iXO/BYkK35qBmt+eum8zLsDOx06vDGWK8yIvvKPoqqiInUk+NBmxhbiC
	jFdt0rU91G2LfEFG+hp0kz9A7PIaVsOTafG0r0HR3ARD4yxxyTz1wcLeVVyH3X4XWIW17eWcrcy
	0XbRXbNGbBkvObM6L5/j4HXHS90HBkE5tfs9P0EgQi217wwbD2rTdZmKlvrQhpwuf9tvnrB/2ZP
	xt5tw2PUSt9YUnyvy5YOJ4qTnE1M3mo0A2R5L08EDnqexvFPe9lgpgvHnoip9y6rI+b2g==
X-Received: by 2002:a05:6512:3c93:b0:5b8:9fa1:9c3b with SMTP id 2adb3069b0e04-5b8c1846e53mr784754e87.32.1789734319524;
        Fri, 18 Sep 2026 05:25:19 -0700 (PDT)
Received: from yantra.. (dsl-trebng21-58c187-236.dhcp.inet.fi. [88.193.135.236])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8c270ea53sm398549e87.12.2026.09.18.05.25.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 05:25:18 -0700 (PDT)
From: Rupesh Majhi <zoone.rupert@gmail.com>
To: Andy Shevchenko <andy@kernel.org>,
	Bill Wendling <morbo@google.com>,
	David Lechner <dlechner@baylibre.com>,
	Eddie James <eajames@linux.ibm.com>,
	Joel Stanley <joel@jms.id.au>,
	Jonathan Cameron <jic23@kernel.org>,
	Justin Stitt <justinstitt@google.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>
Cc: linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Rupesh Majhi <zoone.rupert@gmail.com>
Subject: [PATCH v7 00/10] iio: pressure: dps310: FIFO and triggered buffer support
Date: Fri, 18 Sep 2026 15:25:07 +0300
Message-ID: <20260918122517.377565-1-zoone.rupert@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

v6 had FIFO support as one patch. Andy asked for a split, so ten here.

Buffered capture without a trigger, draining hardware FIFO on a timer.
Patch 6 adds an IIO core accessor Jonathan asked for; patch 7 uses it to
refuse timestamp channel, as FIFO entries carry none.

Pressure read before first temperature is held, not dropped.

Tested on a DPS310 on a BeagleBone Black, pressure 32 Hz, temperature 1 Hz,
watermark 1. v6 stalled on two of six buffer enables; this series on none
of twelve, at 90 to 98 scans per 3 s trial against 96 ideal.

Patch 10 opts into clang context analysis and comes last, so it can be
dropped alone. Built with clang 23 and CONFIG_WARN_CONTEXT_ANALYSIS, no
warnings.

Deferred to a cleanup series: min_t() to min(), 1000 to KILO,
30 * USEC_PER_MSEC, David's define sort, c00/c10 via get_unaligned_be24().

Rupesh Majhi (10):
  iio: pressure: dps310: fix CFG_REG bit definitions
  iio: pressure: dps310: use a local device pointer in probe
  iio: pressure: dps310: use get_unaligned_be24() for the 24-bit results
  iio: pressure: dps310: take the lock once per raw read
  iio: pressure: dps310: add triggered buffer support
  iio: core: add an accessor for scan_timestamp
  iio: pressure: dps310: read buffered samples from the hardware FIFO
  iio: pressure: dps310: derive the drain interval from the watermark
  iio: pressure: dps310: implement .hwfifo_flush_to_buffer()
  iio: pressure: dps310: check the lock markings with context analysis

 drivers/iio/pressure/Kconfig  |   2 +
 drivers/iio/pressure/Makefile |   2 +
 drivers/iio/pressure/dps310.c | 726 ++++++++++++++++++++++++++++++----
 include/linux/iio/iio.h       |   9 +
 4 files changed, 652 insertions(+), 87 deletions(-)


base-commit: 61718ed183599e5162496b5306c3377a925d21cd
-- 
2.43.0

