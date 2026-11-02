Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.225.138
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793627126;
	b=UT25Xha0Haz/OlW05eLu9yCGNqVOmEvvrCLLupE3P9e3QIpukz2rohp48ENYDurid3Tc
	 iDaq69ba3rINZiOHKLCtRJsoyNWEmMNEgmIwoq4LRwxUKHtg8JWpuRXlaXGRza05VgOIv
	 D+2iEq4RX4L3XfZf0lmDKASYDHuME7WNeimPUpmMB+DgEye31AUCLE83VGRmBORB2W4E7
	 Yf0qyFcVNCQvdHjx/YwJAzrcZA7O683Fan8fbHdyW+ZdXrRJl1rT4KgeZxsGlkEKf1UOV
	 T2aCZHfGZG3YddPOeTnHMLpCnowpgnQ2psaCJlnLsIqNEKu+p7yWOpiXpmdvIi9ZI8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793627126;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=UUcrbJLOOZAs9Qd9MyHCkEc9mio81RdYYZ8wU36Zvg8=;
	b=YipVZZr7IZr+oO82+pI5trBhuxPKoxADJPF36T+WSuPJubyMd8a8KQK/AU1DBHNkLYug
	 pinbRboTXDTAvFMhGqoeb/PJgl8KedyKv1hJmrE8ytBDfc4sxa5k2Q7NPfmdtnjzxcmSv
	 DpvJjfFBNkinOwZfO1rx94ACFrgSfI6Ffl/x0sJlX0pxm9RvorzBXfG/qrcewJwaLUoJH
	 IqSeEmk31MzNKNADQC80duH1rIHYDkc1g4YECxk/0wHOmIz+3/W/adFjoYX0h9hW7gSGg
	 a3V9uMr4lLuJoJDoid1nzuk9LxoCHGrba+drQIPFHP+rzG+qbpJ59ARfMkRYgLEm+DA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Wi0s96UN;
	arc=none smtp.remote-ip=74.125.225.138
Received: from mail-wm2-f10.google.com (mail-wm2-f10.google.com [74.125.225.138])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13FD4606A332
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 13:45:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 13FD4606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Wi0s96UN
Received: by mail-wm2-f10.google.com with SMTP id 5b1f17b1804b1-4a16dfb8fa6so16971785e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 05:45:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793627124; x=1794231924; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UUcrbJLOOZAs9Qd9MyHCkEc9mio81RdYYZ8wU36Zvg8=;
        b=Wi0s96UNDMEbrn4oXw+/noNLLqJcRjyeHucyN7U3t2uHATIPB73CJMS/Jh2U0XBz/g
         jz0wtuNUxeGkkaDukJNhAXOmmsFeZ/r3TWbqwowNDWccOnw2VAGyOZS4EdE/6gc4fjJH
         FUQS70So+hz/CPlK52JQVdsJiVP2ccy7AyIT4h9yR7R49K+OesGNEZc7bkdeDnlodbE3
         okR6kEHuaexgBMUsgrvG4hYAk8SuDTzVB9jTUxpHhLVAroje5ARcCVJgnzF84imM8/Cy
         XFN1qdTOnMU2gMasOghI9cWthWh0AwOrG0znCx2VHSeZG46Itw29YgivRT7/IcXLkprb
         nQVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793627124; x=1794231924;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UUcrbJLOOZAs9Qd9MyHCkEc9mio81RdYYZ8wU36Zvg8=;
        b=TB3sKA+NTg8LesaMlHYFJJ8w5/yVE3Dq0wWTq43eWkMv62zDMAuLIjbqstf3SsIPgK
         D15HOqpRN5VyEAEV15V8bvypqcIBlMEd62Zh0k2nwjvax2spV0Zu3J3BqpZIHgfBjiVu
         5s94XZ/7cO6/iXe5ECuT4T85kNezGqC9fOAo5U4C2HRzWRTNYQ1Ft5+/ZXT5qwWzzWH6
         TMtfQ2VNC1QVi889QQ7mfth9Lm23F0bE91wI8CBcB0oH51vKAZdcBzGwkXpSxReOYiWj
         hgJzw/Shs0ItePIm6Psp2xOLaAKwt6edfs6XrcyToBZ07VTa/voDer7V+81A0JI/EsQq
         qefQ==
X-Forwarded-Encrypted: i=1; AKwUvBxccoXZNQadpDpQPgNRuEkz0+Y+/AqXrTOPvHzEVcmM3W7fhkqpnrygtEvjfPBGzTTI6ZMc/0g1nLIUYHQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYIH19GMGnc1OcH2pp82J58aWbeqOIknf65plfh7L07PQP0RAMXf
	1Q2dhNqj/1arxe4D4RE4aHexACF0Ry/2PCVwmO9M/UlIFJuKRrl7VH+q7o6GzgN6
X-Gm-Gg: AYBFou0aY0EhJta3zmaiT030ubuClD08PVWucqjYBL4B818gnTg2+JnJrERCIByCA/p
	kUHTq0Ps/5XgnJcs2TkSatGpPq0Fx34gz7mmsVCPFd6xYC2oSSvcjbZc0LgP/tYyu72ntyC6Uww
	CRrkQUEH4eKcPJvoDPkdhhH5q48xLwCBy/7R+Vt4aI7Zhe37Osvp36n5jzyxvOCe1fTlba4PiKz
	D+m8GXxko9dOuVKOhTTUdHpuCtvoiUT726EQr7wYqq/Ssho4/BI6ZqfMocfpqrhKHcOX+P54IPt
	tNJhIebIugJyoXkvt6vu3GksbVmKL7tI/2bR+d4EPiSZDr4VnnmRjvIFL0II8xoA1RV65S+oyjV
	6ONJ5zPuMiDg6BKZsELQGxqttq6JY9/IQiLOiCfgpo7MF2VFaXUlxrYR3Y1Zjhu3RyXNGA7Wgfr
	EV6Yw5pVJt/bvtHaUcgHARO6Ui+c6B/MHaiXT058S+SBMNRQvRujkVTWRljqQwHtQNesOiKPTuZ
	bDOy6gyGJP3wOiAIxXA9UTBIGJ5+3iYw9rft1DmYaYhJSecGwzJOAMGmOJzuMVWezoyAMDo166n
	2m3NuYI4dtmhqezxGqIeCa83TG9D8aM6O6cYi3ehbe7QpZdGa4dVkt4=
