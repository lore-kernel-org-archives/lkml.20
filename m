Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 814CB4A3D4F
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 14:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789999619; cv=none; b=DfsFjTmQhC0dPPtAgR4SrS86rNEFyVhmSjPeCF7uGYn/Yes1AZhVdeU2lzqFVHPHp9IlYQaAZl8S8uQ1i+U+DiJoVrQ0Mm7n2+fsOIxCaNhWajsCTuD2x/eH3eCP6tBhONse1M01lrzVRGqnEFYar2CAYyNVHIyve42LzHq5aig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789999619; c=relaxed/simple;
	bh=wjVhj/5CNrmPAtPl8hgZIFUFRA54VA5mUrcARsjYmj0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=bXgo69WIZyJWxw3fP/NqcWyVav/qrDwIWBiHMv9DhOik0u9shqP4TrJh0aYCbMEq+neiA1V/Hr8b01yIY8vi1ErySK2tKlfbopObs4/vWNSCfJYVw+R9QAvVuPIDLs8DTRu9nkWtxpIsyUpZF7vxrPW/+frUWSdLAtAe8gl6TmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RmtX23p4; arc=none smtp.client-ip=209.85.210.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RmtX23p4"
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-862a0aa7d2aso4952562b3a.1
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 07:06:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789999618; x=1790604418; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ju79T8LIaUGW1La3vhqmCrNWbKZfmx927vD3HZmioq0=;
        b=RmtX23p4mg8Sm9Ebq/SnVEIlEDjh2gzRJgLPaiuuySGOl7ddXAizpu84cmaHGszsMv
         NUaGPVaxAFJ7MAwWwIkUxpzpKg8q0B402P+h8WYT9tM9619bWtXrOM2gazJ3NPsuvSq8
         DHnd7QI92eMJ3hydaqrfCedURjU2lmgwJ2Cf4Jl4vAZ9GHQoqvXapH4/5VLUdBrsnzkT
         KtGsEdjTQmC56P6sWtKLTi4w+9FeHMi+MI/h22WRg1HaL4AHYAVW4WRdkhj3u4JdoCzc
         Km8b2yDVIWWHjNdSEKuMuScmUTXysDGhpoVmLLcw+DpxH5Hg124R+jIGlvKlLwYGIp2Z
         6g4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789999618; x=1790604418;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ju79T8LIaUGW1La3vhqmCrNWbKZfmx927vD3HZmioq0=;
        b=0aR8T3QFm2Jpn+6V6I9EOtU8wWbz/Gpm3ftrGE72sF0rlGFkEWLYNEdRTC0+3pjV9W
         RIT+fdymhBpP6Ay4NplQ5M+UC+UAOWfU5iiOECpQAEZ3A4q8FBhhUFiY+sWIY/UdBGz5
         AUtk1bz0awtJYCZns5ISLXEXM7lg9ICBN3zLSDCHF/EGeT9zxy8Hhcyz/vGVOYUetd/b
         D+UfxM8pASJe9Od9suqaJh9WDh717a4186JPa/435EZWp2psP7KINx6HICtm3VT4otrD
         y3djjzJJ4046r48UpuhB14swgKD5k47SmpPRkOqJm4jhQRda6Mz933qPputET/cGgOAz
         U56A==
X-Forwarded-Encrypted: i=1; AKwUvBw+mrZR0Zhx4ULQcjELyvTye+EWp+/lBlIHRq6oq0Kbl/Hw0MxF6NXa9s5HlXArK9iGGZSIuL9ORlpGHJM=@vger.kernel.org
X-Gm-Message-State: AFuF++mP360tRA0fKdw92xH2+IDB7KUE8Z/XawvAwfnOfOL2Jf6Pqx6d
	2PIHyUUXbVvEeofNFTud5Ioq2OMWTk7SuiI/drhiZ0ebmt2wCGRtADurPcgr3CazbJcXy0+KbpI
	AKIxXag==
X-Received: from pgvr17.prod.google.com ([2002:a65:60d1:0:b0:cbe:e0a7:536b])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:e8b:b0:3d3:ae40:51e3
 with SMTP id adf61e73a8af0-3dd8c53b507mr15341684637.23.1789999617656; Mon, 21
 Sep 2026 07:06:57 -0700 (PDT)
Date: Mon, 21 Sep 2026 07:05:24 -0700
In-Reply-To: <20260806191945.4192732-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260806191945.4192732-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <178999692670.716970.18270488190389827567.b4-ty@google.com>
Subject: Re: [PATCH] KVM: x86/mmu: Bug the VM if KVM attempts to unsync an
 upper-level shadow page
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Jinu Kim <kimjw04271234@gmail.com>
Content-Type: text/plain; charset="utf-8"

On Thu, 06 Aug 2026 12:19:45 -0700, Sean Christopherson wrote:
> Bug the VM and skip marking a shadow page unsync if KVM attempts to unsync
> an upper-level shadow page, as marking an upper-level SP unsync is all but
> guaranteed to be far worse than terminating the VM.  E.g. sync_spte()
> (rightly) assumes SPTEs in the SP are leaf SPTEs and so calls drop_spte()
> instead of drop_parent_pte(), which can effectively crash the host via
> when running with CONFIG_BUG_ON_DATA_CORRUPTION=y due to there not being an
> rmap entry for the SPTE.
> 
> [...]

Applied to kvm-x86 mmu, thanks!

[1/1] KVM: x86/mmu: Bug the VM if KVM attempts to unsync an upper-level shadow page
      https://github.com/kvm-x86/linux/commit/27f02d851410

--
https://github.com/kvm-x86/linux/tree/next
