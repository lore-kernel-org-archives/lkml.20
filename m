Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E864D4EA378
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 10:23:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792059827; cv=none; b=sUP+bt5ljlpOVKTj6iU+n6fwIcVQA1O13c8McQdo6W2ZGCGkexlweKpvf4MmJ26euvh+d1nzhbdQ/dlnj5Xu2C65BkqcqzlyKF9kUvuAxYWADfD1GFMGoOVR6WUNbLXgOSX12+V3DGuIj/yTIyLfC5fulpIB/aW6E4MrJ8qRzNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792059827; c=relaxed/simple;
	bh=Bh3H+LUzhkBIffj284EKBCnhxWAGkIa9mZwra3fm6Ws=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=l690MnEx7l/q8SfjqU+oGxkXYCmXWEmqBBJ0Pz6wiVcKA1TKV8z7PaikOiA7j09LsVRPxHxbU/BvLHW0veWB8BY58TNcf87Fuiyxcxg6JtBPOj8v1DNLcxg1l13X3AqUnnhNFqWMZLOOn+2ZBxNw333wbIR5pi7tIxoHVoYyvNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hfrdo/td; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hfrdo/td"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48b0d19cf7eso4612664f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 03:23:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792059824; x=1792664624; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FZ03ahkbPaO+GKHMEmL3lRce7EgYgsIUaIYhnRWAhmk=;
        b=Hfrdo/tdsAywdEJ0Q4zjR8LTvZIgQv4p6Red3MzTMbjAGQnbomDXgdDanktGnLOwrS
         XMkfH0kSWZ/iNk35Bhdt9gx4hpj/Av1NQ1gIT4QXCHWtsqr7GCAwp32PZ0Y2Wj+3f4Dx
         /vgK/rldv8A2F1m07xa4XeBQ33MdmdwEe/Av/lVUSNRDGa5nGO4xJ6u86nLByp71P3+5
         KkV5O3yI1aKvOB7d9VXaDjzI931rZp3Cpimra5JC8Mp4h54RhN2WW8ohscaxoAD84W7Y
         vTbNzf2cl4BegJqxS4fg+SRKprf58/9xgHihvaDS6iuF35vOgma0HP9ku9x1GA64bSkI
         gFAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792059824; x=1792664624;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FZ03ahkbPaO+GKHMEmL3lRce7EgYgsIUaIYhnRWAhmk=;
        b=0AMtAP/crgWliTRjzH1ZmBg6qui4ppkWWb+8nxy1mQEgjWTlljv0zWYLBM30p08NAV
         FRqgOiSRFViCPURBmKc6IrSyRjBUxEoJNpdoLl8d3FsNZQ4qkWYjgQxPKhUxLkBlSccW
         S36dwQ4qsaXO/wjjtZmQgdvYwzsrCEPmBjfuZVVUPgXSOyheqSGMGBqkLrkQLQn/snIZ
         MFDeI310lanPLF4iTnDYr8oKCzpPdc2y8GIk6Z+e+wbXUqGY7dhYpm3oIzRq+5+g4h9A
         oBxYTpepn1gYr7ItjIP2Dlfbh3p3AxxszWUJ/vk7f6Y5MIVgyOfLss5WX+n1R0IaUpzu
         oDmg==
X-Forwarded-Encrypted: i=1; AKwUvBztE4TikBXkdCYAyrsOIvmNIuWAn+3Fq6tsHVDhd5a0JDsi96t+BMt6+15C5vNPWPCFOyo2Yb73flQIyHE=@vger.kernel.org
X-Gm-Message-State: AFq9FYLzImoixZHMs+hv1NpfWcdXlZ0ZszxhKPHP9lWPb540CvpioDL1
	KJ4SelNtz/g/YE0bvvWSpKrwFo1BhqjKyoHVspm959Xx45iYTB9H2uJW
X-Gm-Gg: AYBFou3VPzaPKQSX9w14fvZCHif47Lxz995bZ28zjIBAy9AR9AziEXM2b3CWoDxc8s5
	5ORFdZnKeSoKJMC5GkyoeRP0Dy7hS8S8s9f6sJO2glXael28VexVE7l53XvkZ1CuYltYpFAf9+d
	lULfg9EdOqrHl9JShMCFdBa0mldeG6hVJ5jMecMUmdJeos5ihi0t1/eXoTUIlZ7b/0zeC1tBHsp
	HgbI8uOK4n0lLvcg4Q/vN4X1lcaCVPdbO6519wsmj4MmDboTVgpbaEfoRmjm+SbZW7MPtDq4QJT
	DRODNUAg8FyrBrFAviUdYHLcyEMra0/e8x6b0jHeAc9PklgU8A1AlpHH2P/ti/RW5OUR2jbVsig
	ESOz8N+C5eLbMNShOpQD8A7cdil1J9mrMUM3S56a5DAb9Y2G2mTp4N+XybG2fuYmPeUIsT5Juwa
	cnylSvda2FlgzxmERNEluyd4qyDa7I1weEDjrapJRJAIIYcJrOiPbIe5iffuM8ZAfNHtgyL1Gt0
	od/DyLkRNUqFwfYvVo=
X-Received: by 2002:a05:6000:2dc5:b0:48a:f4d4:e1f3 with SMTP id ffacd0b85a97d-48dbaaecd68mr35443212f8f.13.1792059823690;
        Thu, 15 Oct 2026 03:23:43 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0ab6361sm14952542f8f.32.2026.10.15.03.23.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 03:23:42 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>,
	Tony Lindgren <tony@atomide.com>,
	Lee Jones <lee@kernel.org>,
	Dmitry Osipenko <digetx@gmail.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-omap@vger.kernel.org,
	mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/2] mfd: tps65910: Use modern API for poweroff and restart
Date: Thu, 15 Oct 2026 13:23:18 +0300
Message-ID: <20261015102320.23760-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Switch to modern way of registering poweroff call and add restart call.

Dmitry Osipenko (2):
  mfd: tps65910: Use devm_register_power_off_handler()
  mfd: tps65910: Add restart handler

 drivers/mfd/tps65910.c | 40 +++++++++++++++++++++++++++++++++++-----
 1 file changed, 35 insertions(+), 5 deletions(-)

-- 
2.53.0

