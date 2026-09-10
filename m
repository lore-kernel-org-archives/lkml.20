Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E4C952941F
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 16:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789059173; cv=none; b=f3MAgkJ6P8YU1CmLhTfPrw56sFl6j/NPYPyoPzH3ONY/ibRxLOhL72xGEiSmP9FIOsuSNTNmF7ou4fuPv0CM6TiIMbeuiPskCyzEazGVhTp9GEhmpj+celllW2iysO1gLGfxYXkpcWPG+2GtSCVKy0SvMaSjNgfpIeduxHXhMhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789059173; c=relaxed/simple;
	bh=8VTeG0Ho6cFvSJNkf54wBCx4DhvWxyo9Ru1l0bh5feY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=plfW9eRjbb6xSp7AyY2+Su3RLrPL5sgXv/9gStdSTuOeiPZQvqFjTVQW0qH6SzSEHWvUL1o8SA3hm4ENszyat8iagyxdRJYT8Wud2sx0E/OywryNyS/2DPmYGupGOLP2waaFUMnTxiJulcws9DknEJt/ZZ7WXoAHW8cXW80o+BE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mXzLLnmu; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mXzLLnmu"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-39b31b4281eso1687455a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 09:52:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789059159; x=1789663959; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/Zk4iEyi9QGGhchmtmeLL8zDpDHB/77Pq2fO+dXFevo=;
        b=mXzLLnmuYTaBg1Y2hU19ydNb0Rp1r7hl+NGT37OHWoYNfsR4XyEJFodvJU7isiEPzn
         oLsGnaXZ2gn8h619aIMVULGVlQr9n/bkxrdYXJOxXnhHLBXgao+1msaajKieCeirLLjD
         KgwEqQ5qPE1uL2ee4LGjrsU7cSAKzjADMBWRMGHXIa9I40VGF3o6Ro6hBHwtAoPnsrpQ
         qRrqguZnlzMzRYZ1E3GT5ejFRGTZwTQyjAP9iBjJ47VwR/IjcJRRnKuVXz/iElyj3/4u
         9teUAEMkG7KvuNMpRkfGsq/zihZrkAuTi6zxfnUriH9hUZAeBxcwDc4KmYsSTnsqI/FI
         ssQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789059159; x=1789663959;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/Zk4iEyi9QGGhchmtmeLL8zDpDHB/77Pq2fO+dXFevo=;
        b=Ik+IlFD2ZrR5O2zyqLgnLgByQ/VclOfV7yC0iWAuQKGIbSwI9Y3JNASx/zab3Rtunw
         CgtHVP9Ufeh8tnnfsZDx6JDwyXsv0yx0YbpgqcG5nkF4vg3M9StmrmOhADHUzqcdm1Zp
         sxRX8Jwt2vRJzCdNjWmyCu6Ol0utZRWQDm7xHJXO2bhbsxGul6F+SaK7gqYdhKwpavQC
         6fh4bEaM3HLIhAs/Zdm6aITZhnxf24izD6YWcS4sltPr1VMlbj1Ah0JIT+CDDzI7eljP
         DNGjQc8baPwN8I4bahWF955965V9bzzQ7gEP6HTzaAyKrxRglCTybcNx+kb27mFWnAPi
         ofHg==
X-Forwarded-Encrypted: i=1; AKwUvBwg/izNQ6mPVBdT/fMpRbGjY6f1tr/cFQUatHhF5+Ez7iicglB/fU3+vggSYHYKa0McxHAtCHlLJ1AYq3c=@vger.kernel.org
X-Gm-Message-State: AFuF++lB7D4WvO/Q8aK9+ORiiE0WVEa5Tw0s8LDIs+gWd1cqZwjAqOi9
	q8sKDEKVuXWLExgIshagGdSOd1uER638xui9AAIpGjshrgL1dv8bw4eT
