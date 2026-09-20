Received: from mail-pj2-f10.google.com (mail-pj2-f10.google.com [74.125.227.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51D302BE656
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 09:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789896548; cv=none; b=ZplQFyNphIavbUidj0EKL2Ar5kx7AkO2B9+4b7COwO+mIVRAn4sSBTJX5XwOR3IYJH0YPMel42gRpKPJlJ6mCSD2vlYJju+bVcZ7Ps/RbJTNfDF2ARAUSAFRBxVbg/PR4zr5UXUWL0rb/pDAKWhbvl3cHfuIgbJVTDOfIsjc1ao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789896548; c=relaxed/simple;
	bh=3yQCwusPM2SFsjUJl+L+In1OgkFCb7jzGEJa/DftI/k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rbSDTepdCCqDpu1Jg7XnODvauq9NDJEWqDs2TNWKgHACZytM3kvN2b1kJD6ejaIca16RXbEYJfQQMrvw6hf4J0+ra4vvyxQ8BQSvHMsxlBjSSGna8hTunXBJoL1hmAR588bBr2JzAZmyajgaovXtYD3N1/QtJjhX9GpNId93m/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SlTynOSj; arc=none smtp.client-ip=74.125.227.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SlTynOSj"
Received: by mail-pj2-f10.google.com with SMTP id 98e67ed59e1d1-39e249c766bso876835a91.0
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 02:29:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789896544; x=1790501344; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PUf2wiOoUG9R7t6MRcmAciYWufgeLE7ixeOR2Gw9uJA=;
        b=SlTynOSjtBk4LHlj41DfXo53Jtq92JMWvdmWrpmn8I3cSRYE1kqewZ9VjkVwk5N5Zj
         AQxvGw48heKbkqgF6khn9xxpZkv9ZJLwJQbCMdU6PDDLc6wUcrdAqJ472PzQHhdIHEXU
         7cRpvmkEhpumD7YZmrgLEAbnY0H4cAFv68hCMFWK0uKSRS1ZjnenhE4m7UYk14635hn0
         sV921tmiaLorkP5OLtT2ICRhodhfmdwDVwTlu6O/GttGzay4onAqUjE2+ulbTP++NZFj
         HURtF0nw7qsTt/auH2wOF6K6W8YPZ1m+yzDpJgGSF9SRe7Pf0l7R6yj2/alZmxDLdPbb
         /6ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789896544; x=1790501344;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PUf2wiOoUG9R7t6MRcmAciYWufgeLE7ixeOR2Gw9uJA=;
        b=r0DJSU3k+PxF/x9iRFey+SVLxRWMmgPLNSz6xhqMZItSQ69awQYl5GtKh7fv7Dmf8b
         v1PmJEM2j4doitqzYx3vm1Zbe91ZAw24ET07gLqT1NgQUaixYeOHsNZryjMNPKXhZ3M/
         mTevFBlUfZQFazCo26TcdvMZcBN7tIU0XPfhxaWdr0r6nBK5ET+SBMPWVsivfIQjR56q
         STSduJHWnk19IscevIutccB4YQ6vQxWJyrsYRNdx7F/rdqkqEPSuhMqN/Q+rDiffvqIH
         6X7EM6cU5TACy7Dq9EYBQ1YQZPs1FHrIHtd1IgH4m7ilfWOJgavKA5lgcTZds8v5ggcj
         Nqnw==
X-Forwarded-Encrypted: i=1; AKwUvBzXzkOWgmjiNt1wANo84r2b8pkQ59SndsprUAxy+qNAD/LbaXfvEroOhIf/GqtM0lwaVMG83aYvElAVdx0=@vger.kernel.org
X-Gm-Message-State: AFuF++kFS1bp2E1P0DnBZ1aCxLd3PPLqOMVkkhPBLeRgVcOgZcC5X6C2
	83LhqupRxmGMIU1js97k1ua9sTnE6xtMbAI7DpAjYzHrlvlloWutnSE+uTHKp0GgT8w=
X-Gm-Gg: AYBFou18QlLNFvhGxdOW7JJa/CeEZ42tmsxK/J6FvkLvO32FXUO/D8++mOUPSGbF7FN
	kTzJ5lWZm/h82C93FGuO6IQyDSSl+e8oYDIas0Xv1MVjU539RiW5aVRTJQzvBlggmEYi5RBrYv8
	NbFbWrOxSCylqqhW1R+W1eveyAT3hldfkPlu3dUrwFgjucNF2wn3A+Ci+kDUZn24xR/HfIUoUz1
	AVIGoSAUoEaNWbQjoMUeXqI1e7lBVupftew1njl56KV7hK9BddoVtrcT6Pg7YC+lUl2FMvhzqiQ
	iu1qV52U0SCUwyg+Lsg4O6U2KaxmhaAEBIy9uSU0Gt/zrQYgljAekMnFTQK2+kEhftWpomnc4NU
	jBklDe75r1dZlkuOM/SDCWV2zHwgjr61EXaP0xMVtgT5mTUs7A++a3uGA94KVUSw2OOINxhh4on
	5+9n1QVgbuAdbT/FpgOBWxznx+/RxVKMbjnqs3UTfLtub4ZPvnllz6urciUhS07m5Z0dnUaJG/b
	o5U/1hvWtU=
X-Received: by 2002:a17:90b:448e:b0:3a0:22bd:6ee5 with SMTP id 98e67ed59e1d1-3a022bd8582mr4720656a91.14.1789896544491;
        Sun, 20 Sep 2026 02:29:04 -0700 (PDT)
Received: from intel.company.local ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e6c37c64csm8154917a91.10.2026.09.20.02.28.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 02:29:02 -0700 (PDT)
From: Wandun Chen <chenwandun1@gmail.com>
To: robh@kernel.org,
	saravanak@kernel.org,
	rppt@kernel.org,
	m.szyprowski@samsung.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Cc: akpm@linux-foundation.org
Subject: [PATCH v3 0/5] of: reserved_mem: several fixes about reserved memory
Date: Sun, 20 Sep 2026 17:28:47 +0800
Message-ID: <20260920092852.614973-1-chenwandun1@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Wandun Chen <chenwandun@lixiang.com>

This series fixes several error-handling issues in the reserved-memory
initialization paths.

The first two patches fix cleanup of no-map regions after driver
initialization failure.

Static reserved-memory nodes are reserved during the early DT scan but
initialized later. The third patch tags regions whose early reservation
succeeded, so the late scan can skip the nodes whose early reservation
failed.

The last two patches reject overlapping static regions. Without
these checks, overlapping nodes can be initialized over the same
physical memory, result in data corrupt.

Sashiko reported these issues in [1] [2] [3].

[1] https://sashiko.dev/#/message/20260814090305.4C8741F00A3D%40smtp.kernel.org
[2] https://sashiko.dev/#/message/20260814084718.29C341F000E9%40smtp.kernel.org
[3] https://sashiko.dev/#/message/20260806100605.2C2C01F000E9%40smtp.kernel.org

v2 --> v3:
1. Rework the mechanism that checks in the late scan whether the early
   reservation succeeded (patches 3-5, suggested by Marek, thanks).

   Patch 3 adds a new memblock flag MEMBLOCK_RSRV_RMEM, which is set when
   the early reservation of a static region succeeds and checked in the
   late scan.

   Patches 4 and 5 are reworked to reject regions that overlap or are
   contained by an existing reservation. The code makes a little different
   from what was acked in v2, so the Acked-by tags for these patches are not
   carried over.

2. Reorder the patches: the two cleanup fixes in v2 now come first.
   In v3, the first patch now introduces the 'dynamic' distinction in
   fdt_init_reserved_mem_node(), which the following patche 3 build on,
   so the series reads more fluently.

v1 --> v2:
1. Rework failed-node tracking in patch 1: do not track zero-sized nodes,
   and keep a reserved_mem slot when tracking overflows.
2. Reject static reserved regions overlapping existing no-map regions.
3. Keep MEMBLOCK_NOMAP flag for static no-map regions when init failure.


Wandun Chen (5):
  of: reserved_mem: release dynamically allocated no-map region on init
    failure
  of: reserved_mem: retain static no-map memory on init failure
  of: reserved_mem: skip init for regions whose early reservation failed
  of: reserved_mem: reject static regions overlapping no-map memory
  of: reserved_mem: reject static mapped regions overlapping existing
    reservations

 drivers/of/of_reserved_mem.c | 86 +++++++++++++++++++++++++-------
 include/linux/memblock.h     |  7 +++
 mm/memblock.c                | 95 ++++++++++++++++++++++++++++++++++++
 3 files changed, 170 insertions(+), 18 deletions(-)

-- 
2.43.0

