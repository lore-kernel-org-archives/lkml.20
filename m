Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B50453B83FE
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 06:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791786635; cv=none; b=FotylV3TfobyV/6abNeKJk7sqZ8GiMHjiY2Djt4fzIc/OhcMmWu3d2XITdBi8MIZri8UbbuVMCEv9l5hMR5wLFLpRniwmrMM1U67UW8b3V32tXhtEN7HfklpGQkOURg00XaSYffnCObJe2x5A0PA5etqBAU/qt/1dCZ/mj/4h8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791786635; c=relaxed/simple;
	bh=kush89tfYOU1JxwAwJZIfZQ/PzjRzYKc1rNwZWy+i0E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cnt/B+xj+rMZxvT3ABIplLmYsBZOaYf4vknwPkST6cmLN7DfYIhDgTMP0VZXg1V7IulzlgcrtMEulghSiaah9A5Ql2xRIcSpIMT7MyVNBqzU6rhF+fgD5verDuYpwnOSUPhDKX/53TpwzUduNlPU384BVZOY65A5GE44oL4uS80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gpalgfql; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gpalgfql"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2e8d2574fd9so3786865ad.1
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 23:30:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791786627; x=1792391427; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=c8rQgecj5WAhhesRJhsBD8MQuFYaTQXU6UTGWDxYrLM=;
        b=gpalgfqlg2ASHX+JHmMWbdQc4nOR2W8+l2hVj7icGP9jaYIa1gLlZz+ehy8332HtXj
         uomOSbaPwg3V2ERKiKsy9pYL7qwW+ih7d2fVHL0GbqZSNmUxwd5C4i6Mg+HSzTywM97K
         BLz+cce2jlPgTWTy2T354Qb8/asXcO93Qw+COiOEtK4R0keNYvVqcerrCPCPrpUksh/J
         RNplxc6lcwl2v41kgZjXStJY3JkHgpQO68+cKYjyY9Fz8IOuhwGs47Uq/RE1iUr6bg3V
         p5jPit1e6ingWejEUy5kcZ3UMmWAVsazHa93MwR2coshIqX4eidqZ8h814aX7E52Qbut
         K+ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791786627; x=1792391427;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c8rQgecj5WAhhesRJhsBD8MQuFYaTQXU6UTGWDxYrLM=;
        b=YF97/OMs/CMtrIF/dQXvwJBjSqhIB/c7VBTtLIEG81hkVaPWtmYaTUrt4mh76O4Leb
         KML0CVvi5Sxjq2pE+hBD7+cWWJ7y6oEy2uNPy8y4BqC0qva2G2dtw6ybNoC68A0LAQFk
         p5VsCRXBIJD/dKRxUqqPGu2IDhtBH7Noq0FJeTSqRgJ9HaZaDzfbaKbE4Z+b8XsSP1Q7
         6VAGajoncjQ3N2hFQ86vwrpbX0ZTd3XNceYOczieivDScH1tByr5hLe4FLvbYGtDb7Xe
         HqUanyG7qFwaAqm0bPbI7gKuu2+K24IrNzeKPP+F87reAU+O89CwfJ+8vOTwt2tifkYD
         UntA==
X-Forwarded-Encrypted: i=1; AKwUvBwUDgY1vGgFtJdww9XaIBk8Y43Q/6Cdo5wHmLw3VQp4Sq3a715gXq5oFl+x/UkxTDd+G/HygbFjQe83A0Q=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ9DPOyrG5N0nCrmRUquueb6DwC9MpK9P61vMlTdfcn9uJ2JEfi
	yHDMR4+84ZjWFyYb9nQDgoFKpFiLS3kPCrEIWMGe5Mvay9U8mp7Zibft
X-Gm-Gg: AYBFou09ZuW//IejDDCFeCgjhuNrOakFH5UJ0pvDGq3G+lfo6GNVQu4E/V3nYGYgldB
	ndXw1K2PnDdOHSD6RxoX0Vp02VWROQEQg+r9lHBLyDLyk9/YuH79Q0KN5KpJF9KCd70S0NHipBj
	FyDtmvY8MjP2IThetthOCiqxoSmgBnj9wgCwruZHW39tuINvnVMz3vMaho7iq1mkKhF59drlMoc
	qkNgRnVRvE2avyfLJWF9mdOmiS+8H9rJCspd0pqAhx8nVINNPQBjJBGiLD8UYfb/hE6RBXoyV95
	H7HQrPpNy2KQ/pYC3vr7K76mvDni63tOOzle1htlG/ZJMIOAXPiPhpnUO7hDLEdUtHNbu+8Q4G8
	HlHOZKO0kIdDqfqw2i8Qk34QpbesJ46QhFeiY38PE0FvHJcPFZwIk2yuB/pRRsHun0Q1XxbQhLL
	i7vojYBe1zDi6x6T1V8pEmHhVG4dAExpS4enm/GhEPKNheF7qPVJU3lnB9A4fupzVNJEVrvq9KJ
	r2ufn4Ip6b+Q8fsC+UtVB5qlV25jEzTXnkLyvhf00cLgls+DTGAnwljqmXPpZ0oRx4Vw1/PwQ==
X-Received: by 2002:a17:902:fc4e:b0:2dd:c170:2d4d with SMTP id d9443c01a7336-2e842abcb40mr85581395ad.24.1791786626975;
        Sun, 11 Oct 2026 23:30:26 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8422da9b1sm39071745ad.66.2026.10.11.23.30.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 23:30:26 -0700 (PDT)
From: Joey Lu <a0987203069@gmail.com>
To: sboyd@kernel.org
Cc: ychuang3@nuvoton.com,
	schung@nuvoton.com,
	yclu4@nuvoton.com,
	arnd@arndb.de,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Joey Lu <a0987203069@gmail.com>
Subject: [PATCH 0/3] clk: nuvoton: ma35d1: fix parent lookup and use the generic ADC divider
Date: Mon, 12 Oct 2026 14:30:17 +0800
Message-ID: <20261012063020.3331443-1-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The parent tables of the MA35D1 clock controller were converted to
struct clk_parent_data with only .fw_name set, but the controller node
has no clock-names, so the firmware lookup can never succeed and the clk
core only falls back to a global name lookup when .name is set. As a
result sysclk1_mux and everything below it (hclk*, pclk*, and the
peripheral dividers and gates) are orphans with a rate of 0 Hz, and
clk_set_rate() on their consumers returns early without programming the
hardware. This was found while testing the ADC clock, whose divider
register was never written.

Patch 1 fixes the parent lookup. Patches 2 and 3 replace the dedicated
ADC divider driver with the generic clk divider, as suggested in review
of the earlier "use direct formula instead of divider table" series,
which is dropped in favour of this one.

The earlier series:
https://lore.kernel.org/r/20261008064307.2757324-1-a0987203069@gmail.com

Joey Lu (3):
  clk: nuvoton: ma35d1: fix parent lookup for clk_parent_data entries
  clk: nuvoton: ma35d1: use the generic divider for the ADC clock
  clk: nuvoton: ma35d1: remove the unused ADC divider driver

 drivers/clk/nuvoton/Makefile             |   1 -
 drivers/clk/nuvoton/clk-ma35d1-divider.c | 133 -----------
 drivers/clk/nuvoton/clk-ma35d1.c         | 269 ++++++++++++-----------
 drivers/clk/nuvoton/clk-ma35d1.h         |   5 -
 4 files changed, 135 insertions(+), 273 deletions(-)
 delete mode 100644 drivers/clk/nuvoton/clk-ma35d1-divider.c

-- 
2.43.0

