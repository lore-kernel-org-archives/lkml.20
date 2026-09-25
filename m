Received: from mail-wr2-f42.google.com (mail-wr2-f42.google.com [74.125.225.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 983D34F55B4
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 20:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790369699; cv=none; b=h3wWtppBaMxfR+m0Q/egQudQ8bBND89kvOsRpEiPGWnH8qRgeMnqJRKWlCgCc7hXrIAjDoR6woTxEsP5M1IDxTkvvyv/OOl+yZFePrvrquoXJ8oJvbgRZNMsQgshy8YVso3zo3YHlUr/auBx7Gw3eRH8Tglqz4QiZPHP4lVew40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790369699; c=relaxed/simple;
	bh=OiejDtG9zLMOh2+zq3oT2ujqhwJM/kV3ns0Lm8hZGDk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=idbhoUxlMPiPKlNW71g22j5fLB4/w/HtiqKBMjkp63/LFrSOS+Bnu1xpUYYOg38t5pgstU5MI5XR8DKFc6WOtiJNu8dz++dFAgr08RjA4Gud3ZFMhDX+wxbFZgr2L+EgjDFFL5oDbENO2hcMKbQy6zNXEtHs+jz3ddQpuaCoYTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a0Sk1GO1; arc=none smtp.client-ip=74.125.225.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a0Sk1GO1"
Received: by mail-wr2-f42.google.com with SMTP id ffacd0b85a97d-4888598e4f9so165405f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 13:54:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790369693; x=1790974493; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jkJN4xCRSU+PqlIsdfJnZSqQwzMkeBYjwbAco/SlXBw=;
        b=a0Sk1GO1ATzp6FDawJAhfgcA/xYM5NQUQtOU+MngJALPaIjZvArBsgbt+lfdE2JfgI
         wA+rAS9L+Nbqwuf5FeusgRMIjgRWIEVovGNIQlirCx0tBI68lYMeHE+g05FeMaESktYO
         9yxiXbCbpl5kpySSgXLLjag+MZIrsxbyyIZiVycVPHDPmiXboIs/5IedvDPCfwZfpGbu
         Cd8TcPC2cgjsTqYNh0Y29GHF9LLZz7N72hioPsaTtsmm9Ol8ceRHlAiltWZQltxxPyz0
         2rOwAA7PotBouvBDupbZJ0taeaKoQtmbkbdFNadiwX0XPasQ9YVimclqP6cH19dwqeiW
         WS4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790369693; x=1790974493;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jkJN4xCRSU+PqlIsdfJnZSqQwzMkeBYjwbAco/SlXBw=;
        b=SKLzMchSOUeL0ZxbPQN2mu11gHbZ6UcJK4dFpgohx6EV5ZUxN09nwr3qztbfW/4B8j
         S2mAG8H0LaSSk3SPETZkZXvWoG48J6Aq2p/7PWqv98r3+liSLlfBJucFtUAH0awnFgzS
         SzLnM7fhIQw/41A+9dGmqn5bUAVOs3xDt5VtjcJLvLcPrRR0MjbsCpckQ05GonfjUEF6
         A5CzyjDvVCESAFlI1ycCkBGIpnJgTtyYEMfB3fDQMeNk103vt5aaUynJCQQE0lMO4qG9
         mBkQaj6jSLBsUt3DMwXHq96swzubKbxWzw8oEClf3cFWByNN1+XUNuTbu7YR5bRTJOnx
         EsZg==
X-Gm-Message-State: AFuF++mU9+iJBil9G3ZYqsp+HIwD/iPZOvif/EHeXbgi5+ECVjpO1WY+
	4FqiDf1PvKWn4ZCgadznzbTowMDNSStlLZsQ49GwSGldlzeFpGii0yZCwcsFEUQ/SPT1IQ==
X-Gm-Gg: AYBFou1S7DTAu0mYJAUKyH8jMb/pwp0sF/Sk1E+T71s1aTBqUDnzt2+LvXUQefKT92+
	XTjEJBTWXR+1p6ghtOQGNwVT/WnHVIBIyl9DX1i45c+6YpfmcPhuyotPrUQubtjqdZ/0SRt1o4b
	sxeKZ2nBCbHTvU3oKiTe8OYzrMswZofXQWsTfBL1vWc79o52VmlMEB2dS7UqyUwtuueyg039HPC
	UUAtlfxoYmsn0aNpg4MjuBBomy81PqHTZbm/BWvayi1n1eblBFOpxvQwOSSIdWucH+vGebXeIIk
	G0t7mRmsLgEC2FpBtO7xw8OJ9ZiiY+i4oQCXyg59e2n0ECneLs281d2J6+gVhZP/VWLRxzqmBk1
	zt6nKA8sx76Gy9yBRnLtQOsVnX6XlREVd2XsFYpAdwmU+S27JAYyT6dLJJeAtlgGMqx+MoAVykB
	gO5gv+fiIP6tq0hSub3Ij7RadNS1qLeBBzRu09gXovPDiPJ6xGvhofF5f9Negu5ypcv0k2r2OMq
	X7YA5vxc/Y1cf2l0Twrz6fCbIYdGBOYmKNNe0xZd3uquRKkOG5Bfi/AXYWfaNg40Ag0
X-Received: by 2002:a05:6000:2302:b0:487:27f9:835 with SMTP id ffacd0b85a97d-4887170d4f6mr13089116f8f.42.1790369692647;
        Fri, 25 Sep 2026 13:54:52 -0700 (PDT)
Received: from Raghu007.. (sgyl-44-b2-v4wan-174108-cust110.vm6.cable.virginm.net. [80.1.81.111])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a64ef3asm9790136f8f.30.2026.09.25.13.54.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 13:54:52 -0700 (PDT)
From: Palla Raghunath <raghunathpalla.0209@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: Shuah Khan <shuah@kernel.org>,
	Brigham Campbell <me@brighamcampbell.com>,
	linux-kernel-mentees@lists.linux.dev,
	raghunathpalla.0209@gmail.com,
	syzbot+442828bb356b10813a47@syzkaller.appspotmail.com,
	Andrew Morton <akpm@linux-foundation.org>,
	Uladzislau Rezki <urezki@gmail.com>,
	Baoquan He <baoquan.he@linux.dev>,
	linux-mm@kvack.org
Subject: [PATCH] mm/vmalloc: do not warn on -ENOMEM from va_clip() in pcpu_get_vm_areas()
Date: Fri, 25 Sep 2026 21:54:49 +0100
Message-Id: <20260925205450.21262-1-raghunathpalla.0209@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When pcpu_get_vm_areas() has to split a free vmap_area in the middle
(NE_FIT_TYPE), va_clip() needs an extra vmap_area object. It takes the
per-cpu ne_fit_preload_node if one is there, and otherwise falls back
to kmem_cache_alloc(GFP_NOWAIT), which may fail and return -ENOMEM.
pcpu_get_vm_areas() never preloads, and a single call can do more than
one such split: on a NUMA system it places one area per node group, so
the first split consumes the preloaded object and the next one depends
on the GFP_NOWAIT allocation.

That failure is expected and already handled: the recovery path returns
the areas clipped so far to the free tree, purges lazily freed areas and
retries. But the error is checked with WARN_ON_ONCE(), so a transient
allocation failure under memory pressure or fault injection triggers a
kernel warning, and a panic with panic_on_warn. syzbot hit this on a
two-node VM while creating a per-cpu BPF array map.

Keep the WARN_ON_ONCE() for errors other than -ENOMEM, which do indicate
a bug, and take the recovery path either way. This matches what commit
b9183788a2de ("mm/vmalloc: do not warn on -ENOMEM from va_alloc()") did
for the other va_clip() caller.

Fixes: 1b23ff80b399 ("mm/vmalloc: invoke classify_va_fit_type() in adjust_va_to_fit_type()")
Reported-by: syzbot+442828bb356b10813a47@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=442828bb356b10813a47
Signed-off-by: Palla Raghunath <raghunathpalla.0209@gmail.com>
---
 mm/vmalloc.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index bea9f76ed7e7..24c7d0a5472e 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -5107,9 +5107,14 @@ struct vm_struct **pcpu_get_vm_areas(const unsigned long *offsets,
 
 		ret = va_clip(&free_vmap_area_root,
 			&free_vmap_area_list, va, start, size);
-		if (WARN_ON_ONCE(unlikely(ret)))
-			/* It is a BUG(), but trigger recovery instead. */
+		if (unlikely(ret)) {
+			/*
+			 * -ENOMEM from the GFP_NOWAIT fallback is expected.
+			 * Anything else is a BUG(), but trigger recovery instead.
+			 */
+			WARN_ON_ONCE(ret != -ENOMEM);
 			goto recovery;
+		}
 
 		/* Allocated area. */
 		va = vas[area];
-- 
2.34.1

