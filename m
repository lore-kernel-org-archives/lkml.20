Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.236
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793185667;
	b=nnyfMUiJR25QnBSo76V3zNWsdv2EN/bNgTLQ6Q0oMmQQuDGouWjjhUxASRDQnorPYeeh
	 DntOgmBVqFROeHaiGViNmFBnalBj8ge5+R88hb2tCIbCc0N252pLIyMJ/Dpr6tqOTswSZ
	 1Z4BmH3+Ci1Px9OxI/CoINNHqNsznDBUuUqV8oVm7mXLgPxKjcBjaeOSreUwy71eWl7ou
	 kYKhllogDUEeDaCJjQHuB9iE06q3TOQ8VmJZslEs8LhxH6VOK9blKeYggOykkpI0OgCaS
	 F4UVJtxaS10XT/wa4yZJddBLgqHXcMcrXXdwS5WFO4t/RGAote/WX5YACvaeZg3X6tw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793185667;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=miIuE2N/e+SG7Kz34MMJd25ETZ3yxYFkA9Zemr87Wgo=;
	b=d8YE/77cD23ry5xKIhOZJsyTX/0LRi4coYSLjVUXXF+sNETWW5Hd3eQj+hspoEuLaMBv
	 mfX+i5y6o6TNIuENmZBAMULdHVsVDBBdCTOCHbmvXagjlArQ2Ka6HIqjuroPhaCLPZTAq
	 Q2vxKl8FZdCbULudAGJN3/T1+yVIGJ1H3pHmd++hXPLIdilnXGtI2Z6D8U9E8OjSuWyOD
	 DUd7+PXXNhcdUeoXzHW0Zf9Jnvu/zp4CN5eI7l64HSp6OmJS6xAn3oSoxFkhGYHXi0zaL
	 rIfxyhcS0BY1DLgCKpxCl/MM9kciXU6XlRhPS/NGXfq9KtOyJJnpT2ja21+mYzJGKfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=JbcWMaMv;
	arc=none smtp.remote-ip=95.215.58.236
Received: from mta1.migadu.com (out-236.mta1.migadu.com [95.215.58.236])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 986F3606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 11:07:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 986F3606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=JbcWMaMv
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=Pg95Y+xFHx1ZIocuSPAyjynJpdUBiCDULSiHROnP0Os=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793185664; v=1; x=1793790464;
 b=JbcWMaMviRNJd8kBhaAtmLnWIDfterzdjIYllNK0xeavjxLbiYJigDFfLD4lnLenqGBmg2Lu
 6yi6fwWuojUcQRLIJIfxP2O7WheAQYb7kHPt+Ckh2WrDB0scnRejCZqMW7mzMP7kVjq4rr2fNRI
 j9CMEK6tunROWqpFNsf898ik=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id e69cc8713850fd5b;
	Wed, 28 Oct 2026 11:07:44 +0000
X-Mizu-Trace-ID: e69cc8713850fd5b
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
Subject: [PATCH v2 0/3] KVM: arm64: Fix PMU handling in pKVM
Date: Wed, 28 Oct 2026 11:07:36 +0000
Message-ID: <20261028110739.2366566-1-fuad.tabba@linux.dev>
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
  - Gate __pmu_stop_host_counters() on system_supports_pmuv3() rather
    than v1's per-CPU HAS_PMUV3 flag. (Marc)
  - Collected Vincent's Reviewed-by and Tested-by on patch 2. (thanks!)

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

[1] https://lore.kernel.org/all/20261027081147.498183-1-fuad.tabba@linux.dev/
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

