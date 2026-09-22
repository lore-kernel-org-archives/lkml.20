Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39CFD54146F
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 16:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790095083; cv=none; b=BHNhjoUoyN0kv5XeP4MmMrmVHcRkKjofYtSr3xCUcRkfJiY36gcbuEsXaybYSSeUGH6b+Xk/MCnP2xU48ZhJU8lWPLfNzQzT6TZpaNqD1jQ7/70Go/PHkhoJ/k9SAPLf4VvVoIsT/fc9O2QKrDsoFQy1lbL53uNJbX71rWKaukg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790095083; c=relaxed/simple;
	bh=u/5NBJ9c41St7uSuNDqGUFC2eOgMb+G9JYJcuiu41Bk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rjCWynmWGFMykZwIf3awfcn3qJOLj/mFIe/9TA4kW9XlcvZneQ48ooFBOvqnE2+UAfilp1iEwnx5s6n1evaJtDC+tmybDLhy29xew6hHDvcKwbr/umx5jCO/GouJ8yltY62TneMYORKbEgclYIZBtBxJqgE+BpEYI6Hb7SflYn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JIxdHPeC; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JIxdHPeC"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-485ac898fa4so137147f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 09:37:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790095075; x=1790699875; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QYNW4sRzccNeX2MRnDFj382Q5PRFEVE8j1IYHbolu3s=;
        b=JIxdHPeCOBxrdOWzjfG7STEzTrJEv4cZAKE2lw8LxkiZHvOpB7s8tg87ZnA4ETL0ra
         jBYFJ20i7NneFKFcTt42JQCSjna8jXR23GHNLbDDHCBNY+DOLuZwKNGExJScicuFcP4I
         QOV0GMcbAn5LJAUkYCulHjXKFNWBgEdYPZcpIVNSJJpa4eL1isYUCgKal/Swyd0TdvQS
         dpqjpEQYrfFr0Oh5idE1ZQJOnKwbTHp/4aUnO6ZCrX81LwwMbdjamFLsxls/hh0ye+c4
         x6Xz7QBK3JnJsyA+n1EtTqEAvxy8el4/gX0gJqbRjfi/Sbf1cNhwXVfq8d1OHFIE7DEj
         Pleg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790095075; x=1790699875;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QYNW4sRzccNeX2MRnDFj382Q5PRFEVE8j1IYHbolu3s=;
        b=hlN+ZCssxurE4oU8aJ9dCn9CKnQ4nHQ8ejMsIqtafkGwQJu2Zmga4wAq65hDzW7NaS
         DLpiJI9YGWeO0csSBpMJOQgvxwK4jYZUIny4lVDQuuo7jZ5jEVPSUvBoZtRj0xcCTLpb
         XyufVIzAZ3Lv0ieUEAbyftPG1nJMPuSup1pz7i9RpID9kDWZ7s/n2/5gvzMkEOlYDWID
         0Co/8JTeTapXM4LlC8pPaViJOtBIT4ukBiUKk5UhiV2oSUxDm5NmhHFTc/HMSfpXK3et
         GGdpoFFH1d5vXO1z1aOcorGN3U0tk17rg4TtjWNhaHiQUz5uHrOSM1sAhc3iXyvLcvFW
         wGsg==
X-Forwarded-Encrypted: i=1; AKwUvBw71jglYKAM2zlO/knS5X3kiLMcyKWiFCUvgbZN9WN6a8/zGRl2ZYuw61GtJqgV3C/USk3M/gBZ/5ESHGE=@vger.kernel.org
X-Gm-Message-State: AFuF++k6hlX4CK0BQLBS08vTQ0ZPQqv/fhvY51HpgyaM/HJCirHe+xhb
	3f6hbcyJUCelUTFCdnwYtRwixg2EJF5rLQV8hMOaOUKdpy03gLoVhOG+
X-Gm-Gg: AYBFou2zigJ+7nQ6po4z45YafSEZ10XkBj0x/jnz3YDbubdQE/jATsWQ3Gzq0hzLEir
	2+cvOslnE8gOCzFloK1sKC/afNr/fLM8KraKWVa6/HTrlH/NYykfu58oDpo+YWsXAip+Y9e6Ijt
	CTAuwhsjwiokjo7SBxiLC32lguW84aecTbbBF3Y69ZhzTXetuwl+cB261IMezPj7Kv/40T1X7l2
	uHqK9Y/PByW8UYr+D/KAA0bVjqGTehR8gZo5mUvPUzB1hwP2r5bPo68JpecbjCC8BfcY8saAghD
	I/WYPG69xHHb+/fbicLsoo+e7kNvt+q/KfDzkEfWi641D6wkMtByhvTdskE2D6txmuZBBPTtDRq
	2A13zoYBB8GVkJbArLOxDyjb4w+9xhSuwoNRy8mSNLU23Uuap2e/OFU1yDYuWw4B7z48Kc7U7Tp
	VJdLbXJ+YCJlvbUEo2zgdl9JllVHJVQNT1RMF9bpi76reioWfGMw07fJwnb/6YzD4MIGTfZa8gW
	DXabYQWazkEOy9LOQ8rhbbSa2KRshXLo9p6MNwTTWPxHEbHYdsLZ4Cidb8pO3M=
X-Received: by 2002:a05:6000:4a0e:b0:487:b53:65b2 with SMTP id ffacd0b85a97d-4886704a254mr309392f8f.6.1790095075001;
        Tue, 22 Sep 2026 09:37:55 -0700 (PDT)
Received: from nixos-office (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48862773ee0sm6162192f8f.6.2026.09.22.09.37.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 09:37:54 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
From: Julian Braha <julianbraha@gmail.com>
To: nathan@kernel.org,
	nsc@kernel.org
Cc: n.schier@fritz.com,
	grahamr@qti.qualcomm.com,
	rdunlap@infradead.org,
	nico@fluxnic.net,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Julian Braha <julianbraha@gmail.com>
Subject: [PATCH 0/2] kconfig: error on reverse range
Date: Tue, 22 Sep 2026 17:37:47 +0100
Message-ID: <20260922163749.2031594-1-julianbraha@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds more input validation to Kconfig, specifically checking
that ranges for numeric options are properly ordered. This check was
originally introduced as part of kconfirm [1], but there are no findings
for this across the tree, so the check can be added directly into Kconfig.

Patch 1/2 adds a prop_err() function to match the existing prop_warn(),
which is then used in patch 2/2 where the check is introduced.

[1] https://lore.kernel.org/all/20260904220559.GB2787252@ax162/
---
Julian Braha (2):
  kconfig: add prop_err function to simplify property error handling
  kconfig: error on reverse range

 scripts/kconfig/menu.c                        | 45 +++++++---
 .../tests/err_num_bounds/expected_stderr      | 20 ++---
 .../tests/err_num_mismatch/expected_stderr    |  8 +-
 .../err_num_non_numeric_ref/expected_stderr   | 32 +++----
 .../tests/err_num_reverse_range/Kconfig       | 90 +++++++++++++++++++
 .../tests/err_num_reverse_range/__init__.py   |  9 ++
 .../err_num_reverse_range/expected_stderr     |  7 ++
 7 files changed, 169 insertions(+), 42 deletions(-)
 create mode 100644 scripts/kconfig/tests/err_num_reverse_range/Kconfig
 create mode 100644 scripts/kconfig/tests/err_num_reverse_range/__init__.py
 create mode 100644 scripts/kconfig/tests/err_num_reverse_range/expected_stderr

-- 
2.55.0

