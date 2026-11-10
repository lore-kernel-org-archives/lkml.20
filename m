Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.222.180
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1794346785;
	b=MkwJQu/83wzo/FQw1qpB0xJ3UNJmgfeGtdHG++MNdxKtjM5MYj8DUAZVtwlS2e52AqMT
	 S9sOGdXOrKfEi/aKs7M8QeFDuVRci3Ouur+8kjZgqdE+eBW4DOj/B0DqnBkjOpCAGHbVK
	 7PYzum2ggZOXf/dtq3EZVpu0O9d7Goj0a4hbp/UAaq+TtHcfpzotnJW3GOsu+aslzftUV
	 2mx3Qc+1jOMYdvnqDJgt7FrwMT4gs2auh93QfmuGDnq49uOXTkiShe/SGsaVi+huHkIrl
	 kwwVCEKODqxtAAGKkophYOUMqWYwXXfCWunX9zl6IpC1Zz/GglMK3m44LcDZY/yDYTg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794346785;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:In-Reply-To:References:MIME-Version:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=iE/aw4N49+XkvXz5BpRtqkYQEcfxLRfryXdyEysnhdM=;
	b=B7htGlJEK9NF8CuK6iEHT4QVjvLBEzKX76fwHqAc78tnIr6I4w2rRm6Aynou3xVzQj0u
	 PnBD2gLh5oOxdm3ZWt6jOLg0glgBW+RkmFX1oxidCbNjmvrICfEKZX2CC0hW1bxLWf+/k
	 DQF3FK++DvW4a+Reuu4VgMM5KB8s/ww8dwDxeCjrmyR6Sf2PK+PKIfCRqZ1rnqRL9NiEc
	 SS72/pmmRviePimxoZ7DReI38i+HZeGYvv0bRkI5NmmiHD0XfXP7Aejq4cl5gl5YfGJY9
	 dHsLhx95/bk5qWgEJ3zpZLYyWfmHlx3DY5FbxCDbNB8x+PzyAmGGdBzlYCzgU2RplMA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=H+ckaDOt;
	arc=fail smtp.remote-ip=209.85.222.180
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09A19606A327
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 21:39:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 09A19606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=H+ckaDOt
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-945ae2daa68so309575485a.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 13:39:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794346784; cv=none;
        d=google.com; s=arc-20260327;
        b=gdIttY+gXC08o/RIuAd0yMV598IOqg7j/lAFLza3sCOv4Bd+rmYI+LU2FbtELFqxlM
         ugSoXIISnxvvLuWQvNZh8TxBFLFs1Bcs+YOIyYK4r2eEXjlhuKkmfHqrt/ljs5m6OVzG
         RQUn8sWlgd5o9Fei7lGtNEO/oUIX6Qt0Yon9uAmh4oTy01B/Vjjcxq8h2sd+oLW+2TdV
         jceKa8u+rJOSEyHK2/Jhh52SxTeuFi75dT8V4PpFpkCEbaTJwj0e3FBYNM10maxXE8C/
         pZNv28ETLC1YBa/7BSNevVOxVVvCs8pb/L81ovseAxPFsXjOcsawkCNnoIj0AzJJNOWm
         7GJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=iE/aw4N49+XkvXz5BpRtqkYQEcfxLRfryXdyEysnhdM=;
        fh=C3EjO4m35kq6YBi7wYGv5QTdxTezbUaYOpjrPFCZNNQ=;
        b=ECEAhnb0wql6IwP5fOkTcMDtt16/5RFnUlM1wKyXZSuGGyRcVDsPtbAV79bz0EF7En
         YRW03QC3QonjydRBwcic1J97P+GeOPJm2kDE39zn/D7D3s1pNMC63eWT0IaBqj78UeoC
         3/gfDyNDav09BsSy4YN7zKhM8D6QLsDkmkDYLyT9gb6i1Q++5JurdNbIax0lysMFsCxl
         xa69NxlZmGGk/QQL7dv9MN+T0+iqkkNg/vKHsGxEAIItIm/9jRqFVxZyjWce4favud6x
         tjm2iGZim4l159YKpnwnZ1oUW+JbCE6AqS3qRO6V3bDV1QDXnlpfU5C/c+w9l6kcekO+
         Pg0A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794346784; x=1794951584; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iE/aw4N49+XkvXz5BpRtqkYQEcfxLRfryXdyEysnhdM=;
        b=H+ckaDOtIOCnhx/jrqwxkuv0aBI9KiHdzFKcnxZzU+YavdoHOOF9T5gZQo/BKGIJd6
         vCJnxtEyU1t8zXCF3zy+dayh8XujIc/IDqGWgWoCnFXN+9nfBJKvyCxGiciUfGkS2rp5
         GkwFHqpBAqPv88LVBaKM29pKQ2NHdr7fWYPMlYuj9M9RjNd1yT7GkteG0UXzt0nebfjV
         AH03p3zKot1FGaLx5ZPgGcPWpjOhVvnAgyO0lQNfm8L++CW2G81vD9mpYU9EgA2nEkbU
         OoZe9O/RcFH4+xgWiH4r4R6urcB+QQiMnBrRLf8CLR6hcUkikZCiBALj+XhMgQsgGAvY
         a6Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794346784; x=1794951584;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iE/aw4N49+XkvXz5BpRtqkYQEcfxLRfryXdyEysnhdM=;
        b=WjS3Goe0QI0DrgB6NfNPphjeRlDAqXr0QXGivbjqWAhW29qQ8XarMlSTx0H5ZdI+Jx
         4tmdVfTcPqACvyRfxvfURBvTZ1eBjTR9kczv52Vxv/mxZSk1k/HOJmByaTEY7SJDqylZ
         OblBVyh3RrOqqgZFl3zrp97TokEc3rh6YrAqV6EzEuq2ordFEn1n8uQWtg3VyMMMMcqf
         h09ztm7oA/ybTcK9zsySaF49zKHxgsKDA1r2d5Y71tKzfwgR9ay1u3+jjuYHrW0CNZOg
         KSFkkwdOKQe0ai+4/NPvyse9vkCNxPS4CEaxhBkq3c2FdtLHA5KNfv9PpJ+e4Jv0gFFN
         Tfkw==
