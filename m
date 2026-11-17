Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794926581;
	b=NqGshj1XS3KpZ8Axw/8UulhG1L29iD8Cfy+E3puiJZgZ/GhOmBpHbD6lCwddmWDHa/an
	 C156W8KD/7amVILAM37T6WcVK4KUQmqsAPYq8X31JY8y7qhWiXh/j5dLT0GkAqusRwtvn
	 4FD5X5+BocVCJQGMoF+hs1So58SQV181WUMj8UJrUWii6JHj8h+KFacwI/5zPGwTN/yme
	 +pLrrjcrFpyXn32gI2FEVDUJVdjCZDcwnSFVE0T2fP8AXfVJBs5EBvSj8Zpl68S1aKnT7
	 Q8vp2PriDL1A42+CDc77+6okwstH+EPYGF8fcVOrgZwLZNlNEHJX94zKgHb4rFbxmqw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794926581;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=yDy1XcgDWZwINenyHLTABAspaDvRGL9tl++CNqH98OQ=;
	b=4GbacdHECaQab1HNnP6Iux+fzDvKyCfHj/eUwUvrLd88SNNHC7BrdCnhDQf4HuXeS7ii
	 xuooNKZ1mf8kFMlDzJY1yB+ymu8JV+NqIvzKd8G0Bi03poCnw8WNxDABOaDmiOqST662V
	 7cI7RKV8M6o2gWlRH4OhzgRFNX4Sggq0NwbKYXWTVPJiF3/5pp5c8vmkNqadMVFU4D3yf
	 nP1gfOLRbcqPmyQJVEJoAc+CSrfh81FTV8aXhQ2/bzB4YVa+eI+ro8h/3E0x2hxRVLiRX
	 zK//b1N//HtASnInx78Nsy7qmeFsHVKQV1R+eePModnUltAhe1OdvR3iumOlGa3XDtQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=beGG448l;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.45
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF3EC606A323
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 14:43:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AF3EC606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=beGG448l
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5c14bc5a743so9852e87.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 06:43:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794926579; cv=none;
        d=google.com; s=arc-20260327;
        b=kednGG8LxaE6hgj6LJ5+7C2wv6gTwyuB7nGgGL3ce6CoUCSbJIOZ1PYvCyDD06MrOE
         SxKk4gRM92cC3NDSmikYiUDv7T7Qc9hc4029TEFgMFRDw97CfdiEhUF5J6mFTLe6WSw8
         U+1y8lDb7PXcKRJZHYETcX/fz2U7r52TT682wb/qtB/KSudV58zmrOGASjchvyiaSCt8
         x3uuxgdBg+uqAfo7T+3njE/p+pi47o3qAj3b4pwA9FLiiSU7pgx/xMZLYK3CNKNGpoPV
         vdnjwllv0V87Yn+5gKcLNWpzKVrs4ppj9P0JOZgEIrF6L7MyeVFVG7K6k/N8/4MPkUBu
         gqIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=yDy1XcgDWZwINenyHLTABAspaDvRGL9tl++CNqH98OQ=;
        fh=50Zt0lWEBuASP6J1/fARq1qjOgbYuowX/S66FBEIAGE=;
        b=X4YNG0Lu64aQiF6Jyqau7cEjGsYzoJmgKLzIcFYYv6HjrDwiTPHVtLuNKrxWSLgadG
         itbaG4JyXvLVAi6VIZr8fuBwUVQTa3qAz3mHJgXfYanR8qx5REOkdxAclNA2HQ09Tjev
         +yG++GggAN7j0VJhmgxWlRvKf7IKNLmWtk8QVbes0Vx2j8PZ3CtyfB1XbqOHIJppk9BU
         yfFlI3yzTK5BgoFtZbvidUoYHokERqpsCvo/cN2xATIqXkerpqNRvPdUEKLCF+7YrZYx
         mFXQpvww/6oONoMQyuP39R0cIgZd8qmJqh1L2HIKHKYwS5f0+nwwj/umVz2uc9cENQtc
         cq8g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794926579; x=1795531379; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yDy1XcgDWZwINenyHLTABAspaDvRGL9tl++CNqH98OQ=;
        b=beGG448lWY+cCFhwDLViggnuSIAnECspaC/19W/CcA+kp/RDHj8CVHZPNOJXzdPNBy
         xNbS1BVNqeOCH6NHPcTuij1m6boVLv7Kp9nMmUiKBwmJrLGwJaPhYHlo1udSVZMv4l3l
         Dp1+o/6488K6P7DXJId6+UZsQzhFV7baivBlC42qPBJyayMCJxxYRkn3fgpxH5ongY/u
         PBW7ApegBFS1de77Vsw9jKyfh6Syy4tHkh6gFUOKf0C6Y8a1Wv48YRtCTMd/zCfmvlDC
         ahqLCKnNqJqAeTfUAYtkHHijaUOlKhR04crwSAUuFeBZulo5g4Hakr8qGq5vHEUdXsyY
         rFRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794926579; x=1795531379;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=yDy1XcgDWZwINenyHLTABAspaDvRGL9tl++CNqH98OQ=;
        b=ihR07hO6bBkqBRqtP7HZAj7xWfWq3fdaspFPiakjv/dbjkGSOr497wOTLjw7Teg+Gs
         fVhbyOWdGhNUNtb8oT1UraSCs+o2A3GYOmE5QTm+ThBCkwoQ/m5pC6/QZxXnR1KDoAWs
         hx8KrYgLqebpybtnbwtazrZfe49Kys+8pmuHmEzwVTwM+9UnQOO1ZsSFqt2dkQwuz0IW
         rFmhitUiRjnSwEcqxIC5hc3UXpRULPFyk20tAUxVQoPzQu9kgL0Dc6NyWCHSTyrtOYFc
         r6UL7Ztd2I6zbvguaTw3AWOfdGbdwPrH26zZrYrqEgsgAQ542WB1XHZdbmWNBLvXWNqp
         qhNA==
