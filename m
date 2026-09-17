Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6761D4DD3C9
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 11:56:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789646186; cv=pass; b=HGqIoR7C4JsONwh/GUnVFZHyFhVPrfQn/fqmFHOcn0Qk3rVH0n+BirMc7jSQibz7mrydi4cs0HGsPLaiXS1+Vm+L4HEvO8IIbrUIgLlfAqT/CSni1TgXb/wnT/FosHpVu8d5ShBb1EE0loq2wZN6p8VyJoN2oh3saDRVetjgopU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789646186; c=relaxed/simple;
	bh=CU3ksfEGHWdCIaQTH2LQ60wY6nLY7ierlfjMVdlARvQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BEf3eR2VoXosUJ2J2J5FMxwfsWrBbeRgCuopD+85RZt8lRwWnSxIrLNckZnQ5b2oY+b56WsoWk+nAdA0GPXXdssfcV/opzymHiUcx3Qr7Hf6QlfQJ5FEb42XRmFe99foZEKTe+lC/YbCdVI9UvsqSGeep6Yklwp1/8SqHVABCgk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tGoTOL/X; arc=pass smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tGoTOL/X"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5b778bdb5b8so1100e87.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 04:56:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789646172; cv=none;
        d=google.com; s=arc-20260327;
        b=lgornba1PkWqDL3Z5d+qEpEy6eqtv3rj0OH+oopD7uxiRcq3HYxoBKuEbhe3lmH5Kn
         QIPio1a+FFUsT9CFpiO2h+lKQhHA+sF7SPRTHD5GYjI2UKl6cdE1OQ96KgdE4hGUBCRc
         0yDW19f2h6CaPESjgjn79PSHj3onbeN0w9HMzry0m7qKJbReT2ytjv7O0Sie9Q+988ly
         yEqsLy2oOksd8DaJ/SHxFrdlav6ElFPdLMF/zhHEk2hmGi3EKd3c71wmkX++hjVUxQeT
         hk3hs08TjX3T/d0/fNNNrB7h1tMYBNha+WRnotA8iVXEdo3y5o+8Ehahqkmsa8VuWDkT
         ZpSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=kosCb2yMfsMu2L7rZnHgF6oeDYnJPHYiEzUWC4os9nk=;
        fh=o8ERjfji28IkdIPQX7aBvvdAkR8mQHN+goppD6XnM+c=;
        b=b8zCKFA+lMwHCbC5cQNrXhxukl5JHjrbifYH5Gxr0dBtfUS6k8tee6zFbgekeYYfDS
         64wsSmGxRQ1YJeyeiMIizoPMYD4zQeiAho2ZHvXk8Gqn/uNIVkveUL3aJ4a2D0+s5Zub
         P1dSbvX4/5wxmZJEd3ffRg3i2K5uCQIz3JAyBEMZ96NgWmYny7SrJcqj2wiwbJHqqGa9
         PBiALJ6h1PzAmClMSJo4RX7BSCMs0o3Fuvh5HobT9HtPC1MBpOD2XNtjr3+BAf2pLz0I
         +Fzx6zIXU6Z9tpfmXXUsEsvbp6O5XVW0KiHkR0dsIVbRFsh4eOzVeKVosaIpZOsTEAbQ
         vf6A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789646172; x=1790250972; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kosCb2yMfsMu2L7rZnHgF6oeDYnJPHYiEzUWC4os9nk=;
        b=tGoTOL/XSZ+R/T9gS3JmKFaz8i/orjxMg3pm4QOoeosZfhJ5zxkTi8e/ZdCXsNl6mW
         pJWQ2HrrNUh1wf1ujOU50xTcCBwfuaAVnIQ2+9QW80W9ggsR+sqvc7alFbPa296ZIN+v
         EysBpp6xJvJZ49/WBE+rgsun/IfMZDOAWIvqOiQo5EW4Q7UGTs5RHGSLCvUUGfkB/pCR
         Bg75sgAwlfizHV/hp5gEykcZpZEeVvoUhaS/nsKLZzgkgNChKdTFNLipPMcpVhwEU0tF
         1lO9PHBfbGfF7FMrIz1L4x3LbDvJrLGazL8hXPQ40dlEXLjEZMcTQ73oNK0yiVSAVXCv
         63pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789646172; x=1790250972;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kosCb2yMfsMu2L7rZnHgF6oeDYnJPHYiEzUWC4os9nk=;
        b=uTisAIZcySMl026xbiQuNbR2Oio8gGF5FsfnXKI+xV2NlS173tRrKjl3mwmw988E9y
         CDbArf39nAF5qU2jncQS6DIb5w5nBdJATmKszYOLYJDfRHIWGKJn3oFYQWyN8mIjdN0Y
         jRrHNNMu4laTKIS/gwMh7GoCxBsuX/eNnZKcy4+M1MnKw6qsocAw9j1eo3o0P0awirFB
         4ilnGhrbhHBNB9XNMspgc+ckPIEtJZGYs6zhY/xcnI8OwDGMSwFpeNow+pP1LCAFtmZl
         MMTByaTr+mFy03RtaK3kNUstsPmK9MFHCGRtoRSY4irrtHUdWFe+1uYn20TtBwmlFGwR
         itQA==
