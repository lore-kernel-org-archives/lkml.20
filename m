Received: from mta1.migadu.com (out-95.mta1.migadu.com [95.215.58.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68D2045C70B
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 10:55:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790160906; cv=none; b=n53X6zQHTkhqd7gF23Kvv/MaIlTvP6pgF+yDvnwzJJ6gbHJQXGl53ZtnPf4IGzkWeRUfAPeymieVUm7r3D/BC6td1yuRqHXbSbSNOFR4nygoilcZJBxLj/heQVkkJdOnU2OVOf0vfhNeQvc9Ix2EjH5gFOB0TB8gXwTwRt9cV8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790160906; c=relaxed/simple;
	bh=yVmUpuIH4LVI1oZQrr2/nMm/0eXEyin3chUnWBcISSY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QxvR8z5lzCekqa3iYvNrs/BaTVpdsByW8dBcDzaFirqCzGeK4pN9PbKT87WlleQq02ki6QZIr9zVxaXZudS6xtZBPBbOoCrBA4UvUqHaL6UbuOjjtWdly3Ezt7ObB0/rWRndVMYxG+IBdOFuEI7lARasJuorj3t/O41pxlwzqdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=O+LUFOr9; arc=none smtp.client-ip=95.215.58.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="O+LUFOr9"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=yVmUpuIH4LVI1oZQrr2/nMm/0eXEyin3chUnWBcISSY=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790160897; v=1; x=1790765697;
 b=O+LUFOr92R+1zqzkDayqhVMQihASibWeBWZzn7ckRSVtFEZPXJPtLPDbfAzZsEHMMn7U5DoV
 M1hdp3imABKCNBjCkr2PPrYaHAJWStOY5M9RTiad9aswAj0+xVF37qeEPIGXH5JnA4VZVk85rf1
 eqlARjGBsTBLMECP5Tvu3xzA=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 05bb919ae2d24cba;
	Wed, 23 Sep 2026 10:54:57 +0000
X-Mizu-Trace-ID: 05bb919ae2d24cba
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5b8c42da963so5217e87.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 03:54:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzl3cWyx7LptrEdQrCeCOB5SZYIRTNDe+ShiAz0SdQRSDhkaMEpzpcqZBhbb+jSzcny2HktFCDYwZkJNqs=@vger.kernel.org
X-Gm-Message-State: AFuF++lasOjKUSzfVP3MPTYaMBBvwry0SBFofrjuGLeym2J5u3rYomiZ
	bRgZFaNGc1uoXatD9tsv2cA2kFfadAo/Xq83eNYVv8/HZBHa6rjCXhf+YvYA5tsCnNumWos+LUz
	Bmnxo2q+DommbPlV/1z188NsDpw+omW5/RBYAc4wa
X-Received: by 2002:a05:6512:33ca:b0:5b1:5141:9156 with SMTP id
 2adb3069b0e04-5b8d9160e2emr107555e87.9.1790160892115; Wed, 23 Sep 2026
 03:54:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260922-kvm-arm-prefault-v3-0-787bd3bc7e3f@kernel.org>
 <20260922-kvm-arm-prefault-v3-1-787bd3bc7e3f@kernel.org> <arKxjsxuO1F5ExrY@kernel.org>
 <arK5n9HrbZMCOHOt@google.com> <arK5ynpRi7VbY7Ek@gremlin> <arK8seJVT9wYgVCP@google.com>
 <arLD-eZ6dRvfZ52q@kernel.org>
In-Reply-To: <arLD-eZ6dRvfZ52q@kernel.org>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Wed, 23 Sep 2026 11:54:15 +0100
X-Gmail-Original-Message-ID: <CA+EHjTxFVWHUBCD+SZvSG7T6=i6ZMWWRkNqQ3rMmSt6LwrcjtQ@mail.gmail.com>
X-Gm-Features: AclHuK-6bXSKYKAlCXF5uVJdAsZAvVzP1kh4sI2y88uNwVQX6Xs_X_01A5MNiE4
Message-ID: <CA+EHjTxFVWHUBCD+SZvSG7T6=i6ZMWWRkNqQ3rMmSt6LwrcjtQ@mail.gmail.com>
Subject: Re: [PATCH v3 01/14] KVM: Allow architectures to disallow pre-fault
To: Oliver Upton <oupton@kernel.org>
Cc: Sean Christopherson <seanjc@google.com>, "Lorenzo Stoakes (ARM)" <ljs@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Mark Rutland <mark.rutland@arm.com>, Randy Dunlap <rdunlap@infradead.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Jack Thomson <jackabt@amazon.com>, 
	Jack Thomson <jackabt.amazon@gmail.com>, Alexandru Elisei <alexandru.elisei@arm.com>, 
	Vincent Donnefort <vdonnefort@google.com>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Leo Soares Passos <Leo.Bras@arm.com>, 
	Wei-Lin Chang <weilin.chang@arm.com>
Content-Type: text/plain; charset="UTF-8"

Hi Lorenzo,

On Tue, 22 Sep 2026 19:07:53 +0100, Oliver Upton <oupton@kernel.org> wrote:
[...]
> I'd favor doing something like below and sticking the comment inline in
> the ioctl handler. Unless I'm missing something blatantly obvious, I
> don't see why the x86 or s390 pre-conditions can't be tested early too.
[...]
> diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
[...]
> +int kvm_arch_pre_fault_allowed(struct kvm_vcpu *vcpu)
> +{
> +        if (!kvm_vcpu_initialized(vcpu))
> +                return -ENOEXEC;
> +
> +        return 0;
> +}

The same goes for arm64's pKVM check: kvm_arch_vcpu_pre_fault_memory()
returns -EOPNOTSUPP for is_protected_kvm_enabled() only after
vcpu_load(), so on a pKVM host the ioctl loads a vCPU the hypervisor
may not have created yet before rejecting it. Could that check move
into kvm_arch_pre_fault_allowed() as well?

Cheers,
/fuad
