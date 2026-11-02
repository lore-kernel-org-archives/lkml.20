Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793606331;
	b=SRByCZ77evlSOGZQs3wL7OmwksUnjwAkgXYrJ7q/xnSpmIKGAHQebk2LEffKrkv1OVoD
	 jD2bFYAvebnFMYNqLfYZt2kznU5cXzbDLQBmPhC04NYEV46eEg426HDpe/yMlULkgURyD
	 DdN49KK3LGhlm/oAxPJuq25bP9pCtPxJa/yCw4QR/+10DZFX4gxG6wsFFpDJ2VS0lndM8
	 p1m2t6DqNHZXFsFo4YsI5N8EV0uEliz40siXiH6RjWX09d6XRWRAgRXYcdO8Sq43koFZD
	 cEkU+yKvLP0hlH+PFHN23plBnvuqbFgnor4NjCTw//Mp80/eLOXNn+Ty66SXhCiHzKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793606331;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=+JdS4G63s5YrX6ja9msk8fkBfAQWzo4U4td4gFNglHI=;
	b=qUgdlvGNv+5pgsVxQIjS6IjJ8SEakENa9aOHFXuB+gTPa3LCpyHi4lekQFR1qGVBfA8n
	 1WjUd46+C2tOXJk1EX9FSeWdpYAiV/hkcuaO9vk6u21OEUwbP9TQ0+G/q9aAHuiKNPQ+v
	 P7bRVI7+zk2XXZG7yNGR/S/JLY8TQf1ljPFYuQhoVmsqRGB0ctQOgHiuHgn7PDMfyRXUb
	 6Z2zHRfHZla7MRmw/jzxIMcw3PIcWvXVlCWUzEzLKqdC5SbqpQiTLkdnJEEV5e7QWrouL
	 8WoYfWDBoYIxPe1q8Anl3wdpyZreiK6Xhvueetc3WNrendfau51wMiH59fdYS2ZG1fw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b="l8fM/8oX";
	arc=none smtp.remote-ip=95.215.58.180
Received: from mta1.migadu.com (out-180.mta1.migadu.com [95.215.58.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00BBD606A326
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 07:58:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 00BBD606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=l8fM/8oX
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=OPCNKwKilXKP7yPXswDvwmi3hPbRw7m/9nNCGlJWJ7g=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793606328; v=1; x=1794211128;
 b=l8fM/8oXnEBp1ZMX+BTQ0PLIAisq+rvezWYZWxHTJ7z38YaWoyG4vstEyCCdbQnk2cdx3mHM
 xesZPrn2UKdNn4H+vE8A8SU+5MhBgh0VMbUh+FSpK5ANedsEX9z04YavgM1RrTci0OHv4cBtsVB
 qPG9BNi5kGfr3xXgquHJUwAk=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 483c354dba814e72;
	Mon, 02 Nov 2026 07:58:47 +0000
X-Mizu-Trace-ID: 483c354dba814e72
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>
Cc: Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Will Deacon <will@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Jack Thomson <jackabt@amazon.com>,
	Congkai Tan <congkai@amazon.com>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Fuad Tabba <tabba@google.com>
Subject: [PATCH v4 0/2] KVM: arm64: Clear VM-wide state when kvm_setup_vcpu() fails
Date: Mon,  2 Nov 2026 07:58:41 +0000
Message-ID: <20261102075843.2556018-1-fuad.tabba@linux.dev>
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

Changes since v3 [1]:
  - New patch 2, clearing the default PMU left set by a failed INIT.
  - Reworded patch 1's commit message.
  - Rebased on 7.4-rc1.

A KVM_ARM_VCPU_INIT whose kvm_setup_vcpu() fails doesn't undo its
changes to VM-wide state. Patch 1 clears the feature bitmap, which the
PMU attributes read before the vCPU is initialized. Patch 2 clears the
default PMU, which a retry with KVM_ARM_VCPU_PMU_V3_STRICT would
otherwise inherit.

Tested under QEMU on a host without FEAT_NV1 (an Apple M2 MIDR,
for which has_nv1() returns false), with a reproducer that fails an
INIT and then initializes the PMU, directly for patch 1 and after a
STRICT retry for patch 2.

Based on Linux 7.4-rc1.

Cheers,
/fuad

[1] https://lore.kernel.org/all/20260921190843.107881-1-fuad.tabba@linux.dev/

Fuad Tabba (2):
  KVM: arm64: Clear the VM's feature bitmap when kvm_setup_vcpu() fails
  KVM: arm64: Clear the default PMU when kvm_setup_vcpu() fails

 arch/arm64/kvm/arm.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.47.3

