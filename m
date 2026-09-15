Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 376F747F789
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 09:56:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789466190; cv=none; b=egOMwU25ItuOYt1SUqc2E9UL2NFftP+NclmosFmcYerBYxHsF0I3ZD95QzfvBVz/DZy7gpHdXdE3j81yRgmpFtQezcsjeM63NENzU66xptKKWVb7EbXZ13eGWhGcd7Texux7AY27OMEkJboTIL2po3WJqVFOZYRQ3DY3joIB4TY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789466190; c=relaxed/simple;
	bh=BB7k7ub4vUDJmQ/eaAHtM5pQJLzkR3AGtfGbD7j+Lkg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AGG/j0zdRR2X5xWwBPJUsteZGcQt486tnHJA8Swky/HiDfabXt1OvaOpQpekRq7h5cOf/gkgXpbVvJ7Wwg9OZxsX9y6qy66hxhJisnwyhsekdyVqzZXRsdPtBDaYzyf7+k9QpE3eBaswAvIwi9Kpzakhw1oc6UrGYs/BAtrRRC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=V/aH1N5y; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="V/aH1N5y"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d91ede8035so34712635ad.3
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 02:56:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1789466187; x=1790070987; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kk0ehQlGGghmi0p0Ac4j/t7sHqTD4Je0ypdc0ovTfjU=;
        b=V/aH1N5y7QVclb/osUZ5uGP7y8fJUnuTZsayIg0c7WriiWapGHuJX6QLstlnIejFrQ
         /dDku4Tthv1Zs67gOxZPvjtnay0e2wcD/Bi5WveUhJgCKKYyJ3Ngt30vyrE0dReIxBsK
         2CEL0gXogg0wSvTHgZlX0d+SePYa0V9JvVXKRyzAGTlqMvlqRJmUsBF6s/ZHtbIQS/r1
         qkxqbCRmcd1zJsh2D5+BQp7MCjhP0dCGyPLuxswAjOyXgRZQbP26ZwsLozoeCpytL+Se
         XaZCNYecuDtCQZeGSLswkcQm/q12TSBTcXCdvmBqi/UXVu2LYW5bGCc+30AuLVU3w8ga
         tSlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789466187; x=1790070987;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kk0ehQlGGghmi0p0Ac4j/t7sHqTD4Je0ypdc0ovTfjU=;
        b=Haz+O/mK8CoZIFVnDUd6bEmEiT6GzW98Aq3cxYcVBP5ImVhFYKEsvxGtGYGIl0AfLW
         mTCBUxQeBdiIGZl3oLrjp8uPyR0PY3iAwGI5YHt3YMMHckeQI/kKpxFHU4/oGZOrPkpk
         /msxZcWYC1Ug+dGucfXK7muh0jp8L0N44oUtn7VYM0cuRQnjrkJVICIvovo6v6qh/lrn
         qX8CMnqoMRG76v+eAvMMSyIelSiKEzYuLaeRQIbwYdCnScPMHqNWlDt8CjZi8SMRnMe9
         1VPJzI4OmzIe1brNhW4zEZoqHuHuTRjWgpFTfJvtyIP1lPa6RBwu9/CRiRKg3XsnbuDa
         uLGQ==
X-Forwarded-Encrypted: i=1; AKwUvBwve6u2dJrmczx5VBZins7w4t5tJg06jhBgEj1BcT3UL58MHSanCkcgeV9y2kS5GD69flX3/7pyXSyWBa4=@vger.kernel.org
X-Gm-Message-State: AFuF++myZxW7ImKTf8RBWm+kBCaiOFf8qdCfES4aZutLfPJ9WkFnfFAf
	UKvuFPZ9G3RybFqOymSCDvbe2D7q0qBxFhIynv6Tjk9+3Qcyxmd88P2E0E5ZkAMpC98=
X-Gm-Gg: AYBFou1W+CFknP/hHRXbAoqX46jkesGrJLjry1xlGuYak0djIaMsb8L9rA3DVc1BcdB
	XJlmEx/UDLaLNPLKJIFSzrYqwWY9uAaLpeqoskhmSlv2TD6Pr0su/NcMeyMwforgIzUvwK2gc2r
	i6n1Y5RL3C/EUFZZxcldQbc2MlQXceYhqaRS9XLk/Gv4opZJIAtEwS0LTx1Ak0Lx9k5qEVfseBY
	FLPemIVfNfoiOIik96Nr5rXIVHNkqh9YaTeXa/XETgLtRcsSO1hrw0o8CE/vE2nZwwG6QZzZpHE
	qFAX1T2z9WJ8v8ObNTHIxDUMskR+XbJIhr943SY/DzObv8piwG36eBng0rS3pSu4w/AtceZ8PGg
	Dpj9RWK132Vsah7BqvKIiPhlsmtmolYVAEv/rWK6SRynf1OjT8de4wb83YQWgln2Icn71exLJe9
	GZWHgd5zEDHzzXPhZQE5VaL0Y0BidQLlW9zJZebTtXOTIgSYreitCBBVdt6CmIvkL07vwdyxbln
	KVNjR8/mLOu2CWgook=
X-Received: by 2002:a17:90b:3fcf:b0:39e:ac:b776 with SMTP id 98e67ed59e1d1-39e00acb9edmr5989905a91.25.1789466187403;
        Tue, 15 Sep 2026 02:56:27 -0700 (PDT)
Received: from n232-176-004.byted.org ([36.110.163.97])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39dfd6b9687sm4477827a91.0.2026.09.15.02.56.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 02:56:26 -0700 (PDT)
From: Muchun Song <songmuchun@bytedance.com>
To: Dan Williams <djbw@kernel.org>,
	Vishal Verma <vishal.l.verma@intel.com>,
	Dave Jiang <dave.jiang@intel.com>,
	Alison Schofield <alison.schofield@intel.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Joao Martins <joao.m.martins@oracle.com>,
	nvdimm@lists.linux.dev,
	linux-cxl@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Muchun Song <songmuchun@bytedance.com>,
	muchun.song@linux.dev
Subject: [PATCH 0/2] dax: Fix Device DAX range allocation validation
Date: Tue, 15 Sep 2026 17:56:19 +0800
Message-ID: <20260915095621.3744167-1-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

While working on the HugeTLB Vmemmap Optimization (HVO) generalization,
Sashiko reported that memmap_init_zone_device() could be asked to
initialize struct pages with a large-page order for a physical range
that was not naturally aligned to that order.

Following the Device DAX call path confirmed that the condition was
reachable. Device DAX range validation checks the range size, but not
its start address. An unaligned range can therefore reach
memmap_init_zone_device() after the device binds, and a subsequent write
to a userspace mapping may trigger a kernel panic. With the help of an
LLM, I was able to reproduce the failure.

The automatic resize path has a related problem. It can split an aligned
size request across arbitrary free gaps, consume an unaligned fragment,
and leave the resize partially applied when a later allocation fails.

This series validates both the start and size of every Device DAX range
and makes automatic resize account only for usable aligned space. It
also fixes the mapping sysfs attribute to propagate validation failures
instead of reporting success without allocating the requested range.

Muchun Song (2):
  dax/bus: fix Device DAX range alignment validation
  dax/bus: fix mapping attribute error reporting

 drivers/dax/bus.c | 144 +++++++++++++++++++++++++++++++++++-----------
 1 file changed, 109 insertions(+), 35 deletions(-)


base-commit: 1a1de54f7369cd2b5bac0f265910e60ad3a6b4c3
-- 
2.54.0

