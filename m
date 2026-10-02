Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E97803B42CC
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 09:15:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790932531; cv=pass; b=ujzYB0Z1r19lcOz46I2lgaYLdmnVdi3QZ7IHuWXlgaKqwZwKhlADKWZ/K6gdOam705CBmW74HwIE6tZV/iaWNKxQ8tfWk8A7ytetkfYK4MxmOH0H5GawlsgOnbVDNeBSrvwnsTL9K1DhCtR76/nNSNK8SRKtiVTy0XlqCgY+Rs0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790932531; c=relaxed/simple;
	bh=hWB1QcQGFZjdtaZ+WkrO/eQNuOSYDk3BPt9FwXfnsYM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Veelq2mfWIJL85YD8YU8XAJ6fruRVL5t98K4FjJ7VPPvEecjO9z4A8+6LBHtiEZv2rjXHigcrJXqFXib7cUatDL8f2iB3YeA9NijfrpjUkMQxv2H2TBfDw6zW5YuvfgH3fcWCfRuMcaTXdtm7uhDy6xzuT0Enrb/c8vyQzmHOJs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=uUzsD/g3; arc=pass smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="uUzsD/g3"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5ba4065fa07so6346e87.0
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 02:15:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790932528; cv=none;
        d=google.com; s=arc-20260327;
        b=L1BCZZoLsfvZObrXmfNr2DOuGEgtY1VAm1zsajw//dhdNx7eINhVQ4h875eAQ0UulA
         y95gHg3CY3OKIkyHLxlvEtJFjntNVn45lTOmsglvjuxLCXP0MiEbrngRDDkjoXBC57uR
         NX7uwszGv/xY0/Ci5gVJfTNHCjmYDuq100ROE5/7gp7BKWmQaeWBNBTEHQerK2jcy+jz
         u1rtOyFMOGtUPMpk3ceLikyEUoDAiq/Fw8W4Jde4GXqhGrkf1SqlYXV95pRZBaWVXubF
         LfxyBCp1gWH+JQxI+EylZccCvDWuqov9TBn6/FT8zWwjmV/798ViDF+yn65apBFIf/0o
         dDWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=hWB1QcQGFZjdtaZ+WkrO/eQNuOSYDk3BPt9FwXfnsYM=;
        fh=whU4UxTyt4Zfaun0kbGSjGKFCtoZinuq3vzRCuKxIso=;
        b=KgMTVaZgVGwV2Es9SamY8L9QFuiBDg95gYv0VnEhrMkkWLDqTjVP3LATNRWpPhWy4z
         wH8mfssJDxup5rEZ4u+FjoFwRXQz4ZA0tPdrG15rwlMh2M1AGPiiusjz3TnbJZg/SHJM
         9rvrKN4b5w7+AcmVHgQk5h2Ktl76ezzxqquBO8ksNtUsc0104xzdRvfgOx3xLj1PCGpN
         DF/ssuo2WecxhkuCZyjO9suksYwd9M79zYjkdcwDycVXsunYIqHTrHRey/gc3uup7Tyu
         ACQemzxokJEf33I03bQsvJB81sS5nB91njCtVzcIWlaD7OpfVTQD+VrYEOoOAN8b7lUe
         i/vg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790932528; x=1791537328; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hWB1QcQGFZjdtaZ+WkrO/eQNuOSYDk3BPt9FwXfnsYM=;
        b=uUzsD/g3ZCSfjiq2wwk+OeHdkmNqrj2XGfzBopsyQtL/HuhTlxgdg1vl4ZpxJP3V7k
         NvRarQrw9c38y28HeOViljKliPt2YMaNcCzFkq1MV4g6z5fvpMnAg7H+Cz9pNluRtKuH
         3bvVFPiyfTJKbbGP10Yn7Cx1VaXJN0cXH6abldTN5ex7w1NbqgJ6ka4gobKRkS7Brrhk
         xkr9W3zRdhrjt9MqEihHv3YqkSctCU2KGSlrJZKuwZk12vj7WZjRWUqk9Q85y/520Gp7
         3EV7G9Trm8zgSNUePo5QeURb9LoMuKtsRtEf8lMiMeFLoGzcCq//QDQAKENeKqpLs5+E
         uqPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790932528; x=1791537328;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hWB1QcQGFZjdtaZ+WkrO/eQNuOSYDk3BPt9FwXfnsYM=;
        b=yIUJZr8dR8fb/EIYEQhDpbL6nDfI6oMdCDcV0C/FtxXRWE7YZPCGDfVfiR58KbnwBv
         aytQaQ+gAhgNLl7vbuOUFK8hMAjr66G/SdPe86b1DzX9/GiCVIKrEAL2lMoOyw4GhQ7I
         Y7/zFKP6uZS/KZtlwWpUkmiPLb0Gzxk5KhJ97x8Ayrm1Gr+P6cLfrniNFPzvi2C3kZOo
         K6BkQ9Pk5PEeNNArpbRxWY1pCJwPccjRlKAvtJjk2sHWUwtXvpeGOWMFmfGUXdKghSO/
         jAWZCWE6sZIxi2lTMcQvmDy3shK4dW0t88uW/zHDjMvaCDrb1Pli9dQeFw5C27W6tAIN
         FE7g==
