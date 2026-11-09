Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.57
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794203866;
	b=bUMT61+6AuyovmN4ZtLHht1Luoqn8sYLGxcHMHggH1x5MW7uOcRmVssuP4LfvQfj5nF/
	 BuAh6hmIWsbLNUd6mfNskFylau8ssqEUxrMGtujm1ktgYibj5iHngDNXc3zjVAD7JrRF5
	 c5cvDpfltFfao/shVZ4SRT4incH+nzyDlDg0iQZfl6vJov+iqBYpHRjbQym4+I0ccgxzi
	 pN0aJGsbIphh08MwdVqEo1FVijMk43LYw08uHahH/chnF6FLE9hJZWC/istj6q0p2py1R
	 WSdlSZEKEq1dB+c4TRitx/nfiDZHNiQH9+sZXp2xcpMBf7LAa1V6g3oJgoX2mywRMNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794203866;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-type:
	 Content-Transfer-Encoding;
	bh=ebB8Hm9YJhqZLTIB/BIU80u2OvfAEgQxHB5v4VkTido=;
	b=iuZ81XDUuJ6UdrsAAOTAEB1ij/U1NlF/guA1++/dtppynej7bpPqBbAB454UB+OzpCc0
	 evaCXxgyErcsl0AVCjMNaZ7bAv5doE2/rQ01Z73uwho1tvDm9qBAF2vo7+GLA2O0TPGBm
	 BKQLPfKh1TLPT4KC9+8Vci88+dNAL/BNcmvYlsFJenx4OwYzlMGq5QN5HdXkwsjkIgH6Q
	 nfIJx5AEuwMGZaxLQjjNL2XJ7n7kyM6tAm4fEp7nupVuSmhk2/sKIPt/lD6banHUJa7CM
	 HKbgKTISloblhlUWMaYJr8mwltZCdauM/FIkqc/6EbbsmdMeNAkSoDQTSw3SCD8kl9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=ITSh4BjZ;
	arc=none smtp.remote-ip=95.215.58.57
Received: from mta1.migadu.com (out-57.mta1.migadu.com [95.215.58.57])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DDD1606A333
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 05:57:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7DDD1606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=ITSh4BjZ
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=ZTeW0ziV8/P/g9Y3o2HU3l2GCGlpCYxshzszGc/a3ck=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794203863; v=1; x=1794808663;
 b=ITSh4BjZZSuTXFFlpt+NaWm8E8akqoztRa1SQh93VFJQaGTU9vGGyTXp2ywBWMIzooNC8buM
 4vs4ZadBTkhm2Pm8wOowr2iJIrbrne5Zx77MK/CyB+Wp8vkGFT2MWhW1NnpRqJbFO7QpDV3qDRV
 7LC8fHWUn7t/KC19+9BYyNMQ=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id 80b09a951c8e8f3b;
	Mon, 09 Nov 2026 05:57:43 +0000
X-Mizu-Trace-ID: 80b09a951c8e8f3b
X-Migadu-Flow: FLOW_OUT
From: Baoquan He <baoquan.he@linux.dev>
To: linux-mm@kvack.org
Cc: akpm@linux-foundation.org,
	david@kernel.org,
	chrisl@kernel.org,
	kasong@tencent.com,
	nphamcs@gmail.com,
	baohua@kernel.org,
	youngjun.park@lge.com,
	corbet@lwn.net,
	hannes@cmpxchg.org,
	chengming.zhou@linux.dev,
	kunwu.chan@gmail.com,
	klarasmodin@gmail.com,
	linux-kernel@vger.kernel.org,
	Baoquan He <hebaoquan@kylinos.cn>
Subject: [PATCH v5 19/19] mm, swap: skip the overcommit probe when removing xswap
Date: Mon,  9 Nov 2026 13:54:55 +0800
Message-ID: <20261109055455.536925-20-baoquan.he@linux.dev>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261109055455.536925-1-baoquan.he@linux.dev>
References: <20261109055455.536925-1-baoquan.he@linux.dev>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit

From: Baoquan He <hebaoquan@kylinos.cn>

swap_info_remove() probes whether Committed_AS still fits under the
commit limit left after the device's pages are subtracted. An xswap
device's pages are its address space, not backing storage, but they
raised the commit limit at creation. A workload can commit into that
headroom, after which the probe refuses to destroy the device.

Skip the probe for xswap until the overcommit accounting for it is
settled. Real swap devices keep the existing protection.

Signed-off-by: Baoquan He <hebaoquan@kylinos.cn>
---
 mm/swapfile.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/mm/swapfile.c b/mm/swapfile.c
index efb48ef71611..84b9a8dddff2 100644
--- a/mm/swapfile.c
+++ b/mm/swapfile.c
@@ -3736,10 +3736,17 @@ SYSCALL_DEFINE1(swapoff, const char __user *, specialfile)
  */
 static int swap_info_remove(struct swap_info_struct *p)
 {
-	if (!security_vm_enough_memory_mm(current->mm, p->pages))
-		vm_unacct_memory(p->pages);
-	else
-		return -ENOMEM;
+	/*
+	 * The device's pages are its address space, not backing storage.
+	 * The commit limit it added may have been committed against, so
+	 * skip the probe until the limit stops counting that space.
+	 */
+	if (!(p->flags & SWP_XSWAP)) {
+		if (!security_vm_enough_memory_mm(current->mm, p->pages))
+			vm_unacct_memory(p->pages);
+		else
+			return -ENOMEM;
+	}
 
 	spin_lock(&p->lock);
 	del_from_avail_list(p, true);
-- 
2.54.0

