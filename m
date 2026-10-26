Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.216
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793001178;
	b=QK6gbshtqfmosrasl3t0BS+5ZGE4LC3ulHF2ydm5f36fMPF55SiBu2ft9s7cPyMVTAXu
	 mc0pRtrfyhL+CsZSBB3Y+fQoJ/TGi2xH/j0YH2xc01dHJBxBa7OY71edjsVoNw5ZEvAul
	 0JX7MIymzanQ9+YQ+nPCqKB2Q+XFlgqfCwoxZ5URUaBp/pKRzmLvu4orwfdJZRKKLwW6r
	 CbCd/hdXXpmfIsksIinL+Tq/WkeotQNEejJx4PI17ZJ8n+dYcIbbuklh3WKsqQH30iAVO
	 V6QNob6gRM+EmDaq6mHTjkmgXW12oWHJSsJHn7yoetvT7T0YZMpeBVPMHtI2LAKnGFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793001178;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:From:To:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=AqQFdK35R3PRDVunxYa3KuNeB3Jy3YGmbat9louWLxc=;
	b=D+eKHLC+euNTKrgAg3oPIi1rP8FkQiCyBuz6/haZEqTBVjx1YqY40jWG2gHWEkbTzuTV
	 sWn5o1uVPDVIoJ1zSsqzmC4XFyC/HuD7TMa0nABVpad55DoTPSpu8S2R8YIBJTUL4XZRF
	 jMzh2RYPt5PdH6eNCB1WuUmXOOBd63JaEDGC1tRdYFiXZFbMK71JP8AA1oYy0/nh8TDXa
	 r79zmf8BKPpFp3g2KyRq+BYKobI+z5Fajm0S5GHis4gWChTxyIoDI/n01mW/20DaXmGZ8
	 mVKNVxKJo0zlH4x3spGKB94X0kEfzTiHZkFR52T8+2hcKJYOWhCess4U5I5XrgbUN8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=KvWkDFkJ;
	arc=none smtp.remote-ip=113.46.200.216
Received: from canpmsgout01.his.huawei.com (canpmsgout01.his.huawei.com [113.46.200.216])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1642606A31B
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 07:52:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1642606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=KvWkDFkJ
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=AqQFdK35R3PRDVunxYa3KuNeB3Jy3YGmbat9louWLxc=;
	b=KvWkDFkJzXndGvncGFgO/hLjASWJRdQGUv7ZBx9Kd/Y4d/gjf2/tOQPoVj+es5AzzAYYw+fZL
	wpZ+D42NaiYDjO0KhibMF2YG20SX/Jm8lwHyRYfnUO/XjCMujysMoKBsQuUTEMEVfZxGKQ0Cymh
	ytpS/HzSSO+e3Fp8IxNlI6E=
Received: from mail.maildlp.com (unknown [172.19.162.223])
	by canpmsgout01.his.huawei.com (SkyGuard) with ESMTPS id 4jCm7d1PzKz1T4MW;
	Mon, 26 Oct 2026 15:52:45 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id CDF3A40577;
	Mon, 26 Oct 2026 15:52:51 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 26 Oct
 2026 15:52:50 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <mark.rutland@arm.com>,
	<chenhuacai@kernel.org>, <kernel@xen0n.name>, <maddy@linux.ibm.com>,
	<mpe@ellerman.id.au>, <npiggin@gmail.com>, <chleroy@kernel.org>,
	<ritesh.list@gmail.com>, <sshegde@linux.ibm.com>, <pjw@kernel.org>,
	<palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <alex@ghiti.fr>,
	<tglx@kernel.org>, <mingo@redhat.com>, <bp@alien8.de>,
	<dave.hansen@linux.intel.com>, <hpa@zytor.com>, <akpm@linux-foundation.org>,
	<baoquan.he@linux.dev>, <rppt@kernel.org>, <pasha.tatashin@soleen.com>,
	<pratyush@kernel.org>, <thuth@redhat.com>, <ruanjinjie@huawei.com>,
	<leitao@debian.org>, <yeoreum.yun@arm.com>, <robh@kernel.org>,
	<sourabhjain@linux.ibm.com>, <kees@kernel.org>, <coiby.xu@gmail.com>,
	<Yeking@Red54.com>, <tangyouling@kylinos.cn>, <maqianga@uniontech.com>,
	<zhangtianyang@loongson.cn>, <guodongtai@kylinos.cn>, <blum@kernel.org>,
	<adityag@linux.ibm.com>, <hui.wang@canonical.com>, <sohammetha01@gmail.com>,
	<guoren@kernel.org>, <gaohan@iscas.ac.cn>, <kai.huang@intel.com>,
	<kas@kernel.org>, <vishal.l.verma@intel.com>, <piliu@redhat.com>,
	<jbouron@amazon.com>, <mclapinski@google.com>, <me@linux.beauty>,
	<graf@amazon.com>, <bgwin@google.com>, <x86@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<loongarch@lists.linux.dev>, <linuxppc-dev@lists.ozlabs.org>,
	<linux-riscv@lists.infradead.org>, <kexec@lists.infradead.org>