X-Forwarded-Encrypted: i=1; AL+hErFY2GtAtBsDtNy3xOx1UCgIhULdHTVfoSdCRK+ThqRV1nUmzMaQSYx+ouiAlpsvjfzdtlVBs/ukxZRKPI4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8CnDLJKRF1n8dbAICnl8ghKj7TN8flD25iSuLAsDpoElHPg93Z
	VohmFVax/PAN95YF7K+Zrz0iTLMIK0edx48fjY62wP4cnkfVjk+6E8J56imgdBkv+MWIDo3ofbE
	y1BSvkzHB/S9IpL2lN0IAMUU9c3hEphdZAf49XKAo
X-Gm-Gg: AYBFou2knKRnxCh9uazBSxaNy2TgTOwLLVvikOWS4JEGjGZ6ozEArj60O/fW8Pbbi61
	ChrYrTyT+s/+TLLvH1mfYqBkRUa0qfvaSTu6XGtzKmq8hSQhojWvUJ/kA6dQTAUodtEsqaZYavC
	FKFlbyw/U3tWBoAIB6XEFc6F4EgNtWnCe4Dft/UoOm0PfrUlQ7TIv+WtxiRmdI2t8hvs4brGVG2
	+y0S1NYQ9qKVD4miRr8m2Ns4GDZ7GHNMFD4LMvtCrK4vw5+CScVw21479932Ihge4t+xj+Jjzzx
	rtk6EF/YXZNJ7FBBXVgR2rAjx4rq5BoJnvE/t4x6/OfWnZPHEm1N/9vvVaVHaPypGuQXaHsA/e0
	A/6+l6bx638cYmlhfpi1hAUN66iqMooxBFHyeTXcAm2HV+D9rVqEmDwNYobg7R2fE8s++TwO2HX
	e506eWWkC2LymzGsEM40p/mq0=
X-Received: by 2002:a05:620a:6cc8:b0:93e:c12d:4ec7 with SMTP id
 af79cd13be357-947ae8caf53mr124925085a.39.1794346783277; Tue, 10 Nov 2026
 13:39:43 -0800 (PST)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 10 Nov 2026 13:39:41 -0800
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <avNpDjWxrgThIUXE@seanjc-mac.roam.internal>
References: <20261105-tdx-selftests-v16-0-2024e8fa517a@google.com>
 <20261105-tdx-selftests-v16-3-2024e8fa517a@google.com> <CAEvNRgHKQVLVza1dw9-OrDAt4-b6zbhx4T64D421sqb2MPWs0w@mail.gmail.com>
 <avNpDjWxrgThIUXE@seanjc-mac.roam.internal>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Tue, 10 Nov 2026 13:39:41 -0800
