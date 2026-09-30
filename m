Received: from mail-wr2-f39.google.com (mail-wr2-f39.google.com [74.125.225.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D2FD4E73D8
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 13:21:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.103
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790774513; cv=none; b=a6zFcHve/0qq4L6pZOqG4si6cN8+w+oYG4KJ9ZQIyQHLdLIfPT/lBYOLrM6XI2yMU6XfQwiZDI6aN0PnNL80ZP4Dnq7wSjD9KRtKwWNAhir2oWeqB3X2pR2LjRxZ29ey+VrGAiIJqll/glXnM84vWoJ5IHSIo+rCNUG46lfPHL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790774513; c=relaxed/simple;
	bh=KF7dDOx7DaLCNyQNSsul75suel+43Q9ip6d+eR3BH5A=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=twQWmu6z0DvQpKtEpWvXuhnv1fkVjM7cbgjWY1qcmVmgphvJWubtnPjRSKL2xuJdYD4LYw6/SEDh5Olr4uSgvbh7K1wjv4nLTmVDU3vBQxoZaBAIJxMw53rRKxrVO3sE8xhm4QC8EobptEVBqC5L7S0E5TOqUz/S3d3BVzKJdZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fplhQ7qS; arc=none smtp.client-ip=74.125.225.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fplhQ7qS"
Received: by mail-wr2-f39.google.com with SMTP id ffacd0b85a97d-48af929e59dso1132803f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 06:21:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790774471; x=1791379271; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tGm+gMifQidcQlMxmJXtxnGy2ShpN9JxNJdyz7K8Aho=;
        b=fplhQ7qS3y/WREvjdvh6RXRkRgvXvOtCsOAJdGliy/q96tIMygouXNL24DOTuVX/RD
         WbFpOOzuxTnz/r2T7sKC4GDLCJR2SJn2xcBrie1wfijTj94dlxbFcG77S17im+QNnTFL
         gbJnqQNzokUkHi/etgwrVSMBDEo0hOrh/IG48vSzxaD5v8iM/l51yBFyyWUSV8na+Rn8
         yrZxgsyzRgsTQQiN10nj9ucLYzcf6Yesn/qq0wwu4fHe2avjVQTJ2ilxDUgCmtuwJPUD
         MbeLhWdWuhW7ttkYDOndOK6sdIeUtBoOARJILgDpXcrtAslNVUSGeb18zZbPUcJVWYPV
         Bgig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790774471; x=1791379271;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tGm+gMifQidcQlMxmJXtxnGy2ShpN9JxNJdyz7K8Aho=;
        b=VVi5mep/nFmwaMtCjboHs7Kboh3YAvtcPKOaf9ir7xc+LnIvO5KaKFlGdLTZMBViab
         jcScdHu0izPBR6YmvPsET9iHPphDYVelFeH/K8yZFU9ScetkyG9gYDnEW0CL9FjfekkI
         ivAd/f7A3uju2IOTpCK+IlEvdy2YtAR8C+NvhC1oNCtlGQJ8RONyxinUgQEFUrPatC3b
         R8Zl3RoU4u+jftb1iV3VSYqUpd0wTPOXTn0N6RQYcRpmzktbL9lAsG6E+z//NlpfP+xn
         uGCtoltJ7sULsJn19WzVruSfksdFfGbo6OfPtBdVhrz5u0OZ1heyM0jSDSuTi6CVW6PU
         G8Bg==
X-Forwarded-Encrypted: i=1; AKwUvByyCxQ067370owZ8yCRuNyMQFwV8/iZUXhu2ZEi8J66oSKFqjovXBPMlsWMNOFHmT4dHafPKb50SLl8nao=@vger.kernel.org
X-Gm-Message-State: AFq9FYJF76CdsM+27uWW64Na6MMTOYddLHlhRS8uEjq0el0WomHOgnv3
	HlLjPHWs7MsG9GseBNjZlDdbta2BKWan8uccaF1rlgjnxev1m/32QZrS
X-Gm-Gg: AYBFou1SwMiLmNdW4EwrfP6AoNWCQ57prM2rGcbHV/m3/RW4MbReHE4MU9Zf4BHMVqu
	KKuc6ciHI1v2C4EUG/78E3fSdyYMlXvlq69d69ebG5hYE8dkKnOMXMlBwO2gBPBgf8zx8MXHB11
	4WmOVeniT+0pel3JFGw0bZTFu+CONeamqc85KYX1CalEbRYiRBtC3lVksDsuWNm/SEh1WLQ2sB+
	xKJpOBkb5aSpUs22q6iwVOQSjzRP8wpQJcyMdaT9QfoNeNKfdKKZNIzB9HLcFNJ3Hi2BmX0DJgt
	mlynnQK40YE97wb8QNBj8NtXf+VqACq45Ng2j0EpFsTQfHrnNy50LG5oAdxJFXuafAjr1nOCpub
	LkvNPTAqW45UPLbMXuQgGe7nXdqyWqxFWUoWzTavVsPjQTz+G1xkEQ4zWPcFbNC5J+VtPy2aAxR
	W2B1SZacDXN8hfEhtl+yJJB0QJc1pW1skmvappqQnEYqBam+E6+GtdzZdDHXox1j7xzYWRAkthI
	uAV/TSedPTQ/WfqnLY2CQXeaETBcRLdULX0jG/0QcNUjryCWI4vApk=
X-Received: by 2002:a05:6000:2284:b0:488:8859:b0dc with SMTP id ffacd0b85a97d-48b02554433mr2945079f8f.56.1790774470878;
        Wed, 30 Sep 2026 06:21:10 -0700 (PDT)
Received: from snowdrop.snailnet.com (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b029bef64sm5047284f8f.10.2026.09.30.06.21.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 06:21:10 -0700 (PDT)
From: David Laight <david.laight.linux@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Petr Mladek <pmladek@suse.com>,
	Kees Cook <kees@kernel.org>,
	David Laight <david.laight.linux@gmail.com>,
	linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	bpf@vger.kernel.org,
	Jim Cromie <jim.cromie@gmail.com>,
	Lorenzo Stoakes <ljs@kernel.org>
Cc: Zhen Lei <thunder.leizhen@huawei.com>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Andrey Grodzovsky <andrey.grodzovsky@crowdstrike.com>,
	Steven Rostedt <rostedt@goodmis.org>
Subject: [PATCH next 0/2] kallsyms: optimise symbol search by name
Date: Wed, 30 Sep 2026 14:21:06 +0100
Message-Id: <20260930132109.260597-1-david.laight.linux@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Patch 1 is from Jim Crome, included so the patch series builds.
This is currently in mm-nonmm-unstable

Patch 2 Removes the linear scan from the 'search by name' binary bisect.
Data size unchanged for 'sane' kernels.

Seems to work (I'm running it on this system), but I haven't got any performance
numbers.

David Laight (1):
  kallsyms: Optimise symbol name search

Jim Cromie (1):
  kallsyms: Match compressed tokens on the fly during binary search

 kernel/kallsyms.c          | 171 ++++++++++++++++++++++++-------------
 kernel/kallsyms_internal.h |   4 +-
 scripts/Makefile           |   1 +
 scripts/kallsyms.c         |  50 ++++++-----
 4 files changed, 144 insertions(+), 82 deletions(-)

-- 
2.39.5