X-Received: by 2002:a05:600c:1f87:b0:4a1:f68a:9736 with SMTP id 5b1f17b1804b1-4ac17b2be08mr233027865e9.26.1793627124284;
        Mon, 02 Nov 2026 05:45:24 -0800 (PST)
Received: from workstation.. ([110.93.227.81])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ab61d8b9f4sm319164755e9.12.2026.11.02.05.45.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 05:45:23 -0800 (PST)
From: Ali Tariq <alitariq45892@gmail.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-riscv@lists.infradead.org
Cc: Alexandre Ghiti <alex@ghiti.fr>,
	Vivian Wang <wangruikang@iscas.ac.cn>,
	Yunhui Cui <cuiyunhui@bytedance.com>,
	Muchun Song <muchun.song@linux.dev>,
	Mike Rapoport <rppt@kernel.org>,
	David Hildenbrand <david@kernel.org>,
	kasan-dev@googlegroups.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Ali Tariq <alitariq45892@gmail.com>
Subject: [PATCH] riscv: mm: Add KASAN shadow mapping to flush_cache_vmap()
Date: Mon,  2 Nov 2026 18:44:21 +0500
Message-Id: <20261102134422.610837-1-alitariq45892@gmail.com>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

flush_cache_vmap() sets a per-CPU flag, and a kernel page fault
that finds the flag set gets an sfence.vma and a retry.
flush_cache_vmap() only sets the flag for vmalloc, module and vmemmap
ranges. kasan_populate_vmalloc() maps new shadow pages and calls
flush_cache_vmap() on the shadow range, so no flag gets set.
For vmap()-style areas, kasan_unpoison_vmalloc() writes
the new shadow right away. If the CPU hasn’t seen the new entry yet,
the store faults, and since there is no flag set, the kernel crashes.

[    0.675216] Unable to handle kernel paging request at virtual address fffffff7c009a000
Current swapper/0 pgtable: 4K pagesize, 39-bit VAs, pgdp=0x0000000004504000
[fffffff7c009a000] pgd=000000009ff6e001, p4d=000000009ff6e001, pud=000000009ff6e001, pmd=00000000400e7401, pte=00000000403cb0e7
status: 0000000200000120 badaddr: fffffff7c009a000 cause: 000000000000000f
__memset+0x60/0xfe
kasan_unpoison+0x26/0x4e
__kasan_unpoison_vmalloc+0x20/0x2e
__get_vm_area_node+0x1c6/0x276
get_vm_area_caller+0x52/0x84
vmap+0xf0/0x264
dma_common_contiguous_remap+0xa0/0xd0
atomic_pool_expand+0xb6/0x310
__dma_atomic_pool_init.isra.0+0xf6/0x1c0
dma_atomic_pool_init+0xf6/0x1aa
do_one_initcall+0x134/0x928
kernel_init_freeable+0x532/0x60a
kernel_init+0x28/0x162
ret_from_fork_kernel+0x82/0x94c
ret_from_fork_kernel_asm+0x16/0x18

The PTE is valid, so the mapping was in place when the CPU faulted.

Tested on Orange Pi RV2: without this patch 2 of 30 boots crashed,
with it 50 of 50 booted.

Add the KASAN shadow region to the ranges for which flush_cache_vmap()
calls mark_new_valid_map(), as commit 4edd70ee6a7d ("mm/sparse-vmemmap:
flush_cache_vmap() after hotplugging vmemmap") did for vmemmap.

Fixes: 503638e0babf ("riscv: Stop emitting preventive sfence.vma for new vmalloc mappings")
Signed-off-by: Ali Tariq <alitariq45892@gmail.com>
---
Crash Log: https://kernelci.cloud-v.co/scheduler/job/541
---
 arch/riscv/include/asm/cacheflush.h | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/cacheflush.h b/arch/riscv/include/asm/cacheflush.h
index c2b0a2928f06..c95b2f6007fd 100644
--- a/arch/riscv/include/asm/cacheflush.h
+++ b/arch/riscv/include/asm/cacheflush.h
@@ -8,6 +8,8 @@
 
 #include <linux/mm.h>
 
+#include <asm/kasan.h>
+
 static inline void local_flush_icache_all(void)
 {
 	asm volatile ("fence.i" ::: "memory");
@@ -57,7 +59,9 @@ static inline void mark_new_valid_map(void)
 static inline void flush_cache_vmap(unsigned long start, unsigned long end)
 {
 	if (is_vmalloc_or_module_addr((void *)start) ||
-	    (start >= VMEMMAP_START && end <= VMEMMAP_END))
+	    (start >= VMEMMAP_START && end <= VMEMMAP_END) ||
+	    (IS_ENABLED(CONFIG_KASAN) &&
+	     start >= KASAN_SHADOW_START && end <= KASAN_SHADOW_END))
 		mark_new_valid_map();
 }
 #define flush_cache_vmap_early(start, end)	local_flush_tlb_kernel_range(start, end)
-- 
2.34.1

