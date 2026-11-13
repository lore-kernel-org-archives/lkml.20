Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794528902;
	b=Mbw33rXObq/ACROpejc0xntXMUOIqNtLsNF3ii8i/5qPjJB8puyJGyJlNS7PcHGEXpry
	 4sQONsKqqzw4DAp/v3fSYemYjdV8aDL4Jysl1PaSJH6sv8yxdRVXay9HRGKkVLij711W4
	 6uO31UIHL7MfJgv+JG7/YivUiNVP6/yn9a6lj+HWqmnZOLR3Ih0yazizZoC9V7//iYLCY
	 8C5H6vxO72BSJcF9Yk448whEbaQo9pmw34yc55QLzih5fabwA7YUHPcemY6xyk06ifOBG
	 TqTnGlWJku50yViRdH5ednCy4liIQdYdKNS7+hYWF0bZkYLUlhQgFC+2q9pjtRYYzWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794528902;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=io/nvghbgAOvAI3lxRBiGzo0g/sPliqa1BecmKUyT0w=;
	b=gbVAEs49LUVLLgQc2fbToSd5koMvfoW06AYF/DOEuK43fKGKSCQY7ySuxjyq9j113Azz
	 oHqDG0u/JuIml1hq4wY0e9iSpJrLot3dFtIZFnQXffjn1cE+e8RQFtmyC/2idwVl7/z3v
	 uIWNFx9OEfxIH90nS2eq+tno2DWTxzpVhr+WDTlRqUbA7aazvU2ndMgCT7J1q7AMnubUS
	 N0A2TEcjQ5AAar0u3/rR4ld4jdqjoZOUL7REmzgr1BlqndN97KmSIg7a13fQKrtrZ6NdI
	 a94qVhbLDHV4Mxo2ENUJuUfp/rrEuhYt7R9hnrsyUYCtVx1jcGcvaMaK0M0Hi4rtTcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fq2o9HNH;
	arc=none smtp.remote-ip=209.85.208.175
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1495B606A323
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 00:15:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1495B606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fq2o9HNH
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-3adfe77d35aso4416871fa.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 16:15:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794528900; x=1795133700; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=io/nvghbgAOvAI3lxRBiGzo0g/sPliqa1BecmKUyT0w=;
        b=fq2o9HNHg0gv12a/uXWpVNVGnnFeKGskcd957vo3jbRY+lsSSfMfjCXtdHq9Aa7UCk
         v2uCpXYeLbg15clahv3eGx4uU2wY5FqoRZBo+IxkL3NcAXGB8S3qCdyzOZql1Q+f/ENo
         FxdgLOtxttZoqjw+O5ux3PPScqJtWi4ZDQKvw6Vl9Y8tn6m1DL29ArL+kMCkuMDYI6GP
         LhiAdH46OFxd7MSZ+bW7t9uHW4cRKPkKKfn8lzUmeYQB1BVGZvAhwq31FgoPytzW7jej
         kqE43YpbOkgDwjKXZ2kMq1jjNBPWL9vJXDD4/N+acd3iYXxoT+RC76KkOQIp70mngWj6
         yIVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794528900; x=1795133700;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=io/nvghbgAOvAI3lxRBiGzo0g/sPliqa1BecmKUyT0w=;
        b=lzCuhStF0ScKEhrhxW5HHN4dNXOQtIbvEOeF6JsvwFDfbuIaHIaRmnZkNKTbPoMszS
         IKJ/FFby606FwT2NMbW1jM4hLa2ueUkObINcS76UKIoNntpMqCaUeJgDORFFkvVOLtWz
         ENBtHExZdxVluQp2hQXyeQLaGCJ/2wu7rZvR9IdE/zPAG0oEIWJ7a8HrOna4NfntiC5m
         yqyToxc5xiuf1Cj4WPPbuT5dHl9YnhXMbcFCvuapxmbS49pSn9rvBtp6qUQv3vsSy5M6
         52MRJ9km5P3qIQ24lxi7Do1NqSlmxhQXJ5bbu/mNVVnYAWFuzhrcT5rWPZ5X0Va+hnBV
         6pKA==
X-Gm-Message-State: APuU4Z+Ur5SSpkgOVCCJpxLUo5Y/NJo13WtCHYm9lqfZs1lbLiwd0G3e
	7GG2VAvJdu4Cg+uPNYsMiwj24u6AhHohMA/sqRLM7DONLs38Sl6sxVa/UzGTt6fv
