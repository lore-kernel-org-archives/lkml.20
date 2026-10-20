Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=65.109.113.108
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792455899;
	b=hopQb4zCmR+q7p8H15oNycSzdLXQIP1WmgKFs+1N5xFeY8OR3qhv/wkyuF9alOBKt0Gw
	 QslbP8oJjvmdTVUBaa/CcAxUnvglg8FCY4mRWay1jCGn/6PoGfU/ZLDN2j5HNdc2cxuoA
	 M2N4VrX7ydw1E08SLQrMo6AOnbJz/hKj2bOeSxK7RPqMG8Dbr60mOIY2CeT7/qN8IL7+v
	 CWVkRt2e2tMLs8U/SwPK5zstkxBwFcCrlQ+bjIaonBANyEU/MlYrwSge6wknLXI7w4YOa
	 dbq9cUQxPZeZgUulL1CzODOZjTEncArS5GD/UFcswFHJtevf8ieAFGuu4nQp8JXG6IA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792455899;
	h=DMARC-Filter:Received:X-Virus-Scanned:Received:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition;
	bh=CnJ245Id2h87Ob+Q9Qzv5inIi7sztZ97my3rOiOUhD0=;
	b=HBjK+IPg8J3A3F5Ng5bSxNMuJxFqrMThHU8XLM38Y2GrxtBdhEhrqMUqm48ptWVgKP+5
	 icdiuD7wRiB7njYNq2xHXGI1asieLxJKlQIqDgVW4Gu+1epGAa7Xw8SJe2gSciwDKQpz6
	 BLSpMoq4mTjooQgFcRn5PvYKQrvss0LRcRTkV0FGgfi8WqfGlyQNheq2DblOUIPDVKkc8
	 6nngZJmU38enYb2KZ3gFqezdh8Z8hSz2x6KqBoYH4Sd8XdOKvJ/Kp8ifo5sT94b+R7Svk
	 k4F7AjYtNKDkiY4dchYCmt9n7xEyiVrdbuyo1IpNwDBdPk82ShFYWseK7uTDsWoyxIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=alien8.de;
	spf=pass smtp.mailfrom=alien8.de;
	dkim=pass header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=Vb7hgp99;
	arc=none smtp.remote-ip=65.109.113.108
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91646606A319
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 00:24:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91646606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key, unprotected) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=Vb7hgp99
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 9BFB640E029C;
	Tue, 20 Oct 2026 00:24:56 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id Pj6wnBYsi4rC; Tue, 20 Oct 2026 00:24:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1792455892; bh=CnJ245Id2h87Ob+Q9Qzv5inIi7sztZ97my3rOiOUhD0=;
	h=Date:From:To:Cc:Subject:From;
	b=Vb7hgp99tWlU+OMsZ5FgCkVu6CatFYaXaS4XApwzh1eWP+ABMFZXY7yD4HOJQ+Frw
	 AXOc0FEW0nDkMazkqh8lPC3jEf028FMQAVFbEjaeBHPuf9M756hgHm/ZAiRUDfIe/U
	 9DEJN9234hAbbtmsM2wyGaM2DxvByCKEfBUnQbYHnH4ANjzVS/HK8K0vMl7qbjvW8B
	 W14MedvzzAfbbqg1yKbUnvdmMcM3VXfJIXLToa6YVXKlO5Qn7rTs+MX1I/aT6OwT/l
	 vFgOLHcwbd9x2ZWsiW9Fa4zafuKUTLrEhX2xMqq6rcUp9JO5pcPLpGp1nC6L5EBwCM
	 2zGen5Uo5EZpDrM0CVleGPo/moMBGM+POM4pFDONlDeCAgImljfNwJdg1QbRGYnICw
	 S9jOkMgYBf2Er2HCIUQ6vq2kA+D4kVk9abYl9MUktXaIDL3FSLaHIpYRdFkFHlFvO9
	 j/xN0UhkOAVHh9417UybshPEuvVIDPp+Qq+kyHJ6eentgiRxEhRyxNYcPV8aHwFNT1
	 CKBKlhHe2vDohgMjUhwzCWmG80nR10y5w8u8a2p4UgYmtZZgzIWGEbiEFKLJQhhiKt
	 vXdgN5awE1hwAUHN+/iO48cMxsEbUizvObsy0VmB5kspRUKbJPmruVwi2mHz2HV1Pv
	 WfRhKj7xKMRljnDfciGLX8ok=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 4D65840E029B;
	Tue, 20 Oct 2026 00:24:49 +0000 (UTC)
