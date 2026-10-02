Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 913F83C76BE
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 21:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790975329; cv=none; b=cmLaNzpEs1Tk1LVxLxhAWuZ4tYkuQwmiC0X/0VcqiE2+SeCpVEtXdzacwwGPG9z9Qqq17ej8NC3DcUUkAbDyBzZyxlGhbBYI/v36mDT8lCTCDEO/Q7PRf1wGIdzUT85c8X7wOBs3oDnZaHacTnX6k67hb2HFUrZUfAIFHopRqsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790975329; c=relaxed/simple;
	bh=900R6liU3Q7GEOvg5B8yWZxQI9b85wkBfgI1IrpZ7jE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Content-Type; b=kcTaOVpoTKHtvpNyJgH0NAhxtM98MOyJAdNpnGEhyvqu1BbHMxKl8WBfaXUMZJC3rYi+ugxLZeSo4dEXm7Bb6dihZfpRPF7UQSEAcOOhJ6DfJF8TuBEYpyxX7+mQSIs0vcMWaICoqI16D0bcZcrpkZGagCbkFxXRi1ZVWgUScMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=SnpNNCfU; arc=none smtp.client-ip=209.85.214.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="SnpNNCfU"
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2dfb24dfedfso181115ad.2
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 14:08:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790975328; x=1791580128; darn=vger.kernel.org;
        h=content-type:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YucoW3vEYBy9i8pzw6TjqgEMgLGWO+HSYPIgDedMYFo=;
        b=SnpNNCfUkpbZPuAMtrQmqYgLIULJZIaTA0ZcR4dvFXVoTSGrBknumRQ+J8iPStRWFG
         4BMxBenEi2P+trAicN4EkliOpvCTNYzn85qKCZ1PjgMWCAzBh7vZ/ruU3JuvGjw3ZYdo
         LaFlAX5yZgi0Bwn9wvJ38IWxfKIWF4v6+dWaagizHeukhRPbbEZyTItLWNKOoN2NokGe
         KBzFgpk149YoxSnIwb1ExR6Z/OsjDN5GLfZB9nUnAocQXU+xsLzCH0DOrMj3G4v0QXeM
         7+QOW3jh7p1hakHWHNicP9zVaCAf189OFzWwmWw+a3beT12okRXs9GlevXZum45kLmvR
         aJ0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790975328; x=1791580128;
        h=content-type:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YucoW3vEYBy9i8pzw6TjqgEMgLGWO+HSYPIgDedMYFo=;
        b=l1+saEYyks7MGwHbu9BJ/9dTDKfxk/wxnjio10piMnuCbTYGiW4nXw/0mfJIb1Xn9Z
         o0+oQpglmeeqdFccywkXektCxlRj0iUZp8WrpoicTjURntaVUKfd0F4OhXV2J681Egbc
         GbOULt5yukB625D18BLaysORu/6WTtss0WoQb5Asaj5PaJltc2Dbjn4MBI8ro01ikGrG
         wrVPG+mPWCzrIP7PHu44JT/OTJzZXgb9hm4NdPKtMKkMQdZU0s2Lzg8aMYtV2MucryDR
         Gz3xGX3aWelMBIeZxG/E19vjD+Z/ryMsoLX6FAsK53Z6AnYUUjqRz0scDkx5E6yWRbLA
         smvg==
X-Forwarded-Encrypted: i=1; AKwUvBwc7FtR2nMsazL98kK5P3ZT7Mqbxct5clx63X9HV+qN85NgDprlzbExlTk/Z3vweC+Ok7+/h7vZrUsct84=@vger.kernel.org
X-Gm-Message-State: AFq9FYIqiqa2DU7jjdbKnsXYpAVRrUktI4HHE8HF3V+0xHL6j77Enjjo
	/hsM/tpvMUQG5r04MnaZUFJaEc4LsttA4IA2Te1NcP+gloRlxkv2b/3W5B0bqMp6hEi4Ywa4wtT
	8lo+hlA==
X-Received: from pjbml20.prod.google.com ([2002:a17:90b:3614:b0:3a4:d124:4dcf])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:388d:b0:3a0:bdcc:51a1
 with SMTP id 98e67ed59e1d1-3a6ce7c5925mr3000785a91.33.1790975327515; Fri, 02
 Oct 2026 14:08:47 -0700 (PDT)
Date: Fri,  2 Oct 2026 14:07:04 -0700
In-Reply-To: <20260917100320.21899-1-pbonzini@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260917100320.21899-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <179097476669.4071828.3235436306643128791.b4-ty@b4>
Subject: Re: [PATCH] KVM: x86: remove "full" out-argument from flush_tlb_gva
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="utf-8"

On Thu, 17 Sep 2026 06:03:20 -0400, Paolo Bonzini wrote:
> The "full" out-argument in flush_tlb_gva is only ever set on AMD
> processors, where the TLB flush is little more than a memory write and
> thus extremely cheap anyway.
> 
> Simplify the code by letting the implementation of Hyper-V TLB flush
> hypercalls always go through all the addresses queued in tlb_flush_fifo;
> there are no performance concerns since that is already the case on
> VMX, and also was on SVM prior to commit 26505e1b5b54 ("KVM: SVM: make
> svm_flush_tlb_gva do a full asid flush if NPT enabled", 2026-08-06).
> 
> [...]

Applied to kvm-x86 misc, thanks!

[1/1] KVM: x86: remove "full" out-argument from flush_tlb_gva
      https://github.com/kvm-x86/linux/commit/ba70065fec49

--
https://github.com/kvm-x86/linux/tree/next
