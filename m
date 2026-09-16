Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7487B4AB3A0
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 16:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789577007; cv=none; b=IOMA5lUJVDOqj13AzEPpfxZqFUzBxcJg3j1PiI53lm1dLyV2r5ml+8mS7Dz80wlzNHsoG8CToGbGbLMpaZpF3QaszBuTUe3OD8HVCm8WL68rtc/CQ8V+cf1refLoCBZ+blyJsWh6kKVBJXbTZauJlu9yY25perL79ePVhQ/qPzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789577007; c=relaxed/simple;
	bh=pZwRxtFeJmUddv1EbjhyalYwEd/mc+BqblQkRD3Rn4s=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=J1Md6S+xHl/Mp86x2j1DJZct7TEAHBO0NyfEvtyahjMiZkdYgtcOFpJcKPKCarKH+Vef+mPUVvNQwICsXbvVV2LAQ5p4t+FVzcXgM43XLHiFZQ/ESp7/rLm5xTPWI97VD5JK3Whw4igu8Bm04rWetKyZPTfZWhskF0z670xNkUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=fXa4O917; arc=none smtp.client-ip=209.85.210.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fXa4O917"
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-86b3c58d686so11548510b3a.3
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 09:43:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789576996; x=1790181796; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M+S7jpRpnAdrhynDw1U8pmp0kn3XALCUGhwkyOzMF50=;
        b=fXa4O917tTcTmGlAmhkynTtG6PSWL/x0GxAd7K+ql83iU6ILvQLzW8b4KhKsmD2dE9
         5z4KgTi1O9COIczAtJBd6I6Zx2YVnY3W5EkAN+qjL2DQ/0K9wkhjlmYk5oVhimAY0vOr
         uqKjVaL50nMGt6Y0C+f1LScyLVwQb24Gyg2WyTEdOxxVwfn4HDEb9m7y0tmFsmNMLvSK
         zELnaVwraRJNmTrs0ZRUpya0UANVJm3khioukXk4Fim8sOTCpzHSRtR4olDlcAXnnN2p
         +6bMTGX2lb5wFpJDHKfEMJJrJWh0yyCyPQoaZo2EE3g7YLhIYRs+dJHNLkzPbAPElCW/
         mNdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789576996; x=1790181796;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M+S7jpRpnAdrhynDw1U8pmp0kn3XALCUGhwkyOzMF50=;
        b=NYEj8tkGrm4/wKTWm3h7g6xkl9LACAD2kfYS17beN2vSpUHtguA/RNBRICJ3UYYETT
         3GllK0eNeRaGGX9SipkwZmM2wyJYX3rUoAxfxfrHqfnkVUJmei1x21Z42H55DArbtErq
         OR5a+Fy8LCoFRAGQr63ZjQ2JdC9ttuPe+gsytjO2yPBT7DlgOysUOFgR1J6ZFSxm4oN+
         nOjgO8KP+iUjneCWl1QtwG8TuU3pWHGnPqWdIOltfaOdeVatisiLiEuFNx/f/TcbQppn
         fq++lQ9o4zVMM8sWEHhlBIlb3nG7LMOM9VyrN3pwj7m8Mh30FfAdzD/PRK6cSusBcYOg
         E1GQ==
X-Forwarded-Encrypted: i=1; AKwUvBxgoYoAYGQaqI8DsZ15GSKqXyCvtyjYsGcbk7kkXN3qvPyGwmzrh7xDoJorH+ji3l7OsI2L7OYfvyp5lhw=@vger.kernel.org
X-Gm-Message-State: AFuF++kpECzyMjCHx34rfmDTmMjaPsPGGoE2IkWDqARhxFTHsoaOHp0B
	o5FVV0i/CM7oNGDInzkU3XfmXkqOvNA/0jC0tw41CZSoelTtjAwEr5chQGzR3PljXZKc9+10/Ew
	04m5pDw==
X-Received: from pfbna22.prod.google.com ([2002:a05:6a00:3e16:b0:872:e7f8:45d6])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:88e:b0:857:726d:270e
 with SMTP id d2e1a72fcca58-8723e714a0fmr6172938b3a.26.1789576995322; Wed, 16
 Sep 2026 09:43:15 -0700 (PDT)
Date: Wed, 16 Sep 2026 09:43:14 -0700
In-Reply-To: <aqrFjUIubjzjXYV0@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <aqqap3DngKznNrSA@sirena.org.uk> <aqqiAbgDmfQBLPTA@google.com> <aqrFjUIubjzjXYV0@kernel.org>
Message-ID: <aqrHIlx2F9__sLef@google.com>
Subject: Re: linux-next: build failure after merge of the kvm-x86 tree
From: Sean Christopherson <seanjc@google.com>
To: Oliver Upton <oupton@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Fuad Tabba <fuad.tabba@linux.dev>, 
	Marc Zyngier <maz@kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"

On Wed, Sep 16, 2026, Oliver Upton wrote:
> > In case anyone cares, I'm woefully behind on sending "thanks".  These came from
> > the prep series for enabling PPC selftests.
> > 
> > https://lore.kernel.org/all/20260826230511.972824-1-seanjc@google.com
> > 
> > > interacting with commit
> > > 
> > >   6f182db39fb00 (KVM: arm64: selftests: Add ITS table save tests)
> > > 
> > > from the kvm-arm tree.  I have applied the fixup below and can carry as
> > > needed:
> > 
> > Given that this is in "fixes", I assume the new test will land in 7.3?  If so,
> > this is mostly my problem to deal with when sending Paolo the selftests pull
> > (which, FWIW, I'm hoping to do this week so that it can be used as the base for
> > PPC selftests support). 
> 
> Yeah, aim here is to have the selftest go with the fix which I'll send to
> Paolo this week. Sorry for the churn.

LOL, why are you apoligizing?  You added one test, I reworked all of the core
allocator APIs.  :-D