X-Forwarded-Encrypted: i=1; AL+hErHLP0YteiTKtMPZFTsnm2Q9yXErcMFGYBNNJUmnvRgqex6sMKnYr/cWEbEySnJls32yTf/GzHzAlWpTLn0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8dwp4rKpZXMkskQcNB6kzI3ubdteEDePquyWpetCWPMP4H196P
	zQzVuibsgSctZJfqUqNRxbhYyeBR+suXXA9t1DjQXbUf2Qz45rntC5WXQJg7V5PPf9Zn2DBzN6x
	NdtetRxTW+HpW9iOvN+QlBEsZFySBwrsSZOx1W/x+
X-Gm-Gg: AYBFou2ln8UZyBDmBsW3g1jV4c28+kAqLCny2IY2/hr4C21ZG2P6djbaOEvgA3M0nQ/
	aQo/dA8zYm8lNdqRnXQILNwqEx3bJPqp+AbmenRRtVPkaXsoa6D5dW5qvEGVLaIKVbvVrG5ZTOJ
	9DXvbNTLNDFrA7V1+5xe3L05nV4t5E08FXtHPeWkvdyTSh1ZRVmmLDmKz58HhMotKkQXaskydlk
	6RfyBIinHeDPNK6P0kItoIFbMbLfzh/Hb5BLvBKCTueKoqXUOLgjMsfyrtcuNTllbEA+jYGb3ET
	o2tzh4ZrnH2XZOM0S0YJTcX5UlJy4/g2TJchLB3Sb1qbfUsgXM6LTXLV2MP6GaNX1WEbisEamoL
	boCLO/buFEQz591C5BnLsGLxMXpPy7tCJvYJ8+9a4Y+BhNRLKXHLm2duvWV0ZO2YbX4FsqSK2BZ
	vFfq9/jO5vmRK8RzPryawy/h42
