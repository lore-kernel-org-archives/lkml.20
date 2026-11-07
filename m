Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794020504;
	b=vitYtJBTA8ls+ZpNh6NU5b+b4eAqjo9BnGvUWhYBWLcwM7W1KO0AiDpWml8P07xJzNdN
	 gPfMulWwQGLt3PWyhhYhAvVsudvM9x3c+pjcvgbl0SerTCS8a144sSer0cNcYh6phr5Zv
	 wH9TKlyjF4PjJKDPA7wCQKsQCRrW5rKfg6ek27Wz1uRp3EBXihhq6jS9mSsmzNzu8XpF1
	 f5kPI7ld3lhTY2niiJVMd0SSEo71UtY2wmGVOtfp9pGikL2nAcBCRUzXhFPChyc3G1Vgi
	 TBlEB2TlDCkzD87YNd/GvCEk7Z1u4l7XmkiejskyglJBf0B3NtnZzltCFImU3CG6dlw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794020504;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=c7RdJd1ac0ZTEx+/NYzXEY+S8dr+3ZAZRK/h78/Mnrs=;
	b=Rir7XbTSEx8tfqiW/a0YPHGWoZc0hSMC2ALWbgPy9u4H9FEwFZOmfZsl+B5ed0XN2wcx
	 Jyf47x/Lk3DKimW/DIN0+gfGO1i/OEwUMUbLJqnqcnVP+IM8euq4c8yfe9qw3O4NFAbcy
	 GOfHMR2PIt2sQW3SnJhCVOArMI6zrj7GejydbskVhn4mCZnxhOCSkGZCJaAFagPAFZMiZ
	 5Kw9NgDMfmQHJXuTrBhP3KNkCPwkPRv5w2q+TC1uDnWprvPGdXZ88zaOMWnUJKI21VlED
	 y1Ty36b4ymst7x104i9NKestLF3uHDw68QRfBuDtE5YlAXHOmR3EKJ64pvsJv2VPiDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=EXL7qNvo;
	arc=none smtp.remote-ip=74.125.82.44
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BB59606A32D
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 03:01:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8BB59606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=EXL7qNvo
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-14394530ec6so1813070c88.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 19:01:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1794020503; x=1794625303; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=c7RdJd1ac0ZTEx+/NYzXEY+S8dr+3ZAZRK/h78/Mnrs=;
        b=EXL7qNvoixipFHmUbTzJDnVPsqgi4j4biZQDDbJ1xQAQJHf2NXHxgCekVjOp/+aZVb
         yp6VqeTgewe26Myz7al0S2vSkb77+amT1dxIRHwQ2MBO2lT6wQK6EdXfpzk6bOnKZFHf
         1FPyaVZYqU9QWAvjgfe0vPkEPQW+O0CUwWAB8c3jRbLOHFBBIig3mpQure4oPc+30D/W
         gDsmH7CpNhQ1Hs8QtINZSFd9o/aReNI9OLi0R1eyEFjaIJ/npVDPGcNoOm/sW+CjDmro
         EXWj1yBbGE43wfG7YU7UZNX/c730VtWabz1UQ+x6vtpqvv5/1OErICSYMxBJqWtH2VZX
         QhQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794020503; x=1794625303;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c7RdJd1ac0ZTEx+/NYzXEY+S8dr+3ZAZRK/h78/Mnrs=;
        b=x7rI2a+0ps3QrEHnrGoXXpdfw2XM7GUn2U7T/ehWn4Y84n8fe4y6wskWKy/UkfGxm4
         OIe5NJgHbJOieY6hTONCAYz6WRej1P08VI+zocq78jSYNkZ3fwUYxefF3Uio43oJDHZK
         Afc0A6ixAQLXVSkzaOQbI6WV20O8wMDvkKF7r7PvolzAswDb4aeFXZkVcISgK2TqIiWj
         MQPWFcs2P9WOvKtrUFv1xHJPIvclItSYLmJlL9Oj9/w4ptIjIJKmd9L7aKjBQDmD3ks6
         EvIWVgknskSUW1RnezVeNkw/WBISaNSZP1NwYMRR6xjb8AZEJu/o8NXIb1ynGqo5uA2i
         E5aA==
X-Forwarded-Encrypted: i=1; AKwUvBz7QBschoRvkzYqFVflPfTv74t/2E0S6MXTCEjK3BuitieKH3iCQrzM+lWw25krLRDFzqI5zWMBgmKxo6A=@vger.kernel.org
X-Gm-Message-State: APuU4Z/+zW4IkyAQalcVAY3z4FG9offMh35mdRk5PaHaPxttAPIiCS5C
	cEw7iGsFlaUdZsnsn7FqRt1TUhQA1A9/xanoErp4JVI/0iaxPXWQv8S4a/FD4nNykQM=
