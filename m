Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5DC5483831
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 08:36:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792053404; cv=none; b=RnGgsnt7rHCzctcGBgFiBg+Kf57Y4wwSAkMUQrWHkhwQzkuuu5U3MmBUlMuMQOOWInNW+ZY+kUPBDAbGpEZG1WwSk5DT1aRz6nOogHZ/Rv0D4ZIiYqlbDsPWSee7teks5a/EcYwJgQLvaSI3tCvjj/n5XuON8JtbhtIjq6P4f0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792053404; c=relaxed/simple;
	bh=rQRacz5lb3GSBMv12F+Cy9fZi1P8KakT2Zgv0K0Uumo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=adpiyVMPykaN7ykqxnLm05+UCrQNzybEH+8bulvQ/mzOY+1NyPpcl6hAu2dh1/rHW4UJ2GqztuIlhEVLVC7s2BXV4eKX9Cbach8Vce8VPfTjySYOwlrlC6vhNunT9ju05bgkVN4pgaVCxa7ho53OHOao4U1NcqMuDSJPhvn1bAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BMontasP; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BMontasP"
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-917b78dfe30so80691546d6.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 01:36:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792053399; x=1792658199; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=csLZTWFJZwVmJjPK2j5B/Fm6zSWB8VBpn8JFPtRRzfA=;
        b=BMontasPnj/q/KCbkTQAjA2cXNDjjA7rQa0powvrrsXZY1JWW2eN3l9VZXRuyWTqXo
         Wpdv1Q/3LWvn2Cz6QuimQBg4y6G7CQ5PFLgH0to0zNbZttyvBTIQ+wYWxWv4DM7ZfL7z
         gp43A4A6nRW7PSBEWZEq4s2yys5A3OJmI6gtAb8CnD0jQ6xx8lVgolGALi8CWVrqbIcn
         AQ12///6JpZcyrhPkph7ef1dnjT8Din3plLarXFI1iMdnU+IV2edkyLMD/xKF2897qe+
         cRL1saPxmHAvfIF3/u6EL/XsvogfpEFKmnF1dZl82ziEaKP12F3XBeNWIdb/0FQq60kO
         jgUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792053399; x=1792658199;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=csLZTWFJZwVmJjPK2j5B/Fm6zSWB8VBpn8JFPtRRzfA=;
        b=nouEtoAyAYkWcup6ZHA4qTm/iSo9sXuK6rYeOriMcgahmDWJNauJraasNsY+KZRj1/
         nryQe2URErlSMBFmWLzuhHXZ9iPZUM55BGT00+jcoi/XDEpnWZvenSayD4RZB59alhVp
         mGgQiPbRK6izyAKZFDhKtDw8TgSuaNSXh8aDraAZ7d2dmbhI22emQvealyCVy/O8qyuf
         QBBUBbGfX+pr3ivEF3DSfx5E+UsmBeOUfcBHpgOr4U4Fc1PZyQVMnDltAeJHon4lkbQT
         4YnAQhlqWrFm9NNV4iF+ncC+oBgEgv6EU1JfB1WgyWecHPsGpPouYaBH8JhLaf8lwYwx
         XeXQ==
X-Forwarded-Encrypted: i=1; AKwUvBz6WY1HThNbPvNavf1hDVG3OWD42VzpPSNEO/EDEzyRLx2nEzpyyIStIK/4wYrxYCHmZwPxxS5K7mUJ9EY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJtSYNT9xqgSzngb0S1dUg7P0ADzlsNUNERl1pTdU+j22B+hU6L
	i21EGHFV9laZLDZwSSSLjTNbM+yTYYL36n0UnLO/Jk3iuVJsZYYj9c57
X-Gm-Gg: AYBFou0Bv3GlBF/AVy/mmH4/OCysYvPKUHGsJVmUQKhFqo7pDb0Z699TEi57JMef+xc
	choNGFV39iFW3vlRN+CcGZMi73C2dja19B2rpFjAHUIcfYVFypVNgK2YiV2a/fQTJJWesUywYde
	pSZ32A7PUBIN4NOlLt/KiIvudyxp7awNlAO71ThplcoKbCXb1t4dgM7HkVkcwkIFQ+Uxn2DmlhL
	WEHjCwwrfWSVE+BDLa0CBb3p6jKc1MDxIDDhrJ5HgAhH3bIPoH/0vswxFCUCoiM/kPwmA+56BDr
	Cy3JeMJ2fj8Hq3Dl/tBsPopxzpRzKXJ+PvUaWl2ZBC75w3yJP+XKKKKta65/iccXOLjCf/FiGsK
	/dLbyoEEMXV+DRew034I4tr+E6xdHxr4abCI9NjKUhgkgwieRHvHU4Za7HkJ9J4KbS1htyjeubc
	oGZGamlwhZ1IB65CjqZHDchQE7uSjPVC2pMf4lk+eTO0EUCZuNmHjDDtp/y/A6ZoY1FU73+Eg0z
	DNzwKv5LoxqasZ2suDJLkCgNNKvx9Dy9EYfcBLbocKWUcodEIOPixx67Z1uadwKMCLZzdlOIF74
	GiQiTZ9n5tpwan5Jx0OkJQoXflimyi/zFw==
X-Received: by 2002:a05:620a:4552:b0:93e:5821:2c57 with SMTP id af79cd13be357-93ebd2244d7mr3256091585a.22.1792053399383;
        Thu, 15 Oct 2026 01:36:39 -0700 (PDT)
Received: from ip-172-31-15-253.ec2.internal (ec2-44-200-54-59.compute-1.amazonaws.com. [44.200.54.59])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93ef5090050sm711843985a.40.2026.10.15.01.36.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 01:36:38 -0700 (PDT)
From: Deep Shah <deepshah146@gmail.com>
To: Jason Gunthorpe <jgg@ziepe.ca>,
	Leon Romanovsky <leon@kernel.org>
Cc: linux-rdma@vger.kernel.org,
	Yishai Hadas <yishaih@nvidia.com>,
	Edward Srouji <edwards@nvidia.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	Deep Shah <deepshah146@gmail.com>
Subject: [PATCH rdma-rc 0/2] RDMA/uverbs: Fix DMABUF lifetime bugs
Date: Thu, 15 Oct 2026 08:36:35 +0000
Message-ID: <20261015083637.200958-1-deepshah146@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix two lifetime bugs in the uverbs DMABUF export path. Patch 1 fixes
leaked uobject and ufile references when the uverbs FD is closed first.
Patch 2 fixes a use-after-free when dma-buf release races with ufile
cleanup.

Tested on mainline 4056b3c9d3c9 in x86_64 QEMU with KASAN and lockdep,
using test-only siw export hooks. The unpatched kernel reproduces both
bugs. Patch 1 fixes the leak, confirmed by tracing ufile release. With
both patches, the same tests complete without KASAN or lockdep reports.

The tests cover core export and teardown, not real mlx5 hardware,
importer DMA mappings, device removal, or allocation abort. The abort
issue in patch 1 is based on source review. Testing on mlx5 would be
helpful.

Deep Shah (2):
  RDMA/uverbs: Fix uobject leak in DMABUF release
  RDMA/uverbs: Fix DMABUF use-after-free during ufile cleanup

 drivers/infiniband/core/ib_core_uverbs.c      | 10 +---
 drivers/infiniband/core/uverbs.h              | 37 +++++++++++++++
 .../infiniband/core/uverbs_std_types_dmabuf.c | 46 +++++++++++--------
 3 files changed, 66 insertions(+), 27 deletions(-)


base-commit: 72d3fcf802c45d00b300f25b848a93c3a2bd7c7e
