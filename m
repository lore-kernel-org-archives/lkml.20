Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7861427F93
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 14:54:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787842493; cv=none; b=WmaWJ5Q97IBkcMNpi+QsP+8HOwz2RscxA9h2yNPsS+5Jjis34RL7Rr1DWibDPQORcEeNIp5GXBV581PyE049ncbbvqt8nOBuvtHdixxb1keClyFR1g+g6y0+KKbI9Rr7k2hBFUiSawRK60FwglHGliYhtYs0oA9K6o6pn/RXgU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787842493; c=relaxed/simple;
	bh=hS8kZLzke/hWnngzBIU+zb54LbfdhiEhmPlegZFkQ+0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=I6b/fRHmDUeJ7JJp64ATGFjxk25xjimFqtSUbeHlcK8QDRMHFBcdJCohmA/bfM2xWsj4yA+KZ+kPf3V2aVOhkKmPGiZZJ67EjX3ho78onRoJf/vvBNivBWQwyXqeBJ+J68ioesr+A0DQ1w5scZILnDoISdAPj9fRzUX5VFwUX0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PzOG1SGD; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PzOG1SGD"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2d71a50caa9so19224625ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 07:54:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787842488; x=1788447288; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=E8woUSV97warbSE8lybgrVZFJY5N1nQOSji8VKScgrU=;
        b=PzOG1SGDeY9lvzYQXUJg4UnDzP67zjdkNyPcA2L2Oi6ffbWIMDXegqnMzO5MTEQ3+m
         FJIFezdUB1K/zA56IzzbPhTJOQ/ep+U3P38h2E/mYW5Hk/wUr77BDbFHIsJ5V3VeZWHq
         LiTvPeRhu/akPIpXDjsjoiHXbNGldpi2nuZv70OzzAeJXMve/huzWXRVDG+Bwsrxl4dU
         tEu94U3ipkJmJx6w/kYNlryrPsJlfD2GVwJQEWbjiXltoIxvRzkrZ1zuHOeJ+7xQ3Jol
         tCQVICH6ql5Uy1iyfFqh+KziTO5+wscaH3UppetZQ8JiOu5pIjZWO2B5Fg3Uj2KbyldM
         o09w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787842488; x=1788447288;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E8woUSV97warbSE8lybgrVZFJY5N1nQOSji8VKScgrU=;
        b=Kuz9pyLMsZCDj5qdSab9lH/iQAwZ0b6dxNAUD7GMwXjTCv55rNDIC+a3v2y4212ann
         3TupcUTRDV2MxngiXAo8eGvNDvrSgI6dIvpOCXR3VZgMFO5a7XJz/LmcF/VFvZSDVGwm
         M5vtx+pph8lz6WOnCNBa48JgxRiI59UTG9LhBK+TnqCARlZ84k4HcLOyWE1R9ubYCVmx
         4nKJwNHER0FGJaAXV5O9Su5/TOOOERBRys5cFi3sUhtnKgeZNlyyrt0gvPx/PZRJ0VtH
         yrTcfrXU7VO0AutBVfl1QGui5yHxuV47GLWDNYKXNcukw+vHWUM3Fz+qZ2xO4mKWOtxx
         UwSg==
X-Gm-Message-State: AFuF++mklBxNIrTU9GmIpNIxZYfsSxWaEt+hLCGQ/VOfNwddKi9FK0Zr
	EBAKdDJp4gHdIfbJziiyuoArEHXTDcTvjWM5SO2PKwSyeiUTZZcYcmbH
X-Gm-Gg: AR+sD108Mg3Xne8DMjNKuYT1qUQKDRGbtu61im9QasqffiGaMjj5NOI2maftlS2/gd0
	IDRbAy3zzXZ6e4Rh10m0HscVhAcgZOX2JJaGnisMHb+PTo9u0jBBV+zDGua+dGQuF64FfjXK75G
	KWjsrXC11N+IYPGED/PpvmKq999l86hBMrXqH+lWNTsC/51kornWIxbUJudijjkOApqk8YITz6s
	GEbVfKcx1d55IN8NpH1887GIO7qIT6wb0CJpiSLPxh5bF3vEe8c+hfgawQQlfCefRKojdPp4UpM
	N1U4Y/fzYwdwZ/AyTqfrKTl3bdhgUa34xCNZksLVAZP0LvPTMlWLIZ9KvUxWaHPAiPF1HIOgQZt
	FnDvPZq69uUeB78sk8kD+K/jzvgwfuyRbuzxabcD9yQ85S7LMq/zEFseSsNgL0m/xqgIswvFhfQ
	zI9Gm4QH6/RGN9zrXMoSrpg3xMdLA6DyHaiOXGB/sAbFOVQohM8tSp6lg=
X-Received: by 2002:a17:903:230d:b0:2d7:1e07:4859 with SMTP id d9443c01a7336-2d71e074bf5mr165600495ad.2.1787842488539;
        Thu, 27 Aug 2026 07:54:48 -0700 (PDT)
Received: from ubuntu.. ([110.9.142.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d704b9f555sm18725405ad.40.2026.08.27.07.54.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 07:54:47 -0700 (PDT)
From: Sang-Heon Jeon <ekffu200098@gmail.com>
To: Andreas Larsson <andreas@gaisler.com>,
	"David S. Miller" <davem@davemloft.net>
Cc: linux-kernel@vger.kernel.org,
	sparclinux@vger.kernel.org
Subject: [PATCH 0/2] sparc32: remove redundant memsets after memblock allocations
Date: Thu, 27 Aug 2026 23:54:32 +0900
Message-ID: <20260827145437.490605-1-ekffu200098@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

memblock_alloc() and memblock_alloc_or_panic() return zeroed memory,
so the memsets after the allocations are redundant.

Sang-Heon Jeon (2):
  sparc32: remove redundant memset in arch_mm_preinit()
  sparc32: remove redundant memset in srmmu_nocache_init()

 arch/sparc/mm/init_32.c | 1 -
 arch/sparc/mm/srmmu.c   | 1 -
 2 files changed, 2 deletions(-)

-- 
2.43.0

