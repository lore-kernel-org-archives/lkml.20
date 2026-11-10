Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794311880;
	b=F+Qd8xTkzMy1XTA/P5+SnEP/8ZGOawCxyFlIbilX1GbAuarzE/HtZw5NcCAf6Lnna6Jo
	 w6xG/BgLGc8YS8+s0mYRRGimTqgOfiER5D4hNLWZa0uE5QN4AvWwd6RmJuyp2VVGftRqT
	 9Hv2tRoft9HG7VZNQ7TH1wig2G0laxKq1yK4hOfbNaCILZGlmc++KedlnT2HCUUm9g4He
	 CQMKfJr+lmx8/K+mNrCBWoblvEzJyyuosd27gi0QKvgHWYJAvb6eRXdni4hDVdIK/S7Ah
	 7resG5v67njRX2H87mCDh7ZhrqZHLfIy6EHdb1Z6/ZOVO3PCUowmWZ/oHvQn4qEhi3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794311880;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=6Xj0QxkQezTmkbwDHt3en+LQXdg1IEDHWEh4FNkZaAs=;
	b=5Gd/48up07dc1Imqn4GkYT1ITSD+GY/qMW66jXeH4E8rj7gnSKGSr8+JgD08a3X30sxX
	 JC1aA47qYkY1n22eb2l/m3JI9VivzlySw+UY095V26wi0ragrd/hbz4Auim5U9rqo179m
	 gSrRtV+SGQYDxSK1eqJLbiZbNIn/cnWyWnU8G2Wn7XlCUehIqseWFz9awPR+NrXdcKr5R
	 61qy610gMYpcEtYv0mpDHv/wc1LOCGuEyzuy38mQYdjSryBIIF66Bk/by731unIE7fACc
	 WycfEHCj9hBJhM0xnm9jywtHQZJ8BxYFjSJpTl5HF5ara4e/5oWruajVupP4mGUlFsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=btkagQGY;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6262E606A321
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 11:58:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=btkagQGY
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F6681F008A2;
	Tue, 10 Nov 2026 11:57:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794311880;
	bh=6Xj0QxkQezTmkbwDHt3en+LQXdg1IEDHWEh4FNkZaAs=;
	h=From:To:Cc:Subject:Date;
	b=btkagQGY5CLLQ++gdoX4JUteYEoAss9m6lDwQ8JpY1Rnp3OM5LFU1r8W2DWV3O/3W
	 d+3RO+b3UsXW7IlaJoj4RlQtlpdlygU6H3Ccq2tJH0UewxJy1OiJe1IXOyA0y0NY1e
	 n49OpFJ1S4vPFSHfTtxiYFYDNE4jU4N0yfLrMuYfws7Q1zD1GL8gLagrbsyQElpexw
	 MGQKal/vMMb1p5vRNsp5+osXeYwokb9c4GB+bAoGFvbcpyvUwnVPi+2Ua6Mq6L+JV9
	 UmRUnu6Wci8Y4ZYp8jOtOfoccYDgMvoexzEK1gB7hpzWcrOpikofvWPms94oXriw9/
	 T7ClTeTKfg+9g==
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
	Jan Stancek <jstancek@redhat.com>,
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>,
	"Pratyush Yadav (Google)" <pratyush@kernel.org>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Andreas Larsson <andreas@gaisler.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Kevin Brodsky <kevin.brodsky@arm.com>
Cc: linux-kernel@vger.kernel.org,
	Thorsten Blum <blum@kernel.org>
Subject: [PATCH v5 0/4] x86/boot/compressed: Enable -Wunused and remove unused variables
Date: Tue, 10 Nov 2026 12:56:07 +0100
Message-ID: <20261110115606.133611-6-blum@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2180; i=blum@kernel.org; h=from:subject; bh=snyny58gM89SuPRkDr1PFHUIVG/Zet6BRJojUMXQpfY=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDFmf2cI+MPitPt0qrlatdt2r8u7MqkWKqoy3+FPO6NyOK exmnuLYUcrCIMbFICumyPJg1o8ZvqU1lZtMInbCzGFlAhnCwMUpABM5bM3w38vmS+rqNfnL9f5d kmmKDM3RtJy/L9vZ65oam2ZZ7ppzzowMj/UMZR5kLzXaeiZ98eHLRmVG1ncPpD6virWN62Qufer PDwA=
X-Developer-Key: i=blum@kernel.org; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit

This series removes unused variables and marks __efi_get_rsdp_addr() as
__maybe_unused. Patch 4 then enables -Wunused, matching the W=0 kernel
defaults. With WERROR=y, the warnings failed as follows:

  arch/x86/boot/compressed/acpi.c:25:1: error: '__efi_get_rsdp_addr' defined but not used
  arch/x86/boot/compressed/acpi.c:29:6: error: unused variable 'ret'
  arch/x86/boot/compressed/acpi.c:57:15: error: unused variable 'nr_tables'
  arch/x86/boot/compressed/efi.c:64:16: error: unused variable 'et'
  arch/x86/boot/compressed/efi.c:136:6: error: unused variable 'ret'
  arch/x86/boot/compressed/kaslr.c:600:13: error: unused variable 'i'

Patch 2 also drops a redundant efi_get_system_table() call and uses the
existing efi_get_conf_table() error path.

Changes in v5:
- Drop unrelated fall-through change from efi_get_system_table() (Ingo)
- Avoid __maybe_unused and declare index in for loop initializer (Ingo)
- v4: https://lore.kernel.org/r/20261109124816.61438-6-blum@kernel.org/

Changes in v4:
- Add a newline to the log message in efi_get_system_table() (Jan)
- Make efi_get_system_table() static and update misc.h (Jan)
- v3: https://lore.kernel.org/r/20261109005528.3477-6-blum@kernel.org/

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
  x86/boot/compressed: Declare immovable_mem index in loop initializer
  x86/boot/compressed: Enable -Wunused

 arch/x86/boot/compressed/Makefile |  3 +++
 arch/x86/boot/compressed/acpi.c   | 18 ++++--------------
 arch/x86/boot/compressed/efi.c    | 17 ++++++-----------
 arch/x86/boot/compressed/kaslr.c  |  3 +--
 arch/x86/boot/compressed/misc.h   |  6 ------
 5 files changed, 14 insertions(+), 33 deletions(-)
