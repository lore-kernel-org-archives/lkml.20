Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793110206;
	b=dPxLrLV/2EsYslDfkcqPIwOcvJ4uu+xJ9Qi4pjJ53E6P3Jd/P9iumOrsqZY2aLX+WRqP
	 rRgTGNYn3WDHD7qU/zt4TNQuiDIPxyMDf0CsRqODJyPBnl986sKk1VWk8EeCWIwjkP3vu
	 djVpEhiKgJ28Y2jIocCBf5AbV2UD5iMqAcGxmUYXrhlkau9Cui2SWqv5hUUg8jrXuoEFr
	 9XpQEXZ9WpjuyD0pGkUGC5kG6UlyosaT1f1/Y6GRf+4G32qgwLy09uStlGcSPTDkUIxaI
	 /EDo134sl3uBMkEk9qllX78kbRgJWqNrP1ibWNlPd6utrhaCsNadTcChIzNGPIGlvQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793110206;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=tOHCbTTh38wgZqUQAraRD2c7zMfmVdF5wzMAOJI6e4A=;
	b=qzVgcQteyzzx58Vvi8PrvJbJA9kiibcPsR9nf3gV+cnc3LuLQYCknpmY7Dn1+y/a/ZqQ
	 TUfoZW/4cpRCk80msouPWE60cYtlBGgupReDSJjLRdwPsGLwaOmmv5aiBa+SBBO0FxqK5
	 y4w/XEPjnz0XQ82m5xwLEp2d/1Cvj5AYxzpM6Ze5qV4G1Ou/i3Je/ZvTDQ1fLFWU9p/fw
	 sQVJlcjviuBmHfpUGqt7rilcUV/cR2yZ+XJD6Td0DadGosdlghBvGL9LmnsRrsaC+EQc6
	 +elUDxzKEtiCCzpj54dLjwLdvGWNblss7THnebWYKdwi9PHYxyK0M4ZlZf1SX+J/TOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dI63M4Px;
	arc=none smtp.remote-ip=209.85.221.173
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C4FE606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 14:10:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C4FE606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dI63M4Px
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-5eae12762c9so1874618e0c.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 07:10:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793110205; x=1793715005; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tOHCbTTh38wgZqUQAraRD2c7zMfmVdF5wzMAOJI6e4A=;
        b=dI63M4PxXAmh33C1faoeAIWALThrz3212zXcx2BHJGELfhI1wyGYqyfdo3hg6C88u6
         ca5B7VDDsjIc6mXZVPqTGaE8HHpL7C3sVSyrinLJQ2HpMD6s7cJ6MMGvCvXRl15pKeGW
         3siVGRUyB+qb916C7qlOVuaY8Zu9W5VAmahfct8cfXwUAU14et8BhukBjU29j89T+N37
         GfrRgBAB3q+vn8v7hHRTlif/oi986SPDJOx5UKrJATQ3QPzwm7v7JrV+Y/WLEAKoTw1x
         mH6KPAExVztiu4C8dHM3I67T2DMDrlfXtXo0i4tE8QZb4O5R/QiVjyMItFHDBP3v6FyI
         65/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793110205; x=1793715005;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tOHCbTTh38wgZqUQAraRD2c7zMfmVdF5wzMAOJI6e4A=;
        b=Bnwm2knIt7GpZWU+m5goOL2tiVFDrD609oqvUH0S8pNBeO5ov4u5HpOpt58damN5NK
         McfP3TBM6fE9hD5BwryUDL7UO/TGhUzdCCZuxnbSQoc/v0eWQHIVQpp+v9WdlN4tt1L3
         JauvgsT4x+9wd7/Q3d5Hw0MKndIC2OjuoR3URT9igPIauMC0BUBc54v+aaw+cY3GOyOq
         5ej64RfXss+lD1a8qvSmIiLZ6hUFOrbSnLQJcm9TnF7sJgW8kI1Hdp6C7XZmq+xCk1bV
         EB4Crah9fqUjdJqvNl2P8GjdbhAR1BCGVt6g42UpnUtrAYmZfJ4qhvp2h9OjdMkGq9mU
         1y5A==
