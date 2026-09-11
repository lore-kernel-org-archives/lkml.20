Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D8B6364EB0
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 14:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789137766; cv=none; b=eN0pqFwbtb8ILl6KvvKew2mPecKVc7Qr9q1rp6CI5nj0SKL2cUKrKtDB3ejQKFkHc21gkVXR1/hwawFFuA/iXr8rvXaVCZH6vqEIcf2K1PWBwgvx7vN5YjxOhy9mb1oN1HvSRDBAtA2r5ZgjiB7/uxGWBgjv+R+qrRAJZuIFbBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789137766; c=relaxed/simple;
	bh=q72VP5n2ZqcEGQgXeUc2xgK/v4cYAsj+QPvCunTuwVY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Z7OdekhaliQvMc0OObTnITuIXJBd1KgdZHWADvjaL0rB+9V+ym84z9fHp4+W/xB53NJF0qP5iweKCndF6lUwzps8bfBnjOlw8TNwSIkwZBBGB/9qe0TGQ7R01BzsarWY8piANKA3qWGKMfVb+TbupTyAzQLkdqfd6GroaAZmToc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Oa3P+L8h; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Oa3P+L8h"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-49b965570d7so12480145e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 07:42:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1789137762; x=1789742562; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jtpnUSLeT4ed4dWoaotfN7ey6FZzLAllCqnmIx1g6CU=;
        b=Oa3P+L8hS5uNkz4niILTnDU6g1KqJOSl07IepB97cothgdPCtzuCqnHr/Ris3t2ZR8
         sGkTWTi39H/kGliiNFSxa0pUXav5NACiZBUbIZqFUI13DgVISvAq88kOck1kbYFi11tk
         s4sImAXrp0+0BrBPFV/bgoXbfYPSQ2U9tgUBOoKcPrjPzdYEpkQ8wEGQ4piPm1CBnpGW
         R2CENzSyKArysWyQJOek25TAS9jAHzB1dD5oxZNEiOsAc6HGliIqUVV7lpvk0PnnfgQR
         HmYYuiyKuLCBKsQJkovTAhy31kk/CGgXmHzLt5NI98yDOS9OC9W6h6M8cThDQ67eYvP3
         dvbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789137762; x=1789742562;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jtpnUSLeT4ed4dWoaotfN7ey6FZzLAllCqnmIx1g6CU=;
        b=oygbyKHuMtFaRv6BGyN3OZG6+HmYudxDazTYZroFT0hJRwW0Oq8buss3WJ4a5cwT3X
         5lUT8JCM23rSXna/B/q2TxgKgeMuwn8fSp2reYt17SUJXGxMvtr/m+CZbE0k5IPoXauO
         Qysr+2CbVFzXSxmm3sCHnjn15mXZlWCZm3sdn13Hk3x2mPRPLV2fjxwlkEi3HWDLXvEz
         KopIZf2HXUvbphIBxsoDBNPOUtTEtUY0TYfRUTlA+dlDiRRQyUYI7nya4izlCdzCFCd7
         AanmsEaiR/OAd6hZJurADmRkIXlCq+T/aJUAVx3Gg1unydmsM9i17aY/UgrK9Q1qOF9D
         LPzw==
X-Forwarded-Encrypted: i=1; AKwUvBxxbp2/5/NAAAsN++/zOEt9VwWuPyAtE0QnNwWcW5hQwNS08U/97g7AVaCaOwi6fo5b/35k7BquK/XGFTk=@vger.kernel.org
X-Gm-Message-State: AFuF++kTH9esk1QrTDhxY0L9KtERyka81j3U4AUAWFHD+d/BWlSbkYnn
	0ARxaDxKm30Vc0tTqAZA8lZuBCebJt2cJccrfaKCONfPy6qvKJC+mkhkjPUaMNHPo5s=
X-Gm-Gg: AYBFou1ls9uDnZl1nQFbkEYCaQV6Dh7rWkWRouSXvOzz2WPCfb6/zrUc1W5bBrVXSGE
	iovb+UqqpQPju94HmoRuAzsfK4VLMJ6iqH+G5uK3IYbVS19EMCfpEH4uG4G2erKv+/Yv8GA0izZ
	AqvIb10iYFOPi5JCh8fJMCHceOTrfw961bv4c4Qj2+UEUPUkpgS4Byn0OiyGCobyM5R7dTkt4TX
	f68rgSHcKCB0eVBoOJuiDR0VQ2uYoQhnk7n8EzFjix4pBdQdYURbpxo+c9bFuaTQBUSTVHQO9+h
	Dq9iJiaQMW6i2Gzq3izGHlskvhQSF7dtCxasHV5A8FSeH5pZTtrqALG4b6pb80PcOYDIVdS3fIT
	HEdskkLbz/+E4TrJfXmHZQ45Q1FNfF/8BajyElNorKtM5GyKtPKqTmcairsfQscCIfEPQTg+tdn
	jFjJDmoqxjYNjxBr7OnEBvNvtygoB1mt1hrwe3Wjr5bfjtpCbyID5iWLjcj5RNlk1E0NwbkEsu2
	K6nNw==
