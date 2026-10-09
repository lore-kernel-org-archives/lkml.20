Received: from out198-29.us.a.mail.aliyun.com (out198-29.us.a.mail.aliyun.com [47.90.198.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2382C4963C7;
	Fri,  9 Oct 2026 09:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=47.90.198.29
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791536823; cv=none; b=Ujrjg7fexgwfuXWsNKPuqH0ZeKSSVHRVsY/s+PwdbB3K2RTd+XWbvTNLoz4vB9ek4QPpUDroEHsZmlipYAHlYOy28/ppr9hbDafxN9SsvGVkHnx2bkWx8i3Ap+MGyEu9JE8gfB4LeClmbKdyRhzS1ASPS/G/B0nemCeMr2bQxEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791536823; c=relaxed/simple;
	bh=zg4vFckd3PrBVH1CEMGSKY9qgnyU0gg+OYLiOU2hsnc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TK8UmAyqJYPnErxGXo0QI+/Z0+R1dzHxU9e7cb6Yi8NW+PdzGpXyz5YXGaqMoRKVdKUBfh24QNPCPcBHkor6QWYo+PYBDLJsp1VTVX/knzpGkWvrQfTQ8TUmWLffw1YCD5BQUF2UmgZj/hPB18FxFD5sZ/y1SYguTVOhJSnBdI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=open-hieco.net; spf=pass smtp.mailfrom=open-hieco.net; arc=none smtp.client-ip=47.90.198.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=open-hieco.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=open-hieco.net
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.07577801|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.126336-0.0145118-0.859152;FP=7287484011822011851|0|0|0|0|-1|-1|-1;HT=maildocker-contentspam033068005250;MF=wanglin@open-hieco.net;NM=1;PH=DS;RN=12;RT=12;SR=0;TI=SMTPD_---.jXYKw0U_1791536478;
Received: from localhost.localdomain(mailfrom:wanglin@open-hieco.net fp:SMTPD_---.jXYKw0U_1791536478 cluster:ay29)
          by smtp.aliyun-inc.com;
          Fri, 09 Oct 2026 17:01:26 +0800
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
Subject: [PATCH v7 0/7] x86/hygon: Add Family 0x18 DF node enumeration and SMN access
Date: Fri,  9 Oct 2026 17:01:04 +0800
Message-ID: <20261009090111.151878-1-wanglin@open-hieco.net>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

v7 addresses Boris's comments on v6. File-local names in hygon_node.c
drop the hygon_ prefix. The CPU-to-DF translator remains local to
hygon_node.c for now. It will be used by the Hygon EDAC and ATL support.

The k10temp patch from v6 is dropped because Guenter has applied it to
hwmon-next. It is not in mainline yet and must be merged before patch
6; otherwise k10temp still binds on Hygon and its SMN reads fail.

The scope of the series is unchanged. It adds Data Fabric (DF) node
enumeration and SMN access for Hygon Family 0x18. Hygon DF nodes do not
fit the fixed PCI slot layout used by the AMD node code, so Hygon gets
its own node layer. AMD NB/SMN initialization and EDAC/ATL matching are
restricted to AMD CPUs. Hygon EDAC and ATL support will be posted
separately.

Tested v7 on a Family 0x18 Model 0x07 system with two sockets, 12 Core
and DDR Dies (CDDs) and four I/O Dies (IODs).

Changes in v7:

  - Drop the k10temp patch, applied by Guenter.
  - Keep the CPU-to-DF translator local until needed. (Boris)
  - Drop the hygon_ prefix from file-local names. (Boris)
  - Use kzalloc_objs() for the DF node and SMN root arrays.
  - Remove the two SMN-only cache accessors.

Link: https://lore.kernel.org/20260921055603.25112-1-wanglin@open-hieco.net # v6
Link: https://lore.kernel.org/20260930004330.GFarxbMrS2DQKmC3_M@fat_crate.local # v6 1/8 review
Link: https://lore.kernel.org/20260930030004.GGarx7NIIToO-fWAww@fat_crate.local # v6 2/8 review
Link: https://lore.kernel.org/b292d054-f0cf-4695-94a2-40f0d71563f8@roeck-us.net # k10temp applied

Lin Wang (7):
  x86/hygon: Add Family 0x18 DF node enumeration
  x86/hygon: Map CPU NodeIds to DF nodes
  EDAC/amd64: Stop matching Hygon CPUs
  RAS/AMD/ATL: Match AMD CPUs only
  x86/amd_nb: Restrict the northbridge framework to AMD CPUs
  x86/amd_node: Restrict SMN setup to AMD CPUs
  x86/hygon: Add Family 0x18 SMN access

 MAINTAINERS                       |   3 +
 arch/x86/Kconfig                  |   4 +
 arch/x86/include/asm/hygon/node.h | 164 ++++++
 arch/x86/kernel/Makefile          |   1 +
 arch/x86/kernel/amd_nb.c          |   6 +-
 arch/x86/kernel/amd_node.c        |   6 +-
 arch/x86/kernel/hygon_node.c      | 887 ++++++++++++++++++++++++++++++
 drivers/edac/amd64_edac.c         |   4 -
 drivers/ras/amd/atl/core.c        |   9 +-
 9 files changed, 1069 insertions(+), 15 deletions(-)
 create mode 100644 arch/x86/include/asm/hygon/node.h
 create mode 100644 arch/x86/kernel/hygon_node.c


base-commit: af32da41b0327b9c6a37856ba82b6760d6c8d10e
-- 
2.43.0

