Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE0384FC8E8
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 14:04:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789567492; cv=none; b=KgRWMWB2YhKtC60M/baL3YpUwZnXjdOa70N6Q9PFcDtwhqMsu2qD4ebtxefoOm3FQgp985AM81+yLptu11IqeHQ7DzYKpyGCN8PpYV9OaLApYteXfOPU4FcJsyg2Kf7K59usEYKbtzhXqx/S5dlu6V9E49utNi3s+d2nroo9GrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789567492; c=relaxed/simple;
	bh=yCiYcTNBz8+BXwyIqCd92V0vfBE7FloiftRXuSUMbYs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=MPHtr9bARhu2nfw6K3OzHEp+KjCYE+xU+O0PV4/wdXUHLJfFJdtCo6u4HASawHQ8EfXXYL22ZB9aIeLI8UsQ3tdPzLywu2h4UkYsHGnDQreQ6Nzixq6jIZ9uNOarSCJUf8DQAdifVDDk8nZ1/EiHD+khBjprH23OSTAW0GqQbN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=TDSJGcjc; arc=none smtp.client-ip=209.85.214.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TDSJGcjc"
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2dd188e16a2so65935885ad.2
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 07:04:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789567490; x=1790172290; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bkD52sPu/bJAaJfk1wwgQ+AXBcPzHqCEyyKPMsu6QEE=;
        b=TDSJGcjc8GO9QRgyQhQByxRHWapk0Jw3yY5Pm3uCF4VHKDQvY4HfMD3YbTWqDNjEzP
         SPmVeraZG3woip56HBYLOPwR9CwgJTjVF58Tyg2BnEH1Pxqw0TMGduPsS7NXprv5psrA
         6tau8UrBPsH0n4pbdartzwMvm1p1m9KqlB/Rf2ep/JiPJlDBelsgtZ5YqS8VEvnsx8Sd
         3J/A5FdSa2wOv44pGlPyvOF4/XYbCtdS+g7WPMU830p/9sY5BAER8ICPDnHmEERFXVEz
         l9wr/On1OCOvsNrqpRgznjGX8G5g71mxEb3m60aVzK1KoXblU6dBQ0y0XtXqnm/TJMpc
         PY8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789567490; x=1790172290;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bkD52sPu/bJAaJfk1wwgQ+AXBcPzHqCEyyKPMsu6QEE=;
        b=w3nR6fJhYbePvKWwmpRX3QvfTIXpwGC/OyxQC2KlkcPd9qpR1AVfeXMDQpNpj7McKf
         gxyJ7Vd3YjSCVXlYIlzMOCbelPe6QyqMbcn+10EbzEtchKgWcerKcTtWmTJIty4uF+rw
         TywK+EQ3n6Ptj6erE0hnIZuCBrbQ2m7raeuVoS/gZDU6x8/ChHn/W79KT+TGcYUPqNLX
         rl1aRLwm+5UYRAU/2YqzmniTA0rsOJd2w1M3bjSewTrHzfSR0B6gcUdxe+V+xKcqTcDH
         SnaXLCCvg4aecg3OIc3dYacjinlKw5p/FvVSaQ4gGZHIntKPHb1cGcfXlxRSx+mWzd0G
         DU5g==
X-Forwarded-Encrypted: i=1; AKwUvBwq9pDRSRWTYTTazyN72H+RTfQgGr8bzrzS+RmbIKtbGywduIVF2wiesngqEtrKesIV3T+pTF+80NHaQGo=@vger.kernel.org
X-Gm-Message-State: AFuF++mG5dzP/GmbLHAy74pCWaZYveWhpNze/lF/0E4EWbe83xT+Zydr
	5DDfQn7dvk1++PyV5xt4iVU+/+wk2XNBPBQUCVZ88k/64mLAwYfoOYTVIQxM6/kcZ0Vk9hddVCG
	JXJFBiQ==
X-Received: from plgo11.prod.google.com ([2002:a17:902:d4cb:b0:2dd:48f8:1e12])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:1990:b0:2dd:3ddf:b876
 with SMTP id d9443c01a7336-2dd8cc8bc70mr56891885ad.0.1789567489818; Wed, 16
 Sep 2026 07:04:49 -0700 (PDT)
Date: Wed, 16 Sep 2026 07:04:49 -0700
In-Reply-To: <aqqap3DngKznNrSA@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <aqqap3DngKznNrSA@sirena.org.uk>
Message-ID: <aqqiAbgDmfQBLPTA@google.com>
Subject: Re: linux-next: build failure after merge of the kvm-x86 tree
From: Sean Christopherson <seanjc@google.com>
To: Mark Brown <broonie@kernel.org>
Cc: Fuad Tabba <fuad.tabba@linux.dev>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oupton@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"

