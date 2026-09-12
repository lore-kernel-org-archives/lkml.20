Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8DAC1F1534
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 08:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789201593; cv=none; b=WkY27/dD55UscFxU36lKQ2N3DUbnEcncKO0/zDly9UEt3J/Q8AP9DbalrVdYPhk3kjGPllxzqov/XmAtqK535egrAEeSZ6qQkpyzwgpK1U6p+ex1uLU5n1AuMkwGeTnAfziGRmcuhI/OTZVGZn5U3PlUOKRJIZQXPgV8jAUHimw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789201593; c=relaxed/simple;
	bh=MV79uzAtxP4q3WPkmZ4F2Nx3PPF437DFK7HOPCcmm4c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gs/GjWYDZqBlEu6xsRavP6btUV+fD1pQwhy2FsxAk1tckbpVfPLnBC3icz3EL6HHzPIZSaNSvF7un5iKerEXiWOjqYgqi2Fjt3C9l57Fesljq3IkWYuW75kAFdetiO2Q8MA1F7O36o1fryTmvFKvnswJieEAUPvml3G2Olzsltc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=Sz9hZ3gn; arc=none smtp.client-ip=117.135.210.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="Sz9hZ3gn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=PC
	KQzHy11n4rZ/Ir7KunChoHPt2wwZSgc8x8OP6qy24=; b=Sz9hZ3gnsXEBvhqNjp
	R8n7fEYA200Widg1VJ/UBlhyyCvoyOv40BdwS2jWy3mulgauNMnBQLuv0sI2D7sX
	FI+WS8MObchPuONVR1x7UwXu9VeNqDc7kt4lIkCW9J+Vwo+qLD7Mgoqfo3b7a6du
	MzlJ1EevqwI3uTw76Nx5hwciM=
Received: from VM-0-3-ubuntu.. (unknown [])
	by gzsmtp3 (Coremail) with SMTP id PigvCgDnr7FODKVqmfMoSQ--.44660S2;
	Sat, 12 Sep 2026 16:24:47 +0800 (CST)
From: Longlong Xia <xialonglong2025@163.com>
To: xu.xin16@zte.com.cn
Cc: akpm@linux-foundation.org,
	baohua@kernel.org,
	baolin.wang@linux.alibaba.com,
	borntraeger@linux.ibm.com,
	chengming.zhou@linux.dev,
	david@kernel.org,
	dev.jain@arm.com,
	gourry@gourry.net,
	harry@kernel.org,
	lance.yang@linux.dev,
	liam@infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	nico.pache@linux.dev,
	peterz@infradead.org,
	rppt@kernel.org,
	surenb@google.com,
	usama.arif@linux.dev,
	vbabka@kernel.org,
	ziy@nvidia.com,
	ljs@kernel.org,
	Longlong Xia <xialonglong@kylinos.cn>
Subject: [PATCH RFC 0/3] mm/ksm: scan with per-VMA locks
Date: Sat, 12 Sep 2026 16:24:04 +0800
Message-ID: <20260912082407.75875-1-xialonglong2025@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260911160421076_KNXun8Mpp9Xj7fxHG0i7@zte.com.cn>
References: <20260911160421076_KNXun8Mpp9Xj7fxHG0i7@zte.com.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PigvCgDnr7FODKVqmfMoSQ--.44660S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7uF1UWw43tw4UtFy5Ww17ZFb_yoW8AF1xpa
	9Ig345Kr48Zr12vwnavanrCrWrGw1kGFW8tr43G340yr45K3WqvFW0yw1jy3WUW34UG3yr
	Zr40yF1v93W5Ww7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07j7CztUUUUU=
X-CM-SenderInfo: x0ldz0pqjo00rjsqjki6rwjhhfrp/xtbC2w8aE2qlDE+hbQAA3d

From: Longlong Xia <xialonglong@kylinos.cn>

This work was developed independently before I saw the above series.
After comparing the two implementations, I found that the approaches
overlap, so I am posting this draft version as an alternative 
implementation and would be happy to combine the useful parts.

  The main differences are:

  - use per-VMA locking in the ksmd VMA scanner;
  - revalidate the mmap-lock sequence before skipping the fallback walk;
  - avoid repeating a completed VMA traversal when no candidate page is
    found.

Benchmark (QEMU q35, TCG multi-thread, 4 vCPUs, 8 GiB, x86_64 guest on
Ubuntu 24.04, 7.3-rc2 base, CONFIG_KSM=y + CONFIG_PER_VMA_LOCK=y;
victim: 32 MiB anon, 2048 unique pages x4 duplicates,
pages_to_scan=100000, sleep_millisecs=0, 3 runs each; churners: 4
threads mmap/munmaping 256 MiB in the same mm. Microbenchmark as
posted in [3]; relative numbers only, TCG is not native hardware):

                       0 churners      4 churners (mean)   
  7.3-rc2              1.21-1.41 s     90.9 s             
  + patch 2/3          1.41 s          48.7 s   (-46%)   
  + patch 2/3 + 3/3    1.21-1.41 s     30.1 s   (-67%)  


 1. mm/pagewalk: allow folio_walk_start() under a vma read lock

 2. mm/ksm: use the VMA lock when looking up mergeable pages

 3. mm/ksm: scan VMAs with per-VMA locks

Link:https://lore.kernel.org/all/5cd47bc3-bc3d-473c-80d0-8be8b7b79881@163.com/

Longlong Xia (3):
  mm/pagewalk: allow folio_walk_start() under a vma read lock
  mm/ksm: use the VMA lock when looking up mergeable pages
  mm/ksm: scan VMAs with per-VMA locks

 include/linux/pagewalk.h |   3 +
 mm/ksm.c                 | 166 ++++++++++++++++++++++++++++++++++++---
 mm/pagewalk.c            |  11 ++-
 3 files changed, 166 insertions(+), 14 deletions(-)

base-commit: df2908090cda368b01ff43709f51890076c56157
-- 
2.43.0