Subject: [PATCH v7 00/15] kexec: Fix CMA and elf header leaks and rework
Date: Mon, 26 Oct 2026 15:51:46 +0800
Message-ID: <20261026075201.699550-1-ruanjinjie@huawei.com>
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

ARM64, LoongArch and RISC-V load the elf core header, initrd, DTB
and cmdline parameters with almost identical code. This series fixes
the bugs in that path. And as Mike suggested, rework the common part
into a helper.

Patch 1 stops using the Image text_offset for arm64, which breaks CMA
segments in both the load and release paths, and rejects images with
a non-zero value.

Patches 2-7 fix the CMA page and elf core header leaks in the retry
loops in arm64 and LoongArch, also fix a modified_cmdline leak
in LoongArch.

Patches 8-10 pass the kbuf fields to crash_prepare_headers() to
simplfy code.

Patch 11 frees the elf core header from the generic post-load cleanup.

Patches 12-15 add kexec_load_other_segments() and convert the three
architectures, and arch_kexec_setup_other_segments() builds
the architecture specific boot parameters (a DTB or a command line).

Tested with kexec_file_load() and kdump on arm64, RISC-V and LoongArch
under QEMU, including the non-zero text_offset rejection.

This series is also available at:
        https://github.com/ruanjinjie-eng/linux/tree/kexec_cleanup_v7

Changes in v7:
- Rework the kexec_file load code to avoid code duplication
  as Mike suggested.
- Add Acked-by.
- Drop the two non-zero text_offset fix patches
  and deprecate .text_offset in arm64 as Mike suggested.
- Drop the x86-32 fix patch.
- Drop the TOCTOU race fix patches.
- Link to v6: https://lore.kernel.org/all/20260921090450.807575-1-ruanjinjie@huawei.com/

Previous Versions are as below:
- v5: https://lore.kernel.org/all/20260918100442.3841135-1-ruanjinjie@huawei.com/
- v4: https://lore.kernel.org/all/20260907125404.922123-1-ruanjinjie@huawei.com/
- v3: https://lore.kernel.org/all/20260826092541.3905933-1-ruanjinjie@huawei.com/
- v2: https://lore.kernel.org/all/20260729031235.2840255-1-ruanjinjie@huawei.com/
- v1: https://lore.kernel.org/all/20260723131242.1537633-1-ruanjinjie@huawei.com/#t

Jinjie Ruan (15):
  arm64: kexec_file: Stop using the Image text_offset
  kexec: Extract kexec_free_segment_cma() from kimage_free_cma()
  arm64: kexec_file: Fix CMA page leaks in segment placement retry loops
  arm64: kexec_file: Fix elf_headers memory leak in retry loop
  LoongArch: kexec_file: Fix CMA page leaks in segment placement retry
    loops
  LoongArch: kexec_file: Fix elf_headers memory leak in retry loop
  LoongArch: kexec_file: Fix a modified_cmdline leak
  arm64: kexec_file: Simplify load_other_segments()
  LoongArch: kexec_file: Simplify load_other_segments()
  riscv: kexec_file: Simplify load_extra_segments()
  kexec: Free the elf core header in kimage_file_post_load_cleanup()
  kexec: Add kexec_load_other_segments() helper
  arm64: kexec_file: Use kexec_load_other_segments() to simplify code
  LoongArch: kexec_file: Use kexec_load_other_segments() to simplify
    code
  riscv: kexec_file: Use kexec_load_other_segments() to simplify code

 arch/arm64/include/asm/kexec.h             |   5 -
 arch/arm64/kernel/kexec_image.c            |  33 +++++--
 arch/arm64/kernel/machine_kexec_file.c     | 103 ++++-----------------
 arch/loongarch/include/asm/kexec.h         |   4 -
 arch/loongarch/kernel/kexec_efi.c          |  20 +++-
 arch/loongarch/kernel/kexec_elf.c          |  11 ++-
 arch/loongarch/kernel/machine_kexec.c      |   2 +
 arch/loongarch/kernel/machine_kexec_file.c |  96 +++----------------
 arch/powerpc/kexec/file_load_64.c          |   4 -
 arch/riscv/include/asm/kexec.h             |   4 -
 arch/riscv/kernel/kexec_elf.c              |  11 ++-
 arch/riscv/kernel/kexec_image.c            |  11 ++-
 arch/riscv/kernel/machine_kexec_file.c     |  79 ++++------------
 arch/x86/kernel/machine_kexec_64.c         |   4 -
 include/linux/kexec.h                      |  17 ++++
 kernel/kexec_core.c                        |  25 ++---
 kernel/kexec_file.c                        |  99 ++++++++++++++++++++
 17 files changed, 248 insertions(+), 280 deletions(-)

-- 
2.34.1

