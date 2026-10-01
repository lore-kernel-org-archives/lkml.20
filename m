Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACBC648382C
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 06:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790837874; cv=none; b=uZOxamPJhBSN/WWKTJvc1pa2uOYc2j9ijBNF0JtVpmNWSTX8+2IVugn6uXsSSH/5A0ufxfvzMEhSH0iwTjtUQK+iHIvLoBT1fLxfxPtJ4ejjb8bpboNU+llD178jUNa0CVg/tepiERTaLSTCNm1W8Opc68ozKuZeLl4lO8FCQzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790837874; c=relaxed/simple;
	bh=agRKSWSkJj7BFv/lJ1dRCVNIfmYIzPLP+8Hg8BkYKEE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bEDxOPToAfefC5X8F0GJ/JXaZ4ENoh5kImi1Jeo3YB8945wEpWfX4IH2owKZU+dP3za4CZoBF7ldYSArseoWbqu+xgYShkUHHvDDmvGHRzeIc9Vb6bJIvDvRtZDuaJeJBUA/SV8kZT2sndU35b2r8K79j3GTicTFd/QyQjDdfPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S5FPl09J; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S5FPl09J"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-396ccc09d65so3701278a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 23:57:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790837872; x=1791442672; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oLkVog5+7gE/hz07CtNRO13maX7LfX3q7W+IXftjb3o=;
        b=S5FPl09JjCJswmBUA1xyquXcMyvtM2ti8xPR1IGUJrgY4qBda7Jm7lQtqekRxrzGPk
         SXc3ThOb1ZzxE2O7YRBNJuAmT89HVJjt0uUj/4m32RBkN/pdomNQqrMkHjIbsrtEzw5Q
         3NYCgXLIZrMl58GiulWdmA3pUJLES68C1Jb0I92ku3c9bmYlP8+UTZokODeI6L9XzwcA
         h2yO0CQC10r7W/tHoPku+HrrWx6LeorDGAvIMY4Y3u0r6Qm91oNpIANAShbhz6P2sbFA
         IXCyxWThwq8CUpPbhY99MEwhiGlgl36nTskWhcZuxFGPyDlt3Vp4ND+NHUX56UkJDEuY
         EKdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790837872; x=1791442672;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oLkVog5+7gE/hz07CtNRO13maX7LfX3q7W+IXftjb3o=;
        b=1HnEuRNBZcID2HJpJP58DuQEqAtITfZ8uS/fSIzfggkWs53M1BiUk1DCX5bO6O6AFr
         7odZ4fpK4wCXlgo+BrgX3F6CVNHPsKANNtwjEHcpB05ykr2QHrgjrqBezm1TrGZtQKAU
         pc+nzv7w9mjkdKBvUEFKMJ8nQ1X7XxN0eFCdi8jOvobKRCGPf2W7RE5tlHeAkD5suebU
         /+0F2Dli6+xSSKlaldWDFWIKsWKFbiEArXQUovpufG5W6v7VsgdFjiJwwcewFQRT9AE6
         eIDzhfoxd+eadx46jAi4KkwGDyA3pPkdJiW/WjJMI3ilzM3d3CIxna8HZPmdoYSfMaxD
         ro3g==
X-Forwarded-Encrypted: i=1; AKwUvBzakRrqhqAow9h9pqsFA6uusJDDCdCErQgJfLtFxhxpsXh0x79J6/BkgVqbog/r4Bko/e7VwsCWHUZcIHo=@vger.kernel.org
X-Gm-Message-State: AFq9FYIQ291f0i/pT9ScBENxDMX/P5v0zQZqxTbCnWGRZCH4VarGZsXn
	Y1IByQKXD4fvKdzI24UrN3mmn01tiQlZhKCUsPOt1fsKD1ZbRAuf1Hmt
X-Gm-Gg: AYBFou0NRHWkB9JRGYax3QG1W4cliJD9bxNmfI/8cKj2XjeK78K9EUO3GmlWGpBOz+T
	4CEzzPQlbu302pqTfPasV+kRV9k9gHZZfXgCZPCDvSF2pvbtTCLctfjnIGuv9Ly5NkMQaBzkvRS
	BcT5xx9r75bZLq5JMgYMzgAEptT25ajzVt3C4jnZUXmZeaak4rH07rySKIKcMOnWRucXEax8RCU
	0BiN0l9zqu54ysd3DydH+rQObFh7auyliybsyiee6fXJlsrxR3lmMHb/twmXZgNiO70MSKWxoVD
	w9sYG1T5DkfN7P2UDDtP8r8r6ka6YqRucQpjGhWDv3NMVo/fQKpz2U45JGDFWFXPhHus+hL4vaT
	1171/PLxM4lQoW8wzvreuy1nzHEhqm6HWRnN1Y5ZQo2WHBRS/gJFhRJp4o5HnZyxIFDIdqb6FsZ
	eF74FSyd7bJop82v8f/yy/QOavDv0D/gJR7NVeejlg+S8o59UxZwKy6olG3RIss43mJgE4Xenm6
	/KiEVWf76fZUpDFCUU31WFmNWnl7AN0m0kgz29XTMPqcVzh
X-Received: by 2002:a17:90b:4cc4:b0:39e:27e:2f09 with SMTP id 98e67ed59e1d1-3a4d1032530mr3271581a91.8.1790837871916;
        Wed, 30 Sep 2026 23:57:51 -0700 (PDT)
Received: from localhost.localdomain (d173-183-236-7.abhsia.telus.net. [173.183.236.7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4f44d0a30sm2873138a91.16.2026.09.30.23.57.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 23:57:51 -0700 (PDT)
From: cacioandpepe <artem122novak@gmail.com>
To: ysato@users.sourceforge.jp,
	dalias@libc.org,
	glaubitz@physik.fu-berlin.de
Cc: linux-sh@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	cacioandpepe <artem122novak@gmail.com>
Subject: [PATCH 0/2] sh: add initial SH7305 CPU support
Date: Thu,  1 Oct 2026 00:57:34 -0600
Message-ID: <20261001065736.753215-1-artem122novak@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add initial SuperH support for the Renesas SH7305 processor.

The first patch fixes SH4 compiler flag fallback handling for toolchains
which support SH4A targets but do not provide the plain -m4-nofpu
option.

The second patch adds the SH7305 CPU subtype, processor name and CPU
probe.

This is the first small architecture level part of ongoing SH7305
enablement. Platform specific clock, interrupt controller, timer and
board support are intentionally left for separate patches.

The SH7305 support has been compile tested with GCC 14.3.0 targeting
big endian SH4A.

cacioandpepe (2):
  sh: guard SH4 no-FPU compiler fallback
  sh: add SH7305 CPU subtype support

 arch/sh/Kconfig                 | 9 +++++++++
 arch/sh/Makefile                | 2 +-
 arch/sh/include/asm/processor.h | 2 +-
 arch/sh/kernel/cpu/proc.c       | 3 ++-
 arch/sh/kernel/cpu/sh4/probe.c  | 3 +++
 5 files changed, 16 insertions(+), 3 deletions(-)

-- 
2.55.0

