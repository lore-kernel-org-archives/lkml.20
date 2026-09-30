Received: from mail-ej2-f41.google.com (mail-ej2-f41.google.com [74.125.228.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E2794FDA4F
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 15:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790782058; cv=none; b=Ywp+M60M+brIFdYH/h3N7MieL+ZZV+PfvpjGlrShbBYGIu2zkF4Y0pgpg5IvcUlLIW8Q8GkZGcFEOggo/8/Yyc1tcFLQuzLRYGrEWkSVd9MVmZm2eH8bZpTVYK+goTMP9/MwAQ5Mpy+ERE1nqWQ+PFlIIPrwoVoCfIa4/hghcv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790782058; c=relaxed/simple;
	bh=0s/Gn6TxRqE+ma6MSeiSWHaaSkW4KWvpR2ed33nhSXw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pVAlAFoXFTV1hBwpENiNkHI1ieNLKE7ehjnLauET+Y6D2YMYIYMfNUSWn6FzuileuF5ldxxpB95EDXTCTe4MPVNCJik0jyDCNFdslTMYJdcIHTSjiKFS95MvSrmjDxQK6lLhrqgYOipreuZH6+gQN4ftkh8c3bmOzldGMw4WsZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sqPNDQvw; arc=none smtp.client-ip=74.125.228.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sqPNDQvw"
Received: by mail-ej2-f41.google.com with SMTP id a640c23a62f3a-c2e028ed54dso240089466b.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 08:27:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790782050; x=1791386850; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m8/ka+J/ZNQmE2G5JtUp2jlHYt7CIUXWsqK/1+vFYBc=;
        b=sqPNDQvwO44ngOq8O0pVz0s6Xf/8otThIx3hzOlCrlrpP+yARDTfCB3cRifadR5d47
         wMhJ9k48vKUdKavoYpf1Z7ICVGc82wKkPoxUh2/gf44pJlOP65FVabCnFBvmVITZ9Css
         j21+OxQ/zcudYzfMjwbtXUHsih/6VHMiNf6OXd8XNs9aJjBRkDza5FATdGv5AZgaaeRW
         55z/oDGeFd4h8Vt95TTnOBGuLwd8UEOM8O8IPFBzBdjyGVXore2bJd083NYoJhKQrdZy
         AX5kpSopg+1yg7WtZr2pPaCd4hL8bljgKuTTR8LO2xoh9pY5OfeioN3Sq/aUpW/FbD7l
         oRzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790782050; x=1791386850;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m8/ka+J/ZNQmE2G5JtUp2jlHYt7CIUXWsqK/1+vFYBc=;
        b=xo4wDqvbudfz3fLyCGINa+wanlpR5d/iR7d3wkXmI7f8pOUsRpd93/bCBAFGzOgQTh
         mjUkwwmovRHXKTX7FAfUWNY25IZkxEWL9tjmjXh3EuMchfHMRVWjUODeDRDxnz9i4MI6
         Yiw2IiYJEjuxlqBdlHCdn2dnzFHQ8E/T/dMaerYXhHci4XzIzIl1T3QYnfsEJ8lS6oUv
         01njiaHC5T30lItitZQytyoqO2ow9ruCasxf1PCD4TJNie78o2Dw/PLPfeqxZqrBZVQH
         RUxOL7E3LgalbE2U9awdTCYGoMRIBZIC5s3Denp9DbCr50RXPqH2eL5Mos5D+5PBQdcr
         vb/Q==
X-Forwarded-Encrypted: i=1; AKwUvByrAhgIN6rDA2FsqWacYpBEASt1lEMhxb16JZvurCm2vo1d3ARwR/y9dOVKUDycACLLDAWHA2FwZUmx0Wo=@vger.kernel.org
X-Gm-Message-State: AFuF++nnQh+PoFhpXvyotSpwS68GM9og8BTnkMuvzkeR+d0XZ+THZN0H
	pL+638i3K66vHzOLfzcxWSo0nN3ihX5373wpddhIfLMXxeZw3kELpI7xhoLw6jntihs=
X-Gm-Gg: AYBFou02hSQ6Lx542kGZw9EiTaoQVAA20dYplyqY/SXvNgz+Rr/jWGW6oGvOUdWLi+j
	0wT7JTQao9CUfHgPUZQG2kC7wXAEfWzJ/iefHD37zQiyJWRnpEV1GfgGHu6UC3Y67wHMpzyEnSQ
	dZq0cs44xB91iXMSGAVvTLf2sG0B1QmN74AcVypJqi8DKJ7Sv90Zf6XOHxJ/AMZd3ldL8GpOfC0
	BPCeUIuAxhK35SfyehwQVWu/n68DxuR6bhunozs5nGJg5bRgfAEznaalPXqHRfutJM06/7SC1lQ
	jbrE0buryVwSjUW0bSBNZEn6/phlU87x5KhsYBfN1FTyeJyd1rR5kXb/mVgTlG7E+2FZjR13Gh5
	tB6IwFEHJ6NYuQUCwRT4gscddVOLKV5pjiJnVdNpUV1vGTlnVr2ZF4PVpuRIcXpf5H3+ZUTUI8s
	QMKB3C/mpFmJHO3cXLdGgU2tRczD3BHPYxQG4blezzGbg3FfVAO9ziu5DXNZuCBsJMWaO4Zigwg
	UQ=
X-Received: by 2002:a17:907:e002:20b0:c2d:ca32:2176 with SMTP id a640c23a62f3a-c2e23be61f9mr114745266b.8.1790782049863;
        Wed, 30 Sep 2026 08:27:29 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e31a3eb32sm28640766b.3.2026.09.30.08.27.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2026 08:27:29 -0700 (PDT)
Message-ID: <56d86280-fcea-4d2d-b6b9-b47449f3408d@linaro.org>
Date: Wed, 30 Sep 2026 16:27:27 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 20/22] KVM: arm64: Add vCPU device attr to partition
 the PMU
To: Colton Lewis <coltonlewis@google.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
 Oliver Upton <oliver.upton@linux.dev>, Joey Gouly <joey.gouly@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu
 <yuzenghui@huawei.com>, Fuad Tabba <fuad.tabba@linux.dev>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Zide Chen <zide.chen@intel.com>, Alexandru Elisei
 <alexandru.elisei@arm.com>,
 Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
 Mingwei Zhang <mizhang@google.com>, Jonathan Corbet <corbet@lwn.net>,
 Russell King <linux@armlinux.org.uk>, Shuah Khan <shuah@kernel.org>,
 linux-perf-users@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 kvm@vger.kernel.org, kvmarm@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
References: <20260924172928.2110956-1-coltonlewis@google.com>
 <20260924172928.2110956-21-coltonlewis@google.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20260924172928.2110956-21-coltonlewis@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 24/09/2026 18:29, Colton Lewis wrote:
> Add the KVM_ARM_VCPU_PMU_V3_ENABLE_PARTITION vCPU device attribute to
> enable a Partitioned PMU for a VM where PMUv3 and VHE are supported.
> 
> When partitioning is enabled (tracked via
> KVM_ARCH_FLAG_PARTITION_PMU_ENABLED), userspace must explicitly
> configure the number of guest event counters via
> KVM_ARM_VCPU_PMU_V3_SET_NR_COUNTERS with a value strictly less than the
> maximum number of general-purpose counters implemented by the PMU (or
> 0 only when FEAT_HPMN0 is supported), leaving at least one
> general-purpose counter reserved for host profiling prior to calling
> KVM_ARM_VCPU_PMU_V3_INIT.
> 
> Signed-off-by: Colton Lewis <coltonlewis@google.com>
> ---
>   Documentation/virt/kvm/devices/vcpu.rst | 42 ++++++++++++++-
>   arch/arm64/include/asm/kvm_host.h       |  1 +
>   arch/arm64/include/uapi/asm/kvm.h       |  2 +
>   arch/arm64/kvm/pmu.c                    | 71 ++++++++++++++++++++++++-
>   arch/arm64/kvm/sys_regs.c               |  5 +-
>   5 files changed, 118 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/virt/kvm/devices/vcpu.rst b/Documentation/virt/kvm/devices/vcpu.rst
> index deb5c51bc00c8..fb5921ed9dea2 100644
> --- a/Documentation/virt/kvm/devices/vcpu.rst
> +++ b/Documentation/virt/kvm/devices/vcpu.rst
> @@ -57,6 +57,9 @@ Returns:
>                     hardware PMU, or interrupt number not set (non-GICv5
>                     guests, only)
>   	 -EBUSY   PMUv3 already initialized
> +	 -EINVAL  Partitioning enabled without explicitly configuring
> +		  fewer than max_counters via
> +		  KVM_ARM_VCPU_PMU_V3_SET_NR_COUNTERS
>   	 =======  ======================================================
>   
>   Request the initialization of the PMUv3.  If using the PMUv3 with an in-kernel
> @@ -162,7 +165,8 @@ the cpu field to the processor id.
>   	 -EFAULT  Error accessing the value pointed to by addr
>   	 -ENODEV  PMUv3 not supported or GIC not initialized
>   	 -EINVAL  No PMUv3 explicitly selected, or value of N out of
> -	 	  range
> +	 	  range (or N >= max_counters when partitioning is
> +		  enabled)

"No PMUv3 explicitly selected, or value of N > max_counters, or N > 
max_counters - 1 when partitioning is enabled".

That might be clearer, otherwise it seems like max_counters being 
relevant to "out of range" only applies to when partitioning is enabled, 
not that it's max_counters all the time but one is -1.

