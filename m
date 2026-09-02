Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57E333EC2D1
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 08:44:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788338685; cv=none; b=hHhRc5iL9abEA3gcw31VMAu/mX+/FQLhB0pL3izh+Yn+VGchzv1Wn6sf3ocA6nXByYLQlcmguUr4wehNwvEAxJbrZHzbFNX2FbhEI0GpaQ33uRpPf+qv8ReNG5hqefai494kJuys7aP07G/o62tXYmXxHUwC1Rzd6OuIZ3KY8T8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788338685; c=relaxed/simple;
	bh=pmBICbqDZ5ndY8g5s8sjBS+yRkZNsDVHROMv+bbKOrE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qXeV6iySRFX0YR7cime6oRxwZpaNV4QmXs/t8vYM+OvlfmUREm+Oz+0tiBtLYr1xyeIU8xtNePQ6fVYJp5RAaOePRV38efF636EBfLFUmBKP+HuJSkJINOBbzlWtoYNmKICByENm4IqT5yPeEkFJwQMg9jeiPePibbAQAUAMBPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kbn+V5ix; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kbn+V5ix"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-39927410578so1487467a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 01:44:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788338679; x=1788943479; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=s+QMrkcuBf0aVbydtE8xfe+6EmPlSZfZnXnx55x6XxQ=;
        b=kbn+V5ix1Eha2PBHMSajY5xoNQDt6Nb/DrJn/cUZE6rdMxY8Z4VZOxU/LsEUzGMiP9
         Fsl/G8lLrDnDBoCg6sG9D178TUp/pAoDGlnkSE46eeFVS6lpH5ncPCfaEEVYSIo9FbPL
         jjh3OOVUj+sLz0hgZAOjS5eNvYJ+ODkbLSM9AmMewQDgFYkYSYhxHre7dMAtd1LFMjNu
         R8vdztIExMWBAnktOtVcRKBcB01yXC/XCeHFqDt0ZTvSIDTTmPz/JW8aXn1/xhA2E5i0
         oXgMx8h8GLJ1x5+Y3H5TICh9mikKf1kmYKPUKNUGIqMwXaSf7/hckLfv2N4cEMAdbXcH
         eGSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788338679; x=1788943479;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s+QMrkcuBf0aVbydtE8xfe+6EmPlSZfZnXnx55x6XxQ=;
        b=cher4KuZbkoIZtOxZCamFXr6U2MU82JsyQ0UDvTJ3EObGVWe/E5R5srRFURKA88ndI
         lYoZMtdgkUk9GXU8SfNsJNuYIB5vfkudDcw8NU5tIFrubTugiR370uuaXj6VuUQF1GVw
         YXKuweQP1OBJo5xsMVyI/sR3tjIIXlMvk13KLpjJiTVOXtNF1e2XT98bzytZ4SImOUbl
         aaqYm81C6TnDZ6l/7BmVQZ0Lg/6ZTQoGqeGEVClKT+x/PeuVM1YrtuWwnXYqJwNNr/jl
         kGDDxS/IMl2+KNgXPL9ZTRy+vX7z4UHsyNzYffrxUqp5RflV5EqnW9mnRXnlOr438F7T
         5uHw==
X-Forwarded-Encrypted: i=1; AKwUvBwKn+yEQh3T+TBTUmi/6Oly9lnOnUguCziAJ+UBkOsd1bi4hRibfQqS7DM4JAAJHYsb4Ql3vonuKM0JIrk=@vger.kernel.org
X-Gm-Message-State: AFuF++kpP0LXLP/ouYzFZB68LPMt6eSNcF+jHMgGGOhKnzleoASpPRdo
	oF9SVmAv00IkPzExcAjrty42tmSAqoFNZ/V5cuxyMnVX27xuXlSMfBY6
