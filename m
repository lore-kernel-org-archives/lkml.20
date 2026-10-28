Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793147836;
	b=rCAOf6U68Kh8oE6fb6S0xcRBjObwn8UKI1oJx/GRoYMiZEO4Kx04yKNU3hKb9e2H2BM7
	 DyyHpWqTEtTY27/azn8+DIwrwLFqYh0laL7Bkm2onIJjL71cMITjnJpAvmvwg8TGkCQVa
	 cLAK1V+qlF+O8S+Z65X/uq7/wZ/jNQIibh/QnZEar2yMtGIpEKB9IYaawA4tpazCGVGn2
	 BW0JcJvQnSbX7R4K/FgO4dmffn40zrnn6s0eVkGjzsV9B1iPMlCdfYvzbYwuIr2tkV8MO
	 rkYtQlEiiuLWIOlLa1R5c88kw2DtTk5KWoJern36p+CQfRg+kg1X5eB1v/B3GOL7HPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793147836;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=D/Xa2X53HE4vdjRlhTL2AO4qrnufTWHC4hw+mkVd/lo=;
	b=ghdBEl5LLhpVqIrQBexzp36mLSXV/xuOZkbJL/o3735eyuhBD50tjDyZNW3Q+JPuL6T4
	 IACquZxb2iRmYeIHCB7DpY7mzGKRqU4/XcPEIferMLp2iR2tybKTnOc1Fi0NzjjX9+GVB
	 4YCYDwVrzz2AWf59BuGRCwGrmgkskOr4UfbQtD/RQy/FTNFvL2fhmDtI3nxSw9biRn1on
	 f8RFIFWe2QBZjpKAANX/DIO/DTv55FJIHcLcU1nbAr0UrrL8yyJmvbyp9sWxKXg2pTk1Z
	 ryK6/pBsBUXlUFC5E/wYXytL7Jv7OcbjapahtH/omBqbLTtbiKoJ3Z/+p8ElawgTRrg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=purestorage.com;
	spf=pass smtp.mailfrom=purestorage.com;
	dkim=pass header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=IXD3G9by;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37762606A32F
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 00:37:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 37762606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=IXD3G9by
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a20a37703bso3103545e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 17:37:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1793147833; x=1793752633; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=D/Xa2X53HE4vdjRlhTL2AO4qrnufTWHC4hw+mkVd/lo=;
        b=IXD3G9byXXcJsFXOmJ/1SRjCaNlwVG2N3Oh7DZzwP+Ams3mCJShobln4oKxz3bX5BI
         CxE5H4gtaYRCqmxqXD/P/jzOJkIR7UoTWkQKkS84nohXBumOpvz8HueMLdpqVvmhVJQv
         wf0l/SipxykQLolHfMY+ZzXBe3YLkZShPaThK23zSLpc/MRaoEj8w8L568cdksIFiBZm
         5ekAiZyeZ3k4cJIN8EoO46u8v/UfXetXD2psVW5BwiYLuG+s8ThbOjRPNCyWSj83VywQ
         yxzaxGQrYZHkeiOH85VEt6bF8Ym7x5egxnRuqnBCiqQAp13PkupJwCbg6UQA3uWxeuoz
         hmug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793147833; x=1793752633;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D/Xa2X53HE4vdjRlhTL2AO4qrnufTWHC4hw+mkVd/lo=;
        b=1GYUTOJUlrEkSpK++ONN3de3pdJTassbVb/fs9iyCmGE5mTppffNmZBEp49fIeqAAb
         VN0CliDhrvUNDcAPYhMxFWi80WLdN/Hp8xXyewbekIi0/Ef+VdwGtalXTHqA7ZoGDEGg
         cHssox8u02TXjzu1dnHtQd/k0wz3EG9lmEgZkWsSMbyKqiDK0+Nv70aTvZyJFoPkc2gp
         cM+86o4coxu7+bg4/+/Yn0Nn1FfZFMVK60Dk1RRzME74rmt7i+LIgNVuxdn+UX9XIf8u
         lQlhWaalFbhWtzywZu9ZlYNnkIA/ZRfWLI4jT22meZj8n5ZZZsY5ZsehqtCSCpOrhS1n
         LxMw==
X-Forwarded-Encrypted: i=1; AKwUvBw7odHW5b2DdD7Pbcl9vYbSw6RcQSfTOc5GvC5OHYfI99nOdNEex9OhHuOZclqfx9HrJ0D4BIE4BkfAfiM=@vger.kernel.org
X-Gm-Message-State: AFq9FYKsRdeAbCMHOEZYgi9Ucz+K2jUBLuxed2Bk84qXhRDWHF3/uq2H
	8LLNLO+jxkRdxzsC9Q+HPcd8iAtzHL/sHBPmwAHj7RKdf6sWtM2AKama97ElhDHMtGc=
