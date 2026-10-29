Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793284081;
	b=aNtbo8rVM8Auef7CwRFUxU5La012Qs8/b4mfTZPM5wht4kAkxygAtlYFoLmOnjO4tJiQ
	 TmfaKEYgUtaJfJwfvVdYVrOqE6V8/zhYcw6Gxau7Kj8DFRnWGMNDch4uAq7zG0XLOFum5
	 d05QgDjH0eh74XCTvu+Y/n4UlBa1DULLGOsCkYJ6AWwZnCziNGarO1CUgI3cXM/QorqP4
	 zafOv/cAy9kBkj5cQmIzQ5I7WDOG9F4jhdfefxld1TK9A9Jg6g5i7/l8OiNuP0MCuL5YB
	 tJ3BgWTcbglYc0BwBJ1ZSNdaHeH/OJXTtVaF7UGn9UUxmum+K4UIKOXlj+TIks7m/qA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793284081;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=gO96Ic3QVCctvLn6OTuZFYeIzqeAoDK7wy79tyihoyk=;
	b=zp72KIpoEPQJYa03mjp4M/bRjcA7AIfYRwASMXAaixRxNshFNgnahjb4jfgshmS98iKM
	 g/XWR8/npwlCIEX2Y96GqooTQLPFlRVdk++GZXrdR/oudPLn/zqSRJG4Ootp5pRnfoJlU
	 gKJNnwuXgiS5GAb3JGMYiZwWzxi2rnynYsJxrkh2B7r8HFmknRNacdMqdSzsyA176zIf0
	 GIqGP8Tw9HJ4sG8Y/qS1qyeffPLWhVA9/EiYKxZaEzwh5xT7gIpfrNP+twwQnRBy+4xcx
	 r/r6jpB6ja+pH730ImHh5B2LbKtYsiQuXeiUEH0iqbaiUMLSCyB/8ig7jYvZsbA7dug==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=j1TTQur8;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.46
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB9EC606A32C
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 14:28:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB9EC606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=j1TTQur8
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6b1f31c63ebso1323412a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 07:28:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793284079; cv=none;
        d=google.com; s=arc-20260327;
        b=GqY4IYdgmlbOZhAmTK6n2MmWgZ/LnXmmAVllEff7zktQz7kyeWSG55r/CjoFAUpJt+
         VA5RkD2mV2onYet5WIr3t0/ymPKDcbnriCL59ifSJyjREXb7boIj6Ul1NyPxoWwWQ0BK
         aJ/k3I/+maV6UcKL7Am/E4XSrSQI/ITGgPlObSfmSSZW0gG+74ammpc/b17lbjNyTu5O
         FSyjnFiYi5B16/oj/CmMHT2ilh5+fR/MVz3O+nrXv5cEZ9rulJK5L0x61zfWsrA+gJuP
         KErBENywgpisilLmu9+joDW4MjrMjKrqVGUJJDdELhd8pifI3rUgwQkJjrnUkb5L3tc6
         jANA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=gO96Ic3QVCctvLn6OTuZFYeIzqeAoDK7wy79tyihoyk=;
        fh=W79Qs3xNJgWpi6VOoz5eJJON1n+G3uNjRSb19SiEhgw=;
        b=bkdIA3Kd1PetVZN/fNSKKDsVJS0nhPGcqg1hFmmi1ThyaJXI6WA3DaPICHF+MGHmL0
         HcWJEezaFsrjL9YMkIsTlAkXg7g4qW8KxTAdPnQYN20JukzRAlGs9jKbvs3YLFxetOrd
         f/FBRuLuCNVTwss1vwuhd7tOdIlVZOOS/XsQLjmTyVT06oqu3ctoSn7ctnTSS8yic/z5
         iOs5dJwzMCDwXB0tbBSW3FE05aHBoRriaZNGl2GFkrEtknutZI2+bmgtn0/Ew4pBB4P2
         4NtDurpecr6mSmQrPaEozqT3A2zCMUHZiOeiO14oEobnxDyflGLNyP7y2ldOPYdU/13p
         zSWg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793284079; x=1793888879; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gO96Ic3QVCctvLn6OTuZFYeIzqeAoDK7wy79tyihoyk=;
        b=j1TTQur8+34cz+xCnLSGj1Q8IezmFsnFL6FNF89kgyeY+SVBe6V5tIbkVoAguCY6d5
         pR6EWRwR98xgOpoLbY0MtYGVivdVn2Dd8BTxAOfY6lwP2ygaejDtVOC6DJyiU0eOvsnL
         7g0i/K+0cdfEhDdEfhjCohSpXG8cUWc8Tl+JQy5a1dhLx+XJFhnEH5y/gfULH5FwgXTV
         b7T06jcHrkPSo2I0Jy3DUGTSRMwcV21XKoW74ckTitbK+NAO/6P5Rtk0pt2zhsTUuy4q
         9ZBT/vYqixv/fCsMfGn4uE7Wz/E9N6oEHXMSAwAJCUVjfiNqjmMAKMffL9GiaH/zlma0
         ieSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793284079; x=1793888879;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=gO96Ic3QVCctvLn6OTuZFYeIzqeAoDK7wy79tyihoyk=;
        b=yVcRrsbZAWTcE4+S5MppUAOEAlTi2zL/vwfZ03UEoEXS2YolfL7JdfJW+OT1FZz0RN
         yAiHBKjQrrZwtjg9H7/dmIuSZj5YK9CLmUn0yPmNukpv7+97o3Oy7NMPcqaiZQJ/6amH
         go/unM2VPX4xrswgt+bRMeSO+7X7W54ZUISrcHz3ZKBGQBpCc/5L/MWbq0V//gf5Lq2k
         XoQEtlCEm1ZSjsfzScnzHXGwvcXEgpYTH9ewbPFw1nYGLLIRSw7JrTaypqt5YFLy1Jrh
         veXs2tz3Mn/QZe+10jhasuzCMgjsAuK3shQs2Etn74RTa759T6WUv8vvcn0QTWotiPRp
         /whQ==
