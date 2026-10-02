Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4727493D42
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 13:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790947916; cv=none; b=lnNQUkJRSqrU/nSe8WMU3UvfVNmip+39fZOnuc8EsRUZIwVP2l39VyiVCfgY5yUBALmz/CJ9zXOCPuCJcbY4zVlFZ7WLwqIKyC9ywLICWiQnLV7C0DBxOliQRqYvLh3tcQbXVwpc7QYa3mjiEZTd1o7NuVtQxYvIsdqLkBx62mY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790947916; c=relaxed/simple;
	bh=lxd6po6fgSciMb1Ro4LbKXumzbF23PPies3d62RHoUc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Bt4eDw0t0Eze8l5TJX1rMpQnoyQBdTBTNTKCZlBVqAQcO3nwO8yB/t81EkSF1QN01QnJ81WQMRS6940TrLwW5fFE0+g4JfMRzexBdQiupRtuXDxASfLUQkaPvqzf2T9/bKrUS00OjbTrbF9V4dzU5TPgCFVv7qighFb9+CNrbjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=readmodwrite.com; spf=none smtp.mailfrom=readmodwrite.com; dkim=pass (2048-bit key) header.d=readmodwrite-com.20251104.gappssmtp.com header.i=@readmodwrite-com.20251104.gappssmtp.com header.b=eaPRLQTH; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=readmodwrite.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=readmodwrite.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=readmodwrite-com.20251104.gappssmtp.com header.i=@readmodwrite-com.20251104.gappssmtp.com header.b="eaPRLQTH"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ffed768deso23265645e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 06:31:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=readmodwrite-com.20251104.gappssmtp.com; s=20251104; t=1790947911; x=1791552711; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=b5IXHgAtL8/tcae5bQMBJzUP97M7snujo3DcDARBgYc=;
        b=eaPRLQTHXHdy5be5YH+uQAbyhY/2qEjVz7xp1PK5ynlkGywxtHaxuoCQMNc1h7MjVz
         CozKzjyJ+vZoZpF8lJyrAJTqhQ5P57fXQLnF6kiSlTWWdnFAsY1s6LO02UqpE62sUoxL
         8k1RV1FM70T7fIlWUiMpeYcREo5IVH1E2CyYC5ZkFrcYimLzYbH1FHJeEKQlGSFGuys3
         pxWf3pmDIQEI5Ajzv4LrbYeScjDdpFFefXrAOKfWHVz6LPzdsgNJEuuajogbdrARFEB2
         8E+rxZCdkB+TetZikEj3TG/NtYsN1Plitdh3Iyn+ZLMkDSuKWXK/nYgtKM3okvBQkZiB
         XJkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790947911; x=1791552711;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b5IXHgAtL8/tcae5bQMBJzUP97M7snujo3DcDARBgYc=;
        b=l/ErO6qFFxH4pWymsHR18yj3tCMFUuZBOt7IeFJHVj6sDDG3hfyK3W+aKQpO8KR6m9
         uB2c83LpEEDg4ma9cGE1dTXVZ6p/GytbCMdflDCwqzd+RKFEkuh44KlfavtP0h2CAEuo
         Qh/f+bsi7f0BdJ5hIvOCF6l2LRR2+5nuOhkdF+jtPVA8w6c00+CZI2qqAWwqCUtRgYfv
         FAl0HDnGf1wFW4W1787ToTG/1MccwUL1sfauCmwBwfwnCJjXCcHpIOH3WKoXW4wKX6Av
         yejkwKKwa3UmnruyA+8oG8z8bW4Fni8oPAVBPRKTjr/Ft88jrpVHL0nLJSoXyoi9La/m
         54Qg==
X-Forwarded-Encrypted: i=1; AKwUvByb6snZeY1x8XJgTmmJmOHpXHt1DN3vWp4Sc/4whDmc9ihQZapB9Nz6Yi1wEtUcQAT/AqqihvPJo+EesHs=@vger.kernel.org
X-Gm-Message-State: AFuF++kb1/vQKlasj964lWrAixDY0axcb6/nrHitqMEyACJ1HaRrWDm0
	CX/bmixufSdnIjYJe/9B0eCFFlhjqiktupcfAqOlRSGFoRYbYZqbfCmarLHYJ3nDVcM=
