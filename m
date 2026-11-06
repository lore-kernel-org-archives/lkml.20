Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.220
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793957194;
	b=S+G5K4KhlK428vX8hfA/G7o9pr7IKsXVloDvsgmkcgA32hsBOu0EvIdi88l15aqfLW8r
	 S0TkD1R7h8dPnxulzaXPKiaAScEO3xocYAPtzYjSh5m/qUnZ8ksS2kIG0OmhDmJH0+lCV
	 4zrSwPiw35gieiWrUcY+fFLLIgPeOR879JRMgl6aLWP1lZzhVpNieAmklgnGabAeFNuPb
	 M1DmTad03QH7dn99ifM5DEiLeC6oIqaiw9jSsK8AkgH3/qDGmnfiWql12Vqc9CU6h9Vf6
	 0psB2yQJLkukbShnUmxQ8KpQVR4qzrEU4j4mClKyQNiE3qe7Yomyc70w7gRmG0KIb2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793957194;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=3QqHYClt7ToralFnT/GQfVCsnVNDggSlumB9ya7MPzY=;
	b=vuNEfISLn7dyXm0KwPt06UkQI4GbclRR3A3f0kko27Zk96Zx9roCDAXpZrebrBpxidV9
	 zPFMZ62CT7Z/OzdSPZ3g0vtnHVezSOrYsfqfCVcU7RA6AYp6X2sSsU2QOq1VymdhB8VPU
	 ikXQqac1EJG8LwRwv9P4dLmUUlIsL7BWRTyzqtStMQQXSP9MEbkrMdT927l/U6ehkU4xJ
	 MutwEv0g8LwvGowSB7udyjZbiZuUl94IEa/IAPBfcmj3Q9OGXt0OeagKYikajNsYmQNPy
	 YYcemjQg7c65xqipZv22gWsCkdUmvZRPPtI3y8tO0n8damZFu5BgJUfYn12g6yZ05xQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=wkZbXmi1;
	arc=none smtp.remote-ip=95.215.58.220
Received: from mta1.migadu.com (out-220.mta1.migadu.com [95.215.58.220])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AA31606A326
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 09:26:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4AA31606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=wkZbXmi1
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=L6Xo26kNAkN33OgBpsLRrRNe1hfi0x4MeG+4t8rMLYg=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793957190; v=1; x=1794561990;
 b=wkZbXmi1E2uBSu4e4JdIFC0bvXiDSc5nYJXCDuhq4SRIaAVz0XLq2MyVhndTu9mWGeiekzuH
 jMieG6aTvYditTlGsW0wAlu7ZO/SW8L0khEyMdrTivYI2ggmhRpa9VhZfiSO5dZTVOFWKsYajEx
 AtEzwPAS0QLuFHjnhjf/abuM=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id fc8efab57c5f75a4;
	Fri, 06 Nov 2026 09:26:30 +0000
X-Mizu-Trace-ID: fc8efab57c5f75a4
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>
Cc: Radu Rendec <radu@rendec.net>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Will Deacon <will@kernel.org>,
	Fuad Tabba <tabba@google.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] irqchip/gic-v3-its: Fix the ITT pool's alignment, zeroing and growth
Date: Fri,  6 Nov 2026 09:26:22 +0000
Message-ID: <20261106092625.3977163-1-fuad.tabba@linux.dev>
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

Three fixes to the ITT pool that took over sub-page ITTs from
kzalloc_node(). It doesn't align them to 256 bytes, though MAPD now
relies on it to. It doesn't zero the ITTs it reuses either, and it
leaks pages when it fails to grow.

The first gives the pool a 256-byte granule. With its 1-byte granule,
ITTs stay aligned only while every size is a multiple of 256, which
holds for power-of-two ITE sizes but not for QEMU's 12-byte ones. On
QEMU, two devices with 32 MSI-X vectors each are enough to put the
second device's ITT at an address MAPD truncates into the first's.

The second zeroes an ITT reused from the pool, as MAPD requires. The
third frees the page when gen_pool_add() fails.

Based on Linux 7.4-rc1 (6628e7d4c6b25).

Cheers,
/fuad

Fuad Tabba (3):
  irqchip/gic-v3-its: Align sub-page ITTs to 256 bytes
  irqchip/gic-v3-its: Zero ITTs reused from the ITT pool
  irqchip/gic-v3-its: Free the page when gen_pool_add() fails

 drivers/irqchip/irq-gic-v3-its.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.47.3