X-Forwarded-Encrypted: i=1; AKwUvBxH4dM1Ris1HC5/rr837hDF9h6fqQihCu0YPTTP+quoTBqwFzRTfe7VJwnh8tvCZDMBZQXq1GBnQSwqluc=@vger.kernel.org
X-Gm-Message-State: AFq9FYKM+lPWL3V85QulhvDWWmD+w958+2fDRr7JmfTg5lcTglMh+Tg1
	UxuO1oUGekiu800ORIe6MPrCzWz5ztdCSuZJPMmKLh4VsEDb79cQ0ATRdX5Izps5cLb0WEeZx8I
	XV9eEaFWn2X/dPMnSZVHlpDoQcGafx/s=
X-Gm-Gg: AYBFou0ONLWrVY0xwQkgQNWXyH5FfVkwO8t8ytzvtfB6xzKRcNd5RWppbkt9UISXECY
	RaaZRXHWn1CFpT/EMJ2ojLipbCGHNqaoEVtlJ6ocW6wNyxeFLjfHQErkQ6hqC4qCpIkkfixHz5w
	1IRmNRYxEr3kk0jSST+bFWMuqeEXbPPbsiE+/RCSN4RaaocfMaleauXvRAPrOuSYbjZ/QuoiwgI
	lrExTGUHiclEA5zIieqMqGQyM2fBln07KH4btD9Vm7EzzdBlKrg+CLgl0xL4G04NLyIdkCj+wAD
	CEZGPnb0+55EiPT0a2Za2PD9SQPtUXHcW1l/HmwNRDcWHrwG7PwLiZ7O2iUgAtxSgPtdda7G95W
	0li+dXaYXPz5FSbeaPkGSnpLp9A6aKnUFEl/iUXZsl6/dIvrGobtYRwi48GnKiex7uPX1vA==
X-Received: by 2002:a05:6402:4508:b0:6b1:bb19:de98 with SMTP id
 4fb4d7f45d1cf-6b4b0b09dcemr2163933a12.1.1793284076799; Thu, 29 Oct 2026
 07:27:56 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261022-gmem-alternative-providers-v2-0-5dd1dc6c660a@google.com>
 <20261027154649.91571-1-griffoul@gmail.com> <20261027154649.91571-12-griffoul@gmail.com>
 <CAEvNRgGn09qrCZjUM5sdqQohPWE62GN4c52iK7ZV_gi5wro_Ww@mail.gmail.com>
In-Reply-To: <CAEvNRgGn09qrCZjUM5sdqQohPWE62GN4c52iK7ZV_gi5wro_Ww@mail.gmail.com>
From: Frederic Griffoul <griffoul@gmail.com>
Date: Thu, 29 Oct 2026 14:27:45 +0000
X-Gm-Features: AclHuK_kIg9XZ2cFnZL0tpsqSJGFt3xKJOd_xbKB2NrNWZ3oy-bCAgu9pf3hZSM
Message-ID: <CAF2vKzOTd=0rmMXvtAE_SzbbZ3C9n9jTcjM+Rj=ovFoYBsXCKA@mail.gmail.com>
Subject: Re: [RFC PATCH 11/14] KVM: guest_memfd: Add kvm_gmem_restore() for
 PFN mode providers
