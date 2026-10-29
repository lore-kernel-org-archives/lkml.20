Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.28.146
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793252017;
	b=bAJT7Jg80v1CInRnIXv5exuJwJR2jUt0dwOva3VTsFWIEB4J6ZQXfLlDK42VmmusDi7F
	 9LUpLUhtwuvEn4xU73a7+DYMZ4acpLinlrS04d+pP9O2234fWRMJcfcd+Zkt6kCPXp5wK
	 uoKqavJUmaaeteyj/7Q6xYWYUWHsWt7Qhei1jlEJvx4bxNQCnx6w6YtIF/73y54DY6Jj7
	 5IBhivTJOUkcSkmlajmR/OzFXU6ayz8xUSS6bhclw0PeQ2nZlYi4etkfSEuB1DvWBUgv+
	 hc3DIygkHKIKKRZZBfuyQZfvmtrUhiV5mDXLPN0ppfCknk4ElDrPDsdZJy17ayt03fg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793252017;
	h=DMARC-Filter:X-Alimail-AntiSpam:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=ZdfKxEkUXmu6o45dVPSi9qEOiO+wsW3QVJmqs32pXT8=;
	b=SLDbUHG9SSc/6D+NQ7KJcRlrUKKyvQp/WD6Z2SXNucRcpzgZmiL5/SBJV6j6sil+cSyK
	 rQpp/WHi26LNkJ2nHkRV3YPNR0CPnj9LR64gMaiSkimfh8lGctcdu/yHTd995PxZVFhrZ
	 uBWbG9dTO55vwnblzwxC7dtPPCArgBuO7Gb0fVSQ3aqarqXG4OFLoaRhYZ16rFvuY/e1M
	 DCCXiqtRH6Wfu4bT5n+wYZmMCKCJAlsynX0QsS9xQcZfsmrhh6dT/ufPAcvc4KvQf/IEF
	 lNxNlE5OuFg/xe95BsTqvp6M3JAoUEPmMRD/N2iWTpjQrcxbqVEW/BChnsIDBZFaHyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=open-hieco.net;
	spf=pass smtp.mailfrom=open-hieco.net;
	arc=none smtp.remote-ip=115.124.28.146
Received: from out28-146.mail.aliyun.com (out28-146.mail.aliyun.com [115.124.28.146])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CF8F606A31A;
	Thu, 29 Oct 2026 05:33:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9CF8F606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=open-hieco.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=open-hieco.net
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.08433235|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.11656-0.0144573-0.868982;FP=7611162603862967515|0|0|0|0|-1|-1|-1;HT=maildocker-contentspam033025068124;MF=wanglin@open-hieco.net;NM=1;PH=DS;RN=12;RT=12;SR=0;TI=SMTPD_---.js2ZblX_1793251997;
Received: from localhost.localdomain(mailfrom:wanglin@open-hieco.net fp:SMTPD_---.js2ZblX_1793251997 cluster:ay29)
          by smtp.aliyun-inc.com;
          Thu, 29 Oct 2026 13:33:23 +0800
From: Lin Wang <wanglin@open-hieco.net>
To: Borislav Petkov <bp@alien8.de>,
	Yazen Ghannam <yazen.ghannam@amd.com>,
	Mario Limonciello <mario.limonciello@amd.com>
Cc: Pu Wen <puwen@hygon.cn>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Tony Luck <tony.luck@intel.com>,
	x86@kernel.org,
	linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v9 0/7] x86/hygon: Add Family 0x18 DF node enumeration and SMN access
Date: Thu, 29 Oct 2026 13:33:06 +0800
Message-ID: <20261029053313.46323-1-wanglin@open-hieco.net>
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

v9 fixes the SMN root-array leak reported by Sashiko. Each DF node now
holds its own PCI reference to its SMN root, so the temporary root table
can be freed after setup. Config-space reservations are retained on
success and released on failure.

The scope is unchanged. The series adds Hygon Data Fabric (DF) node
enumeration and SMN access. AMD NB/SMN initialization and EDAC/ATL
matching are restricted to AMD CPUs. Hygon EDAC and ATL support will
be submitted separately.

Tested v9 on a Family 0x18 Model 0x07 system with 2 sockets, 12 Core
and DDR Dies (CDDs) and 4 I/O Dies (IODs).

Changes in v9:

  - Free the temporary SMN root table and cache selected roots in the
    DF nodes instead of a separate array. (Sashiko)
  - Drop Reviewed-by from patch 7 because its root ownership changed.
  - Rebase onto mainline with the k10temp Hygon removal included.

Link: https://sashiko.dev/#/patchset/20261022074218.667049-1-wanglin%40open-hieco.net # Sashiko v8 review
Link: https://lore.kernel.org/20261009090111.151878-1-wanglin@open-hieco.net # v7
Link: https://lore.kernel.org/20261022074218.667049-1-wanglin@open-hieco.net # v8

Lin Wang (7):
  x86/hygon: Add Family 0x18 DF node enumeration
  x86/hygon: Map CPU NodeIds to DF nodes
  EDAC/amd64: Stop matching Hygon CPUs
  RAS/AMD/ATL: Match AMD CPUs only
  x86/amd_nb: Restrict the northbridge framework to AMD CPUs
  x86/amd_node: Restrict SMN setup to AMD CPUs
  x86/hygon: Add Family 0x18 SMN access

 MAINTAINERS                       |   7 +
 arch/x86/Kconfig                  |   4 +
 arch/x86/include/asm/hygon/node.h |  41 ++
 arch/x86/kernel/Makefile          |   1 +
 arch/x86/kernel/amd_nb.c          |   6 +-
 arch/x86/kernel/amd_node.c        |   6 +-
 arch/x86/kernel/hygon_node.c      | 851 ++++++++++++++++++++++++++++++
 drivers/edac/amd64_edac.c         |   4 -
 drivers/ras/amd/atl/core.c        |   9 +-
 9 files changed, 914 insertions(+), 15 deletions(-)
 create mode 100644 arch/x86/include/asm/hygon/node.h
 create mode 100644 arch/x86/kernel/hygon_node.c

base-commit: c339f4010dea8b0d754f84ace70cd1b089878ef8
-- 
2.43.0

