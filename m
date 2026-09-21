Received: from mta0.migadu.com (out-215.mta0.migadu.com [91.218.175.215])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57570369D56
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 07:30:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.215
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789975812; cv=none; b=SYzdD9Bo2NDmWNWwN2xuqoML2QBXV6R14xx3n20WhhFyNCkk93FSEku+xOtU6pGPVMOILpwVRIh75TXikkgp/YmnUGgMUVTENUtEUR+Egj3f/bG9INwc/+p8C+8lCDzwXnYOGRxY4knjnd2zJOUlZkQ+0KnL0av6oT19ASt+HgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789975812; c=relaxed/simple;
	bh=dZSTN0NcsGQY67yG61H65ikbY3v5eKu0/3cjf1zkqfk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=EEYr7rLsjG8zVMnS2klYH8XzqtTNTaZVe1nV2nDIcs/IcN6ndqNL4KCueuYFVnkajCjQVheNf8UvKYE36hgFYWo8CP/gCtP9ikNtny98ikAR7z9g4WgB8rorWeMPHcOdiTxmfayTWsWhuJCGGZX1JOsDPhd0ZwZwKQOpMWxhqQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=o2Fq0NcX; arc=none smtp.client-ip=91.218.175.215
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="o2Fq0NcX"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=dZSTN0NcsGQY67yG61H65ikbY3v5eKu0/3cjf1zkqfk=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789975804; v=1; x=1790580604;
 b=o2Fq0NcXfjlaTRTElag84jz1HuLM6Rawp88wwMKjhz2VMa6Qny3Rw1SLWzpM/7jPPiV/jrdm
 kKx6omdkWTX4bPc6y6kRwYQQj54n45Xvxi2EqJPR9VgV9d2dF+Kk8nJSr02IAk053motZZ/P7LK
 6wq+BgSbx/ICxENqI8Ncva48=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id e61c963ea40c7155;
	Mon, 21 Sep 2026 07:30:02 +0000
X-Mizu-Trace-ID: e61c963ea40c7155
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>
Cc: Thomas Gleixner <tglx@kernel.org>,
	Eric Auger <eauger@redhat.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Will Deacon <will@kernel.org>,
	Sascha Bischoff <Sascha.Bischoff@arm.com>,
	Sebastian Ene <sebastianene@google.com>,
	Yuan Yao <yaoyuan@linux.alibaba.com>,
	Fuad Tabba <tabba@google.com>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/4] irqchip/gic-v4, KVM: arm64: Fix the vgic init error paths
Date: Mon, 21 Sep 2026 08:29:54 +0100
Message-Id: <20260921072958.2918477-1-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi folks,

Changes since v2 [1]:
  - Patch 3: a vgic_v4_init() failure now frees only the SPI array,
    since that function unwinds its own state; the teardown label is
    for the routing failure. (Yuan Yao)
  - Rebased on kvmarm/next, where the routing failure already tears
    down the GICv5 state. Patch 3 moves that into the shared label, so
    the SPI array is freed on that path too.
  - Collected Reviewed-by from Yuan Yao on patches 1 and 2. (thanks!)

Four fixes on the paths that run when vgic init fails partway. Each one
needs an allocation failure to reach.

Sashiko reported the vgic_init() case [2] while reviewing the SPI-array
leak fix, and the two irq-gic-v4.c fixes came out of chasing the first
[3]. Then, just when I thought I'd squashed every bug Sashiko could
find, it turned up one more in its v1 review: the pre-existing nr_vpes
one, fixed in patch 4 as Marc suggested [4].

Patch 1 clears the irq domain and fwnode pointers at the four GICv4
sites that free them and leave them set. Patch 2 makes
its_alloc_vcpu_irqs() release what it allocated when the SGI loop
fails, which is both the SGI domains and the vPE irqs, wider than the
SGI-domain leak I described before posting v1 [3]. Patch 3 releases the
SPI array and the vPEs on vgic_init()'s later failure paths, so
KVM_DEV_ARM_VGIC_CTRL_INIT is all or nothing and a retry starts from
scratch. Patch 4 is Marc's suggested fix [4] for the nr_vpes overload.

These patches run across two subsystems, but ordering matters, which is
why this is one series. Patch 2 reuses its_free_sgi_irqs() from an
error path, which only works once patch 1 has cleared the pointers.
Patch 3 runs vgic_v4_teardown() on a path it never ran on before, which
adds a route into what patch 1 fixes. Patch 4 is only correct on top of
patch 3, which is what stops online_vcpus outgrowing the vPE array.

Based on kvmarm/next (23ddf997ab16b).

Cheers,
/fuad

[1] https://lore.kernel.org/all/20260824074245.710955-1-fuad.tabba@linux.dev/
[2] https://lore.kernel.org/all/20260807105558.73D701F000E9@smtp.kernel.org/
[3] https://lore.kernel.org/all/CA+EHjTyDix+y6NTLTsXP5j9Sn2VLOZcsw94LntQxg_etRBJZuA@mail.gmail.com/
[4] https://lore.kernel.org/all/87ik51np8e.wl-maz@kernel.org/

Fuad Tabba (4):
  irqchip/gic-v4: Clear the domain and fwnode pointers after freeing
    them
  irqchip/gic-v4: Unwind what its_alloc_vcpu_irqs() allocated on failure
  KVM: arm64: vgic: Tear down what vgic_init() created when it fails
  KVM: arm64: vgic-v4: Restore nr_vpes before freeing the vPE resources

 arch/arm64/kvm/vgic/vgic-init.c | 21 +++++++++++++-------
 arch/arm64/kvm/vgic/vgic-v4.c   |  3 +++
 drivers/irqchip/irq-gic-v4.c    | 34 +++++++++++++++++++++++++++------
 3 files changed, 45 insertions(+), 13 deletions(-)


base-commit: 23ddf997ab16b5f4aa9f948f5a68f5b35e4e398f
-- 
2.39.5