To: Ackerley Tng <ackerleytng@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>, 
	Jason Gunthorpe <jgg@ziepe.ca>, Kevin Tian <kevin.tian@intel.com>, Alex Williamson <alex@shazbot.org>, 
	Alexander Graf <graf@amazon.de>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Alexey Kardashevskiy <aik@amd.com>, Andrew Morton <akpm@linux-foundation.org>, 
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, Ashish Kalra <ashish.kalra@amd.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Baolu Lu <baolu.lu@linux.intel.com>, 
	Bill Wendling <morbo@google.com>, Borislav Petkov <bp@alien8.de>, 
	Catalin Marinas <catalin.marinas@arm.com>, Christian Brauner <brauner@kernel.org>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Connor Williamson <connordw@amazon.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Dave Jiang <dave.jiang@intel.com>, David Hildenbrand <david@kernel.org>, 
	David Rientjes <rientjes@google.com>, David Woodhouse <dwmw2@infradead.org>, 
	Erdem Aktas <erdemaktas@google.com>, Frank van der Linden <fvdl@google.com>, 
	Gregory Price <gourry@gourry.net>, "H . Peter Anvin" <hpa@zytor.com>, Hugh Dickins <hughd@google.com>, 
	Ingo Molnar <mingo@redhat.com>, Jacob Pan <jacob.pan@linux.microsoft.com>, 
	James Houghton <jthoughton@google.com>, Jan Kara <jack@suse.cz>, Jianxiong Gao <jxgao@google.com>, 
	Joerg Roedel <joro@8bytes.org>, Joey Gouly <joey.gouly@arm.com>, 
	John Starks <John.Starks@microsoft.com>, Jonathan Corbet <corbet@lwn.net>, 
	Justin Stitt <justinstitt@google.com>, Lorenzo Stoakes <ljs@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	Michael Roth <michael.roth@amd.com>, Mike Rapoport <rppt@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Nicolin Chen <nicolinc@nvidia.com>, Oliver Upton <oupton@kernel.org>, 
	Pratyush Yadav <pratyush@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Robin Murphy <robin.murphy@arm.com>, Samiullah Khawaja <skhawaja@google.com>, 
	Shuah Khan <shuah@kernel.org>, Steffen Eiden <seiden@linux.ibm.com>, 
	Steven Price <steven.price@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Tarun Sahu <tarunsahu@google.com>, Thomas Gleixner <tglx@kernel.org>, 
	Tom Lendacky <thomas.lendacky@amd.com>, Tycho Andersen <tycho@kernel.org>, 
	Vishal Annapurve <vannapurve@google.com>, Vlastimil Babka <vbabka@kernel.org>, Will Deacon <will@kernel.org>, 
	Xu Yilun <yilun.xu@linux.intel.com>, Yan Zhao <yan.y.zhao@intel.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, x86@kernel.org, 
	Shuah Khan <skhan@linuxfoundation.org>, Fuad Tabba <fuad.tabba@linux.dev>, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-mm@kvack.org, llvm@lists.linux.dev, iommu@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Thu, Oct 29, 2026 at 05:52:40AM -0700, Ackerley Tng wrote:
> Fred Griffoul <griffoul@gmail.com> writes:
>
> > kvm_gmem_revoke() does not fit: it would
> > zap the guest's and the VMM's mappings and reclaim frames that a guest
> > may already use.
> >
>
> I'd drop this paragraph from the commit message, kvm_gmem_revoke() is
> the complete opposite and isn't a candidate at all for the goal, which
> is to notify importers that a page is now available (and they can map it
> in).

Sure, I'll drop it.

> provider --1--> guest_memfd --2--> IOMMU
>
> 2 is definitely required, but why is 1 required?
>
> Between the first .get_pfn() or .lookup_pfn_range() () and
> .put_pfn_range() or kvm_gmem_revoke(), the provider should consider the
> memory in-use by guest_memfd.
>
> When it's in-use by guest_memfd, then guest_memfd should use --2--> to
> map into IOMMU page tables as necessary.
>
> When it's not in-use by guest_memfd, why would the provider force it
> into guest_memfd?
>
> If the guest VM knows that the page is now usable (some other
> communication channel), it would touch the memory and do a .get_pfn(),
> that would be successful this time. Perhaps that's when --2--> needs to
> be performed?

The IOMMU never asks, and the CPU may not touch the page before a
device does. A few cases where only the provider knows:

- The provider gives frames back with no guest involved: a page that
  arrives during post-copy, a range moved back to the VM, memory given
  to an overcommitted VM.

- The guest already gave that IOVA to a device as a DMA buffer. The
  device writes it without any CPU access, so there is no .get_pfn()
  from a stage-2 fault, and most devices cannot fault.

- A read-only frame becomes writable. KVM finds out on the next write
  fault, but a device write to a read-only IOPTE just fails.

kvm_gmem_restore() doesn't push the memory into guest_memfd: guest_memfd
only passes it on to its exports. Stage-2 and userspace mappings stay
lazy, and iommufd looks the range up again and maps it.

I'll make that clear in the kernel-doc and the commit message. Would
that work for you?

Fred
