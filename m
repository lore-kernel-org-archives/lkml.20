Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794210081;
	b=2Nj21Qq8+NKzJxx99/a64D/JgKKBAmHCJmHHFscRWXRTuRTm3uy3HA8ozTg96GjWQz/e
	 dReR3fjnGFmqrbNM2QWIjRpOxXiZgEF9Cg8ijdetzCFUkis1uGCJDOkk64zekCxEcH4OE
	 ld8KzAeTOFmWXqmh/bESVqiv/yioolzDjVt5nSRcI40TrKMrNQsYl111p1zGPpy8BXUwT
	 nUuqrRVCkpVjkHj/8AuvXIRK8r/VLvJ7r6Uq0Pt/eQZwP368jt//vIA3V2AyRT23QzcBD
	 AGWkSNDVXQP8iJs247IsNlzTYrnSPnBQmz0S5f/Znl6vU/FdQg16amDlZVOVQHjYZlQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794210081;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=3/KauWaXYG3OmrhCNO3AADgebVTxE9yJqLBY2sG9Sb0=;
	b=JOyYLYyS/1LLji/nCRnuKsNi5druoHbHiIlVrdPlbE8F1l8QXemfpavUO8Ep4ERNJVdL
	 4AKf/zSazIs/NOubjUoeKTWctva6y8Lom2/QuhaXJPHTlOZ6YvqYdjwv2sGS0YEX6lDsO
	 ykr+5NVLO9aCq4Urb/xloSJk4T0MdTQR1ac49UbQgL13jATr9dP+EFBNWbpdCW8L/CyI4
	 gDbhvOoM8cdukccc+ouXplK8B5TvFJmZYvaq7jfyTlgt4Km190DcfHfOzxTFVgVj0V+YQ
	 ZI36QQFuJ6zjHlArnQ2fXy8w9Q4Pl7PaQqgUXlxSwF5U5Omuk8e1LJNelPYsuFqXjbQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=m4cYYQcL;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.41
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 148DA606A323
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 07:41:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 148DA606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=m4cYYQcL
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5c14bc5a743so2888e87.0
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 23:41:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794210078; cv=none;
        d=google.com; s=arc-20260327;
        b=KfyGhecrsct8DhoWFsTmjc319pMyNe1PqmS+NoFNuLLRKnqiDvY1Fy9KmIzEdPQXOV
         J4wvl7HcbkbGtf/I+WSpCjfOWW7g19N3N7HffMS75MchqWfYiQXaORpDaq/kP6ufnwvy
         7+HtElOLIH+ZNzzGI//uALKT5TTXPrfgQb+PXjm0S4r8daNat9kWjRxsN8VAX5qDXn9J
         HNfMpu7icNplM+URht8gvlYnQlW8fdF/YHhYa+LcW+wNdw0eVIwWNA8Ljm/367CTXFNV
         IOCEDq0DVaVd0rkblEVB/7AQqpuBuWlyfHnd7U3AlhGWvX2nofjA1d1gamxVfVScInzP
         J+yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=3/KauWaXYG3OmrhCNO3AADgebVTxE9yJqLBY2sG9Sb0=;
        fh=/hKOzmKJ6Jk9Ey3CMQoPbVhyvj0LAop2FGjVBNU7Rmc=;
        b=cw4uSwtILnu+UybZXUiyqavleRKHRIi/+Nb6jlhjY7tWM9JKcza7/rKhyr0POXBJzW
         WHKx52FaRPEN5L70GtmQ8kCoJEI4UdUp/DqaUUMyyi+85gXgu/W72F3Asq64RE66Uc/9
         vj0tQupFN45QOIWRrSIx3VPq41hoOcDvOaKKNcuq+ICxI+L8JDT0s5XKH+OcD6A2bnTA
         0p9Oj6FexsTQvjLgDpT/GiqLp4sBRS+Kb2JBI0kvNW339oRjaRv6qZWpFU26TSDz2OA6
         g1S+13apr3lKeiz6xcwhYCe0dqDxTXj3f1JB2qVmcePhRHnqqttB8I9Wy4E/LrfhniU5
         7eYw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794210078; x=1794814878; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3/KauWaXYG3OmrhCNO3AADgebVTxE9yJqLBY2sG9Sb0=;
        b=m4cYYQcLOjDJNyLJBbj2eiWNCZgHWEYIjNWb5gxgks/V7UnS0mFtgDe+y8VrBj6HHj
         O+wdwjFOPj8yVBMIKhWFUPWAj7f0zaVxCl522Ku0Xo6BXm4mLVZLzwKfzoALGzis5Hea
         E01GsqmmaiAIffPd9GvMnzslyzkSTuUQb0fySKAjPwrHP1QXC8A4DyQ4nk9/2Si32oUd
         6NM92zzswF4yN9nmShRGmKNU1MVeUtumJsAf5ZnU8vYEhHdh+OIC8byiAcU7f2e/T+SH
         7x+u7qq6p5RH7JKpPnhfa0Y8tOFeUhscGnk7dDZI4l0ZveS8tYFBn3ffvs3MoSb6rI2k
         XRvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794210078; x=1794814878;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3/KauWaXYG3OmrhCNO3AADgebVTxE9yJqLBY2sG9Sb0=;
        b=vqFWmnDAj1n3T/hzW9DtEsWoLdacIeVNA524GoJoiSrmgPhPXxpzhMmZJGW4XR3Q88
         pJIbkYR5/385Fn9e78uEhpI6AmfyPuLa3UcdCrzH949i153evh3AUiGzk4SSU31DDiC4
         PLLQ6V1Xe9xEfkSOiq6AXtesE2B7cypRVxDURXqNREb7uZvAdZi87CYUZ6ceRG17ZOqX
         +jnglaWurYn5JHj1HjqFIEEyUPBtVYae9aG8P3WZ22BK5yK7vknVZLilWbEHosb5EdEt
         DlOdCRoyLwAfUP2JxC8C4ncIdmjTXPpik+VmTdmP8NHeGWIYRpzpKw7VbTHT4P/Lo5zE
         q31Q==