X-Gm-Gg: AYBFou1C6M5SyN0Z0Q3C6bDIV8vBaHmqWDcJK1AMa56RCa4MYWpSzwnpbuRbwYBuFdw
	NBw/vMUO765s8K/vzOlKbyJs41ly1FLXsWLpA1tF7tCnkOBfEgMdXWIAZH9dEE7Q+H6XJhHfZkO
	pURNyeFD2rP97PKF8HMu3iX90MXce273asdmRXnYSTGmuxQiE4iCgCQfbbkk4RbPJkxT3Pk71Uh
	VV2wMm19p2Cy3Ew3x6CdumVbxmee1bCeEcUAU0dirSzebWpwXNae92TGckfOJl/3cdb/xm+MpFo
	ciahLOGa3QejS542AJHVKb7qzExVz5mWZQmq8aitJiPQxzSIUynNcCaVQMbVb0uUm5aAVIy9moP
	JlN2UJuL1X7pl2UGefih+qxs0sThLn3D+M4EGQemwX2w+n8N28ORvWk7L5FZNlIjnszCnJFgD/X
	z+tQu6ACtw9/gqffogWHnslYUzJbC6PTkNoj07aoTNSbVJBEpwyZ4ocEi2wR2vDcW8Efi5EWyIw
	bgVqUJHtcXlNZeiu68IYQ0o+sCiyXzPQTnTVW2rO7eRhRWw8ow4nHCgN/1AqwCLeswL168snZDa
	NQ+JL5euJISuFDuzoyoQF9A8x3JAdAoM2e1xjYDcTzHVKUxenbd4GOwANaNWNsQetrWuhhvuFEJ
	w5Yxhv3vlDA==
X-Received: by 2002:a05:6512:b88:b0:5bf:c17e:a63a with SMTP id 2adb3069b0e04-5c1709a4138mr340422e87.28.1794528900053;
        Thu, 12 Nov 2026 16:15:00 -0800 (PST)
Received: from SafoStation ([31.40.65.49])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c17133ca01sm200968e87.36.2026.11.12.16.14.58
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 16:14:59 -0800 (PST)
From: Safocl Stollmannovic <safocl88@gmail.com>
To: 
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 00/10] Remove duplicate extern declarations
Date: Fri, 13 Nov 2026 04:14:06 +0400
Message-ID: <20261113001432.128201-1-safocl88@gmail.com>
X-Mailer: git-send-email 2.56.1
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Compiling a kernel module with a C++ compiler results in a duplicate
echo ‘extern’ specifier error.
This occurs because the code contains , and
expands to  when processed by a C++ compiler.
The  specifier must be removed.
https://bugzilla.kernel.org/show_bug.cgi?id=222257

Safocl Stollmannovic (10):
  ARM: fix duplicate extern declarations
  loongarch: fix duplicate extern declarations
  microblaze: fix duplicate extern declarations
  MIPS: fix duplicate extern declarations
  openrisc: fix duplicate extern declarations
  riscv: fix duplicate extern declarations
  x86: fix duplicate extern declarations
  drivers: fix duplicate extern declarations
  sched/preempt: fix duplicate extern declarations
  kernel: fix duplicate extern declarations

 arch/arm/include/asm/bug.h                |  2 +-
 arch/arm/include/asm/opcodes.h            |  2 +-
 arch/loongarch/include/asm/idle.h         |  2 +-
 arch/loongarch/include/asm/smp.h          |  4 +-
 arch/loongarch/include/asm/switch_to.h    |  2 +-
 arch/microblaze/include/asm/entry.h       |  2 +-
 arch/microblaze/kernel/microblaze_ksyms.c |  2 +-
 arch/mips/cavium-octeon/setup.c           |  2 +-
 arch/mips/include/asm/bmips.h             |  2 +-
 arch/mips/include/asm/idle.h              |  2 +-
 arch/mips/include/asm/paccess.h           |  4 +-
 arch/mips/include/asm/ptrace.h            |  4 +-
 arch/mips/include/asm/smp.h               |  2 +-
 arch/mips/include/asm/switch_to.h         |  2 +-
 arch/mips/kernel/r4k-bugs64.c             |  2 +-
 arch/mips/kernel/signal-common.h          |  8 ++--
 arch/mips/kernel/traps.c                  | 50 +++++++++++------------
 arch/openrisc/kernel/process.c            |  2 +-
 arch/riscv/include/asm/string.h           | 24 +++++------
 arch/riscv/kernel/process.c               |  4 +-
 arch/riscv/kernel/stacktrace.c            |  2 +-
 arch/x86/include/asm/efi.h                |  2 +-
 arch/x86/include/asm/gsseg.h              |  2 +-
 arch/x86/include/asm/preempt.h            |  8 ++--
 arch/x86/include/asm/processor.h          |  2 +-
 arch/x86/include/asm/suspend.h            |  2 +-
 arch/x86/um/sys_call_table_32.c           |  4 +-
 arch/x86/um/sys_call_table_64.c           |  4 +-
 drivers/soc/bcm/brcmstb/pm/pm.h           |  6 +--
 include/asm-generic/preempt.h             |  4 +-
 include/linux/lockdep.h                   |  2 +-
 include/linux/printk.h                    |  6 +--
 include/linux/sched/task.h                |  2 +-
 include/linux/start_kernel.h              |  2 +-
 include/linux/suspend.h                   |  4 +-
 35 files changed, 88 insertions(+), 88 deletions(-)

-- 
2.56.1