On Wed, Sep 16, 2026, Mark Brown wrote:
> Hi all,
> 
> After merging the kvm-x86 tree, today's linux-next build
> (arm64 kselftest) failed like this:
> 
> arm64/vgic_its_save.c: In function 'alloc_64k':
> arm64/vgic_its_save.c:289:21: error: too many arguments to function
> 'vm_phy_pages_alloc'
>   289 |         gpa_t gpa = vm_phy_pages_alloc(vm, nr * pages_per_64k, gpa_base,
>       |                     ^~~~~~~~~~~~~~~~~~
> In file included from arm64/vgic_its_save.c:24:
> include/kvm_util.h:1062:21: note: declared here
>  1062 | static inline gpa_t vm_phy_pages_alloc(struct kvm_vm *vm, size_t nr_pages,
>       |                     ^~~~~~~~~~~~~~~~~~
> 
> Caused by commits
> 
>   36a062568ea80 (KVM: selftests: Take the memory region type, not memslot, in page allocators)
>   6c28a0d7cf125 (KVM: selftests: Automatically pick min_gpa for allocations based on region type)

In case anyone cares, I'm woefully behind on sending "thanks".  These came from
the prep series for enabling PPC selftests.

https://lore.kernel.org/all/20260826230511.972824-1-seanjc@google.com

> interacting with commit
> 
>   6f182db39fb00 (KVM: arm64: selftests: Add ITS table save tests)
> 
> from the kvm-arm tree.  I have applied the fixup below and can carry as
> needed:

Given that this is in "fixes", I assume the new test will land in 7.3?  If so,
this is mostly my problem to deal with when sending Paolo the selftests pull
(which, FWIW, I'm hoping to do this week so that it can be used as the base for
PPC selftests support). 

> diff --git a/tools/testing/selftests/kvm/arm64/vgic_its_save.c b/tools/testing/selftests/kvm/arm64/vgic_its_save.c
> index 864da01539f3f..9a8a65fd7196b 100644
> --- a/tools/testing/selftests/kvm/arm64/vgic_its_save.c
> +++ b/tools/testing/selftests/kvm/arm64/vgic_its_save.c
> @@ -286,8 +286,8 @@ static void setup_memslot(size_t sz)
>  static gpa_t alloc_64k(size_t nr)
>  {
>  	size_t pages_per_64k = vm_calc_num_guest_pages(vm->mode, SZ_64K);
> -	gpa_t gpa = vm_phy_pages_alloc(vm, nr * pages_per_64k, gpa_base,
> -				       TEST_MEMSLOT_INDEX);
> +	gpa_t gpa = vm_phy_pages_alloc(vm, nr * pages_per_64k,
> +				       MEM_REGION_TEST_EXTRA);

The test also needs to override/define the memory region.  Not fully tested, but
I think it's this:

diff --git a/tools/testing/selftests/kvm/arm64/vgic_its_save.c b/tools/testing/selftests/kvm/arm64/vgic_its_save.c
index 864da01539f3..fae8a6c45f88 100644
--- a/tools/testing/selftests/kvm/arm64/vgic_its_save.c
+++ b/tools/testing/selftests/kvm/arm64/vgic_its_save.c
@@ -279,15 +279,15 @@ static void setup_memslot(size_t sz)
 	size_t pages = sz / vm->page_size;
 
 	gpa_base = ((vm_compute_max_gfn(vm) + 1) * vm->page_size) - sz;
-	vm_userspace_mem_region_add(vm, VM_MEM_SRC_ANONYMOUS, gpa_base,
-				    TEST_MEMSLOT_INDEX, pages, 0);
+	vm_override_mem_region(vm, MEM_REGION_TEST_EXTRA, VM_MEM_SRC_ANONYMOUS,
+			       gpa_base, TEST_MEMSLOT_INDEX, pages);
 }
 
 static gpa_t alloc_64k(size_t nr)
 {
 	size_t pages_per_64k = vm_calc_num_guest_pages(vm->mode, SZ_64K);
-	gpa_t gpa = vm_phy_pages_alloc(vm, nr * pages_per_64k, gpa_base,
-				       TEST_MEMSLOT_INDEX);
+	gpa_t gpa = vm_phy_pages_alloc(vm, nr * pages_per_64k,
+				       MEM_REGION_TEST_EXTRA);
 
 	TEST_ASSERT(IS_ALIGNED(gpa, SZ_64K),
 		    "Allocation at 0x%lx is not 64K aligned, GITS_BASER cannot address it",
