Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23A3E4A387D
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 12:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788438119; cv=none; b=PUUnZzK3Ku3thWikkG1NCjnw0crcFjdSqWChmXt+OyaekW/qEp29kxbjjctPHH5WlAfWihvmOlyMdfgdKMKqfR00L8oqncrQUqT4aJd2L+d4TAJgJdnBazF8DyqAxvEzeiBP/mQWzIq9Sn7UbY3FRGA4sq53jeSsqofR8+zq3QQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788438119; c=relaxed/simple;
	bh=iUjs+EiXrSNpfuKC5pykyao7Ehz6dcFc1lBNJ06asU4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fM5b8scbPb1IA7Svk1ohqshkonsdrPgd8izdolQuFy1VOp9WJ9cT9lCykvB3z2L6vXRYMe/KO62HRBMnWzX3jX31f9Xcil6zM95XMNfOV0cy6Sz/Iu89oALkWYJuG6O+Q/bREtjgN4ql12WanPkK3gP18q+aIjRJlNjKx6eMzlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=HM8P+JNe; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="HM8P+JNe"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-84e0688b7e8so2201899b3a.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 05:21:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1788438113; x=1789042913; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8wCVi0RPQ/1w5scAtdtuQVBMayOKGUht0GU0fLrik4o=;
        b=HM8P+JNeXozKprIxH883rNenR/o9M2W+wBj9fdZuwElwFzOkyitwEx5Mt0YhG5NWRK
         inKZgpUnbZGWPn1WoBGBmEwxh2wIyIRHgsoO1ZOCrl/vitP/SJfYocCbzZaxW+53kM4k
         UEbwW093laLXhGKAuHqmeVPFSqBG1YiqIcrvezNM/yp/xH4euQaRNyixTz1xB84LArZ2
         BpywZzOOmqgKcDYishQLzhNw7qZX62830zj7cETarR3To3nmLmMA/Yo4ZdLbnm6XNFrR
         S2qXTOW0U1pKmPVhapjTTxhNOmNMVHsK1OJAPhMLWlwUrogk5QJYCLwYd92aB41O3gRY
         SJ4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788438113; x=1789042913;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8wCVi0RPQ/1w5scAtdtuQVBMayOKGUht0GU0fLrik4o=;
        b=EmF6sCCB+Zjokgr3H5fmH2z08ZkVayzHMbE2+lhvCMD9FoDW/GysvThAz4I+NH7qx9
         jqwMEp4Ysp88lk6+7vA+qOQjZsPPGjI4aKdlL63fvbvdei7dVpWquWsLRe93eE8e6bye
         5/taplZeulnqoZdUmo8Ihr1EmtdD7vXP7nnGtERpPkbolPZNRA4gE+Atnx12mMgDgdO2
         Lz60g7u6EyHY64zM7HgSd8yaEVUTqWkWKdZ49NLOMhZ+TgbjY37csjoRS+ncUeaL/Y2p
         T2V0rppygz7fOfi0WVXOqHL/gefOxP/kFloObq7AzsklbrzZTR4LKIyBP1MTzRkWfIO8
         tVDQ==
X-Forwarded-Encrypted: i=1; AKwUvBxPzeJJOVm/O6I4T6As36UDW5bNsmZdAlvyFNWk4EdjBHawScEE/v/JHdyTn++TjDukybMzwuUxabTWNvo=@vger.kernel.org
X-Gm-Message-State: AFuF++nmU84rLqxTpNSqr0Fs7fzgSpesDe+gAwQsR8jqumuuZ5ANDkfV
	KvWJN5JGooouJ6MJln7j0e+rIy8Q/xDKBQ8ZYK2wK9pmanN+j2TvjjUGJHeMnDapFyM=
