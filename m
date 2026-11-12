Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.225
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794490493;
	b=sycG151R8kT4E6ep82Zb9SYtOxRkuVHF9yyWhj0AsPghftdQltSOBRn0Ei5+CS4ZbMd3
	 THE4zMoKHmMuNeddRbMLxqaiJZFqmTeJ6q9p4UoXj46yz996NPEVvBARirIxrhfyy7Ei2
	 cmgyDLRNoNde2Gc6ygFo4KFzsy1b4ngik53HLY0KfutB2wEOXzrHUyYKHPdh7b8a8WocB
	 GRF1jta7I7iJtF2K6q8HwJhDzn7ltKQJ/PhoQdhiMMCj+sBO1RLEUFyWJGDUpURQAnV1b
	 q7fQBLJxUwfTecaYkGmi6/UIl2r9dUZPYs0ddG42iIbb4io0NYwDGMfPBFI1aAlIdtQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794490493;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:From:To:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=Eh7Neg9wcVMsJIfAcLR2eiV7KLyb1KF97UJjwNvN0YY=;
	b=1o1XSXWSANIuh9PHoKYP4gxhvqhKTYczR3QE6C5N1MwevpJucYJhKro4ZgwWLl8B1C+R
	 QCk/kutzOsXEgWeQ0rYtKMDWwRmGrI/sj9ayT6mTc+g6PDopi6NLltThmADWq4M/URvom
	 mdDuAk1CsofmoaUL3UYF040J3ElG5jvNHo82XhPHA2lIQLs//XXhcP/YpSlpvhZwr2EjL
	 du/41mi7D5R7t4IhFm4+/S4+RTHobKEA9zkKuITuWlu07JJF5dmTHypqYga5YqAKiN7cv
	 FHp5fCb/pUbD4bfH5maCloydpzG0KvtCSzJ2vbW109hfB9yG/fNs482T9yYbCNFRFcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=2OMn6j1I;
	arc=none smtp.remote-ip=113.46.200.225