X-Forwarded-Encrypted: i=1; AKwUvByQF+qslqKDdLMFA8vUKbCEwdwPW+LyDgsGqvHmVnyt9SGEkRYzI1ycXveMXK3B+XAmU7/HtXiLROCn/w4=@vger.kernel.org
X-Gm-Message-State: AFq9FYL2MbQNsUjLV9yL6y4HP8Xnut4EjU1vq8GSMOaBhh6J7Fb9iRY/
	CfgihN+1zO51KmZAtjYndwBh9ilHbiarhPfkWYnghBtrQ+D7CDoOOWrq
X-Gm-Gg: AYBFou0JtZSvzby0gVDUBNKpXZqfC1BLS9uID9bDo6CFP/MMYHN2DPl7pHZfzMo/8DJ
	mY63t6dnGcI23/3D/F5NwsMrBrWcpN23kb2xzAFWep22To6/rocXDNH/sz8Y3A7E6x13Cp2i/EI
	NjZbLvWiL4KvKvX4C75a13C66NvabSK2+oeiNIpaYNq1PX10rIUJjq9wDjGWwxn6W/mw62J/8L1
	Gov3tmSqVdaNw/Bl/NEBRaMNQwj5VV8zS5rD1Nz09PMk8cAlcav8Ac9yJxCtt6C6CflUQsCPqlY
	Kqz1hhi/kw5tBjLGcNlh1Swg7xjuFtCW7mZjxGGOVeiSlMeQzliGFWG9lBk53hq0BiEWh+yqdcU
	BuZePrTTk/5C9YDAW03B1ZQi+ObWbVcuGIsdNIb+P1hJQuG9+zIlDdRz60Vw5MAU7DjXzP35aGE
	EOQTL2Fnlhhgu5A9JVrVP3x6Onme6KW+jktHeC6pcg0w5qRcsqEzNF3ppJ8OpBJJq5miURHo+uF
	VHoT8o2eRwcrm58lfJ/HuftsK0uHSx9HzDJjEtPl3ff3Nv/hKnrxVHq8C/tlRdml5phKnLwO39y
	kwqvNlzbUvOC3rYwKE3utOYsAnwIP7SzwP/eHzB8EI4ixfeeOuxS2GtHa+v74GlRdpBIHaVdLL+
	tUv2uCgY=
X-Received: by 2002:a05:6122:ec5:b0:5c0:fb8d:9993 with SMTP id 71dfb90a1353d-5ec22ecfe84mr3781126e0c.0.1793110205099;
        Tue, 27 Oct 2026 07:10:05 -0700 (PDT)
Received: from fedora ([187.120.134.44])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ec233f4d28sm11903907e0c.3.2026.10.27.07.10.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 07:10:04 -0700 (PDT)
From: Guilherme Giacomo Simoes <trintaeoitogc@gmail.com>
To: david@kernel.org
Cc: akpm@linux-foundation.org,
	liam@infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	ljs@kernel.org,
	mhocko@suse.com,
	rppt@kernel.org,
	surenb@google.com,
	trintaeoitogc@gmail.com,
	vbabka@kernel.org
Subject: Re: [PATCH] mm: clear pmd in pmdp_invalidate()
Date: Tue, 27 Oct 2026 11:09:50 -0300
Message-ID: <20261027140950.1337359-1-trintaeoitogc@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <f1b2ec5a-f7a7-442c-97fd-f67fe6ecb197@kernel.org>
References: <f1b2ec5a-f7a7-442c-97fd-f67fe6ecb197@kernel.org>
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

"David Hildenbrand (Arm)" <david@kernel.org> wrote:
> > when attempt to do a madvise in a chunk of memory allocated by mmap, the
> > folio_split is called to split a portion of memory, and despite the path
> > leads to pmd_mkinvalid() they do not clear the pmd and clearer wording,
> > leading to a BUG_ON inside page_table_check_set() because the map count
> > is more than 1.
> > 
> > Call the page_table_check_pmd_clear() inside pmdp_invalidate() generic
> > function to ensure that the pmd will have they map count decrement.
> > 
> 
> The subject + description is rather confusing: you are not "clearing the pmd",
> you tell page-table-check that the PMD was cleared.
> 
> This is all about apge-table-check.
Yes, you are right, i'm not clearing the pmd, I will improve this.

