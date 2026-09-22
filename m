Received: from mail-pj2-f11.google.com (mail-pj2-f11.google.com [74.125.227.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F13342E433
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 08:45:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790066710; cv=none; b=XVw6nJG9jTCDl66y2fUooUMNXketJhisE+9wKdpQ9snXLc6tLp94er0i/MixE75bNH4+jbTf3bD5Ky4CXUrmJ+ALXUWOTbyLn3+U983Ty6ds4ikkz8db/Vn1g0NjUHzgTHRatXXBTZjsJqkAP3z+wf62ZRb1JjRy9CwC/CKDrNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790066710; c=relaxed/simple;
	bh=HSqynHYwWyM3/AIAzPlw2zR5ssM3zxj+P+TMMRPO3o0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tnFJ3ArM55zBXdEAe6q4x/3B1Nx88j0MgWc/qlHMnZKdsDn/uBDEBoJciYvr6z2OHhTRhKDZBxaT3VoF5CXaqzDTLZEloVxSBz0YgwK9CpZEPzrfv8Zz0YgnjYiDL/Pc6bRUJh4I7Ca3E+bDrR50NIjdq4P2Cijro/7th+Qq4kw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jeAk+kY3; arc=none smtp.client-ip=74.125.227.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jeAk+kY3"
Received: by mail-pj2-f11.google.com with SMTP id 98e67ed59e1d1-39569e136f9so3160261a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 01:45:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790066708; x=1790671508; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xFj2nCVpKiIz+n9fFlODHsR1pKxI11t8bWPyNgAqBFI=;
        b=jeAk+kY34/NHF0TJAFB3cHIB9/7bcYALmdQlCmevs97L8iMep1wmGy8/WjE9AuKNja
         g0jd5TeXi7wh5DUdUOa5bfdl1EfTIdWznO8HHekcbYHmZjmTucYCprTCJZfSRUZs29CJ
         dPnayj/bYd+KkQMGTyx2WPG/3MZyLxuGAbNk1T59G/Z0xsfyfFpIdF+nDG2qCSUl8ZsX
         onsAk0Fr6hork9OwfWcaRquHhohu5XJSbLL0DZUnTm4bGFRPFlu5jWGIWRE+JemUvNTg
         tNoxOAR+njrSBmkjEehMkjvYjRAYzYQ0+VbHE3/yu8CI7APYpedo/kD0wZFkEfcbArdg
         3Rlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790066708; x=1790671508;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xFj2nCVpKiIz+n9fFlODHsR1pKxI11t8bWPyNgAqBFI=;
        b=Axu0azyr2NOa7/EvhE967w5GG09LFqfpbumonz/PN+lkbZx0vJJt1nkKvkp3xAmeCH
         mhQ4Tg+JCxF+RILs9Yi0q6K2ZQXX3l4hvbpHkYkKvAv8pJt4HTMaFaJneb77nl/dp5dS
         ncEwXJPjTdzwZaUOqxuzya1R4h3eVLjfpdB2LEfMSbrmLRNBqXOZvVQVVgb9Vnz2XUog
         dTJHalyfKp0SrUH6jMp1H3JrdjeFIKt9rap+kn26fD29yALWyaTX9qc3+uCm9qCAydlu
         CSLabLjsj8KxlxyMs4vsQOa0iKZ6c2AHCbXb1jtYTYHa3ZqHShxc4bXbkbD8yyrs0dat
         s7TQ==
X-Forwarded-Encrypted: i=1; AKwUvBwW5pu5IwckKQCB5QF3W0KjtWxwEMlY1Ul8d/Ml4tBs5taFheHLfzyKfjF7xwNWqmfBZcAxcAmziiDr5n4=@vger.kernel.org
X-Gm-Message-State: AFuF++nEpUDcxQZasYvjdXOLcjZEdL8hbGXH5i9KEGa6Ad8OfBNDuLix
	sL1ZZB+DcE9wkFhZMNW4CVHQ8sIJl8a+krWGQtC1IFILPKN69pnH8qmi
X-Gm-Gg: AYBFou1svGManPe8OFXOryAgWjKmHbj1tZo5piof4TWB+vylze0onKfXgdLzWfdiVgQ
	YGQFcgnJah2QXsbzjl3chadT+n+p8wSMXmzfYxbAVCBxal4XSXhomcjPRond/CkB+W17bDWalU6
	6qpdqiyWZ0s/bM1aXoUW7xXMssbMMXFODVQoGD47jNzj1NV3clc6sSHeJFxNC+8NrXauYLTVhBU
	5YAiHVqc8E+gi1rD//ZAaQbyihO+yuhho23u68L77IEEwosDBqTRnU/cbvMAZylrl62K/aQzcBS
	qx5LddbWUEl/XwjfTqh5U0jrkzIZxuCGnD2mvcjl/3LyBdMRXzzZGaQBFYRXIWipAJi09wq3uwo
	KeefCP+80aIbcubD2JZCv0vGnnRr0TxmWyxUQO45WjBMxwcCD8cEvsUxLUnrBzuyl8Fa/ngcFDi
	oa0FjeLbB1WLzs0Lvy+NbI1pZpole6thNaUE19ujZm4iOxxAI3kQNC6PN6rH4NYyx8+kF/zJ0la
	s0B6oLY+B8cYygbl5ZvBA==
X-Received: by 2002:a17:90b:1d8c:b0:39d:f4fd:8075 with SMTP id 98e67ed59e1d1-3a073182cebmr486642a91.19.1790066708546;
        Tue, 22 Sep 2026 01:45:08 -0700 (PDT)
Received: from intel.company.local ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0674a5ae4sm3670016a91.12.2026.09.22.01.44.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 01:45:07 -0700 (PDT)
From: Wandun Chen <chenwandun1@gmail.com>
To: robh@kernel.org,
	baoquan.he@linux.dev,
	rppt@kernel.org,
	m.szyprowski@samsung.com
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	mark.rutland@arm.com,
	chenhuacai@kernel.org,
	kernel@xen0n.name,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	tglx@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	hpa@zytor.com,
	saravanak@kernel.org,
	akpm@linux-foundation.org,
	pasha.tatashin@soleen.com,
	pratyush@kernel.org,
	ruirui.yang@linux.dev,
	robin.murphy@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	kexec@lists.infradead.org,
	linux-mm@kvack.org,
	iommu@lists.linux.dev
Subject: [PATCH v7 9/9] crash_core: skip MEMBLOCK_NODUMP regions when building vmcore ELF header
Date: Tue, 22 Sep 2026 16:42:56 +0800
Message-ID: <20260922084256.1515554-10-chenwandun1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260922084256.1515554-1-chenwandun1@gmail.com>
References: <20260922084256.1515554-1-chenwandun1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Wandun Chen <chenwandun@lixiang.com>

Reserve regions (for GPU, DSP, ...) carry no data useful for crash
analysis. Exclude MEMBLOCK_NODUMP regions from the vmcore ELF header to
reduce vmcore size and capture time. crash_should_skip_region() now also
returns true for MEMBLOCK_NODUMP.

Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
Tested-by: Meijing Zhao <zhaomeijing@lixiang.com>
Acked-by: Baoquan He <baoquan.he@linux.dev>
---
 kernel/crash_core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/crash_core.c b/kernel/crash_core.c
index c7acb2e449df..fdfeee5afa1a 100644
--- a/kernel/crash_core.c
+++ b/kernel/crash_core.c
@@ -270,10 +270,10 @@ int crash_prepare_elf64_headers(struct crash_mem *mem, int need_kernel_map,
 	return 0;
 }
 
-/* Exclude NOMAP regions from the vmcore. */
+/* Exclude NOMAP and NODUMP regions from the vmcore. */
 static bool crash_should_skip_region(struct memblock_region *reg)
 {
-	return memblock_is_nomap(reg);
+	return memblock_is_nomap(reg) || memblock_is_nodump(reg);
 }
 
 static struct crash_mem *alloc_cmem(unsigned int nr_ranges)
-- 
2.43.0