Received: from canpmsgout10.his.huawei.com (canpmsgout10.his.huawei.com [113.46.200.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4298160A2618
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 13:34:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4298160A2618
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=2OMn6j1I
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=Eh7Neg9wcVMsJIfAcLR2eiV7KLyb1KF97UJjwNvN0YY=;
	b=2OMn6j1I6kW0FIr1YLk16y/U44dDnyyOLth3L7D/XtmzWy6p/ocvPBVpkPiJFrBcEZbwU6JX4
	oJW5JKmAoWvyPoSQ1VzPS2Fax3IQ6815Ely6hLdkMhaL7PipT2wDxpx9E1T/8t2UfWxJPoQdXgz
	ndMmWxA5Yk4SjKwWTABu52U=
Received: from mail.maildlp.com (unknown [172.19.162.92])
	by canpmsgout10.his.huawei.com (SkyGuard) with ESMTPS id 4jQLwJ2n9rz1K9BM;
	Thu, 12 Nov 2026 21:34:40 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 5BBAA40565;
	Thu, 12 Nov 2026 21:34:50 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 12 Nov
 2026 21:34:48 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <mark.rutland@arm.com>,
	<chenhuacai@kernel.org>, <kernel@xen0n.name>, <maddy@linux.ibm.com>,
	<mpe@ellerman.id.au>, <npiggin@gmail.com>, <chleroy@kernel.org>,
	<ritesh.list@gmail.com>, <sshegde@linux.ibm.com>, <pjw@kernel.org>,
	<palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <alex@ghiti.fr>,
	<tglx@kernel.org>, <mingo@redhat.com>, <bp@alien8.de>,
	<dave.hansen@linux.intel.com>, <hpa@zytor.com>, <akpm@linux-foundation.org>,
	<baoquan.he@linux.dev>, <rppt@kernel.org>, <pasha.tatashin@soleen.com>,
	<pratyush@kernel.org>, <ruanjinjie@huawei.com>, <leitao@debian.org>,
	<yeoreum.yun@arm.com>, <mpilaniy@redhat.com>, <robh@kernel.org>,
	<coiby.xu@gmail.com>, <Yeking@Red54.com>, <prudo@redhat.com>,
	<brads@mainlining.org>, <sourabhjain@linux.ibm.com>, <mkchauras@gmail.com>,
	<blum@kernel.org>, <adityag@linux.ibm.com>, <qirui.001@bytedance.com>,
	<hui.wang@canonical.com>, <sohammetha01@gmail.com>, <guoren@kernel.org>,
	<gaohan@iscas.ac.cn>, <ionut.nechita@windriver.com>,
	<vishal.l.verma@intel.com>, <seanjc@google.com>, <ardb@kernel.org>,
	<richard.lyu@suse.com>, <arnd@arndb.de>, <tzimmermann@suse.de>,
	<rick.p.edgecombe@intel.com>, <kai.huang@intel.com>, <kas@kernel.org>,
	<piliu@redhat.com>, <thuth@redhat.com>, <shradhagupta@linux.microsoft.com>,
	<ebiggers@kernel.org>, <jbouron@amazon.com>, <me@linux.beauty>,
	<mclapinski@google.com>, <graf@amazon.com>, <tangyouling@kylinos.cn>,
	<x86@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <loongarch@lists.linux.dev>,
	<linuxppc-dev@lists.ozlabs.org>, <linux-riscv@lists.infradead.org>,
	<kexec@lists.infradead.org>
Subject: [PATCH v8 10/11] arm64: kexec_file: Fix CMA segment placement retries
Date: Thu, 12 Nov 2026 21:34:17 +0800
Message-ID: <20261112133418.4044428-11-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261112133418.4044428-1-ruanjinjie@huawei.com>
References: <20261112133418.4044428-1-ruanjinjie@huawei.com>
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
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemk200008.china.huawei.com (7.202.194.74)

The file-based kexec system call places segments with kexec_add_buffer(),
which takes them from CMA when kexec_alloc_contig() succeeds, to avoid
copying the payload at kexec time.

When load_other_segments() cannot place the initrd or the DTB, the
segments of the attempt are dropped but their CMA pages are leaked.
Release them with kexec_rollback_segments() in the retry loop and in the
error path of load_other_segments().

The loop makes progress by advancing buf_min past a segment placed by the
walk.  kexec_alloc_contig() ignores buf_min, so once the pages of a CMA
segment are released, the next attempt can get the same region again and
the retry makes no progress.  Disable CMA for the retry.

A CMA segment can be anywhere in RAM, so moving buf_min to its end can
raise the walk's lower bound close to the top of memory and leave the
retry with too little space for the initrd and DTB, failing with
-EADDRNOTAVAIL.  Only advance buf_min for segments found by the walk.

Tested with a non-crash kexec_file_load() on QEMU virt, 1 GiB RAM and
cma=64M, which places CMA at the top of RAM.

Before the fix:
	The retry leaks the CMA pages and kexec_file_load() returns
	-EADDRNOTAVAIL even though RAM below CMA is free.

After the fix:
	The kernel and initrd are placed below CMA and the second
	kernel boots.

Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Breno Leitao <leitao@debian.org>
Cc: Pratyush Yadav <pratyush@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: Baoquan He <bhe@redhat.com>
Cc: stable@vger.kernel.org
Fixes: 07d24902977e ("kexec: enable CMA based contiguous allocation")
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 arch/arm64/kernel/kexec_image.c        | 12 ++++++++----
 arch/arm64/kernel/machine_kexec_file.c |  2 +-
 2 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/kernel/kexec_image.c b/arch/arm64/kernel/kexec_image.c
index a2a7c283b331..1cbb3c73c6e9 100644
--- a/arch/arm64/kernel/kexec_image.c
+++ b/arch/arm64/kernel/kexec_image.c
@@ -109,11 +109,15 @@ static void *image_load(struct kimage *image,
 			break;
 
 		/*
-		 * We couldn't find space for the other segments; erase the
-		 * kernel segment and try the next available hole.
+		 * kexec_alloc_contig() ignores buf_min and always returns
+		 * CMA memory, so disable it and keep buf_min.
 		 */
-		image->nr_segments -= 1;
-		kbuf.buf_min = kernel_segment->mem + kernel_segment->memsz;
+		if (image->segment_cma[kernel_segment_number])
+			image->no_cma = true;
+		else
+			kbuf.buf_min = kernel_segment->mem + kernel_segment->memsz;
+
+		kexec_rollback_segments(image, kernel_segment_number);
 		kbuf.mem = KEXEC_BUF_MEM_UNKNOWN;
 	}
 
diff --git a/arch/arm64/kernel/machine_kexec_file.c b/arch/arm64/kernel/machine_kexec_file.c
index 82122ded1467..8747daa23079 100644
--- a/arch/arm64/kernel/machine_kexec_file.c
+++ b/arch/arm64/kernel/machine_kexec_file.c
@@ -132,7 +132,7 @@ int load_other_segments(struct kimage *image, unsigned long kernel_load_addr,
 	return 0;
 
 out_err:
-	image->nr_segments = orig_segments;
+	kexec_rollback_segments(image, orig_segments);
 	kvfree(dtb);
 	return ret;
 }
-- 
2.34.1