X-Gm-Gg: AYBFou3Io7N2z7DghYVi4ZiukRfijhnu7RCqfN7Axn1tfA1dFbfoxRq/4XkOU2xCKyl
	9c3vDB0xSWqjOZNgQUsp1cUFJeV3AMF9Oo8dMkqXHmvAOikoT4+xQ1FnCLb034FeOOa5EewpdkY
	akKWUTGTxix39xxVP8aCfY2pezD4REWqHFEUvF7ivvGLcnhVT4TiQ0j1c69O3H5Tl0/NE4q8Vk5
	FGRyrD0WRTTmsc86kx46rIz6nANGa+4OpitBt9/+LUZB1oCsNmDoYMzneoBOzH/CdSXBXuNLbEN
	gfkmYgSV5gI3yJrcC+QE/yCl45tR/GaqYB9DuBTDbCvWNZkv4pBzh1tRXGBuLsDkYYVoir+qZkF
	6ipS+1xZvbkD+Ofu8XouaPe28yyE2XNQaYyf+48X/XX/phtbe2NavRp7GfE7UrBiYF+vKqnwFzK
	9Kechhz4QfuynZX/rbVHwQrelJQ7rUr28W7aSv/038Y5qMWJbCegr8NWqXsEbJVEJKKrDa1PEUD
	H5vQdxW6q2lyVmxztaC6aDmNnu2jse21Ddqn1MR+MlGbItx5VSj/mcDN9GW6WvIulrCq1CcA/xR
X-Received: by 2002:a17:90b:5292:b0:398:e969:87ef with SMTP id 98e67ed59e1d1-39d70b7d864mr11936280a91.24.1789059159298;
        Thu, 10 Sep 2026 09:52:39 -0700 (PDT)
Received: from visitorckw-work01.c.googlers.com.com (202.176.229.35.bc.googleusercontent.com. [35.229.176.202])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d98e602d8sm64821a91.3.2026.09.10.09.52.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 09:52:38 -0700 (PDT)
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: song@kernel.org,
	ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	eddyz87@gmail.com,
	memxor@gmail.com,
	kpsingh@kernel.org,
	matt@bobrowski.net,
	rostedt@goodmis.org,
	mhiramat@kernel.org,
	akpm@linux-foundation.org
Cc: jolsa@kernel.org,
	ihor.solodrai@linux.dev,
	martin.lau@linux.dev,
	yonghong.song@linux.dev,
	emil@etsalapatis.com,
	mathieu.desnoyers@efficios.com,
	hch@infradead.org,
	jserv@ccns.ncku.edu.tw,
	eleanor15x@gmail.com,
	marscheng@google.com,
	linux-kernel@vger.kernel.org,
	bpf@vger.kernel.org,
	Kuan-Wei Chiu <visitorckw@gmail.com>
Subject: [PATCH v2 0/2] lib/sort: Clean up sort_nonatomic() and sort_r_nonatomic()
Date: Thu, 10 Sep 2026 16:52:19 +0000
Message-ID: <20260910165222.1186628-1-visitorckw@gmail.com>
X-Mailer: git-send-email 2.55.0.1003.g10538fe699-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

kernel/trace/bpf_trace.c is the sole remaining user of
sort_r_nonatomic(). Switch check_dup_ids() to sort_r() to match
bpf_kprobe_multi_link_attach() in the same file, which has safely
used sort_r() under the same limit (1U << 20) for 4 years.

With no users left in the tree, remove the unused sort_nonatomic() and
sort_r_nonatomic() APIs. This drops the __sort_r() wrapper and
eliminates the may_schedule branch and cond_resched() from the inner
sorting loop.
---
Changes in v2:
- Drop the already accepted arm-smmu-v3 patch.
- Convert bpf_trace.c to sort_r() instead.

Kuan-Wei Chiu (2):
  bpf: Replace sort_r_nonatomic() with sort_r() in check_dup_ids()
  Revert "lib/sort.c: add _nonatomic() variants with cond_resched()"

 include/linux/sort.h     |  11 ----
 kernel/trace/bpf_trace.c |   2 +-
 lib/sort.c               | 110 +++++++++++----------------------------
 3 files changed, 32 insertions(+), 91 deletions(-)

-- 
2.55.0.1003.g10538fe699-goog

