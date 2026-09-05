Received: from mail-wm2-f0.google.com (mail-wm2-f0.google.com [74.125.225.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CD203126D6
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 14:02:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.128
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788616934; cv=none; b=R7G6qxRrR5UeK82usd99HYJtbCjNIT2Y6YCsWoAZsLf+ROYXEKa9O2WH0EZLjnRQX19KDKcA+GCg3MHwf72UPmQ4twpjqgeel+Pqj/VZbG2PvS4VFpjygirXXL+21DIbISNpPyqB13ECkw6n6avCfiraVrQTXu8QRUB3fH8C8uE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788616934; c=relaxed/simple;
	bh=dF5ZGt26/diq4/kwDFzaNX9JEmQ1CXSENfMcC86AWeE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VZgBYmGacqnGNj0CCjTzjKMtf10aElMeM12RH3Z4w/sYgmghORwPTSghPq5SKZygKfYuZYzAjfKw9adarz1xosio6o9EOvEPkIY/6+KdljH1vv2acgRbinVgVoD/DWNd4/fwW8Uhtzc3gN7kxXwaZPTWiRg4Biqo007DSo1aZ7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZvR/KWcy; arc=none smtp.client-ip=74.125.225.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZvR/KWcy"
Received: by mail-wm2-f0.google.com with SMTP id 5b1f17b1804b1-49ced856e8dso9173675e9.0
        for <linux-kernel@vger.kernel.org>; Sat, 05 Sep 2026 07:02:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788616918; x=1789221718; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nPpHNOPG2eF6hIZslIRv1KyfhI9ApkPtiUNXBEjR624=;
        b=ZvR/KWcysU0pmAWJMfnDTCDCXGQvSSoS0RrSBF43vYidpwHxciFMpqO9kAoPTbL32Q
         orQAFLEoz4lT5eUXi7w9h6jhxgnXCzW/ZHCILgJxEuXVbjGJrO2hND7bBWbWR1bwEeyj
         xiRPfTUcLbVXpMTwX/tBNXjkgTri99L5EOJ3KPTMip8vc/9cpe5nwS/L1N34uhRFQDZ1
         UQ8fuTk6vJrEgD4C0g2gONN3ZhA+00C0iS9D1+kmarPAyrCyHt9hZMBL7NKJ/N1lzoNm
         BsehETHsvXTAHdzsh6JCOLTG09/wV6x8O5b0UYG2B1qBugTcHy/C7Yug4Y9+1SIx6j5b
         eRbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788616918; x=1789221718;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nPpHNOPG2eF6hIZslIRv1KyfhI9ApkPtiUNXBEjR624=;
        b=LdEIuJBVzTTZu7qIrDrNZdvQC2P72oNTOn/DqcySaNS6FFSTC/yinQAEzMZcWID0xg
         t/qlTpL+1h8ym2NoE4SKkHfqHreLZrqigBCpSA01Y4iet4RnQ4z4P13ZurjQHh4sI0zy
         OIElwmjb9xdZgU4gMizQQ9MQC5T5mEMYQcPAxZ9SMB9Xe/iiDMpp8THOZ1NjXB4XJ/BB
         kg2qTL0yoxwgXMaCUcslxSJvBqeNNITaysCY7L39kv3cIZ5/aFD3IwpvXGYsH8B2FFXy
         F+Bv6MPPlyb2cyJEhJHcNncazmv00mcrl2ZQoGb8RgNvciKTKZrO0VxT5HGmcG4QVTeL
         dW9Q==
X-Forwarded-Encrypted: i=1; AKwUvBxKV0NcLr9fA/TwzSyhy0b7jJeGIzrotj9WA0rvUw+yekMUJ8NvIZRk+mLTIgg7EK2wH7M2zMKgGlgUJnM=@vger.kernel.org
X-Gm-Message-State: AFuF++nvdL8lPDf5gEHXwUcZvEz7CpU7pnjXnsakyoDUIPMAdmIeYk6x
	l8SWilEY35lSg7XSMerRYc/Y6CPlPRcn6z2GonZPvql6x2DQZ0z0p4Nh
X-Gm-Gg: AYBFou0IsvTkPkDKYjS9AiiWuyGagHfW3PE7Xxsfl5Vndy+GFP6EDoPQnpDmqxh8ik1
	Cyxz0Uf7KYICHnGJ+VZi6wcLQY9FPiOwyfG3KEk3gNIFR9zVQLk82HFfVDhOH6FpwZrSJi7r/G9
	nz1/4to5ERSNlze/SMs60sBCli0at5fKUpmXKXhHg4NxG4U7pmjyGihTvEmYdzYgySmIiGUwmWJ
	yc1XQ4WoKm9m2uaLKakeHG6Fdwf4n3arSxRMYUdKqaaFTKQaslj/R77Uy7vG8rfl/UpI/RnIfeZ
	Twj9jZTQPiXPJdXo4Lox2YISSm5ZmWNVamyTqLF67C6lU06FS/WoaOGNl3s9+27g1t1SFRn8l6x
	nrl7oShpkH5/Pxi7xPpLOayZ8EdOsV/tMOmyZAOM91NCTnok7GmitnQTa4mTVYnmLYapGh7KWTC
	uOgRe1HNYg3pt1hGyPpCQz2uVH6MnEM9KqmWig7tVI3eVwBOTB9zkCTREkJKeJJbBr4IaZS77vA
	/OMqEXElsyDab9XWr2oqG87asvJrxCOgCvvDA/S
X-Received: by 2002:a05:600c:8b6d:b0:499:a277:e8b5 with SMTP id 5b1f17b1804b1-49cf7fdd67emr233375335e9.3.1788616916740;
        Sat, 05 Sep 2026 07:01:56 -0700 (PDT)
Received: from outlook.com ([2a02:587:6022:4b00:84ac:4417:9f37:a496])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cf755c22esm149866765e9.0.2026.09.05.07.01.53
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 05 Sep 2026 07:01:55 -0700 (PDT)
From: Christos Skarlos <christosskarlos.kernel@gmail.com>
To: akpm@linux-foundation.org,
	david@kernel.org,
	muchun.song@linux.dev,
	osalvador@suse.de,
	ljs@kernel.org,
	hannes@cmpxchg.org
Cc: ziy@nvidia.com,
	baolin.wang@linux.alibaba.com,
	liam@infradead.org,
	nico.pache@linux.dev,
	ryan.roberts@arm.com,
	dev.jain@arm.com,
	baohua@kernel.org,
	lance.yang@linux.dev,
	usama.arif@linux.dev,
	kas@kernel.org,
	vbabka@kernel.org,
	jannh@google.com,
	pfalcato@suse.de,
	kasong@tencent.com,
	qi.zheng@linux.dev,
	shakeel.butt@linux.dev,
	axelrasmussen@google.com,
	yuanchu@google.com,
	weixugc@google.com,
	mhocko@kernel.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Christos Skarlos <christosskarlos.kernel@gmail.com>
Subject: [PATCH 0/3] mm: minor janitorial style cleanups
Date: Sat,  5 Sep 2026 17:01:36 +0300
Message-ID: <20260905140140.60792-1-christosskarlos.kernel@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series resolves various coding style issues flagged by checkpatch.pl 
across mmap.c, vmscan.c, and hugetlb.c. The changes include fixing spacing, adding 
missing blank lines, formatting block comments, and removing unnecessary braces.

 No functional changes are introduced.

Christos Skarlos (3):
  mm/mmap.c: fix various coding style warnings
  mm/vamscan: fix various coding style warnings and errors
  mm/hugetlb: fix various coding style warnings.

 mm/hugetlb.c | 17 +++++++++++------
 mm/mmap.c    | 19 ++++++++++++-------
 mm/vmscan.c  | 12 +++++++-----
 3 files changed, 30 insertions(+), 18 deletions(-)

-- 
2.55.0

