Received: from mta1.migadu.com (out-146.mta1.migadu.com [95.215.58.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 180BD344DBD
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 05:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788413755; cv=none; b=dY8g1/8zXBLnH0QiLqarLc49JMCOVtwlReNqY+czC2EknZqiReVPNLiKsoRZ10GMit8rWCH4IxHlDi7DpOlUty+Ei1/KwZRbMGJsLQRgD+pDcaNVKZ+KKUSuVSaQRt0tc/WWdPT7vsMt9kx1pgfWNvQyiPfNI5hAOLtGmuKM/CA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788413755; c=relaxed/simple;
	bh=93pTWbsU7VFpR8xoXZI9mqztNPbLz1pkgKR/z1zYXGU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=j+o9+XIxo396Jgs5E/SQkpjX8bZ7OhxRnLRSRMcXDddi4ryYEkClzaDD/AMsziM4K822K82e9Xo3h3wxItEVvKbWlKgywss2AXtTDA8ejCC8e6iX+txe3ZmfQwiLXjeabkXZYDTPktE/Dyplf3og7qLtCDVNzzJiBx+LfQMCFoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Iq22ldOx; arc=none smtp.client-ip=95.215.58.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Iq22ldOx"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=93pTWbsU7VFpR8xoXZI9mqztNPbLz1pkgKR/z1zYXGU=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788413750; v=1; x=1789018550;
 b=Iq22ldOx79bbN3+w/Bi7g2CADtPV4/8lvNjyZnuBGj2FNDY66bzF60r9MYAcvEjlBbdC10ZP
 NImDJ9mGXXKNQ09A4dFafi7Blrbzr2sVGzkSQ0g8lPRnalEMjfSFx2Nox/Fr8O0++ROIgLUswfv
 w7SQRHlfE5TqcPF716O96EaU=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 971ac4ed40a996d8;
	Thu, 03 Sep 2026 05:35:50 +0000
X-Mizu-Trace-ID: 971ac4ed40a996d8
X-Migadu-Flow: FLOW_OUT
From: Kaitao Cheng <kaitao.cheng@linux.dev>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R . Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Dan Williams <djbw@kernel.org>,
	Vishal Verma <vishal.l.verma@intel.com>,
	Dave Jiang <dave.jiang@intel.com>,
	Alison Schofield <alison.schofield@intel.com>,
	Ira Weiny <iweiny@kernel.org>
Cc: Muchun Song <muchun.song@linux.dev>,
	linux-mm@kvack.org,
	nvdimm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Kaitao Cheng <kaitao.cheng@linux.dev>
Subject: [PATCH 0/2] Make HWPoison helpers config-independent
Date: Thu,  3 Sep 2026 13:35:33 +0800
Message-ID: <20260903053535.17611-1-kaitao.cheng@linux.dev>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make the HWPoison page flag's test-and-set and test-and-clear accessors
available regardless of CONFIG_MEMORY_FAILURE. When memory failure handling
is disabled, the accessors return false, matching the absence of HWPoison
state and providing a consistent interface across configurations.

Use the config-independent interface in the pmem driver to remove its
private test_and_clear_pmem_poison() wrapper and the associated header
dependency. No functional change is intended.

Kaitao Cheng (2):
  mm/page-flags: Define HWPoison test-and-change helpers unconditionally
  nvdimm/pmem: Remove test_and_clear_pmem_poison()

 drivers/nvdimm/pmem.c      |  2 +-
 drivers/nvdimm/pmem.h      | 12 ------------
 include/linux/page-flags.h |  1 +
 3 files changed, 2 insertions(+), 13 deletions(-)

-- 
2.50.1 (Apple Git-155)

