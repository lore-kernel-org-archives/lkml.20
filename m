Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793822125;
	b=itbVWp5Ne3sCXkn2l6LWbQwlih1RFU5I6/h+sW6zA0Rt3B0RO4ZM/M4kJy98SiLDc+by
	 SkRHRGJ6ouBjptXupGgW40mw+VSx+tVh4rQluIeQfKUawpddQyz/qeaGZsE6Gc9SgP4Fx
	 tYWntMcgnuUGXWJ8/T3mm8TFFPoUQOiPnc5I8Zp1RNjo76IsT1dOypUKd9yZuHmqsULf9
	 7o7c9cOX7RuiBCanzoW9XIIDCEzX7sk/O4hel1b/HUsvY5ZqIBs9RpFkSJuUzupFnbws9
	 rGyZ5wzbQK3TesshmYew3DVgWMZleBudOQGRG2FXBfg/JqorJW472Rlon3C88V1PDXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793822125;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=xIP0152tlzbCKzuF2/YHtRaLIY4BcChV/EzqFd0BfRg=;
	b=mqRqa76P4ZhWMWW9b9ii4OMmIbiItMAio4QAu2ADbF3NGLwvQnpNwwvCqe+ViTD5hzF3
	 rOvZbWxy/48d+9oO2Uj6AhnnONy0MtCLwhPE8vchE5FT+0eKmPAN9OCdfn7sRaaf6afyQ
	 zuLf94bDv2YlyZxTI58My7OdH9h3EOlO9THdkXmmusHuFIJ3tM6yAsembrrVO4s9cd+Oc
	 Fjesi/ab+TmKRML/5900lMSWaipAEqFFHovFuotHzOrLSjL9SovvEmw6eziMJP/pfJrTH
	 dcH780EkeSOseaZ7kCBmxJGbJc9BMyr+A3lmUIuQwm1/sQnGvK0UtZAWm1WRlQWgKaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=kbE2wqxY;
	arc=none smtp.remote-ip=209.85.214.197
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FC4F607844F
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 19:55:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5FC4F607844F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=kbE2wqxY
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2e9995cea88so11593145ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 11:55:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793822120; x=1794426920; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=xIP0152tlzbCKzuF2/YHtRaLIY4BcChV/EzqFd0BfRg=;
        b=kbE2wqxYpPOPvYLN6MYCwEHXLGNtfvFJPaftsxTsX58YJ+WwlbYrRZU1Dwwhwqg7rG
         lM5Fp6Krsm5Op3vdTLXGy0CT8n4LybobKyn+d1usLVBR4BBTbtBim9anmarJFKeFCxhc
         0j2+cJDkBOhY6ZDzhtgpeOaZkWi4shDSut+XcoU/susJkqCJnwadsXKC7xl/lS9BSzxl
         TFUmYZCKGkT0q/Ole95F4e8QrRPsvSnObR/RZIO3RUOy3rGqkKb/CFyfAoOV0G5Nqjhc
         E/YNW3bA8aIGuWKVS2EXpUexSP3TeRv+ip++rD/OBtECH6XZfQ4O8JUrpc9ha2dN/nTs
         JmfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793822120; x=1794426920;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xIP0152tlzbCKzuF2/YHtRaLIY4BcChV/EzqFd0BfRg=;
        b=JFb05jQ0hxP9PL4Dhovvyi5kGVF7/hd7rV31csEsAsg+WGpbVX6fJXH43nxpX7u+ND
         H272J5PvMoAeSF0T7HnSSnx1jLDaV+eOmdAXJl9sMJw2IGZBUQsMZ/jUFCQKaNAkXahB
         REDJlEdeN3qjms3xHipQ09o2iqQz2rLpWAMXXxJUhCyNHkeIvhRShTngEyG7y9Bo8Rrm
         tXIsGe07WlvA8ix4xGqa94veMuhA6wUVgXLIsV6PhNBPZCx1UOkezvsepPzd8lOsTSYz
         sxwrWlynRZ9efc4m1mPdx0vOPoE2vZL8Y4p5v7cVTqO+C7AaG86x4eSBL0mxPyVlwpmB
         Qihw==
