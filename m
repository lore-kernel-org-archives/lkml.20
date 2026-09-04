Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com [209.85.221.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BF5649EC55
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 13:30:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788528626; cv=none; b=kJKkYwIilfeL3rbC1Dzpy/ACbCfctTI1Mq+7EOqHf7jY/9UuI6e/2YYZcxw4dQCNOmGPY4N56WkChDR5zF42rI2omihWOBYtoIh7ToymeNRyh3zPJQWue/zXyUgxfIG1tU/JGSlutMSWnxDTcJa/LmC1EDOEmvCmLvlw1BMG6T0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788528626; c=relaxed/simple;
	bh=Sc3lDWCpzcNSYkPYGJ1RWdAwe0ZaTgH6K4eWHiL+UxQ=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=NGEQoNZVlEZU3CwiGAgQ//58XLzYJGYRciUK5JMltg6eb/D1PmVzsrno8UQ5SxoNnYpVtUqgyELuQEuOggHnbcxcCnphtFSziZEm5vIVVwblhbrVSyl5HjnVOS7YBJfnyEEK9f8C94w6h6Zr5KnAtqrioutO8PrTAm3EyJqF6jg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--smostafa.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=kzUIoafj; arc=none smtp.client-ip=209.85.221.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--smostafa.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="kzUIoafj"
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-48589603501so522707f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 06:30:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788528623; x=1789133423; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+aPWbmTLZvhLqGM4vE8H/jD9xFWXLFtEDa5uftDvlQM=;
        b=kzUIoafjQYSAulysi5GXKvP7CEIrHAvDsF/MBbH72gFRdj3JWG+lTmEoB1hhV1ZNeN
         cBnd1FnwNnyRRYsvqLwP/BZvIyeNL9l70LppgJsE8kZkJQ+2WhTcYqatV/ceptvyXJ1W
         +cmQwH6ncwvE+DwwOZHDefpaRLnEfMp33L3ucLXPNDVep2fiq07oW5BC1WypB61pqILv
         5jw0stVjG3v6bRtlMBJ4E6DAAcwlngZCADrlNsy8vcKP+9eA8S8CwQ+06YdyEeb4anzu
         MbTtlx66iXL/daEzxHv0NPdtYIe4yc3jHQl4ItC81gDATWLaK411bzMrRHCAhhxRDJ/j
         5EQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788528623; x=1789133423;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+aPWbmTLZvhLqGM4vE8H/jD9xFWXLFtEDa5uftDvlQM=;
        b=H4QJ2bDHxEHDbSbS49JnZmGStgwrbOuFAHICWPI5WzU6HEWBNDXGcp8Qb8x2CP8Usg
         Chkg/R4KZRykQNpMLqw6THtBKMwVNJziK0bSzCVfuo8UtIseNh8plslTJahye9IIJQPR
         wM22RW9HcMfuKKCNlBLNEJK52y9VDJk/TVDPVBWWF3N4i7o2yEahK9pAMXq3jHttJSVE
         8vryG7gwRkFGpgbEoyzI/H1pAFHo+TOp0Xr+l6PZv2cSJhL5Xrti5uCEbOwcR7Qf5bhG
         5bAJ1nxEckv9gHrj2ZayoQtsZdo4n2lewNVdIXEnxtXAdSn86T1LQV2Bu61ZnC0Mtptm
         FC8A==
X-Gm-Message-State: AFuF++m7Y7u17W3u0L9JoJQxu8LH5GrzZQE0NSvAj4pV3lEM9q7ASbvP
	XkE7P0MmW2ssYbLKgLbWgmUC68csoo4how77Mmg6RBBtvQpi3PR6wYjxBkhdGzGSSetF90qubzA
	oohP4K4yIA8w55L/1VPPCzrWWGnX4FVyE44PYNszNp6TcaDdTSzHR6cPlkdoRMEGzYFxIpHyu9q
	WWEeZ/TCmAoo719MCqIl3FBVjD3ZSdu/T7vcuOlGKLOUYIr0GnvYM3eOc=
X-Received: from wmbdx16.prod.google.com ([2002:a05:600c:63d0:b0:49c:edfd:aa4c])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4fc5:b0:49c:fe18:6dd5 with SMTP id 5b1f17b1804b1-49cfe186dfemr25609645e9.29.1788528622474;
 Fri, 04 Sep 2026 06:30:22 -0700 (PDT)
Date: Fri,  4 Sep 2026 13:28:53 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.979.g7e5102b832-goog
Message-ID: <20260904132855.638117-1-smostafa@google.com>
Subject: [PATCH v3 0/2] KVM: arm64: Add support for BBM level 3
From: Mostafa Saleh <smostafa@google.com>
To: linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oupton@kernel.org, seiden@linux.ibm.com, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, will@kernel.org, vdonnefort@google.com, 
	tabba@google.com, sebastianene@google.com, keirf@google.com, 
	qperret@google.com, linu.cherian@arm.com, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"

This patch series adds support for BBM level 3 to KVM pgtable.

Changes from v2:
https://lore.kernel.org/all/20260723182140.4025575-1-smostafa@google.com/
- Add extra checks to ensure PTE updates with BBML3 follow the arm
  architecture.
- Limit the extra smp_wmb() to non shared walkers.

Motivation
==========
I have been looking into this for the context of:
- Page table sharing between the host CPU stage-2 and the SMMUv3 for
  protected KVM.
- Use the pagtable code to populate SMMUv3 stage-2 shadowed
  page table [1]

However, BBM level 3 is still useful for CPU only operations as it
avoids intermediately breaking translation.

Design
======
Some of the conditions that BBM level 3 will be useful in (RWHZWS):
1) Changing from block to table
2) Changing from table to block

Initially, I encapsulated the full logic of BBM in one function,
which was not readable, due to different ordering and dealing with
CMO, TLBI.

Instead, I kept the logic into 2 functions, where BBML3 is added in
the make step.

One interesting case, as BBML3 will update the PTE atomically, it
can only know it raced with another core at the point of the cmpxchg
failing, unlike the SW implementation which locks the PTE first.
And as we must issue CMOs to the new mapped page before the update,
that means with BBML3 racing cores will issue redundant CMOs, to
avoid this, we limit the use of BBML3 to systems with FWB and DIC.

Testing
=======
This was tested with:
- C1-Pro cores, unfortunately the version I have does not run
  upstream, I backported the patches to Android kernel (6.18).

- mainline(7.3-rc1) kernel on a Qualcomm X1 with a hacked cpufeature
  as it does not support BBM, I did not see conflict aborts or TLB
  corruption.

I tested with VHE and protected (hvhe) modes, running VMs
(and protected), and running some selftests, that might exercise and
stress this path tools/testing/selftests/kvm:
- demand_paging_test
- memslot_perf_test
- memslot_modification_stress_test
- dirty_log_test

Mostafa Saleh (2):
  KVM: arm64: Add stage2_clean_old_pte()
  KVM: arm64: Support BBM level 3

 arch/arm64/kvm/hyp/pgtable.c | 172 +++++++++++++++++++++++++----------
 1 file changed, 124 insertions(+), 48 deletions(-)

-- 
2.55.0.979.g7e5102b832-goog

