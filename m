Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794337040;
	b=YLuvo3xME34EqAn/lmF0FW6IOrXhqX6Uld3cMbpqGCvK9j21gI/8nlsB00vsrB1Rm8kw
	 I5Y2OkwCoCMFDcO8SVYj9JaV5MVGuJ4BrmiFUKnXYyAjwh5fLkOQUH/2j2nGlLkbZygec
	 eujEMgYkBjIu8HNTT5lZ4pCxCGtSPvs72qF5lcBc4lPkM8SRt2i4LbYnlckC3KBRr9vo1
	 lNwDdiqDwUefltYyy/OTos9I90kBWmiX7PUjhF4zk8DWAFES82hsV1t4YZKjCNVhOzYe2
	 PKNAK5fgqF/zzlKZM9za/2e+wCQBDiT++z4uY5fNYgaVynHOMtYUuUpoXpCaTZFSrjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794337040;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=AQuihqHEux/S4RsBANsKy60bFVxIx3B8NgZdRBTW2qo=;
	b=tO2OgKeBhfXMs935kHrLU/hPfp0kPOsMzLJv7V/Cm6EXYAEuf3DoUHywsdParfnmkfYs
	 cb9xWfKMD20uiIE/62zLtsrsC0IzpeXQsvxuoDV9Xlc9iyGAngIFM+O60/xJ0ud+iQiUa
	 /EYOEWm1Dk8RIiKF1UZxShueNVi3YAZKJFjbo2MHzzXYBzxdb+gd8cSIaQwgTj9UJhMGW
	 /81SSC0TZXfaVKYVLfvHwxubXpTdBLeC1HlLlyp/pt1FpMwQ0Cr5VESERN4U6aQgYubOI
	 VEwtzv0JI30Q7gIluXMrrumtu7VUic1vPTQcvFVbABiyBPG/+nlS3SVKINLvkGHu5wg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=KtdpTBuv;
	arc=none smtp.remote-ip=209.85.216.69
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C72C4606A333
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 18:57:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C72C4606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=KtdpTBuv
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3aed1b64104so3370876a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 10:57:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794337039; x=1794941839; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AQuihqHEux/S4RsBANsKy60bFVxIx3B8NgZdRBTW2qo=;
        b=KtdpTBuvQpxNf/PQA2KlTeTveUJLkpuq8YAbqZeMA1bNsCwk9xe2hW4AaPxM7cqPyB
         54PNxha3Zd9SpgDpvydjfPqJUzaZQJjU/baA4fc+/FQyoWQZxN03pKvLJEjfxSsSjq33
         B9yq0EuzA3fbleQyqYBx8u7kxY4b7yD3qV03bH661i+7FM0wWY6U7fEVJkNijN4VC2VA
         l9fE8acTdNN2AJSYSXedfZMA8cmlyAGdAEdj42pYqGONsf4G8kZv+mUExGcCV/+mNfGI
         ejnhhcRKAfkzFsjDEfPTsiqDlCU2fT8urX0o+Gill3iNpasXAjAFaN+ZZM2CzJDz5ncW
         tWvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794337039; x=1794941839;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AQuihqHEux/S4RsBANsKy60bFVxIx3B8NgZdRBTW2qo=;
        b=RGNJOD5Zb/n5R+VQqlJGwB9/Fb5nWDU2c+PgS0epWWxur0DOR/6UIgCagcgBNtGI6+
         Cn/gSbo3/5P1vO6dq9VSYZ+rj1DvUKwXHo5CeIPSmHDYOskS42OlaCyZTMIPkIZiG8rG
         1HYtL+YjBEJ7zP95VWtJww2+0bC3zHEuwXNgtc0nN5YkvO735fvHzfXM+CIT+xWc7P05
         e3um2bo8ekgYw9aUu59trku5xSeIInLp1EGo2ZVG5vlLsoBRp1G7zaLmOooFmAFZuN6D
         5LGTkuJh5unG5NyI8bLBsJkmu6Fz8wi6ZhP0vHla2BLJxBvZ0M4meoaX5M8N78hbYyxM
         PL0A==