X-Forwarded-Encrypted: i=1; AL+hErGFV14m1kqJlxRlWD2y6pqS/RUZQblOfW/WBOf9Jwizz3Fc+uxULGHKA2bTJopAA2m+r0IxNa9iNdxaPoc=@vger.kernel.org
X-Gm-Message-State: APuU4Z87EK0RYSsft7reLI37z5ix92SeBk62S2Dc8yuVaQmouSTSI4CS
	hdohANkeblGx1cNfpUqyEsVFgeXNdsg/vtq9S8dw9Ph4zO8vzNH5++51Nr0OoaPRhVWnjvZ9iii
	VOLooBih+mYaf3CEq1NaiUX+AYpMEL+BUGOaQa0Uo
X-Gm-Gg: AYBFou03DdpbsiOiKDhxvjXuKSRVFw+P+UNTMHOCA5vu+D475WthbO0j6FwQ0hmytHH
	sxDQPNqZmfX3IT+rWkkPFv4wS/ulsr69hBWra7brZfS+5MUpqe+ht2YHdJvIEgWYkwFMtav6ePl
	T/YO4iONE4NymWcGc712/G7rIgBFzOkaq5zTHyP+ujRZJz2ZgNG1pMnZxUdq7W4FIbzyLSGivUk
	W4nD8kTaqu/gl+9CHzHbm1ymG8OwJVSRc+u/SD9ebuAzkTppUMBflyhlOBE7P/vEHXiFoF/3/Sc
	hnQfjwv8K9YkL9r4fh/tF36scjWJzvI6A/81qKkIwcxXJ78I1EEqRqJwgsPpTtUWNjsgg9hxZ9b
	YDmVkDIUpxyRJxkZf1PsC1sxitvursfyVPd4VMa6vYGK/agPmGEZ9OXCWDhIrEHWXX90ILxG//4
	b/6WoHTW5uZquPiqXqvoEK+o6+sg==
