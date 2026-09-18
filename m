Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3280E24A067
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 02:46:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789699601; cv=none; b=fbenDynkMF/QrWMF6Dmrab56l5AXpwrzuGEL6N0puyubQz8lDaYeSrQpG1I4MrDXiektJc3aJX3hkylYJO6NVXPwGnUCy2vg843ZX96CUi5GHBaKyLUgpj1/ViByDSXe18sNIke0m6VWUZHw4HDqiV4VeAarKo3mTBPpZbhRnlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789699601; c=relaxed/simple;
	bh=LjJ5sJnEi5EE0IvALN7ryhHg4MlSKSnPS1b4dRznO70=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=E6/MOBwlz8zTMQg6xNYrnVzXy4F3MAq4fHZ0+olyPTkOVo/aYPcJWP7DN7zpDyuIV5+W/DdGAmr0vAKYKqxCjfXudfu8kWYWaV5PyknNehlGzvlhgbsV25Q21HN/m+RkPptsSwfKuOM2RS0L304nuuXsj+kBzsghiOz3gE1vzOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JapdOEl8; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JapdOEl8"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc1cea4c79fso69333a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 19:46:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789699593; x=1790304393; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gGnBH0JUMzyPu3dd9hYfJ7ZyZxE1z3RVWLOS62okldY=;
        b=JapdOEl8JJ09r9zDhLzltwOZw4miYVxvzvfdaPDbzwfUkwOfh8Booh3hBOC3XC96j/
         mINCO7Q7H4cWRQvGNvYOQ6d0vQCtI+GP/cWdSHXbNY6nWCwu76gNLbkhuP58ADPEiId2
         lbtJCQ+tA6tTBUjapg+aee20WzxrsOCbbje3k1bPXhHYxXLFulk1WLqo2tiBuvgWvusI
         ctFxz18SlxCxgrga899Q+NbHS6gBxv3cWmE+KGi7bcjJ8Icg8bA+qyBqDy2HVAYP+pG/
         2uoDAjQtUY2aJ5VcWvve/NnqEMd0rZcG57O1jk01wvkrlSQNx5fNEMnGukfjcfQuhnva
         oVkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789699593; x=1790304393;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gGnBH0JUMzyPu3dd9hYfJ7ZyZxE1z3RVWLOS62okldY=;
        b=Wi8IerO+9tdlb6uwV5DV4rMMzF+EvCYUW0/1cFAvwIx2SOHquCWuDT+B9iYMmiO5KZ
         VHCl19gvL3vJE5pJ9k/o2mWjuUiimYTwaaS/KrJPfxGa5BPj2tlh3wkemptJ50ozKjhT
         yg5CqpDmJuwDnru8mYSc9E0ClaZql5IbfOSUMt5ZJMv9PIWIbBhd3YccnUdIjleedj4y
         Nf7Dlz1M7jJ+/EPIdq5s+vyeZMshQHcO2bWmGRbw5CRgqwoqYnTl3gFBoKboAn9k4Gmv
         JBI0fqcGlNBDDsXUkHytnVqplBIB/99uDSSDRbCJwkdDJrUJVTtolYvlMRjfF0yM1Lfe
         pgsw==
X-Forwarded-Encrypted: i=1; AKwUvBwMSEtP5FEK1YfPqaa9dY/MnqCvdFyAOdp1d5EokCYcdHUhOKaxI/AD4J4LGvxGojwrS9rEJOseYi156us=@vger.kernel.org
X-Gm-Message-State: AFuF++nJCYvzxlameXBd4Oo27h3/fIlfZYJ6ZWRoGwwhletx/kFAMjfO
	IdMB822Vx9MeOEdCXK+MBUXdwM+Cz9sLrfTFp0wxZ+mWy7RP9JnTD6ad
