Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F2D6375AC4
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 06:17:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791267426; cv=none; b=U6pYNslqO8/VIqmXrrZNQc82qgMagH9Mga89XB8TE/kNZcQb4jS6AslQmo2gZOUE8KdUXO46kDjoU6g2accNx3R9f3//9IcpGH+ob5HGxz+MIVmvv3gsTTgzqFZF5ueIhRD0hWkRnXZcKF1dz/OBhB3/U0iIfs2cyyABp1PkSug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791267426; c=relaxed/simple;
	bh=kxSqByyeQG8x8Q3nvxMnhN6h3epnkIv8HdewAakEGSg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=sMUicdYw+kXmcEncTLsPFA6YMDI+vl/Di+NfIk+Cw2EsxJhK6GiJnG9FT3pwVuUHH8qEHUr/dqenqBgVsWdmvz7r3AOKfDVaKZMOB4IEVDYSyBq2zVzp0rLWdvdCWTupQumO+SERA7fkBvLVVHUxQU7RIsqF7TUAXT59++6T5CA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OQgD8rGJ; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OQgD8rGJ"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-cc1d57602e8so92851a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 23:17:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791267424; x=1791872224; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3jlBcrEL7AxGWXF4qOYzXsJylUauI2sPDbkv+5OBUgw=;
        b=OQgD8rGJaBv+tdwY7tkCYuJDsbumeE1CQBWLMoIr1dMskaLks+209xKNGyoe75VKJY
         WYCREIO9cAeX4tEvlMmbMSi02cLzsfH+himdNYZWbjKYiJhR6GLs9z6s6ZwMx8Pr/F5S
         u8nMB+l48F0JR52Lt3k0r7TWgtGMNpbPBYUfTy7/cziSKUjY9xestBJAz8Od594fURw0
         3AmYmzeSKYbOGkqyshekNL8xhMxJYt9CTW3aL0SooV5aOgZDUJSTGnzpxrx8Mpnmxdq4
         5cyLa/3jjhpzrNbdhtxQZEpBvn1WvbAk9mpdGvaVOPlm+OiQ60gUlECEGbu00TrLJ3kQ
         MX7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791267424; x=1791872224;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3jlBcrEL7AxGWXF4qOYzXsJylUauI2sPDbkv+5OBUgw=;
        b=yyCUi/EOnzXLnO5fvqvOi1GpIWQSc391gyP4x/FlSkuGunI2U0+HTZjTtUy973SubH
         2LKH0VROMs37djPDH6ORHGxJFl4775uXt0tfN0riscwOROd3RKvjpURRU+eXRYQI4DbW
         YFg5AJHIzoB1WKVWIgIbhjveMV8dr14uui80KsMEshZsxtV8v2WxG+JnE7bIHG/RGWoM
         F9LcQVJM7ocrhruY5hmoqOS9VbPGUeMBLsNrAshYLyT+iS0qpKBvhepBLYfFzeQsMRhY
         3ihbntplY4jYYwmq/iTNbJKA9Y3mgIOlayAum4U879gc7C6djNq32YAOgw6E9i4qgcXL
         h8JQ==
X-Forwarded-Encrypted: i=1; AKwUvBxofgmt3FTYvu1tvPiHv5tHmKiishrOeSgf5oH8VPCqudoq9/r70eapyfdXQ1/w8gMc48bjyecbd7CZzGo=@vger.kernel.org
X-Gm-Message-State: AFq9FYJDeCucRaZLKQh34ii3ilLvRYBkGs3g9QmEZdSv6nQ+cz0Pralc
	Gkof4q+xqaEVGswQlYgPW5eAbtA4q7kZOKSNoJhWMyyK/bYRa+2u3be0
X-Gm-Gg: AYBFou1Gz93EV6APtRpM9gKkKmEIyoHD45MY0uBdFLW0p7bkj9YMSPl+Z2OsAs6tQoP
	N4nSSFlwwHfLjQdLsbiCnVDWKu17HHVY3XkHMZWGu/rVJ2h2h8IYMvmpFmTK5M5AHF62Nozs4pM
	1+6Nw5FiCYs7AuHwh+LBQXVrdQ9tvxlbyprlRYJRuyZqjLeYd5lmAfbHS5fu8hIDgC00xWcFJzK
	A11fuq3OsDuKu2b84wR94aK9+1UljUOEWSRS5U1Rs9S8At0Gz+ITRNa8db2l8LOt4p63+b0r1wY
	wrCFYGzK5a+mpTFTkdbcU+b4dgopYSVHAiOWuu7mROze+2Q7p/+Tm6SPFuhWaXm57mt/fAQMzkD
	oQY632sHcErxw/6d2mFiTiJ6fOqGWnNEnctP6iMBqG8fYyO6jh2Nis0eI8Gu6yCtwtqHf2jXoG/
	yt8pXpAW2JCNKOgMbUclOSfUleNDMtxT7llIMe7Wklq9aYYJ4vLkgOqCDtwM/k6Og4lQu3mSPJa
	jvhT74ZHHsCRkNA5ldmfdeQvQw/eQpfecMe2b6bL5sfA0gKtLDJOfxQhW6C5eVp4tQIEwNjItxW
	QEbSkPr/LK8DTmEp
X-Received: by 2002:a17:90b:4a47:b0:3a0:9640:8043 with SMTP id 98e67ed59e1d1-3a873517b39mr304141a91.15.1791267424571;
        Mon, 05 Oct 2026 23:17:04 -0700 (PDT)
Received: from AHUANG12-3ZHH9X.lenovo.com (61-221-208-111.hinet-ip.hinet.net. [61.221.208.111])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a8533aba95sm3662789a91.2.2026.10.05.23.17.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 23:17:03 -0700 (PDT)
From: "Adrian Huang (Lenovo)" <adrianhuang0701@gmail.com>
To: SJ Park <sj@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: damon@lists.linux.dev,
	linux-mm@kvack.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	ahuang12@lenovo.com,
	"Adrian Huang (Lenovo)" <adrianhuang0701@gmail.com>
Subject: [PATCH 0/3] Docs/admin-guide/mm/damon: Minor fixes
Date: Tue,  6 Oct 2026 14:15:46 +0800
Message-Id: <20261006061549.627-1-adrianhuang0701@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This small patch series fixes various typos, copy-paste mistakes, and an
incorrect command syntax in the DAMON documentation files.

Adrian Huang (Lenovo) (3):
  Docs/admin-guide/mm/damon: Fix various typos
  Docs/admin-guide/mm/damon/lru_sort: Fix copy-paste mistakes
  Docs/admin-guide/mm/damon/usage: Fix incorrect option syntax in perf
    example

 Documentation/admin-guide/mm/damon/lru_sort.rst | 6 +++---
 Documentation/admin-guide/mm/damon/reclaim.rst  | 4 ++--
 Documentation/admin-guide/mm/damon/start.rst    | 6 +++---
 Documentation/admin-guide/mm/damon/stat.rst     | 2 +-
 Documentation/admin-guide/mm/damon/usage.rst    | 2 +-
 5 files changed, 10 insertions(+), 10 deletions(-)

-- 
2.43.0

