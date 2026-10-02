Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5167E445ADA
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 21:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790975497; cv=none; b=ek3ZPJ2VSFReRwS21fuINlqt8gy21JEEBF8hah3qTekSjKB8+Qoj3hH2dyyHkKVWOjbYMDgdo6KSTXWhFyDLp/CWK0BkBKkw8dvdHWXGFHSfMFaOqzbsU+X7jT9gg5BIjYbW5kwAW1GUw8wDrrxc/jpfvxy12FWkuzFZ6Y5p20s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790975497; c=relaxed/simple;
	bh=SbeoSzc8717QD/IqpcZd0l46LWnbezvyajiiws+1ApY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=syfAZwYie1veFg1kp030bd2qZaWRXV7JLGdydxt3g6v7DHoBtjWIVKKK6XEVwz3oR4jDwt/61TutsQKdLgiBoJxNiMaVZ/GRlIeT9FpK76TCYim+vPsAYgCWBZRfxkN8MNnOhKoOWCwk1V8eCGi2tqLiW7kYIRlBU+tvc4zKBsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=oFV2swOR; arc=none smtp.client-ip=209.85.215.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="oFV2swOR"
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc1b6f65dacso15803a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 14:11:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790975492; x=1791580292; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wShwsJKvODsiktjEQtwHrAPB94R0KVRpk+BGj5cEKBU=;
        b=oFV2swOR/Zcywc8myCyZ2GnQmITK4lzFf4CizWfJzJZ3x7DFkCVoPPRvQcZP0N8jCp
         1JP8uv7WfZzK5sBU64OofXfEExyLrLaokCFB6h1ibJeHR2GEKPQhKOJ0RxSwDwuHihyQ
         V2MhfnhcGYdR2CrObdMIPG6GGEUuUxUU5tpzXNWdDoOmzG88SIz4PDp8aUVvrM8gRxT/
         AouP7CiKNU99kIuLwaMR6tVCIr3r9G4/8YcUgQ4GwY376LpBff4pk5fenip+js6R6kf6
         UYh1H7b0dpRnWNCYbzpZvcfxI/lP/ljxAIqk/xR+NhL4pUeNgLC5fXcFZEbyDvVYIzvQ
         pzXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790975492; x=1791580292;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wShwsJKvODsiktjEQtwHrAPB94R0KVRpk+BGj5cEKBU=;
        b=Gt36+WwSat3kxCVfIt2a801cMEhxjZXfx3IO4myac82XlKnvEFBgw3XzJ/ilQKWiQ7
         BDGkZJ2tMS6bvuz8NvJ3XV8kqDMAosnrjs2WqJSJ3Ij8X9myX6gEV3Iin4logEJPUnlS
         QaZV7hw8PCTyPaQAwqxEtkBZEHoQXq8g6FDtpeRmOgkBBuXbaDzn+wF/w5jYC6dY0EPQ
         xh3v/HpvymxXRyRbIJRZwtWMbWmFksKMw7JJ9LJbuwDDe4/5qf8QUJZaELV1yh37k2rZ
         l3GIthGiHGwDT917BPXTow9TI3eZFvePwUzhAcsZakbtMncZnoiUhxsQLr4mxvvLvCVo
         utKQ==
X-Forwarded-Encrypted: i=1; AKwUvByRet2MxLCNg6AeACQpxVOQwI6uGHF1QwdxYuI0mZn5OXg8rfTyjtS5hU1WEIYb9JE2xg6RWyadPTCURWA=@vger.kernel.org
X-Gm-Message-State: AFuF++kgVUYUa+tOMNJAOcvgtQBsJeDRKJRRSCyHjc1qIaVgvLiPah9K
	icAQGn6p9cg2GQ1XBLZ7OF+Nmqn6IlDPrcXBLxalwGUl5Xy+6XZnuOPPrD2XZoAGWjl4R04yIX4
	d0jd/GQ==
X-Received: from pfme28.prod.google.com ([2002:aa7:98dc:0:b0:885:6385:6167])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:4516:b0:3de:61f3:33f8
 with SMTP id adf61e73a8af0-3e0bcf64e6fmr3964720637.43.1790975492097; Fri, 02
 Oct 2026 14:11:32 -0700 (PDT)
Date: Fri,  2 Oct 2026 14:07:34 -0700
In-Reply-To: <20260903223258.486034-1-yosry@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260903223258.486034-1-yosry@kernel.org>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <179097499601.4081097.16696339000915079689.b4-ty@b4>
Subject: Re: [PATCH v2] KVM: SVM: Trigger new ASID allocation in both VMCBs on
 pCPU switch
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Yosry Ahmed <yosry@kernel.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org, Stefan Teodorescu <fane@google.com>
Content-Type: text/plain; charset="utf-8"

On Thu, 03 Sep 2026 22:32:58 +0000, Yosry Ahmed wrote:
> When the pCPU where the VMCB was mostly recently used is switched, reset
> the ASID generation in both VMCBs, triggering new ASID allocation for
> the immediate VMRUN as well as the next VMRUN on the other VMCB.
> 
> The ASID is shared between vmcb01 and vmcb02, and gets flushed on every
> nested transition. However, since pCPU tracking is done per VMCB, it is
> possible for one VMCB to allocate a new ASID when migrated to a new
> pCPU, and then the other VMCB reuses that ASID on the old pCPU. This can
> result in the same ASID being used by multiple vCPUs on the old pCPU.
> 
> [...]

Applied to kvm-x86 svm, thanks!

[1/1] KVM: SVM: Trigger new ASID allocation in both VMCBs on pCPU switch
      https://github.com/kvm-x86/linux/commit/bf260dc9e7b8

--
https://github.com/kvm-x86/linux/tree/next
