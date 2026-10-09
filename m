Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B841B4E3ED0
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 13:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791553002; cv=none; b=F1IXzpzCVDhU/2PBI7HxfEtikzoCICUJRvpJyJ54Lms4AnO8aFWzblSJreJQe1xCaNXj3LZCCbxF7C3E8J94XuE0ZreOxWdEcDsll1YwWsd3zSr8aStlve7eCl7AKVBsEeOMxzb/pJ2mQvEJe7O6vFDMxG+5pE5GPpd0PSAJto8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791553002; c=relaxed/simple;
	bh=sJuIhL4gV1KuB8hdYwpWXl2+91IwJSqat64ie0u/Gfc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ByeB1+e6/iBra+vP1V4z4UWeA6dpcaq9k6iN+jaliS67IFEn40+0RkEBbzGzrwuPJkVxbwJkWyNAaLOfepyham1xmtRRP+iZpEM/bMWgjNcpo3UcutOKb6/Rw5oFP6lfCgAlEFpWzNWoISWQwfiFsVtGamS7jPWOyODeSem6omE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=aayushk.dev; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=aayushk.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2e8246b13cbso11983475ad.2
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 06:36:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791552999; x=1792157799;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yReOBWtsExLC9kimiZKgObiHOUZQvX8Kxe/YILGNqpM=;
        b=ltuE8bWZt4UHt3AeEZRKbboxY/Xzfz3LBBlwR8PrXiSOYxBN0Rn02hULbOUfXsM7Iw
         6xLnQioqTCbz3C96lJaFZxbqyPsXXKHwDaZFUIIY6tvTts86nBTwCC4bzTjj3GQefKi4
         P5niWlY+VVmnd2SXzgP4aLAn/G+OXCtzds7tNfcZ6czY0PkgQPL7cIRWuftPNv1VXX2W
         BobE2MVZe1YjnM0+GO4Y82YeGqgGwp3I9rREQ7oL+O6JGnFWAyQXTZrQ0F6UZ65PShpi
         Q85sTFxsqBd70VTtUqeSuAOgAbiNEnyM1s9VkTjOmYuhkTtaL6MJTsjNiwqwXqY/K37R
         tTxA==
X-Forwarded-Encrypted: i=1; AKwUvBzVmUaBzqHDOV/jvwzre04tk7cWSXgfTD6gPbF0kBRdY/nJVWDfNocBf+TsAZv7bXEvFPhYZla7r+zEVew=@vger.kernel.org
X-Gm-Message-State: AFq9FYInhcd35Xz9z6VLAfse8IIsjxq4GfHbduGzxHJQ7t/GQF7sj54B
	Ad5TgV+OeGqI6WjyAeVfw4jyxLJiWcVQKPuTL0VQQR1Pv7HbgjqyZyPJ
X-Gm-Gg: AYBFou11GKpBWfIbHMR13DDzFxYIKDG0Gf6IgqkGAX7MupqmzbjBDEfWUgAbKsyiZsb
	RJtBz8LmkGMIeJ+JACwxa33VEiOOFMbPvTaiH6gTinuU9GWk+y1eElOHciSVOsjFN8tSC0OHP4o
	lj9mHWlg8Vmp61auOsCMTMhNBsRqyxlF37nDqZebJQ4YUe8pRhMZQWEdygBpg6LL5Lv6lO2Uxfy
	dwcQVCUNujgBswRF4izm8hrJ67B3JT8/l8fdfhxQEqb2uiMayzTFgIGXTd0G1zaA6l1F4abb168
	MBsnWnoV8QIAlCVCZ9cMzfPZcnOJ4xJHvaGpzkzHLQGbwJZcrWt8C6BKgLwAzfUZVrJZaNLj5AU
	Cz84N1AN+Nq0aU0aUQGQ8OELxAGSKrcAsqF6IqxD/lHkkmKd3VdAovZukbCtb204i0FNb4mqNis
	ES4ky6thhK7EKbN1tVDQhfEqecIc8x6rBiQGxhEZorEw3e05D3g2bjsj+LNYc=
X-Received: by 2002:a17:902:f683:b0:2dd:ad74:ac7f with SMTP id d9443c01a7336-2e842aafe0amr17988715ad.26.1791552998873;
        Fri, 09 Oct 2026 06:36:38 -0700 (PDT)
Received: from linmach ([182.156.30.23])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e841a05f70sm9260455ad.7.2026.10.09.06.36.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 06:36:38 -0700 (PDT)
From: Aayush Kumar <code@aayushk.dev>
To: broonie@kernel.org
Cc: william.zhang@broadcom.com,
	kursad.oney@broadcom.com,
	jonas.gorski@gmail.com,
	bcm-kernel-feedback-list@broadcom.com,
	linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Aayush Kumar <code@aayushk.dev>
Subject: [PATCH 0/2] spi: use sysfs_emit() in bcm63xx-hsspi and bcmbca-hsspi
Date: Fri,  9 Oct 2026 19:06:29 +0530
Message-ID: <20261009133631.579644-1-code@aayushk.dev>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the sysfs show() functions to use sysfs_emit() instead of
sprintf().

Aayush Kumar (2):
  spi: bcm63xx-hsspi: Use sysfs_emit() instead of sprintf()
  spi: bcmbca-hsspi: Use sysfs_emit() instead of sprintf()

 drivers/spi/spi-bcm63xx-hsspi.c | 4 ++--
 drivers/spi/spi-bcmbca-hsspi.c  | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

-- 
2.56.0

