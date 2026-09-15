Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49B1E43C067
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 05:30:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.129.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789450250; cv=pass; b=T7nEtyetWZgNEaIfFAmmLNRXPQFijOsiT7DdLMhwmLOk17ZOPKV2GK4uDIIdRP8b9gPKWHnCF0eXgYUAFe8BNZLXIE/AAV76+dMoLgJ0kqbKK7mDmi+ED3JRC7rgcgjM+UjaOT9PfJsdX/SJuk6UZpYA7IfSKsujqBcShC3hl34=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789450250; c=relaxed/simple;
	bh=GJvMbReFrxMsiDsbAoAgzLzAmmTi8yBdZN/SVYhbIaA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mLCO3T+5/DbYqm0DPGEZf8Lwg4FmyazSYWpFYu6BMUXpbw2yKHROjqvXx1Zx07/iLwVQSQ8mHzuylgalH0gwDXH3Nkduvs28xJZ1p7klGBr7XT8g3b9e9HORFf78naXHVZKY99K2HIhl+3GvPeBO/He0JBOk4Sq3srw8q9aRBAs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Hha/u8xl; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=eje97ank; arc=pass smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Hha/u8xl";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="eje97ank"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789450248;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Jdrymbp692g0D/7fa/VZXqFnszTm180HBQ+IpU2kX7s=;
	b=Hha/u8xlEmDbR0VFFIYBsgkEduSPBlmTdT67dlDoFLISExNS5UXiTJfCOgvnL100XRXcLR
	JafLzUtHH9UL5g6qIDXSDf3D7dPpTqAgQPhnvjHViNYnGnytkG2yN3GEtokPuvIY1BinkR
	Tsva+4yDarWIHNpi13EZ2SsPaiwzToY=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-361-2ai7UGX9Pheh4klaN9PnLQ-1; Tue, 15 Sep 2026 01:30:45 -0400
X-MC-Unique: 2ai7UGX9Pheh4klaN9PnLQ-1
X-Mimecast-MFC-AGG-ID: 2ai7UGX9Pheh4klaN9PnLQ_1789450244
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-49cd83ca361so38111145e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 22:30:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789450244; cv=none;
        d=google.com; s=arc-20260327;
        b=jkM1NKXS1fwWgtJP6AWuO+xiO0Olc4v2K4qQiXznRt9TAKMzUaVgqAG18dHHYnyJwE
         tz9GFza4/6/cvIKamC/7jBkHrifQOUw4UAmThVA//zfDoWiNljHhhzOxINLbOX5rSy5Z
         WuaMw3jcyatBvI3e6VXGF4A0YRNtz6b4mKzAOKbIi6vxQdGxzFaIxOwzUTf+GQlUWxp2
         RLMuN5tBB3sx3WqnKNps4ooLdo2ZsZBpaRd2+K1lW0lz/Y8AYfZ7LQ9WqiCVKFTZgjKT
         ry5px+H6Uw6WIqWMOPRrfzSbpzHsEi5/4PBbCDrfxjyvo7XSFf4BvZ1huX9r5UoaP9uP
         ggag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Jdrymbp692g0D/7fa/VZXqFnszTm180HBQ+IpU2kX7s=;
        fh=yFc3ydeoRhNSYyTzR9aXXQPi1LBSLaekUn9jtz3xJLc=;
        b=OT6ov8+uH9FWtT4RkDqJsRERBNn4CEo6mwTvkDrScN+1ABrGc53GhZFJOcqweXcNio
         sbPxWFqX+sGGzBg9FjyyiE9+LVCPsinUw6fBQ9n/Joh8S8Mjj9CaWhTrLiUAoMeb2vjD
         Qdla0gYrKDYxEB5NiQPpMtxhak/Z5xqz8mG5yXrbSE32X8JfBIKp+ra+gTHVf0xUKFFB
         HXG2Xzz7amw3Jejp3Oqd3uyPZjJe3kdEBVWXs+z2RXXXV1VzenF/2Gw8Ld/tHETgbENB
         0ORH8pUJjpiB90a+PGoR8lAei7viYZ1h3KDTYLlIkqsQRyG4tBUjkZ0mfqjrBx7h+jyy
         PNHw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1789450244; x=1790055044; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Jdrymbp692g0D/7fa/VZXqFnszTm180HBQ+IpU2kX7s=;
        b=eje97ankMBO6QLyZPhp01wPX8IBUk8fLuDoKcSAOEblhXjcQ7mdogliKSHynJXFNoC
         gS4LJmhfULhOJE2NF3vc3Ycv5f7f2cYzebRdvCDXW++O0P6J7S7c4sDij6jIRqnEBrR4
         luXaGs3nvN5bgJdUmPeAwcaxqRuwIkNJgT8rLYFnZC0zRl7XscUvMmyMIbY3SRVK1yzm
         EWQv0yF7+kNmDpqi8PMAzPaBmmZiwaP2CYmO3z/Gz6yBH726K7p/gZ89y8siQ/yoPpl9
         R7wQFp4xlRQHEB2aWz8PT3zIfj7c3Sp4rDYz4QZWCFVjtRIN/Z/PEFQiYbCG5hDcbMJx
         fuFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789450244; x=1790055044;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Jdrymbp692g0D/7fa/VZXqFnszTm180HBQ+IpU2kX7s=;
        b=C0v/dzDVM06ZyMN+oDBhfZhyfVh2uxCMEruNBOE8rf5Tly9CFl0JwFRNS9X4dLhlnh
         h6OCgleNwXFywiC3mLLjD04W+RVc6z47dWGGl3u/mxbPJQKmq2XdKYJLZxUbcCU5sptA
         DTjH5r0Hfj9CLs/9pnIhy65nisseC9TIRpCuVFuSuOLyxmsI5kGy7eq1L/CttW2je/WL
         iDutvFxXxKpmyuoS2DQE/LDatIxpIZZYsLndTax0cm+PZj98ty9ax8aFBIJ+GJc06mlH
         3opbVS6AuM2jFLXuQyvB+9DhP0JKqwnZ9MeFMC4h30UEQgR5z/TqbK3XosYFDP61aaF+
         fj5A==