Date: Mon, 19 Oct 2026 17:24:46 -0700
From: Borislav Petkov <bp@alien8.de>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: x86-ml <x86@kernel.org>, lkml <linux-kernel@vger.kernel.org>
Subject: [GIT PULL] x86/boot for v7.4-rc1
Message-ID: <20261020002446.GAata0znTHnFvT5ePT@fat_crate.local>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Linus,

please pull the x86/boot lineup for v7.4-rc1.

Thx.

---

The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:

  Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)

are available in the Git repository at:

  ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/tip/tip.git tags/x86_boot_for_v7.4_rc1

for you to fetch changes up to dc2a1671d983d26b8ea5a4c5de9c5a028707f40b:

  x86/boot: Drop unused implementation of panic() (2026-09-28 18:07:34 -0700)

----------------------------------------------------------------
- Rework the early decompressor some and drop the version of panic() there
  which used vsnprintf() supplied by the EFI stub even in legacy boot cases,
  where the EFI stub is not present. By Ard Biesheuvel

- Fix unbootable VMs with CONFIG_PVH=y and CONFIG_KASAN_GENERIC=y where the
  compiler decides not to inline __builtin_{memcmp,memset}(). Force the
  inlining with the kernel's own __inline_* versions; by Mauricio Faria de
  Oliveira

- Cleanups and fixlets

----------------------------------------------------------------
Ard Biesheuvel (3):
      x86/tdx: Share tdx_panic() with the EFI stub
      x86/boot: Move unaccepted memory handling out of the decompressor
      x86/boot: Drop unused implementation of panic()

Mauricio Faria de Oliveira (4):
      x86/boot: Remove redundant "cc" clobber in memcmp() and document it
      x86/asm, x86/boot: Carve out inline memcmp() into a separate header
      x86/asm: Group inline string functions
      x86/pvh: Really inline memcmp() and memset() to fix unbootable VMs

Thorsten Blum (1):
      x86/boot: Use BASE_BAUD and DEFAULT_SERIAL_PORT

 arch/x86/boot/compressed/error.c        | 19 ------------
 arch/x86/boot/compressed/error.h        |  1 -
 arch/x86/boot/compressed/mem.c          | 42 --------------------------
 arch/x86/boot/compressed/sev.h          |  2 --
 arch/x86/boot/compressed/tdx-shared.c   |  2 ++
 arch/x86/boot/early_serial_console.c    | 13 ++++-----
 arch/x86/boot/string.c                  | 13 ++-------
 arch/x86/coco/tdx/tdx-shared.c          | 31 ++++++++++++++++++++
 arch/x86/coco/tdx/tdx.c                 | 35 ----------------------
 arch/x86/include/asm/cpuid/api.h        |  2 +-
 arch/x86/include/asm/sev.h              |  2 ++
 arch/x86/include/asm/shared/string.h    | 52 +++++++++++++++++++++++++++++++++
 arch/x86/include/asm/shared/tdx.h       |  1 +
 arch/x86/include/asm/string.h           | 21 +------------
 arch/x86/platform/pvh/enlighten.c       |  3 +-
 drivers/firmware/efi/libstub/x86-stub.c | 39 +++++++++++++++++++++++++
 16 files changed, 138 insertions(+), 140 deletions(-)
 create mode 100644 arch/x86/include/asm/shared/string.h


-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
