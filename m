Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3126A41C6A
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 05:59:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787896789; cv=none; b=NSU8SGldVi3qMs23xjLe2EcKVT1SDZzCUdohSsQjTNz6F3xzwCyxNIfqnAuo9uzSvIjuLkHQYJ7Q66U5SRxTOft2cWMG4fK3Luv48Cio0/mrU7FQKi2+uiFDd/GhGRka+EiD+8gouuf4WWGj1N+JEjuG9JJILzyGW2y+nlLxA7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787896789; c=relaxed/simple;
	bh=muxTdd2WeZxgjmHt2qcYHN2fbk6odcHQFyl+LpftQzo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bj68bhouDLFb8GNw/IWpn/6GDoWG7Fm1XsPO8PmnjY7gq+u5ME7u3MGsgl35JvSRE4PDAtlkX99tjNLAPcx4ct9pGVLXEczFbgsEa0ID6mTnmhvjcVYY2Sdot/XVVH+b9Zrjs089gnVHAPuveuTIUUas56MwNJVtA3B+2VVtSMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HDVeLvx0; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HDVeLvx0"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-383b4a3755fso882048a91.3
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 22:59:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787896788; x=1788501588; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GDl7OP4PCiA7ts1ANifq35vbIMUl1z7lISgn6jZCS6A=;
        b=HDVeLvx0tnj3/xjzDq3R9vFuMUE8rK9J+YQKQyVLMbAbwDCyb+BI59ONfZCLMTRp/L
         GsGDxcNd59SSk0DQojRNdh3EUCDLRpKonMJ2SOoPHfnvljKsnBBV693ogY8LodBTQf6e
         zZ9n4Fn6/uWEddzB4btLqNdafgzjSCqLG4ywDZJNhIWX+bzuH2RVkNk58Z/ANwhDOhWJ
         rzd1+ndsYg81Z+xlA+pKUxpOwtOK0SYdUJjT1BKX7QCZv5c+9jae5uNGFOyvKE9C7y6S
         BDfHgWgnbjg4hH3ruKwaejzOKwFq5ij4TP96H1R8E8fdEjPCxqgtF1mARUlihq0AJFk0
         7O7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787896788; x=1788501588;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GDl7OP4PCiA7ts1ANifq35vbIMUl1z7lISgn6jZCS6A=;
        b=oqxgvcc9MkZIYTR+425+wncBggze0fRsKLsP6gIb64qJ7DbKORDoCY/WkDQPeExSLo
         XyEyMMyOBuTGrbIG7muRrt+FLpK+0iny2G0TgXHHL/M4CvWEtp+YYXN4F+S//VtOMm/9
         kLE7vxsp/MEyAHiyDa8Pwms50yaiMxl2EmzUPCZgKG5DT9YRQc5BzmT3qtu8Ht598aHB
         UFv/d5DbFv+4H+rqVEKrGhA2Gyf7YaFMmPHcSbgDC9KHpJHiD3IEA4FT+2+j2lrHhcJp
         dgd28mLvekRSWt9HgJP55AvDoonfsEDCdIzcMjk5nxivtqCt4N+qb+Ff8plvcKWBFYAG
         h5yg==
X-Forwarded-Encrypted: i=1; AHgh+Rr84Qs0tV3n+Ux30RVfGuoha3uTQle41bJQnlDeLocWJqZMr2kixXiHZLZkZd6srgGhb2V68NIHmDh3ayY=@vger.kernel.org
X-Gm-Message-State: AFuF++nxJ55NiAa0MII6SCrrlKdkhPsyjT4yogoBLD2nuKY8rzQ91S+0
	T94/54fnMW2yfp1tjVplWX2uavj5h5dXdo0+gnZcnHs4lGfF0cDw1UpV