X-Gm-Gg: AYBFou2FUtMxEp9UzFxRAX3keDpgLu6UYMnKw5SZ/ewlf8Cmvk5BK0tPVZ4Vxalt/I/
	Sglxz5koZFbeHwwtIkW/okHZ26F8lcTOK3/pTgMpiKi7reWj1ynuJpDNM7HAUFnBWlOE4cU6FDr
	q0zU5qn5lvUM95Pm6cIoopUsOGvX+yLIBWIyKF2OE2yRd+mIxzu9nrfhrrASLhM56WprJd1uy1n
	mM94KWk+b0Jh4ba4bnJRYJhohN11IYnnmPKXlSpbD4R3DtmktW1lZqRN7yEwOTTyA1CWy5FZYD+
	xyNEQt9xChzBF+8yf8iJajRCkz7SKh2FQTue1ZZWn9h92DMs7lpAZ4r+ZyuUiZX7ABUJRHmOpnn
	8IBMY8YS8CBsPobezRooW4yZE9BNlfRlS/sw7D/B7yiIcoH+HV5/T73+x9+1rvo8W+Ufr2pSvH8
	HGqmY/pMV4w02OnwGzr+O9LAbo6jYteRVxjdS7y0MekEBCMH9ZC7V1lSfgtL5hh/QZ/mU+RWRwz
	8WXmrsXlSyr1HaDAzz8PsneMA==
X-Received: by 2002:a05:6a00:e8f:b0:857:72f8:dc91 with SMTP id d2e1a72fcca58-85ed850a6d7mr17640794b3a.18.1788438112769;
        Thu, 03 Sep 2026 05:21:52 -0700 (PDT)
Received: from G6L4RL2QG9.bytedance.net ([61.213.176.13])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-85db24f2076sm2868126b3a.4.2026.09.03.05.21.48
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 03 Sep 2026 05:21:52 -0700 (PDT)
From: Muchun Song <songmuchun@bytedance.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Dan Williams <djbw@kernel.org>,
	David Hildenbrand <david@kernel.org>
Cc: linux-mm@kvack.org,
	nvdimm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-cxl@vger.kernel.org,
	Vishal Verma <vishal.l.verma@intel.com>,
	Dave Jiang <dave.jiang@intel.com>,
	Alison Schofield <alison.schofield@intel.com>,
	Mike Rapoport <rppt@kernel.org>,
	Oscar Salvador <osalvador@suse.de>,
	Ira Weiny <iweiny@kernel.org>,
	Jan Kara <jack@suse.cz>,
	Matthew Wilcox <willy@infradead.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Michal Hocko <mhocko@suse.com>,
	Qi Zheng <qi.zheng@linux.dev>,
	Muchun Song <songmuchun@bytedance.com>,
	muchun.song@linux.dev
Subject: [PATCH 2/4] nvdimm/pmem: avoid HWPoison flag updates for clean pages
Date: Thu,  3 Sep 2026 20:21:25 +0800
Message-ID: <20260903122128.12264-3-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260903122128.12264-1-songmuchun@bytedance.com>
References: <20260903122128.12264-1-songmuchun@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

pmem_mkpage_present() is called after persistent-memory poison has been
cleared. It only needs to clear PG_hwpoison and undo the MCE nospec state
for PFNs that are still marked poisoned.

For clean PFNs, test_and_clear_pmem_poison() has no semantic effect, but it
still performs an atomic clear operation against struct page flags. That is
unnecessary today and conflicts with the FS-DAX vmemmap optimization added
later in the series, where clean PFNs may be backed by shared read-only
metadata.

Check PageHWPoison() first so only poisoned PFNs update the page state.
Poison recovery keeps the same behavior, while clean PFNs no longer require
writable per-PFN metadata.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
---
 drivers/nvdimm/pmem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/nvdimm/pmem.c b/drivers/nvdimm/pmem.c
index 30a51c365ce8..b14f75daeda7 100644
--- a/drivers/nvdimm/pmem.c
+++ b/drivers/nvdimm/pmem.c
@@ -80,7 +80,7 @@ static void pmem_mkpage_present(struct pmem_device *pmem, phys_addr_t offset,
 		 * here since we're in the driver I/O path and
 		 * outstanding I/O requests pin the dev_pagemap.
 		 */
-		if (test_and_clear_pmem_poison(page))
+		if (PageHWPoison(page) && test_and_clear_pmem_poison(page))
 			clear_mce_nospec(pfn);
 	}
 }
-- 
2.54.0

