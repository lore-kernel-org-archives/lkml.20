Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.246
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794882289;
	b=OtHKRTeEvLEnjZnnh01PJaCWXdusI+ty/3EIRI8ylBGFD9INjiXq0h6+701+e/nL9vho
	 W4PsKcWK8xwZmxu1/Gxl/5bydqjj6EYgXxq+pZTVb4MrGUP5rT03UPODHSZsiDoH3UZJV
	 mNNe4qLZTiQumXeaoPoVVRAKou67WeQCZmlrsqt/1Xt+xPdskhFD3RcNXBhLW6wItcoOS
	 n0qMv3IZQ1PkGkC3cqi9y4j0W0EGoCqSc2VR68x/OseFWjGksu7cbqD+0yr2LadRJHXYD
	 Bq4Gh43LrXqn/SO2B12dGeBodxdc0wLCI69I8ST8Ygf0zNwlkPbhPsVtnWFE0AOxkXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794882289;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Cc:Subject:To:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=uH3MDMdyopIaZKpkqviboo/EDVOtwx9+xVXP04gf/kQ=;
	b=DMuStezUXEymF5GigY6AhrSIvN10O8TDuTZAlJl4LdqDlo34Lf4qiIpU7prPFoyKuurg
	 IlditIiC9q1F4ARGd6Rmv45BLCDQlZPnc59Si1m9C2n6iE8xutE//YuwD3jcO2KsAb6fw
	 7l2XT9B0mtD5axsIaOiMk6wKVVt3sGVmwC1DfET2V261AHWwnAPkOU5C03S8dIyMezqag
	 twPmPsAJwbgQFZr0Z7DalvoPbiWBY7wBfZVb6s3DsNe4+3V6SuxYhUr2uwAR3hYuskX6W
	 3EMa3I0EPPDc3Y+aTzUuMXPWAVirEqbYgLFZHO190Ns79glZbWO/FYwCvAIgKuJSgjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=uMMHrjwT;
	arc=none smtp.remote-ip=91.218.175.246
Received: from mta0.migadu.com (out-246.mta0.migadu.com [91.218.175.246])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EB30606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 02:24:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2EB30606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=uMMHrjwT
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=XlJ2O//VHMV2e2UIlnUsqIv/jZtPQwlwZWUCdtzd9gE=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794882286; v=1; x=1795487086;
 b=uMMHrjwTXS/H6vLdgTrW/0YFFUuh2wEJW4+BXmUO1GmJKRH47ULhDKgQByIwQxAjxii3RBHe
 rABany8dHTlATKPPl/vwdpKP/WsG1Hp7xQFJv+iws09+Fuh4214gdavvUBAbTeM9iU940n8/FwG
 f1Ci6b5dTJCUx+s/pHImEVp0=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id dfa9f4e3e3e5b607;
	Tue, 17 Nov 2026 02:24:46 +0000
X-Mizu-Trace-ID: dfa9f4e3e3e5b607
X-Migadu-Flow: FLOW_OUT
Message-ID: <300d6954-0470-4ac4-8602-67f428b12534@linux.dev>
Date: Tue, 17 Nov 2026 10:24:38 +0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: cui.tao@linux.dev, WANG Xuerui <kernel@xen0n.name>,
 Song Gao <gaosong@loongson.cn>, kvm@vger.kernel.org,
 loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] LoongArch: KVM: Fix uninitialized stack read in
 dmsintc_inject_irq()
To: Daolong Zhang <dlzhangak@isoftstone.com>,
 Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>,
 Huacai Chen <chenhuacai@kernel.org>
References: <1794880990.6AFBB5DE.001.4jT7L63YwBz23sl@fangwg01>
From: Tao Cui <cui.tao@linux.dev>
In-Reply-To: <1794880990.6AFBB5DE.001.4jT7L63YwBz23sl@fangwg01>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello，Daolong,

在 2026/11/17 10:03, Daolong Zhang 写道:
> In dmsintc_inject_irq(), the local array 'vector[4]' is declared on the
> stack without initialization, and each element 'vector[i]' is only
> assigned when atomic64_read(&ds->vector_map[i]) is non-zero.
> 
> Whenever any of the four 64-bit words in ds->vector_map[] is zero (for
> example, when an MSI interrupt targets a single word, or when INT_AVEC
> is injected via KVM_INTERRUPT with an empty vector_map), the remaining
> elements of 'vector[]' retain uninitialized kernel stack contents. The
> subsequent checks on vector[0..3] then OR those uninitialized stack
> values into the guest's hardware LOONGARCH_CSR_ISR0..3 registers,
> injecting spurious interrupt vectors into the guest and leaking host
> kernel stack data into guest-visible CSRs.
> 
> Zero-initialize 'vector[4]' on declaration to prevent reading
> uninitialized stack memory.
> 

This was already fixed by commit 81aa3a58b542 ("LoongArch: KVM: Fix
uninitialized stack variable issue with dmsintc"). The loop now reads
vector[i] = old ? atomic64_xchg(&ds->vector_map[i], 0) : 0, so every
element is assigned and no uninitialized stack read is left.

Thanks,
Tao
> Fixes: 03de5eecb0f0 ("LoongArch: KVM: Add DMSINTC inject msi to vCPU")
> Signed-off-by: Daolong Zhang <dlzhangak@isoftstone.com>
> ---
>  arch/loongarch/kvm/intc/dmsintc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/loongarch/kvm/intc/dmsintc.c b/arch/loongarch/kvm/intc/dmsintc.c
> index de25735ce039..ef6c064e52f1 100644
> --- a/arch/loongarch/kvm/intc/dmsintc.c
> +++ b/arch/loongarch/kvm/intc/dmsintc.c
> @@ -11,7 +11,7 @@
>  void dmsintc_inject_irq(struct kvm_vcpu *vcpu)
>  {
>  	unsigned int i;
> -	unsigned long vector[4], old;
> +	unsigned long vector[4] = {}, old;
>  	struct dmsintc_state *ds = &vcpu->arch.dmsintc_state;
>  
>  	if (!ds)

