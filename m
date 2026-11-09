Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794185784;
	b=Gp4p5VryoF4FcS7u8QeQlnB6ZfPuj/HBN5mpBChcmb794oqefidJxtdnMLEHbAocqKmX
	 2KyB67vgk3DbP2Uhq8KBEwzjrfhUk5DsHj1z18Dmq6M/DeKabF23lpumZ/ywjNBsBcbyK
	 WkXk4MpIQkRikjRuxzSLpXh96nw9q19obBtEzNerVCXoJgDwRYp20T9z48tNpOheaLdUP
	 WQcSJS3KxhIV1owGeYvVNRv6f3/R1SjebpI6UQ+GxDmwC5srfL4bDbKqAkBiUMj94N6M6
	 AdXHxgnTc8xj1D2y7bVZ71pdVc8kfLhclULqNtYCVzae30cK0i0W/lAKtOQNzr9WMcQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794185784;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=wWvcDa/WwpL4fAk+8aWJpTDqskV0sSrReLOpPCt1GP8=;
	b=N8xZ1elkzoN3/1Fjew8MP2U+wwgJvC8rLIUtzsi6WRSY3ltonigGUdh/tcn5RFLdjFKt
	 On4TNR25s6p1Ry3VGeoH3vOV+1YFVB4bitHCt4ePS94viDMNTeMZ7egV4UJc+XiTLYR6c
	 7yvdNY8Pq/JKcIU/f8xnyjWjPQB276jik7n9jq6kQRPfoyvVxWuP+0+8ovfjeTZT38MJx
	 ohJlZj7wymn+nX4JDUtKwWNqEnt0PaxGqCL1Ra65H3C52izQ7oKdk1k2GDDgtML77DaN0
	 q1lwUsWQhhcQrwwpinLbE3YV6CLUQl3eAD72awkPJpURyyCgbG12zVc2mCu8Il+RJeQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hJmihHlY;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DAA3606A31C
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 00:56:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hJmihHlY
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3402B1F0089F;
	Mon,  9 Nov 2026 00:56:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794185784;
	bh=wWvcDa/WwpL4fAk+8aWJpTDqskV0sSrReLOpPCt1GP8=;
	h=From:To:Cc:Subject:Date;
	b=hJmihHlY1KY9fSPEHHq/wRf+rIUkbw6KfI9lXcmq1qCKwjATn34gLnlatfOVZWDR4
	 BfD0uHtHLN51tSLXXIR1lhHacA2P1qYkyL3FrW81K9CMYRs/YsF2NeshWDACNm9UW3
	 pPYKbZeQMrbmR+Oeupsi7FiLkTzWMZVfMDxAy9Rnv93eV9yLZaco85okmhjxl7akjJ
	 vp+z4T8wR6uQepuJbTm90BR6x9t/U6olIViyzovp1N2n8WqjWN9WwAt1P0Wdzj59aQ
	 cJoDpWR/RkSks4vDmQnkGI1IhnOoZxC6Wk0EooqeBSjOtDKoCnOKvDCFKFnky16uKE
	 LbgotiwjR+Gxw==
From: Thorsten Blum <blum@kernel.org>
To: Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Nicolas Schier <n.schier@fritz.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	"Lorenzo Stoakes (ARM)" <ljs@kernel.org>,
	Vitaly Kuznetsov <vkuznets@redhat.com>,
	Jan Stancek <jstancek@redhat.com>,
	"Pratyush Yadav (Google)" <pratyush@kernel.org>,
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	Thorsten Blum <blum@kernel.org>
Subject: [PATCH v3 0/4] x86/boot/compressed: Enable -Wunused and remove unused variables
Date: Mon,  9 Nov 2026 01:55:28 +0100
Message-ID: <20261109005528.3477-6-blum@kernel.org>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1692; i=blum@kernel.org; h=from:subject; bh=oRLokQfYDPEMTVnqRXOhsHiQU1F/6UlA3R93CYSlwyE=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDFkfpRimqEXM5HsaJNByJr/waJTIq+M79gtoOnbe0I84/ Gmh78EdHaUsDGJcDLJiiiwPZv2Y4VtaU7nJJGInzBxWJpAhDFycAjAR4RkMf4XX8K9dKrZaeoLy grP7Zs1mL37boXDG0cjIouTKF9dPeacZGf4q9gVwxEXcMX0T8mGGs8qx3a6vt1xcW7mx+m1Ng84 yIS4A
X-Developer-Key: i=blum@kernel.org; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit

This series marks potentially unused variables and functions as
__maybe_unused and removes truly unused ones. Patch 4 enables -Wunused,
matching the W=0 kernel defaults. With WERROR=y, the warnings failed as
follows:

  arch/x86/boot/compressed/acpi.c:25:1: error: '__efi_get_rsdp_addr' defined but not used
  arch/x86/boot/compressed/acpi.c:29:6: error: unused variable 'ret'
  arch/x86/boot/compressed/acpi.c:57:15: error: unused variable 'nr_tables'
  arch/x86/boot/compressed/efi.c:64:16: error: unused variable 'et'
  arch/x86/boot/compressed/efi.c:136:6: error: unused variable 'ret'
  arch/x86/boot/compressed/kaslr.c:600:13: error: unused variable 'i'

Patch 2 also drops a redundant efi_get_system_table() call and uses the
existing efi_get_conf_table() error path.

Changes in v3:
- Rebase patch 4/4
- v2: https://lore.kernel.org/r/20260624120300.590233-6-thorsten.blum@linux.dev/

Changes in v2:
- Fix a kernel test robot issue by marking __efi_get_rsdp_addr() as
  __maybe_unused: https://lore.kernel.org/r/202606240416.cXegPpiJ-lkp@intel.com/
- v1: https://lore.kernel.org/r/20260621144116.224010-6-thorsten.blum@linux.dev/

Thorsten Blum (4):
  x86/boot/compressed: Remove unused variables in EFI helpers
  x86/boot/compressed: Clean up EFI RSDP lookup in efi_get_rsdp_addr()
  x86/boot/compressed: Mark process_mem_region() index __maybe_unused
  x86/boot/compressed: Enable -Wunused

 arch/x86/boot/compressed/Makefile |  3 +++
 arch/x86/boot/compressed/acpi.c   | 18 ++++--------------
 arch/x86/boot/compressed/efi.c    | 17 +++++------------
 arch/x86/boot/compressed/kaslr.c  |  3 ++-
 4 files changed, 14 insertions(+), 27 deletions(-)

