Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.217
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793883467;
	b=EyyRJoYJ1tZavk/AceSAPUFQmIjo4e406VxI5Rw2Q3kDOY5XpOOIsIUwCX9TrLKimE2Y
	 5jYhh6s/lrrnIAWrNA4gaKve2h7JExojlXkuBXLcblXVPugZx1f73n1yj4KQDC6HPilpC
	 m5RMy7jNNTcrJbWVsT9nKFAa7QvQenR7Gc8ihoTchRZ2vIubi0NhmjGdFIf9URRMgLUMa
	 ImTm9+s77gIDsSBE+o7PHe95wDQ06oVCkFRW/nB8+Iu3Hl+vBtZ2pmFp93yekTpKhhpcA
	 3Z7YJ8PcrlyIIaTqX3ighz8J+IAgY4/Lo2wKCz3DqRBjFmzSTPFX7jng4PZviJr8yoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793883467;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=072gWrHZKrGLJt0o7ILLBkyYldVwOPn5kpDvpqOGCOs=;
	b=GF7OCc9phsycPAMkyAXelbggP/Yd6gAg4X0BOqu/ggzUrYNftbA1jW8COGMixVDPGyte
	 31arpEOE9NFFfS5+aaiQqfR8iEGxealNwoS864HdW/ZavYJFh8D4a63jxmO1k3AdbdCQq
	 9Px60SMigC7JGfjepeAxlP8XcFc1bzFXStfF9Ni0gNm+iBtPGJMPnhJhCoBEZsJmSEwq3
	 ByuRqv4PEe/TGTVplLeUHg0R9kXjUG4qmMhVqLRuUvEvLmrAwDs5i1ri1V65mlkOQ0LH8
	 nojAxbEa6pSNjPyqwXNF5pR6/l0KfjyRswipDIrcIuclG9mrmM07MAUzts6l0UlyIlQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=C0lhJ9Qa;
	arc=none smtp.remote-ip=113.46.200.217
Received: from canpmsgout02.his.huawei.com (canpmsgout02.his.huawei.com [113.46.200.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56502606A31B
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 12:57:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56502606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=C0lhJ9Qa
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=072gWrHZKrGLJt0o7ILLBkyYldVwOPn5kpDvpqOGCOs=;
	b=C0lhJ9QacQ5QWV1jjuD9K6ur0ERfRxW2k8koHLpChkYY/xxLPuUND1OGZxCLbLfy/1n5nYMgW
	MUKMNimBpIl/C4ya9iPq1gUm0W8WvB2zkBN7ENcIRwOAr1TsRvEQKh7tbDSvQ+UuG+QcnH5ye8/
	w9/mLo4MO/PBukVsOiggihg=
Received: from mail.maildlp.com (unknown [172.19.163.0])
	by canpmsgout02.his.huawei.com (SkyGuard) with ESMTPS id 4jL2QJ4g74zcb0X;
	Thu,  5 Nov 2026 20:57:12 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 80DFC40561;
	Thu,  5 Nov 2026 20:57:41 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 5 Nov
 2026 20:57:40 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <mark.rutland@arm.com>,
	<rppt@kernel.org>, <baoquan.he@linux.dev>, <sourabhjain@linux.ibm.com>,
	<coiby.xu@gmail.com>, <bgwin@google.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH v8] arm64: kexec_file: Fix elf_headers memory leak in retry loop
Date: Thu, 5 Nov 2026 20:57:24 +0800
Message-ID: <20261105125724.2283453-1-ruanjinjie@huawei.com>
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
Content-Type: text/plain
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 kwepemk200008.china.huawei.com (7.202.194.74)

A retry allocates new elf headers and overwrites image->elf_headers,
leaking the previous buffer.

Free it before assigning.

Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Thomas Huth <thuth@redhat.com>
Cc: Breno Leitao <leitao@debian.org>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: Baoquan He <bhe@redhat.com>
Cc: stable@vger.kernel.org
Fixes: 108aa503657e ("arm64: kexec_file: try more regions if loading segments fails")
Acked-by: Catalin Marinas <catalin.marinas@arm.com>
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
v7 -> v8:
- Split out from the patch set as Mike suggested.
- Link to v7: https://lore.kernel.org/all/20261026075201.699550-1-ruanjinjie@huawei.com/
---
 arch/arm64/kernel/machine_kexec_file.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/kernel/machine_kexec_file.c b/arch/arm64/kernel/machine_kexec_file.c
index 854d872dfd0f..beb0b8585454 100644
--- a/arch/arm64/kernel/machine_kexec_file.c
+++ b/arch/arm64/kernel/machine_kexec_file.c
@@ -112,6 +112,10 @@ int load_other_segments(struct kimage *image,
 			vfree(headers);
 			goto out_err;
 		}
+
+		if (unlikely(image->elf_headers))
+			vfree(image->elf_headers);
+
 		image->elf_headers = headers;
 		image->elf_load_addr = kbuf.mem;
 		image->elf_headers_sz = headers_sz;
-- 
2.34.1