X-Gm-Gg: AR+sD120GZwKoK30+MkxFylV/3dKOFsp/O8WccPqPJPaNehTlEubZxcEw7b0AKdwtci
	maADCnjGHFBTsxELTDo78dXjJ6223wzPkG0Oh1NsyNfegdi/wZE+Jzto6HZMrUxarZrJLS7J3uG
	fwcvBKtvQj12r2CCZv4s3Mrdugazea19OwxLsFL+GrXmaaJ53mxKWF97UV/ILTRtd507T7oJfWF
	h8gT5Aw/tCl53D0aQMDd35yol4pk8HeO5e4krzOmsdgofuF5yJgReuQRrwT6SU/dNeaUeSkGttl
	mhOPgE3fid8Gfp+di2UAeDN5+ZCBGGLA08QEnfETwXSA6Zev+g1Mddzkwjfd5kFESniUOG4yU2o
	h3/D0cOSJp/0K8kV/WsTZhtiJcMyKyJ8s11qNIKrowTdSUr9vzV+tqkOL6fThNUtkr2XfBAjw/l
	6V5vzzFo52hQm4cVoxiYyBHXIerehTMLJWU4/BNk2b+Z9w8TX31jk1rvJOVV66sdqwVMGEfDlgb
	pM=
X-Received: by 2002:a17:90a:d884:b0:381:e74f:8a6a with SMTP id 98e67ed59e1d1-396d10248camr9814071a91.16.1787896787656;
        Thu, 27 Aug 2026 22:59:47 -0700 (PDT)
Received: from localhost.localdomain ([240e:b8f:1df9:a600:c693:b19f:ada0:748])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396b0ea808csm5826241a91.2.2026.08.27.22.59.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 22:59:46 -0700 (PDT)
From: Vernon Yang <vernon2gm@gmail.com>
To: akpm@linux-foundation.org,
	david@kernel.org,
	ljs@kernel.org
Cc: nico.pache@linux.dev,
	ryan.roberts@arm.com,
	dev.jain@arm.com,
	baohua@kernel.org,
	lance.yang@linux.dev,
	usama.arif@linux.dev,
	zokeefe@google.com,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	stable@vger.kernel.org,
	Vernon Yang <yanglincheng@kylinos.cn>
Subject: [PATCH v4 0/3] mm: khugepaged: fix tracepoint UAF
Date: Fri, 28 Aug 2026 13:59:23 +0800
Message-ID: <20260828055926.346744-1-vernon2gm@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Vernon Yang <yanglincheng@kylinos.cn>

The khugepaged tracepoints take a folio pointer and call folio_pfn(),
but by then the folio may no longer be valid: freed after folio_put(),
folio_unlock() or pte_unmap_unlock(), or not a folio at all but an
xarray-encoded swap entry. On classic SPARSEMEM, dereferencing it oopses
khugepaged as soon as the trace event is enabled; on other memory models
it merely prints a bogus pfn.

Pass the pfn to the tracepoints directly, captured while the folio is
still pinned, closing the use-after-free windows in
mm_khugepaged_scan_file(), mm_khugepaged_scan_pmd() and
mm_khugepaged_collapse_file().

This series is based on mm-new.

V3 -> V4:
- Only trace the PFN if it really was problematic.
- Calling the respective trace_xxx() functions separately on success and
  failure.
- Set new_pfn once after successful alloc_charge_folio().

V2 -> V3:
- Place folio_pfn() inside the xas_for_each() loop in PATCH#1.
- Already defaulted the pfn value to -1, to simple it in PATCH#2.

V1 -> V2:
- Instead of passing the folio, just pass the pfn directly.
- Using the folio_pfn() before dropping the reference or the page table
  lock.

V3 : https://lore.kernel.org/linux-mm/20260824092935.73892-1-vernon2gm@gmail.com/
V2 : https://lore.kernel.org/linux-mm/20260815051924.194810-1-vernon2gm@gmail.com/
V1 : https://lore.kernel.org/linux-mm/20260811133655.267739-1-vernon2gm@gmail.com/

Vernon Yang (3):
  mm: khugepaged: fix swap entry value to folio_pfn()
  mm: khugepaged: fix folio is used after pte_unmap_unlock()
  mm: khugepaged: fix folio is used after folio_put/unlock()

 include/trace/events/huge_memory.h | 18 ++++++++---------
 mm/khugepaged.c                    | 32 +++++++++++++++++++++++++-----
 2 files changed, 36 insertions(+), 14 deletions(-)


base-commit: 1a46b1e97bde62afa7d925bb0dcd9f9748a1d7c3
--
2.53.0

