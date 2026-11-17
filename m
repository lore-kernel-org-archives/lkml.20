Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.99
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794880237;
	b=ZAQPKOPIlfvZXyX42shq1olVP3mhHsUWcBJZSk4qGuK+gOO1ceThMDdMVLI7NDm/dICK
	 U79HfOup3xJJv3No0VOVp+YPlmbo1a0fimAaIAAagg61HtnEQUpRdC8JvfGLL4XiBw2hs
	 0Li/x8sm4ys+hrPop5geTTF3Urz/Busts/1IVJOMpWAIQTRdW5UHV5qXC6X7i8Yhf3Snm
	 YzDDiNoExMD3US8FgVuShEGxd8IrAGb5Kp6drI7j5FKbeuHA6Bqu63SIuUnXi2vEB7nXh
	 EequTRed5bfCX4fO1zfgPUM00Lak1gzHFYVZuseqSaaG/0TFTItAnB+XA3lt9PXjCTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794880237;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=lmqG4T85wzH+EvkxPYNS8DJ2icFTQEKM/mrAvrY7aA8=;
	b=vYooBNo/HvLUmI61JfRl2qBdY6bzFEVMgmZFjK1jl99+GXkW4YJIIuyjx5F3qBJkqapJ
	 rJR2I5oCMNoRVMa9e0CiQElB6Gb8Fb7+he6oelfAgTXob5IdK6m0PM/DDZOrUjuNwaNVv
	 SPSBt99+hVqLH1dmjcGiWPiTrn+2nz2yW7oSluXCCVTFsg/KcuZZ+tA/QdgIGjj8mEIIq
	 eCb0VNgvtc3ynuPMld3MB022LVWQlj4NJ26GgYsxG75n/x6sJCw4Ct4zmT6sJEBMoMVQl
	 n+QrNbC11c+RITnbQ11xA3JMbbcwcBKBdZ0p9YZz32ZilvnA4jFDjbhcpkffK1t8uFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=HKFqPnH3;
	arc=none smtp.remote-ip=91.218.175.99
Received: from mta0.migadu.com (out-99.mta0.migadu.com [91.218.175.99])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1837E606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 01:50:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1837E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=HKFqPnH3
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=/IMAEuYJ6PcwjzqBNjJhlIuqxkqlOoUlO6uHl/vn3GI=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794880234; v=1; x=1795485034;
 b=HKFqPnH3Qt/0v320IBWwEgPKA9soAOJhsAVhoLMQmtkvk17FUTPtOkR5lYEBLNN7p2H2SpCE
 9YsRqrzSULHZNuwLQv/zXcTMurvkULB4p17VsuZzF0b+uw3XnMIGeZ6V90N5BkwPXeM0OTQB2kG
 HHrNozmojexSFDW7sjJ0XLYo=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id 472675b50f597a85;
	Tue, 17 Nov 2026 01:50:31 +0000
X-Mizu-Trace-ID: 472675b50f597a85
X-Migadu-Flow: FLOW_OUT
From: "Xu Xin (vivo)" <xu.xin@linux.dev>
To: David Hildenbrand <david@kernel.org>
Cc: chengming.zhou@linux.dev,
	ljs@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	xu.xin@linux.dev
Subject: [PATCH v4 0/2] mm/ksm: clean up scan_get_next_rmap_item() initialization
Date: Tue, 17 Nov 2026 09:50:09 +0800
Message-Id: <20261117015009.611551-1-xu.xin@linux.dev>
X-Mailer: git-send-email 2.34.1
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

Currently, scan_get_next_rmap_item() has grown quite large and complex.
When introducing new features, such as the only-merge-zero-page mode we
are currently working on, we don't want to add more complexity to it
and don't want to touch rmap_item structures to avoid unnecessary overhead,
so we need to extract some common logic.

With these changes, the entry of scan_get_next_rmap_item() becomes much
cleaner and easier to follow, instead of being cluttered with unrelated
boilerplate such as stale stable_node pruning and cycle initialization.

Let's start by cleaning up these two parts at the beginning (where I think
abstraction is necessary), and we can continue cleaning up further if
needed later.

Changes in v4:
- [PATCH 2/2] Drop redundant comment in scan_should_start_new_cycle() and
  update the comment in scan_get_first_mm() to refer to
  scan_get_next_rmap_item()'s list_empty() check (Lorenzo).
- [PATCH 2/2] Add Reviewed-by tags.

Changes in v3:
- [PATCH 2/2] Initialize mm_slot = ksm_scan.mm_slot in the else branch when
              continuing the current scan cycle, fixing an uninitialized
              variable warning/bug (kernel test robot).
- [PATCH 2/2] Drop Lorenzo's Reviewed-by tag due to the v2 bug fix.

Changes in v2:
- [PATCH 2/2] Rename scan_begin_new_cycle() to scan_should_start_new_cycle
              and keep it simple (David).
- [PATCH 2/2] Keep lru_add_drain_all() in scan_get_next_rmap_item (David).
- [PATCH 2/2] Use scoped_guard(spinlock, &ksm_mmlist_lock) in
              scan_get_first_mm() (Lorenzo).

Xu Xin (vivo) (2):
  mm/ksm: extract helper functions for scan cycle cleanup
  mm/ksm: add initialization helpers for scan_get_next_rmap_item()

 mm/ksm.c | 101 +++++++++++++++++++++++++++++++++++--------------------
 1 file changed, 65 insertions(+), 36 deletions(-)

-- 
2.34.1

