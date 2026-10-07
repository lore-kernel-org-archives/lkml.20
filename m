Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CA9248640D
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 14:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791382841; cv=pass; b=OOgo8Xrha+K7k6Nv0luLkZJvXa56xqNxoz+RIhjkgNDPkOZ9DKIqZS0P7Tk1EHxzFdulhhInFUySUqi2fLPevL1vb7+Xf5+IRrkc8Z6CW6wSaVfT8pKH/xWr/dQnjz+Ov1PwgUDon1xCt1wX2RXh21UnL38Zpk0JTKt+BAAiB8I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791382841; c=relaxed/simple;
	bh=o3uLcb/w+UjgedlrqzsxP4CDLrNZM+eCbg0hqnND8A8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rLcOhA5dMHmdCq3scQZXdlbKdZATFXhKVp5nZOFSA3/M1fNBRjjvilsSL2r7WAKAz+nVnsUuykN/XiUvuHk1fn6QdcGK8M+eVIGlomp/iJiSGmSXwmpq1VUekyZX3ZVvecFK+v/+5qhWGJFHHO9gAWMxFD7GPWSrtBPlAeGje0Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ZAmsLf3A; arc=pass smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ZAmsLf3A"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5bcc04c71f5so9219e87.0
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 07:20:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791382830; cv=none;
        d=google.com; s=arc-20260327;
        b=OaTRtqLhp7JPReIlLcvGxc7GZdBniPvqroOIzDFlKY5cglCVSvdupzD9Nfqk4q31yW
         VLroT+iOgnkXTGsmDtwKCUWwD01apQBL4WH8621X4MoEyjGDR02iSCBkK2xJ3gVlRoaZ
         4iGclscZ4mB3Lc08RNicxTRTZovOP0ByLENap4JVv03knf7CNz281bMDEz3SnwGDXss0
         3frz3xM+79POWeJyivfEUdaZZ0LtMr+0WZkXGs/RSRJ06CiONmC7qpv1qOOI4PZRZWDt
         xIKnLPrfk5rXqDx/1yal636+yF1ChmP/kmDcX3AwA4pnuyMXMB9Dk9qtcJjJb4KWiS/1
         nJ9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=4UyXA6Kbx2RrlHyZTfn8yf8h54TNQENLjWNQqtxe20s=;
        fh=Ynm4XaNgzTPhFiwZX3iUmAbGXzynMSypWrqxmRHhtaE=;
        b=Dv6WnxgIkEYaVUu5yRgfoy6+JSELmdgl9SjBxRS9LkLPXU9q/D2Cu3eqSthh/ifm2i
         kjuLfp9FyTRDp+M8xvKoNPxhb9Sw1EG7APmbyvMAEaauefcH+02+aenrur9ec6XWRWnc
         Y7Q/du+vYP9265uxJVOZkHh1K9K+VHEJBE/gbdEhp4mz/r1iEnNKj8nneMzdI1MSDg1m
         tVE8WNDe4LQr7okcBjgim6GHVnVhGmPRPjsAno/+bc74ZoC8zUQdDieYIlL6svO2nBRp
         J10Kty8MvPDmslLaYNpsCOphhuga6TeibAyJIQCkUw/f+Xnfl+gRrZ8Plr8sbcMKH0uI
         K1Gw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791382830; x=1791987630; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4UyXA6Kbx2RrlHyZTfn8yf8h54TNQENLjWNQqtxe20s=;
        b=ZAmsLf3AEfxRGGILcT6b4JTHQ2Gnl0qh5SnBSieL70Fa1t8pKG3XCbyYkIkRKdlHuH
         eQFVG8H0G2JTWOA3n49ILD0M7V1yB4NQuFZaRv1igPMVQd+7uYDPQ6QjRrCm+ynNqc8D
         xv/GoB0z0ttGP10454y8QaaAZaAl8MlVKV5T47vICAsrrzurucVKj5zAHzwQL37BhBAX
         058gNC8h6MnUBqyD9tIOxVpzVKSWBfXaj9cXUU6LrVPZPdo6hUKdiGIQdq3WQjWej5s4
         Vw3aIvEL56150HyyMEkclaIxynW7vcMZch8yUuNoHlNhZ5UbjaPNkvOFj5ADaki+NCQH
         hOng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791382830; x=1791987630;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=4UyXA6Kbx2RrlHyZTfn8yf8h54TNQENLjWNQqtxe20s=;
        b=cd9sc1v5pIF/4EqsSU7D49iOVr56jKjzpRJNXeOalgJu2RfZHnx1GSFEUkc3M0gGT7
         Io38bRtWabtSfmFpxgQ4rZFHqY1wctIPDuPz3egz6LYlnd3smQnhphIybu+9ognHODRI
         S2eZ2fsbZOK64YxZV923HLXa/eXThGjUAIzJLmvuY/LJgmNu0UHJaXxX+k2YmL64LvQo
         /f614ggXLvJhEKX2HVSFLjMS8Bx8/fkZ2XwU2XbWTFfy4W8HVJ/cybWM0O1HGexm6Z9Y
         z2aUoebzdbjeRR0UxvKF6154xyWTrmby5apuCbsEx2Z3fGf3MaVb8wYe50I8xUW4agfC
         j/lA==
