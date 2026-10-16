Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com [209.85.221.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DF0739734B
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 08:23:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792139026; cv=none; b=KQhSaFrdcrczzl5unpq1U8Z1ecSWnI27hRHd8bAhKAYe7eDJTS14555pnodQKEdO+a/4bvQxMk3NkMSe8+0p9fxFwJL7RSpxXXmGV1OcNc/lSrtc/hEBHY0BtWpEmfMIc4kg6dlAZ5t9S9G8UFUtPkGA7r0zrAEm9y3M/n+oR60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792139026; c=relaxed/simple;
	bh=TAKHJ1wRNmc6FRr+r/vyusvSCvH1hGFEGvqJ9J2tBRk=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=tGOURgpjWctn7dqSVtW1aMm0uVaS4EY/eRXBmPv9EkDXtwQdvnDBP8IXH2XMpww5DsIMMlP53oGHXCVnox8UOVKCSFDRyMIOYV/OdrCuTjQpwm3weFXbArMxV46GgxntumOzOyz7JU8bJ2MX+O7PXszGblmZGQhd2vbdug92jZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--snehalreddy.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=f5QLelCB; arc=none smtp.client-ip=209.85.221.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--snehalreddy.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="f5QLelCB"
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-48b01a74792so4028003f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 01:23:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792139023; x=1792743823; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jTA/E6KagxCsXAcjrRnC+iKPqmNPE9H/PtvqQ3MoRHU=;
        b=f5QLelCBK8vbWnPT9tGAdYljqoPbzwqlK1XPFsp4qX/dSA1/au7rdglQWwWDrXNOYz
         V3vrC3Ose+eeshIUjxzAiF6amHxyp/08f1/XywB4IuwTXfbGuqKdwOqkzUCwfi9yPz/a
         FZL/C5P1uNb8EX3kNsZvkQKwRCu77oy+DqI29+I0OPPeL8Py3m3Mho1CFT/y4+6vt++L
         F2nckcgZVAFxSrmvJlDFgW9wc6q9SQ3jJwKM+xhJRFNyDY3ZaWIu26mDrwES50ad3Mwm
         I9sjGKPx2RsXM5GOSQMi4zhakopcJnfaNYXbNlfX3wI4kBrLSIIrwSP8GaLi5XxCEhGV
         E5KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792139023; x=1792743823;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jTA/E6KagxCsXAcjrRnC+iKPqmNPE9H/PtvqQ3MoRHU=;
        b=2B6JxuZOXRcQdoPFZxWDniyeRELchbywXzMKQPQ0UbMcNOSbEUTokninlHLk2XW6nA
         UPNm0XAuuRoeut4mwqyg5UQcKJySkSoAsCn86HciAyDkVNo3jU4VttSZlEKW11fDJfyL
         B8qYsGnYov9BfdMj3I5go7B84ayNz7MaExcVi/m31E0SFGAC1tiXIOjX9bqfLS3kGjkb
         xyNsYtnSnW80V05pNt60M0SpP3xr2qjzaIWoJii+fCfU98Dl7oSPdVOoI1CksCaJWJyo
         VIyjBpBY1Gl23q2Fgaq90iTmnzlMCExR7qVYccOlfjh2q7bVnbmfykq/8MZULuzbVAgd
         aL8A==
X-Forwarded-Encrypted: i=1; AKwUvBze89Qlkgkr+RSthmq83Ba+xRteuP7cvXWE7OE7oODCWHx6BS6QPI5NYnyopHrEPYqN3G6BzLhO6In5ijQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYKRcjioR5/5v/aKeXnVdOc1Ld45TH958nCerf24hz1jgfu+9Kmh
	gJ96mmEHihJnZDV5oHsKTvnzl4koFHGAgRfvv8YkFX2C5iV+W7OyHtR8Jttkm9O5DM30k5fEb+G
	SOc2LRF+fvD2P7yeKToeZVKEpLg==
X-Received: from wmsz15.prod.google.com ([2002:a05:600c:c16f:b0:4a0:2a5:ce1a])
 (user=snehalreddy job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:310b:b0:4a1:813f:2a5b with SMTP id 5b1f17b1804b1-4a18e4a9da8mr407450355e9.14.1792139022921;
 Fri, 16 Oct 2026 01:23:42 -0700 (PDT)
Date: Fri, 16 Oct 2026 08:23:39 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.176.g3575e65682-goog
Message-ID: <20261016082341.4030770-1-snehalreddy@google.com>
Subject: [RFC PATCH v2 0/2] KVM: arm64: Support FFA_MEM_RECLAIM2 in host handler
From: Snehal Koukuntla <snehalreddy@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Sudeep Holla <sudeep.holla@kernel.org>
Cc: Vincent Donnefort <vdonnefort@google.com>, Fuad Tabba <fuad.tabba@linux.dev>, 
	Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Mark Rutland <mark.rutland@arm.com>, Sebastian Ene <sebastianene@google.com>, 
	Mostafa Saleh <smostafa@google.com>, Snehal Koukuntla <snehalreddy@google.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

The Arm Firmware Framework for Arm A-profile (FF-A) v1.3 ALP5
specification (DEN0140 rev J) [1] introduces the optional
FFA_MEM_RECLAIM2 (0xC4000091) ABI.

Reclaiming large memory regions with the existing FFA_MEM_RECLAIM ABI
can take significant time, or relies on a stateful time-slicing
mechanism in the Relayer. FFA_MEM_RECLAIM2 allows an Owner to reclaim
exclusive access to a subset of pages from a shared or lent memory
region by passing an array of constituent memory region descriptors in
its TX buffer along with a starting descriptor byte offset and initial
page index. The Relayer returns the number of 4K pages reclaimed in
that invocation without maintaining intermediate transaction state.

This series adds the FFA_MEM_RECLAIM2 function ID definition and
implements host proxy support in the pKVM nVHE FF-A handler, unsharing
the reclaimed pages in the host stage-2 page tables upon a successful
reclaim response from EL3/SPMD.

As the FF-A v1.3 specification is still at ALPHA, this series is
posted as an RFC and is not intended for merging until the
specification reaches BETA.

This series is based on kvmarm/next, as Patch 2 uses
ffa_check_unused_args_sbz() introduced in commit 3e9df0b0ebd5
("KVM: arm64: Enforce strict SBZ checks in the FF-A proxy").

Changes in v2:
- Mark as RFC until the FF-A v1.3 specification reaches BETA (Sudeep)
- Rename FFA_FN64_MEM_RECLAIM2 to FFA_MEM_RECLAIM2 (sashiko)
- Check total_pages against the sum of constituent pg_cnt (Vincent)
- Simplify the flags and offset alignment checks (Vincent)
- Rebase on latest kvmarm/next
- Link to v1: https://lore.kernel.org/r/20260921164748.2958578-1-snehalreddy@google.com

[1] https://support.arm.com/documentation/den0140/j

Snehal Koukuntla (2):
  firmware: arm_ffa: Add FFA_MEM_RECLAIM2 function ID
  KVM: arm64: Support FFA_MEM_RECLAIM2 in host handler

 arch/arm64/kvm/hyp/nvhe/ffa.c | 126 ++++++++++++++++++++++++++++++++++
 include/linux/arm_ffa.h       |   1 +
 2 files changed, 127 insertions(+)


base-commit: dd0bc00e3e9201fd49b62ff9cc07890c89003afe
-- 
2.56.0.176.g3575e65682-goog

