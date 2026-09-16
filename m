Received: from mta0.migadu.com (out-150.mta0.migadu.com [91.218.175.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3ED5345CBF
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 08:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789547154; cv=none; b=AYDL3zQkJ7XewZS7TlWV+/KjZa1LlrO2hi2mwpvLTkQR3D/8+nr2gv426OM8ymgqKbHJI7dymNhDh0PsmMXJeZZeJHgurunPsH7VfE7NQsv7DHykOw6DXXjR73jeThZwF1kR0YTJ2KnoS/1p2o2HWQdNmDcDmNlOcacG3gajErg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789547154; c=relaxed/simple;
	bh=kNCKnxPk9v3DaY2WfnoXeL4xOEmkLUhpLWZ4wNgVPAU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=M/CmLyczJCTFIs1ZiXBX8/4YDdR/QCkdiwul4HWgyqsjGhFYCv90OnpSXZTAkOdkYFDwFKGVs4y7kpRjXAJXd97/MbtNo6qZBKNtFLDcevFm/whqBXT43wsOfEH/zRzplVsFHAL8t1tHME07pj31IkGrMGryC4AFp+ISGaFmSSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=HSKlUC3v; arc=none smtp.client-ip=91.218.175.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="HSKlUC3v"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=kNCKnxPk9v3DaY2WfnoXeL4xOEmkLUhpLWZ4wNgVPAU=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789547139; v=1; x=1790151939;
 b=HSKlUC3vTO1y6ucWWzeCU6AP9bK/soEJojPuOYBpsfqUS9INZMcPQNCsZu5npC+q3vh5w1p6
 JjfQSoJeJpoA8pvuHg8lNuraNxyO3ab+SrBM5IkVz3WgtWEnLADEbt9O3J8p4bJyXhGCIkYcNd9
 V0fae/XMrCFuBbpwsKujfGZU=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 857b1b379797ed2c;
	Wed, 16 Sep 2026 08:25:37 +0000
X-Mizu-Trace-ID: 857b1b379797ed2c
X-Migadu-Flow: FLOW_OUT
From: Ye Liu <ye.liu@linux.dev>
Subject: [PATCH 0/3] mm/vmalloc: fix vmalloc_dump_obj VA lookup
Date: Wed, 16 Sep 2026 16:25:27 +0800
Message-Id: <20260916-vmalloc_dump_obj-v1-0-7aa402d224df@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHdSqmoC/zXMQQqDMBBA0avIrBuIVlLTqxSRSTKtUzSRCRVBv
 Ltpocu3+H+HTMKU4V7tILRy5hQL6ksFfsT4IsWhGBrdGG1ro9YZpyn5IXzmZUjurUKnre7a9nY
 1Fkq2CD15+y0ffbHDTMoJRj9+R/9eCAMcxwnAqmN/gQAAAA==
X-Change-ID: 20260916-vmalloc_dump_obj-d80908447369
To: Andrew Morton <akpm@linux-foundation.org>, 
 Uladzislau Rezki <urezki@gmail.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 Ye Liu <liuye@kylinos.cn>
X-Mailer: b4 0.14.3

vmalloc_dump_obj() has two bugs that cause it to miss vmalloc
allocations, plus a minor optimization opportunity:

  1. PAGE_ALIGN() rounds up, pushing last-page addresses to va_end
     and outside the VA lookup range.

  2. The function searches only one vmap node, but allocations
     larger than 64 KiB may span multiple vmap zones whose VA
     is stored in a different node's rb-tree.

Patch 1 fixes the alignment, patch 2 fixes the cross-zone search,
patch 3 adds an early is_vmalloc_addr() check to skip non-vmalloc
addresses without traversing all nodes.

Signed-off-by: Ye Liu <liuye@kylinos.cn>
---
Ye Liu (3):
      mm/vmalloc: fix vmalloc_dump_obj address alignment for last-page lookups
      mm/vmalloc: fix vmalloc_dump_obj cross-zone VA lookup
      mm/vmalloc: skip vmalloc_dump_obj for non-vmalloc addresses

 mm/vmalloc.c | 29 ++++++++++++++++++++++-------
 1 file changed, 22 insertions(+), 7 deletions(-)
---
base-commit: e6e35979777d646fe3c7c94dca7dd32fb25d45f4
change-id: 20260916-vmalloc_dump_obj-d80908447369

Best regards,
-- 
Ye Liu <ye.liu@linux.dev>