X-Gm-Gg: AYBFou0z8w59MpoeCA0qtLQAjdkwNxt5sTj/CtfPHvbyFwd7l8tRQyYk+lqjhpPP7LF
	zaj1+3TvBMjRsAXEt4fZEi5y82Uiu0TGqQApQfg7KL2srH3KM51xOTa0IXptwP+VnIZgLWUuK2e
	kt4bE+N8uHmHnRnYLNfgB4Taa0M07UTMrvRiAecdM7pV1JLZkClW2N2YE/7YWN2K1ZqEcX8a+FW
	1Cvxgkx5K/bqaQnt+W1QehJmkIMJ9I7UpH1APHDuwrPpaTxsH1uWAPKeGfhHMCWBqfgOh0lk+M5
	utZ8olssMvFLg+VTxWtREJsdDFivKT/k/tpejYSbbBITGIBa0T4Ec3LRmDVDUwkbgQROYwv70O9
	6qqc5BS0tf7NcsUFAOIx8pu8yu+Dcr3uxQZ8bZF114OOKI/ud4+wdQndWR9MGeVyQGdIrMHcsMv
	l26l57dqyKXuOdt45EKo9NthbLrdEqMV4BuT9wOKGSZcM22ULLBCo83lihB9Sbfc092gQ+5p6Pq
	JPqIoKZT+lVRYs5stG1Ka9tKl4irg==
X-Received: by 2002:a17:90b:57eb:b0:393:19a3:4f1 with SMTP id 98e67ed59e1d1-39aedfcc06amr5130789a91.6.1788338678716;
        Wed, 02 Sep 2026 01:44:38 -0700 (PDT)
Received: from localhost.localdomain ([222.254.211.218])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39ae3c6f337sm4845289a91.16.2026.09.02.01.44.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 01:44:38 -0700 (PDT)
From: Nguyen Duc Thinh <ducthinh100812@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Weijie Yuan <wy@wyuan.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	workflows@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nguyen Duc Thinh <ducthinh100812@gmail.com>
Subject: [PATCH v2 0/5] Documentation: process: Clean up grammar, tone, 
Date: Wed,  2 Sep 2026 15:43:58 +0700
Message-ID: <20260902084430.17248-1-ducthinh100812@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series performs a thorough pass across several files 
in the Linux kernel process documentation directory. The primary focus
is to improve readability and maintain a professional tone throughout 
the guides for a global developer audience.

Core changes include:
- Expanding conversational contractions (e.g., "don't" to "do not").
- Rectifying minor punctuation oversights and grammatical typos.
- Standardizing terminology formatting to elevate professional voice.

Extra notes:
- I originally intended to send a 12-patch series to cover the whole
  directory, but decided to scale it back to these 5 high-quality
  patches to ensure thorough accuracy and a manageable review cycle.
  
  Also I want to know the current progress of the patch titled 
  "Capitalize Git, Quilt, and Mercurial consistently".

  And I would like to thank everyone for welcoming me to the community
  and I hope everyone can forgive me for my mistakes in the past, 
  present, and in the future.

v2:
  - Resending the complete 5-patch series together as a single cohesive 
    thread. (Apologies, the v1 submission suffered a terminal wildcard 
    argument error that accidentally truncated the transmission 
    after 1/5).

Nguyen Duc Thinh (5):
  Documentation: process: Clean up grammar, tone, and contractions in
    core files
  Documentation: process: Clean up grammar and tone in next guide files
  Documentation: process: Refine language, tone, and grammar in
    subsequent files
  Documentation: process: Refine language, tone, and grammar in
    subsequent files
  Documentation: process: Clean up grammar and tone across multiple
    files

 Documentation/process/1.Intro.rst             | 18 ++---
 Documentation/process/2.Process.rst           | 22 +++---
 Documentation/process/3.Early-stage.rst       | 14 ++--
 Documentation/process/4.Coding.rst            | 48 ++++++-------
 Documentation/process/5.Posting.rst           | 34 +++++-----
 Documentation/process/6.Followthrough.rst     | 16 ++---
 Documentation/process/7.AdvancedTopics.rst    | 32 ++++-----
 Documentation/process/8.Conclusion.rst        |  4 +-
 Documentation/process/applying-patches.rst    | 20 +++---
 Documentation/process/backporting.rst         | 68 +++++++++----------
 Documentation/process/botching-up-ioctls.rst  | 54 +++++++--------
 Documentation/process/changes.rst             | 20 +++---
 .../code-of-conduct-interpretation.rst        | 14 ++--
 Documentation/process/code-of-conduct.rst     |  2 +-
 Documentation/process/coding-assistants.rst   | 12 ++--
 Documentation/process/conclave.rst            |  6 +-
 .../process/contribution-maturity-model.rst   |  4 +-
 Documentation/process/cve.rst                 |  8 +--
 Documentation/process/deprecated.rst          | 14 ++--
 Documentation/process/development-process.rst |  6 +-
 Documentation/process/email-clients.rst       | 32 ++++-----
 21 files changed, 224 insertions(+), 224 deletions(-)

-- 
2.50.1 (Apple Git-155)

