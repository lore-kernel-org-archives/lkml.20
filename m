Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793201521;
	b=1sLZmT2XUv/UJNFCwz79c7oO3OZAL5tF3SS56dotIxIaWgwun0JNHyPzRHmHilj0SzCH
	 AqPV0rUOzN2kiXbc/ywLT9R4YyCgqQTFOPTQg6FtpcIwNhOrGWr3VXEOaOmLszWlp6HLj
	 r24Km0YY3i9xQ+0i7OFqpzqvvry+z7AUexrpAWBMITkJqAqaOySGdY90VP/2SXU6RItpE
	 2xbNskc5D2Rjq2IQouuVIB3qrbemBZfBUbOm8Vhga7Fa5Esj7btk62Afi42wxUr2UDVud
	 wvq05Cctgq7PbiF333HqvneWma19EJu9c3m6m330zblEVKM5swKQf73skpLlO0bNnVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793201521;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=ht9WUxyatyt/F/skn5itMNnUaqsNQIudb7pG2aMoxEk=;
	b=v581iA+idiNj4oDqMMKkUH5UlzaKHNdcE9g/9ssWXHnB95s8YlKlW3m8DQvK3zG1gZA7
	 XWR1W45iYahi14VwqsjVJ/p8AOZxCojPON49FiOqiW3pQWW3mk/lsnhdM1PFaYtfBeoJA
	 X4zdYwKIgTYXjUzPVjXLhrunu53HGXK1hhwdrxweNbzi8RRTd34/f2qQAfIzH6hcZJJtm
	 MlfJF3hyywSpTQmIi33Bb3JgKhdGF//4aSITx6Ha1cm9PDWRdhImaNFmT39pS/hpXv6Qp
	 TAXh5PbmSvMf85CRgVd57NX3Of8o4cWjGxQE2kWBXD3YZ7YoZbqlARoFXoET0EKjwuQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Aeg1DChs;
	arc=none smtp.remote-ip=91.218.175.5
Received: from mta0.migadu.com (out-5.mta0.migadu.com [91.218.175.5])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 835A5606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 15:31:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 835A5606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Aeg1DChs
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=ZTWMSahcNXio61k2+E3NsswZxtgAxnlSsoLAtP0uISQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793201517; v=1; x=1793806317;
 b=Aeg1DChsMb9hcUlrxe+YoPOS2vcNvhxGq711ffbNVJclJcFMFBaLFxVYqvTRCOzTyVzXIQZ/
 Kv+JhWrETEzBCGGMkZgPgxjS23mvKp3YD/z/owt+19Ag4qp6bnWbxhG2kPDksUGtJXK0Inv0jPZ
 s6o3L8d751aRLOzQ2G5mJLus=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 1c20b6414d7e255c;
	Wed, 28 Oct 2026 15:31:57 +0000
X-Mizu-Trace-ID: 1c20b6414d7e255c
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	kernel-team@android.com,
	linux-kernel@vger.kernel.org,
	Oculytic <oculytic@gmail.com>,
	Fuad Tabba <tabba@google.com>
Subject: [PATCH v3 0/3] KVM: arm64: Fix PMU handling in pKVM
Date: Wed, 28 Oct 2026 15:31:49 +0000
Message-ID: <20261028153152.1740044-1-fuad.tabba@linux.dev>
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
  - Stop the host's counters with PMCR_EL0.E rather than the individual
    counter enables. (Marc)

Two fixes and a hardening patch for PMU handling in pKVM, as one series
[2].

The first is Vincent's rework of his HPMN fix. It supersedes his earlier
posting [3]. Rather than read nr_event_counters through a different
accessor, the host copies the hypervisor's kvm_host_data before it's
deprivileged, so host_data_ptr() returns what was set up at init.
Otherwise, HPMN is 0 and a non-protected guest's event counters don't
count.

The second is the non-protected half of Oliver's patch from 2024 [4]. It
passes the host's PMU events to the hyp vCPU of a non-protected guest,
whose counters otherwise all read 0.

The third covers the protected half. It stops the host's counters while
a protected guest runs, so the host can't count the guest's cycles and
events. Side channels are outside pKVM's threat model, so it carries no
Fixes: tag.

Based on kvmarm/next (dd0bc00e3e920).

Cheers,
/fuad

[1] https://lore.kernel.org/all/20261028110739.2366566-1-fuad.tabba@linux.dev/
[2] https://lore.kernel.org/all/86bj8kzix4.wl-maz@kernel.org/
[3] https://lore.kernel.org/all/20261023092007.3918848-1-vdonnefort@google.com/
[4] https://lore.kernel.org/all/20240305184840.636212-2-oliver.upton@linux.dev/

Fuad Tabba (1):
  KVM: arm64: Disable host PMU counters for protected guests

Oliver Upton (1):
  KVM: arm64: Pass the PMU events to the hyp vCPU of non-protected
    guests

Vincent Donnefort (1):
  KVM: arm64: Synchronise kvm_host_data before host deprivileging

 arch/arm64/kvm/hyp/nvhe/hyp-main.c | 11 +++++++++++
 arch/arm64/kvm/hyp/nvhe/switch.c   | 24 ++++++++++++++++++++++++
 arch/arm64/kvm/pkvm.c              |  6 ++++++
 3 files changed, 41 insertions(+)


base-commit: dd0bc00e3e9201fd49b62ff9cc07890c89003afe
-- 
2.47.3

