Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793628889;
	b=3h6PWb9hv5fob0BqUAgnGmjAZfD7yodw3KjrNmFQ0SKK/RgI3qvp7zTiTwBkVXIvI7IU
	 +fh/NBj0Z/YyUZOwZz+bABohzwtitP6qfHPmhJvGlZtdhF8sbNb66DEmSmYn22yuv/FvG
	 q4JtozwK+QIEj0+t5kkifVdcTcqDmvPoZKEJeht+8ELK/6VAlm04AObhwoOT95iBELEkQ
	 dgAIQcOZB2/R88xdfuxsCFSR9bT5CSTJBbFeMXRKhzJVf516b8Kf9QqHTaR8L3dCeg0SU
	 IT7MsrKY2wnDtzG/s+aohp+zvdUKti4/EQ6pbNilO7Kqti/JHwrxf6jVmROJcFJkBJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793628889;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=I6wt0qCogvuBKigmh2JCg/spsby2CoXz9wPbiqsiJUk=;
	b=uRBEJoQVruGyjh+fwsk58AbMjBNCIjCoKPsTzAvzjugBQG1xAdSI6pasJrPjwG+tT1TO
	 CgLYyLhOJtr2fxnb0w9sNe6z/51mV2nDBVu1V+hyiogac6TtmFV4QuSfItW7v/o+3fzGn
	 QVVTlcErYlf4KbBP+ab1LKYlIlEQ7/S1G6vymxaEmlU9zAsVhIoX37YuV42jiRzT7hrrT
	 9jpsBloaDyOMWJwJ1V5xS5NudGOQn0EndotzY9Bv2D2K8e7ahlDIt5JVjORNZ1z4FM2i8
	 X8Z5rQKBnimjzisQiojFwe+fMnARqz/WYB06701Yb/DCLlRzRkQbcT9cgBrWJlkRz2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--snehalreddy.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=QeNX01qT;
	arc=none smtp.remote-ip=209.85.128.70
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com [209.85.128.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB1EE60A2610
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 14:14:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB1EE60A2610
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--snehalreddy.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=QeNX01qT
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4a20e41008cso21823735e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 06:14:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793628886; x=1794233686; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=I6wt0qCogvuBKigmh2JCg/spsby2CoXz9wPbiqsiJUk=;
        b=QeNX01qT9/V+ai+/gWSP5RuuklHQ4+vkdQy4JPFBxAh1Ojl/jKnu674CELU+l5Cg2W
         1yoXt1zLaLPSdE1Enp1kDg/03NAmCkxtRfMvo3wRN2EpqqeZDxJb1DLkTVD0tptfSZHF
         fa6pwkt28+5sCAsTnLghLDRKxQ/aW+N7kk/yA3p/0CsRQNszLrkXc8coT999oYxnwS+k
         FFWdODZ3Uzg5Jx0sbldTEwswDWOFMDGGp/fOEPi+ZCvKHnxC4yrYnlb6gPVGFoOn9WZl
         gx08mMu1hXA8jhnJg9n+6tEyE6i/x00y1/FSKGCNdLquP3Ls1/1btgo1UyI7bgSoPuRU
         P24g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793628886; x=1794233686;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I6wt0qCogvuBKigmh2JCg/spsby2CoXz9wPbiqsiJUk=;
        b=Ak8+w4Xv/xzCDbtdv2l/808ShUvTI3p0LXevslOcTcViqMaOFVAgKy0VXXeB4smMOg
         ubNIoPY6DXQN9FGjejqYOJFde+RR4XyoCIFWQA1J/ij08FQmrx2OPfWH2tWHYJlFrz2S
         C2ZMd1PHNVrm8CElqqDpvzG5ZqJh7ZoCSt4rtpblTLfifHUlXrgxDq37Zl+jvxrRdb0v
         UhH5ZO199lwXjgh48wnVbkBouKgm+nnebmyXRjuN1kEUphdLolxixqi1bBjgSv5IaMDo
         zSdmyRYO5A6fITi2ciWAE86wK6x0P/ippVxgOmmKM+/vOXrO96LLPdrq8HV9cUTbiL5z
         J5Lw==
X-Forwarded-Encrypted: i=1; AKwUvBxI1hd2tLo8xkCkd8LlHFW5vPjPwDCGVCEoPFvp+fMXvXZqI7xdXc27b50vpi3IPPlsA0Cfig09C951gJI=@vger.kernel.org
X-Gm-Message-State: AFq9FYKXyByHYpvby8DkVmft2U2ppo2NRFlEmOvsti7Rqpq7MKQYfX1U
	/qS/ZZEQkyJ8/yL7rwuTMZPwkS3bHBn+Qw0ehc43kyAJy9S6NC1C7jksO6HRroC1oYcfpEkXX0o
	tvm7/howwResK8VS6QHDPb9Bp4A==
X-Received: from wmbf3.prod.google.com ([2002:a05:600c:5943:b0:4a1:fa1d:83c3])
 (user=snehalreddy job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:628d:b0:4a1:f7f4:7ced with SMTP id 5b1f17b1804b1-4ac185bd243mr235882325e9.17.1793628886221;
 Mon, 02 Nov 2026 06:14:46 -0800 (PST)
Date: Mon,  2 Nov 2026 14:14:42 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.317.g454f8302e1-goog
Message-ID: <20261102141444.1830221-1-snehalreddy@google.com>
Subject: [PATCH v3 0/2] KVM: arm64: Support FFA_MEM_RECLAIM2 in host handler
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

The Arm Firmware Framework for Arm A-profile (FF-A) v1.3 BET0
specification (DEN0140 rev K) [1] introduces the optional
FFA_MEM_RECLAIM2 (0xC4000091) ABI.

Reclaiming large memory regions with the existing FFA_MEM_RECLAIM ABI
can take significant time, or relies on a stateful time-slicing
mechanism in the Relayer. FFA_MEM_RECLAIM2 allows an Owner to reclaim
exclusive access to a subset of pages from a shared or lent memory
region by passing an array of constituent memory region descriptors in
its TX buffer along with a starting descriptor byte offset and initial
page index. The Relayer returns the number of 4K pages reclaimed in
that invocation without maintaining intermediate transaction state.

On a Pixel board (pKVM, 16K pages, EL3 SPMC), reclaiming a single 16K
range drops from 1.3us to 0.7us (~45% faster) by avoiding
FFA_MEM_RETRIEVE_REQ/RX_RELEASE (~0.6us), and single-call
FFA_MEM_RECLAIM2 stays faster across small range counts (1.3us vs 1.9us
at 16 ranges; 2 calls break even). Up to 64MiB (4096 ranges), batching
256 descriptors/call adds 15 preemption points, capping each EL2/EL3
call at ~11us while keeping total SMC time within 5%.

This series adds the FFA_MEM_RECLAIM2 function ID definition and
implements host proxy support in the pKVM nVHE FF-A handler, unsharing
the reclaimed pages in the host stage-2 page tables upon a successful
reclaim response from EL3/SPMD.

With the FF-A v1.3 specification now at BETA (1.3 BET0), drop the RFC
tag so the series can be considered for merging.

This series is based on v7.4-rc1.

Changes in v3:
- Drop RFC tag now that FF-A v1.3 BET0 (DEN0140 rev K) is released
- Update specification references and links to DEN0140 rev K (1.3 BET0)
- Add benchmark numbers to the cover letter and Patch 2 commit message
- Collect Vincent's Reviewed-by on Patch 2
- Rebase on v7.4-rc1
- Link to v2: https://lore.kernel.org/r/20261016082341.4030770-1-snehalreddy@google.com

Changes in v2:
- Mark as RFC until the FF-A v1.3 specification reaches BETA (Sudeep)
- Rename FFA_FN64_MEM_RECLAIM2 to FFA_MEM_RECLAIM2 (sashiko)
- Check total_pages against the sum of constituent pg_cnt (Vincent)
- Simplify the flags and offset alignment checks (Vincent)
- Rebase on latest kvmarm/next
- Link to v1: https://lore.kernel.org/r/20260921164748.2958578-1-snehalreddy@google.com

[1] https://support.arm.com/documentation/den0140/k

Snehal Koukuntla (2):
  firmware: arm_ffa: Add FFA_MEM_RECLAIM2 function ID
  KVM: arm64: Support FFA_MEM_RECLAIM2 in host handler

 arch/arm64/kvm/hyp/nvhe/ffa.c | 126 ++++++++++++++++++++++++++++++++++
 include/linux/arm_ffa.h       |   1 +
 2 files changed, 127 insertions(+)


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.56.0.317.g454f8302e1-goog

