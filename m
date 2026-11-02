Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793612590;
	b=RnpMEhAJ7hxoYMHEjIdf8QkgE8U59SkNZ10JFYzVNHZpQ0wPYGSkZWT5nRF7iTHHzLQb
	 EyWOtpL9Vk0/0yKZipwVytl4MK0y8qmIbTtCRJ+K4wnIMMOqJoq3Y5CT0wUkCdWTPYaer
	 1SrLjfE/DPSvN2k3KZl1Dm/7ayst+2Pgea6SOYUN+yYtg3trzSGPn8fojEkBpjnNx8e7d
	 wx6q90PQ163lfFAckNexRLwMbuYXJbwoPMSv4gGJWc/GL4SY0lg+iHoazTZzFEgsJtreg
	 pjN4A6CQ/KYmTDXy8XkB+kVfhw4ZJmtBPFIiBgygcY/0bRPqBgBuRChMc9bdv9BerdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793612590;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=7WhTA0Y8V6vZp2rorlhZwrgj9nL0x892/MR/HRLGhZE=;
	b=FIPGae+eJHZUBfNrV65GBVM5wS35jqamrXXzFpFNRkiEr3afj902rp9tcrvj+7ZqdTHY
	 aXj9X3Awk2MpswDBSk8CjuwRQTKRa1rdI4aZg37zkeRj5NQRHwoM+QRXFUyuH66axRG9m
	 aWrbOY1HSw3n4+Rz2clFzLzFU0tQwtxyjeAeYjnbgvjG3YWSGj15u+NF8CagOLR8YVaiT
	 Wyni0T4I1x1lpDmYAK/KuprXItkS1ZxtkS2doJ2lorcImj+grnKrHvwr7/vQny71KB9qb
	 wUfByPzPWOFGtFlW7zUfBaug6/HZGmBFPVvafRGm0f4XpcR7BK7OO/8OVu2w6wooz7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=fuW6aCje;
	arc=none smtp.remote-ip=91.218.175.19
Received: from mta0.migadu.com (out-19.mta0.migadu.com [91.218.175.19])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92DB3606A32D
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 09:43:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 92DB3606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=fuW6aCje
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=R0ifyYqy3IXOuNSpfX4Jz2GTYZxqEkqpRu+RTCJxyeU=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793612587; v=1; x=1794217387;
 b=fuW6aCje7A8bAWJ+vlCrtup/dDEDN+sWSZP40auZkJmHLcpv4Aek9dUqhBu4PFO97cVFiyu/
 I1UtbFg3UHs9lGHPsdO0e1+iI/ieiEwy90n39NCLRGxIdhmo3i4m5SepxgUEpG2QK0T1qZtq9QO
 93lNL146Yc+LOgecBQuw3ZJM=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 8ad982b8e88db3d6;
	Mon, 02 Nov 2026 09:43:06 +0000
X-Mizu-Trace-ID: 8ad982b8e88db3d6
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5be58ad9600so10157e87.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 01:43:01 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBx2Y2F0jSMnEAnPbPImvX8XtjQ0TFZi/eiEx21bxLAe41Pov4Bf4VL+pi8WK4PCo2kl3Bkrwhqbodack8I=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Gh/WGH5vLqwJzT/7yLbZbbo7UPwtTckgyCfceRb68JX1ZUaU7
	qXw9zl7LaC2fJguxhoALH47IAmYBnp9wY/mPpNgBQ31SK+0YhILO0WFVV7vINJuK7u73nthK32Z
	l/AR1vc38bo44wF0YB5lskSaGyAQyvD4dwmhFC1JY
X-Received: by 2002:a05:6512:3353:b0:5b4:74e2:4171 with SMTP id
 2adb3069b0e04-5bfd13fc8d8mr558803e87.4.1793612581038; Mon, 02 Nov 2026
 01:43:01 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261102075843.2556018-1-fuad.tabba@linux.dev>
 <20261102075843.2556018-2-fuad.tabba@linux.dev> <07d0afa8-1b9a-4991-a419-9840cf629d57@arm.com>
In-Reply-To: <07d0afa8-1b9a-4991-a419-9840cf629d57@arm.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Mon, 2 Nov 2026 09:42:24 +0000
X-Gmail-Original-Message-ID: <CA+EHjTwNSxBa8-_0Q6zmgqW0RGyVhpUU3xnFg3-sqqmsdL4s8A@mail.gmail.com>
X-Gm-Features: AclHuK8-iGCZpGhNLfgi22ISGBTFMIXgkMtlm2Ix60vIMu408Jz2-z6XjUn9gQI
Message-ID: <CA+EHjTwNSxBa8-_0Q6zmgqW0RGyVhpUU3xnFg3-sqqmsdL4s8A@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] KVM: arm64: Clear the VM's feature bitmap when
 kvm_setup_vcpu() fails
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Will Deacon <will@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, Jack Thomson <jackabt@amazon.com>, 
	Congkai Tan <congkai@amazon.com>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Suzuki,

On Mon, 02 Nov 2026 09:24:15 +0000, Suzuki K Poulose
<suzuki.poulose@arm.com> wrote:
[...]
> > diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
[...]
> > @@ -1856,8 +1856,13 @@ static int __kvm_vcpu_set_target(struct kvm_vcpu *vcpu,
> >          bitmap_copy(kvm->arch.vcpu_features, &features, KVM_VCPU_MAX_FEATURES);
> >
> >          ret = kvm_setup_vcpu(vcpu);
> > -        if (ret)
> > +        if (ret) {
> > +                /* Clear the bitmap if setup fails on the first vCPU to be initialized. */
> > +                if (!test_bit(KVM_ARCH_FLAG_VCPU_FEATURES_CONFIGURED, &kvm->arch.flags))
>
> Is this check necessary ? We go into kvm_setup_vcpu() only if the bit is
> cleared and we do this under the config_lock mutex. The flag is only set
> after we have finished the kvm_setup_vcpu() successfully, later down.

It is. An INIT on a second vCPU with the same features also calls
kvm_setup_vcpu(), with the flag already set, and
kvm_vcpu_init_nested() can return -ENOMEM there.

Thanks,
/fuad