X-Forwarded-Encrypted: i=1; AL+hErFo6RUCY/i2crZoWczpu3Fbk4CmHsh/yRnRu9OlmOVWor+8HuO73S3Mku5JfZk3y4R+WrJ4FzrKy709IWk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8F6ZiWu02KZH23ryUlKdlGntnMmWHWEjAJ4E/jA9GVgM3Blf3n
	saCLTPypvMDLnt5srtg3pXi8F3ZjGdpLk9020LS9eHP6QwYaPM9ymW8Wo/zWF6CbNkq7SIMhUsy
	0fRzF2g==
X-Received: from pjdq9.prod.google.com ([2002:a17:90a:2e09:b0:3ad:32d0:ca0a])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:1c88:b0:3a0:ca1d:b40d
 with SMTP id 98e67ed59e1d1-3b166ce0e87mr3977029a91.55.1794337038803; Tue, 10
 Nov 2026 10:57:18 -0800 (PST)
Date: Tue, 10 Nov 2026 10:57:18 -0800
In-Reply-To: <CAEvNRgHKQVLVza1dw9-OrDAt4-b6zbhx4T64D421sqb2MPWs0w@mail.gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261105-tdx-selftests-v16-0-2024e8fa517a@google.com>
 <20261105-tdx-selftests-v16-3-2024e8fa517a@google.com> <CAEvNRgHKQVLVza1dw9-OrDAt4-b6zbhx4T64D421sqb2MPWs0w@mail.gmail.com>
Message-ID: <avNpDjWxrgThIUXE@seanjc-mac.roam.internal>
Subject: Re: [PATCH v16 03/20] KVM: selftests: Initialize the TDX VM
From: Sean Christopherson <seanjc@google.com>
To: Ackerley Tng <ackerleytng@google.com>
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
Content-Type: text/plain; charset="us-ascii"

On Mon, Nov 09, 2026, Ackerley Tng wrote:
> Lisa Wang <wyihan@google.com> writes:
> > +static const struct kvm_tdx_capabilities *tdx_read_capabilities(struct kvm_vm *vm)
> > +{
> > +	static struct kvm_tdx_capabilities *tdx_cap;
> > +	int nr_cpuid_configs = 4;
> > +	int rc = -1;
> > +	int i;
> > +
> > +	if (tdx_cap)
> > +		return tdx_cap;
> > +
> > +	do {
> > +		nr_cpuid_configs *= 2;
> > +
> > +		tdx_cap = realloc(tdx_cap, sizeof(*tdx_cap) +
> > +					   (sizeof(struct kvm_cpuid_entry2) * nr_cpuid_configs));
> 
> Would be nice if struct_size() could be used here instead of manual
> calculation of the size. Same below.

...

> > +void tdx_init_vm(struct kvm_vm *vm)
> > +{
> > +	struct kvm_tdx_init_vm *init_vm;
> > +	const struct kvm_cpuid2 *tmp;
> > +
> > +	tmp = kvm_get_supported_cpuid();
> > +
> > +	init_vm = calloc(1, sizeof(*init_vm) +
> > +			 sizeof(init_vm->cpuid.entries[0]) * tmp->nent);
> 
> Would it be possible to use struct_size() here?
> Or perhaps kvm_cpuid2_size(tmp->nent)?
> 
> > +	TEST_ASSERT(init_vm, "init_vm allocation failed");
> > +
> > +	memcpy(&init_vm->cpuid, tmp, kvm_cpuid2_size(tmp->nent));
> > +	init_vm->cpuid.padding = 0;
> > +	tdx_filter_cpuid(vm, &init_vm->cpuid);
> 
> How about something like this?
> 
> 1. Query TDX capabilities first to get tdx_cap->cpuid.nent (let's say N).
> 2. Allocate init_vm sized for at most N entries, since the filtered
>    result can never exceed TDX's supported CPUID set.
> 3. Iterate over the TDX CPUID capabilities, look each one up in
>    kvm_get_supported_cpuid(), and append matching, masked entries
>    directly into init_vm->cpuid.entries.
> 
> This would avoid the memcpy and all the memmoves, though this works
> as-is. Just an optimization/different perspective.

At this point, I'll do minimial fixup when applying, e.g. if switching to
struct_size() Just Works.  But I don't want to do anything more invasive at this
point so that we can get TDX selftests landed asap.  To be clear, I'm not opposed
to more cleanups, I just want to do them on top.