X-Forwarded-Encrypted: i=1; AKwUvBy9o+y++Vc7RfyLh5hoJWNsOhNQK5w42WQOayP4wT/Yac18TIFgr3JOjaJGol6hO1D6C80sbANCvTIdhSo=@vger.kernel.org
X-Gm-Message-State: AFq9FYKVv1iT+vmoLZ7iTFiz3QdpSTiv5bRqCnI+q/a5ro9Ov9Jt2cHc
	bs6WbaVGCMnZSk0uToCAVrpea9/d4oWg1vpOyuLDlwagpbv1uHEjX+021JOm3QXaqlDp/U64pMN
	Kmi+7vtDFwbZLxDHMvh2Tn761VcJa5TxrPZa1/YL5
X-Gm-Gg: AYBFou20B0qu9hgi0updnSku8hv2LELo3PcGSU8sRC+hH6BgacBGpQQtlczn7RUEYmE
	Vin1BNra+xHFc8sGyZwtAHv2ftbi5KhO5bd1FCFFg1hlwqWmp+m/nb5bOOPSKpUfZOEQFgY6Cxk
	JTZCh9qSKGWxSSl5E3wxAG7iUATiYbrvhYU9ftlBs++E1x9wm7I5FeH8k+yxh6ArEBhGfdQh/xV
	fd6Phee0lHYdo1DjrpZt3kZb6+urYvXBCPe0ZgNa5eYexl9VFgkBiXy7sGBf7B2jnGxsDzVclDN
	rGzsKJPxgD6GIKTAp1ewARJ4ukeTY0E/gh/6zv3Sz9N95fI2IO1B6rLGs7APPG3EYhGI3lqck5S
	bm4qtqmKuprKdCQ==
X-Received: by 2002:a05:6512:1153:b0:5ba:3797:2359 with SMTP id
 2adb3069b0e04-5bb7c8d2f8cmr108813e87.2.1790932527310; Fri, 02 Oct 2026
 02:15:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261001210703.1597150-1-suzuki.poulose@arm.com> <20261001210703.1597150-12-suzuki.poulose@arm.com>
In-Reply-To: <20261001210703.1597150-12-suzuki.poulose@arm.com>
From: Fuad Tabba <tabba@google.com>
Date: Fri, 2 Oct 2026 10:14:51 +0100
X-Gm-Features: AclHuK81_w9T9KTmUVQvA6ovuNEn5Udf2ErB6CaTomYP4-WPob3E-hZqL0sp0qw
Message-ID: <CA+EHjTwM=5PXPVByVV75AuNVw5TJRiUqu5TNOcFNPOBmTiL-eg@mail.gmail.com>
Subject: Re: [PATCH v21 11/23] KVM: arm64: Use a local kvm pointer in kvm_handle_guest_abort()
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, maz@kernel.org, 
	will@kernel.org, catalin.marinas@arm.com, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, steven.price@arm.com, 
	aneesh.kumar@kernel.org, oupton@kernel.org, gshan@redhat.com, 
	joey.gouly@arm.com, yuzenghui@huawei.com, linux-coco@lists.linux.dev, 
	gankulkarni@os.amperecomputing.com, sdonthineni@nvidia.com, 
	alpergun@google.com, fj0570is@fujitsu.com, WeiLin.Chang@arm.com, 
	lpieralisi@kernel.org, enju.kohei@fujitsu.com, sudeep.holla@arm.com, 
	jonathan.cameron@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"

On Thu, 1 Oct 2026 at 22:08, Suzuki K Poulose <suzuki.poulose@arm.com> wrote:
>
> kvm_handle_guest_abort() repeatedly obtains the VM from vcpu->kvm.
>
> Introduce a local kvm pointer and use it throughout the function. While
> touching the code, fix the missing whitespace in the
> kvm_is_nested_s2_mmu() call.
>
> Suggested-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>

Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>

Cheers,
/fuad
