Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D5C64F85A7
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 21:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790286909; cv=none; b=eqMTDKddg+ojRGz6TuGWnhXLLU4yRItXbAY2t/R9ayVV/5U+AKKLFNMtTSOvE7+iBplnJ8aXAwewI536qUO1GpPGsDLaAN9HksgwtZ45HWUQpTlkNPeuhEBCqWDpESYoU8ipyMBGvGDDGDsuhumkSigf/jfMZvkQNf+CoDQMKG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790286909; c=relaxed/simple;
	bh=2ZGU//KYiJQWmwlH/Q/XMroPyMM9p/vhyZIryzwt08k=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=UCVsIjHfa4PTkGCNbWYjGlKe1LgPDGcGGZMSGCWP1opy11UXFl/dKgbm+AOKmDpSpt+8ElEWW1WjPaQ3Kwjt9YYv/jH6fFI1ZbDeH3NASSMJ4kzpXER9GFpgviMu5JiE8/s3lTqHRmBjOLBsh+DBD7WNfTC9T9af+FsI1ntt9/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=N7SmX7Ha; arc=none smtp.client-ip=209.85.215.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="N7SmX7Ha"
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc4afc810bfso921783a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 14:55:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790286908; x=1790891708; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ktQrlSrVcwbzp91Jk2Fph37MAeo4cET8GqvsyuC/rgg=;
        b=N7SmX7Ha1WERzalru5YR7fFMl17+Jms8HJsHaZfOY5IReSBvCqy1J1vsi+Uk3cWI0J
         uosg4BEASWn+blNCbkFmIUApTz27jDIoLl+XMxQc2VoqGzLZQgld+TNCHVPKtGDn7IKQ
         rLmZcfnfEGN5QNrHI0wu5OcYcBnsieaszhvHACDW+B2MK74lWgBBtbn7LULHvsV4Ku9t
         MOUNSA8lVWXQGA43mdUBTn1kIXixQ5CDmgmHzIIQe/cFnixZ4I25duAJmiBCBcqg1Ofj
         1+/czSQr9MIs7jyetefKsXhI4vJjIs6NC51DCPj5pJdWgSrMPP5sY+u/K0DhH6C0pRlQ
         QTQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790286908; x=1790891708;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ktQrlSrVcwbzp91Jk2Fph37MAeo4cET8GqvsyuC/rgg=;
        b=Y8VMrXitctxatFEvVsrg/wyTaz6XZTfuq4VQgAlM/ZodWVGQvPjjWs+OO7Vl8+VoYK
         +fSCBbZLMc4shp00hmjP9Azwxi92AUFwCYqUBKiuAxOtzOSDhyzVsVc7tvxnCcPr/mC9
         rjZDn1mNrt8tlxuRiFLlO/ta1B2mKQLez+LbI5l/ddLgrusiin/05zMZ1Fme7npO2HpJ
         ZR7fAPJ/thKz2x815e8y8B/e5OiGxc4ScdmWvgrXfpQnQ9pAYZXYEptUopcneeaAXhBN
         qVKiHbmHBILm99gpe0LBUbF99XJjSQAaqL8mFSue8PYnJKpnbemIOKiKyA1bqiwT7umN
         e5WA==
X-Forwarded-Encrypted: i=1; AKwUvByAZ44ZEpcIzvlGr8vRMB6pa9/YcMPRmelklqUVujXripnzOqo7o6h66bSnP3MXyK+1Bjamn6i0ULGW+3U=@vger.kernel.org
X-Gm-Message-State: AFuF++nhPqtMPbQ1pJEkM20pCZ0DgmQfoXqRBxsR+hhfkMNFrw1ppDbU
	0oEm68o3el+orHCUmAdgwqkfoH/pQ7DitrjItGtg6Arb6A15t55P2WqeXPX2ioaX19Mt98e/jdV
	2iqLObg==
X-Received: from plar20.prod.google.com ([2002:a17:902:c7d4:b0:2dd:4a8d:e22b])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:b0d:b0:2d8:d4d2:d13a
 with SMTP id d9443c01a7336-2df7e251e68mr21560155ad.22.1790286907302; Thu, 24
 Sep 2026 14:55:07 -0700 (PDT)
Date: Thu, 24 Sep 2026 14:52:07 -0700
In-Reply-To: <20260922000152.1113202-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260922000152.1113202-1-seanjc@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <179028365423.2005474.7634424655738990561.b4-ty@b4>
Subject: Re: [PATCH] KVM: VMX: Move bus lock handler from main.c => common.h
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Mon, 21 Sep 2026 17:01:52 -0700, Sean Christopherson wrote:
> Move the bus lock VM-Exit handler, which is basically a one-liner, from
> main.c to vmx.h now that to_vt() is usable in common.h.
> 
> No functional change intended.
> 
> 

Applied to kvm-x86 vmx, thanks!

[1/1] KVM: VMX: Move bus lock handler from main.c => common.h
      https://github.com/kvm-x86/linux/commit/6088c9a22012

--
https://github.com/kvm-x86/linux/tree/next
