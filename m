Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794331146;
	b=0ykaihwIQISufVF837E6W7T0+NpVbC7e8fOZySlaCXnz4DI8A07FijbbU8LLYyYVz0st
	 3z/dwcqHQGkJ6VOwrU9BuuHgMiqnFN1KA4eAYYVws5OdqqP9Mzv2yn3M0mK2gnCIOapoO
	 u/pgOuOhMg8VieRb6/Rn6WQVEubjMPSBQxSRDbLvKOyuanBWO0y0KT1kPSmiHh0C1FxHs
	 EtjMw7bYE6bjNLOX44jcavlOoAvpNpujyLjJC+UKg/3A3tDpMy4hzf8UTRyx+zuTtq28m
	 txkVdCUfSYeKa+oeExb29IeHNq2rRTxlBkN4StbhHLcZYf5FVOKpTZRbGe40tuwqQIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794331146;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=V7fyh20lQdCfEvkMlKmFXdlszEDXLNAOR5UNt1WFBvY=;
	b=30uUFMSU3YNqagowunzVqlM98OGU6aUNHKmrKWmNmZzZrmVsy6AkeeECZ1ox5iucvUe/
	 Gt9joa9ITSsz63yARfWvAcSwvbNkoR+YyivDFMVMxDKEWWB2J5tXhd4fJY2gLHW7byR8Q
	 WkJRvv/n74DXgA0cTojD0D+61pCZ9YU8xPrDxKZLRBSUhrrdNMlSRyRv0hrJfKTnOIizc
	 nj4FoH3qtG+kGLni1Pq2A6t2Svh8QoTWF5UMLYj7Q/yIfDcFLoT6pbvukLs8ckuJULfcT
	 ZVzG3NU+p99/NLpkeN4ozZWDHeDBbQyguSfBTUfVpBVmdTaptExJjQBZy+valA6nB0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Tsx7bEP6;
	arc=none smtp.remote-ip=91.218.175.56
Received: from mta0.migadu.com (out-56.mta0.migadu.com [91.218.175.56])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BFA6606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 17:19:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9BFA6606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Tsx7bEP6
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=5N+pLaOxaXEBjI3kYto3LAKJTxf1OYPE2hTSsrnSYYI=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794331143; v=1; x=1794935943;
 b=Tsx7bEP6Ypq1So8KXtDqPuPvTYK81USd+XpualrAKn7Q3AV+W/nA/mWDrlwE6zEavHzQlDP/
 N3nz+IhvfOkwudejQFR9BSwEk78UZ9sJpPdMvHqSHGE83c9Z+a90DYDY0v6Cyq4d6Xd3+L3zAQ3
 /3p5P4gEtfHYsQghaFIRMfs8=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id fa015b11524bf34b;
	Tue, 10 Nov 2026 17:19:03 +0000
X-Mizu-Trace-ID: fa015b11524bf34b
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5c00d7ac49dso7792e87.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 09:18:59 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGNinJzcEqLSy1ceJ1Sb16p1rNjj0wPomBWEsfUYu6wHgQP1N4sfEXCOe7ds/1JXcDrSQe7xqXrL7ihxcg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9XNcWCojG3nPSGvBRJV53vJZ39tb8hdDJmO9KzHRzB1gqUqi20
	LiuQsPkqv8duozdSj5mOStUODUTNRa7z1/Y0Az09BRLvIPUe+3InaGbqhFLKq2T+fFZM42tZvHI
	pem6vh1cSA5JQ03l2CoGVRmBMf2Kf6wlN+1Qy47zv
X-Received: by 2002:a05:6512:1153:b0:5c1:5361:4aae with SMTP id
 2adb3069b0e04-5c157dccb40mr145514e87.11.1794331138677; Tue, 10 Nov 2026
 09:18:58 -0800 (PST)
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
 <20261110110724.3614412-2-fuad.tabba@linux.dev> <avM81YcTBTJ8zCMX@seanjc-mac.roam.internal>
In-Reply-To: <avM81YcTBTJ8zCMX@seanjc-mac.roam.internal>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Tue, 10 Nov 2026 17:18:22 +0000
X-Gmail-Original-Message-ID: <CA+EHjTz-Nb-g9YQKX2fKk61hC2BfzXfmUHv=2j+eZ18YuTv2Eg@mail.gmail.com>
X-Gm-Features: AclHuK8XEMs-LG2DuXG_orFbD_2iTQdN4-tg95UYPdRQQh0AwcU2lWY30uJCy0M
Message-ID: <CA+EHjTz-Nb-g9YQKX2fKk61hC2BfzXfmUHv=2j+eZ18YuTv2Eg@mail.gmail.com>
Subject: Re: [PATCH 1/2] KVM: Stop KVM_PRE_FAULT_MEMORY when the vCPU's dirty
 ring is full
To: Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Isaku Yamahata <isaku.yamahata@intel.com>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Lorenzo Stoakes <ljs@kernel.org>, 
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, kvmarm@lists.linux.dev, 
	Wei-Lin Chang <weilin.chang@arm.com>, Will Deacon <will@kernel.org>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Sean,

On Tue, 10 Nov 2026 15:48:37 +0000, Sean Christopherson
<seanjc@google.com> wrote:
> On Tue, Nov 10, 2026, Fuad Tabba wrote:
> > diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
[...]
> > @@ -4461,6 +4461,12 @@ static int kvm_vcpu_pre_fault_memory(struct kvm_vcpu *vcpu,
> >                          break;
> >                  }
> >
> > +                /* Like KVM_RUN: only the iteration crossing the soft limit uses the reserve. */
>
> Please don't include AI comments verbatim.

The series is LLM-assisted, but the comment was actually me.

> > +                if (vcpu->kvm->dirty_ring_size && kvm_dirty_ring_soft_full(&vcpu->dirty_ring)) {
>
> Eh, I vote to just use kvm_dirty_ring_check_request(), I don't see any harm in
> clobbering vcpu->run->exit_reason.

Will do.

> Side topic, kvm_dirty_ring_check_request() is rather confusing (clears and then
> re-sets the requests).  AFAICT, it can be this instead:
>
>         lockdep_assert_held(vcpu->mutex);
>
>         /*
>          * The vCPU isn't runnable when the dirty ring becomes soft full.  Keep
>          * the requests set until the dirty pages are harvested and the dirty
>          * ring is reset by userspace.  Note, checking if the ring is soft-full
>          * can get a false positive, but not a false negative, because only the
>          * vCPU can add entries to the ring, and its mutex is held.
>          */
>         if (kvm_test_request(KVM_REQ_DIRTY_RING_SOFT_FULL, vcpu) &&
>             kvm_dirty_ring_soft_full(&vcpu->dirty_ring)) {
>                 vcpu->run->exit_reason = KVM_EXIT_DIRTY_RING_FULL;
>                 trace_kvm_dirty_ring_exit(vcpu);
>                 return true;
>         }
>
>         kvm_clear_request(KVM_REQ_DIRTY_RING_SOFT_FULL, vcpu);
>         return false;

I'll send it as its own patch.

Cheers,
/fuad
