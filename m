Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE2D146983E
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 07:33:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792049623; cv=none; b=myeQKC4FuwWHs0z/G56OQL6df1IvlU8G8c+HlOm/5V6PnXa225BVox8zCl7HnsG7OGRi48k+axlr/34NOEx04qZ8eKmozPSyOVB9tXhFlD2ZL1+TuHZTPvbHI8g07Y8wSequHPJ3LEAXHa1QP/pPRADy93j412vUXiaAX6xdfRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792049623; c=relaxed/simple;
	bh=Nx4+LyhKsWQ5cfaU8Bahjk76PWkRTyGJfpPxWR4BODY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=MtG9E64xRKl9y2KF8YumX1y3PHi7wlQuqr1KbDoVUGCAR0/MQ9+3kYZV939lgBRGAfoh9RKcU8/flYkazQDCJslAUaZN3JiKhHpWawVjeJ1pagrHJ8Rtc6/rBukxyWG/Ard5FY1GPS3bp0NhrtzshTY021i7D8Yumzn25RXxkCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R+Gxp82D; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R+Gxp82D"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-cc1c9879395so1940251a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 00:33:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792049619; x=1792654419; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FojOk/s3XuClAwiyOiafNOx/R0mY/htX+AFS60ZWGXU=;
        b=R+Gxp82DC8fdGEehPD6bkKjGYy55vNmI/bRwZdHT53NoUYx0HG4ItGNbP+FqNtYJ0h
         XgTHGP5MrI5Xqu+UkQbUqyCwz4PnQsttrE0lUwf0q19+ZUbZDib0aPvFEb/7Q81B1IoY
         s1nxnqSSTBYH4p/E8p30xDeeRjqwVrLHjIHfc3USIp3LNporMAPXXLLWeEgg3HWp9hV9
         7z0CXaKZnAHmpECQArviux1RVKyxukdyvw0Umu1xaXSusqYXrwD7yUdIqaFyL4NLpJcy
         u32MU5q/IrU8kNvUg0NFyD/LsjqdHMOXkm+XQP2B8TfuBgkwEd2ffmeo+gmcv9bSUtNA
         VD9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792049619; x=1792654419;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FojOk/s3XuClAwiyOiafNOx/R0mY/htX+AFS60ZWGXU=;
        b=YAhvhGoiLVp5cGA+fvgQrAZMBQ1w2oT2UVzpXL7WtmbumvxQyZTJiHeBwzjjHXjkyF
         jfyzBN3180b1i43zDrlpKSb+VjrSZYxcUPC2o9EOxbp5+FQ/2fgM1o9rcnhW5luwnijq
         NRFyKSCfpvsF7sO/S4O44nghp3hUxarolFRgy4ycGFs6i+8Q4+aQOp2J5KhpHb+7sQje
         YpCtSlSW+xniDk8Tptc+CBFatLRsKd93kZaBW23Xfu7zrkmBj/2QriTIzXPgC0MY4Qq/
         JFh2S90vScJVhSV/s8RlTOtuBzwb+nPjiKpXhfAq1pzRYGzxN9GrKYwFVoi/agDsiUhQ
         K/pQ==
X-Forwarded-Encrypted: i=1; AKwUvBzK4RIj1HqO0W93O78/Hlf7k1NY4IVYqxGZJkQSCYPt1EC033RSFXDElGxCOg426n8ToC9ZPo9hdvJ40Dk=@vger.kernel.org
X-Gm-Message-State: AFq9FYK1kBPhX/7+hMmyVUcHZUTsPNXuBnw/mBVdWio3hP5DRMtt9StA
	1dPYrD+KTZo0ZpRztBREBXGN8qRg73ST5P7QXtI9sZBcwq+4H2ewnvg/
X-Gm-Gg: AYBFou0LrO4ks9ab1+rv3/AjtAjs05fn3x0yaWG0MnoxdEp5Mv5e6Ju0eUwZKBXhLCe
	g7z7dgWnGvWsGkMxRSUZR5H0LJRNwVMconJf9Ou99d8zQf0dTYDy+WRev7K3NXWqlVF/uqAC+HO
	zSGhsKnuGeLYqAV4CJbpeHZBozYIpKgSsAPymC3YkMqGxZfnQg6U8t9bPrIRg2Bep8e+x95koUc
	UpgiWl1tbhPYTZA/qVigaHCAld5TuhbUP+gK1afhhT0ofmjKhjr4w3QrxM5gQB8PY9mawHZnJwW
	2p3+wc1FZqfA4YnKqWXtLnsmnakVSz7aLK1AJU2qM9oLgC74mp8A66SROO4fyS4fTuV1JO4c/7r
	fBgcO6l9Gy1UEW/Al5g12mEP/CrAgkVWtpfbDzCQjUYAUHxjshEb37ykVh3+OpgU/6sQLoo0zFK
	6DIoHkqKrJhBfT19YRwBPrD2tQpE/b7lU311+9SJlaR//pw2DRyf358RXGDZGmjS3IaNISlB0Mw
	AyqgaqZ48HqSwxm
X-Received: by 2002:a17:90a:10cf:b0:3ab:9c73:12e with SMTP id 98e67ed59e1d1-3ab9c7307d0mr8435721a91.6.1792049618841;
        Thu, 15 Oct 2026 00:33:38 -0700 (PDT)
Received: from localhost.localdomain ([183.250.189.231])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac94748c6csm3066274a91.10.2026.10.15.00.33.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 00:33:37 -0700 (PDT)
From: Yelin Fei <yelinfei66@gmail.com>
X-Google-Original-From: Yelin Fei <yelinfei@ruijie.com.cn>
To: linux-mtd@lists.infradead.org
Cc: richard@nod.at,
	chengzhihao1@huawei.com,
	miquel.raynal@bootlin.com,
	vigneshr@ti.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] mtd: ubi: fix direct reclaim deadlock with synchronous block devices
Date: Thu, 15 Oct 2026 15:33:19 +0800
Message-Id: <cover.1792046946.git.yelinfei@ruijie.com.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ye Linfei <yelinfei@ruijie.com.cn>

Two-part fix for ubiblock swap deadlock: forbid direct reclaim I/O in the synchronous dispatch path and switch the ltree entry allocation to GFP_NOIO.

Ye Linfei (2):
  mtd: ubi: block: forbid direct reclaim I/O during synchronous read
  mtd: ubi: use GFP_NOIO for lock tree entry allocation

 drivers/mtd/ubi/block.c | 15 +++++++++++++++
 drivers/mtd/ubi/eba.c   |  2 +-
 2 files changed, 16 insertions(+), 1 deletion(-)

-- 
2.25.1

