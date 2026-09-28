Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13F52486E62
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 23:16:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790637401; cv=none; b=RC2IN9QJvjcxpVSc9U6G4dtHnbDm3hqt/JTtt3PJ4hfXJUFIMJ0nv09xe0ELKfRT7U+5ZTht5N3oeNywVl1FoI69rmpvK17+e/2wAdVYLYqiFaWqlh5p/1moUp2BC1+G9tO/2IECDkj9SJyVDP4vJ0xIGkOego/Ae8nWwd+65p4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790637401; c=relaxed/simple;
	bh=xJg953kDIMQCVcGBad5cCy8PqtHYIG7YHEk9BopT5ho=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=NWPu7TyPrvj4py4iBark7HLLZ6LCNvJHO2fdxnX9ED3byacdJ/rxEyW/sF8by+X1LiEYbhlP9nUhHpQgpYEC5tfUsf2BoUmDiKFGZwFOfu3sNwwGSL2C4/EPhiOO6zaVcaMiN/PxQUtBzSgGTXr2hXBkqTxFYZPRcqYS6Qi56PQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=IWS7vRLo; arc=none smtp.client-ip=209.85.214.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="IWS7vRLo"
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2d94f086fedso34224925ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 16:16:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790637399; x=1791242199; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tmxfbxC6dKbbrMURHxbUMM8J1sxRM1KRxB+INYiPXxE=;
        b=IWS7vRLoyA5LIuUvN8yPLHS0IdQmcGW8+gItojQrcB0foyFqkg1WH0+n9ReXGrgzQZ
         ypXIMiZGxIZFn5weU+11D7IB0X7frTA4mw3dNJ3Knzz7G1DhD/HrsnCuKSfBvtVPV2Qi
         RhLhn0pOPhnBh/oLZWq+TvnHg/ULjXxS6k5CZB/42GLMBjVCQH2UgL5TrBBwXC6i1YB5
         SjFqoeSTu/Q1PpyEEWM9MU/UOakvs3uP/V4kEWOE/yRh3nNCETjO/VXWM/UZMghWz/52
         ocg+TjDWvHP1G3XFBy20qCGRScYS+ANHb5vwAYchLW+JfyRP/Tbd/x+nhlziz0qSlJPK
         in2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790637399; x=1791242199;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tmxfbxC6dKbbrMURHxbUMM8J1sxRM1KRxB+INYiPXxE=;
        b=0UggXhPS99iBuDfzImkvID9EAxdP9KEpcnEXrwHrnPtPoThD5ZgLz55y/EZTTEzAyp
         DfnXKSnYfBXnOeeHMz+thnGf+IQx7JvGX5owgtp1GhhUTqVmOdcb60Qfd/5Jeeg1x+5B
         SF5YesP5y4Jf6z7yPGKYAnZGzKrC+O480i36PEGu8tMR3GW/KpNmYZwsR8PCvWW1P3W+
         mSoKxyKUXSVhGgKQLBcWBlf3O2/CZLYOOHJeS5P1qvKpzOUKrfdKOo8ldKmzxeT97WT+
         FjvbEa+N+hY1D42HTWnFxa46fzXcaSHmV7O42E4qCk3M+26l9X5WAJH7bQEhTpcJU9lV
         CJyg==
X-Forwarded-Encrypted: i=1; AKwUvBzpSkoZJIQQR+a75/12jJLPXTcnVQZWhNShLKJli9u5oxz6vgfI/rT65a/23dJGMNB6rQJTfNV/Xrnr+Jg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJCuaXByvgDYKReOfJWeUsuY0fbnaQ4ZtmLFBI5onnZ8WvZrztO
	6rRTAlX0naj2jjxAkHy7hJolTjeAc+ocF0TdRB1Y2JuiG1Y9z3OFXJR0d+nOAGjCTnR3q0GC5Oc
	2W2dX+w==
X-Received: from ploc24.prod.google.com ([2002:a17:902:8498:b0:2df:b341:73fa])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:380d:b0:2d8:d4cd:dc8f
 with SMTP id d9443c01a7336-2df7de8a7f9mr118569465ad.18.1790637398923; Mon, 28
 Sep 2026 16:16:38 -0700 (PDT)
Date: Mon, 28 Sep 2026 16:16:38 -0700
In-Reply-To: <20260815142218.85067-1-hmushi@amazon.co.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260815142218.85067-1-hmushi@amazon.co.uk>
Message-ID: <arr1VgGZmgUmY4hc@google.com>
Subject: Re: [PATCH] KVM: Use kvcalloc() to allocate lpage_info arrays and
 dirty bitmaps
From: Sean Christopherson <seanjc@google.com>
To: Mushahid Hussain <hmushi@amazon.co.uk>
Cc: Paolo Bonzini <pbonzini@redhat.com>, David Hildenbrand <david@kernel.org>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, nh-open-source@amazon.com
Content-Type: text/plain; charset="us-ascii"

On Sat, Aug 15, 2026, Mushahid Hussain wrote:
> __vcalloc() makes every allocation at least a page, so a single page
> memslot consumes 8 KiB of vmalloc for 8 bytes of lpage_info and
> another 4 KiB for a 16 byte dirty bitmap when dirty logging is
> enabled. This overhead scales with the number of slots and VMs on a
> host, adding up to memory pressure when guest address spaces are
> fragmented into small slots.

If memslots are fragmented that badly, then the rmaps are also going to be
extremely wasteful.

> The rmap and gfn_write_track arrays keep __vcalloc() and vfree():
> the 4K rmap and gfn_write_track are per-page arrays, 8 and 2 bytes
> per 4 KiB page, which legitimately cross INT_MAX below the 8 TiB
> slot ceiling; the smaller higher-level rmaps share the 4K rmap's
> allocation loop; and none of them allocate under the TDP MMU,

Until nested virtualization gets used, and then KVM pays the overhead cost for
every memslot.

Rather than flip-flop because of a semi-arbitrary limit that has nothing to do
with KVM, I think we should provide dedicated KVM APIs for allocating memslot
metadata, and pick a pivot that makes sense for KVM.  Or just pivot on INT_MAX
to route to kv() vs. v() to play nice with the "not crazy" rule.

> where the waste above was observed.
