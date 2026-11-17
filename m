Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.226
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794933431;
	b=uSeQi044Y4Yr49E5Bmv3lvw+DOxB/ZDM0u31dYHWb+ANtKJVJhgRtH71kVHG3fbYx1vV
	 LzaMKvLVBJcAtal4U1SEPxwwySL+3KFBe50BHjF+vbsY+x4u2EZ3MC3MYI8OGYN0dtzkI
	 EDJedVhsnMnraSMtjgC9oZ/NmYfIjWVms/l8oGy5BLAd4rt0qxVWPbiTurqPuYf7ZxB/S
	 YZ+FHQYJjICVMU/s0ty/C8tb7/XF+XhglU+QbqILWO238fDP4srlB2Ppdn0cafnlGPMJG
	 yb3D+zsZGD3qwdIMWlriAwmhv0zmVC2HyG+pwmph/y40wog7q7eDeUdEwzeDDDKBcvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794933431;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=AuJAo5sXOKJqP6dr35P+8qt11I9icgfuipOCWrKlAKc=;
	b=o+QHcb9CqFFTAGBKq+GKEthDplx7NSAzd59oBl/gkRYzkeeh55+WqQNi8+UZwAEhBP5U
	 gqGRK2yLWwHOfjtA8zU6Gwqxwsf4dE5Jxkxawn1PsBnDSI8a5shcyJxCQZXue/oTNetmN
	 7r31jc0IsVjL0HaL4RrKIdkNuol1Y9X0TajxTbloBeDhja8OVreTYP+8qlwaFjeGB+I/E
	 sMDIL/DL48t9sz1upLEov8raAsFJ+ysiSGHcaPc4UyFNErCf26PLcZn3qw17FLFmQaITu
	 veAO6EfxH94S2gSNvpR8S9nY06jEOAJfOY2ptoQfTAVDv7h4GyhJiQIuss1DxmvIE0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=UunQStG2;
	arc=none smtp.remote-ip=91.218.175.226
Received: from mta0.migadu.com (out-226.mta0.migadu.com [91.218.175.226])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6635C606A33F
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 16:37:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6635C606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=UunQStG2
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=YdLYpWBKlUKagfnJowyll08aWW+OkxhrNMtlF8HSUF0=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794933428; v=1; x=1795538228;
 b=UunQStG2flJ7i2z/bNktiF/N/+QpV8nCmajDlax98OTEX1f+i1sJgS7Q0hTzFFHvOQAmdmKr
 zXCjVX1BlYgtZk6v0gTGrOXPXpRiATFSkN79FeMd/s1qY+l4LoSYxTTQyVfATLcm+BuFApvgqny
 K8UcBmsRFwINnPIAlNP9GQRQ=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id adf884b6486dea4a;
	Tue, 17 Nov 2026 16:37:08 +0000
X-Mizu-Trace-ID: adf884b6486dea4a
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>
Cc: Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Fuad Tabba <tabba@google.com>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] KVM: arm64: Fixes for the host SMCs that pKVM forwards to firmware
Date: Tue, 17 Nov 2026 16:36:59 +0000
Message-ID: <20261117163702.1678277-1-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi folks,

Changes since v1 [1]:
  - New patch 1, which stops forwarding the host's SDEI calls.
  - Don't run a protected vCPU on a CPU where the firmware Spectre-v4
    mitigation is disabled, instead of re-enabling it from EL2. (Marc)
  - Track the host's ARCH_WORKAROUND_2 calls with a kvm_host_data flag
    instead of a new per-CPU variable. (Marc)
  - Handle the calls in default_host_smc_handler(). (Marc)

Two fixes for the host SMCs that EL2 forwards in protected mode, which
reach firmware as calls from EL2.

The first stops forwarding the host's SDEI calls. With TF-A, the host
could otherwise register an event handler that runs at EL2.

The second is the v1 fix, redone as Marc suggested. It tracks the
firmware Spectre-v4 mitigation state from the host's ARCH_WORKAROUND_2
calls, and relies on the first patch because firmware restores that
state when an SDEI event completes.

Tested on QEMU with TF-A v2.15 and test-only host changes. When SDEI is
built into TF-A, the host's SDEI calls succeed without the first patch
and get NOT_SUPPORTED with it. With TF-A patched to advertise the
dynamic Spectre-v4 workaround on the Cortex-A57 that QEMU models, a
protected vCPU runs with the mitigation disabled, and the second patch
stops it from running.

Based on Linux 7.4-rc2 (7475ea8b58616; also applies to Linux 7.4-rc3
aebb727447640).

Cheers,
/fuad

[1] https://lore.kernel.org/all/20261113081934.1715497-1-fuad.tabba@linux.dev/

Fuad Tabba (2):
  KVM: arm64: Don't forward the host's SDEI calls to firmware
  KVM: arm64: Don't run a pVM with firmware Spectre-v4 mitigation
    disabled

 arch/arm64/include/asm/kvm_host.h  |  1 +
 arch/arm64/kvm/hyp/nvhe/hyp-main.c | 30 ++++++++++++++++++++++++++++--
 2 files changed, 29 insertions(+), 2 deletions(-)


base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
-- 
2.47.3

