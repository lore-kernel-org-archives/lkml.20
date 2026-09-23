Received: from mta1.migadu.com (out-204.mta1.migadu.com [95.215.58.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18D66478875
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 10:03:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790157840; cv=none; b=O7xJg3c+mOdOkoNqIEA4GfKEkkNaCK5yAmTYipmKGxiXh5o2+g3v/AycN/xwjLN0R3GPddvdBEWxSg/XSOyUSf+Op+xHYRYPhmV6yweect9v9L+BE0UH2G21zDTvXhLn7raa+Nk5P48rTR/+OO2GokbSuE2erZ5+giCsaZABl/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790157840; c=relaxed/simple;
	bh=xyyxgX6Z2IBzQdllFbMd3l1KS0QkIUQEnt09r+FTDSw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=q6VJw0aCjkZTmJXc1T34WtcjVIZrsYTahoX1HoW0V7AfyS9NNjzO7Y+19ddaW6K6x9Sm/567TSpAYBub0RtbCvXV+LeepPIRdqnamh7cXJhDCwxgAV0LIH4wYYuKd+rIxXetAKEgi8KYFmQv/4tKpm9WqG+FyVurQf92D3HcnNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=VyUzXS8f; arc=none smtp.client-ip=95.215.58.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="VyUzXS8f"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=xyyxgX6Z2IBzQdllFbMd3l1KS0QkIUQEnt09r+FTDSw=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790157837; v=1; x=1790762637;
 b=VyUzXS8fiU5JA1bCQ3Z7bqR4VupAJ36ZCSuPWTzdGX0nlFvezA7GIZoiXvYHLWVOOOqlly6E
 7w+bEP6GA6KCHqIrPls5GvNghjGpng7OV3qSKodyuYtlXR6iTb5iWc6T2ToSa4zhAYIclt8egVZ
 wYv9DT1fuRVyCxIxfXm5Kv/g=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 510241b10c1a9285;
	Wed, 23 Sep 2026 10:03:57 +0000
X-Mizu-Trace-ID: 510241b10c1a9285
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5b778bdb5b8so4427e87.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 03:03:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwfXnA+QSg3PD69k/jiRaKMA0s1wMzFWyPFBPUOjtG5+//aA8VJqQJZjFsE0LE7MewsiBMrRe5WJ6vmYZU=@vger.kernel.org
X-Gm-Message-State: AFuF++lhghXJ43Y8dRM8+/kKOH/HvNKSv3/pKxPMzdCaP3XEVLhrrXFw
	ZdOPnkxXqMM7UnHXgVWl9Ia4A02oNlKo0ha9jI5SaWuDYISR9tFhELnoJwHZyDEGSzDJlwBRvQR
	6eWfQGwmVL49jfdKtHxt29wuoMVMOBMPjW39VaFSd
X-Received: by 2002:a05:6512:ba8:b0:5b6:bcb:26c4 with SMTP id
 2adb3069b0e04-5b8d885c755mr142676e87.16.1790157835308; Wed, 23 Sep 2026
 03:03:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260922-kvm-arm-prefault-v3-0-787bd3bc7e3f@kernel.org>
In-Reply-To: <20260922-kvm-arm-prefault-v3-0-787bd3bc7e3f@kernel.org>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Wed, 23 Sep 2026 11:03:19 +0100
X-Gmail-Original-Message-ID: <CA+EHjTzpYRu2xq5VdoxodyDqLTJrcoaSrfGq=DXh283TYPJ-OQ@mail.gmail.com>
X-Gm-Features: AcwNN1Uc3FNAcNduJiv3v9IEKpsaLZzqL8bqap-uQ6FOvMoC3rZk-evpRR8tlZg
Message-ID: <CA+EHjTzpYRu2xq5VdoxodyDqLTJrcoaSrfGq=DXh283TYPJ-OQ@mail.gmail.com>
Subject: Re: [PATCH v3 00/14] KVM: arm64: Add KVM_PRE_FAULT_MEMORY support
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Jonathan Corbet <corbet@lwn.net>, Mark Rutland <mark.rutland@arm.com>, 
	Randy Dunlap <rdunlap@infradead.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Jack Thomson <jackabt@amazon.com>, Jack Thomson <jackabt.amazon@gmail.com>, 
	Alexandru Elisei <alexandru.elisei@arm.com>, Vincent Donnefort <vdonnefort@google.com>, 
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Sean Christopherson <seanjc@google.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Leo Soares Passos <Leo.Bras@arm.com>, 
	Wei-Lin Chang <weilin.chang@arm.com>
Content-Type: text/plain; charset="UTF-8"

Hi Lorenzo,

On Tue, 22 Sep 2026 15:17:54 +0100, "Lorenzo Stoakes (ARM)"
<ljs@kernel.org> wrote:
> This series implements the KVM stage 2 page table pre-faulting feature for
> arm64.

There's likely going to be a respin for the arch hook, but FWIW,
tested as follows:

QEMU/arm64 -cpu max:
- guests boot on VHE, nVHE and protected-mode hosts, protected guests included
- pre_fault_memory_test (all guest modes, anonymous, THP, hugetlb and
shmem backing) and nv_pre_fault_memory_test pass
- pre-faulting an uninitialised vCPU returns -ENOEXEC
- dirty_log_test, demand_paging_test, mmu_stress_test and
stage2_block_transitions also pass

Apple M4 (nVHE, 4K and 16K pages):
- pre_fault_memory_test passes on the five guest modes available
there, with the same backings
- in protected mode (4K pages), the cap isn't advertised, the ioctl
returns -EOPNOTSUPP, and guests boot

Tested-by: Fuad Tabba <fuad.tabba@linux.dev>

Cheers,
/fuad