X-Forwarded-Encrypted: i=1; AKwUvBzE/gZ5o6rv+5TMCT6hGl1FmbDXtvXdybzbWKOcBAqEsW5ztSiJLzi1pmtlHnR1DOmc9omQGglqLRae7Ao=@vger.kernel.org
X-Gm-Message-State: AFq9FYKF8taQm8fpYSfDBK5bncePwDF93tz6XeVDohfKhxBkezkU+LNU
	u0trmrWFLq2N3ViMqZeh+EgDLfUBR5z7SiCGnrBvFUWCVjNbwbmD+hwI9oB38RIeOuflFKr3iNo
	01FlgZoPX141DNFOmBVpQqu0S3G6AgQT9oFoiWvX5
X-Gm-Gg: AYBFou3a56PxFFqpD/LZJ4Ox5wHYbDyeij/wPAyC7cshkGwJKd5SJ6+f+bUhrX6Qc7e
	i6qhcZUGjqz2aKLleiIQxzr/xWpSl0Q4U7W2B+57/3lMx4g3HaixOTW0q9J5fA6Ty95iI4fVlIU
	bkuYtU2WVizbgqwE2FXpyWXSA+6A/VjW7/dN4vLrkcPOhavffTB/Nz6buk71N4CIR4tvQ7+MZnG
	oCIVMLerIifcSTaP5etGZSd3wuoi7jS/NRxV0BMhbnkkuFc591ssLdxDRi9QtL0ZJ+ufFsFtWgK
	sfqih6kbtDpqFLlfRTAOdKcgf1+UUVpZA0GhzK/fMwO6ux1J1T16bWEr
X-Received: by 2002:a05:6512:1555:b0:5b8:ebf3:3370 with SMTP id
 2adb3069b0e04-5bcca158f5emr347184e87.5.1791382829437; Wed, 07 Oct 2026
 07:20:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261007073537.2454351-1-suzuki.poulose@arm.com> <20261007073537.2454351-15-suzuki.poulose@arm.com>
In-Reply-To: <20261007073537.2454351-15-suzuki.poulose@arm.com>
From: Fuad Tabba <tabba@google.com>
Date: Wed, 7 Oct 2026 16:19:53 +0200
X-Gm-Features: AclHuK_RXJYhqf_nHqmpzWADAUDPbDkHCi_xcSBTNQ3epFkbXZUQQ8UXgywpORk
Message-ID: <CA+EHjTx-niYPnnRDvAAiY3MXLpSYau_PhiBTCiE9mOYUChASPQ@mail.gmail.com>
Subject: Re: [PATCH v23 14/14] KVM: arm64: Prevent unsupported vcpu features
 for VM types
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

Hi Suzuki,

On Wed, 07 Oct 2026 08:35:37 +0100, Suzuki K Poulose
<suzuki.poulose@arm.com> wrote:
[...]
> diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
> index 4d0e6bd2009ac..97089c81d6428 100644
> --- a/arch/arm64/include/asm/kvm_host.h
> +++ b/arch/arm64/include/asm/kvm_host.h
> @@ -42,6 +42,13 @@
>  #define KVM_VCPU_MAX_FEATURES 10
>  #define KVM_VCPU_VALID_FEATURES        (BIT(KVM_VCPU_MAX_FEATURES) - 1)
>
> +/* As dictated by kvm_pkvm_ext_allowed() */
> +#define KVM_PROTECTED_VCPU_VALID_FEATURES              \
> +       (BIT(KVM_ARM_VCPU_POWER_OFF)            |       \
> +        BIT(KVM_ARM_VCPU_PSCI_0_2)             |       \
> +        BIT(KVM_ARM_VCPU_PTRAUTH_ADDRESS)      |       \
> +        BIT(KVM_ARM_VCPU_PTRAUTH_GENERIC))

kvmarm/next already restricts protected VM features through
kvm_pkvm_vcpu_allowed_features(), shared with EL2 (0b7d843ef3bf).
Could you rebase on that and drop the protected half of this patch,
rather than add a second list?


Cheers,
/fuad
