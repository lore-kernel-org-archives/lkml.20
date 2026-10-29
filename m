Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.236
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793295056;
	b=0CfSNwTDphgODekOyGLzuFEac+vV6GpnGwiKWJOC41RqvY7N92+z5Gw7+ZdYZYaOWNFK
	 n71VIWoEOm0WkD1Pru1BxCwDLylPMvrOfRHdv3nkjb0tQ18Y+h1QlQKQu0IAcrsp0n/er
	 hS5RDHb2zWZFwfEEg49I3Prin3tpe6gsKwpFPZVgCXs2SPfJ9euetxI/2Vu7ISBLVl2NE
	 2ibkWNCwfe6oq6ZLdOdzEUSVb1FVdDC6NfqYpj+plF3fF2ZsylKtMMqH1RDTLCs44xEj0
	 V5xcQ93Wk3ijRf7304IOpt46TLj6gaSAJjAuvNT9JAnGGZTQDpKLTvb5aLJ79eBRS4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793295056;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=YeQsqnpkwn6ypXN7vyNImbLG7QIbHLNRV1Ffg9tI2a4=;
	b=txM3/O1GuHG/boOsMJrP+4qtsdDN90wlretLS2R0NsQExb1unm7dflu4YAG3SpUTJZB6
	 EI9Arqhh2I8EVaOXjXbqcoCgZTbHS+fmSqCv4Cw2FA3lfb2S3Wli29E0BPwkQTZeFENZr
	 naJYPGqce4w3CLh0w51oVu952dU/LBRq1Sq36M2p0uc4EuQ+8sto9LzCgc53dhNI3lILS
	 i95lTseHnR+M3ERpB9cjEVcmUyklJk/witUwLsx4r3cP7xZunMGip8nCFswoA5rYsfV8s
	 /Koxu+uYOUDpia4X6N9wIX1ndO5WZplJogfFpo63Qc/OQZIGmsalTfZVHzO1FidO3kA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=FpX9XV92;
	arc=none smtp.remote-ip=95.215.58.236
Received: from mta1.migadu.com (out-236.mta1.migadu.com [95.215.58.236])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CE9A606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 17:30:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7CE9A606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=FpX9XV92
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=5xQkj3N9yiVJ8AVum9FtJNkr8nMttgbgXIeAZWsu7R4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793295053; v=1; x=1793899853;
 b=FpX9XV92A0v/B1Tp65pVnzHFflZPsb/Paqgp5DTXqZzfwEOcbIYDvyjn/jkvkoHcKBLGzh0/
 6unVyNBofcX839jRDqKW1UmW2dv6/m5EhOwc+cVK5Nc6TT90RVisiUXypBi6CNimLs9DaW7jg8/
 74i75g7i084UaIvQJWOHH12o=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id e9111306d7fcf669;
	Thu, 29 Oct 2026 17:30:53 +0000
X-Mizu-Trace-ID: e9111306d7fcf669
X-Migadu-Flow: FLOW_OUT
From: George Guo <dongtai.guo@linux.dev>
To: rppt@kernel.org,
	pasha.tatashin@soleen.com,
	pratyush@kernel.org,
	chenhuacai@kernel.org,
	ardb@kernel.org,
	shuah@kernel.org
Cc: ilias.apalodimas@linaro.org,
	akpm@linux-foundation.org,
	baoquan.he@linux.dev,
	ruirui.yang@linux.dev,
	guodongtai@kylinos.cn,
	kernel@xen0n.name,
	graf@amazon.com,
	liukexin@kylinos.cn,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	kexec@lists.infradead.org,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-efi@vger.kernel.org
Subject: [PATCH v6 5/8] LoongArch: Allow memblock arrays to resize
Date: Fri, 30 Oct 2026 02:29:52 +0900
Message-ID: <20261029172956.20791-6-dongtai.guo@linux.dev>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261029172956.20791-1-dongtai.guo@linux.dev>
References: <20261029172956.20791-1-dongtai.guo@linux.dev>
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

From: George Guo <guodongtai@kylinos.cn>

LoongArch never calls memblock_allow_resize(), so the reserved region
array cannot grow beyond INIT_MEMBLOCK_RESERVED_REGIONS entries
(INIT_MEMBLOCK_REGIONS + NR_CPUS).

After kexec, kho_memory_init() reserves every range preserved by KHO.
Each range that is not adjacent to another one needs its own entry, so
with enough scattered preserved pages the array overflows and the
incoming kernel panics:

  Kernel panic - not syncing: memblock: cannot resize reserved array
  Call Trace:
   memblock_double_array+0x2d4/0x2f8
   memblock_isolate_range+0x54/0x1a8
   memblock_setclr_flag+0x44/0xe0
   kho_preserved_memory_reserve+0x78/0xb8
   ...
   kho_memory_init+0xbc/0x394
   mm_core_init+0x124/0x154
   start_kernel+0x568/0x6dc

The liveupdate luo_stress_files test with 500 files triggers it on a
kernel without CONFIG_SMP, where NR_CPUS is 1. With CONFIG_SMP the
array is larger and the test passes, but more preserved memory still
overflows it.

When the reserved array is full, memblock allocates a bigger array
from free memory. This is only safe once all memory in use has been
reserved, so enable resizing in arch_mem_init() after the firmware,
kernel and initrd reservations are made.

The memory preserved by KHO is reserved later, in kho_memory_init().
A new array cannot land on it either, because kho_populate() already
limits memblock allocations to the KHO bootmem areas, which hold no
preserved data.

Co-developed-by: Kexin Liu <liukexin@kylinos.cn>
Signed-off-by: Kexin Liu <liukexin@kylinos.cn>
Signed-off-by: George Guo <guodongtai@kylinos.cn>
---
 arch/loongarch/kernel/setup.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/loongarch/kernel/setup.c b/arch/loongarch/kernel/setup.c
index 6fa4a22a58fd..dff2e0c67ea0 100644
--- a/arch/loongarch/kernel/setup.c
+++ b/arch/loongarch/kernel/setup.c
@@ -402,6 +402,9 @@ static void __init arch_mem_init(char **cmdline_p)
 
 	check_kernel_sections_mem();
 
+	/* KHO may restore more reserved regions than the initial array holds. */
+	memblock_allow_resize();
+
 	memblock_set_bottom_up(true);
 
 	swiotlb_init(true, SWIOTLB_VERBOSE);
-- 
2.53.0

