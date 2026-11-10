Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.80
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794325070;
	b=PMT8hZUB5PcQtC8Z32BkRvT79tcORGi3u79DEen/OrCvs63ikzwcOWot0cQYoTSnDxWr
	 TLc5bjFmNvg//ZREBeYvcACE4AW6Rcddveth7hDRpXReAg7FVsg7uKYPBOuVGL6MsIIvf
	 a8YAVuJ1FK+AI0lFiy7Kg3MxJk5IaFVYNGa/suRxfrwqUiQixIxViXssacjM1pI8Wpil8
	 LymVK1UERdStQ7ObuHCEU4TpGuBhf34Jdn3ej1QQyeLqY7TN+RYyEJA/Ig59QkswrkbyR
	 O67OF+Oc/pBMTWIsHdzoaLd6o+z93foF3gEWZ5Fcdstvv9WBKoBbbTpC3ZXqwZCzUqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794325070;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=ogFCUAuBZLZXOutM4r4leQllES0UKlFJyoU3ZQqHWYw=;
	b=V2C96y36JVo+wWQ7BSVZkuWG4QCROYOidvPlh5ExrHywpF1Tj12RK4rCy4gyB2k15uG3
	 HZ8qvLC/Xp7ZJQ3OstA3y2HwBUdagI6YwZGj8akJhw1bDi1WeP0gJZcZKO2MgYwAuZD8W
	 3lpFXK7oAte8N7171+S6ZaCqJg3hjjnmA34cZF+JTqkNJJE+3HP5u09KTMzyD5s/juOOF
	 g3FTn6TDRYW6YrHbACatCOG6bMApgSJZHQHpjC0T2KpV/oDaoQBj+dXNcfhXHVqLnQN+N
	 0LKu24rtr1jNrGhesZkiCbawf95WgWD56IXevRjuFZiEf3QyURKurZHX0ScIJGYlb3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=MGkJK4Ls;
	arc=none smtp.remote-ip=95.215.58.80
Received: from mta1.migadu.com (out-80.mta1.migadu.com [95.215.58.80])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C743606A325
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 15:37:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C743606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=MGkJK4Ls
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=OU2BxWs+fl9KwiOZrZ7MCmCnoYNRzpKdLi98U8rTU+I=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794325067; v=1; x=1794929867;
 b=MGkJK4LsxUPiK8fFdTMjwZ+4h8LZup3UYVKpKVZuPqAwwcoLwijZdLeeb/g73663HIlgwehl
 qFqTAnkJ1rrSJPCzWPb83tt2LaGEWCb+1XWYSBk7VIZ8iXHdGWaBRF8Air3TGXe5sKtKkiuMkFK
 xQzLpgzgfTmsQP7jW9LU4Gao=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id b5011e09ddaa1884;
	Tue, 10 Nov 2026 15:37:47 +0000
X-Mizu-Trace-ID: b5011e09ddaa1884
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5c144eb2f43so5267e87.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 07:37:43 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEkyAFs0Firu6fJiBIArCMO9fNuT/xBjfCdUlFB0lCbdNbqfruA7y3INtxCwjv2LOjunz0azXWDz0FSAVY=@vger.kernel.org
X-Gm-Message-State: APuU4Z88orIDFioSZMgnpTMePrvTQ0mZCxaCcjpoVRttqN2oau466uS0
	npkQC6uJDOEf8Yq26Vzs+Z9G4vUPxBwAGb5RuJy0EuEG8at20eGbK+unWla8EpOdE+N2UvdoWTJ
	PEITbw8eDUbDW+Uw+qfWFsdf3nEBIr6eJSJ7FpvmR
X-Received: by 2002:a05:6512:1052:b0:5c0:7c6e:4559 with SMTP id
 2adb3069b0e04-5c157db2ba2mr143661e87.9.1794325062152; Tue, 10 Nov 2026
 07:37:42 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110110724.3614412-1-fuad.tabba@linux.dev>
 <20261110110724.3614412-3-fuad.tabba@linux.dev> <avMoubwqgXbpflwM@gremlin>
