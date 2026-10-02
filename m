Received: from mail-dy2-f40.google.com (mail-dy2-f40.google.com [74.125.229.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 423BD12CDBE
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 01:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.40
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790904332; cv=none; b=EobS1KP+4/ctnWNAN62BTkv4+o0koA+OsHT7k3lcTqRXCGIfQGPPWqI40F6se29RvgVrcdO2aHh7AkwTmO8n6TtbKOi3HZVztJeLEJxZsSzUf39NqqhwyPljwwUuYpLgrL+1NzooG7Gn5RbJQuGAmaZkVjSyQ2pX0pW2V5cVU4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790904332; c=relaxed/simple;
	bh=mEitigUFmLclhBao+X6JF0CNd1qXwjRVSJbQ/BYfq8U=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Jsqdf3Bp3cCPAgokU64dLZvmUj3Dd7whcnn6BXjnhwXNt5KP8+pwzOD9fHf6WZgM8opc3tDltay/bXQWJKik+kV0Uty1SCg3W3IDhsab06pQ09BZXgkju/x9rFl9+04IO2gdYkPwT21XQK3rlDj2FybrJLgi3sWPtqXTfaJX15Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A/k/lsRf; arc=none smtp.client-ip=74.125.229.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A/k/lsRf"
Received: by mail-dy2-f40.google.com with SMTP id 5a478bee46e88-34ea9118159so1197428eec.3
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 18:25:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790904330; x=1791509130; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=G6UX0d8wcE3FCfnSy6NmrZ53ZLwwwBzpYO6pRbLaARg=;
        b=A/k/lsRfqxVfhUCqYInFCpoB6k3mM76Nc30R3X1Tn7gPKmMxY9DE7essQGfeMUpOb3
         WIKDEnFkY+uDtsQS3l4rXTpC9KYZ0G2jqQ0kXkUiJfZIFullXvSpX2ByeifzglAQRm4s
         YPoEu8VIYAjWi0n70SQun3A4f/wSv47Wp8mE7mhYdR+/IvGpFKufEia9RUR3ytbDbfQf
         w0KYSbpEMFNfHxnzUjSyILBqXs4ojSwY3XkGFKT0nTpxzDNBX/N7jfmRjTt04gPfeM3c
         FMTvOzzFXyNqxTuifz1JGX1sSO3tn7Ra57MAWO4iLCR9cO738iet5bv6/G2GLto85i0u
         kXZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790904330; x=1791509130;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=G6UX0d8wcE3FCfnSy6NmrZ53ZLwwwBzpYO6pRbLaARg=;
        b=Wt+ME/Ons1Ldl2FFjRE0VZPd9cW2TrOMEdnfgDo+1TDn6Nmi5yu9YzJ2wQQ1WFSdoy
         6HgMRbbKSvoa3OjILpWlV1PtXvq31NPrwYCkRU70Io68/lMw6SgscIGcpbNBn5ShHcib
         7pX5HWaE/5roMHlCK60eUu1DjapNBhcKoiUBOWmGNYZGCILH9OhcXaIT8QghX5d0Ct25
         0w8kfzUTm4JmEs6YgPLNBl832zasOZItsHoQuZwsCLFhhvyMX80+GUVtSFsLelPuYDMJ
         rPd8y74R59qMDeth96MYP/d+7HNttRsHb6DZaVbyQ5/3oD81g6wwLjOjPjWEVaqnOI/J
         AvvA==
X-Forwarded-Encrypted: i=1; AKwUvBx4RT2avvH/LfQAJz81gAcqd23BcrjoGMSpI5kGeTiMvoynqZQtraVQaXg0rR/DveWIVAttvp/L9tQ4boA=@vger.kernel.org
X-Gm-Message-State: AFq9FYIumBfsDcf2mm9/O76C02XNSFliemuglOx+r4ce/onJq+Ok+9tt
	3ccm2ekip3Uhw9lwYHzRx+uH2o9hEBvyzMaaJLuYrDa2rhWqDj76F7JT
X-Gm-Gg: AYBFou2tXPytekyh2eCokzuDXZdEv2i47ugL6dis710b/NN8YAhA144tSypLIIx1+nB
	fR8kVAQTrl4R5wVfGU719VWBYDYzwzkPnHD7pXbFCYsO90AB9IvHNVL750GZhFU8hO8GOiObZ7J
	VSxLKIP6s2FXRyc4Z26e7NhWGwCR4WktRf25Vfa54jqNnm27m9Flyi/6Bgh+qtKmgNZfMXV6W6Z
	aTZp2GxQKN77hM12K4+CwaxxTKK6ARsXX/Zsd1biQ6sBenJvKldXJyb/0oUKniAtc5WpuyKdjgu
	3LagwR0OSwrrbS9v7bMgtxmiVAmubZINDjl3ZwFpy1sBNIgX6FmDckZnxpHYg073k5W2MDkrs7M
	svjXMdL2mx+yEXi5+8EDMwtv20MurZHXOM73n8CvQtpS9tXxLL0LpzSghjpNQBWDW5ioJfULDqo
	oXAMGiM+NppsHbPS/kJn1ypwxWpfEf7ZgVSaLU+n3FbQlE01MVhe+qhyh3ykmYdXfqyQ==
X-Received: by 2002:a05:693c:6385:10b0:34c:94a7:b783 with SMTP id 5a478bee46e88-34f15085393mr1226098eec.12.1790904330115;
        Thu, 01 Oct 2026 18:25:30 -0700 (PDT)
Received: from [127.0.1.1] ([23.254.208.9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34f14f984e4sm1837223eec.17.2026.10.01.18.25.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 18:25:29 -0700 (PDT)
From: Qiliang Yuan <odys.yuan@gmail.com>
Subject: [PATCH v2 0/2] mm/migrate: speed up move_pages() node queries
Date: Fri, 02 Oct 2026 09:25:25 +0800
Message-Id: <20261002-bug-mm-move-pages-stat-batch-v2-0-f73b5d20519f@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAUIv2oC/43NQQ6CMBCF4auQrh1DGwriynsYFgMOZRJLSVsbD
 endrZzA5fcW/9tFIM8UxLXahafEgd1aoE6VmBZcDQE/ioWqVSvrWsL4MmAtWJcINjQUIESMMGK
 cFphbhaon1Je2EyWxeZr5feTvQ/HCITr/Od6S/K1/hpMECUrrsaNe6q5pbsYiP8+Ts2LIOX8BM
 hftjMgAAAA=
To: Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@kernel.org>, Zi Yan <ziy@nvidia.com>, 
 Matthew Brost <matthew.brost@intel.com>, 
 Joshua Hahn <joshua.hahnjy@gmail.com>, Byungchul Park <byungchul@sk.com>, 
 Gregory Price <gourry@gourry.net>, 
 Ying Huang <ying.huang@linux.alibaba.com>, 
 Alistair Popple <apopple@nvidia.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 Qiliang Yuan <odys.yuan@gmail.com>
X-Mailer: b4 0.13.0

move_pages() with a NULL node list reports the node of each page, and
RDMA and KV-cache engines call it on every page of buffers spanning
hundreds of gigabytes. do_pages_stat_array() walks the page tables from
the top for every address, at about 105 ns per page.

Patch 1 walks runs of consecutive pages with walk_page_range(). Patch 2
raises the do_pages_stat() chunk from 16 to 512 pages so that a run can
cover a whole PTE table. Together they bring the per-page cost from
104 ns to 12.3 ns with 4K pages and from 90.6 ns to 2.0 ns with THP,
and a 16 GiB buffer of 4K pages from 486 ms to 52 ms.

Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>
---
V1 -> V2:
- Walk the runs with walk_page_range() and a pmd_entry callback instead
  of extending folio_walk_start() by hand (Zi Yan)
- Raise DO_PAGES_STAT_CHUNK_NR from 16 to 512 in a separate patch, with
  numbers for each chunk size (Zi Yan)
- Re-measure everything in one run on a VM that now has two NUMA nodes,
  with the test bound to CPU 0, so the baselines differ from v1 (16 GiB
  of 4K pages: 486 ms instead of 440 ms)

v1: https://lore.kernel.org/r/20261001-bug-mm-move-pages-stat-batch-v1-1-255b7e915744@gmail.com

---
Qiliang Yuan (2):
      mm/migrate: walk runs of consecutive pages in do_pages_stat_array()
      mm/migrate: raise the do_pages_stat() chunk to 512 pages

 mm/migrate.c | 206 ++++++++++++++++++++++++++++++++++++++++++++++++++---------
 1 file changed, 177 insertions(+), 29 deletions(-)
---
base-commit: 551c722f40809618230001baccf219193e22fc5a
change-id: 20261001-bug-mm-move-pages-stat-batch-f62a29ea5867

Best regards,
-- 
Qiliang Yuan <odys.yuan@gmail.com>