X-Received: by 2002:a05:600c:1f8d:b0:499:be2d:c290 with SMTP id 5b1f17b1804b1-49e6198933cmr55970145e9.9.1789137762240;
        Fri, 11 Sep 2026 07:42:42 -0700 (PDT)
Received: from localhost.localdomain ([2001:af0:8000:1409:193:86:92:181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e60ababd5sm107038405e9.4.2026.09.11.07.42.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 07:42:41 -0700 (PDT)
From: Petr Pavlu <petr.pavlu@suse.com>
To: Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Peter Huewe <peterhuewe@gmx.de>,
	Jarkko Sakkinen <jarkko@kernel.org>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Daniel Gomez <da.gomez@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>
Cc: Xin Li <xin@zytor.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Andy Lutomirski <luto@kernel.org>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Janosch Frank <frankja@linux.ibm.com>,
	Claudio Imbrenda <imbrenda@linux.ibm.com>,
	David Hildenbrand <david@kernel.org>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Aaron Tomlin <atomlin@atomlin.com>,
	linux-s390@vger.kernel.org,
	kvm@vger.kernel.org,
	linux-integrity@vger.kernel.org,
	linux-modules@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/6] module: Limit ELF includes in linux/module.h to uapi/linux/elf.h
Date: Fri, 11 Sep 2026 16:40:30 +0200
Message-ID: <20260911-module-include-elf-v2-0-954c732975fb@suse.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Change-ID: 20260816-module-include-elf-a9c10c041867
Content-Transfer-Encoding: 8bit

linux/module.h appears in roughly 15k #include directives across the
kernel. This makes it a "hot" header, so it should avoid pulling in
unnecessary definitions.

The header currently includes linux/elf.h but this is largely unnecessary
because it requires only the base ELF structures, such as Elf_Ehdr and
Elf_Sym, which are declared in uapi/linux/elf.h.

Replace the linux/elf.h include with uapi/linux/elf.h. On x86_64_defconfig,
including linux/module.h alone results in 2.2 MB of preprocessed data. This
change reduces that to 1.5 MB.

The first five patches are cleanups to avoid relying on declarations being
indirectly provided through linux/module.h -> linux/elf.h. These patches
are mostly independent and can go through their respective trees if
preferred, except for the cpufeature patch, which depends on the preceding
s390 cleanup. The final module patch depends on all of these changes.

It is hard to identify all files that indirectly reference something only
through linux/module.h -> linux/elf.h. The changes were build-tested with
allmodconfig on arm, arm64, m68k, mips, powerpc64, riscv, s390, x86_64.

---
Changes in v2:
- Rebase on top of v7.3-rc2.
- Add the missing include of linux/slab.h in
  drivers/virt/coco/arm-cca-guest/arm-cca-guest.c.
- Remove the asm/mmu_context.h include from asm/elf.h on s390.
- Add the missing include of linux/elf.h in linux/cpufeature.h, reported by
  the kernel test robot.
- Clean up commit descriptions.
- Link to v1: https://patch.msgid.link/20260707153819.4172541-1-petr.pavlu@suse.com

---
Petr Pavlu (6):
      x86: Avoid indirect includes through linux/module.h -> linux/elf.h
      s390: Avoid indirect includes through linux/module.h -> linux/elf.h
      drivers: Include linux/slab.h for kmalloc() functions
      s390: Remove the asm/mmu_context.h include from asm/elf.h
      cpufeature: Include asm/elf.h for ELF_PLATFORM
      module: Limit ELF includes in linux/module.h to uapi/linux/elf.h

 arch/s390/include/asm/elf.h                     | 1 -
 arch/s390/kernel/nospec-branch.c                | 1 +
 arch/s390/kernel/processor.c                    | 1 +
 arch/s390/mm/mmap.c                             | 1 +
 arch/x86/entry/entry_fred.c                     | 1 +
 arch/x86/entry/syscall_32.c                     | 1 +
 arch/x86/kernel/cpu/intel.c                     | 1 +
 arch/x86/kernel/fpu/xstate.c                    | 2 +-
 arch/x86/kernel/process.c                       | 1 +
 arch/x86/kernel/signal.c                        | 1 +
 drivers/char/tpm/tpm_crb_ffa.c                  | 1 +
 drivers/s390/char/uvdevice.c                    | 2 ++
 drivers/virt/coco/arm-cca-guest/arm-cca-guest.c | 1 +
 include/linux/cpufeature.h                      | 1 +
 include/linux/module.h                          | 4 ++--
 15 files changed, 16 insertions(+), 4 deletions(-)
---
base-commit: df2908090cda368b01ff43709f51890076c56157
change-id: 20260816-module-include-elf-a9c10c041867
