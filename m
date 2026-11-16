Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794873368;
	b=2EPRCnXnoiOBGGrhz3og8CfazNWxhLz0vaMK6sTDNDtvDREdG9w9FJDXQLB6KOzqOPbc
	 jH45xnGRbptSHQpELnMn+NxioUainpPdKkkThhXdKQm1Vq16NL4SAbN5im+qhf9Uw6985
	 mvXs1qzsVKLAf9Z3g/SBBYn9NGKgKFALaWIXvpFex4cpNmz5pOIF3WGqsJzUnjE5o9Taa
	 xnzndP6NmYGK1mFijrmylaXq8orI/1XJSTfho8DG4VNtOuBcBfLEWtfitEmpxc9l0eVJz
	 y4K0wjcM0tiIYHGPxiBrfkIflU8bgCYkvmKFOYkvMJNkE7Sz7uTkHj789BDPkfIIhbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794873368;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=fM8BvtLW9s06KtNJra4C3dkWSMEENlr39TjRJ7lsWKM=;
	b=GPjPpwJpD6TAqW/evSqDxpMpbZ4DlbvOik4q8o4N3SaW7ZvMPfwDSo2BzjKJKU3cP8p8
	 zVyw5D6y5xp2HenEB3sernzbjs3/EAEoID7vrtGIP4B/IBlKrOm29QKZwEmx8QUZshMIo
	 ukPvtDL2Fxrq7LqpqdJGVNZzCYcqtWsP+w9Z7uBTEzQm7E4xVfORCnSroxpgTwdcoHUab
	 s5r+kzcikqB7GWw+8eAfB3S1WFQmItuSfCBIBnJbrmX+8lBTZOMc+gC4HDeOoYKojC9e7
	 EN4BUJC8bL9Cpot5O4gS1L2ndcNZlLvqcenCDUQ94BzvlQwM5iPuqD7LUVeAN0SiGxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=PAcK3R4K;
	arc=none smtp.remote-ip=209.85.214.199
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80E96606A323
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 23:56:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 80E96606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=PAcK3R4K
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ed276af91dso61921865ad.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 15:56:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794873368; x=1795478168; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fM8BvtLW9s06KtNJra4C3dkWSMEENlr39TjRJ7lsWKM=;
        b=PAcK3R4KP5NzTzBgDklbrxNpr+mWw0evOjbMm/NEKaUP4f5jIahkQcSRmn/LQCg1KW
         Dy25LFzQy+eWhV9aohUKn1qFF48t3hUt6aWxEjm3bnKgHv9Sii55U6DnUDl83qbyf8MC
         prgPkGaKEte3R77mx+Mzmf5LhtCJoGHlHXgCYYJC+rZIiQ0J07/mxx5D0lGvdlDq0Wz8
         TrJ6YaZ3QpFGEZuCtC9B3lBXR4zXqR7KC/15SITkrPyTIm622sLgqKASOgrkhDhx23gS
         6LNg0bwLtBcvRzScdyd0BK82vEu4O14hTLHFZ7sbguThPCHYzVgZwyN6ctZwsYzhosDk
         2QmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794873368; x=1795478168;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fM8BvtLW9s06KtNJra4C3dkWSMEENlr39TjRJ7lsWKM=;
        b=rA1rkdJl+RLMksLHgLI6JQ8SRLfBruCNFOqTIVC3fMBpd6M3Qo6UOa1uDgT9UH7m2/
         3QqzFNGQdg/ve2TNLB1JkpqQqeavFN/wQ/1TekWjhS6cF45sdQC6T8DHH12GmdXEMEfu
         z6xGKxpRPAPHrTS5OdAFMV/6BLNM+tkhksXFV9vI7P89VEMrPsWWXkkw+GRJp0sMmdwr
         SBVvMvD0nE6aAD1xw2zDIk0ZkzUv0Kr68/piBs9Eh0jh4v4+gkyKdcsBD281Zn+4PjX0
         EU2ch+aQoc35p8rVklntwyWOI0BuEzRnbxrn/mb+g9JxrBhgtrdK+cN/8EkvqGDGg9kT
         2SPg==
X-Forwarded-Encrypted: i=1; AL+hErEdZQukT5cImKWHtdaDl4Syc+gRpOO7VzloSE6yVwUW4TSp5gaGQ+Jpek0HT9+CHZyzzauld4d0fER3Oy0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+i/CnDv2UQ9yEwOVFyzOjhACCjTpNcBv5Y++PBQp1s4oTzJFKY
	Qd2wS0ZzuvJ0i9Em1oG+eLQL6LZ0X0s3LuhvecF4f5mgRckpD7HdjGPbtqDpMim6+5a+VCQVhS0
	Q3ZKQcA==
X-Received: from plbl21.prod.google.com ([2002:a17:902:eb15:b0:2e8:8642:f035])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:228f:b0:2ed:697:8855
 with SMTP id d9443c01a7336-2ee0dcd30a3mr128254295ad.58.1794873367529; Mon, 16
 Nov 2026 15:56:07 -0800 (PST)
Date: Mon, 16 Nov 2026 15:56:06 -0800
In-Reply-To: <aviC2OUjvNz_ubZr@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261113164000.467175-1-seanjc@google.com> <avdAIMDfgL_wy1rx@gremlin>
 <aviC2OUjvNz_ubZr@google.com>
Message-ID: <avuYFqt_DAnCiM9U@seanjc-mac.roam.internal>
Subject: Re: [PATCH v3] KVM: Skip gfn-based MMU notifier invalidations for
 guest_memfd-only memslots
From: Sean Christopherson <seanjc@google.com>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Naveen N Rao <naveen@kernel.org>, Alexandru Elisei <alexandru.elisei@arm.com>
Content-Type: text/plain; charset="us-ascii"

On Sat, Nov 14, 2026, Sean Christopherson wrote:
> On Fri, Nov 13, 2026, Lorenzo Stoakes (ARM) wrote:
> > On Fri, Nov 13, 2026 at 08:40:00AM -0800, Sean Christopherson wrote:
> > And a VMM that's doing something broken (i.e. trying to take advantage of this
> > as a vulnerability), could then intentionally set up a gmem-only slot to point
> > at ordinary anon memory, munmap(), and have a UAF on the underlying folio due to
> > no MMU notifier invalidation.
> 
> Ya, Sashiko flagged this as well.  I was initially planning on adding the check
> in kvm_mmu_prefetch_sptes(), but adding the check in kvm_prefetch_pages() is
> better since the work-in-progress prefetching for x86's TDP MMU will share some
> of the prefetching checks, but will go through the normal fault-in path instead
> of using kvm_prefetch_pages().  The return should be -EINVAL or so though.
> 
> I'll send a patch on Monday. 

Slight addendum: I'm going to a v4 of this "series".  I original thought the bug
was already reachable, but I was conflating this issue with something else.