X-Gm-Gg: AYBFou10QHGQ3w8sxnE4LfuXxBimM/Pzfv7tp/YyIo9LTKZGDymC/gtt1b3CQqHMaS/
	qsudsTiis6w/UqwqZcGgsVUivJlL5B6ogky1bI91P9w0EZSDBkrp7+DyWkye5FSNH5AEDB32lW6
	xDGvp6lUAY1rHuQOnbUWC5LlGayf0TJiJVYk2tG9Ghbnb7PibTVApV3kWg/YYRPlO9EB7iD4JlY
	lShntYPkepdWofGM+5OSIdDwxKhaupRPawn7pQBfbT0T624RQk9GNDok8ngezAI0VZQAomxL0Hf
	0gvp/kNkBkHmA8wITDkvC/KfGwsFojpc+LYBKt+/MNjtdW4EwzxWuRzbi88CPr2L9Fxy1MTkJ3D
	l2aAUVKgBVC9Qko9fyk2p4aoM5YuYXmBHk0EmSXeWrBqBvjKt3uIOHkhPYq3BETAYoSMLLM2ZCa
	azjmDAkBDtqpPoETjbZnz5SciZirt5cjx54yEIvoreEvpmIqyXD3T9tEwkw7k9nEo8zRXSTRLGW
	FqszxFtnCBgNsvcArUczpcwd0NtE2XxzvvQblNvHjFrZmUg/sHbKk/I+6A4leMBS/vcGrTY7uZU
	4fm1BGXtgSe+uX52hL+c7U8Wy0UE64GCFzXhSlaMHVtdWG5l8a55Y5De82IrmP7oA6PCeKNi/T/
	Hdi3mFvYNY9c=
X-Received: by 2002:a05:600c:a30a:b0:4a3:12fb:1ef1 with SMTP id 5b1f17b1804b1-4a967202046mr9005925e9.29.1793147833498;
        Tue, 27 Oct 2026 17:37:13 -0700 (PDT)
Received: from irdv-jinli.dev.purestorage.com ([208.88.158.128])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4a976010d2csm8395245e9.2.2026.10.27.17.37.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 17:37:12 -0700 (PDT)
From: Jingyi Li <jinli@purestorage.com>
To: vkoul@kernel.org,
	vinicius.gomes@intel.com
Cc: dave.jiang@intel.com,
	xueshuai@linux.alibaba.com,
	fenghuay@nvidia.com,
	Frank.Li@kernel.org,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] dmaengine: idxd: fix crashes in the probe error path
Date: Wed, 28 Oct 2026 00:37:05 +0000
Message-ID: <20261028003708.834341-1-jinli@purestorage.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When idxd_probe() fails, the cleanup in idxd_pci_probe_alloc() runs into
two bugs:

 1. idxd_free() frees opcap_bmap, the IDA id and idxd after put_device()
    has already freed them via idxd_conf_device_release() (double free).

 2. idxd_conf_device_release() calls destroy_workqueue() on a NULL
    workqueue when probe fails before idxd_setup_internals(), and on an
    already destroyed one after idxd_cleanup_internals() or the err_evl
    path of idxd_setup_internals().

We hit both in a kdump crash kernel, where the DSA device fails to reset
and reports HALTED. Depending on the kernel version, the crash kernel
either oopses in destroy_workqueue() (2) or corrupts the slab (1), and
no dump is saved.

Testing: the equivalent change was tested on 6.18.57 on 10 systems with
DSA, triggering kdump with idxd loaded in the crash kernel:

 - unpatched: 10/10 NULL pointer dereference in destroy_workqueue(),
   0/10 dumps saved
 - patch 1 only: no change, the oops in (2) happens first
 - both patches: 10/10 dumps saved; with slub_debug=FZPU, no slub
   reports and no oopses

On 6.18.18, which predates commit 3d33de353b1f, patch 1 alone fixed the
slab corruption (10/10 dumps, previously 0x6b poison faults with
slub_debug).

This series is build-tested with W=1 on top of 7.3-rc4.

Jingyi Li (2):
  dmaengine: idxd: fix double free in idxd_free()
  dmaengine: idxd: fix destroy of NULL or already destroyed workqueue

 drivers/dma/idxd/init.c  | 5 ++---
 drivers/dma/idxd/sysfs.c | 3 ++-
 2 files changed, 4 insertions(+), 4 deletions(-)


base-commit: 93f51579e7df248780214094418f205253383cc5
-- 
2.43.0