X-Received: by 2002:ac2:4e07:0:b0:5bf:f84f:1d74 with SMTP id
 2adb3069b0e04-5c1a2185fadmr144874e87.13.1794926578238; Tue, 17 Nov 2026
 06:42:58 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116164358.142785-1-steven.price@arm.com> <20261116164358.142785-9-steven.price@arm.com>
In-Reply-To: <20261116164358.142785-9-steven.price@arm.com>
From: Fuad Tabba <tabba@google.com>
Date: Tue, 17 Nov 2026 14:42:22 +0000
X-Gm-Features: AclHuK_cj3TGdQobS2sWbu8813m5UwP4GVfoFkRYcpiUN0Z7bFACWbcVhIVAqkY
Message-ID: <CA+EHjTzAo+5FhtxfX8mQ4t3k5BhatR15UKNSAQw+CRbxJ=wz7A@mail.gmail.com>
Subject: Re: [PATCH v3 08/11] KVM: arm64: CCA: Prevent memslot modifications
 after Realm creation
To: Steven Price <steven.price@arm.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Marc Zyngier <maz@kernel.org>, Will Deacon <will@kernel.org>, James Morse <james.morse@arm.com>, 
	Oliver Upton <oliver.upton@linux.dev>, Zenghui Yu <yuzenghui@huawei.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Joey Gouly <joey.gouly@arm.com>, Alexandru Elisei <alexandru.elisei@arm.com>, 
	Christoffer Dall <christoffer.dall@arm.com>, linux-coco@lists.linux.dev, 
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>, Gavin Shan <gshan@redhat.com>, 
	Shanker Donthineni <sdonthineni@nvidia.com>, Alper Gun <alpergun@google.com>, 
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, Emi Kisanuki <fj0570is@fujitsu.com>, 
	Vishal Annapurve <vannapurve@google.com>, WeiLin.Chang@arm.com, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Kohei Enju <enju.kohei@fujitsu.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 16 Nov 2026 16:43:54 +0000, Steven Price <steven.price@arm.com> wrote:
[...]
> Define kvm_arch_has_private_mem() so generic KVM recognizes Realm VMs
> as supporting private memory.
[...]
> diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
[...]
> @@ -1611,6 +1611,8 @@ struct kvm *kvm_arch_alloc_vm(void);
>
>  #define kvm_vm_hyp_is_distrusting(kvm)        ((kvm)->arch.vm_flavor >= __VM_DISTRUSTING_HYP)
>
> +#define kvm_arch_has_private_mem(kvm) kvm_vm_is_realm(kvm)

Could the message say that defining the macro makes
gmem_in_place_conversion true for every arm64 VM? One visible change
is that KVM_SET_MEMORY_ATTRIBUTES2 on a non-Realm VM's guest_memfd
returns -EINVAL instead of -ENOTTY.

[...]
> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
[...]
> @@ -2887,10 +2903,13 @@ int kvm_arch_prepare_memory_region(struct kvm *kvm,
>                  return 0;
>
>          /*
> -         * Prevent userspace from creating a memory region outside of the IPA
> -         * space addressable by the KVM guest IPA space.
> +         * Realm shared IPAs alias the corresponding private IPAs, so memslots
> +         * must reside entirely in the canonical lower half of the IPA space.
>           */
> -        if ((new->base_gfn + new->npages) > (kvm_phys_size(&kvm->arch.mmu) >> PAGE_SHIFT))
> +        ipa_limit = kvm_phys_size(&kvm->arch.mmu) >> PAGE_SHIFT;
> +        if (kvm_vm_is_realm(kvm))
> +                ipa_limit >>= 1;
> +        if (new->base_gfn + new->npages > ipa_limit)
>                  return -EFAULT;

This check still applies to every VM, so I'd keep the old comment and
add the Realm sentence to it.

Cheers,
/fuad