X-Gm-Features: AclHuK_rifyMl6fGwEhJizkpiNdLB8JMLlwRf05wofhoaOCF7vOAUu20dn_gm7k
Message-ID: <CAEvNRgF+-12qeZQyrHb4Z8MWOjOGEYQj1hebnxs2gC9nY+M5RA@mail.gmail.com>
Subject: Re: [PATCH v16 03/20] KVM: selftests: Initialize the TDX VM
To: Sean Christopherson <seanjc@google.com>
Cc: Lisa Wang <wyihan@google.com>, Andrew Jones <ajones@ventanamicro.com>, 
	Binbin Wu <binbin.wu@linux.intel.com>, Chao Gao <chao.gao@intel.com>, 
	Chenyi Qiang <chenyi.qiang@intel.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Erdem Aktas <erdemaktas@google.com>, Ira Weiny <iweiny@kernel.org>, 
	Isaku Yamahata <isaku.yamahata@intel.com>, Kiryl Shutsemau <kas@kernel.org>, 
	linux-kselftest@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, 
	"Pratik R. Sampat" <pratikrajesh.sampat@amd.com>, Reinette Chatre <reinette.chatre@intel.com>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Roger Wang <runanwang@google.com>, 
	Ryan Afranji <afranji@google.com>, Sagi Shahar <sagis@google.com>, Shuah Khan <shuah@kernel.org>, 
	Xiaoyao Li <xiaoyao.li@intel.com>, Oliver Upton <oupton@kernel.org>, 
	Jeremiah McReynolds <jmcrey@google.com>, kvm@vger.kernel.org, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"

Sean Christopherson <seanjc@google.com> writes:

> On Mon, Nov 09, 2026, Ackerley Tng wrote:
>> Lisa Wang <wyihan@google.com> writes:
>> > +static const struct kvm_tdx_capabilities *tdx_read_capabilities(struct kvm_vm *vm)
>> > +{
>> > +	static struct kvm_tdx_capabilities *tdx_cap;
>> > +	int nr_cpuid_configs = 4;
>> > +	int rc = -1;
>> > +	int i;
>> > +
>> > +	if (tdx_cap)
>> > +		return tdx_cap;
>> > +
>> > +	do {
>> > +		nr_cpuid_configs *= 2;
>> > +
>> > +		tdx_cap = realloc(tdx_cap, sizeof(*tdx_cap) +
>> > +					   (sizeof(struct kvm_cpuid_entry2) * nr_cpuid_configs));
>>
>> Would be nice if struct_size() could be used here instead of manual
>> calculation of the size. Same below.
>
> ...
>
>> > +void tdx_init_vm(struct kvm_vm *vm)
>> > +{
>> > +	struct kvm_tdx_init_vm *init_vm;
>> > +	const struct kvm_cpuid2 *tmp;
>> > +
>> > +	tmp = kvm_get_supported_cpuid();
>> > +
>> > +	init_vm = calloc(1, sizeof(*init_vm) +
>> > +			 sizeof(init_vm->cpuid.entries[0]) * tmp->nent);
>>
>> Would it be possible to use struct_size() here?
>> Or perhaps kvm_cpuid2_size(tmp->nent)?
>>
>> > +	TEST_ASSERT(init_vm, "init_vm allocation failed");
>> > +
>> > +	memcpy(&init_vm->cpuid, tmp, kvm_cpuid2_size(tmp->nent));
>> > +	init_vm->cpuid.padding = 0;
>> > +	tdx_filter_cpuid(vm, &init_vm->cpuid);
>>
>> How about something like this?
>>
>> 1. Query TDX capabilities first to get tdx_cap->cpuid.nent (let's say N).
>> 2. Allocate init_vm sized for at most N entries, since the filtered
>>    result can never exceed TDX's supported CPUID set.
>> 3. Iterate over the TDX CPUID capabilities, look each one up in
>>    kvm_get_supported_cpuid(), and append matching, masked entries
>>    directly into init_vm->cpuid.entries.
>>
>> This would avoid the memcpy and all the memmoves, though this works
>> as-is. Just an optimization/different perspective.
>
> At this point, I'll do minimial fixup when applying, e.g. if switching to
> struct_size() Just Works.  But I don't want to do anything more invasive at this
> point so that we can get TDX selftests landed asap.  To be clear, I'm not opposed
> to more cleanups, I just want to do them on top.

Good to know that this series is ready for Sean's apply + small
fixes. Don't worry about my suggestions on refactoring.

Sean, for this series, is the next step to wait for the merge to
kvm-x86/coco? Do you need anything else from us?