X-Gm-Gg: AYBFou1UVW8DQDFwl5u7oEvAS7UogzGm/9bVEsEHEiW7hVSwAOb0jLfF6QUybGbb+eo
	HmS35Q/Mfg0CNR2U9mQOAxLSPynOnBSTNjCmcoVpr9TRGNf9bkYbnn+6+t3PonCJGRW3eEjGB40
	W5vtFkWGGf/N0ojMoMrzvc6fORaWV+Kk/UJG4INzZrsmcc15MMkt9UMdtahJATGURd3+2vktlUC
	9T2tK8OVGZDzgKdGS8KkS7acYCStlO2zRtJdowqzxW4A6tpBIo7nAMUZnUeXssI71nw2RIIhZpv
	JrOaR0kXZtJxUwzAr6G2ZjbrbyeDBXs7PyTuoiRPeVe2SCKb4hwqLCO4wT5HE/4NLRt4Si/lAMo
	MC7K7ZFTdq2iKzL/P9KdwN3PEa6+Z3jgoym4o7y3Ov1Sc95AnCWbCRiFEU9Hc4r7v5a3tyu0TJo
	893muroEMJ/iUno0o09dSCxprncKFefwyXK8PQS7ZRustBA+Iskh5jWj9ltcXqM8Q3WxoJCX7Le
	HgbHXBFDKhLmEresZE063AHlbycNGw7uKT/9GAVdJ5PNazrw7c3449MJEXWeQ0/wR/Y1bRrgT/0
	KdHgjXnqHN4/Ntka2UuAY6f4IsiThin0Y4WFsfbYtyL8fsk0rt/gs7Np7Ixbqg==
X-Received: by 2002:a05:7023:a5a:b0:1a0:e3e2:22a3 with SMTP id a92af1059eb24-1b25d33a590mr5333663c88.31.1794020502203;
        Fri, 06 Nov 2026 19:01:42 -0800 (PST)
Received: from G6L4RL2QG9 ([2409:8a00:1832:6900:c8de:13da:804b:a0fa])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b25e4b4aa7sm9534473c88.13.2026.11.06.19.01.35
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 06 Nov 2026 19:01:40 -0800 (PST)
From: Muchun Song <songmuchun@bytedance.com>
To: Dan Williams <djbw@kernel.org>,
	Vishal Verma <vishal.l.verma@intel.com>,
	Dave Jiang <dave.jiang@intel.com>,
	Alison Schofield <alison.schofield@intel.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Joao Martins <joao.m.martins@oracle.com>,
	Ritesh Harjani <ritesh.list@gmail.com>,
	Pavithra Prakash <pavrampu@linux.ibm.com>,
	Muchun Song <muchun.song@linux.dev>,
	stable@vger.kernel.org,
	nvdimm@lists.linux.dev,
	linux-cxl@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Muchun Song <songmuchun@bytedance.com>
Subject: [PATCH v2] dax/pmem: fix unaligned compound devmap initialization
Date: Sat,  7 Nov 2026 11:01:26 +0800
Message-ID: <20261107030126.90894-1-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
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

Static pmem Device DAX namespaces reserve space for namespace metadata
before the user-visible data range, and may also include padding needed
to satisfy the Device DAX alignment. __dax_pmem_probe() adjusts the
dax_region range to start at the data range, but the dev_pagemap range
still starts at the beginning of the namespace.

That is not valid for compound devmap mappings whose memmap is stored in
system RAM. Compound page initialization requires the start PFN to be
naturally aligned to the compound page size, because the head and tail
struct pages are initialized according to that geometry. If the pgmap
starts before the aligned data range, memmap_init_zone_device() can build
compound page metadata from an unaligned PFN.

The resulting struct page layout is inconsistent with the Device DAX
mapping. A later mmap fault can then resolve the user-visible PFN through
invalid compound page metadata and hit a kernel panic while inserting the
DAX folio.

Fix this by rounding the pgmap start up to the Device DAX alignment for
non-altmap mappings. This gives compound mappings the required naturally
aligned start while retaining full-section vmemmap savings when the
original start is already aligned. The altmap path remains unchanged
because memmap_init_zone_device() skips the altmap reservation itself.

Fixes: 14606001efb4 ("device-dax: compound devmap support")
Cc: <stable@vger.kernel.org>
Signed-off-by: Muchun Song <songmuchun@bytedance.com>
Reported-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
Closes: https://lore.kernel.org/r/wlrkqqvg.ritesh.list@gmail.com
---
v2:
- Round the pgmap start up to the Device DAX alignment to retain
  full-section vmemmap savings (suggested by Alison Schofield)
- Update the commit message to describe the alignment approach

v1: https://lore.kernel.org/20261016054914.2601510-1-songmuchun@bytedance.com/
---
 drivers/dax/pmem.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/dax/pmem.c b/drivers/dax/pmem.c
index bee93066a849..d54d23f1cc58 100644
--- a/drivers/dax/pmem.c
+++ b/drivers/dax/pmem.c
@@ -51,6 +51,12 @@ static struct dev_dax *__dax_pmem_probe(struct device *dev)
 	/* adjust the dax_region range to the start of data */
 	range = pgmap.range;
 	range.start += offset;
+	/*
+	 * When the memmap is stored in RAM, compound page initialization
+	 * must start at a naturally aligned address.
+	 */
+	if (!pgmap_altmap(&pgmap))
+		pgmap.range.start = ALIGN(pgmap.range.start, nd_pfn->align);
 	dax_region = alloc_dax_region(dev, region_id, &range,
 			nd_region->target_node, le32_to_cpu(pfn_sb->align),
 			IORESOURCE_DAX_STATIC);

base-commit: a91337fb5e8e0127c8b5be87be9f3027f95b48bc
-- 
2.54.0

