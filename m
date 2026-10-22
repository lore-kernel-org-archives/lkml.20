Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.250
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792672258;
	b=eBpYzyFUbkB92m7vLMQ2/nw0OiLUg3n7OnQ/tj+PMNye763j5Q489gjPXdnsi4r5n7Yo
	 MuWfagpIOBXDWiP1FbOVaX/9EhpCUVS6R82HzaSYho6Z6ic/5kbjn0aJ/Qwfb2SHFWG30
	 i8mUpNpM7XCH68NYkLQr5AXt/f8tcImjGE5B/V7H2FCtIxL5VedChp/fGSv0F9sFhuAlh
	 NyqfJ46FCIlnMR5mLLeBD5xejlngD5IcAqgssE8iLv2f0ciTP0BUfSLkJmfgE7TFf/Y0j
	 ohKSu7ebHu4xu6FRTZuePHx7TKjojHN97Lz4Rl09bXiBRfYFQlpF+rm31lWXX9a1wAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792672258;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=R1+QFn5NnYJLRrxfa1xiHyuj6P1mZ5EIMR+tXbGhrSo=;
	b=2XetN4Ga2L1xa1XeMDJFNLDxzUOyWiJaXcN8ID1THli7eCwrKaK2pc3d+p5oK44x1JAP
	 JQHSfaN18QdZVPMZQKxAKmM9sb8XnHclAJtWspwosOSs4JjUxnG+s7esRH1GrrE6Tx3k9
	 xCqgBll/T7t/6J5cjc1cBRUjAviSNn3OsXp5Wm6s8uSq80d+5QUO/0Hrwvohwz7QoUvO4
	 PG36bnICmR6VAWBawzkrwcjKHmV5V0aq9keCeSU9o5b1pdfrGM4lD05PVv7NNBO9nWbFs
	 yW711D64j37SBT9BCO8baAXwiClceyB5juRPxlWcNMI30rsYFpB36hFE6UaPbosmJSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=RibjKLMp;
	arc=none smtp.remote-ip=95.215.58.250
Received: from mta1.migadu.com (out-250.mta1.migadu.com [95.215.58.250])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 558DB606A31B
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 12:30:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 558DB606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=RibjKLMp
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=bcEFyXLNNN2YEegylVTbpISQSLNIpIMitdaFQngWC1c=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792672255; v=1; x=1793277055;
 b=RibjKLMp1n3ImBy3u6tyijm3geFzYvJ5rk0k8oclP0bj76BxzncTVzWxtaUScOqFBlvBoXUL
 c8EzmRaZOrjOdUVHMKE6LxC1sp71MJ6uGO13JW6XXuKjcXHaq2fOFbtiFveS74ySqhve0uBxgV1
 qyUJHoTqGYF7SGlcgNl2BGno=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 679f88ca96f9b2a8;
	Thu, 22 Oct 2026 12:30:55 +0000
X-Mizu-Trace-ID: 679f88ca96f9b2a8
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>
Cc: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Wei-Lin Chang <weilin.chang@arm.com>,
	Fuad Tabba <tabba@google.com>
Subject: [PATCH] KVM: arm64: Return on kvm_gmem_get_pfn() failure in gmem_abort()
Date: Thu, 22 Oct 2026 13:30:54 +0100
Message-ID: <20261022123054.31729-1-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
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

The kvm-arm64/mmu-fixes-7.4 merge dropped the return from the
kvm_gmem_get_pfn() error path in gmem_abort(). Both parents of the
merge keep that return. On a failed kvm_gmem_get_pfn(), gmem_abort()
then carries on with a zero pfn, and on a nested stage-2 it uses the
mapping it has just freed.

Restore the return.

Fixes: 65f95b2874a15 ("Merge branch kvm-arm64/mmu-fixes-7.4 into kvmarm-master/next")
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---

Notes:
    I went through the rest of the merge's conflict resolution with
    git show --remerge-diff, and this is the only line it dropped.

 arch/arm64/kvm/mmu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index a48f3f531e827..ba4fe58222ad5 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1802,6 +1802,7 @@ static int gmem_abort(const struct kvm_s2_fault_desc *s2fd,
 						      s2vi.vma_pagesize, write_fault, exec_fault,
 						      false);
 		kfree(mapping);
+		return ret;
 	}
 
 	if (!(s2fd->memslot->flags & KVM_MEM_READONLY))
-- 
2.47.3