X-Gm-Gg: AYBFou2Z1ssHuc7xYwBCmsl8m77XsmvkshLlwtlzJq0XIo8PyXxPr6WylepHG+N2RB7
	7H/n3j7ZIPQoMB6/BT3/LSTSLNlGVJeBzOF2BKGSgE8gpDtOA1MzJC4/kVbv54penqURoTtEQB1
	PHgB8hSHns5ZVkfCpw1Yq/SSeraTRQ7++TS0Frx4BamIx//XiFUEk0g8r13PApov9J6yF3CISsJ
	H1IVRyBhY7Lzj/DjaUu44O2ljDf+4MlaZCkOvZ0bFcTa1KVONdyaeqAAmmwSOQFVJlrPIx4QfId
	E/OruPRCE723/JNxfwfAUXgen+fE+ZIXs9Z4VjZcFkNry1RfS5bCtv0+OPuhEMtxrjhkn4JRhtx
	u/9+UXCh29J4kY3A7mmlT+HsEZxhhdpf1QW0WkFVUWd9DgVALLwQk5m6kVsz5R2yhXpI+prBzm1
	RciYpRBz1swSCTGmYAA7YaSq7KBQ8R6Bsv3RmgvyX+6Q5WZOK9UVSH0iyqWycKuXKAsq7QgOF2K
	9qUaq1Yc3M=
X-Received: by 2002:a05:600c:3b05:b0:49e:715d:95ca with SMTP id 5b1f17b1804b1-4a027561e0fmr48312725e9.13.1790947910026;
        Fri, 02 Oct 2026 06:31:50 -0700 (PDT)
Received: from matt-Precision-5490.. ([2a09:bac6:37a8:ebe::178:143])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0394e6c5asm60543205e9.2.2026.10.02.06.31.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 06:31:49 -0700 (PDT)
From: Matt Fleming <matt@readmodwrite.com>
To: Joerg Roedel <joro@8bytes.org>
Cc: Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
	Ashish Kalra <ashish.kalra@amd.com>,
	Vasant Hegde <vasant.hegde@amd.com>,
	Sairaj Kodilkar <sarunkod@amd.com>,
	Baoquan He <bhe@redhat.com>,
	iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	kernel-team@cloudflare.com,
	Matt Fleming <mfleming@cloudflare.com>
Subject: [PATCH 0/2] iommu/amd: Fix device table setup in kdump kernels
Date: Fri,  2 Oct 2026 14:31:41 +0100
Message-ID: <20261002133143.3628181-1-matt@readmodwrite.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Matt Fleming <mfleming@cloudflare.com>

An AMD kdump kernel booted with crashkernel=512M,high and
crashkernel=0,low fails to allocate its device table because there's no
memory below 4G. IOMMU init fails and, on our systems with an Intel
E810 NIC, the ice driver's TX queues time out, so the dump never gets
sent.

Since commit 38e5f33ee359 ("iommu/amd: Reuse device table for kdump"), a
kdump kernel normally reuses the previous kernel's table. Patch 1
programs the new table if reuse fails. Patch 2 drops GFP_DMA32 for
kdump kernels. Normal kernels still allocate below 4G, because that's
what the kdump kernel checks before reusing the table.

On an AMD EPYC system with an E810 NIC, the kdump kernel without these
patches failed the order-9 GFP_DMA32 allocation and its TX queues timed
out. With these patches, the kdump kernel reused the old device table
and the dump was written over the network.

Matt Fleming (2):
  iommu/amd: Program device table when kdump reuse fails
  iommu/amd: Don't allocate kdump device table from DMA32

 drivers/iommu/amd/init.c | 23 ++++++++++++++++++++---
 1 file changed, 20 insertions(+), 3 deletions(-)

-- 
2.43.0