X-Forwarded-Encrypted: i=1; AKwUvBx2w2SHW/7j/hRJ3vi+jm//NHXnCSo8iGF+2N7ErE1WyGvvI2SQrrweL1WkBk3rL3jh6SkCDSf4peB0L8g=@vger.kernel.org
X-Gm-Message-State: AFuF++mFKLKpoHDmhKgPvFp1NZOOoDVcMXENEEFKxrMAtulEwrgwzPVO
	TuGZpCzS3xgHYWXHpPHCTWEFyChvO8Z0pZ5jqR8FyX/z5bdr5q6wEEtEp1OWJhjDrAyytybTfDZ
	c48Qd1zSL5icCOhLOrVO0g1ZzFS2x4CwZvbhukjRM
X-Gm-Gg: AYBFou3UfhEIvKpR1ehwUAtSbMF09Lp00AQSeK0nh8roOtVw0gKywDnq5GCfYPYg8C4
	hnBUF7N27h5NGkzn57kf/z+3hIdCB337gSSmw0p5fuwSX8dIAr9jj8iFxEACs2v+ujrFYju50GH
	F+itE4hGZDuawAC5SVt6feCuU4F74Es1AxAz1D2K5ZRZobpF6WudWUcn52wv58RdLVw/ZchiYEJ
	mElCueyLeS7+u6orB/AYEZW0bpzRDQc9vzXjhw3aa8XqZx5pzgS22Z8XjBtm2rmO/zLH2soau6f
	N4wfMuHapKXq/LjlsEJ6vET5FNCPW0yTITROPkaawrL/uqrKvCbQTTVMdpK1oWx7QVE5SiEQuNx
	uOdp23U/65nryXw==
X-Received: by 2002:a05:6512:686:b0:5b4:74e2:4171 with SMTP id
 2adb3069b0e04-5b8bff1fc30mr29453e87.4.1789646171156; Thu, 17 Sep 2026
 04:56:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260915160141.3543048-1-suzuki.poulose@arm.com> <20260915160141.3543048-14-suzuki.poulose@arm.com>
In-Reply-To: <20260915160141.3543048-14-suzuki.poulose@arm.com>
From: Fuad Tabba <tabba@google.com>
Date: Thu, 17 Sep 2026 12:55:35 +0100
X-Gm-Features: AcwNN1Und6z4n8NhcdREXtYfkYZKnB08V2Uvzr0E-uhaZeSThY7dario3kxcFlo
Message-ID: <CA+EHjTxe=UXnKR6DzTqL9d6O0aG+rO+nPKTxKKQ_-w6tpkGCVQ@mail.gmail.com>
Subject: Re: [PATCH v18 13/23] KVM: arm64: Add a helper for VMs running on hyp
 that don't trust the host
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, maz@kernel.org, 
	will@kernel.org, catalin.marinas@arm.com, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, steven.price@arm.com, 
	aneesh.kumar@kernel.org, oupton@kernel.org, gshan@redhat.com, 
	joey.gouly@arm.com, yuzenghui@huawei.com, linux-coco@lists.linux.dev, 
	gankulkarni@os.amperecomputing.com, sdonthineni@nvidia.com, 
	alpergun@google.com, fj0570is@fujitsu.com, WeiLin.Chang@arm.com, 
	lpieralisi@kernel.org, enju.kohei@fujitsu.com
Content-Type: text/plain; charset="UTF-8"

Hi Suzuki,

On Tue, 15 Sep 2026 17:01:31 +0100, Suzuki K Poulose
<suzuki.poulose@arm.com> wrote:
[...]
> diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
[...]
>  enum kvm_arm_vm_flavor {
>          VM_NVHE,
>          VM_VHE,
> +        /* VMs running on a hyp that doesn't trust */
> +        MARKER(__VM_DISTRUSTING_HYP),
>          VM_PKVM,                /* Normal guests on pKVM */
[...]
> +#define kvm_vm_hyp_is_distrusting(kvm)        ((kvm)->arch.vm_flavor > __VM_DISTRUSTING_HYP)

I think this should be `>=`, as in kvm_vm_is_protected(): MARKER()
gives the marker the same value as the enumerator after it, so `>`
leaves out VM_PKVM. As posted, kvm_phys_addr_ioremap() no longer
returns -EPERM for non-protected VMs under pKVM (EL2 still rejects the
mapping, so it's only the errno that changes).

Cheers,
/fuad
