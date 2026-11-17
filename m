Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794899222;
	b=f1KZmNbFRjDYmNmJeaF1XBjUH4iAPCWj2sAg//7vQ8CwTA7hAgb+s9KpeEJv3nYUljdF
	 TWnqPhCPmLRknEsAmtDjHl7wFSbWmoAtaMtuwjrGxVo+hgCbGPsNQ5rLz13a3AVl+JZaQ
	 tTYKhhmXKweFiRact+m0jQwQN4Gzbx7ilSdqZP1PfvQ0dmTFB3MJhfRm4R4VeGyGNqCpo
	 kR8xhQeZIFKpsPqkszzUoAoHjfI9+Xtwq629bjDd7sGx3clZfpKrBg6gTg0kethNgAfsu
	 PELflAGMTdEuKmxSgrb48BgS+tqEwlaLp3okh/DHoABbvkRoQG2BJwsbynjbaYeDKsg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794899222;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=nACrQh/lUVEXvo7aMroISkZXlxFvhkHh8kUoWLWdwD8=;
	b=1YvZPb/jcCXDyf/ARWLugDMrclmswtHtAM+HebVbsagqHBBwRD0Sx3iMD9OwmWrw6bSK
	 3J6QSVsD1Sr06aG5kq4u6hEEFjaaoAxBLfVkzrzZlnaoKAwTlKpynSAFvdp74bOFTrVuR
	 RD6qi8SwQYtsA8cYghNFJuClb9wsm7dK6JtBIp4Mn14N8cERJKFmMF2Rem0gZaal+WkZ+
	 U4MgHU8PNbkMxgZboJxKh0Onbvt4PrrGlG0Fp75gwYEAUCOFenorxCYtqsFCgrRS3JISW
	 6p/3KOH9hbaImz3xWH5njHgVZiDYBMvAYwinjKJeyzb2C9rCPO3sv3CNt9qsES0oj4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=pudUAiSd;
	arc=none smtp.remote-ip=220.197.31.5
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8BBB606A885
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 07:06:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8BBB606A885
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=pudUAiSd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=nA
	CrQh/lUVEXvo7aMroISkZXlxFvhkHh8kUoWLWdwD8=; b=pudUAiSd5oX/OLw4ex
	VeoK60dUDySIAPvAu7d4Sy6ZUnsWfSmEmQtodQZNRB6rzdwaIazW8R2dsRJwkGJy
	ieb9xIqWPIB5RIjifpgZWww+nuTrNV6ArTbjTXfQXNqSkH/jUshagJbyclZj3dK5
	hpP260TcddnNlldDXJjcI0bmA=
Received: from 5219-2604 (unknown [])
	by gzga-smtp-mtada-g1-1 (Coremail) with SMTP id _____wDn79ri_Ptqb6D_Hg--.51983S2;
	Tue, 17 Nov 2026 15:06:20 +0800 (CST)
From: Xionggui Chen <evers_chen@163.com>
To: akpm@linux-foundation.org
Cc: david@kernel.org,
	shuah@kernel.org,
	ljs@kernel.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Xionggui Chen <chenxionggui@lanxincomputing.com>
Subject: [PATCH v2] selftests/mm: handle implicit read permissions in madv_populate
Date: Tue, 17 Nov 2026 07:06:06 +0000
Message-ID: <20261117070606.3752-1-evers_chen@163.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261112031811.56500-1-evers_chen@163.com>
References: <20261112031811.56500-1-evers_chen@163.com>
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
X-CM-TRANSID:_____wDn79ri_Ptqb6D_Hg--.51983S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxJrykWw1UXw4UKr17AFWrZrb_yoW8ZrWkpa
	48Jw1YvF4rJF17Aa97GF1xXrZY9Fn2yF48Zw1rWr9IvwnxKFy8Xr47KayjkryktFZ5X3Z5
	Zas8ur9Iva4DJFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07j2_M3UUUUU=
X-CM-SenderInfo: xhyh22pbfkv0i6rwjhhfrp/xtbC7A4UHmr7-O7iJAAA3t

From: Xionggui Chen <chenxionggui@lanxincomputing.com>

The madv_populate selftest assumes that mmap(PROT_WRITE) creates a VMA
without VM_READ and expects MADV_POPULATE_READ to fail with EINVAL.

On RISC-V, commit 6c7559f22b6f ("riscv/mm: ensure PROT_WRITE leads to
VM_READ | VM_WRITE") makes the kernel set VM_READ for mappings requested
with PROT_WRITE. MADV_POPULATE_READ checks this VMA permission, so it
succeeds and the test fails incorrectly.

Adjust the expected result for RISC-V using an architecture-specific
conditional, while preserving the existing behavior on other
architectures.

On RISC-V with Linux 7.2.0, the original test fails 1 out of 16 tests,
while the updated test passes all 16 tests.

Link: https://lore.kernel.org/20261112031811.56500-1-evers_chen@163.com
Fixes: e5bfac53e310 ("selftests/vm: add test for MADV_POPULATE_(READ|WRITE)")
Signed-off-by: Xionggui Chen <chenxionggui@lanxincomputing.com>
---
Changes in v2:
- Use an architecture-specific conditional for RISC-V.
- Remove /proc/self/maps parsing.
- Remove the additional PROT_NONE test.

 tools/testing/selftests/mm/madv_populate.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tools/testing/selftests/mm/madv_populate.c b/tools/testing/selftests/mm/madv_populate.c
index 7fce5d0b622b..fa26ca2d8cf6 100644
--- a/tools/testing/selftests/mm/madv_populate.c
+++ b/tools/testing/selftests/mm/madv_populate.c
@@ -81,8 +81,13 @@ static void test_prot_write(void)
 		ksft_exit_fail_msg("mmap failed\n");
 
 	ret = madvise(addr, SIZE, MADV_POPULATE_READ);
+#ifdef __riscv
+	ksft_test_result(ret == 0,
+			 "MADV_POPULATE_READ with PROT_WRITE\n");
+#else
 	ksft_test_result(ret == -1 && errno == EINVAL,
 			 "MADV_POPULATE_READ with PROT_WRITE\n");
+#endif
 
 	ret = madvise(addr, SIZE, MADV_POPULATE_WRITE);
 	ksft_test_result(!ret, "MADV_POPULATE_WRITE with PROT_WRITE\n");

