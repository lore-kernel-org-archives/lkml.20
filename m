Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.126
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793971805;
	b=bGUTKyRxdbIeBZX2ikfBWMSUe1cF5Xw9QLA81hZcz5Rzgqlsu8Rn29MazQ63U4bl5Xsq
	 0l9WHL9nXAqHJn0eOpG3jPWoGTtDS4Okio9aTXF2lSrTmorazuC4AK5cBVYZVDG2Hy03w
	 Mx1vLkk71agyoInn8uyUu+zcGI4rsgBsqi+QplhozVYftHNQwj+haACXwSkS8DEuSgN1w
	 cjcuAN3IKOlhFOg+bFSoPEgWfJeygCtgU3CjE27AR3Qax2Ys/2qDvcg55vAjPO4MCDFs8
	 TNaH6fq4tj/i68Pr9lhq4V/SCgEFpVf5wXfu0H40ONncBGe/UtSD+4QTKXsbi3kS8UA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793971805;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=df5TrPFMtBvFGTjaH34ST7iQ0OhTPo2jJsgen1vs+Qs=;
	b=IOTUpFmmQPNj4DEXXufI5M2kdIjCGCbUOANvj4igglFhAXxyAXZojx/boVRueUzLoSQN
	 u7fiqK+bY2fzD6yStuu9DRPgLRRsGpsJagpDSlMZ+2vUP8dXh2oIQ6NczpuO6rnGnM0WU
	 LcMeTgfcBKxXCzslMsh6hjp/LYlRygoqeYhxtiiQ9qTqnUGTnAAVSqN1IgpSOQUyQxtgD
	 PqqvV3Y1gFagriWuBE7tRplKuIIS6fD4LC1sBu39C2zkh7MdGdZaKc1jhn5ASGHIsBjh0
	 eJfNVniCEge4+aR/haEPrYuzUOkaqLJifb/4AODQ6Wdf2Ljb83MjhjLCTBcQq5fKqtQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b="Flo/2ayu";
	arc=none smtp.remote-ip=95.215.58.126
Received: from mta1.migadu.com (out-126.mta1.migadu.com [95.215.58.126])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B848F606A330
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 13:30:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B848F606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Flo/2ayu
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=FqAM6Fc2AmJmQRAZs/TJExhLkKAHMxtjQF/1uSiqH6g=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793971802; v=1; x=1794576602;
 b=Flo/2ayu0GO6SiNSeIQ/BUUmXhov4KUspoIMkXE4LDG8A7Zkoz48ez0dw9+l2lfhXsY0DrjS
 xwdIAhAZ8CnSOuPY6I6keCrOZ/g39+/qFlY4vDqAznPzu7b00BEoH6pNJEjttNDpo2Lb3elXHcb
 FfwC5WnrjqY/hjf4nDxX9Oko=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 5bb1b36d23a37463;
	Fri, 06 Nov 2026 13:30:02 +0000
X-Mizu-Trace-ID: 5bb1b36d23a37463
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>
Cc: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Raghavendra Rao Ananta <rananta@google.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Wei-Lin Chang <weilin.chang@arm.com>,
	Fuad Tabba <tabba@google.com>
Subject: [PATCH v3 0/2] KVM: arm64: Stop stage-2 teardown scaling with the IPA size
Date: Fri,  6 Nov 2026 13:29:58 +0000
Message-ID: <20261106133000.453240-1-fuad.tabba@linux.dev>
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

Changes since v2 [1]:
  - Return a failed walk's error to the callers and warn there, instead
    of inside the walk. (Oliver)
  - Dropped the comment on the next-mapping lookup. (Vincent)
  - Collected Reviewed-by from Vincent on patch 2. (thanks!)

Two patches that make stage-2 teardown take time proportional to what
is mapped, rather than to the size of the IPA space as it has since
4ddfab5436b6.

Under QEMU TCG ('-cpu max', 16K pages with LPA2), destroying even an
empty VM takes about 7 seconds in pKVM. Without pKVM it takes about 19
seconds if the VM requests a 52-bit IPA (crosvm requests the host's
limit). With the series, both take well under a second. Tested only
under QEMU.

The first has the page-table walk return where it stopped, so that the
teardown steps over an invalid entry larger than a block-sized chunk in
one go. The second has pKVM return where its next mapping starts.

Based on Linux 7.4-rc1 (6628e7d4c6b25).

Cheers,
/fuad

[1] https://lore.kernel.org/all/20261104124451.2148724-1-fuad.tabba@linux.dev/

Fuad Tabba (2):
  KVM: arm64: Resume stage-2 teardown where the walk stopped
  KVM: arm64: Resume a pKVM stage-2 teardown at the next mapping

 arch/arm64/include/asm/kvm_pgtable.h |  8 ++++++--
 arch/arm64/include/asm/kvm_pkvm.h    |  4 ++--
 arch/arm64/kvm/hyp/pgtable.c         | 19 +++++++++++++++----
 arch/arm64/kvm/mmu.c                 |  6 ++++--
 arch/arm64/kvm/pkvm.c                | 11 ++++++++---
 5 files changed, 35 insertions(+), 13 deletions(-)


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.47.3