X-Gm-Gg: AYBFou1RMS1ZWHRG9UbGTeWQ2pnu/+j6viq74IzYGSwhBg2yBI1KhvE0xS3HiM0deht
	PTtKhXDh1sxDwuCqc0Svwt9HRHycIsREGFsUBue72C7HPR7uLs9JzXEFdVlIIwse61vWHNj+E3W
	xFYfzaeHfCQaO6EYHRwKy/kIHe4y/5WL4pDCKbOUPw7ZeaQQDHS6/9PtGgBGOuj0pkH07D1mKah
	P0TINh5Zv+wZSKD4iTSofNxBg5GCofVERz7uSrNhykv+PbudH4C6fym1V5J0DUn3PXxMa25GMME
	rFuFV9vku7RJw2PrUqNH8AJ0IkkyzmpJ2I2vSVupTwHXDWEBLr2SLOHjHBfwn1R64dSENMBiIl5
	tjISfm782Z1ws5zqK/w3tLKGk9MPSZIJ/F5qbX1YS/PizsnGdyh1sq71HUarpF/17X3aKL/GBJl
	IM/5K4gn0ymk3FTluJnLWcCzv/nXb+h020w/3XnBLQdZ127KopTMCak9/aebbnVo/hUI3TKT8tG
	CXGJiW6kDipVD2h8SQHxgkK7ym8w2Dbxbu4d8g=
X-Received: by 2002:a17:90b:3c05:b0:399:1f8b:d255 with SMTP id 98e67ed59e1d1-39e54af0c87mr2618598a91.5.1789699593167;
        Thu, 17 Sep 2026 19:46:33 -0700 (PDT)
Received: from localhost.localdomain ([2409:8a1e:2e81:7320:ec74:2ce6:f939:d0ad])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c287b0293sm349521eec.24.2026.09.17.19.46.29
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 17 Sep 2026 19:46:32 -0700 (PDT)
From: zjamg <ndaugoing@gmail.com>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>
Cc: Fuad Tabba <fuad.tabba@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yuchao Zhang <ndaugoing@gmail.com>
Subject: [PATCH 0/1] KVM: arm64: vgic: fix UAF/crash on remote LPI disable
Date: Fri, 18 Sep 2026 10:46:19 +0800
Message-ID: <20260918024620.83869-1-ndaugoing@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Yuchao Zhang <ndaugoing@gmail.com>

Hi Marc, Oliver, and KVM/arm64 maintainers,

By code inspection of commit 6da5e537f5af ("KVM: arm64: vgic: Pick EOIcount
deactivations from AP-list tail"), a race condition exists when a remote
vCPU disables LPIs while the target vCPU has an in-flight LPI in a List
Register (LR).

Specifically:
- vgic_flush_pending_lpis() unconditionally unlinks all LPIs from ap_list
  without checking whether the interrupt is in an LR (irq->on_lr).
- If the LPI in the LR happened to be the last one populated, the per-CPU
  pointer *host_data_ptr(last_lr_irq) on the target vCPU is left dangling.
- When the target vCPU exits guest mode, vgic_v3_fold_lr_state() starts
  traversing ap_list via list_for_each_entry_continue() from this unlinked,
  poisoned (or freed) last_lr_irq, leading to UAF or an immediate panic
  when locking irq->irq_lock.

Solution & Scope:
This patch prevents unlinking LPIs that are currently on an LR in
vgic_flush_pending_lpis(), ensures *host_data_ptr(last_lr_irq) is cleared
after folding, and skips the ap_list walk when eoicount is zero.

Note: this closes the primary race (the last_lr_irq node itself is no
longer unlinkable while in-flight), but the fold traversal can still
race with a remote flush unlinking a subsequent non-LR node in the
ap_list tail. Fully closing that window needs the fold side to take
references before dropping locks (in the spirit of the prune-side fix
in commit 7258770e5814 ("KVM: arm64: vgic: Handle race between
interrupt affinity change and LPI disabling")) and is left as a
follow-up.

Any feedback is greatly appreciated.

Thanks,
Yuchao Zhang

Yuchao Zhang (1):
  KVM: arm64: vgic: Do not remove in-flight LPIs from AP list on disable

 arch/arm64/kvm/vgic/vgic-v2.c |  3 +++
 arch/arm64/kvm/vgic/vgic-v3.c |  3 +++
 arch/arm64/kvm/vgic/vgic.c    | 10 +++++++---
 3 files changed, 13 insertions(+), 3 deletions(-)

-- 
2.53.0