> 
> Can you post the actual kernel splat you ran into? Or is this generated by an LLM?
Of course, the stack trace of error is (already decoded):
page_table_check_set (mm/page_table_check.c:118)
__page_table_check_ptes_set (mm/page_table_check.c:223)
remove_migration_pte (include/linux/page_table_check.h:83 arch/riscv/include/asm/pgtable.h:642 mm/migrate.c:448)
rmap_walk_anon (mm/rmap.c:3053)
rmap_walk_locked (mm/rmap.c:3169 mm/rmap.c:3164)
remove_migration_ptes (mm/migrate.c:483)
__folio_split (mm/huge_memory.c:3640 mm/huge_memory.c:4289)
split_folio_to_list (mm/huge_memory.c:4435 include/linux/huge_mm.h:416 mm/huge_memory.c:4499)
madvise_cold_or_pageout_pte_range (mm/madvise.c:420)
walk_pgd_range (mm/pagewalk.c:147 mm/pagewalk.c:237 mm/pagewalk.c:278 mm/pagewalk.c:319)
__walk_page_range (mm/pagewalk.c:427)
walk_page_range_vma_unsafe (mm/pagewalk.c:737)
walk_page_range_vma (mm/pagewalk.c:747)
madvise_cold (mm/madvise.c:594 mm/madvise.c:614)
madvise_vma_behavior (mm/madvise.c:1364)
madvise_walk_vmas (mm/madvise.c:1721)
madvise_do_behavior (mm/madvise.c:1916)
do_madvise (mm/madvise.c:2014)
__riscv_sys_madvise (mm/madvise.c:2023 mm/madvise.c:2021 mm/madvise.c:2021)
syscall_handler (arch/riscv/include/asm/syscall.h:112)
do_trap_ecall_u (arch/riscv/kernel/traps.c:341)
handle_exception (arch/riscv/kernel/entry.S:237)

And the repro.c that I writed to reproduce bug:
```
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <sys/mman.h>
#include <sys/syscall.h>
#include <errno.h>
#include <linux/mman.h>

#ifndef MADV_COLD
#define MADV_COLD 20
#endif

#define HPAGE_PMD_SIZE (2 * 1024 * 1024)  // 2MB huge page on RISC-V

int main(void)
{
	char *addr;
	size_t len = HPAGE_PMD_SIZE * 2;  // 4MB - two huge pages
	int ret;

	printf("Testing page_table_check bug with madvise(MADV_COLD)...\n");
	printf("Huge page size: %zu MB\n", HPAGE_PMD_SIZE / (1024*1024));

	// Fallback: try without MAP_HUGETLB (kernel will use THP)
	printf("starting THP...\n");
	addr = mmap(NULL, len, PROT_READ | PROT_WRITE,
		    MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
	if (addr == MAP_FAILED) {
		perror("mmap failed");
		return 1;
	}
	// Enable THP for this mapping
	ret = madvise(addr, len, MADV_HUGEPAGE);
	if (ret) {
		perror("madvise(MADV_HUGEPAGE) failed");
		return 1;
	}

	printf("Allocated memory at %p\n", addr);

	// Write to the pages to ensure they're mapped
	memset(addr, 'A', len);
	memset(addr + HPAGE_PMD_SIZE, 'B', HPAGE_PMD_SIZE);

	// Touch pages to ensure huge page allocation
	for (size_t i = 0; i < len; i += HPAGE_PMD_SIZE) {
		addr[i] = 'X';
	}

	printf("Memory initialized, calling madvise(MADV_COLD) on partial range...\n");

	// Call madvise(MADV_COLD) on a partial range of the first huge page
	// This should trigger the huge page split and the bug
	ret = madvise(addr + 4096, HPAGE_PMD_SIZE - 8192, MADV_COLD);
	if (ret) {
		perror("madvise(MADV_COLD) failed");
		// Don't return - the kernel might have crashed
	}

	printf("madvise returned: %d (errno: %d)\n", ret, errno);

	// If we get here without kernel crash, the bug might be fixed
	// or the conditions weren't met
	printf("Test completed (if kernel didn't crash, bug may be fixed or not triggered)\n");

	munmap(addr, len);
	return 0;
}
```

I see this BUG here:
https://lore.kernel.org/all/69851c62.a00a0220.37c87e.002e.GAE@google.com/T/

Yes, I'd should mencioned "Reported-by: syzbot+227179d5a8a87e9df90d@syzkaller.appspotmail.com", my bad