X-Forwarded-Encrypted: i=1; AKwUvBxGnr3+0gXBXNpXhObI1BaitsP2EPHogPgvpvG9KewfO8JfyqB6HhgJchRz3Ut0vP350HaUYhskSEX724E=@vger.kernel.org
X-Gm-Message-State: APuU4Z9FCCqs/x2xj9acB9FC9XvU5tw+PZpMKd2ML+XW5BRXGkou+7Of
	/dMq09AN1rlerzWQ+5FIqpuRWTdQwEJQd3+NSq5keTqp4owzAmAO/eCzIyp2fUaeIzasOvA/FrB
	gWz5VXg==
X-Received: from plwg3.prod.google.com ([2002:a17:902:f743:b0:2ea:a5c1:240f])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:ebcb:b0:2ed:18cc:d3b3
 with SMTP id d9443c01a7336-2ed18cce0demr13596215ad.6.1793822119521; Wed, 04
 Nov 2026 11:55:19 -0800 (PST)
Date: Wed, 4 Nov 2026 11:55:18 -0800
In-Reply-To: <ac6b1891d6bdf3a855a5b840c462a6e7d464a146.camel@infradead.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261019162445.37219-1-dwmw2@infradead.org> <ac6b1891d6bdf3a855a5b840c462a6e7d464a146.camel@infradead.org>
Message-ID: <auuNplHvOT0XL1fZ@google.com>
Subject: Re: [PATCH v4 00/12] KVM: x86/xen: Don't drop event deliveries which
 race memslot updates
From: Sean Christopherson <seanjc@google.com>
To: David Woodhouse <dwmw2@infradead.org>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, 
	Paul Durrant <paul@xen.org>, Vitaly Kuznetsov <vkuznets@redhat.com>, Fred Griffoul <fgriffo@amazon.co.uk>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 03, 2026, David Woodhouse wrote:
> On Mon, 2026-10-19 at 17:24 +0100, David Woodhouse wrote:
> > From: David Woodhouse <dwmw@amazon.co.uk>
> >=20
> > Sashiko analysis and torture testing of the upcoming conversion of the
> > gfn_to_pfn_cache from rwlock to atomic SRCU=C2=B9 highlighted a pre-exi=
sting
> > problem: refreshing a cache can fail while a memslot is briefly marked
> > KVM_MEMSLOT_INVALID during a memslot update, causing kvm_gpc_refresh() =
to
> > return -EFAULT. The Xen event channel and timer delivery paths silently
> > dropped events when this happened.
>=20
> Meh, it isn't even just GPC that's affected by this =E2=80=94 anything th=
at
> uses kvm_write_guest() can get a spurious -EFAULT if it happens during
> a memslot update.
>=20
> I just think that until I started torture-testing the GPC SRCU
> conversion, nobody ever cared because in practice we *don't* delete or
> split the memslots which KVM is actually trying to write to.
>=20
> I'm tempted to drop the whole -EAGAIN part of the series and the retry
> attempts, and continue our historical stance of not caring.
>=20
> I'll just keep the other incidental bugfixes I've found along the way
> (especially the SCHEDOP_poll vs. srcu one).
>=20
> The Xen use case is actually the easy one, as userspace really ought to
> be using KVM_XEN_ATTR_TYPE_SHARED_INFO_HVA for that anyway and
> shouldn't be affected by memslots at all. I can update the GPC-SRCU
> torture testing to do that, and pretend I never spotted the transient
> invalidity...

Apparently I suck extra hard at reading today.  I responded to the cover le=
tter
with basically the same response, and _then_ I saw this.  /facepalm

At least we're in general agreement.  I've got patch 1 earmarked, so no nee=
d to
resend that one.
