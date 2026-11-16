Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.1
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794857379;
	b=KOcZR3I38gWDO7juHbsZLJsG/oIsQzrkl+9q5udP/AN9+c1MJU4NrMxbRgKDHnnSd+FX
	 PvWs1lKHh5SXOIIWqqnf5fKbEeY7FoQEbyaRt4f26Y6rQmcoQOgLfYhfVq9ACNKGVVtHq
	 1PLzYtj+Pb4X9INQNHYPKqTAeSCCFT+t5EC67slW0GyU+T6FhW8KPcI14ozJAaq/IoP1q
	 +0Dvb+C683Vn5fkDRWoQciS9XzazXEQ+MeV7UJZhuU0mHaOtXNE0n8DsIcaYH+oNM9hIg
	 JmXbLieIlWrHrJEdDqsDT/78d+Glfc2OPpeD5uflry4s9WdPWxBXO0NOle7e0EFjlwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794857379;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=yEoaC/Ng0V2goYlLZqCkotlSndxwpWoQ6P14GTUf1pI=;
	b=m1SFuAZJLOXihYS91rYD8kUXc8/iWOQhLtOpdEwlc+Y/r7B3gtbqz/FT78oXdR3zJgt6
	 Z6b1eFswF1FbSi1SYlSamMgekKy48H2PZ4o9rQX9UtQAvYLtlLkeqOA2JjwaiFFwkVI68
	 BA2giZ3N9wW2HJ24R8a2X0Z0RKbAwO7bi4vINLRoJO5sa++R6LHuwlewG8A+XWdyn9fUO
	 IKeznCWYJ7rfmRRk8RbdBiNkL69s+XZg+oT8XZZAaYg/9JD8yfaOpdxenl0Rjd4OYsUZ6
	 E6BCW2Rt6RF6OCx8BtZt3HqN39jvmNw0fMWy7LiwIO7mjRdexzCjPSeCI7bksNrxSOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=JP0ZNSRo;
	arc=none smtp.remote-ip=95.215.58.1
Received: from mta1.migadu.com (out-1.mta1.migadu.com [95.215.58.1])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24BB1606A31C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 19:29:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 24BB1606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=JP0ZNSRo
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=ZesdBexgj2dtrVEUReJJ1M0k0i4FtmIJXWQsOeWtkmI=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794857375; v=1; x=1795462175;
 b=JP0ZNSRor3iBh+5fJ0JweER8NJdExIiIjYISdEPhNFuMmzpJIPLxWFs0v/f/Syl4kFFRZyYZ
 kytu2TltqMWiJ4xoL468V2MckcUoLSU28yG1WjEHfWQL450fhG8N0j8iCK0UomWTQZWr20grFtt
 gTHUy0Hie56odw32//Q5uh34=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 55524de43ae1481a;
	Mon, 16 Nov 2026 19:29:35 +0000
X-Mizu-Trace-ID: 55524de43ae1481a
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>
Cc: Radu Rendec <radu@rendec.net>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
	Will Deacon <will@kernel.org>,
	Fuad Tabba <tabba@google.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/5] irqchip/gic-v3-its: Fixes to table allocation and the ITT pool
Date: Mon, 16 Nov 2026 19:29:28 +0000
Message-ID: <20261116192933.3266502-1-fuad.tabba@linux.dev>
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

Changes since v1 [1] [2]:
  - Combined the ITT pool fixes [1] and the table zeroing fixes [2] into
    one series. (Marc)
  - Dropped "Zero ITS pages before sharing them with the host". A
    separate patch fixes it in pkvm_set_memory_decrypted() instead [3],
    for every caller. (Suzuki)
  - Order the zeroing with dsb(ishst), as its_flush_cmd() does, rather
    than dma_wmb().
  - Clean the vPE table to PoC unconditionally.
  - Point the vPE table patch's Fixes: at the commit that added the
    table.
  - Rebased on 7.4-rc3.
  - Collected Reviewed-by from Suzuki on patches 3-5. (thanks!)

Five fixes to how the ITS driver sets up the memory the GIC reads.

The first adds the barrier that was missing between zeroing a table
page and the write that makes the page visible to the GIC. The second
cleans the GICv4.1 vPE table to PoC, as the driver already does for the
pending table. Without the clean, only a redistributor that accesses
the table as non-shareable can read stale contents from it.

The other three fix the ITT pool. Its 1-byte granule keeps ITTs aligned
only while every ITT's size is a multiple of 256, which holds for
power-of-two ITE sizes but not for QEMU's 12-byte ones. The third gives
the pool a 256-byte granule. The fourth zeroes an ITT reused from the
pool, as MAPD requires. The fifth frees the page when gen_pool_add()
fails.

Based on Linux 7.4-rc3 (aebb727447640).

Cheers,
/fuad

[1] https://lore.kernel.org/all/20261106092625.3977163-1-fuad.tabba@linux.dev/
[2] https://lore.kernel.org/all/20261106120221.347309-1-fuad.tabba@linux.dev/
[3] https://lore.kernel.org/all/20261116110549.1863653-1-fuad.tabba@linux.dev/

Fuad Tabba (5):
  irqchip/gic-v3-its: Order table zeroing before the GIC can see it
  irqchip/gic-v3-its: Clean the GICv4.1 vPE table to PoC
  irqchip/gic-v3-its: Align sub-page ITTs to 256 bytes
  irqchip/gic-v3-its: Zero ITTs reused from the ITT pool
  irqchip/gic-v3-its: Free the page when gen_pool_add() fails

 drivers/irqchip/irq-gic-v3-its.c | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)


base-commit: aebb7274476403040d582c61478df8f4a7bf9cd3
-- 
2.47.3

