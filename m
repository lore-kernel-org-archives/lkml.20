Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3692D34D3B0
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 04:39:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790915963; cv=none; b=gTsYILCK53BBj1EBnCUySPncgv5AmOY8YFNCVAF2zVXTFa3CJI0SQ3gJSOuPH6oLB0FcEw9cZQaYTbHnbbWQ6FMfZxJZ48GV/Y8WoQcLubGNb7tOp1A/mayU62d+2INeP8y6IGBeplc3p9ukNqPWuynTLfaZGRJiCEYwMjwns6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790915963; c=relaxed/simple;
	bh=epTpcBddRVLN4supKhKWX/WetjiI9TNTrTJ4tUyIpsk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=S45broc4FUCZffJ1CdiDq5eQmbbqdii0pGwKmZllSAu4EvREInWf/CLAtBUgwgk83OYkkuKRKzjdF93RrPpx5tAlJBcTVWqwYyKbybl+1A2Si0jQ5kcv3VsiSJMhNqfnMvH0rXJXmAu7Mu9+G//QYuHVbJzziKhu7v8JjorDlqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WRRgcOLW; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WRRgcOLW"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d8fbef5018so49806215ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 21:39:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790915961; x=1791520761; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=45yc2BneUr60+dVapMzgxfzf6J6enqjBi0ExeJ7Ehk4=;
        b=WRRgcOLWP56FvxbL9n4TNQ9PqtpglIu+LDX+C3iNGJL3KUPF8ziJQy5YChVKjYeAi6
         1271ogtcP0F+gBbP4Fk4ulv2ddJUk8qbL7+XO05yC51zEsMU8PwkQ3yjihLH5LbFMYog
         pqATfBJYzqiumS4caSQECXHqLJsuPy/iZ2I4PNGRektaYxLfiKHDNmUB9AZpp6D83JHs
         KzxrW1+eQ5VifSGaqma7Yca+uyBhWpB3osVlPUoLRo1DFV49cpNoRqoYADoCWWXL04wd
         ZpV1Fr1r+892IPX/IQtXdEibKEuYRiFt8bPK7Ag8DE8WfGSigfhdZtyyXPZQhK3y3PGR
         S/rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790915961; x=1791520761;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=45yc2BneUr60+dVapMzgxfzf6J6enqjBi0ExeJ7Ehk4=;
        b=C3bWKmHpe1x5FBQTAddLGfVB8ENA1GC/SfFhErCerYBkfA6q0NfA9eqQfyl4edyFzF
         esEO4X+KqF8hw1ibYIQGktYGevTp7g3HhtCnhKXqsTOrKKFy08c+KVfxzBYW6UUIf1f+
         5/qBHou4fecGIVE1ROJfa5+P2Hel2qbFoArwJhtLERKxHElS8lUEFXhjYEU8heTQpRX1
         UKNNNaAk9oh1qCjIjSIfpCaH9If6S2JgL55vCrK1Ua67h43DF4ouHWYs1SoxIKzK1HXv
         Ci5/27hkrC/A85p+eCp7gDPwuS71HuDf7/yHG5FZuJZwbdjw7PXdCxpSB04DCrPMiah0
         bm7w==
X-Forwarded-Encrypted: i=1; AKwUvBy+h9V0f9JnCYWzZRm0gDS72eAGJPjxUht0BUGltdWFpYGsZ5U2amQd9e8Pdn2TsUCxNyAK4Fau8YC0RwU=@vger.kernel.org
X-Gm-Message-State: AFq9FYKr2hs6rtGrTLxk5Jbn9yoTpc9vytk/t4S5OZaLI50BgS+bL2+7
	SNiTBQW39cJzFyARiboP4oEWgBFDO96Jwu0k7MO7IbZNQ8RV84BxQed3
X-Gm-Gg: AYBFou0S4cOStmdMJQKaZU8OIV2EXvRJiHHRRMcDzmPP4+dxgwo2J8BRi1GnKEgsx3h
	mamUge3QS9zeQM5s6TCc6dVxIDi5rRknIKMB6gIuAyHSZZ0EaviMvtNTgpuWBnxrYzrKGnFg2M6
	lUFrfdjOHFzD+Hu1pNr0eozMhWYuvsBNPbJFnqGcfRx3b13YTVf/KcsTT1cR0l7Bj2cnbTa2YWX
	y1WOZZqU3B2piUJYdsWyn8z6rdNMnfoox07yaWgd9glFxmNLYaUiRWFKEdD+4TzkdLI0DaNDTRa
	B3D9KAxCBYJtjB1PSNhFsNJMqbREU0JwZTBW3c8gSNLUcSz0FrAnl4wp7U7sn8CSKY3SoYhAG8A
	4OFVI3KIKTtdvbx7rnBKdra8ooL0+BMJmd+LYNa/F3y4WX+Mpl2WYdonGxGXCW0Rkhcv3MZscZi
	a4ADWjEOOPMjg52G40o1r1TaI0rBngOLBBRFircE7ATCWCybv/edBySpIIbac1UpIRvUN1L5xPl
	+mST3/HNwQ9FkdU6mK0606fqK4Zq3SdVdrttXX+MDGLeS/t5ycIib1OL8Ik8vnu4G5oJLQLxeeW
	7h0bYFzyAVPrOQ==
X-Received: by 2002:a17:902:ef4d:b0:2dd:c054:1983 with SMTP id d9443c01a7336-2e49b675cf5mr13473825ad.40.1790915961351;
        Thu, 01 Oct 2026 21:39:21 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e49f67c413sm3713985ad.20.2026.10.01.21.39.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 21:39:21 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Andrei Simion <andrei.simion@microchip.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
	Cyrille Pitchen <cyrille.pitchen@atmel.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 0/5] ASoC: atmel-i2s: fix clock error handling
Date: Fri,  2 Oct 2026 11:38:51 +0700
Message-ID: <20261002043856.97295-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Hi all,

This series fixes clock error handling in the Atmel I2S driver by
propagating errors, using optional clock APIs, and simplifying probe
error reporting.

Found by manual code inspection.

Compile-tested only.

Best regards,
Phuc

bui duc phuc (5):
  ASoC: atmel-i2s: fix MCK generator error handling
  ASoC: atmel-i2s: use optional API for muxclk
  ASoC: atmel-i2s: use optional API for gclk
  ASoC: atmel-i2s: use dev_err_probe() for pclk errors
  ASoC: atmel-i2s: remove redundant error message

 sound/soc/atmel/atmel-i2s.c | 54 +++++++++++++++++--------------------
 1 file changed, 25 insertions(+), 29 deletions(-)

-- 
2.43.0

