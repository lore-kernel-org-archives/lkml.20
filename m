Received: from mail-pj2-f39.google.com (mail-pj2-f39.google.com [74.125.227.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE7734F7CD4
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 16:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.167
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790960363; cv=none; b=DznkSZdlZHkmmpZ4zPgxyGTY7zNYo7Gmo5Jm2hmQTPLWtHw211P964lIdlzofnlEVL73CoUdu4xnr2ORpRm/Mn2caD7yHr9oMUGOO7fSQQ+5Ui6JAzHlclTUmFq3Y/X3vIOK242Sk1sMa/r+X5rvVEpVGzP6UWXCo00nHlrpW8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790960363; c=relaxed/simple;
	bh=32p8UUb1VYf7Pm89+rMdvvV0Z8gj2y0gc/4XkX9QnPY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=TIFwg5WDd2r69jHoWfEUnD3PibbHO1xyAtiu2Bc48KtEUFkFD8uCltSfQ5OV3q400TC62TnejAiPEmFAPP5GKQrK/aEYNp5BBWs0GIJEsrQcrKmgzmNaXnyOLKPgZDHBguK6q5wiCK8cFU7xiTjV+fF6/Lbz4EAQDRNCvokghCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=WZLnEqhJ; arc=none smtp.client-ip=74.125.227.167
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="WZLnEqhJ"
Received: by mail-pj2-f39.google.com with SMTP id 98e67ed59e1d1-3a4805e15cfso3095658a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 09:59:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1790960361; x=1791565161; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zQhpLMTibM/LrulRiWGxm1vI28JIxcKeJZdFQ1aTjNs=;
        b=WZLnEqhJzGfzY+JEnEEEgDCoHkX5WXpgoIXFLEPvoBKAQeZqfcRzfP1wNkHVRGqN1n
         A315bLQ9FFx5sl9tEn2X4mQs4wrob51S27fmC6Au7GJlCESGAHSwBT8x+OLFKLpQxPEd
         yU8XBaU8wkqqy0N6mJXg6b/zvpPK448BKQ8Dvx9BjPGV1NjHOXzfJSi7v4DaD+ab2Al5
         DWkUK+sZDoLRb+oahCnJSQMmWVeJxw6CGFxTtTsyn1XuMBxTmxwIjsHWF59ZN9YQufQU
         Jgen2zb1/fbdgnvk01N2sueo6IOqxN4jVnaBXL6XuDe6QZBeNvaqjUII2yLY8FWCGjvK
         ZPsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790960361; x=1791565161;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zQhpLMTibM/LrulRiWGxm1vI28JIxcKeJZdFQ1aTjNs=;
        b=V3Z64UDwEFgnBfxjCqm94vl8Wrm590UVk3TbEzyrcAysCujut/hSlACXFoGGACEsqv
         Ll8tKYkG3QoHRSpoY+owF0iOp092fLKfI09WPMr9k4/D1WqxFLIEx8TqKbUNCMlvJkWD
         ne5nGjXKfnxRHCDfWu7DzP5CMtl9ihU3Z9/Tvl7SPayAGW2zxl7Y+iZL7ETb6h1QuHbZ
         AXbMeMa/6T3sXgpjs/1ac9OzJM5vfFfBlszlO/0vkUYn9Nh+HLQsTy3pAY7G+B50HfHP
         gwg+xY46Q29QgGVhmN3t18OOeQETyPE6se+GqWUwkS03hBXS1KhHUtmlGYM9oVBrEAiw
         BRjw==
X-Gm-Message-State: AFq9FYIvWpgvMXo6tvhvyMov4/wpcGa4Bfz7PNxkepjadYAA6QE0hTe7
	ilbplF5QrxdieRt1Cw/sIOONDweeJgOTgUefurU7a0DmXvLGPxlTBvGiTDWWCTj65XA=
X-Gm-Gg: AYBFou2ivmj9tEN8nd+B4Jru9574OIOvFxYlcN5B5lGnadTB6nrTkUzisAHpSHkLY9N
	3lCYyVB/pu9vtuNqKa36kWc5z2CJwy/tuwX247uvj6PbFPJ+wPrnH7rlLeOwgvVTt0RNHQ/gxP9
	Y5U44jvLp13W8JuVH+r9QW43/XqJ97PmCI1qMfBdHbxe5IGreocHTWK1YggQYsEh0RdlTYF/kVX
	giG8K2QmPpbBkUpE/fV+yrA3Yot8v41RAgbcFLHZTdlUV2xL2lMqqqgdBQE6A/bXiuCRqzEKX6Q
	+OjdxjlIlcBtm41RlavNUvF9KFs3KrsLfJ/kzrRV6ZnTn6JudzudnyL5rmUqOKiBCpjFLLebtq3
	YMKQKFMgH/RneAO4B9Y1wezkI1mfXZ3t8hg4a/DcZge7H6jFR0doBbDnlbF0XSjUSXIboKsYlp2
	LckH5sTgqrGhoyXqcJZW8/HhYZ1IGi2yylYAmUxvhdKTU0PtzCefFB9ra8UJ2mUfDvq1YF987xF
	skJhuLRHPpMdlyb0qfAJ8INBhK0
X-Received: by 2002:a17:90b:3882:b0:3a4:c028:fd6e with SMTP id 98e67ed59e1d1-3a6ceaacd1bmr3230479a91.30.1790960360565;
        Fri, 02 Oct 2026 09:59:20 -0700 (PDT)
Received: from n37-012-226.byted.org ([115.190.40.12])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a6cd5d88bbsm4900871a91.12.2026.10.02.09.59.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 09:59:20 -0700 (PDT)
From: Qingwei Hu <qingwei.hu@bytedance.com>
To: linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Will Deacon <will@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Boqun Feng <boqun@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Gary Guo <gary@garyguo.net>,
	Andrea Parri <parri.andrea@gmail.com>,
	Guo Ren <guoren@kernel.org>,
	Xu Lu <luxu.kernel@bytedance.com>,
	Yunhui Cui <cuiyunhui@bytedance.com>,
	Qingwei Hu <qingwei.hu@bytedance.com>
Subject: [PATCH v5 0/5] riscv: Use Zalasr for acquire and release operations
Date: Sat,  3 Oct 2026 00:59:05 +0800
Message-Id: <20261002165910.3818940-1-qingwei.hu@bytedance.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Zalasr extension provides load-acquire and store-release
instructions. The base ISA parsing, hwprobe, instruction definitions,
and KVM support from v4 are already upstream. This series resubmits only
the acquire/release optimizations that were left out.

The v4 implementation could mix fence-based and aq/rl mappings. That
combination does not provide the RCsc ordering expected by Linux locking
primitives unless the fence-based side is strengthened. It also needs to
preserve the existing lowering on systems without Zalasr.

Strengthen the remaining fence-based fallbacks on Zalasr systems before
introducing annotated operations. Then use Zalasr for acquire loads,
release stores, xchg, cmpxchg, and generic atomic acquire/release
operations. Also use acquire loads in smp_cond_load_acquire() so the
satisfying load provides the required ordering.

Systems without Zalasr retain the existing lowering. Uniprocessor builds
keep their existing plain AMO sequences where no inter-CPU ordering is
required.

Changes in v5:
- Drop the base ISA, hwprobe, instruction definition, and KVM patches
  that are already upstream.
- Add a preparatory patch that strengthens fence-based fallbacks when
  they can be paired with Zalasr acquire or release operations.
- Select aq/rl annotations only when Zalasr is available and preserve
  the non-Zalasr lowering.
- Optimize smp_cond_load_acquire() with Zalasr acquire loads.
- Rework xchg, cmpxchg, and atomic operations around the current
  RISC-V atomic macros.

v4:
https://lore.kernel.org/r/20251020042056.30283-1-luxu.kernel@bytedance.com

---

Qingwei Hu (1):
  riscv: Strengthen fallback barriers with Zalasr

Xu Lu (3):
  riscv: Apply Zalasr to smp_load_acquire/smp_store_release
  riscv: Use Zalasr for xchg and cmpxchg ordering
  riscv: Use Zalasr for atomic acquire and release operations

Yunhui Cui (1):
  riscv: Optimize smp_cond_load_acquire() with Zalasr

 arch/riscv/include/asm/atomic.h  |  84 ++++++++++++++-
 arch/riscv/include/asm/barrier.h |  97 ++++++++++++++++-
 arch/riscv/include/asm/cmpxchg.h | 179 ++++++++++++++++++++-----------
 arch/riscv/include/asm/fence.h   |   9 ++
 4 files changed, 298 insertions(+), 71 deletions(-)


base-commit: 4982d3552a3bf94de503acf93433277d08421de6
-- 
2.39.5

