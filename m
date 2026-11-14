Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794628145;
	b=BFSilTj2kzPT47IVSOsgMXYZKN9DjSiE3ZUY9AXTnWnVLw5NAA0cXJkGcW+JMR+m2GIF
	 pBf+E6OoHYgoX74EgUEKgVIvRZ2pxwSjzh5zGJel0yLLRsPMGcrE2Ua9xvWowmzXVRSbf
	 Ssg5xCg7UawidKoDDTI+Ku/MYetEQpPu/UGfBKtQFmxCmQ14MtD/ngIkXPeQwtIdVRoRj
	 YRUoueLfU80tMAQU149gs/NM1WOQLq5Sljk0Cm/pxjeSYmxzbBrnrbyDujO19CpQtU/+x
	 BuuZUG3WpTVtOy6aGtw5IWefwaeaUfNRudSU7fl5cQJqkkGyoNJZmZ4vi7K/9i7/4PQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794628145;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=/G7/lmek4y2FIJhQPQXzBX6rPtR2uzbHmwhsN2tO0nU=;
	b=NzI2dZfCratu9xLKVDRaeF+8L28JZpOIb1UImLnY3l6TW5rO1HBUOgztxtm7H/GuyJF3
	 QcXaIU56fchUSiKDh5C7/3580cJsXiduUYyZ9miPeQlVHpKiQSkZFxNf7olM5z1KlRFPg
	 n4mw+/5cuyvvQZUOOTW1yV23G0gMhc9ak7fPBCJZP6YRxt9OvsxWRPuPfVh4efnfW09AC
	 31WFd3pVUiRdK24bLD5QngYGjuciLLL3YfS48G4OjPTOIr3Q0Q3CVHJYTBsQBjcQ1diSG
	 J2/k6rLwA0CKm4EZE9JdcbL95D4ts0/I7UENT9Umovo/MwuEOgGS89QDh+4eFZVE2LA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RJ4hP5Hf;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8727606A32D
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 03:49:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D8727606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RJ4hP5Hf
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-36eb1cb7aabso2101087eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 19:49:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794628144; x=1795232944; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/G7/lmek4y2FIJhQPQXzBX6rPtR2uzbHmwhsN2tO0nU=;
        b=RJ4hP5HfytSoREyKWCQ5oyPPQ3VRpulvjtWJLKkFx9ISPdMWAKLmHygrcEzt8UQcv1
         EZ+a731nNwvSRQ0wu8X2GeUxX+dnJzwCIDmKN2CJbZDBVO+c3jGyYmtq0DjFgpjNJTNI
         g4LWcOAcsrABgH0dpIAeELyp019PGdOibk0RGxFEnJitVnUPgc/0ItzjwrHiZg9vfGay
         Q7s5lnbFZxRXBK3ax0ujwgNdYLISEFoB2iwvbMAXrhtFAYtgEQMYAS/QfRUnp9o61hPe
         /0BkukLF9SiBfHbBmyXOY6D1QTncNmq+hsNkjGZjLfrk/5OOvQSnbj3X4Q/C7z8s8pV6
         aCuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794628144; x=1795232944;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/G7/lmek4y2FIJhQPQXzBX6rPtR2uzbHmwhsN2tO0nU=;
        b=hNvNUC2eU1plXocoqgylvAtiQ6B36b4V6hLw9p3EvVAlub98nbHqnlsXc9MmWHWbiH
         BHbmxrr5sCFPJgZMM3S9MRrLhlea6koK2POmFr1xeTH5xtJtWJxg5UhSVIXpAyYhOJo0
         FNQFhH8AEq+DbpUxzM96IWjLgQYpcI7/JVZekjgTi9pdsgtQQNMW6K8v/7BuAlMY1QA+
         q5gFfz535rwA5e1yilhY+QWiB9H6l968J5uJVuJExs9MfdI8//I1zyrUY1NevoMsDUyv
         RbS5YFlBD9ykpG2Na8xtbu7Qa0gxDw5tsSJm3goAJsnGBvzRrLNhbo6J2kuJUJ4EXtf/
         RIPA==
X-Gm-Message-State: APuU4Z8LERk1UDikm/5+D2tYeVN34l+89WNTm3Hc81z06DSx2GCH8lgX
	N+5sRfs5NIxFu80pvIQ6F9QWsIqh7UE6F0IwxdPyjqCR3BHMtsMb6K9AnLnRh3SK