X-Received: by 2002:ac2:4bcb:0:b0:5c1:53b5:2029 with SMTP id
 2adb3069b0e04-5c153b5217fmr3411e87.15.1794210077813; Sun, 08 Nov 2026
 23:41:17 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261102141304.126883-1-steven.price@arm.com> <20261102141304.126883-11-steven.price@arm.com>
 <fa0ee5a1-4c49-4c1f-bfbb-c270dc4b6301@arm.com>
In-Reply-To: <fa0ee5a1-4c49-4c1f-bfbb-c270dc4b6301@arm.com>
From: Fuad Tabba <tabba@google.com>
Date: Mon, 9 Nov 2026 07:40:41 +0000
X-Gm-Features: AclHuK87iuKTvXEWJaczVerdWgxPEZxpPBN7O-wc8AIa5Wl9vz0b6-1H_UF4Qbg
Message-ID: <CA+EHjTy970AWnhYoZ5OqxQ8ojCAELeejw60y2NmpDsM_ZMdu4Q@mail.gmail.com>
Subject: Re: [PATCH 10/11] KVM: arm64: CCA: Support runtime faulting of memory
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Steven Price <steven.price@arm.com>, kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	Catalin Marinas <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>, Will Deacon <will@kernel.org>, 
	James Morse <james.morse@arm.com>, Oliver Upton <oliver.upton@linux.dev>, 
	Zenghui Yu <yuzenghui@huawei.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>, 
	Alexandru Elisei <alexandru.elisei@arm.com>, Christoffer Dall <christoffer.dall@arm.com>, 
	linux-coco@lists.linux.dev, 
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>, Gavin Shan <gshan@redhat.com>, 
	Shanker Donthineni <sdonthineni@nvidia.com>, Alper Gun <alpergun@google.com>, 
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, Emi Kisanuki <fj0570is@fujitsu.com>, 
	Vishal Annapurve <vannapurve@google.com>, WeiLin.Chang@arm.com, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Suzuki, Steve,

On Thu, 05 Nov 2026 17:30:16 +0000, Suzuki K Poulose
<suzuki.poulose@arm.com> wrote:
[...]
> > diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
[...]
> > @@ -1816,13 +1828,28 @@ static int gmem_abort(const struct kvm_s2_fault_desc *s2fd,
> >         /* Pairs with the smp_wmb() in kvm_mmu_invalidate_end(). */
> >         smp_rmb();
> >
> > +        if (kvm_vm_is_realm(kvm)) {
> > +                is_realm_private = kvm_realm_is_private_address(&kvm->arch.realm,
> > +                                                                s2fd->fault_ipa);
> > +
> > +                if (is_realm_private != kvm_gmem_is_private_gfn(kvm, canonical_gfn)) {
[...]
> I am wondering there is a way to make it a bit more generic. The issue
> is, only Realm has private memory with guest_memfd for now. Don't know
> the pKVM plans for it.

The plan is for protected pKVM VMs to be backed by guest_memfd too,
which would also hold each page's private/shared state [1]. So
kvm_arch_has_private_mem() will be true for them, and this comparison
applies as is. Only how the expected state is computed differs: for a
pVM it comes from the per-page share state rather than an IPA bit.

Steve, could you gate the guest_memfd checks on
kvm_arch_has_private_mem(kvm) rather than kvm_vm_is_realm(), this one
and the memslot check you proposed for 02/11? Only the
kvm_realm_is_private_address() and realm_map_ipa() calls are
realm-specific, and they could be VM_REALM cases of a switch on
vm_flavor, as Marc asked for on the v21 memslot check [2]. The macro
would then only widen to protected VMs when pKVM's guest_memfd support
lands.

Cheers,
/fuad

[1] https://lore.kernel.org/all/CA+EHjTz+WgXEW5RTxXf4oGeEb1Tsm5Ha4nOc4S1jBcp7jxP4+A@mail.gmail.com/
[2] https://lore.kernel.org/all/86mrsw2jrn.wl-maz@kernel.org/
