Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6245A3370EA
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 08:35:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788338152; cv=none; b=Ss6Ia6ZEXGF7L8NtleEU/EmMrV7WprD9xwrweuHpFycIvZSgiProfzmXLgEj36R7hA/26M3quJXDM00I7T30cfnZNQyPfoAwETYj4UgeWX1OhMs7TDZd7UEGCk8zUcB1DwUCVqGTvrWT2puMx+5Dk+l31KGKgI1mdL4Td0qA+R4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788338152; c=relaxed/simple;
	bh=cUyU1xZiJ0lyFGAbiURDU4c+zI0gtGyVdTmVuLB5xTA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VbEEqJyBXO8xjuM+DR/d4iAUhfrEIj0T/eGrT3pZp1niJ5Dunm/A6yqzMEYUQl9e21LieDbP+sn1O+1UTDJ00AU38ip6ahaCACVapx5lGP4JiOwGRbuWcoV4kX16XRidpZW+LkyaSDNb8lz2XalKzYZl4EPIjM/UtkSx6sUgBLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UuAG+HEi; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UuAG+HEi"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3964dfb5b9aso973612a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 01:35:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788338151; x=1788942951; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7gfmhiuO6IGjOBYoQD0jOEFYQeE/ZkYP8CJmLAFzuAc=;
        b=UuAG+HEic/O1XGewbmK9wcZ+Mv2oPEN9ibEvPB3A+dCUkiDVfipeDc+LI3zWyGE/pm
         h0CO85tfbA9ULm1FfyvNElbIV1WGyBnVoA3Sd5UtAtJ4J2xW1rN8BUd6NT5bHetiijLy
         m+jJtkBIyejTenYG06IezThYcHllQ5RINyybt35bs1Ftmn6MRdFANNu/0KVZox9jmHhE
         D7FLxIpt2hh0RSes7e7pjT73MGZ7o/p31fQSSYC3m326yX97ZvWHURyUoM9Mf2mNM7bZ
         pikperU71uFti9zhtxmFqG5UPkTfagxYUE2goVQQkzPcHQTz5SNvdy1d+iMcr5JJYzz7
         HzTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788338151; x=1788942951;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7gfmhiuO6IGjOBYoQD0jOEFYQeE/ZkYP8CJmLAFzuAc=;
        b=KnFhm2RNbLUz2sjTbHP/2m9urXmQ1C4thPRKFHTbWZSRbkuJWJ1YAaVgtrWvkcqMgz
         xPDad3OcDS2wz5wEqing4KFYQxHGrr5zJ2/R3ez5ftpdArCqxEw47W5k89e7ASsSHSSl
         +nz/3CW12E92rfBjmw3NTkq0dGPELX2WKCD8mRdLRK/TrotgORse0i0xn143KtnUNXc+
         94sd5Lmwl/SPVXHfvM1c6vrZdIQFdIOWughu21VHkdtmQZEcg//51N1xuq5FSbKDyFW4
         gQ6JwgPV8xYoBh0cSWhFGvGG1IksPY23/TESnLa0VUJWGlIm0nCx2aJqfL/1/GrVWEbA
         zkgA==
X-Forwarded-Encrypted: i=1; AKwUvBz3IcDCwIV4B8iD155ZHrVBNTMMQ09ecWUE14KJGdHI6vqiHtTn0Klpc095Tx3zvtlWCOU6jyvbWJdOW4c=@vger.kernel.org
X-Gm-Message-State: AFuF++kZZr64+UJXebLvbhuDQ8ekkf77XSDGgJWf+wKgeGwf0Rogy/Iz
	yBS3QzBf//rv6PyULlrU7g2UxY1E3hwoRU2gvk4gcULkEHllHSrMDImj
X-Gm-Gg: AYBFou2m+PqhZ6Sh3U0GMn3VVnnhz27qPdz4SJaOOuH33mzd6h/rvnfAzBqREtt9yxg
	Ugb/yzoJDo5nP7KNL7viUPjZfxbKDKkFG8gDwqBw2YcmL3KAfw9uaOLJxF+uUReJ4FasTbC+V6K
	ffmIOE+P8yyWDKb2QEhT60mOCUvrGa5Vd9BnnTsag8yoqtse5oCapz2OzVZgFWxGoSy+s+1DWRv
	E0DP/IsJm+1CNAwdpYbfdifnrEYkKjWc9S9lPzu2Jmkzq6+41VqHoti0tlD08hpu/ySN3NpgMLc
	VF1dTEvi3yEZzAINj9Dn0PkYrvNj1n4ZZedzxwU3fNd5pXSOkJMXCKWrw2lyV8L6JfIXV3OHP3H
	RptrLfIgX60Sxw9YzQZ4SOc6eah1SYa4LOdtWHwRa0R6MLLKh8xafv68Yof297hqqf108VMmcqi
	F7KR6C4HaQGYtwmuULInjk4kWxXNtXEBfMnJ05IeAL8SZS2deUQniXPiuqPido4vad+KG3Upv1r
	EJrBMJMFjxztyYLPKM=
X-Received: by 2002:a17:90b:3b52:b0:396:d28e:bd8 with SMTP id 98e67ed59e1d1-39aedf61001mr4041158a91.3.1788338150515;
        Wed, 02 Sep 2026 01:35:50 -0700 (PDT)
Received: from localhost.localdomain ([222.254.211.218])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3990d7ba9d5sm11384800a91.13.2026.09.02.01.35.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 01:35:50 -0700 (PDT)
From: Nguyen Duc Thinh <ducthinh100812@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Weijie Yuan <wy@wyuan.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	workflows@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nguyen Duc Thinh <ducthinh100812@gmail.com>
Subject: [PATCH 0/5] Documentation: process: Clean up grammar, tone, 
Date: Wed,  2 Sep 2026 15:35:40 +0700
Message-ID: <20260902083541.15555-1-ducthinh100812@gmail.com>
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