X-Forwarded-Encrypted: i=1; AKwUvByjQYz8FGRl7ia9qeFXHoDPVxfEgTzTPyzFztiF1yQrt02Agxullf/bYxf0uz/RXg+XPzmmhFAM2OXJD3g=@vger.kernel.org
X-Gm-Message-State: AFuF++lhffd70LOewx9iLgpQZJfaEw4BX0fN4Q016K5ZGoLEvoKyd8aa
	EwKCrtAhlf2VQZ2HZerpGVyEQaKa2ZV47S5TJ0dNd9khWHO8t+jy4Wfd/Wnv61wBKSZZTVh4i3c
	zAqH2OO0aI9UffjtSfb8XBS0e23HOA8okyLWvvTvcvrVfREZ0pos3DYBKWLbHQG0ItAWrwc+Wjz
	oJv8rl6PGkKp4Bt4USGyQ3IsPbjnLGO0ftsY0ZdWOW
X-Gm-Gg: AYBFou3g/0WDyhqz7xgw0LCh0UHxO7FhdCFfRcUGANegIMMw0B31lvGs1Gdy1AIJ0yC
	PN47vl1Ft1Y+r1+19nLxQpbl/KQ9zft9lKUY5tmYXfTGaFUE9Ohglt6bH7dLqOMN7qqpkEwNl/r
	g2lX2YzI8rwV0wH662fpOpTeTibytsooHKvjn0hSALhicqv8+/3NHrLarQrmroycMQaVBShXSlr
	/wGFQhKHs+wv/4AFYtryr7MmVW/PAgrvVmioYZ9RfQn5u8zCkyRA1nIwR4d9Q==
X-Received: by 2002:a05:600c:8706:b0:49c:fc6c:be15 with SMTP id 5b1f17b1804b1-49e7a68b749mr80684605e9.27.1789450244556;
        Mon, 14 Sep 2026 22:30:44 -0700 (PDT)
X-Received: by 2002:a05:600c:8706:b0:49c:fc6c:be15 with SMTP id
 5b1f17b1804b1-49e7a68b749mr80684285e9.27.1789450244226; Mon, 14 Sep 2026
 22:30:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260914143702.915401-1-aharivel@redhat.com> <20260914143702.915401-3-aharivel@redhat.com>
 <aqgRj7mfDhCUqWw4@google.com>
In-Reply-To: <aqgRj7mfDhCUqWw4@google.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Tue, 15 Sep 2026 07:30:30 +0200
X-Gm-Features: AcwNN1UkoF2o0DlhmB8-mzAUNV53Yg3ZkBipi8bwhNsReywzDQzsiErSC718oDI
Message-ID: <CABgObfYcGeOekEKOG=nQEV+6Z3WCBt9rW33OPU7khNb_TLqWdQ@mail.gmail.com>
Subject: Re: [PATCH RFC v3 2/3] KVM: x86: add KVM_CAP_CSTATE_POLICY for per-VM
 C-state enforcement
To: Sean Christopherson <seanjc@google.com>
Cc: Anthony Harivel <aharivel@redhat.com>, kvm <kvm@vger.kernel.org>, 
	"Kernel Mailing List, Linux" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Il lun 14 set 2026, 17:24 Sean Christopherson <seanjc@google.com> ha scritt=
o:
>
> +      Option B: Use forced_idle_latency_limit_ns on the pCPU.
> +      Same per-CPU limitation, and latency-based rather than
> +      state-index-based =E2=80=94 less precise.
>
> Conceptually, (b) seems like the right approach.  Per-task will be a mess=
 because
> similar to a KVM-based interface, it can probably only work if tasks are =
pinned
> to pCPUs.


Yes, per-task (option C) doesn't make much sense. If you want to bound
the tasks' wake-up latency they're either pinned, or all I/O bound.
But if they are I/O bound and happen to contend, what happens if they
migrate? The destination pCPU won't have the right limit set, so
you're back to pCPU limits.

And doing it in KVM doesn't remove the issue.

> And isn't abstracting away the exact C-state via forced_idle_latency_limi=
t_ns a
> *good* thing?  Without that, userspace will need to tune its configuratio=
n for
> each individual uarch based on the properties of various C-states for a g=
iven CPU.


Yes, even if you had a KVM interface it should allow nanosecond setup,
C-state indices really don't mean much.

Paolo

> +      Option C: Propose a new cpuidle API for per-task idle
> +      constraints (e.g. a per-task_struct annotation checked by
> +      the governor during select()). Correct for all cases, but
> +      bigger scope and needs cpuidle maintainer buy-in.
>

