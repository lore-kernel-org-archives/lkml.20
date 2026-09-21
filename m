Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08BE44A92C4
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 14:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789999711; cv=none; b=TMJxirIS1lescZfggmKW09/pwsGdRF21U2UBqHDKxYSq9bkSNWhXqBLmoDYKvTPkosCYUHhdIO8uIVaIOklO8jsmh6F9vmgr2aNgorBEec9uDPmnnMo9G60h+9xLXwsvNjitIF9ehTGKFfJ/Jw1De7UoXf3sDOyfGg0VeSXbnQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789999711; c=relaxed/simple;
	bh=j0ztyi8BRj9ZAgxfq5AEEOgdvPZN7dBWtgWca/AQdxg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=peYEQhLYmn9HKkz5WGHjFBt9OTq83g82eTWDtF3KmgYidBd4DO8kCKO+pMeQaIey0J7GwTz4MQ7ZLM2aL4TYqb3FWMaHml2gu1m2nz6NGJqELJ8+w2Kqk5pW4VE6neTpR84+gq0GS3MMB8Kkn987IOdoTG+YjNCWCNHcbA9H0+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=viZ3rQjf; arc=none smtp.client-ip=209.85.216.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="viZ3rQjf"
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-39e3f521346so3553283a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 07:08:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789999709; x=1790604509; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0JSL+jp94xbf/lxQkqH/mrTlexIUids4W7HCXSAS67g=;
        b=viZ3rQjfnzVDMEbEpFi1taWFMXGH9453uNvRvs5aqubo8Ztl2MlZMg8uERyavOLWrG
         ZVXDTBSfuHjVT5taI6oY8Qx+W7ZA74Hkj+ID0etp1CdI76u0HWvyCzSa7b7uU4DizOro
         N6zUxYbnPSl+1Bmg1su4ArsnYPOudpW72D6Y5je6/asTmvKvm2gxTK2MCsy31UlJPyS4
         EBk52rzQHCWcAXZD+rs8QVOaSxsZSboNHgM9G9CSOxgRfcVg5XjieMgLkY7e8oLAH2jZ
         WCcdjWgZ4kgGxdHtH2+LvUnL6KvTLisq/Uknnil1SHJnpTwcZLO279rqpI7CuLMy4+NW
         v5+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789999709; x=1790604509;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0JSL+jp94xbf/lxQkqH/mrTlexIUids4W7HCXSAS67g=;
        b=u+ug6RoID8pB80IrRNMsTaSb0qEu4+IzAj8uK2uyenNvbbQPsuR/ZnLkRDt06TpHS2
         JHxhL0jBvm3af7FXxpEgD6v3nJQYJ6TWz4FcXAa/ujbbkmJ4esJ/Pv0fRiYpxW41cwcH
         SgM6toHaef0lZ6IWFkspGA3VqP1A4h28gIscZs4Q3aPXhJ9r8ix2dwd46o0prnPez0ib
         iC4GU2jeEyIz7o4Zihe9Sdj77/x3QbLv3n+y5d5uSGu6zSiuj0UjUgOzlXNmi79sBCs0
         nBcu2KTfkY2KnVgMSqi6HFzu94qwqrpQ9eRhLopeKu2FEk6bhwdHtd/tuKZmoLywUlZf
         UpXg==
X-Forwarded-Encrypted: i=1; AKwUvBws4Du988dJJeLLDMhVmQD34TKC+Wcw5YK7ewPiMdqBimX2wxThXjVEBet9x8mpjFQ4R11QIXSGP6Tt+Ks=@vger.kernel.org
X-Gm-Message-State: AFuF++kE45MlHTokol8wL9mIAQCgDrv8JQQUrqvJiPya/J9Pl5pzV3x7
	tGJp0Yn0P63j2dzsozqI+dZfbyngiH4+eXRPP6m15A92pAgfsvQEj23wPSmSXy5B7IlT6ReZK4P
	jJPFhvw==
X-Received: from pjbml8.prod.google.com ([2002:a17:90b:3608:b0:3a0:3146:faf2])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:548d:b0:398:c3ca:1ebc
 with SMTP id 98e67ed59e1d1-39e54d11d8dmr16902921a91.18.1789999709296; Mon, 21
 Sep 2026 07:08:29 -0700 (PDT)
Date: Mon, 21 Sep 2026 07:05:52 -0700
In-Reply-To: <20260826100321.1309685-1-nik.borisov@suse.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260826100321.1309685-1-nik.borisov@suse.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <178999854901.734873.2676734555894955612.b4-ty@google.com>
Subject: Re: [PATCH] KVM: TDX: Remove always true ifdef
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Nikolay Borisov <nik.borisov@suse.com>
Cc: pbonzini@redhat.com, kvm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Wed, 26 Aug 2026 13:03:21 +0300, Nikolay Borisov wrote:
> CONFIG_KVM_INTEL_TDX depends on KVM_TDX_HOST, which in turn depends on
> CONFIG_X86_64. So it's guaranteed that any code under ifdef
> CONFIG_KVM_INTEL_TDX is also running under CONFIG_X86_64 being true,
> remove pointless ifdef guard.
> 
> 

Applied to kvm-x86 vmx, thanks!

[1/1] KVM: TDX: Remove always true ifdef
      https://github.com/kvm-x86/linux/commit/363479c41f02

--
https://github.com/kvm-x86/linux/tree/next
