Received: from mta1.migadu.com (out-174.mta1.migadu.com [95.215.58.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD6893CB56F
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 09:25:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789896311; cv=none; b=G3ynuII4d2N0e0GMddj4PjIole3cHJoM7jsdb69gsGH7PcHs0Gxs+zNvdwey1mf8x9sIk3zz3KXY5WvC0enAf5oDqVylkQVLLCjLA2Fq2hFmAd2IyfeF+GSGwM1ygT/qOE31PuTHrdrHJvRarc8SckDIwIJDXYkgSURGJJkd0zI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789896311; c=relaxed/simple;
	bh=lz0EA6hiUS0KAC3VMk3a5ISVPj1hxirPpP5jDVlLUfc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SPY19uCZslE2PTGxf3LLFIzU1+wRoEIRIzikNPIjSd5UpMHaACgSDK5E1gFz1IRc59v1qJnsu0rpkL3Zw5TauhK4y9v42pfY7Ke69+D/98/pJyf4pLaVLXOQg9cqfefAZApn8qmQKZptz4PyyhvEYe+goycMgQFEv+kdVo5y56I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Sw7M0/6M; arc=none smtp.client-ip=95.215.58.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Sw7M0/6M"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=lz0EA6hiUS0KAC3VMk3a5ISVPj1hxirPpP5jDVlLUfc=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789896307; v=1; x=1790501107;
 b=Sw7M0/6MkSKUbYnLIgji/kGC3H/+/99YpDkhjSv9EGtkXNjTCwCfphbbVuwfESM9hbWDjkp0
 IMticiHt+r0AB4PqF6hVOzVD8exjoj0y9cdwWLjQupLPsUqNAGvwsiQgvQVt5nn2msdqj2Wz2cb
 EC9lcXtF8K2Kyqc6kYspy3fw=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id b3f5433f35c01e28;
	Sun, 20 Sep 2026 09:25:05 +0000
X-Mizu-Trace-ID: b3f5433f35c01e28
X-Migadu-Flow: FLOW_OUT
Message-ID: <9895e60c-6a3c-40c8-b188-51891ee6b216@linux.dev>
Date: Sun, 20 Sep 2026 17:24:58 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] arm64: use generic MMIO accessors
To: Arnd Bergmann <arnd@arndb.de>
Cc: Linux-Arch <linux-arch@vger.kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Vikram Sethi <vsethi@nvidia.com>, Mike Rapoport <rppt@kernel.org>,
 Shanker Donthineni <sdonthineni@nvidia.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260920014357.7069-1-qingfang.deng@linux.dev>
 <20260920014357.7069-3-qingfang.deng@linux.dev>
 <5847c824-8d69-4d02-af2f-896bf47f0732@app.fastmail.com>
From: Qingfang Deng <qingfang.deng@linux.dev>
In-Reply-To: <5847c824-8d69-4d02-af2f-896bf47f0732@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 2026/9/20 16:08, Arnd Bergmann wrote:
> On Sun, Sep 20, 2026, at 03:43, Qingfang Deng wrote:
>> Use the generic raw write accessors in place of the inline assembly
>> stores. Include asm-generic/mmio.h after the arm64 ordering hooks so
>> these accessors are also available to the write-combining helpers
>> before asm-generic/io.h is included.
>>
>> Retain the raw read overrides when either the Cortex-A57 erratum 832075
>> or NVIDIA Olympus erratum 1027 workaround is configured. This preserves
>> the alternative-patched load-acquire instructions and pre-load barriers.
>> Use generic raw reads when neither workaround is enabled.
>>
>> Assisted-by: Codex:gpt-6-astra
>> Signed-off-by: Qingfang Deng <qingfang.deng@linux.dev>
> Sorry, this is no good, we need the compiler to issue the exact
> instructions from the inline asm here, both in order to guarantee
> these can be virtualized, and to prevent it from splitting up
> larger register accesses into byte load/store on unaligned pointers.

You're right about virtualization: an AArch64 compiler can generate 
writeback addressing loads/stores, which KVM's MMIO handler does not 
support.

Regarding unaligned accesses, the splitting can only happen when the 
address is known to be unaligned at compile-time. Do these accessors 
need to support unaligned MMIO? If so, I could add 
OPTIMIZER_HIDE_VAR(addr) to the generic accessors.

Best regards,
Qingfang