X-Gm-Gg: AYBFou0BOFADDziZUzbq/gCyBnU3O6QxVXeADS76nH83myl3S1qnlHaHTErjjwZqL/0
	DLGiWBT+fs5jrv34A6690nt5q7fhCV4xkdKUXKaVNNM+55vb9GfV1d9aAOHL900rb/g6A/UkCcW
	T4JvEw1PpZTit4UHroTRSqDPwGsMNbCCxTEar2Cy7LJy+tixpQC7SnSPgDtxCNSLjAyzXsYRzo6
	d/f42WBWEN0UA9WiY4IUUu7UAXLBamvhSns5sb8xLOcNA2FNH2oVeWdzUcxcd5FaSQvh6660eIa
	bePOZII4X0QTT+wtSbI/pEbbHy3ikDydWpr1QCnGnHRHy9vJCmXepIvuhia267ri4MB2CgXbR6M
	Pca0/ycWeAmdNqbUC1ULViQSztz2bhK+E6WBhvGgGitp6fZqadhjkIHSNq8eKXOS//KUGH2MH8d
	1UeHSMc9gCW5UJLKjjkhFXNI/XeXjTCwSr1mkCsEiCfrLviCXbykPu6H684AQELXJKQPZ9BjPMG
	iyNp3AxICxmvd+wiGYsWx3vvqdnDjWsGlN9bEJoMJ0RqHdiGN8hmwpwHT656ZWGlpbuwNYaj+Gv
	pDv5a9N/94ATZdDniI/yhRfiUf0FYEM5FYMANmfkfRp0YQIni1ZAPCq38vr9uFWDRFAWMw1Ol04
	71IAi8NQx6bGb
X-Received: by 2002:a05:7300:fb17:b0:36f:6d81:3f99 with SMTP id 5a478bee46e88-3796676fd59mr3950614eec.7.1794628143470;
        Fri, 13 Nov 2026 19:49:03 -0800 (PST)
Received: from pop-os.tail4adac7.ts.net ([2601:647:4084:777d:f1b2:179a:680c:6345])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379563e6b6dsm19901637eec.21.2026.11.13.19.49.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 19:49:02 -0800 (PST)
From: Cong Wang <xiyou.wangcong@gmail.com>
To: linux-kernel@vger.kernel.org,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org
Cc: Song Shuai <songshuaishuai@tinylab.org>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>,
	Han Gao <gaohan@iscas.ac.cn>,
	Jinjie Ruan <ruanjinjie@huawei.com>,
	Mike Rapoport <rppt@kernel.org>,
	Baoquan He <baoquan.he@linux.dev>,
	Guo Ren <guoren@kernel.org>,
	kexec@lists.infradead.org,
	Cong Wang <cwang@multikernel.io>
Subject: [PATCH] riscv: kexec_file: Keep segments out of the new kernel's PMD padding
Date: Fri, 13 Nov 2026 19:49:00 -0800
Message-ID: <20261114034901.107028-1-xiyou.wangcong@gmail.com>
X-Mailer: git-send-email 2.43.0
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

From: Cong Wang <cwang@multikernel.io>

A 64-bit kernel with STRICT_KERNEL_RWX reserves itself up to the next
PMD boundary past _end in setup_bootmem(). load_extra_segments() only
keeps the other segments above kernel_start + kernel_len, which is the
unaligned _end of the new kernel, so they may be placed in that padding.

The segments are placed top-down, which normally keeps them far from
the kernel. A kdump kernel's segments are confined to the crashkernel
region though, and when it has little room to spare, the lowest of
them, the initrd and the device tree, end up in the padding. The kdump
kernel then finds its initrd in memory it reserved for itself, drops
it, and panics without a root file system:

  crashkernel reserved: 0x000000017be00000 - 0x000000017fe00000 (64 MB)
  Loaded kernel at 0x17be00000 bufsz=0x1c40600 memsz=0x1cb1000
  Loaded initrd at 0x17db58000
  ...
  Starting crashdump kernel...
  INITRD: 0x17db58000+0x022a4000 overlaps in-use memory region
  ...
  Kernel panic - not syncing: VFS: Unable to mount root fs on unknown-block(0,0)

The load itself succeeds, so this only shows once the system crashes.

The kernel being loaded may be any version or configuration that
reserves the padding, so the loader has to keep clear of it. Start the
other segments at the next PMD boundary. A crashkernel region too small
for them now fails the load with -EADDRNOTAVAIL, and one with enough
room boots the kdump kernel with its initrd.

This was found while testing multikernel, which loads a kernel with
kexec_file and hits the same overlap.

Fixes: 809a11eea8e8 ("riscv: kexec_file: Support loading Image binary file")
Signed-off-by: Cong Wang <cwang@multikernel.io>
---
 arch/riscv/kernel/machine_kexec_file.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/machine_kexec_file.c b/arch/riscv/kernel/machine_kexec_file.c
index 26cd2a8bd0cd..0d2d43a7dbfa 100644
--- a/arch/riscv/kernel/machine_kexec_file.c
+++ b/arch/riscv/kernel/machine_kexec_file.c
@@ -251,7 +251,8 @@ int load_extra_segments(struct kimage *image, unsigned long kernel_start,
 	char *modified_cmdline = NULL;
 
 	kbuf.image = image;
-	kbuf.buf_min = kernel_start + kernel_len;
+	/* The new kernel reserves itself up to the next PMD boundary */
+	kbuf.buf_min = ALIGN(kernel_start + kernel_len, PMD_SIZE);
 	kbuf.buf_max = PFN_PHYS(max_low_pfn);
 
 #ifdef CONFIG_CRASH_DUMP
-- 
2.43.0