In-Reply-To: <avMoubwqgXbpflwM@gremlin>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Tue, 10 Nov 2026 15:37:05 +0000
X-Gmail-Original-Message-ID: <CA+EHjTxT_9NghyLSZmOOi_oQboQw-g+6z9WxwaF=-7RdaGbMNw@mail.gmail.com>
X-Gm-Features: AclHuK9GxiFUgfn5RkRxiSl8D-ZsDGIbAcDrgyXgHWZ0Aza6Wilt0GEOkKm-eWo
Message-ID: <CA+EHjTxT_9NghyLSZmOOi_oQboQw-g+6z9WxwaF=-7RdaGbMNw@mail.gmail.com>
Subject: Re: [PATCH 2/2] KVM: selftests: Test KVM_PRE_FAULT_MEMORY against a
 full dirty ring
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Isaku Yamahata <isaku.yamahata@intel.com>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, kvmarm@lists.linux.dev, 
	Wei-Lin Chang <weilin.chang@arm.com>, Will Deacon <will@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Lorenzo,

On Tue, 10 Nov 2026 14:38:27 +0000, "Lorenzo Stoakes (ARM)"
<ljs@kernel.org> wrote:
> On Tue, Nov 10, 2026 at 11:07:24AM +0000, Fuad Tabba wrote:
> > Pre-fault more populated, dirty-logged pages than the vCPU's dirty ring
> > holds, and check that each call stops before the ring overflows, that a
> > retry returns ENOSPC without progress, and that the harvested entries
> > are the pages in order. A read pre-fault can map a page read-only, or
>
> Are we asserting an invariant that prefaulting happens in address order
> here?  Is that explicitly presumed in the prefault API, or just how it
> happens to pan out?
>
> I wonder if we might decide for whatever reason in future to do things
> differently there. Bit nitty I know, but wonder if it's asserting an
> implementation detail?

Yes, the API doesn't guarantee an order. I'll assert that every page
is reported exactly once instead.

[...]
> > diff --git a/tools/testing/selftests/kvm/pre_fault_memory_test.c b/tools/testing/selftests/kvm/pre_fault_memory_test.c
[...]
> > +static void test_pre_fault_dirty_ring(void)
[...]
> > +    /* Populate the pages, so that pre-faulting can map them writable. */
>
> Reviewed below, but I wonder how x86 could then read fault these?

KVM_PRE_FAULT_MEMORY is defined as a read fault, but x86 maps the page
writable when the host page is, and marks it dirty, unless it falls
back to access tracking (below). Populating the pages makes sure they
aren't backed by the zero page.

[...]
> > +    while (range.size) {
>
> NIT: n could be scoped to this block instead.

Will do.

[...]
> > +        for (n = 0; ; n++) {
>
> Could this loop forever if cur->flags always == KVM_DIRTY_GFN_F_DIRTY? Or
> is that guaranteed not to be the case?

It can't. Every harvested entry is set to KVM_DIRTY_GFN_F_RESET and
stays that way until KVM_RESET_DIRTY_RINGS, which runs after the loop,
so one pass stops after at most a full ring.

> > +            cur = &gfns[fetch % entries];
> > +            if (smp_load_acquire(&cur->flags) != KVM_DIRTY_GFN_F_DIRTY)
>
> Is this and the below release paired with equivalent stuff in the dirty ring code?

Yes, the acquire pairs with the smp_wmb() in kvm_dirty_ring_push()
ahead of the flag store, and the release with the smp_load_acquire()
in kvm_dirty_gfn_harvested(). dirty_log_test does the same.

[...]
> > +        /* A read pre-fault can map a page read-only, or access-tracked on x86. */
>
> Hmm under what circumstances would that happen? Is there no way to ensure pages
> are dirtied by prefaulting? I imagine not though!

No, it's up to the architecture. arm64 maps a read fault read-only
while the slot is logged with a bitmap, and x86 with EPT but no A/D
bits maps it access-tracked. Neither pushes anything to the ring.

> > +        if (!n && !harvested && !range.size) {
>
> Hmm, so !n && (harvested || range_size) will pass this, but then you assert
> n immediately below, so it seems like n is an unconditional requirement.
>
> So I wonder whether this should just be !n in this conditional or maybe the
> assert afterwards should be dropped?

The skip is for when pre-faulting dirties nothing at all: the first
call maps the whole range without pushing a single entry, so there's
nothing to test. Any other empty harvest is a bug, which the assert
reports, so I'd rather keep both as they are.

Cheers,
/fuad
