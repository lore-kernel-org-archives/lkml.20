Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793612915;
	b=wF7Rbrc8Xu7oUtIAmVdl/kePEE6irBkCZ23ujOBOfAj+n5mA2m9+o4PkXJqvG6ZsUprH
	 Rr5lSy4L2E3q8iA+N0ro6hezFM7NwoTQZuSlUzG1SZ1wdF4IfnxJ7Ny+gBGZvNWn3OyCG
	 7QNrVQ5BecK6V5L5RF69GS+hao+jLf++ojZ480q7rAVnMQQB7qG//0Qr7b3cZ++s6jSYN
	 /+vd3fH1LBE//rR0GDjqAAJEOrv1b78TpC/OYLVBy3gqa62amroxT+Xmkifsj0Y66rQli
	 0jBTL2sm1RIUXsR2AOW28HSy4umf3igE1XDoGP2w+VFIChHKSP3TxE5TdsDI6U0Mmxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793612915;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:Content-Language:To:Cc:References:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=XzXbFa9dhaHcA5InRfsQcpgxHEo38p/rPjsetoAUqnI=;
	b=2IuZSEGJAi9b/QRg22G2c3scCcBvChuQpqjYVx/u/lzBmEJB3HGj9ct+201rodveWnbo
	 gY1pPtgQ3c2BXQmmgzdAGmLj5i5kIEQ8yiy34q0qDTc3LLFk+eiQu7RlPGp23CDtyZOXx
	 WJviJiTEmrr5+E4cAs3WFW545RGQZTV0uQtNzEy8XmePJr+6iT/Ta5Xf4fJ23mdWx+YDA
	 QK2jT/BxCbq1So4Lp31kcSvgNdg55kFCX0xbSYe2aWJqA4EVyVC1tSQPts9LEavOgClOq
	 tfeBCHROjcZo/TyLUZNWVVKcg787SfZNf4u7Ev4pVLPej90WcnlqpO8zXsrPv9wouwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Ynon53Hc;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6838C606A329
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 09:48:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6838C606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Ynon53Hc
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5E4CA1595;
	Mon,  2 Nov 2026 01:48:30 -0800 (PST)
Received: from [10.57.66.79] (unknown [10.57.66.79])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7E03B3F59E;
	Mon,  2 Nov 2026 01:48:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793612913; bh=egNufJ8Fs17VQdSUqK9Yn8uet05avqZAAkBSvGK+45M=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Ynon53HcE64fp/Me7zZFgCGztnBBDUBW2GmC+Sf0pi8kPLH8QE/kKP57h0JRrEBB2
	 1vC78ArVZuvu+b0nB3+ViqwkWzHLr+ImoxH8RD00O18DKfY/qipoYKFE9sbFOfdk/G
	 cKmlmZZY59kGB9LXU/LSMpUJNexVZvouUd7nWaTs=
Message-ID: <2458da32-5235-4dfb-a817-7557230b9885@arm.com>
Date: Mon, 2 Nov 2026 09:48:30 +0000
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
Subject: Re: [PATCH v4 1/2] KVM: arm64: Clear the VM's feature bitmap when
 kvm_setup_vcpu() fails
Content-Language: en-GB
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
 Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>,
 Zenghui Yu <yuzenghui@huawei.com>, Will Deacon <will@kernel.org>,
 Lorenzo Stoakes <ljs@kernel.org>, Jack Thomson <jackabt@amazon.com>,
 Congkai Tan <congkai@amazon.com>, kvmarm@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261102075843.2556018-1-fuad.tabba@linux.dev>
 <20261102075843.2556018-2-fuad.tabba@linux.dev>
 <07d0afa8-1b9a-4991-a419-9840cf629d57@arm.com>
 <CA+EHjTwNSxBa8-_0Q6zmgqW0RGyVhpUU3xnFg3-sqqmsdL4s8A@mail.gmail.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <CA+EHjTwNSxBa8-_0Q6zmgqW0RGyVhpUU3xnFg3-sqqmsdL4s8A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 02/11/2026 09:42, Fuad Tabba wrote:
> Hi Suzuki,
> 
> On Mon, 02 Nov 2026 09:24:15 +0000, Suzuki K Poulose
> <suzuki.poulose@arm.com> wrote:
> [...]
>>> diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
> [...]
>>> @@ -1856,8 +1856,13 @@ static int __kvm_vcpu_set_target(struct kvm_vcpu *vcpu,
>>>           bitmap_copy(kvm->arch.vcpu_features, &features, KVM_VCPU_MAX_FEATURES);
>>>
>>>           ret = kvm_setup_vcpu(vcpu);
>>> -        if (ret)
>>> +        if (ret) {
>>> +                /* Clear the bitmap if setup fails on the first vCPU to be initialized. */
>>> +                if (!test_bit(KVM_ARCH_FLAG_VCPU_FEATURES_CONFIGURED, &kvm->arch.flags))
>>
>> Is this check necessary ? We go into kvm_setup_vcpu() only if the bit is
>> cleared and we do this under the config_lock mutex. The flag is only set
>> after we have finished the kvm_setup_vcpu() successfully, later down.
> 
> It is. An INIT on a second vCPU with the same features also calls
> kvm_setup_vcpu(), with the flag already set, and
> kvm_vcpu_init_nested() can return -ENOMEM there.


Sorry, my bad. I missed the second condition after the flag check
in.

Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>



/me Where's coffee!

> 
> Thanks,
> /fuad

